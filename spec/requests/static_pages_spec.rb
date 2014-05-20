require 'spec_helper'

describe "Static pages" do

  let(:base_title) { "PubMedMiner" }

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('PubMedMiner') }

    it { should have_title(full_title('Home')) }
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_content('Help') }
   
    it { should have_title(full_title('Help')) }

  end
  
  describe "About page" do
    before { visit about_path }

    it { should have_content('About Us') }
    
    it { should have_title(full_title('About Us')) }

  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_content('Contact') }
    
    it { should have_title(full_title('Contact')) }

  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    expect(page).to have_title(full_title('About Us'))

    click_link "Help"
    expect(page).to have_title(full_title('Help'))

    click_link "Contact"
    expect(page).to have_title(full_title('Contact'))

    click_link "Home"
    expect(page).to have_title(full_title('Home'))

    click_link "Sign up now!"
    expect(page).to have_title(full_title('Sign up'))

    # ambiguous since there are two links with "PubMedMiner"
    #click_link "PubMedMiner"
    #expect(page).to have_title(full_title('Home'))
  end

end
