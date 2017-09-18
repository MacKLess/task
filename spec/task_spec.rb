require('spec_helper')

describe(Task) do

  describe('.all') do
    it('it is empty at first') do
      expect(Task.all()).to(eq([]))
    end
  end

  describe Task do
    describe('#save') do
      it('adds a task to the array of saved tasks') do
        test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2017-10-01'})
        test_task.save()
        expect(Task.all()).to(eq([test_task]))
      end
    end
  end

  describe('#description') do
    it('lets you read the description out') do
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2017-10-01'})
      expect(test_task.description()).to(eq("learn SQL"))
    end
  end

  describe('#list_id') do
    it('lets you read the list ID out') do
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2017-10-01'})
      expect(test_task.list_id()).to(eq(1))
    end
  end

  describe('#due_date') do
    it "lets you read out the task's due date" do
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2017-10-01'})
      expect(test_task.due_date).to(eq('2017-10-01'))
    end
  end

  describe('#==') do
    it('is the same task if it has the same description, list ID, and due date') do
      task1 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2017-10-01'})
      task2 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2017-10-01'})
      expect(task1).to(eq(task2))
    end
  end
end
