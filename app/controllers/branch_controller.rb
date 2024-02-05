class BranchController < ApplicationController
  def index
    @branches = Branch.all
    @branch   = Branch.new(name: "")
    @status   = params[:status]
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

  def set_active
    @branch = Branch.find(params[:name])
    session[:active_branch] = @branch.name

    redirect_to branches_path
  end

  def merge
    base_branch_name = session[:active_branch]
    @base_branch  = Branch.find(base_branch_name)
    @merge_branch = Branch.find(params[:name])
    @base_branch.merge(@merge_branch)

    redirect_to branches_path + "/Merged " + @merge_branch.name + " into " + base_branch_name, allow_other_host: true
  end
    
  private
    def branch_params
      params.require(:branch).permit(:name)
    end
end
