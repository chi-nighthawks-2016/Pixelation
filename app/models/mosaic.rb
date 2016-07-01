class Mosaic < ActiveRecord::Base


  def generate_pixelation
    uri = URI('https://www.printmosaic.com/api/v2/mosaics')
    response = Net::HTTP.post_form(uri, {"token" => "GrbW4LW2fYuDaQRS7cyY3Td1PUsmYnyV", "path" => "https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAZOAAAAJGE3MWQ1N2JmLTViZTAtNGY4My05NWFkLWU0NzQ5YTUzN2Y5OA.jpg", "resolution%5B%5D" => "25&resolution%5B%5D=25", "tile_size" => "10"})

  end
end
