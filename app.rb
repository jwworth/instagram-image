require 'sinatra'

get '/' do
  erb :form
end

post '/download' do
  background = params[:file][:tempfile]
  title = params[:title]
  `./image-convert.sh #{background.path} "#{title}"`
  result = File.new('tmp/ready-for-instagram.jpg')

  send_file result.path
end
