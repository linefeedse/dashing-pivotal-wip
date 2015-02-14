require 'pivotal-tracker'
 
config_file = File.dirname(File.expand_path(__FILE__)) + '/../config/pivotal.yml'
config = YAML::load(File.open(config_file))
 
PivotalTracker::Client.token = config['pivotal_api_token']

def sendproject(projid,started_max,finished_max)
  @project = PivotalTracker::Project.find projid
 
  if @project.is_a?(PivotalTracker::Project)
    @iteration = PivotalTracker::Iteration.current(@project)
    puts 'found project '+projid.to_s
 
  # Finished stories in the current iteration
    finished_stories = @iteration.stories.select{|s|s.current_state == "finished"}
    finished_count = finished_stories.length
 
  # Started stories in the current iteration
    started_stories = @iteration.stories.select{|s|s.current_state == "started"}
    started_count = started_stories.length
 
    send_event 'pivotal_'+projid.to_s, {
      started: started_count,
      started_max: started_max,
      finished: finished_count,
      finished_max: finished_max,
      min: 0
    }
  else
    puts 'Not a Pivotal project'
  end
end

SCHEDULER.every '5m', :first_in => 0 do
  config['pivotal_project'].each do |proj|
    sendproject(
      proj['item']['id'],
      proj['item']['started_max'],
      proj['item']['finished_max'])
  end
end
