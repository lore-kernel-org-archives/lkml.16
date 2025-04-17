Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421F7238D53
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 11:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744888611; cv=none; b=DeUhXDtmjvQPoLUaR4dMLcBxxtDje314GxlTgcq3j3oVUHESbmii0QeldBup1Qe/YWcqurbmGI0Wii4upoGtstrp66bnLCbZnM0aeorYOHiveCi4INxeUyBJqFD2H883ZHIJJ62txPRm5SanPwzOumVrQNmj1b5y2LNrAASiu8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744888611; c=relaxed/simple;
	bh=F8w/ZDS2nkOI75wDdKPnexYjMpSc59GF32Z6ZoUnxNg=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=Y6KHmPZlcVT0wjZkTJ4zjuwRKOpDKHr1uC+7CjXW+draK2USr5BRhv7FCvx0hvvCwb3ur+a3nQT3ZnkIivSsmu9p3sEmfL8hDNAoGLHGW0gELodX01KS0B9qxm8mO19EkMNifquCeRbcXgV7v1yC1LXtYFt7zV/FivKIgSvz3Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TiEU+US0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1bMq/iNW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TiEU+US0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1bMq/iNW; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TiEU+US0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1bMq/iNW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TiEU+US0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1bMq/iNW"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 548151F391;
	Thu, 17 Apr 2025 11:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744888608; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Y1tVHPHVoMIn93culRJCZCipp4hop9jS1mSJ9CFmsPQ=;
	b=TiEU+US066TPaDZjL1VnXZyiAmZwk5io9gKsSrKdRl8LY7puZw9fUz/EGbB1foUZU/rw+c
	Erf894t82WBpW8W0gLprrultYOV/rF6TlBTUbqNQoZUyvjkBdy2jcN26/LOA5XXF5ryP1n
	5ZFd8DXCieIsOO74FNJLyUn/UFVLx1c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744888608;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Y1tVHPHVoMIn93culRJCZCipp4hop9jS1mSJ9CFmsPQ=;
	b=1bMq/iNWG4d0bglcbqptIA8M5WhUdh/k12cNCkyNqvewlTdWZzT/aKz4tBkW5MIi5NWA60
	ARBUgamV5pPqTGDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=TiEU+US0;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="1bMq/iNW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744888608; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Y1tVHPHVoMIn93culRJCZCipp4hop9jS1mSJ9CFmsPQ=;
	b=TiEU+US066TPaDZjL1VnXZyiAmZwk5io9gKsSrKdRl8LY7puZw9fUz/EGbB1foUZU/rw+c
	Erf894t82WBpW8W0gLprrultYOV/rF6TlBTUbqNQoZUyvjkBdy2jcN26/LOA5XXF5ryP1n
	5ZFd8DXCieIsOO74FNJLyUn/UFVLx1c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744888608;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Y1tVHPHVoMIn93culRJCZCipp4hop9jS1mSJ9CFmsPQ=;
	b=1bMq/iNWG4d0bglcbqptIA8M5WhUdh/k12cNCkyNqvewlTdWZzT/aKz4tBkW5MIi5NWA60
	ARBUgamV5pPqTGDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2BBF01388F;
	Thu, 17 Apr 2025 11:16:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id l9d6CSDjAGgRGQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 17 Apr 2025 11:16:48 +0000
Date: Thu, 17 Apr 2025 13:16:47 +0200
Message-ID: <87sem7ujfk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 6.15-rc3
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 548151F391
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

Linus,

please pull sound fixes for v6.15-rc3 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.15-rc3

The topmost commit is 7338856257fc6ee0a06dddf1f0888f3cfc95dc60

----------------------------------------------------------------

sound fixes for 6.15-rc3

A collection of small fixes since the previous PR.  All are
device-specific like quirks, new IDs, and other safe (or rather
boring) changes.

----------------------------------------------------------------

Amadeusz S³awiñski (1):
      ASoC: Intel: avs: Constrain path based on BE capabilities

Brady Norander (1):
      ASoC: dwc: always enable/disable i2s irqs

Charles Keepax (1):
      ASoC: cs42l43: Reset clamp override on jack removal

Chen Ni (1):
      ALSA: hda/tas2781: Remove unnecessary NULL check before release_firmware()

Evgeny Pimenov (1):
      ASoC: qcom: Fix sc7280 lpass potential buffer overflow

Henry Martin (1):
      ASoC: Intel: avs: Fix null-ptr-deref in avs_component_probe()

Herve Codina (1):
      ASoC: fsl: fsl_qmc_audio: Reset audio data pointers on TRIGGER_START event

Kailang Yang (1):
      ALSA: hda/realtek - Fixed ASUS platform headset Mic issue

Kuninori Morimoto (1):
      ASoC: hdmi-codec: use RTD ID instead of DAI ID for ELD entry

Peter Ujfalusi (1):
      ASoC: Intel: sof_sdw: Add quirk for Asus Zenbook S16

Richard Fitzgerald (2):
      ALSA: hda/cirrus_scodec_test: Don't select dependencies
      firmware: cs_dsp: test_bin_error: Fix uninitialized data used as fw version

Shengjiu Wang (1):
      ASoC: fsl_asrc_dma: get codec or cpu dai from backend

Srinivas Kandagatla (4):
      ASoC: codecs:lpass-wsa-macro: Fix vi feedback rate
      ASoC: codecs:lpass-wsa-macro: Fix logic of enabling vi channels
      MAINTAINERS: use kernel.org alias
      mailmap: Add entry for Srinivas Kandagatla

Thorsten Blum (1):
      ALSA: azt2320: Replace deprecated strcpy() with strscpy()

Weidong Wang (1):
      ASoC: codecs: Add of_match_table for aw888081 driver

---
 .mailmap                                           |   2 +
 MAINTAINERS                                        |   8 +-
 .../firmware/cirrus/test/cs_dsp_mock_mem_maps.c    |  30 -----
 drivers/firmware/cirrus/test/cs_dsp_test_bin.c     |   2 +-
 .../firmware/cirrus/test/cs_dsp_test_bin_error.c   |   2 +-
 include/linux/firmware/cirrus/cs_dsp_test_utils.h  |   1 -
 sound/isa/azt2320.c                                |   4 +-
 sound/pci/hda/Kconfig                              |   4 +-
 sound/pci/hda/patch_realtek.c                      |  23 ++--
 sound/pci/hda/tas2781_hda_spi.c                    |   3 +-
 sound/soc/codecs/aw88081.c                         |  10 ++
 sound/soc/codecs/cs42l43-jack.c                    |   3 +
 sound/soc/codecs/hdmi-codec.c                      |  22 +++-
 sound/soc/codecs/lpass-wsa-macro.c                 | 139 ++++++++++++++-------
 sound/soc/dwc/dwc-i2s.c                            |  13 +-
 sound/soc/fsl/fsl_asrc_dma.c                       |  15 ++-
 sound/soc/fsl/fsl_qmc_audio.c                      |   3 +
 sound/soc/intel/avs/path.c                         |  72 +++++++++++
 sound/soc/intel/avs/path.h                         |   5 +
 sound/soc/intel/avs/pcm.c                          |  52 +++++++-
 sound/soc/intel/boards/sof_sdw.c                   |   1 +
 sound/soc/qcom/lpass.h                             |   3 +-
 22 files changed, 307 insertions(+), 110 deletions(-)

