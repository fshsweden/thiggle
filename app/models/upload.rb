class Upload < ActiveRecord::Base
  attr_accessible :upload, :post_id
  belongs_to :post
  has_attached_file :upload

  include Rails.application.routes.url_helpers
  
  validates_attachment_content_type :upload, :content_type => /image/

  def to_jq_upload
    {
      "name" => read_attribute(:upload_file_name),
      "size" => read_attribute(:upload_file_size),
      "url" => upload.url(:original),
      "delete_url" => upload_path(self),
      "delete_type" => "DELETE" 
    }
  end

end