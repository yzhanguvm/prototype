require 'spec_helper'

describe "PubmedSearch pages" do
  subject { page }

  describe "for signed-in users" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit root_path
    end

    describe "pubmed_search creation" do
      describe "with invalid information" do
        it "should not create a pubmed_search" do
          expect { click_button "Search Pubmed".not_to change(PubmedSearch, :count) }
        end

        describe "error messages" do
          before { click_button "Search Pubmed" }
          it { should have_content('error') }
        end
      end

      describe "with valid information" do
        before { fill_in 'pubmed_search_query', with: "Lorem ipsum" }
        it "should create a pubmed_search" do
          expect { click_button "Search Pubmed" }.to change(PubmedSearch, :count).by(1)
        end
      end
    end

     describe "pubmed_search destruction" do
      before { FactoryGirl.create(:pubmed_search, user: user) }

      describe "as correct user" do
        before { visit user_path(user) }

        it "should delete a pubmed search" do
          expect { click_link "delete" }.to change(PubmedSearch, :count).by(-1)
        end
      end
    end

  end

  describe "for non-signed-in users" do
    before { visit root_path }

    describe "with invalid information" do
      before { click_button "Search Pubmed" }
      it { should have_content('Invalid') }
    end

    describe "with valid information" do
      before do
        fill_in 'pubmed_search_query', with: "Lorem ipsum"
        click_button "Search Pubmed"
      end

      it { should have_title('Result') }
      it { should have_content('Result') }
    end

  end
end
