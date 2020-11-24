require 'rails_helper'

RSpec.describe Garbage, type: :model do
  before do
    @garbage = FactoryBot.build(:garbage)
  end
  describe '予定の新規登録' do
    context '新規登録ができる時' do
      it 'dow,title,が存在すれば登録できる' do
        expect(@garbage).to be_valid
      end

      context '新規登録がうまくいかないとき' do
        it 'dowが空だと登録できない' do
          @garbage.dow = nil
          @garbage.valid?
          expect(@garbage.errors.full_messages).to include('Dowを入力してください')
        end

        it 'titleが空だと登録できない' do
          @garbage.title = nil
          @garbage.valid?
          expect(@garbage.errors.full_messages).to include('Titleを入力してください')
        end
      end
    end
  end
end
