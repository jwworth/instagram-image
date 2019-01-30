def generate_title(title)
  title.downcase.gsub(/\s+/, "_") + "_#{Time.now.to_i}.jpg"
end
