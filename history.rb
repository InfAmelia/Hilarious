class History


  def initialize()
    puts "Creating new history of visits"
    @visits = []
  end

  def add_visit(visit)
    @visits.push(visit)
    puts "Added: #{visit}"
  end

  def print_at(index)
    puts @visits[index]
  end

end
