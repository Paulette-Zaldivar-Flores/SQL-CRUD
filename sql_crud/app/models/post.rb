class Post
  # TODO
  attr_accessor :title, :url, :votes, :id

  def initialize(attributes = {})
    @id = attributes[:id] || attributes["id"]
    @title = attributes[:title] || attributes["title"]
    @url = attributes[:url] || attributes["url"]
    @votes = attributes[:votes] || attributes["votes"] || 0
  end

  def self.all
    DB.results_as_hash = true
    query = %(SELECT * FROM posts)
    results = DB.execute(query)
    posts = []
    if results.any?
      results.each { |post| posts << Post.new(post) }
    else
      []
    end
    posts
  end

  def self.find(id)
    DB.results_as_hash = true
    query = %(SELECT * FROM posts WHERE id = ?)
    post = DB.execute(query, id)
    if post.any?
      Post.new(post.first)
    else
      return nil
    end
  end

  def destroy
    # TODO: destroy the current instance from the database
    DB.execute("DELETE FROM posts WHERE id = #{id}")
  end

  def save
    if @id.nil?
      query = "INSERT INTO posts (title, url, votes) VALUES (?, ?, ?)"
      rows = DB.execute(query, @title, @url, @votes)
      @id = DB.last_insert_row_id

    else
      query = "UPDATE posts SET title == ?, url == ?, votes == ? WHERE id == ?"
      DB.execute(query, @title, @url, @votes, @id)
    end
  end
end
