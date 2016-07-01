require 'net/http'
require "uri"
require 'JSON'

# GrbW4LW2fYuDaQRS7cyY3Td1PUsmYnyV is the mosaic key
# Application ID for unsplash: 62ce32f1f0ae3b44e0097028605e9050c3f9c325ba9a9484ec50c5246b76c9fd
# Secret Key for unsplash: 50afbf459d07e279f61f8d97edf390d0fd839f35dd9e052af7974bb52bd93232
# Authorization code for unsplash: 21029ed3e3a1a2660aaba4c5edd1a81b4204e30bcb9f7b010a76865d7679fa2d

# https://pbs.twimg.com/media/CQFEutfWwAAYIXr.jpg: use this url

uri = URI('https://www.printmosaic.com/api/v2/mosaics')
response = Net::HTTP.post_form(uri, {"token" => "GrbW4LW2fYuDaQRS7cyY3Td1PUsmYnyV", "path" => "https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAZOAAAAJGE3MWQ1N2JmLTViZTAtNGY4My05NWFkLWU0NzQ5YTUzN2Y5OA.jpg", "resolution%5B%5D" => "25&resolution%5B%5D=25", "tile_size" => "10"})

response.body

p JSON.parse(response.body)["mosaic_url"]

