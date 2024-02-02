class BranchController < ApplicationController
  def index
    @branches = Branch.all
    @branch   = Branch.new(name: "")
  end

  def create
    @branch = Branch.new(branch_params)

    if @branch.save
      redirect_to index
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @branch = Branch.find(params[:name])
    @branch.destroy

    redirect_to branches_path
  end

  private
    def branch_params
      params.require(:branch).permit(:name)
    end
end