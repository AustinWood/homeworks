require 'sqlite3'
require_relative 'db_connection'

class User
  attr_accessor :fname, :lname

  def self.all
    data = DBConnection.instance.execute("SELECT * FROM users")
    data.map { |datum| User.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def create
    raise "#{self} already in database" if @id
    DBConnection.instance.execute(<<-SQL, @fname, @lname)
      INSERT INTO
        users (fname, lname)
      VALUES
        (?, ?)
    SQL
    @id = DBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    DBConnection.instance.execute(<<-SQL, @fname, @lname, @id)
      UPDATE
        users
      SET
        fname = ?, lname = ?
      WHERE
        id = ?
    SQL
  end

  def self.find_by_id(id)
    raise "ID must be an integer" unless id.is_a?(Integer)
    arr = DBConnection.instance.execute(<<-SQL, id)
      SELECT *
      FROM users
      WHERE id = ?
    SQL
    User.new(arr.first)
  end

  def self.find_by_name(fname, lname)
    raise "Names must be strings" unless fname.is_a?(String) && lname.is_a?(String)
    arr = DBConnection.instance.execute(<<-SQL, fname, lname)
      SELECT *
      FROM users
      WHERE fname = ?, lname = ?
    SQL
    arr.map { |u| User.new(u) }
  end

  def authored_questions
    Question.find_by_author_id(@id)
  end

  def authored_replies
    Reply.find_by_user_id(@id)
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(@id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(@id)
  end
end
