require 'rest-client'
class ImageChestController < ApplicationController

  def create
    post = RestClient.get("https://api.imgchest.com/v1/post/#{params[:post_id]}", { Authorization: "Bearer FODCeqI8gJvUiEaAcAMiJBOfahXMf7L9EzSPguX81a366d75" })
    @images = []
    JSON.parse(post.body)['data']['images'].each { |file| @images << file['link'] }

    @kitten = Kitten.find(params[:kitten_id])
    render 'kittens/show'
  end
end
