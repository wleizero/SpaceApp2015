desc 'email notifications'
task 'email_notifications' => :environment do 
  User.all.each do |u|
    u.email_notifications
  end
end