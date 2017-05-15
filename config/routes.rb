
Rails.application.routes.draw do
  get 'users/new'

  # 定义根路径
  root 'static_pages#home'

  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'

end
