# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
  {user_name:'Austin'},
  {user_name: 'Ryan'}
  ])

polls = Poll.create([
  {title: 'App Academy Poll', author: 1},
  {title: "Food Poll", author: 2}
  ])

questions = Question.create([
  {text: 'Do you like recursion?', poll_id: 1},
  {text: 'Who''s your favorite TA?', poll_id: 1},
  {text: 'Google < Apple ?', poll_id: 1},
  {text: 'Pizza > Burrito ?', poll_id: 2},
  {text: 'Ice cream > cookies ?', poll_id: 2},
  {text: 'Salad <= Soup', poll_id: 2},
  ])

answer_choices = AnswerChoice.create([
  {text: 'Yes', question_id: 1},
  {text: 'No', question_id: 1},
  {text: 'Gage', question_id: 2},
  {text: 'Luke', question_id: 2},
  {text: 'Debra', question_id: 2},
  {text: 'Robert', question_id: 2},
  {text: 'Google', question_id: 3},
  {text: 'Apple', question_id: 3},
  {text: 'Pizza', question_id: 4},
  {text: 'Burrito', question_id: 4},
  {text: 'Ice Cream', question_id: 5},
  {text: 'Cookies', question_id: 5},
  {text: 'Salad', question_id: 6},
  {text: 'Soup', question_id: 6},
  ])

  
