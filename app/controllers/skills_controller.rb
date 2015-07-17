class SkillsController < ApplicationController
	def index
		@skills = Skill.all
	end

	def show
		@skill = Skill.find(params[:id])
	end	
	
	def new
		@skill = Skill.new	
	end
	
	def create
		@skill = Skill.new(skill_params)	
		if @skill.save
			flash[:notice] = 'Skill has been added, rockstar status = achieved.'
			resirect_to root_path
		else
			render :new
		end
	end	

	def update 
		@skill = Skill.find(params[:id])
		if@skill.update(skill_params)
			flash[:notice] = "Skill updated!"
			redirect_to skill_path(@skill)
		else
			render :edit
		end
	end
		
	def destroy
		@skill = Skill.find(params[:id])
		@skill.destroy
		flash[:notice] = "Skill = DESTROYED!"
		redirect_to root_path
	end
	
	private
	def skill_params
		params.rewire(:skill).permit(:name, :description);
	end
end
							
			