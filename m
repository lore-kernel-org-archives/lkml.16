Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345F314B965
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 14:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746281302; cv=none; b=A6ptHP7DRIr9wo2o7+0Y36DoU7qXiHgYJeqk3EV+YtF8Amm7tumxTRmyWEjK10wOfeIjUSBI4eZtv17xEsTUQglbNTh6Eh7/lSCJCzfjSgMKkTU6V9/nJ+IRR9X9iXYUVdH+ENOYjpJpNs1++3XUbqBsqCoMPbaqzUEViN2ikLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746281302; c=relaxed/simple;
	bh=OCsXiqG7drThgVHGvSWt4U/T+zjdViDpZqS9OPyeaEg=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=emItXF/6vc2dWldVs7naCIIArv8ZisplpZH9R0pnoc53fJEUO1F1+T6YmafGWicZiadzK5C5zbdnpkfimEhbei7kUgZJKVNSc3ObNhdW+2ehRd2gpwLe7HByt4GG88jjRIrRkfoZwW6xgkIjhWiUBq54ri6I++kYqDVSeT+NiVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=E7xmUXJg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ib1u5OvU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=E7xmUXJg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ib1u5OvU; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E7xmUXJg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ib1u5OvU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E7xmUXJg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ib1u5OvU"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A36F91F792;
	Sat,  3 May 2025 14:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746281291; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=ifjp4NjKc024Az5rcJH3Zi/VQ07OsKVLa71MnSDwcWw=;
	b=E7xmUXJglHH/6YoPjlz6tIM6cAX5Mc9i8FSuCHaPrxVOdqZKUpOgpMOF6CSsr2xAdrLEP0
	3oIX9IBdioXzHxAbSS1l6pgmZ7gl5l7g8VWWe/HHSYV4GGs7/khOcqvtXrrfbON5bTW6IJ
	1t/Zhoy3cM0zlTGsytXovY2+KLcM9mM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746281291;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=ifjp4NjKc024Az5rcJH3Zi/VQ07OsKVLa71MnSDwcWw=;
	b=Ib1u5OvUUE74h9iSVfP6Dcd7L1pqJAvxBtMFZOL9A0JuKSe8bVpp8T0JLHLzBOmFpj1CNh
	dbWyElr8OWD8EsAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746281291; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=ifjp4NjKc024Az5rcJH3Zi/VQ07OsKVLa71MnSDwcWw=;
	b=E7xmUXJglHH/6YoPjlz6tIM6cAX5Mc9i8FSuCHaPrxVOdqZKUpOgpMOF6CSsr2xAdrLEP0
	3oIX9IBdioXzHxAbSS1l6pgmZ7gl5l7g8VWWe/HHSYV4GGs7/khOcqvtXrrfbON5bTW6IJ
	1t/Zhoy3cM0zlTGsytXovY2+KLcM9mM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746281291;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=ifjp4NjKc024Az5rcJH3Zi/VQ07OsKVLa71MnSDwcWw=;
	b=Ib1u5OvUUE74h9iSVfP6Dcd7L1pqJAvxBtMFZOL9A0JuKSe8bVpp8T0JLHLzBOmFpj1CNh
	dbWyElr8OWD8EsAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 711CA13712;
	Sat,  3 May 2025 14:08:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GwDeGUsjFmg1UwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 03 May 2025 14:08:11 +0000
Date: Sat, 03 May 2025 16:08:10 +0200
Message-ID: <87bjs9ait1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 6.15-rc5
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

Linus,

please pull sound fixes for v6.15-rc5 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.15-rc5

The topmost commit is 6e5bea1c93062a43bc0435ae6cd589448094edaa

----------------------------------------------------------------

sound fixes for 6.15-rc5

A bunch of small fixes.  Mostly driver specific.

- An OOB access fix in core UMP rawmidi conversion code
- Fix for ASoC DAPM hw_params widget sequence
- Make retry of usb_set_interface() errors for flaky devices
- Fix redundant USB MIDI name strings
- Quirks for various HP and ASUS models with HD-audio, and
  Jabra Evolve 65 USB-audio
- Cirrus Kunit test fixes
- Various fixes for ASoC Intel, stm32, renesas, imx-card, and
  simple-card

----------------------------------------------------------------

Alexander Stein (1):
      ASoC: simple-card-utils: Fix pointer check in graph_util_parse_link_direction

Arnd Bergmann (1):
      ASoC: Intel: catpt: avoid type mismatch in dev_dbg() format

Bard Liao (1):
      ASoC: soc-acpi-intel-ptl-match: add empty item to ptl_cs42l43_l3[]

Charles Keepax (1):
      ASoC: cs42l43: Disable headphone clamps during type detection

Chenyuan Yang (2):
      ASoC: imx-card: Adjust over allocation of memory in imx_card_parse_of()
      ASoC: Intel: sof_sdw: Add NULL check in asoc_sdw_rt_dmic_rtd_init()

Chris Chiu (2):
      ALSA: hda: Apply volume control on speaker+lineout for HP EliteStudio AIO
      ALSA: hda/realtek - Add more HP laptops which need mute led fixup

Claudiu Beznea (1):
      ASoC: renesas: rz-ssi: Use NOIRQ_SYSTEM_SLEEP_PM_OPS()

Geoffrey D. Bennett (1):
      ALSA: usb-audio: Add retry on -EPROTO from usb_set_interface()

Joachim Priesner (1):
      ALSA: usb-audio: Add second USB ID for Jabra Evolve 65 headset

Kailang Yang (1):
      ALSA: hda/realtek - Enable speaker for HP platform

Nico Pache (1):
      firmware: cs_dsp: tests: Depend on FW_CS_DSP rather then enabling it

Olivier Moysan (2):
      ASoC: stm32: sai: skip useless iterations on kernel rate loop
      ASoC: stm32: sai: add a check on minimal kernel frequency

Richard Fitzgerald (3):
      kunit: configs: Add some Cirrus Logic modules to all_tests
      ASoC: cs-amp-lib-test: Don't select SND_SOC_CS_AMP_LIB
      ASoC: Add Cirrus and Wolfson headers to ASoC section of MAINTAINERS

Sheetal (1):
      ASoC: soc-pcm: Fix hw_params() and DAPM widget sequence

Stefan Binding (2):
      ASoC: intel/sdw_utils: Add volume limit to cs42l43 speakers
      ASoC: intel/sdw_utils: Add volume limit to cs35l56 speakers

Takashi Iwai (5):
      ASoC: Intel: bytcr_rt5640: Add DMI quirk for Acer Aspire SW3-013
      ALSA: hda/realtek: Add quirk for HP Spectre x360 15-df1xxx
      ALSA: ump: Fix buffer overflow at UMP SysEx message conversion
      ALSA: usb-audio: Fix duplicated name in MIDI substream names
      ALSA: hda/realtek: Fix built-mic regression on other ASUS models

Venkata Prasad Potturu (3):
      ASoC: amd: acp: Fix NULL pointer deref on acp resume path
      ASoC: amd: acp: Fix NULL pointer deref in acp_i2s_set_tdm_slot
      ASoC: amd: acp: Fix devm_snd_soc_register_card(acp-pdm-mach) failure

Vijendar Mukunda (1):
      ASoC: amd: ps: fix for irq handler return status

---
 MAINTAINERS                                       |  6 ++
 drivers/firmware/cirrus/Kconfig                   |  5 +-
 include/sound/soc_sdw_utils.h                     |  1 +
 include/sound/ump_convert.h                       |  2 +-
 sound/pci/hda/patch_realtek.c                     | 91 ++++++++++++++++++++---
 sound/soc/amd/acp/acp-i2s.c                       |  2 +-
 sound/soc/amd/acp/acp-legacy-common.c             |  2 +-
 sound/soc/amd/acp/acp-rembrandt.c                 |  2 +-
 sound/soc/amd/acp/acp-renoir.c                    |  2 +-
 sound/soc/amd/acp/acp63.c                         |  2 +-
 sound/soc/amd/acp/acp70.c                         |  2 +-
 sound/soc/amd/ps/pci-ps.c                         |  5 +-
 sound/soc/codecs/Kconfig                          |  5 +-
 sound/soc/codecs/cs42l43-jack.c                   |  7 ++
 sound/soc/fsl/imx-card.c                          |  2 +-
 sound/soc/generic/simple-card-utils.c             |  4 +-
 sound/soc/intel/boards/bytcr_rt5640.c             | 13 ++++
 sound/soc/intel/catpt/dsp.c                       |  2 +-
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c |  3 +-
 sound/soc/renesas/rz-ssi.c                        |  2 +-
 sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c      |  4 +
 sound/soc/sdw_utils/soc_sdw_cs42l43.c             | 10 +++
 sound/soc/sdw_utils/soc_sdw_cs_amp.c              | 24 ++++++
 sound/soc/sdw_utils/soc_sdw_rt_dmic.c             |  2 +
 sound/soc/soc-pcm.c                               |  5 +-
 sound/soc/stm/stm32_sai_sub.c                     | 16 ++--
 sound/usb/endpoint.c                              |  7 ++
 sound/usb/format.c                                |  3 +-
 sound/usb/midi.c                                  | 16 +++-
 tools/testing/kunit/configs/all_tests.config      |  2 +
 30 files changed, 206 insertions(+), 43 deletions(-)

