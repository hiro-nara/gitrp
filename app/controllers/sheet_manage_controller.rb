class SheetManageController < ApplicationController

  def create_all

    @allstaff = Staff.all
    @season = Season.find(2)

    @allstaff.each do |stf|
      if stf[:position] == "一般" || stf[:position] =="分室長"
        primary_evaluator = @allstaff.where(
          "position = ? and dep_bunshitsu = ? ",
          "分室長", stf.dep_bunshitsu
          ).first

        secondary_evaluator = @allstaff.where(
          "position = ? and dep_2nd = ? ",
          "部長", stf.dep_2nd
          ).first

        if stf.position == "一般"
          @sheet_type = "定性"
        else
          @sheet_type = "定量"
        end

        sheet_create(stf,
          primary_evaluator.id,
          secondary_evaluator.id,)

      end
    end
    redirect_to '/login/index'

  end

  def sheet_create(stf,fid,sid)
    objs = []
    stobj = PoSheet.create!(
      status: "new",
      season_index: @season.season_index,
      sheet_type:  @sheet_type,
      year:      @season.year,
      period:    @season.period,
      tokyu:     stf[:tokyu],
      grade:     stf[:grade],
      #grade_c: 0,
      grade_reason: "",
      position:  stf[:position],
      department: stf[:department],
      #department_c: "",
      #notices: "",
      #sales_plan:    "",
      #profit_plan:   "",
      #sales_result:  "",
      #profit_result: "",
      #total_point: "",
      #zone_primary: "",
      #zone_secondary: "",
      author_id:         stf[:id],
      primary_evaluator_id:   fid,
      secondary_evaluator_id: sid,
      #objective_id
    )
    title_arr =
     ["リストから選択",
      "リストから選択",
      "徹底的に差別化を追及せよ",
      "","","","","",]
    8.times do |i|

      objs[i] = Objective.create!(
        titel: title_arr[i],
        content: "(目標" + i.to_s + ")",
        difficulty: "M",
        weight: "",
        consequence: "",
        consequence_evaluator: "",
        self_evaluation: "",
        primary_evaluation: "",
        secondary_evaluation: "",
        point: "",
        po_sheet_id:  stobj.id,
      )
    end

  end

  def haihu
    @konki_sheet = PoSheet.where(
      'season_index == ? and status == ?',
      Season.find(2).season_index , "new"
      ).select("author_id,status,id")

    @konki_sheet.update_all("status = '目標作成中'")
    #@konki_sheet.save
    redirect_to '/login/index'
  end

  def del
    Objective.delete_all
    PoSheet.delete_all
    #objst = PoSheet.all
    #objst.each { |i| i.destroy }

    redirect_to '/login/index'
  end



end
