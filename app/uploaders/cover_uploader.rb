class CoverUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick
  storage :file

  # Override the directory where uploaded files will be stored.
  def store_dir
    "#{model.created_at.strftime("%Y/%m/%d")}/#{model.id}"
  end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  version :thumb do
    process resize_to_fit: [50, 50]
  end

  version :display do
    process resize_to_fill: [700, 350]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    "#{model.title.parameterize}.jpg" if original_filename
  end

  def optimize
    manipulate! do |img|
      img['comment'] = "Bafra Haber"
      img.write(current_path){ self.quality = 80 }
      img.write(current_path) { self.interlace = Magick::PlaneInterlace }
      img = yield(img) if block_given?
      img
    end
  end

end
