class Cook < ApplicationRecord
    mount_uploader :image, ImageUploader
    has_many :cook_tag_relations, dependent: :destroy 
    has_many :tags, through: :cook_tag_relations, dependent: :destroy 
end
