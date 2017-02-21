require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let(:question) {create(:question)}

  describe "GET #index" do
    before { get :index, params: { question_id: question } }

    it "populates an array by all answers" do
      answer1 = question.answers.create(title: "qwerty", body: "qwerty")
      answer2 = question.answers.create(title: "qwerty1", body: "qwerty1")

      expect(assigns(:answers)).to match_array([answer1, answer2])
    end

    it "renders index view" do
      expect(response).to render_template(:index)
    end
  end

  describe "GET #new" do
    before { get :new, params: { question_id: question } }

    it "assigns a requested answer to the variable @answer" do
      expect(assigns(:answer)).to be_a_new(Answer)
    end

    it "renders new view" do
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "create with valid attributes" do

      it "saves a new answer to the database" do
        expect { post :create, params: { question_id: question, answer: attributes_for(:answer) }}.to change(question.answers, :count).by(1)
      end

      it "redirects to question show view" do
        post :create, params: { question_id: question, answer: attributes_for(:answer) }
        expect(response).to redirect_to question_path(assigns(:question))
      end
    end

    context "create with invalid attributes" do

      it "doesn't save a new answer into the database" do
        expect { post :create, params: { question_id: question, answer: attributes_for(:invalid_answer) }}.to_not change(Answer, :count)
      end

      it "re-renders new view" do
        post :create, params: { question_id: question, answer: attributes_for(:invalid_answer) }
        expect(response).to render_template(:new)
      end
    end
end

end
