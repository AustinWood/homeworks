require 'sqlite3'
require_relative 'db_connection'

class Reply
  attr_accessor :question_id, :parent_reply_id, :author_id, :body

  def self.all
    data = DBConnection.instance.execute("SELECT * FROM replies")
    data.map { |datum| Reply.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @parent_reply_id = options['parent_reply_id']
    @author_id = options['author_id']
    @body = options['body']
  end

  def create
    raise "#{self} already in database" if @id
    DBConnection.instance.execute(<<-SQL, @question_id, @parent_reply_id, @author_id, @body)
      INSERT INTO
        replies (question_id, parent_reply_id, author_id, body)
      VALUES
        (?, ?, ?, ?)
    SQL
    @id = DBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    DBConnection.instance.execute(<<-SQL, @question_id, @parent_reply_id, @author_id, @body, @id)
      UPDATE
        replies
      SET
        question_id = ?, parent_reply_id = ?, author_id = ?, body = ?
      WHERE
        id = ?
    SQL
  end

  def self.find_by_id(id)
    raise "ID must be an integer" unless id.is_a?(Integer)
    arr = DBConnection.instance.execute(<<-SQL, id)
      SELECT *
      FROM replies
      WHERE id = ?
    SQL
    Reply.new(arr.first)
  end

  def self.find_by_user_id(author_id)
    raise "ID must be an integer" unless author_id.is_a?(Integer)
    arr = DBConnection.instance.execute(<<-SQL, author_id)
      SELECT *
      FROM replies
      WHERE author_id = ?
    SQL
    arr.map { |q| Reply.new(q) }
  end

  def self.find_by_question_id(question_id)
    raise "ID must be an integer" unless question_id.is_a?(Integer)
    arr = DBConnection.instance.execute(<<-SQL, question_id)
      SELECT *
      FROM replies
      WHERE question_id = ?
    SQL
    arr.map { |q| Reply.new(q) }
  end

  def author
    User.find_by_id(author_id)
  end

  def question
    Question.find_by_id(question_id)
  end

  def parent_reply
    return nil unless parent_reply_id
    Reply.find_by_id(parent_reply_id)
  end

  def child_replies
    Reply.find_by_parent_id(@id)
  end

  def self.find_by_parent_id(parent_id)
    raise "ID must be an integer" unless author_id.is_a?(Integer)
    arr = DBConnection.instance.execute(<<-SQL, parent_id)
      SELECT *
      FROM replies
      WHERE parent_reply_id = ?
    SQL
    arr.map { |q| Reply.new(q) }
  end
end
