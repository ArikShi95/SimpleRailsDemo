
Rails.application.routes.draw do

  # 定义根路径
  root 'static_pages#home'

  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'

  # 使得user模型支持rest风格
  get 'sign_up' => 'users#new'
  resources :users

  # 使用session进行登陆状态的记录
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

end