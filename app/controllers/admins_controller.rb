class AdminsController < ApplicationController

  def shelter_index
    @shelters = Shelter.order_by_alphabet
    @shelters_list = Shelter.shelters_with_pending_applications
  end

end