class StaticPagesController < ApplicationController
  def home
  end

  def network_test
    rand(1000..10000).times do |i|
      @result = i + rand(1..10)
    end
    render json: @result
  end
end
