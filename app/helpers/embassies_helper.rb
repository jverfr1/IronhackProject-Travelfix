module EmbassiesHelper
  def check_contact_data(item)
    html = "<li class='collection-item'><b>#{format_key(item)}:</b> #{format_value(item)}</li>"
    html.html_safe if format_key(item) != "Email"
  end
  def format_key(item)
    item.keys.join("")
  end
  def format_value(item)
    item.values.join("")
  end
  def get_website(embassy)
    embassy.each do |item|
      url = format_value(item) if format_key(item) == "Website"
    end
  end
end
