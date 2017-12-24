class PosterUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  storage :file

  def store_dir
    "#{model.created_at.strftime("%Y/%m/%d")}/etkinlik/#{model.id}"
  end

  def default_url(*args)
    "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  end

  version :thumb do
    process resize_to_fill: [100, 100]
    process :optimize
  end

  version :display do
    process resize_to_fit: [400, nil]
    process :optimize
  end

  version :large do
    process resize_to_fit: [1000, nil]
    process :optimize
  end

  # Add a white list of extensions which are allowed to be uploaded.
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    "#{model.name.parameterize}.jpg" if original_filename
  end

  def optimize
    manipulate! do |img|
      img['comment'] = "Omü ÖYAK"
      img.write(current_path){ self.quality = 80 }
      img.write(current_path) { self.interlace = Magick::PlaneInterlace }
      img = yield(img) if block_given?
      img
    end
  end

end
