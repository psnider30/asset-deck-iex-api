class WelcomeController < ApplicationController

  skip_before_action :authenticate

  def index
    render 'index.html.erb'
  end

end
