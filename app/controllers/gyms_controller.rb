class GymsController < ApplicationController
    def show
        gym = find_by_id
        if gym
            render json: gym, status: :ok
        else
            render_not_found
        end
    end

    def destroy
        gym = find_by_id
        if gym
            gym.destroy
            head :no_content
        else
            render_not_found
        end
    end

    private

    def find_by_id
        Gym.find_by(id: params[:id])
    end

    def render_not_found
        render json: {error: "Gym not found"}, status: :not_found
    end
end
