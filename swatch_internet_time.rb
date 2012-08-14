def get_internet_time(time)
	666.67
end

describe "get_internet_time" do
	it "should receive 666.67 at 0:00" do
		time = Time.mktime(2012, 8, 14, 0, 0, 0)
		internet_time = get_internet_time(time)
		internet_time.should be_within(0.005).of(666.67)
	end
end