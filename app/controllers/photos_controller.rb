class PhotosController < ApplicationController
  def index
    index = params[:page]? params[:page]:1
    @photos = Photo.page(index).per(20)
  end
end
