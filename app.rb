require 'dotenv/load'
require 'open3'
require 'sinatra'
require_relative 'support/helpers.rb'

use Rack::Auth::Basic, "Restricted Area" do |username, password|
  username == ENV.fetch('basic_auth_username') && password == ENV.fetch('basic_auth_password')
end

get '/' do
  erb :form
end

post '/download' do
  background = params[:file][:tempfile]
  title = params[:title]

  output, error, status = Open3.capture3(
    "./image-convert.sh",
    title,
    stdin_data: background.read,
    binmode: true
  )

  if status.success?
    content_type('image/jpeg')
    attachment(generate_title(title))
    output
  else
    throw error
  end
end
