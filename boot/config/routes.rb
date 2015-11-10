Rails.application.routes.draw do
  root 'boot#index'
  resources:boot do
    collection do
    end
  end
end
