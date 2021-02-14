class Api::HealthChecksController < ApplicationController
  def index
    render head: :ok
  end
end
