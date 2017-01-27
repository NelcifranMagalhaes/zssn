require 'test_helper'

class SurvivorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

	test "should not save Survivor without preencher" do
		survivor = Survivor.new
		assert_not survivor.save
	end

	test "should not save Survivor without preencher" do
		survivor = Survivor.find(:last)
		assert_not survivor.save
	end	

end
