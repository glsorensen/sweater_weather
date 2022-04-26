# frozen_string_literal: true

class PictureFacade
  def self.find_forecast(location)
    json = PictureService.get_image(location)
  end
end
