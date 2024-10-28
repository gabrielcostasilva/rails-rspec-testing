require 'rails_helper'

RSpec.describe "Business rules" do
    describe 'validations' do
        it 'must be throw error because there is no *name* for Article' do
            expect { instance_double('Article', name: 'Hello World') }.to raise_error
        end

        it 'must return hw message for existing method' do
            expect(Article.new().print_something).to eq('Hello World')
        end

        it 'must return ANOTHER message for existing method' do
            expect(instance_double('Article', print_something: 'Hello?').print_something).to eq('Hello?')
        end

        it 'must raise error for unexisting method' do
            expect { instance_double('Article', print_something_else: 'Hello?') }.to raise_error
        end

        it 'must return message for new method' do
            an_article = double('Article') # Notice this is a double, not an instance_double
            allow(an_article).to receive(:print_something_else).and_return('Hello Hello')
            expect(an_article.print_something_else).to eq('Hello Hello')
        end
    end
end
