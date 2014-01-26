class PatchDecorator < Draper::Decorator
  delegate_all

  def files
    diff.files
  end

  def file_count
    files.count
  end

  def total_additions
    stats.total_number_of_additions
  end

  def total_deletions
    stats.total_number_of_deletions
  end

  private

  def stats
    diff.stats
  end

  def diff
    @diff ||= GitDiff.from_string(raw)
  end
end