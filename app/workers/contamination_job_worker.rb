class ContaminationJobWorker
  include Sidekiq::Worker

  def perform
    puts "Beer, Beer, Beer on Rails..."
  end

end