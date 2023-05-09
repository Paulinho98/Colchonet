require 'rails_helper'

RSpec.describe Customer, type: :model do

  it '#full_name - Sobrescrevendo atributo' do
    customer = create(:customer, name: "Paulo")
    expect(customer.full_name).to eq("Sr. Paulo")
  end

  it 'Herança' do
  customer = create(:customer_vip)
  expect(customer.vip).to eq(true)
  end

  it '#full_name' do
  customer = create(:user)
  expect(customer.full_name).to start_with("Sr. ")
  end

  it 'Usando o attributes_for' do
    attrs = attributes_for(:customer)
    customer = Customer.create(attrs)
    expect(customer.full_name).to start_with("Sr. ")
  end

  it 'Atributo transitorio' do
    customer = create(:customer_default, upcased: true)
    expect(customer.name.upcase).to eq(customer.name)
  end

  it 'Cliente Masc Vip' do
    customer = create(:customer_male_vip)
    expect(customer.gender).to eq('M')
    expect(customer.vip).to eq(true)
  end

  it{ expect{ create(:customer) }.to change {Customer.all.size}.by(1) }
end
