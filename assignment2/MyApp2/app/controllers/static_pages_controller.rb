class StaticPagesController < ApplicationController

    def index
        @latest_courses = Course.order(created_at: :desc).limit(3)
    end
end
