require 'spec_helper'

describe "tweets/edit" do
  before(:each) do
    @tweet = assign(:tweet, stub_model(Tweet))
  end

  it "renders the edit tweet form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tweets_path(@tweet), :method => "post" do
    end
  end
end
