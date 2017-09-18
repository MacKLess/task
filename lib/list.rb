class List
  attr_reader(:name, :id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  def self.all
    returned_lists = DB.exec("SELECT * FROM lists;")
    lists = []
    returned_lists.each do |list|
      name = list.fetch("name")
      id = list.fetch("id").to_i
      lists.push(List.new({:name => name, :id => id}))
    end
    lists
  end

  def save
    result = DB.exec("INSERT INTO lists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  def ==(another_list)
    self.name().==(another_list.name()).&(self.id().==(another_list.id()))
  end

  def tasks
    puts "SELECT * FROM tasks WHERE list_id = #{@id};"
    returned_tasks = DB.exec("SELECT * FROM tasks WHERE list_id = #{@id} ORDER BY due_date;")
    tasks = []
    returned_tasks.each do |task|
      description = task.fetch("description")
      due_date = task.fetch("due_date")[0...10]
      tasks.push(Task.new({:description => description, :list_id => @id, :due_date => due_date}))
    end
    tasks
  end
end
