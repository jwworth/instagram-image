# frozen_string_literal: true

require 'dotenv/load'
require 'open3'
require 'sinatra'
require_relative 'support/helpers.rb'

if credentials = ENV['BASIC_AUTH']
  use Rack::Auth::Basic, 'Restricted Area' do |entered_username, entered_password|
    username, password = credentials.split(':', 2)
    username == entered_username && password == entered_password
  end
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
