module ControllerMacros
  def login_user
    before(:each) do
      @request.env['device.mapping'] = Devise.mappings[:user]
      user = FactoryBot.create(:user)
      sign_in user
    end
  end
end
