class Item < ApplicationRecord
  belongs_to :user

  before_save :delete_expired

  def from_time
    created_at
  end

  def to_time
    7-(from_time)
  end

  private

  def delete_expired
    DeleteExpiredItemsJob.perform_later
  end
end
