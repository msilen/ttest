class Lot < ActiveRecord::Base
  attr_accessible :endtime, :status

  def finalize
    update_attributes(:status =>true)
  end

  after_update :backgroundfin, :if => :status

 def backgroundfin
    system("rake lot:backgroundfin[#{id}]>>back.log &")
 end
end
