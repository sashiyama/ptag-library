# frozen_string_literal: true

class CheckedOutBook < ApplicationRecord
  belongs_to :user
  belongs_to :book

  has_one :returned_book, dependent: :destroy

  validates :user, presence: true
  validates :book, presence: true

  scope :on_loan, -> { where.missing(:returned_book) }
  scope :overdue, -> { on_loan.where('checked_out_books.created_at < ?', 1.week.ago) }
end
