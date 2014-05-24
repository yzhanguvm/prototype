require 'spec_helper'

describe PubmedSearch do
  let(:user) { FactoryGirl.create(:user) }
  before do
    @pubmed_search = user.pubmed_searches.build(query: "Lorem ipsum")
  end

  subject { @pubmed_search }

  it { should respond_to(:query) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @pubmed_search.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank query" do
    before { @pubmed_search.query = " " }
    it { should_not be_valid }
  end

  describe "with query that is too long" do
    before { @pubmed_search.query = "a" * 151 }
    it { should_not be_valid }
  end

end
