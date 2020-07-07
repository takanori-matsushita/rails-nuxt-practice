class Micropost < ApplicationRecord
  include Rails.application.routes.url_helpers
  belongs_to :user
  has_one_attached :picture
  attribute :picture_url, :string
  after_initialize :set_picture_url
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate :image_content_type, if: :attached?
  validate :picture_size
  after_initialize :picture_resize, if: :attached?

  private

    def set_picture_url
      self.picture_url = picture.attached? ? url_for(picture) : nil
    end

    def image_content_type
      ext = %w(image/jpg image/jpeg image/gif image/png)
        errors.add(:picture, "extension is forbidden") unless picture.content_type.in?(ext)
    end

    def attached?
      self.picture.attached?
    end

    def picture_size
        errors.add(:picture, "should be less than 5MB") if picture.blob.byte_size > 5.megabytes
    end

    def picture_resize
      self.picture.variant(resize: [200, 200])
    end
end
