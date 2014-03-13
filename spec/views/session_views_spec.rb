require 'spec_helper'

describe 'sessions/new' do
  it "shows a username field" do
    render
    expect(rendered).to include("Username")
  end

  it "shows a password field" do
    render
    expect(rendered).to include("Password")
  end

  it "displays any flash alerts" do
    flash[:alert] = "Bad username/password"
    render
    expect(rendered).to include("Bad username/password")
  end

end