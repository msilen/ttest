namespace :lot do
  task :finalize => :environment do
    loop do
      queued_lots_ids=Lot.where("endtime < ? AND status = ?", Time.now+10.minutes,false).order("endtime DESC").map {|lot|[lot.id,lot.endtime]}
      nextcycletime=Time.now+5.minutes

      puts "lots in queue: #{queued_lots_ids.length}"

      queued_lots_ids.length.times do
        processing_lot=Lot.find(queued_lots_ids.pop[0])
        waittime=(processing_lot.endtime-Time.now)
        waittime=0 if waittime<0
        puts "next lot starts in #{(waittime)}"
        sleep waittime
        processing_lot.finalize
      end
      tts= (nextcycletime-Time.now) #time to sleep before next cycle
      puts "next process starts in #{(tts)}"
      sleep tts if tts > 0
    end
  end
end
