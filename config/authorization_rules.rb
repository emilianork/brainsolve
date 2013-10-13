authorization do
  role :problematic do
    has_permission_on [:problems], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on [:solutions], :to => [:show]
  end
  
  role :creative do
    has_permission_on [:problems], :to => [:index, :show]
    has_permission_on [:solutions], :to => [:show, :new, :create, :edit, :update, :destroy]
  end
  
  role :guest do
    has_permission_on [:problems], :to => [:index,:show]
    has_permission_on [:solutions], :to => [:show]
  end
end