require 'rails_helper'

RSpec.describe Api::V1::ArticlesController, type: :controller do
  render_views

  let!(:user) { create(:user) }
  let!(:article) { create(:article, user: user) }

  login_user
  describe 'GET #index' do
    before { get :index, format: :json }

    it { is_expected.to respond_with :success }
    # it { is_expected.to render_template :ind-ex }
  end
end
