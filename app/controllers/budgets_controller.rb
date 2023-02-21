class BudgetsController < ApplicationController
  def index
    @budgets = Budget.all.includes([:user]).where(user_id: current_user.id).order(:name)
  end

  def show
    @budget = Budget.find(params[:id])
  end

  def new
    @groups = Group.where(user_id: current_user.id)
    @budget = Budget.new
  end

  def create
    @user = current_user
    @budget = @user.budgets.new(budget_params)
    group_ids = params[:groups]

    if @budget.save

      # implement logic for creating the group-buget record for all the groups selected and the budget created
      create_gb(group_ids, @budget)

      redirect_to user_group_path(@user.id, group_ids[0])
      flash[:notice] = 'Budget created successfully'

    else
      render 'new'
    end
  end

  private

  def budget_params
    params.permit(:name, :amount, :groups)
  end

  def create_gb(group_ids, budget)
    group_ids.each do |group_id|
      GroupBudget.create(group_id:, budget_id: budget.id)
    end
  end
end
