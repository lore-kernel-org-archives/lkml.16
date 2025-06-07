Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C17E1D514B
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 08:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749284220; cv=none; b=u9usDMnhDPY48IKieFxFeK+mHDMIau2XjUovHRcmxHx7To/kYUTtQN6lWa5xAkgkUYBRfZfgMGC9fQ5huiLVy8QPgAxtn9ntwoPMAmJ4I3RRI9kasAviM3dQCKiSj6E2qZZb56gDaCvd6+u3FVu2Apx8KFlNfctvRoudCvaa/po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749284220; c=relaxed/simple;
	bh=EAaWFyB5OcrXWrWwxkjMhxKdrpiUEHx4b5DNZSG2JS4=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=HMDOzI2UTGNzObo9mUvEhJUDHN6adlxdeVtWGOL1bLF/TcSnZGVfP4VrP0N9GQd879doUHqlXZdg8upVwwK3UW278xJ7v4Z/+bQJr5Hp1/UzYqAOtXxeTsO+VMVEYw63UlaosdM9XLK9mlsPXmbZfMpUxzWAPfNE1LOEVXipFOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yXYOVli7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pL2bpfp/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yXYOVli7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pL2bpfp/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yXYOVli7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pL2bpfp/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yXYOVli7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pL2bpfp/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 419322215F;
	Sat,  7 Jun 2025 08:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749284211; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=robSj48iKWpZ23zA67C1/ic/27JIcweNqkn3EppXh54=;
	b=yXYOVli7gNKxBuXf/O4LTLbXv9+Px7F/naDZ/iRGzg1KY6D9JivgothJkE0tZ/3F93/zQ0
	Pv00FkJxKQ6G16cdgtSxpJg3CasS66cTc9qm0zY5/+8GhCJmFpNXRujKFG5EKUiF2VS6jq
	bi/UzD+jiCoUVsKGiojT4QHn53Z4TIk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749284211;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=robSj48iKWpZ23zA67C1/ic/27JIcweNqkn3EppXh54=;
	b=pL2bpfp/mzYpyR3IjaT6C4P3tjADfKGlyAqtMZwqh/WQM+SaV9eSmTuG7nzr9hXJOnkua/
	VAfvojf1qteZl7BA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=yXYOVli7;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="pL2bpfp/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749284211; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=robSj48iKWpZ23zA67C1/ic/27JIcweNqkn3EppXh54=;
	b=yXYOVli7gNKxBuXf/O4LTLbXv9+Px7F/naDZ/iRGzg1KY6D9JivgothJkE0tZ/3F93/zQ0
	Pv00FkJxKQ6G16cdgtSxpJg3CasS66cTc9qm0zY5/+8GhCJmFpNXRujKFG5EKUiF2VS6jq
	bi/UzD+jiCoUVsKGiojT4QHn53Z4TIk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749284211;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=robSj48iKWpZ23zA67C1/ic/27JIcweNqkn3EppXh54=;
	b=pL2bpfp/mzYpyR3IjaT6C4P3tjADfKGlyAqtMZwqh/WQM+SaV9eSmTuG7nzr9hXJOnkua/
	VAfvojf1qteZl7BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 099CD13884;
	Sat,  7 Jun 2025 08:16:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id s2COAHP1Q2g9NQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 07 Jun 2025 08:16:51 +0000
Date: Sat, 07 Jun 2025 10:16:50 +0200
Message-ID: <87y0u4hsp9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 6.16-rc1
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 419322215F
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.51

Linus,

please pull sound fixes for v6.16-rc1 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-fix-6.16-rc1

The topmost commit is 10db95285240743e7b288272ede140aabce5e631

----------------------------------------------------------------

sound fixes for 6.16-rc1

A collection of fix patches for 6.16-rc1 merge window.
Most of changes are about ASoC, especially lots of AVS driver fixes.
Larger LOCs are seen in TAS571x codec drivers, but the changes are
trivial and safe.  The rest are all device-specific small fixes.

----------------------------------------------------------------

Amadeusz S³awiñski (2):
      ASoC: Intel: avs: Fix paths in MODULE_FIRMWARE hints
      ASoC: Intel: avs: boards: Fix rt5663 front end name

Bram Vlerick (2):
      ASoC: tas571x: add separate tas5733 controls
      ASoC: tas571x: fix tas5733 num_controls

Cezary Rojewski (10):
      ASoC: codecs: hda: Fix RPM usage count underflow
      ASoC: Intel: avs: Fix deadlock when the failing IPC is SET_D0IX
      ASoC: Intel: avs: Fix PPLCxFMT calculation
      ASoC: Intel: avs: Fix possible null-ptr-deref when initing hw
      ASoC: Intel: avs: Verify kcalloc() status when setting constraints
      ASoC: Intel: avs: Verify content returned by parse_int_array()
      ASoC: Intel: avs: Include missing string.h
      ASoC: pcm: Do not open FEs with no BEs connected
      ALSA: hda: Ignore unsol events for cards being shut down
      ASoC: Intel: avs: Simplify verification of parse_int_array() result

David Heimann (1):
      ALSA: usb-audio: Add implicit feedback quirk for RODE AI-1

Jaroslav Kysela (2):
      firmware: cs_dsp: Fix OOB memory read access in KUnit test (wmfw info)
      firmware: cs_dsp: Fix OOB memory read access in KUnit test (ctl cache)

Krzysztof Kozlowski (4):
      ASoC: codecs: wcd9335: Fix missing free of regulator supplies
      ASoC: codecs: wcd937x: Drop unused buck_supply
      ASoC: codecs: wcd9375: Fix double free of regulator supplies
      ALSA: hda: cs35l41: Constify regmap_irq_chip

Mario Limonciello (1):
      ALSA: usb-audio: Add a quirk for Lenovo Thinkpad Thunderbolt 3 dock

Qasim Ijaz (1):
      ASoC: codecs: fix out-of-bounds access on invalid clock config

Shuming Fan (1):
      ASoC: rt1320: fix speaker noise when volume bar is 100%

Vijendar Mukunda (1):
      ALSA: hda: Add new pci id for AMD GPU display HD audio controller

Yuuki NAGAO (1):
      ASoC: ti: omap-hdmi: Re-add dai_link->platform to fix card init

meowmeowbeanz (1):
      ASoC: amd: yc: Add support for Lenovo Yoga 7 16ARP8

---
 drivers/firmware/cirrus/test/cs_dsp_mock_wmfw.c    |  3 +-
 .../cirrus/test/cs_dsp_test_control_cache.c        |  1 -
 sound/pci/hda/cs35l41_hda.c                        |  2 +-
 sound/pci/hda/hda_bind.c                           |  2 +-
 sound/pci/hda/hda_intel.c                          |  3 +
 sound/soc/amd/yc/acp6x-mach.c                      |  7 +++
 sound/soc/codecs/es8375.c                          |  1 +
 sound/soc/codecs/hda.c                             |  4 +-
 sound/soc/codecs/rt1320-sdw.c                      | 17 +++++-
 sound/soc/codecs/tas571x.c                         | 67 +++++++++++++++++++++-
 sound/soc/codecs/tas571x.h                         | 34 +++++++++++
 sound/soc/codecs/wcd9335.c                         | 25 +++-----
 sound/soc/codecs/wcd937x.c                         |  7 +--
 sound/soc/intel/avs/board_selection.c              |  2 +-
 sound/soc/intel/avs/boards/rt5663.c                |  2 +-
 sound/soc/intel/avs/core.c                         | 20 +++----
 sound/soc/intel/avs/debugfs.c                      | 12 ++--
 sound/soc/intel/avs/ipc.c                          |  4 +-
 sound/soc/intel/avs/loader.c                       |  1 +
 sound/soc/intel/avs/path.c                         |  2 +
 sound/soc/intel/avs/pcm.c                          | 13 ++---
 sound/soc/soc-pcm.c                                | 23 ++++----
 sound/soc/ti/omap-hdmi.c                           |  7 ++-
 sound/usb/implicit.c                               |  1 +
 sound/usb/quirks.c                                 |  2 +
 25 files changed, 192 insertions(+), 70 deletions(-)

