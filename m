Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27862611E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 09:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743757509; cv=none; b=t7/pq9EEAXeuQzCSfGi9iob3f32jmv13cUm2W6NWnRj1UZeQyGB2K4jpheEqYqMKHVY6T5T8wXfLYQ74dkBWNz/aIDrvaX0e5wWDB0qHk7yCo6o9XXkk6tFKN9sO5Lr1EHaNfpV1k6vWw4pVnHcL/dnY3tWk/NjTkaFLxrpLtUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743757509; c=relaxed/simple;
	bh=Y/RYwNXCuCoIrlw9yXXP5rHNdcyDzseZYW1Z5cq/B34=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=NsqIsEHiWgXydahWolS1MYgJ8irYS+StnR3JiZJWhzwZfjLQnuIW7Dp7Cq2HHK2Kd9PKs5b4ntJJAcDDDrWJehm39vurUE1sj0ObpoppY8MefxAXdG+2dHzLf3kHXaMHUy05QAbFVywYcw6Gbfm2BLd6wIdQQgznxHUsAfA6LF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VyJL6fva; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QODWa4OP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VyJL6fva; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QODWa4OP; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VyJL6fva";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QODWa4OP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VyJL6fva";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QODWa4OP"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4D8841F38F;
	Fri,  4 Apr 2025 09:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743757506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=Ldo3walCcpJosguuB90QWxcqh/TrTam+ym0Vhx7MOGQ=;
	b=VyJL6fvaTTZoYpUT3/q9V3L9q52grS+DzYRb9bNU6V0Sxdq6bML+0ZiORkR/0EP7iaYaRC
	5kanRSV3aUsIDmkntHv7tX9HjCc8OAiELQnuu5GxK/V5w/i2Rta9zvU6iai2lulUYCUfoe
	QJwCH2O+rMHqpbH7bG0Hd0S4YJQ88qA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743757506;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=Ldo3walCcpJosguuB90QWxcqh/TrTam+ym0Vhx7MOGQ=;
	b=QODWa4OPv/kKNlEPDZQch/rATuuXI2i1TZpcZwAd0x/34GHY2eDRvl1UkxHxIKiT5JcZoM
	j8BsrDFfKwjSM+Dg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743757506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=Ldo3walCcpJosguuB90QWxcqh/TrTam+ym0Vhx7MOGQ=;
	b=VyJL6fvaTTZoYpUT3/q9V3L9q52grS+DzYRb9bNU6V0Sxdq6bML+0ZiORkR/0EP7iaYaRC
	5kanRSV3aUsIDmkntHv7tX9HjCc8OAiELQnuu5GxK/V5w/i2Rta9zvU6iai2lulUYCUfoe
	QJwCH2O+rMHqpbH7bG0Hd0S4YJQ88qA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743757506;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=Ldo3walCcpJosguuB90QWxcqh/TrTam+ym0Vhx7MOGQ=;
	b=QODWa4OPv/kKNlEPDZQch/rATuuXI2i1TZpcZwAd0x/34GHY2eDRvl1UkxHxIKiT5JcZoM
	j8BsrDFfKwjSM+Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1FCAF13691;
	Fri,  4 Apr 2025 09:05:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +Op7BsKg72d1BgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 04 Apr 2025 09:05:06 +0000
Date: Fri, 04 Apr 2025 11:05:05 +0200
Message-ID: <874iz447r2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 6.15-rc1
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Flag: NO

Linus,

please pull sound fixes for v6.15-rc1 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-fix-6.15-rc1

The topmost commit is 02dc9b9617e4d2b93676f0ea1de797e1da8e7c37

----------------------------------------------------------------

sound fixes for 6.15-rc1

A collection of device-specific fixes that have been gathered since
the previous PR.

- A few more HD-audio quirks and fixups
- A series of Qualcomm AudioReach fixes
- Various small fixes for ASoC rt5665, WSA, SOF and Cirrus.

----------------------------------------------------------------

Alexey Klimov (1):
      ASoC: qdsp6: q6asm-dai: fix q6asm_dai_compr_set_params error path

Andy Shevchenko (1):
      ALSA/hda: intel-sdw-acpi: Remove (explicitly) unused header

Christophe JAILLET (1):
      ASoC: codecs: rt5665: Fix some error handling paths in rt5665_probe()

Dan Carpenter (1):
      ASoC: sma1307: Fix error handling in sma1307_setting_loaded()

Henry Martin (1):
      ASoC: imx-card: Add NULL check in imx_card_probe()

Kailang Yang (1):
      ALSA: hda/realtek - Support mute led function for HP platform

Krzysztof Kozlowski (2):
      ASoC: codecs: wsa883x: Correct VI sense channel mask
      ASoC: codecs: wsa884x: Correct VI sense channel mask

Peter Ujfalusi (1):
      ASoC: SOF: hda/ptl: Move mic privacy change notification sending to a work

Richard Fitzgerald (1):
      firmware: cs_dsp: Ensure cs_dsp_load[_coeff]() returns 0 on success

Sharan Kumar M (1):
      ALSA: hda/realtek: Enable Mute LED on HP OMEN 16 Laptop xd000xx

Shenghao Ding (1):
      ALSA: hda/tas2781: Upgrade calibratd-data writing code to support Alpha and Beta dsp firmware

Srinivas Kandagatla (5):
      ASoC: q6apm-dai: schedule all available frames to avoid dsp under-runs
      ASoC: q6apm: add q6apm_get_hw_pointer helper
      ASoC: qdsp6: q6apm-dai: set 10 ms period and buffer alignment.
      ASoC: qdsp6: q6apm-dai: fix capture pipeline overruns.
      ASoC: q6apm-dai: make use of q6apm_get_hw_pointer

Takashi Iwai (2):
      ALSA: hda/realtek: Fix built-in mic breakage on ASUS VivoBook X515JA
      ALSA: hda/realtek: Fix built-in mic on another ASUS VivoBook model

---
 drivers/firmware/cirrus/cs_dsp.c |  2 ++
 sound/hda/intel-sdw-acpi.c       |  2 +-
 sound/pci/hda/patch_realtek.c    | 65 ++++++++++++++++++++++++++++++++++------
 sound/pci/hda/tas2781_hda_i2c.c  | 30 ++++++++++++-------
 sound/soc/codecs/rt5665.c        | 24 +++------------
 sound/soc/codecs/sma1307.c       | 11 ++-----
 sound/soc/codecs/wsa883x.c       |  2 +-
 sound/soc/codecs/wsa884x.c       |  2 +-
 sound/soc/fsl/imx-card.c         |  4 +++
 sound/soc/qcom/qdsp6/q6apm-dai.c | 60 ++++++++++++++++++++-----------------
 sound/soc/qcom/qdsp6/q6apm.c     | 18 ++++++++++-
 sound/soc/qcom/qdsp6/q6apm.h     |  3 ++
 sound/soc/qcom/qdsp6/q6asm-dai.c | 19 ++++++++----
 sound/soc/sof/intel/hda-dsp.c    |  8 +++++
 sound/soc/sof/intel/hda.c        |  4 +++
 sound/soc/sof/intel/hda.h        |  8 +++++
 sound/soc/sof/intel/ptl.c        | 33 +++++++++++++++++---
 17 files changed, 205 insertions(+), 90 deletions(-)

