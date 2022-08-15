# frozen_string_literal: true

module SessionsHelper
  def flash_message
    flash[:alert] = 'Are you a Guru? Verify your Email and Password please'
  end
end
