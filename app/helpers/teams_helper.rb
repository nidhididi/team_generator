module TeamsHelper

  def generate_teams
    classmates = Student.all
    unassigned_students = []
    # pass each student name into unassigned_students array
    classmates.each do |student|
      unassigned_students.push(student.name)
    end
    teams = []
    @num_teams = (params[:num]).to_i
    # divide total unassigned_students by num_teams and assign to team_size
    team_size = unassigned_students.length / @num_teams
    # keep assigning teams until there is one more than the team size remaining
    total_students = unassigned_students.length
    until teams.length == @num_teams
    # randomly sample from unassigned_students array based on team size and assign to team
    # sampled objects are returned as an array
      teammates = unassigned_students.sample(team_size)
    # push team to teams array
      teams.push(teammates)
    # remove each student now on a team from unassigned students array
      teammates.each do |student|
        unassigned_students.delete(student)
      end
    end
    # distribute remaining students one at a time into teams arrays
    unassigned_students.each_with_index do |student, index|
      teams[index].push(student)
    end
    return teams
  end

end
