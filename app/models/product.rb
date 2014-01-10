class Product < ActiveRecord::Base
  attr_accessible :avatar
 #has_attached_file :avatar, :styles  => { :small => "100x100#", :large => "500x500>" }  
  attr_accessible :name, :user_id, :price
belongs_to :patient
has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" } ,:processors => [:cropper],:default_url => "/images/:style/missing.png"
#has_attached_file :avatar, :styles => { :small => "100x100#", :large => "500x500>" }, :processors => [:cropper]
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :reprocess_avatar, :if => :cropping?

def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end

  def avatar_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(avatar.path(style))
  end

 private
  
  def reprocess_avatar
    avatar.reprocess!
  end
end
