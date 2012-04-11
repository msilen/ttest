namespace :lot do
  task :backgroundfin,:id do |t,id|
    puts "processing #{id}"
    sleep(5)
    puts "finished"
  end
end
