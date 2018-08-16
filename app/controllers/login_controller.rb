class LoginController < ApplicationController

before_action :authenticate_account!, only: :index

  def index
    @account = current_account
    #@user = Staff.where( 'account_id == ?', current_account.id).first
    @user = Staff.find_by(:account_id => current_account.id)
    @season = Season.all

    @zenki_sheet = PoSheet.where('season_index == ?', @season.find(1).season_index).select("author_id,status,id")
    @konki_sheet = PoSheet.where('season_index == ?', @season.find(2).season_index).select("author_id,status,id")
    #pluckで配列にする場合
    #@zenki_sheet = PoSheet.where('season_index == ?',  @season.find(1).season_index).pluck(:author_id,:status,:id)
    #@konki_sheet = PoSheet.where('season_index == ?',  @season.find(2).season_index).pluck(:author_id,:status,:id)

    if @user.position == "人事" then
      redirect_to("/login/index_hr")
    elsif @user.position == "社長" then
      redirect_to("/login/index_ceo")
    end

  end

  def index_hr
    #人事
    @user  = Staff.where( 'account_id = ?', current_account.id).first
    @season = Season.all
    #pluckで配列にする場合
    #@zenki_sheet = PoSheet.where('season_index == ?', @season.find(1).season_index).pluck(:author_id,:status,:id)
    #@konki_sheet = PoSheet.where('season_index == ?', @season.find(2).season_index).pluck(:author_id,:status,:id)
    @zenki_sheet = PoSheet.where('season_index == ?', @season.find(1).season_index).select("author_id,status,id")
    @konki_sheet = PoSheet.where('season_index == ?', @season.find(2).season_index).select("author_id,status,id")


    @staff = Staff.where('position = ? OR position = ? OR position = ?', "一般", "分室長", "部長").order("dep_3rd","dep_bunshitsu")

    if @user.position != "人事" then
      redirect_to("/accounts/sign_in") end

  end

  def index_ceo
    @user  = Staff.where( 'account_id == ?', current_account.id).first
    @season = Season.all
    @zenki_sheet = PoSheet.where('season_index == ?',  @season.find(1).season_index)
    @konki_sheet = PoSheet.where('season_index == ?',  @season.find(2).season_index)

    if @user.position != "社長" then
      redirect_to("/accounts/sign_in")
    end
  end

  def chg_nenki
    int_to_ki = {1 => "上", 6 => "下"}
    @zenki = Season.find(1)
    @konki = Season.find(2)

    @konki.year = params[:nen]
    @konki.period = params[:ki]
    @konki.nen_ki = params[:nen].to_s + "年 " + params[:ki] + "期"

    if params[:ki] == "上"
      @konki.season_index = params[:nen].to_i * 10 + 1
    elsif params[:ki] == "下"
      @konki.season_index = params[:nen].to_i * 10 + 6
    end

    @konki.save
    @zenki.season_index = @konki.season_index.to_i - 5
    @zenki.year = @zenki.season_index.to_s[0..3]

    @zenki.period = int_to_ki[( @zenki.season_index.to_i % 10 )] #
    @zenki.nen_ki = @zenki.year.to_s + "年 " + @zenki.period + "期"
    @zenki.save
    redirect_to("/login/index_hr")
  end

  def stafflist
    @staff = Staff.all
    @accc = Account.all

  end
end

def exe
  tmparr = [
    "kubota_mao@em","020001","窪田 麻緒","","","","","人事"
  ]

  new_account = Account.create!(
    email: tmparr [0],
    password: "@@@@"
  )
  new_account.save!

  new_staff = Staff.create(
    staff_no:        tmparr[1],
    name:            tmparr[2],
    department:     "",
    dep_1st:         tmparr[3],
    dep_2nd:         tmparr[4],
    dep_3rd:         tmparr[5],
    dep_bunshitsu:   tmparr[6],
    position:        tmparr[7],
    account_id: new_account.id
  )
  new_staff.save!
  redirect_to "login/index"

end
