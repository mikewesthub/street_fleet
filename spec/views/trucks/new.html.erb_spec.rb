require 'rails_helper'

RSpec.describe "trucks/new", type: :view do
  before(:each) do
    assign(:truck, Truck.new(
      :name => "MyString",
      :twitter => "MyString",
      :email => "MyString",
      :phone_1 => "MyString",
      :phone_2 => "MyString",
      :website => "MyString"
    ))
  end

  it "renders new truck form" do
    render

    assert_select "form[action=?][method=?]", trucks_path, "post" do

      assert_select "input#truck_name[name=?]", "truck[name]"

      assert_select "input#truck_twitter[name=?]", "truck[twitter]"

      assert_select "input#truck_email[name=?]", "truck[email]"

      assert_select "input#truck_phone_1[name=?]", "truck[phone_1]"

      assert_select "input#truck_phone_2[name=?]", "truck[phone_2]"

      assert_select "input#truck_website[name=?]", "truck[website]"
    end
  end
end
