require 'spec_helper'

describe "Session Routing" do

  it "routes /sign_in to Sessions#new" do
    expect(get: "/sign_in").to route_to(
      controller: "sessions", action: "new"
    )
  end

  it "routes /logout to Sessions#destroy" do
    expect(get: "/logout").to route_to(
      controller: "sessions", action: "destroy"
    )
  end
end