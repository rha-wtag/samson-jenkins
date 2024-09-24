# frozen_string_literal: true

Samson::Application.routes.draw do
  namespace :datadog do
    get "/monitors", to: "monitors#index", as: :monitors
  end
end
