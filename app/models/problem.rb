class Problem < ActiveRecord::Base

  has_many :solutions, :dependent => :destroy
  belongs_to :areas_of_knowledge
  belongs_to :user

	attr_accessible :title, :contact, :description, :telephone, :user_id, :areas_of_knowledge_id
  
  	validates :title, presence: true
  	validates :telephone, format: {with: /(\A(((\d{8})|((\d{2}-){3}\d{2})){1}\s*)\z)|\A\z/, message: "Formato inválido debe ser un numero telefonico"}
  	validates :contact, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, message: "Formato inválido se necesita un correo"},        presence: true
  	validates :description, presence: true

  	def owner(user)
  		if user.nil?
  			return false
  		end
  		user_id == user.id
  	end

  def self.search(search)
    if search
      search = nil if search.size == 0  
    end
    if search
      string_search = ""
      regexs = construct_regex(search)
      if Rails.env.to_s == "production" then
        simbol = "~"
      else
        simbol = "REGEXP"
      end
        
        string_search += "title #{simbol} \'#{regexs}\' OR description #{simbol} \'#{regexs}\' " + 
                        "OR contact #{simbol} \'#{regexs}\' OR telephone #{simbol} \'#{regexs}\' "

        areas_of_knowledge = AreasOfKnowledge.where("name #{simbol} ? ", regexs)

        areas_of_knowledge.each do |area|
            string_search += "OR areas_of_knowledge_id = \'#{area.id}\' "
        end

        users = User.where("nickname #{simbol} ? ", regexs)
        users += User.where("email #{simbol} ? ", regexs)

        users.uniq!

        users.each do |user|
          string_search += "OR user_id = \'#{user.id}\' "
        end

      Problem.where(string_search)
    else
      scoped
    end
  end

  def self.construct_regex(text)
    regex = "("
    text.split.each do |word|
      regex += "("
      word.chars do |char|
        regex += "("
        if /[aeiouáéíóúAEIOUÁÉÍÓÚ]/ =~ char then
          accent_char = {'a' => 'á','e' => 'é','i' => 'í','o' => 'ó', 'u' => 'ú'}[char.parameterize]
            regex += "#{accent_char.parameterize}|#{accent_char.parameterize.upcase}"+
                     "|#{accent_char}|#{UnicodeUtils.upcase(accent_char)}"
        else
          regex += "#{char.downcase}|#{char.upcase}"
        end
        
        regex += ")"
      end
      regex += ")|"
    end
    regex = regex[0...regex.size-1] + ")+"

    text.split.each do |word|
      regex += "("
      word.chars do |char|
        regex += "("
        if /[aeiouáéíóúAEIOUÁÉÍÓÚ]/ =~ char then
          accent_char = {'a' => 'á','e' => 'é','i' => 'í','o' => 'ó', 'u' => 'ú'}[char.parameterize]
            regex += "#{accent_char.parameterize}|#{accent_char.parameterize.upcase}"+
                     "|#{accent_char}|#{UnicodeUtils.upcase(accent_char)}"
        else
          regex += "#{char.downcase}|#{char.upcase}"
        end
        regex += ")"
      end
      regex += ")*"
    end
    return regex
  end

end
