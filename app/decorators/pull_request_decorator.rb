class PullRequestDecorator < Draper::Decorator
  delegate_all

  def diff_files
    @diff_files ||= GitDiff.from_string(diff)
  end

  def total_additions
    diff_files.map(&:total_additions).inject(:+)
  end

  def total_deletions
    diff_files.map(&:total_additions).inject(:+)
  end
end