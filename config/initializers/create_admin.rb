# config/initializers/create_admin.rb

Rails.application.config.after_initialize do
  if Rails.env.development? || Rails.env.production? # 你可以根据需要调整这些环境
    unless User.admin.exists?
      password = "admin123"
      User.create!(email: 'admin@brother.com', password: password, password_confirmation: password,  role: :admin)
      # 输出或保存密码供后续使用
      Rails.logger.info "Generated admin account with email: admin@brother.com and password: #{password}"
    end
  end
end
