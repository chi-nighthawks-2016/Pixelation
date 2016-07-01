require 'net/http'
require "uri"
require 'JSON'

# post '/upload' do
#   # Check if user uploaded a file
#   if params[:image] && params[:image][:filename]
#     filename = params[:image][:filename]
#     file = params[:image][:tempfile]
#     path = "./public/uploads/#{params[:image][:filename]}"
#     @view_path = "/uploads/#{params[:image][:filename]}"

#     # Write file to disk
#     File.open(path, 'wb') do |f|
#       f.write(file.read)
#     end
#   end

#   erb :show_image
# end

post '/mosaic' do
  @picture_url = params[:picture_url]
  erb :show_image
end

post '/mosaic/pixelate' do
  @picture_url = params[:picture_url]
  uri = URI('https://www.printmosaic.com/api/v2/mosaics')
  response = Net::HTTP.post_form(uri, {"token" => "GrbW4LW2fYuDaQRS7cyY3Td1PUsmYnyV", "path" => @picture_url, "resolution%%" => "25,25", "tile_size" => "10"})
  @mosaic_url = JSON.parse(response.body)["mosaic_url"]
  @mosaic_id = JSON.parse(response.body)["mosaic_id"]

  erb :show_pixelated
end





















