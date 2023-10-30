class Image < ApplicationRecord
  belongs_to :ticket
  has_one_attached :file
  validate :validate_image

  private

  def validate_image
    if image.attached?
      if image.blob.byte_size > 5.megabytes
        image.purge
        errors.add(:image, 'size is too big')
      end

      acceptable_types = %w[image/jpeg image/png]
      unless acceptable_types.include?(image.content_type)
        image.purge
        errors.add(:image, 'must be a JPEG or PNG')
      end
    end
  end

end
