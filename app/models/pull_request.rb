class PullRequest < ActiveRecord::Base
  after_create :generate_permalink

  def to_param
    permalink
  end

  private

  def generate_permalink
    self.permalink = id.to_s(36)
    save
  end
end
