class VoteSweeper < ActionController::Caching::Sweeper
  observe Vote
  
  def after_create(vote)
    sweep_cache
  end
  
  def after_destroy(vote)
    sweep_cache
  end

  def sweep_cache
    cache_dir = ActionController::Base.page_cache_directory
    FileUtils.rm_r(File.join(cache_dir,"votes.html")) rescue Errno::ENOENT
    Rails.logger.info("Cache directory '#{cache_dir}' fully sweeped.")
  end
  
end