class Book < ActiveRecord::Base
  attr_accessor :generate_new_slug
  attr_accessor :user_slug

  has_friendly_id :user_slug_or_author_and_title, :use_slug => true

  validates_presence_of :author, :title

  def user_slug_or_author_and_title
    user_slug.blank? ? "#{title} by #{author}" : user_slug
  end

  def new_slug_needed?
    if user_slug.present? || generate_new_slug == "1"
      super
    else
      !slug
    end
  end
end
