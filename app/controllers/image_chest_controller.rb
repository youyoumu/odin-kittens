require 'rest-client'
class ImageChestController < ApplicationController

  def show
    unless params[:post_id].blank?
      post = RestClient.get("https://api.imgchest.com/v1/post/#{params[:post_id]}", { Authorization: "Bearer #{ENV['IMGCHEST_TOKEN']}" })
      @images = []
      JSON.parse(post.body)['data']['images'].each { |file| @images << file['link'] }
    end
    render :show
  end
end
