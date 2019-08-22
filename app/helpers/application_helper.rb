module ApplicationHelper
  def bootstrap_class_for(flash_type)
    {
      success: "alert-success",
      error: "alert-danger",
      alert: "alert-warning",
      notice: "alert-info"
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

    def current_user_subscribed?
      user_signed_in? && current_user.subscribed?
    end

    def admin?
      user_signed_in? && current_user.admin?
    end

    def subscribed?
      user_signed_in? && current_user.subscribed?
    end

    def not_subscribed?
      user_signed_in? && current_user.subscribed?
    end

    def titlize(str)
      str.gsub('_', ' ').captalize
  end


end
