# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  text       :string           not null
#  poll_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Question < ActiveRecord::Base
  validates :text, :poll_id, presence: true

  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: 'Poll'

  has_many :answer_choices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: 'AnswerChoice'

  has_many :responses,
    through: :answer_choices,
    source: :responses

  def results
    choices = self.answer_choices.includes(:responses)
    response_hash = {}
    choices.each do |c|
      response_hash[c] = c.responses.length
    end
    response_hash
  end

  def results
    Response.find_by_sql(<<-SQL)
        SELECT
          answer_choices.*, COUNT(*)
        FROM
          responses
        JOIN
          answer_choices ON response.answer_choice_id = answer_choice.id
        WHERE
          answer_choice.question_id = self.id
        GROUP BY
          answer_choices
        
      SQL
  end
end
