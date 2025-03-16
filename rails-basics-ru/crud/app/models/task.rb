# frozen_string_literal: true

class Task < ApplicationRecord
  validates :name, :status, :creator, presence: true
  validates :status, inclusion: { in: %w[new in_progress done] }
  validates :completed, inclusion: { in: [true, false] }
end
