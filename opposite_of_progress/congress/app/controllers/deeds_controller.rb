# Deeds controller
class DeedsController < ApplicationController
  before_action :set_deed, only: [:show]

  def index
    @results = Deed.all_sorted(params[:page])
  end

  def show
    @legislator = @deed.legislator
    @bill = @deed.bill
    @related_deeds = Deed.all_related(@deed)
  end

  private

  def set_deed
    @deed = Deed.find(params[:id])
  end
end
