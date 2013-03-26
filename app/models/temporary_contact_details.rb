require "digest/md5"

class TemporaryContactDetails < ActiveRecord::Base
  # associations
  belongs_to :user
  
  # validation
  validates :email, :slug, :presence => true, :uniqueness => true
  
  # callbacks
  before_validation :build_slug_and_email
  
  def self.find_by_email(email)
    record = where(:email => email).first
    unless record
      raise ActiveRecord::RecordNotFound, "Could not find contact details"
    end
    record
  end
  
  private
  def build_slug_and_email
    self.slug = Digest::MD5.hexdigest(Time.now.to_s)[0..6]
    self.email = "#{slug}@ping.me"
  end
end
