require 'net/http'
require "uri"
require 'JSON'

# GrbW4LW2fYuDaQRS7cyY3Td1PUsmYnyV


uri = URI('https://www.printmosaic.com/api/v2/mosaics')
response = Net::HTTP.post_form(uri, {"token" => "GrbW4LW2fYuDaQRS7cyY3Td1PUsmYnyV", "path" => "https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAZOAAAAJGE3MWQ1N2JmLTViZTAtNGY4My05NWFkLWU0NzQ5YTUzN2Y5OA.jpg", "resolution%5B%5D" => "25&resolution%5B%5D=25", "tile_size" => "10"})

response.body

p JSON.parse(response.body)["mosaic_url"]
# p response.body.split('\\')
# p response.body.inspect
# p response.body[0]
# p response.body[1]
# p response.body[2]
# p response.body[3]
# p response.body[4]
# p response.body[5]
# p response.body[6]

# p response.body[0..-1]
