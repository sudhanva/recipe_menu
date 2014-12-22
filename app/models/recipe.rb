class Recipe < ActiveRecord::Base
	has_attached_file :image, :styles => { :medium => "400x400",:large => "800x800>"}
  	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
