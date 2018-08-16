class PoSheetsController < ApplicationController
  #before_action :authenticate_account!
  layout 'aj'

  def index
    @data = PoSheet.all
    @dataobj = Objective.all
  end

  def show
    @sheet = PoSheet.find(params[:id])
    params[:editmode] == :edit.to_s ?  @mode = :edit : @mode = :show
  end

  def del
    objst = PoSheet.all
    objst.each { |i| i.destroy }

    objs = Objective.all
    objs.each { |i| i.destroy }

    redirect_to '/po_sheets/index'
  end

  def sheets_all
  end

  def edit

    @sheet = PoSheet.find(params[:id])
    @mode = "edit"
    redirect_to '/po_sheets/show/' + params[:id] + '/edit'
  end

  def save
    if request.patch? then
      @sheet = PoSheet.find(params[:id])
      @sheet.update!(sheet_params)
    end
    redirect_to '/po_sheets/show/' + params[:id]
  end

  private
  def sheet_params
    params.require(:po_sheet).permit(
      :status,
      :season_index,
      :sheet_type,
      :year,
      :period,
      :tokyu,
      :grade,
      :grade_c,
      :grade_reason,
      :position,
      :department,
      :department_c,
      :notices,
      :sales_plan,
      :profit_plan,
      :sales_result,
      :profit_result,
      :total_point,
      :zone_primary,
      :zone_secondary,
      :author_id,
      :primary_evaluator_id,
      :secondary_evaluator_id,
      :objective_id,
      objectives_attributes: [
        :id,
        :titel,
        :content,
        :difficulty,
        :weight,
        :consequence,
        :consequence_evaluator,
        :self_evaluation,
        :primary_evaluation,
        :secondary_evaluation,
        :point,
        :po_sheet_id,
      ]
    )

  end
end
