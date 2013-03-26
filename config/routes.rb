PingMe::Application.routes.draw do
  unauthenticated do
    root :to => "static_pages#homepage"
  end
end
