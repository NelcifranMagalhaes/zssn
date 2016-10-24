module SurvivorsHelper
end

class Publication < ActiveRecord::Base
 belongs_to :paper 
 belongs_to :author 
 belongs_to :institute 
 accepts_nested_attributes_for :institute, :reject_if => proc { |p| p["name"].blank? } 
 accepts_nested_attributes_for :author, :reject_if => proc { |p| p["name"].blank? } 

 def autosave_associated_records_for_institute
 	if institute
 	  if new_institute = Institute.find_by_name(institute.name) 

 	  	unless 
 	  		self.institute.state == new_institute.state 
 	  		new_institute.state = self.institute.state
 	  		new_institute.save! 
 	  	end 
 	  		 self.institute = new_institute else 
 	  		 self.institute.save! 
 	  		 self.institute = Institute.find_by_name(institute.name) 
 	  	end 
 	  	end 
 	  	end 

 def autosave_associated_records_for_author
 	if author 
 	  if new_author = Author.find_by_name(author.name) 
 	  	self.author = new_author else 
 	  	self.author.save! 
 	  	self.author = Author.find_by_name(author.name) 

 	  end
 	  	end
 	  	end 
end