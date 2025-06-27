Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EF52264D9
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 08:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751011679; cv=none; b=LUJgz5EQ8g5YP1LZBFfRpQrgg/D4znspIM+WZzj1L6JYqQMUr/4wTJjPrvEm0qi7EL66bx5TIgwBg6zJ0hM28rgqidDVicb8FRVEZKgFCGyPmqJYoVG1ms8D91eLcFn+TSzl56k1b3HOxCyolnWqg6feylJhyaNMW6yTPFCVgCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751011679; c=relaxed/simple;
	bh=TNnLQEhUfqgFW5GGqcIGj22wIpx9IjiCVQYfYRXw3z8=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=gEpYZN5pzqczC6mmT0cgoNxls9xBadMT5fVsO+/9mi73KQYowlVSDjW9eJtZSm7E9yulr3m3JKufEJNhD5Mf/gdjdRP4TLM/zAUhm4hAIgg+FZbd+ifpffVD4W9aYsoKes7FovXoT8qiEtOsKx6lYShHn7wwvm+t7Zq/m0RIXLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ylGHKGOz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wIqNCvLY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ylGHKGOz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wIqNCvLY; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ylGHKGOz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wIqNCvLY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ylGHKGOz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wIqNCvLY"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 16A4A1F387;
	Fri, 27 Jun 2025 08:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751011675; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=+XGSxsmp+fpITZ1AeCPa0Th2Qzu1Sb/brzkLAhI5QQM=;
	b=ylGHKGOzpt5pcHQOEXt32zLyfX3kG+ivN+gjTeGGlya9G7uQF24Bsozdi6eOIJZJ15wHKi
	MreGEQr0B7sjmQ+MeugsN/e3oTtlatDxxVVoDtAoefCF3ugL/T4X/5Ol3ERcE0AF5Wdyjd
	vby5KVNbTqCIbDa/5ibaBdBWgnc1s00=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751011675;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=+XGSxsmp+fpITZ1AeCPa0Th2Qzu1Sb/brzkLAhI5QQM=;
	b=wIqNCvLY6rWpHGPzLUO2GDn9HYPZBF9oviy7ONR0U/W1Fi1R/ZmyMx2CD8LW1kzInAfzmX
	kaYgI7HvOG555BCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751011675; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=+XGSxsmp+fpITZ1AeCPa0Th2Qzu1Sb/brzkLAhI5QQM=;
	b=ylGHKGOzpt5pcHQOEXt32zLyfX3kG+ivN+gjTeGGlya9G7uQF24Bsozdi6eOIJZJ15wHKi
	MreGEQr0B7sjmQ+MeugsN/e3oTtlatDxxVVoDtAoefCF3ugL/T4X/5Ol3ERcE0AF5Wdyjd
	vby5KVNbTqCIbDa/5ibaBdBWgnc1s00=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751011675;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=+XGSxsmp+fpITZ1AeCPa0Th2Qzu1Sb/brzkLAhI5QQM=;
	b=wIqNCvLY6rWpHGPzLUO2GDn9HYPZBF9oviy7ONR0U/W1Fi1R/ZmyMx2CD8LW1kzInAfzmX
	kaYgI7HvOG555BCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E418A13786;
	Fri, 27 Jun 2025 08:07:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UPyHNlpRXmjIVAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 27 Jun 2025 08:07:54 +0000
Date: Fri, 27 Jun 2025 10:07:54 +0200
Message-ID: <87tt41hajp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 6.16-rc4
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.30

Linus,

please pull sound fixes for v6.16-rc4 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.16-rc4

The topmost commit is 7ab6847a03229e73bb7c58ca397630f699e79b53

----------------------------------------------------------------

sound fixes for 6.16-rc4

A collection of small fixes again:
- A regression fix for hibernation bug in ASoC SoundWire
- Fixes for the new Qualcomm USB offload stuff
- A potential OOB access fix in USB-audio
- A potential memleadk fix in ASoC Intel
- Quirks for HD-audio and ASoC AMD ACP

----------------------------------------------------------------

Chris Chiu (1):
      ALSA: hda/realtek: fix mute/micmute LEDs for HP EliteBook 6 G1a

Harshit Mogalapalli (1):
      ALSA: qc_audio_offload: Fix missing error code in prepare_qmi_response()

Jack Yu (1):
      ASoC: rt721-sdca: fix boost gain calculation error

Luca Weiss (1):
      ASoC: qcom: sm8250: Fix possibly undefined reference

Oliver Schramm (1):
      ASoC: amd: yc: Add DMI quirk for Lenovo IdeaPad Slim 5 15

Pei Xiao (1):
      ALSA: usb: qcom: fix NULL pointer dereference in qmi_stop_session

Salvatore Bonaccorso (1):
      ALSA: hda/realtek: Fix built-in mic on ASUS VivoBook X507UAR

Takashi Iwai (1):
      ALSA: hda/realtek: Add mic-mute LED setup for ASUS UM5606

Tamura Dai (1):
      ASoC: SOF: Intel: hda: Use devm_kstrdup() to avoid memleak.

Tim Crawford (1):
      ALSA: hda/realtek: Add quirks for some Clevo laptops

Vijendar Mukunda (1):
      ASoC: amd: ps: fix for soundwire failures during hibernation exit sequence

Yasmin Fitzgerald (1):
      ALSA: hda/realtek - Enable mute LED on HP Pavilion Laptop 15-eg100

Youngjun Lee (1):
      ALSA: usb-audio: Fix out-of-bounds read in snd_usb_get_audioformat_uac3()

Yuzuru10 (1):
      ASoC: amd: yc: add quirk for Acer Nitro ANV15-41 internal mic

---
 sound/pci/hda/patch_realtek.c     | 10 ++++++++++
 sound/soc/amd/ps/acp63.h          |  4 ++++
 sound/soc/amd/ps/ps-common.c      | 18 ++++++++++++++++++
 sound/soc/amd/yc/acp6x-mach.c     | 14 ++++++++++++++
 sound/soc/codecs/rt721-sdca.c     | 23 +++++++++++++++++++----
 sound/soc/qcom/Kconfig            |  1 +
 sound/soc/sof/intel/hda.c         |  6 +++---
 sound/usb/qcom/qc_audio_offload.c | 16 ++++++++--------
 sound/usb/stream.c                |  2 ++
 9 files changed, 79 insertions(+), 15 deletions(-)

