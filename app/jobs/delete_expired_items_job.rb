class DeleteExpiredItemsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "Hello from delete expired todo items job!!"
    Item.where("created_at <= ?", Time.now - 7.days).destroy_all
  end
end
