require 'net/http'
require "uri"
require 'JSON'
require 'nokogiri'
require 'open-uri'

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
  response = Net::HTTP.post_form(uri, {
    "token" => "GrbW4LW2fYuDaQRS7cyY3Td1PUsmYnyV",
    # "path" => "https://pbs.twimg.com/media/CQFEutfWwAAYIXr.jpg",
    "path" => @picture_url,
    'resolution%5B%5D'=>'20&resolution%5B%5D=20',
    "tile_size" => "10"
    })

  @mosaic_url = JSON.parse(response.body)["mosaic_url"]
  @mosaic_id = JSON.parse(response.body)["mosaic_id"]
  p @mosaic_id
  if JSON.parse(response.body)["error"]
    p "there's an error"
  else
    # @page = Nokogiri::HTML(open(@mosaic_url))
    # p @page.css('div.PreviewWidgetStatic').inner_html

    response2 = Net::HTTP.post_form(uri, {
      "token"=> 'GrbW4LW2fYuDaQRS7cyY3Td1PUsmYnyV',
      "images%5B%5D" => "https%3A%2F%2Fs3.amazonaws.com%2Fprintmosaic-assets%2Fapi_tutorial%2Fyellow.jpg&images%5B%5D=https%3A%2F%2Fs3.amazonaws.com%2Fprintmosaic-assets%2Fapi_tutorial%2Forange.jpg&images%5B%5D=https%3A%2F%2Fs3.amazonaws.com%2Fprintmosaic-assets%2Fapi_tutorial%2Ftwo_flowers.jpg' \
 https://www.printmosaic.com/api/v2/mosaics/#{@mosaic_id}"
      })

    # p response.body


    # response = Net::HTTP.post_form(uri, {
    #   "token" => "GrbW4LW2fYuDaQRS7cyY3Td1PUsmYnyV",
    #   "path" => "https://www.printmosaic.com/api/v2/mosaics/#{@mosaic_id}/generate_preview"
    #   })


  end


end


















