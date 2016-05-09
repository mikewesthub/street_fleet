require 'rails_helper'

RSpec.describe "trucks/show", type: :view do
  before(:each) do
    @truck = assign(:truck, Truck.create!(
      :name => "Name",
      :twitter => "Twitter",
      :email => "Email",
      :phone_1 => "Phone 1",
      :phone_2 => "Phone 2",
      :website => "Website"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Twitter/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone 1/)
    expect(rendered).to match(/Phone 2/)
    expect(rendered).to match(/Website/)
  end
end
