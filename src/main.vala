using Mpd;

int main()
{
	var host = GLib.Environment.get_variable ("MPD_HOST");

	var cnc = new Connection(host);

	if (cnc.error != Mpd.Error.SUCCESS) {
		error (cnc.error_message);
	}

	var song = cnc.run_current_song();
	var status = cnc.run_status();

	stdout.printf("%s - %s\n", song.get_tag(TagType.ARTIST), song.get_tag(TagType.TITLE));

	string state;
	switch (status.state) {
		case State.STOP:
			state = "stopped"; break;
		case State.PLAY:
			state = "playing"; break;
		case State.PAUSE:
			state = "paused"; break;
		default:
			state = "unknown"; break;
	}

	uint progress = (status.elapsed_time * 100 / status.total_time);
	stdout.printf("[%s] #%u/%u   %u/%u (%u%%)\n", state, song.pos, status.queue_length, status.elapsed_time, status.total_time, progress);

	stdout.printf("volume: %d%%  repeat: %s  random: %s  single: %s  consume: %s\n", status.volume, status.repeat.to_string(), status.random.to_string(), status.single.to_string(), status.consume.to_string());

	uint8[] albumart = {};
	var offset = 0;

	while (true) {
		uint8 chunk[8192];
		var ret = cnc.run_albumart(song.uri, offset, chunk);

		if (ret <= 0) {
			cnc.clear_error ();
			break;
		}

		offset += ret;

		foreach (var c in chunk) {
			albumart += c;
		}
	}

	stdout.printf("albumart: %d bytes\n", albumart.length);
	return 0;
}
