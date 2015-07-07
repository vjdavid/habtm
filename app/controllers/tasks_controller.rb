class TasksController < ApplicationController

  before_action :find_task, only: [:people_belongs_task, :assign_person_to_task, :show, :update, :destroy]

  def people_belongs_task
    @people_belongs_task = @task.people.ids

    render json: @people_belongs_task
  end

  def assign_person_to_task
    @person = Person.find(params[:person_id])

    binding.pry

    if @task.people << @person
      @person_belongs_to_tasks = @task.people.ids

      render json: @person_belongs_to_tasks
    else
      render json: @task.errors
    end
  end

  def index
    @tasks = Task.all.ids

    render json: @tasks
  end

  def show
    render json: @task.id
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      render json: @task
    else
      render json: @task.errors
    end
  end

  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors
    end
  end

  def destroy
    @task.destroy

    head :no_content
  end

  private

  def task_params
    params.permit(:name, :description)
  end

  def find_task
    @person = Task.find(params[:id])
  end

end
