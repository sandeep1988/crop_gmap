class AccountHistoriesController < ApplicationController
  # GET /account_histories
  # GET /account_histories.json
  def index
    @account_history = AccountHistory.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @account_history }
    end
  end

  # GET /account_histories/1
  # GET /account_histories/1.jsons
  def show
    @account_history = AccountHistory.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @account_history }
    end
  end

  # GET /account_histories/new
  # GET /account_histories/new.json
  def new
     @account = Account.find(params[:account_id])
     @account_history = @account.build_account_history
     respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @account_history }
    end
  end

  # GET /account_histories/1/edit
  def edit
    @account_history = AccountHistory.find(params[:id])
  end

  # POST /account_histories
  # POST /account_histories.json
  def create
    @account = Account.find(params[:account_id])
    @account_history = @account.create_account_history(params[:account_history])
    respond_to do |format|
      if @account_history.save
        format.html { redirect_to account_account_history_path(@account,@account_history), notice: 'Account history was successfully created.' }
        format.json { render json: @account_history, status: :created, location: @account_history }
      else
        format.html { render action: "new" }
        format.json { render json: @account_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /account_histories/1
  # PUT /account_histories/1.json
  def update
    @account_history = AccountHistory.find(params[:id])

    respond_to do |format|
      if @account_history.update_attributes(params[:account_history])
        format.html { redirect_to @account_history, notice: 'Account history was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @account_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account_histories/1
  # DELETE /account_histories/1.json
  def destroy
    @account_history = AccountHistory.find(params[:id])
    @account_history.destroy

    respond_to do |format|
      format.html { redirect_to account_histories_url }
      format.json { head :no_content }
    end
  end
end
