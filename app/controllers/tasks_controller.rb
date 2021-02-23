class TasksController < ApplicationController

    before_action :set_task, only: [:show, :edit, :update, :destroy]
    
    def index
        @tasks = Task.all
    end

    def show
        # @task = Task.find(params[:id])
    end

    def new
        @task = Task.new
    end

    def create
        @task = Task.new(task_params)
        @task.save
        if @task.save
            redirect_to task_path(@task)
        else
            redirect_to new_task_path
        end
        
    end


    def edit
        # @task = Task.find(params[:id])
    end

    def update
        raise
        if (params[:check_done])
            @task.completed = !@task.completed
            @task.save
            redirect_to tasks_path
        else
        # @task = Task.find(params[:id])
        @task.update(task_params)
        redirect_to task_path(@task)
        end
    end

    def destroy
        # @task = Task.find(params[:id])
        @task.destroy
    
        redirect_to tasks_path
      end

    private

    def task_params
      params.require(:task).permit(:title, :details, :completed)
    end

    def set_task
        @task = Task.find(params[:id])
    end

end
