using Mpd;

int main()
{
	var cnc = new Connection();
	var song = cnc.run_current_song();
	var status = cnc.run_status();

	stdout.printf("%s - %s\n", song.get_tag(TagType.ARTIST), song.get_tag(TagType.TITLE));

	string state;
	switch (status.get_state()) {
		case State.STOP:
			state = "stopped"; break;
		case State.PLAY:
			state = "playing"; break;
		case State.PAUSE:
			state = "paused"; break;
		default:
			state = "unknown"; break;
	}

	uint progress = (status.get_elapsed_time() * 100 / status.get_total_time());
	stdout.printf("[%s] #%u/%u   %u/%u (%u%%)\n", state, song.get_pos(), status.get_queue_length(), status.get_elapsed_time(), status.get_total_time(), progress);

	stdout.printf("volume:%d%%  repeat: %s  random: %s  single: %s  consume: %s\n", status.get_volume(), status.get_repeat().to_string(), status.get_random().to_string(), status.get_single().to_string(), status.get_consume().to_string());

	return 0;
}
