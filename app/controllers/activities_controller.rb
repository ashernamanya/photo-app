class ActivitiesController < ApplicationController
  def index
      @activities = PublicActivity::Activity.order("created_at desc").where(owner_id: current_user.follower_ids, owner_type: "User")
  end
end
def self.unread
  where(:read => false).count

end