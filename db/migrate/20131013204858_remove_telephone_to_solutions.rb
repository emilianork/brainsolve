class RemoveTelephoneToSolutions < ActiveRecord::Migration
  def up
    remove_column :solutions, :telephone
    add_column :solutions, :telephone, :string

    remove_column :solutions, :company_telephone
    add_column :solutions, :company_telephone, :string

  end
  def down
    remove_column :solutions, :telephone
    add_column :solutions, :telephone, :integer

    remove_column :solutions, :company_telephone
    add_column :solutions, :company_telephone, :integer
  end
end
