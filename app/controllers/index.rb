get "/" do
  erb :'upload_form'
end

post '/upload' do
  # Check if user uploaded a file
  if params[:image] && params[:image][:filename]
    filename = params[:image][:filename]
    file = params[:image][:tempfile]
    path = "./public/uploads/#{params[:image][:filename]}"
    @view_path = "/uploads/#{params[:image][:filename]}"

    # Write file to disk
    File.open(path, 'wb') do |f|
      f.write(file.read)
    end
  end

  erb :show_image
end



# post '/upload' do
#   p "~~~~~~~~~~~~~"
#   p params
#   # Check if user uploaded a file
#     p request.path
#   if params[:image] && params[:image][:filename]
#     filename = params[:image][:filename]
#     file = params[:image][:tempfile]
#     path = request.path + "/#{params[:image][:filename]}"
#     p path
#     # path = "./public/uploads/#{@filename}"

#     # Write file to disk
#     File.open(path, 'wb') do |f|
#       f.write(file.read)
#     end
#   end
# end
