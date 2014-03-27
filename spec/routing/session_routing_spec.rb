require 'spec_helper'

describe "Session Routing" do

  it "routes /sign_in to Devise::Sessions#new" do
    expect(get: "/sign_in").to route_to(
      controller: "devise/sessions", action: "new"
    )
  end

  it "routes /logout to Devise::Sessions#destroy" do
    expect(delete: "/logout").to route_to(
      controller: "devise/sessions", action: "destroy"
    )
  end
end