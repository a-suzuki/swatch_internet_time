DAY_SEC = 24 * 60 * 60

def get_internet_time(time)
	time_utc = time.utc
	hour_biel = (time_utc.hour + 1) % 24
	total_sec = 60 * (60 * (hour_biel) + time_utc.min) + time_utc.sec
	interenet_time = 1000.0 * total_sec / DAY_SEC
end

puts sprintf("%.2f", get_internet_time(Time.now))

describe "get_internet_time" do
	it "should receive 666.67 at 0:00" do
		time = Time.mktime(2012, 8, 14, 0, 0, 0)
		internet_time = get_internet_time(time)
		internet_time.should be_within(0.005).of(666.67)
	end

	it "should receive 0.0 at 8:00" do
		time = Time.mktime(2012, 8, 14, 8, 0, 0)
		internet_time = get_internet_time(time)
		internet_time.should be_within(0.005).of(0.0)
	end
end