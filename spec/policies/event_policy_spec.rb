# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventPolicy do
  subject { described_class }

  let(:event) { FactoryBot.create(:event, user:) }
  let(:event_with_password) { FactoryBot.create(:event, user:, pincode: '777777') }

  let(:user) { FactoryBot.create(:user) }
  let(:user_context) { UserContext.new(user, {}, '') }

  let(:second_user) { FactoryBot.create(:user) }
  let(:second_user_context) { UserContext.new(second_user, {}, '') }
  let(:second_user_context_with_correct_password) { UserContext.new(second_user, {}, '777777') }
  let(:second_user_context_with_incorrect_password) { UserContext.new(second_user, {}, '777776') }

  let(:user_context_with_correct_cookies) do
    UserContext.new(second_user,
                    { "events_#{event_with_password.id}_pincode" => '777777' }, '')
  end

  let(:user_context_with_incorrect_cookies) do
    UserContext.new(second_user,
                    { "events_#{event_with_password.id}_pincode" => '777776' }, '')
  end

  permissions :show? do
    context 'user is event creator' do
      it 'shows event' do
        expect(subject).to permit(user_context, event)
      end
    end

    context 'user is not event creator' do
      it 'not shows event' do
        expect(subject).to permit(second_user_context, event)
      end
    end

    context 'event without password' do
      it 'shows to any user' do
        expect(subject).to permit(second_user_context, event)
      end
    end

    context 'event with password' do
      it 'user cant see event without password' do
        expect(subject).not_to permit(second_user_context, event_with_password)
      end
    end

    context 'when user input password' do
      it 'correct password' do
        expect(subject).to permit(second_user_context_with_correct_password, event_with_password)
      end

      it 'incorrect password' do
        expect(subject).not_to permit(second_user_context_with_incorrect_password, event_with_password)
      end
    end

    context 'when user has cookies with password' do
      it 'shows if pin is correct' do
        expect(subject).to permit(user_context_with_correct_cookies, event_with_password)
      end

      it 'shows if pin is correct' do
        expect(subject).not_to permit(user_context_with_incorrect_cookies, event_with_password)
      end
    end
  end

  permissions :update?, :edit?, :destroy? do
    it 'user is the event creator' do
      expect(subject).to permit(user_context, event)
    end

    it 'user is not event creator' do
      expect(subject).not_to permit(second_user_context, event)
    end
  end
end
