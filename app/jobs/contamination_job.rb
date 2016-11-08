class ContaminationJob < ApplicationJob
  self.queue_adapter = :resque
 	rescue_from(ErrorLoadingSite) do
  retry_job wait: 5.minutes, queue: :low_priority 
  ContaminationJob.set(wait: 30.seconds).perform_later(guest)

  def perform()
    @surv = Survivor.all
	   @cont =0

    @surv.each do |s|
    	if s.infected
    		cont +1
    	end
   	end 	

   	if cont >=3
   		@surv.each do |s|
   			s.update(infected: true)

   		end 	
   	end

  end
end
