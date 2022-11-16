class PostsView
  def list(posts)
    posts.each do |post|
      puts "ID: #{post.id} NAME: #{post.title} URL: #{post.url} VOTES: #{post.votes}"
    end
  end

  def add_to_db
    puts 'Please give us the name of the post'
    print '> '
    answer_one = gets.chomp
    puts 'Please give us the URL of the post'
    print '> '
    answer_two = gets.chomp
    { title: answer_one, url: answer_two }
  end

  def ask_for(something)
    if something.start_with?(/[aeio]/)
      puts "Give me an #{something} "
    else
      puts "Give me a #{something} "
    end
    gets.chomp
  end

  def destroy_from_db
    puts "Here are our available posts"
    puts "Which post would you like to delete?"
    answer_four = gets.chomp
    { id: answer_four }
  end

  def upvote
    puts "Which post you want to vote for?"
    answer_five = gets.chomp
    { id: answer_five }
  end
end
