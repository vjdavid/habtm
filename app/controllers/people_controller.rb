class PeopleController < ApplicationController

  before_action :find_person, except: [:index, :create]

  def tasks_belongs_person
    @tasks_belongs_person = @person.tasks.ids

    render json: @tasks_belongs_person
  end

  def assign_task_to_person
    @task = Task.find(params[:task_id])

    if @person.tasks << @task
      @task_belongs_to_people = @person.tasks.ids

      render json: @task_belongs_to_people
    else
      render json: @person.errors
    end
  end

  def index
    @people = Person.all.ids

    render json: @people
  end

  def show
    @person_id = @person.id

    render json: @person_id
  end

  def create
    @person = Person.new(person_params)

    if @person.save
      render json: @person
    else
      render json: @person.errors
    end
  end

  def update
    if @person.update(person_params)
      render json: @person
    else
      render json: @person.errors
    end
  end

  def destroy
    @person.destroy

    head :no_content
  end

  private

  def person_params
    params.permit(:name)
  end

  def find_person
    @person = Person.find(params[:id])
  end

end
