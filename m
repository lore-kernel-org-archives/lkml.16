Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C328E28C01C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 12:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750422252; cv=none; b=kI5vONamuJRE97n4ekVg2OzyUmGg7ShSm54OsUw/UUt1x934F+YTcujTacBIB0hdy5nB14nvIc5ua+kkf8l+8CaN7TD3QPslvd7r4QpiOu67Fv5CH/qPxRJSxrEOTGlwMqPoUXJVVZwUlj1pi4LMs47WHVUEVPVtIAEii4QddOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750422252; c=relaxed/simple;
	bh=RXzXQ8TqTmoYVGDEalpbzik0jifSJ3y2hzRDdGogep4=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=kGPlCRfs47ZUL8LISbDd7Bwta7dqxsEoHyEb1ecxs+VfYkZwKQKHkwsm/DSk5S3kKmQmFXARF6IB/HFGnZBlkN48QDGp/ywXcKMQtZqAAgVIDLhBZZ/CUOEZPCSoFBeIl1f9UWRFVYJKOzuWgStLqzD6hfEt4Xt9IxX2z4OmxSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Krq+s+QP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6KuqpHGB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=G4j6zbd7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=S8uXG4Nf; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Krq+s+QP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6KuqpHGB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="G4j6zbd7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="S8uXG4Nf"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CACC11F38D;
	Fri, 20 Jun 2025 12:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750422249; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=JvhMaG3LPeg39/7bULRqdItTnUSq1YO2/hpHdIL5NGU=;
	b=Krq+s+QP/ElAMEg4Ai+ZYyZPwSikLf1Q2aQWubhbBRumH44mPlZhDUhvfJMFMDa2+Ds3e6
	5YmEo3ywDZptoZePGeDt2pObqYscpJNBocA6YDqJyqhGfyTyxOLYcEcSDzDzfWPRHfKQTC
	VY054nRlW2/9LSKajnjhEBK5VMykVo0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750422249;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=JvhMaG3LPeg39/7bULRqdItTnUSq1YO2/hpHdIL5NGU=;
	b=6KuqpHGBH/lfgkGhG/p9t5EaCuJb+aE0t+03914LKIjqpU3WFOz3a2rfu5XInLIFUoUrng
	cg5kzA1Gb88UD0AQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=G4j6zbd7;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=S8uXG4Nf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750422248; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=JvhMaG3LPeg39/7bULRqdItTnUSq1YO2/hpHdIL5NGU=;
	b=G4j6zbd7aOx4d14+ykgCqG++H64aGrNKCfuJd9ELqihWn7+8gaeeU5ZvWrJrW5B9Xc7vTq
	Pq50RN2Q1Usl5BvuuKLKY3rhb0clc+tLO/yRP8lXVa4IT85kL1/Vs/mKF1/Mhcvrpk+Ym/
	pzyWlcr8C3iULknJD9OSXcrbObi8RiI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750422248;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=JvhMaG3LPeg39/7bULRqdItTnUSq1YO2/hpHdIL5NGU=;
	b=S8uXG4NfJKPKsGq14gpFNYtZJxrSPS7N8cyoDjla+i6dhrwXvB2HDabRQkORK23zNP6ADF
	4pKEol8BOV3Pa1BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9B16B136BA;
	Fri, 20 Jun 2025 12:24:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id n5bcI+hSVWj4JgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 20 Jun 2025 12:24:08 +0000
Date: Fri, 20 Jun 2025 14:24:08 +0200
Message-ID: <877c16wqhj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 6.16-rc3
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: CACC11F38D
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51
X-Spam-Level: 

Linus,

please pull sound fixes for v6.16-rc3 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.16-rc3

The topmost commit is 33bdee12822d240caaa01aeac231eac42182fd64

----------------------------------------------------------------

sound fixes for 6.16-rc3

A collection of small fixes.
All changes are device-specific at this time.

- Fixes for Cirrus codecs with SoundWire, including firmware name
  updates
- Fix for i.MX8 SoC DSP
- Usual HD-audio, USB-audio, and ASoC AMD quirks
- Fixes for legendary SoundBlaster AWE32 ISA device (a real one, we
  still got a bug report after 25 years)
- Minor build fixes

----------------------------------------------------------------

Brahmajit Das (1):
      ALSA: ctxfi: Replace deprecated strcpy() with strscpy()

Chris Chiu (1):
      ALSA: hda/realtek: Fix built-in mic on ASUS VivoBook X513EA

Edip Hazuri (1):
      ALSA: hda/realtek - Add mute LED support for HP Victus 16-s1xxx and HP Victus 15-fa1xxx

Edson Juliano Drosdeck (1):
      ALSA: hda/realtek: Enable headset Mic on Positivo P15X

Gabriel Santese (1):
      ASoC: amd: yc: Add quirk for MSI Bravo 17 D7VF internal mic

Harshit Mogalapalli (1):
      ASoC: cs48l32: Fix a signedness bug in cs48l32_hw_params()

Huacai Chen (1):
      ASoC: loongson: Fix build warnings about export.h

Jonathan Lane (1):
      ALSA: hda/realtek: enable headset mic on Latitude 5420 Rugged

Laurentiu Mihalcea (1):
      ASoC: SOF: imx8: add core shutdown operation for imx8/imx8x

Peter Ujfalusi (1):
      ASoC: Intel: sof-function-topology-lib: Print out the unsupported dmic count

Raven Black (1):
      ASoC: amd: yc: update quirk data for HP Victus

Richard Fitzgerald (5):
      ALSA: hda/realtek: Add quirk for Asus GU605C
      ASoC: cs35l56: Use SoundWire address as firmware name suffix for new silicon
      ASoC: cs35l56: Use SoundWire address as alternate firmware suffix on L56 B0
      ASoC: doc: cs35l56: Update to add new SoundWire firmware filename suffix
      ASoC: doc: cs35l56: Add CS35L63 to the list of supported devices

Simon Trimmer (1):
      ALSA: hda/realtek: Add quirk for Asus GA605K

Sven Peter (1):
      ASoC: apple: mca: Drop default ARCH_APPLE in Kconfig

Takashi Iwai (3):
      ALSA: hda/intel: Add Thinkpad E15 to PM deny list
      ALSA: sb: Don't allow changing the DMA mode during operations
      ALSA: sb: Force to disable DMAs once when DMA mode is changed

Thorsten Blum (1):
      ASoC: sdw_utils: Fix potential NULL pointer deref in is_sdca_endpoint_present()

Zhang Yi (1):
      ASoC: codecs: ES8326: Modify initialization configuration

wangdicheng (1):
      ALSA: usb-audio: Rename ALSA kcontrol PCM and PCM1 for the KTMicro sound card

---
 Documentation/sound/codecs/cs35l56.rst             | 24 ++++++--
 sound/isa/sb/sb16_main.c                           |  7 +++
 sound/pci/ctxfi/xfi.c                              |  4 +-
 sound/pci/hda/hda_intel.c                          |  2 +
 sound/pci/hda/patch_realtek.c                      | 30 +++++++++
 sound/soc/amd/yc/acp6x-mach.c                      | 14 +++++
 sound/soc/apple/Kconfig                            |  1 -
 sound/soc/codecs/cs35l56-sdw.c                     | 18 +++---
 sound/soc/codecs/cs35l56.c                         | 72 +++++++++++++++++++---
 sound/soc/codecs/cs35l56.h                         |  3 +
 sound/soc/codecs/cs48l32.c                         |  4 ++
 sound/soc/codecs/es8326.c                          |  3 +-
 sound/soc/codecs/wm_adsp.c                         | 27 +++++---
 sound/soc/codecs/wm_adsp.h                         |  2 +
 sound/soc/intel/common/sof-function-topology-lib.c |  3 +-
 sound/soc/loongson/loongson_i2s.c                  |  1 +
 sound/soc/sdw_utils/soc_sdw_utils.c                |  2 +
 sound/soc/sof/imx/imx8.c                           | 15 +++++
 sound/usb/mixer_maps.c                             | 12 ++++
 19 files changed, 207 insertions(+), 37 deletions(-)

