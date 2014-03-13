require 'spec_helper'

describe "Registration Routing" do

  it "routes /sign_up to Registrations#new" do
    expect(get: "/sign_up").to route_to(
      controller: "registrations", action: "new"
    )
  end

end