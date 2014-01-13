class PullRequestDecorator < Draper::Decorator
  delegate_all

  def diff
    @diff ||= GitDiff.from_string(raw_diff)
  end

  def file_count
    diff.files.count
  end

  def total_additions
    diff.stats.total_number_of_additions
  end

  def total_deletions
    diff.stats.total_number_of_deletions
  end
end