sub EVENT_SPAWN {
	quest::gmsay("[$zoneln] Fright has been awakened" . "!", 13, 1, 0, 0); 
}

sub EVENT_SIGNAL {
	#:: Match a signal '1' sent from /fearplane/Cazic_Thule.pl
	if ($signal == 1) {
		quest::say("Such is the will of Cazic-Thule!");
	}
	#:: Match a signal '2' sent from /fearplane/Cazic_Thule.pl
	elsif ($signal == 2) {
		my $getmobbynpctype = $entity_list->GetMobByNpcTypeID(72003);
		my $follow_target = $getmobbynpctype->GetID();
		quest::follow($follow_target);
		quest::say("We obey!");
	}
	#:: Match a signal '3' sent from /fearplane/Cazic_Thule.pl
	elsif ($signal == 3) {
		quest::sfollow();
	}
}

sub EVENT_DEATH {
	#:: Create a scalar variable to store a random number from 1 - 4
	my $Random = int(rand(4)) + 1;
	#:: Match 75 percent of the time
	#if ($Random > 1) {
		#:: Spawn a The Plane of Fear >> Iksar_broodling (72105) at the current location
	#	quest::spawn2(72105, 0, 0, $x, $y, $z, $h);
	#}
	quest::gmsay("[$zoneln] Dread has been slain by " . ($entity_list->GetMobByID($killer_id) ? $entity_list->GetMobByID($killer_id)->GetCleanName() : "an unknown hand") . ".", 13, 1, 0, 0); 
}
