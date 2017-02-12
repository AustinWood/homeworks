# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  user_id          :integer          not null
#  answer_choice_id :integer          not null
#  created_at       :datetime
#  updated_at       :datetime
#

class Response < ActiveRecord::Base
  validate :no_dup_responses, :no_author_answer
  validates :user_id, :answer_choice_id, presence: true

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: 'AnswerChoice'

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'

  has_one :question,
    through: :answer_choice,
    source: :question

  def sibling_responses
    question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    sibling_responses.any? { |r| r.user_id == self.user_id }
  end

  def no_dup_responses
    if respondent_already_answered?
      self.errors[:user_id] << "can't respond twice"
    end
  end

  def respondent_is_author?
    self.user_id == question.poll.author
  end

  def no_author_answer
    if respondent_is_author?
      self.errors[:user_id] << "can't respond to their own poll"
    end
  end
end
