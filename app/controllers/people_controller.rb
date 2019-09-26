class PeopleController < ApplicationController
  # https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-one
  before_action :set_person, only: [:show, :update, :destroy]

  # GET /people
  def index
    @people = Person.all
    if params[:filter] == 'total_age'
      json_response({ total_age: Person.total_age })
    else
      json_response(@people)
    end
  end

  # POST /people
  def create
    @person = Person.create!(person_params)
    json_response(@person, :created)
  end

  # GET /people/:id
  def show
    json_response(@person)
  end

  # PUT /people/:id
  def update
    @person.update(person_params)
    head :no_content
  end

  # DELETE /people/:id
  def destroy
    @person.destroy
    head :no_content
  end

  private

  def person_params
    # whitelist params
    params.permit(:name, :birthday, :hobbies)
  end

  def set_person
    @person = Person.find(params[:id])
  end
end
