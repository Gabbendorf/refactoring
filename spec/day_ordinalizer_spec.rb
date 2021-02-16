# frozen_string_literal: true

require "day_ordinalizer"

RSpec.describe(DayOrdinalizer) do
  it "ordinalizes 1" do
    first = DayOrdinalizer.ordinalize(1)

    expect(first).to eq("1st")
  end

  it "ordinalizes 2" do
    second = DayOrdinalizer.ordinalize(2)

    expect(second).to eq("2nd")
  end

  it "ordinalizes 3" do
    third = DayOrdinalizer.ordinalize(3)

    expect(third).to eq("3rd")
  end

  it "ordinalizes 5" do
    fifth = DayOrdinalizer.ordinalize(5)

    expect(fifth).to eq("5th")
  end
  it "ordinalizes 11" do
    eleventh = DayOrdinalizer.ordinalize(11)

    expect(eleventh).to eq("11th")
  end

  it "ordinalizes 12" do
    twelth = DayOrdinalizer.ordinalize(12)

    expect(twelth).to eq("12th")
  end

  it "ordinalizes 13" do
    thirteenth = DayOrdinalizer.ordinalize(13)

    expect(thirteenth).to eq("13th")
  end

  it "ordinalizes 21" do
    twentyfirst = DayOrdinalizer.ordinalize(21)

    expect(twentyfirst).to eq("21st")
  end

  it "ordinalizes 22" do
    twentysecond = DayOrdinalizer.ordinalize(22)

    expect(twentysecond).to eq("22nd")
  end

  it "ordinalizes 23" do
    twentythird = DayOrdinalizer.ordinalize(23)

    expect(twentythird).to eq("23rd")
  end

  it "ordinalizes 31" do
    thirtyfirst = DayOrdinalizer.ordinalize(31)

    expect(thirtyfirst).to eq("31st")
  end
end
