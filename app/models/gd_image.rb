#require 'gd2-ffij'
require 'base64'

class GdImage

  
  def save( data, file )
    #@image = GD2::Image.load( data )  
    File.open( File.join(Rails.root, 'public', file ), 'wb') do|f|
      f.write(Base64.decode64(data))
    end
  end

  def save2( file )
#    @image.export( File.join( Rails.root, 'public', 'uploaded.png' ) )
    #dataURL.replace(/^data:image\/(png|jpg);base64,/, "") ;
  end

end


