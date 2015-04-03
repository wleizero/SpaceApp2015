class VisitorsController < ApplicationController

  def new
  	# Homepage Visitor
    # @forests = Forest.all
    @projects = Leaf.by_followers.roots.limit(25)
    
    possible_tasks = []

    @projects.each do |p|
      possible_tasks += p.children.plusminus_tally.limit(2)
    end

    @tasks = possible_tasks[0..7]
  end

end
