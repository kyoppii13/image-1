class Api::V1::HealthChecksController < ApplicationController
  def index
    render head: :ok
  end
end
