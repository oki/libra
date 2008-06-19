# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def shorten_name(name, len=nil)
    out = ''
    max_length = 60
    max_length = len if !len.nil?

    name.split.each { |word|

      if (out.length + word.length + 3) > max_length
        out += '...'
        break
      else
        out += word + ' '
      end
    }
    out.chomp    
    out.sub(/\ \.\.\./, ' ...')
  end

end
