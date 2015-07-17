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