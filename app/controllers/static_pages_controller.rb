class StaticPagesController < ApplicationController
  def home
    rand(1000..10000).times do |i|
      @result = i + rand(1..10)
    end

    respond_to do |format|
      format.html
      format.json { render :json => @result }
    end
  end

  def network_test
    rand(1000..10000).times do |i|
      @books = i + rand(1..10)
    end

    #render json: @books
    #respond_with @books
    respond_to do |format|
      format.html
      format.json { render :json => @books }
    end
  end
end
