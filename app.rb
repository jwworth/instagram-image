require 'open3'
require 'sinatra'

get '/' do
  erb :form
end

post '/download' do
  background = params[:file][:tempfile]
  title = params[:title]

  output, _error, status = Open3.capture3(
    "./image-convert.sh",
    title,
    stdin_data: background.read,
    binmode: true
  )

  if status.success?
    content_type('image/jpeg')
    attachment(generate_title(title))
    output
  end
end

private

def generate_title(title)
  title.downcase.gsub(/\s+/, "_") + "_#{Time.now.to_i}.jpg"
end
