Rails.application.routes.draw do
  post  'sheet_manage/create_all'
  patch 'sheet_manage/create_all'
  get   'sheet_manage/create_all'
  post  'sheet_manage/haihu'
  post  'sheet_manage/del'
#   get 'po_sheets/create'
#   get   'ajtest', to: 'po_sheets#ajtest'

  get   'po_sheets/show/:id/:editmode', to: 'po_sheets#show'
#  post  'po_sheets/show/:id/:editmode', to: 'po_sheets#show'
  patch 'po_sheets/show/:id/:editmode', to: 'po_sheets#save'
  get   'po_sheets/show/:id', to: 'po_sheets#show'
  post  'po_sheets/show/:id', to: 'po_sheets#show'
  patch 'po_sheets/show/:id', to: 'po_sheets#save'

  get  'po_sheets/save'
  post 'po_sheets/save'

  get 'po_sheets/index'
  get 'po_sheets', to: 'po_sheets#index'

  get 'po_sheets/sheets_all'

  resources :staffs
  devise_for :accounts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'login/chg_nenki'
  get  'login/index_hr'

  get  'login/index'
  post 'login/index'
  get 'login/stafflist'
  get 'login', to: 'login#index'
  root :to => 'login#index'
end
