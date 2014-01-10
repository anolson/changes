class PullRequestDecorator < Draper::Decorator
  delegate_all

  def diff_files
    @diff_files ||= GitDiff.from_string(diff)
  end
end