require 'sqlite3'
require_relative 'db_connection'

class QuestionLike
  attr_accessor :question_id, :user_id

  def self.all
    data = DBConnection.instance.execute("SELECT * FROM question_likes")
    data.map { |datum| QuestionLike.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end

  def create
    raise "#{self} already in database" if @id
    DBConnection.instance.execute(<<-SQL, @question_id, @user_id)
      INSERT INTO
        question_likes (question_id, user_id)
      VALUES
        (?, ?)
    SQL
    @id = DBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    DBConnection.instance.execute(<<-SQL, @question_id, @user_id, @id)
      UPDATE
        question_likes
      SET
        question_id = ?, user_id = ?
      WHERE
        id = ?
    SQL
  end

  def self.find_by_id(id)
    raise "ID must be an integer" unless id.is_a?(Integer)
    arr = DBConnection.instance.execute(<<-SQL, id)
      SELECT *
      FROM question_likes
      WHERE id = ?
    SQL
    QuestionLike.new(arr.first)
  end

  def self.likers_for_question_id(question_id)
    arr = DBConnection.instance.execute(<<-SQL, question_id)
      SELECT users.*
      FROM users
      JOIN question_likes ON users.id = question_likes.user_id
      WHERE question_id = ?
    SQL
    arr.map { |hash| User.new(hash) }
  end

  def self.num_likes_for_question_id(question_id)
    DBConnection.instance.execute(<<-SQL, question_id)
      SELECT COUNT(*) AS question_like_count
      FROM users
      JOIN question_likes ON users.id = question_likes.user_id
      WHERE question_id = ?
    SQL
  end

  def self.liked_questions_for_user_id(user_id)
    arr = DBConnection.instance.execute(<<-SQL, user_id)
      SELECT questions.*
      FROM questions
      JOIN question_like ON questions.id = question_like.question_id
      WHERE user_id = ?
    SQL
    arr.map { |hash| Question.new(hash) }
  end

  def most_liked_questions(n)
    arr = DBConnection.instance.execute(<<-SQL, n)
      SELECT questions.*
      FROM questions
      JOIN question_likes ON questions.id = question_likes.question_id
      GROUP BY questions.id
      ORDER BY COUNT(*) DESC
      LIMIT ?
    SQL
    arr.map { |hash| Question.new(hash) }
  end
end
