require 'rails_helper'

describe "show page json" do

  it "should display the id, first name, and last name of a user in json" do
    u1 = User.new
    u1.first_name = "Chuck"
    u1.last_name = "Norris"
    u1.email = "chuck.norris@gmail.com"
    u1.password = "password"
    u1.save!

    visit "/users/#{u1.id}.json"
    expect(page.status_code).to eq 200
    expect(page.response_headers["Content-Type"]).to eq "application/json; charset=utf-8"

    json =  JSON.parse(body)  #variable to save time
    expect(json["user"]["first"]).to eq "Chuck"
    expect(json["user"]["last"]).to eq "Norris"
    expect(json["user"]["userid"]).to eq u1.id
  end

end
