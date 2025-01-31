Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EF7632;
	Fri, 31 Jan 2025 08:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738310720; cv=none; b=W9uqrFjTsv/Q13TGzS9ntDlGjvHyNkKvAJAbqBKU0UhzQocN8KgYiV58wDP82IXkz6juYKphOwwcu9t57r+jbGtVyFasDMn0GFKW0K9b01sd862nm3SnUSyiMfQ81CXsTnUO6LmaWc0XXTBfqAyuh+ycZGSGprlFKqOpM3C7VnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738310720; c=relaxed/simple;
	bh=EYHLURhEnaksHukl5dY820gV63R7b52I/AQ5PuFWOmA=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=bID3VfdG2PnXTUPTKru4EuPSQF0Udu41GDkPz/TqPLKx2DxItnAkcTYhd2XSQvkp+G+wA1nZSDaIbzGz3RwbXwCufsGxb7dfZryd+gYRtIBYZHUOG9JS01xa5OWfRk6HYJdOz/vURLZul2ijbs7jbK4PrKMKFYSuNC1wpGiU7bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GDrUMMBL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=p57IAoS4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GDrUMMBL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=p57IAoS4; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GDrUMMBL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="p57IAoS4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GDrUMMBL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="p57IAoS4"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 25DC52116E;
	Fri, 31 Jan 2025 08:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738310710; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=I6GXrmEtaNgAcAineQ53XUfGBGevujjMDqjtXOg2TwI=;
	b=GDrUMMBLllqVN7KIExpi3FmW8jn0MNUWJWcQY1z9vx9FWVLNiwj1sQ/ZnGL/uTjb5WYQFr
	6FCQPdGuo2cYGtxqKby0IW/GQgSytDFZYg0Of8mF/Que1iKDn0yNGTdrH0gTJjHi7n7mGm
	WlpjpdfLwTZ2P7KkEpY/Kfs4eWIBt6Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738310710;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=I6GXrmEtaNgAcAineQ53XUfGBGevujjMDqjtXOg2TwI=;
	b=p57IAoS43DxDbPBN3qsj1zTO0AWUyg8/vEAgHhUwYYd0nMKfhqLbqRFPC0Nf4tW7DW8M1/
	h/enVRiquXq/ziDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738310710; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=I6GXrmEtaNgAcAineQ53XUfGBGevujjMDqjtXOg2TwI=;
	b=GDrUMMBLllqVN7KIExpi3FmW8jn0MNUWJWcQY1z9vx9FWVLNiwj1sQ/ZnGL/uTjb5WYQFr
	6FCQPdGuo2cYGtxqKby0IW/GQgSytDFZYg0Of8mF/Que1iKDn0yNGTdrH0gTJjHi7n7mGm
	WlpjpdfLwTZ2P7KkEpY/Kfs4eWIBt6Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738310710;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=I6GXrmEtaNgAcAineQ53XUfGBGevujjMDqjtXOg2TwI=;
	b=p57IAoS43DxDbPBN3qsj1zTO0AWUyg8/vEAgHhUwYYd0nMKfhqLbqRFPC0Nf4tW7DW8M1/
	h/enVRiquXq/ziDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E2928133A6;
	Fri, 31 Jan 2025 08:05:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Sh4LNjWEnGc4BAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 31 Jan 2025 08:05:09 +0000
Date: Fri, 31 Jan 2025 09:05:09 +0100
Message-ID: <87r04j4de2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 6.14-rc1
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

please pull sound fixes for v6.14-rc1 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-fix-6.14-rc1

The topmost commit is 8c2fa44132e8cd1b05c77a705adb8d1f5a5daf3f

----------------------------------------------------------------

sound fixes for 6.14-rc1

Here is a collection of fixes that have been gathered since the
previous PR.  All about device-specific fixes and quirks, and most
of them are pretty small and trivial.

----------------------------------------------------------------

Alexander Boehm (1):
      ASoC: SOF: imx8m: add SAI2,5,6,7

Arnd Bergmann (1):
      ASoC: fsl_asrc_m2m: select CONFIG_DMA_SHARED_BUFFER

Chenyuan Yang (1):
      ALSA: pcm: use new array-copying-wrapper

Claudiu Beznea (1):
      ASoC: da7213: Initialize the mutex

Daniel Baluta (2):
      ASoC: SOF: imx: Add mach entry to select cs42888 topology
      ASoC: amd: acp: Fix possible deadlock

Detlev Casanova (1):
      ASoC: rockchip: i2s_tdm: Re-add the set_sysclk callback

Fabio Estevam (1):
      ASoC: dt-bindings: ti,pcm1681: Fix the binding title

Geert Uytterhoeven (2):
      ASoC: renesas: SND_SIU_MIGOR should depend on DMADEVICES
      firmware: cs_dsp: FW_CS_DSP_KUNIT_TEST should not select REGMAP

Hans de Goede (1):
      ASoC: Intel: bytcr_rt5640: Add DMI quirk for Vexia Edu Atla 10 tablet 5V

Iuliana Prodan (3):
      dt-bindings: arm: imx: Add board revisions for i.MX8MP, i.MX8QM and i.MX8QXP
      ASoC: SOF: imx8: Add entries for new 8QM and 8QXP revisions
      ASoC: SOF: imx8m: Add entry for new 8M Plus revision

Ivaylo Dimitrov (1):
      ASoC: audio-graph-card2: use correct endpoint when getting link parameters

Kuan-Wei Chiu (1):
      ALSA: hda: Fix headset detection failure due to unstable sort

Lianqin Hu (1):
      ALSA: usb-audio: Add delay quirk for iBasso DC07 Pro

Luoxi Li (1):
      ASoC: use to_platform_device() instead of container_of()

Mario Limonciello (1):
      ASoC: acp: Support microphone from Lenovo Go S

Ondrej Jirman (1):
      ASoC: codec: es8316: "DAC Soft Ramp Rate" is just a 2 bit control

Shengjiu Wang (2):
      ASoC: fsl_asrc_m2m: only handle pairs for m2m in the suspend
      ASoC: fsl_asrc_m2m: return error value in asrc_m2m_device_run()

Takashi Iwai (2):
      ALSA: hda/realtek: Fix quirk matching for Legion Pro 7
      ALSA: hda/realtek: Workaround for resume on Dell Venue 11 Pro 7130

Zhang Yi (1):
      ASoC: codecs: ES8326: Improved PSRR

---
 Documentation/devicetree/bindings/arm/fsl.yaml     |  3 ++
 .../devicetree/bindings/sound/ti,pcm1681.yaml      |  2 +-
 drivers/firmware/cirrus/Kconfig                    |  6 +--
 sound/core/pcm_native.c                            |  2 +-
 sound/pci/hda/hda_auto_parser.c                    |  8 ++-
 sound/pci/hda/hda_auto_parser.h                    |  1 +
 sound/pci/hda/patch_realtek.c                      | 18 ++++++-
 sound/soc/amd/acp/acp-i2s.c                        |  1 +
 sound/soc/amd/yc/acp6x-mach.c                      | 28 ++++++++++
 sound/soc/codecs/da7213.c                          |  2 +
 sound/soc/codecs/es8316.c                          |  2 +-
 sound/soc/codecs/es8326.c                          |  4 +-
 sound/soc/codecs/rt5514.c                          |  3 +-
 sound/soc/fsl/Kconfig                              |  1 +
 sound/soc/fsl/fsl_asrc_m2m.c                       | 16 +++---
 sound/soc/generic/audio-graph-card2.c              | 62 ++++++++++------------
 sound/soc/intel/boards/bytcr_rt5640.c              | 17 +++++-
 sound/soc/renesas/Kconfig                          |  2 +-
 sound/soc/rockchip/rockchip_i2s_tdm.c              | 31 ++++++++++-
 sound/soc/sof/imx/imx8.c                           | 24 ++++++++-
 sound/soc/sof/imx/imx8m.c                          | 52 +++++++++++++++++-
 sound/soc/sof/imx/imx8ulp.c                        |  3 +-
 sound/soc/sof/intel/bdw.c                          |  3 +-
 sound/soc/sof/intel/byt.c                          |  3 +-
 sound/soc/sof/mediatek/mt8186/mt8186.c             |  2 +-
 sound/soc/sof/mediatek/mt8195/mt8195.c             |  6 +--
 sound/usb/quirks.c                                 |  2 +
 27 files changed, 233 insertions(+), 71 deletions(-)

