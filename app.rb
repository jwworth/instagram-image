require 'open3'
require 'sinatra'

get '/' do
  erb :form
end

post '/download' do
  background = params[:file][:tempfile]
  output, _error, status = Open3.capture3(
    "./image-convert.sh",
    params[:title],
    stdin_data: background.read,
    binmode: true
  )

  if status.success?
    content_type('image/jpeg')
    attachment('test.jpg')
    output
  end
end
