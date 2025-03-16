class TasksController < ApplicationController
  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = 'Task created successfully'
      redirect_to @task
    else
      flash[:notice] = 'Unable to create task'
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @task = Task.new
  end

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:notice] = 'Task updated successfully'
      redirect_to @task
    else
      flash[:notice] = 'Unable to update task'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      flash[:notice] = 'Task deleted successfully'
      redirect_to tasks_path
    else
      flash[:notice] = 'Unable to delete task'
      redirect_back fallback_location: :tasks_path
    end
  end



  def task_params
    params.require(:task).permit(:name, :description, :status, :creator, :performer, :completed)
  end
end
