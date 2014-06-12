require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }
    it { should have_content('Sample App') }
  end

  describe "Help page" do
    before { visit help_path }
    it { should have_content('Help') }
  end

  describe "About page" do
    before { visit about_path }
    it { should have_content('About Us') }
  end

  describe "Сontact page" do
    before { visit contact_path }
    it { should have_selector('h1', text: 'Contact') }
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    expect(page).to have_title(full_title('About'))
    click_link "Help"
    expect(page).to have_title(full_title('Help'))
    click_link "Contact"
    expect(page).to have_title(full_title('Contact'))
    click_link "Home"
    click_link "Sign up now!"
    expect(page).to have_title(full_title('Sign up'))
    click_link "sample app"
    expect(page).to have_title(full_title('Home'))
  end
end