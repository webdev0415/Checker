module AdminDashboard
  class User < ::User

    def to_s
      email
    end
  end
end
