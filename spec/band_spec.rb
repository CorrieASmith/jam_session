require('spec_helper')

describe(Venue) do
  describe('#bands') do
    it('determines what bands will be playing at what venues') do
      new_band1 = Band.create({:name => 'Lynyrd Skynyrd'})
      new_band2 = Band.create({:name => 'Bon Jovi'})
      new_band3 = Band.create({:name => 'KISS'})
      new_venue = Venue.create({:name => '88 Keys'})
      new_venue.bands.push(new_band1)
      new_venue.bands.push(new_band2)
      expect(new_venue.bands()).to(eq([new_band1, new_band2]))
    end
  end

  it('validates the presence of a description') do
    band = Band.create({:name => ""})
    expect(band.save()).to(eq(false))
  end

  it('capitalizes the first letters of a band name') do
    band = Band.create({:name => "thirty seconds to mars"})
    expect(band.name).to(eq("Thirty Seconds To Mars"))
  end
end
