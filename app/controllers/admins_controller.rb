class AdminsController < ApplicationController

  def shelter_index
    @shelters = Shelter.order_by_alphabet
  end

end