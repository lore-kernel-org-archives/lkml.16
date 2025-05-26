Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C605B15E5DC
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 08:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748249740; cv=none; b=ZBaHL8AfokCdhvPRqLohUswdec2apip9NXsiLMku7DjrcCHu+IodBg81iQXzyrjFVIWN7nCR6rEo9RK7A+iTAopm9eJ2gr+fAlfLc2VadJfKM76iwkD50bZlIynjmbpiadB6Chy4+RIdsMfT9yZU6lBgodQlhzr9okcVQwYQPkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748249740; c=relaxed/simple;
	bh=XkZFjPUE3xl4c1Hj+xNWgqh3pFE9WZe41a+EkBr5wik=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=eAwDEfCW+rkPIH0rDDaQxozaA9YRZoJ+ZKeDcjnPIwR9t+2Brr6yRRe6DunjcJYLfLo63A94ZSAgUmvuUCnMT7PeZ3r4rnBQbvAt6lIRHiPGfkYeKdLR35ofGkfIe1BQVuXoezUDsQng8LOtAtWnZnqvuC0SD0qWNSAxOjo79Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HizNHZRO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=n+aICLsm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=F7Z+c9Hq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=b6S55xBw; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HizNHZRO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="n+aICLsm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="F7Z+c9Hq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="b6S55xBw"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E2C3F1F82B;
	Mon, 26 May 2025 08:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748249734; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=k61xzZUoss+jUaiduT7oOuHqOHnLweRydYwIK4ac1D8=;
	b=HizNHZRO2vFln/BXGs9CdMNL0OCEtUA0EVj/s0GFXL01NcnjIYpCrF8BdzUo08NFxpb9Yg
	dCWHsU9eKwaz01lbQBGPQIUHLDCllCnZ4h4ElCVsUflqN7Sjxu55EmsVMyTZENDNTflqcq
	u0zLgEqnvNtaHVVf5APWkGR7uDuATXg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748249734;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=k61xzZUoss+jUaiduT7oOuHqOHnLweRydYwIK4ac1D8=;
	b=n+aICLsm/CajDt8opj80Ecw58DZMmAE7yTHsSAYgJG10WDhqxItqB8xB18txbsXqTlVtxy
	36sD0snPJ/8N36Dw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=F7Z+c9Hq;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=b6S55xBw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748249733; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=k61xzZUoss+jUaiduT7oOuHqOHnLweRydYwIK4ac1D8=;
	b=F7Z+c9HqyZnKkybB/6VE9YxCCE/SkuPSttKyqILjX8oIcVagKjogK6RdthZJQ30cCZrG2S
	Ovo48id997MntIhouWXO47ClqrIxqOcYOk7APnh982wgXZDKIJoDt7AEqPhVNU2hLM6OVy
	+3b0Wfoe9K4WugPYmg7+WImS10b94+8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748249733;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=k61xzZUoss+jUaiduT7oOuHqOHnLweRydYwIK4ac1D8=;
	b=b6S55xBwxTDjawheRPN6YyS028BJn850o4EVTX5OWlP6aYP04c2FnftBFrWf4vb/7nvwli
	rWZrY1RY0a7+alAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AC2A413964;
	Mon, 26 May 2025 08:55:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id foDQKIUsNGilVAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 26 May 2025 08:55:33 +0000
Date: Mon, 26 May 2025 10:55:33 +0200
Message-ID: <87h617rbsq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound updates for 6.16-rc1
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Bar: /
X-Spam-Flag: NO
X-Spam-Score: -0.51
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: E2C3F1F82B
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.51 / 50.00];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]

Linus,

please pull sound updates for v6.16-rc1 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.16-rc1

The topmost commit is 534e9cf3782f1bd6adf0bd7d17ff414ea12a6bf2

----------------------------------------------------------------

sound updates for 6.16-rc1

We've received a lot of activities in this cycle, mostly about leaf
driver codes rather than the core part, but with a good mixture of
code cleanups and new driver additions.  Below are some highlights:

* ASoC:
- Support for automatically enumerating DAIs from standards conforming
  SoundWire SDCA devices; not much used as of this writing, rather for
  future implementations
- Conversion of quite a few drivers to newer GPIO APIs
- Continued cleanups and helper usages in allover places
- Support for a wider range of Intel AVS platforms
- Support for AMD ACP 7.x platforms, Cirrus Logic CS35L63 and CS48L32
  Everest Semiconductor ES8375 and ES8389, Longsoon-1 AC'97
  controllers, nVidia Tegra264, Richtek ALC203 and RT9123 and Rockchip
  SAI controllers

* HD-audio:
- Lots of cleanups of TAS2781 codec drivers
- A new HD-audio control bound via ACPI for Nvidia
- Support for Tegra264, Intel WCL, usual new codec quirks

* USB-audio:
- Fix a race at removal of MIDI device
- Pioneer DJM-V10 support, Scarlett2 driver cleanups

* Misc:
- Cleanups of deprecated PCI functions
- Removal of unused / dead function codes

----------------------------------------------------------------

Amadeusz S³awiñski (27):
      ASoC: Intel: avs: Add boards definitions for FCL platform
      ASoC: Intel: avs: boards: Add Kconfig option for obsolete card names
      ASoC: Intel: avs: Use topology information for endpoint numbers
      ASoC: Intel: avs: boards: Change da7219 card name
      ASoC: Intel: avs: boards: Change DMIC card name
      ASoC: Intel: avs: boards: Change es8336 card name
      ASoC: Intel: avs: boards: Change hdaudio card name
      ASoC: Intel: avs: boards: Change sspX-loopback card name
      ASoC: Intel: avs: boards: Change max98357a card name
      ASoC: Intel: avs: boards: Change max98373 card name
      ASoC: Intel: avs: boards: Change max98927 card name
      ASoC: Intel: avs: boards: Change nau8825 card name
      ASoC: Intel: avs: boards: Change pcm3168a card name
      ASoC: Intel: avs: boards: Change probe card name
      ASoC: Intel: avs: boards: Change rt274 card name
      ASoC: Intel: avs: boards: Change rt286 card name
      ASoC: Intel: avs: boards: Change rt298 card name
      ASoC: Intel: avs: boards: Change rt5514 card name
      ASoC: Intel: avs: boards: Change rt5663 card name
      ASoC: Intel: avs: boards: Change rt5682 card name
      ASoC: Intel: avs: boards: Change ssm4567 card name
      ASoC: Intel: avs: Rename AVS_CHANNELS_MAX define
      ASoC: Intel: avs: Allow to specify custom configurations with i2s_test
      ASoC: Intel: avs: Assign unique ID to platform devices
      ASoC: Intel: avs: Iterate over correct number of TDMs
      ASoC: Intel: avs: Support 16 TDMs in dynamic assignment
      ASoC: Intel: avs: Fix NULL pointer dereference

André Apitzsch (1):
      ASoC: wm8998: Add Kconfig prompt

Arnd Bergmann (2):
      ALSA: hda/tas2781: select CONFIG_CRC8 for SND_HDA_SCODEC_TAS2781_I2C
      ALSA: hda/cs35l41_hda: select FW_CS_DSP

Bard Liao (14):
      ASoC: SOF: topology: allocate string for tuples
      ASoC: SOF: topology: don't convert error code
      ASoC: soc-acpi: add get_function_tplg_files ops
      ASoC: SOF: topology: load multiple topologies
      ASoC: Intel: add sof_sdw_get_tplg_files ops
      ASoC: Intel: soc-acpi-intel-lnl-match: set get_function_tplg_files ops
      ASoC: Intel: soc-acpi-intel-arl-match: set get_function_tplg_files ops
      ASoC: Intel: soc-acpi-intel-ptl-match: add get_function_tplg_files ops
      ASoC: Intel: soc-acpi-intel-mtl-match: add get_function_tplg_files ops
      ASoC: sdw_utils: split asoc_sdw_get_codec_name
      ASoC: soc_sdw_utils: skip the endpoint that doesn't present
      ASoC: SOF: add disable_function_topology flag
      ASoC: SOF: set disable_function_topology if override_tplg_filename is set
      ASoC: SOF: add disable_function_topology module parameter

Bartosz Golaszewski (12):
      ASoC: soc-ac97: use new GPIO line value setter callbacks
      ASoC: ti: davinci-mcasp:: use new GPIO line value setter callbacks
      ASoC: codecs: wm8962: use new GPIO line value setter callbacks
      ASoC: codecs: wm5100: use new GPIO line value setter callbacks
      ASoC: codecs: rt5677: use new GPIO line value setter callbacks
      ASoC: codecs: wm8996: use new GPIO line value setter callbacks
      ASoC: codecs: tlv320adc3xxx: use new GPIO line value setter callbacks
      ASoC: codecs: idt821034: use new GPIO line value setter callbacks
      ASoC: codecs: peb2466: use new GPIO line value setter callbacks
      ASoC: codecs: wm8903: use new GPIO line value setter callbacks
      ASoC: codecs: zl38060: use new GPIO line value setter callbacks
      ALSA: hda: cirrus_scodec_test: use new GPIO line value setter callbacks

Brady Norander (1):
      ASoC: amd: use new ACP dev names for DAI links

Cezary Rojewski (14):
      ASoC: core: Complete support for card rebinding
      ASoC: Intel: avs: Permit deferred card registration
      ALSA: hda: Allow to fetch hlink by ID
      ASoC: Intel: avs: Ignore Vendor-space manipulation for ACE
      ASoC: Intel: avs: Read HW capabilities when possible
      ASoC: Intel: avs: Relocate DSP status registers
      ASoC: Intel: avs: PTL-based platforms support
      ASoC: Intel: avs: PCM operations for LNL-based platforms
      ASoC: Intel: avs: Dynamically assign ops for non-HDAudio DAIs
      ASoC: Intel: avs: Conditionally add DMA config when creating Copier
      ALSA: hda: Select avs-driver by default on FCL
      lib/string_helpers: Introduce parse_int_array()
      ALSA: hda: Allow for 16 channels configuration
      ASoC: Intel: avs: Allow for 16 channels configuration

Chancel Liu (2):
      ASoC: fsl_rpmsg: Configure CPU DAI for card that sits on rpmsg-micfil-channel
      ASoC: fsl_rpmsg: Allocate a smaller buffer size for capture stream

Charles Keepax (9):
      ASoC: sdw_utils: Remove num_platforms from simple DAI helper
      ASoC: Intel: sof_sdw: Avoid NULL check fail when re-probing
      ASoC: SDCA: Fix minor typo
      ASoC: SDCA: Remove regmap module macros
      ASoC: SDCA: Move allocation of PDE delays array
      ASoC: dapm: Add component level pin switches
      ASoC: SDCA: Create DAPM widgets and routes from DisCo
      ASoC: SDCA: Create ALSA controls from DisCo
      ASoC: SDCA: Create DAI drivers from DisCo

Chen Ni (10):
      ASoC: sun8i-codec: Remove unnecessary NULL check before clk_prepare_enable/clk_disable_unprepare
      ASoC: sta32x: Remove unnecessary NULL check before clk_disable_unprepare()
      ASoC: tas2781-fmwlib: Remove unnecessary NULL check before release_firmware()
      ASoC: pcm6240: Remove unnecessary NULL check before release_firmware()
      ASoC: wm_adsp: Remove unnecessary NULL check before release_firmware()
      ASoC: tas2781-i2c: Remove unnecessary NULL check before release_firmware()
      ASoC: ak4458: Remove useless return variable
      ASoC: fsl_rpmsg: Remove useless return variable
      ALSA: scarlett2: Use USB API functions rather than constants
      ALSA: usb: fcp: Use USB API functions rather than constants

Chen-Yu Tsai (5):
      ALSA: pcm: Make snd_pcm_lib_malloc_pages() debug message say "allocate"
      ASoC: mediatek: mt8183-afe-pcm: Shorten memif_data table using macros
      ASoC: mediatek: mt8183-afe-pcm: Shorten irq_data table using macros
      ASoC: mediatek: mt8183-afe-pcm: shorten mt8183_is_volatile_reg()
      ASoC: soc-utils: Check string pointer validity in snd_soc_dlc_is_dummy()

ChiYuan Huang (5):
      ASoC: dt-bindings: Add bindings for Richtek rt9123
      ASoC: codecs: Add support for Richtek rt9123
      ASoC: dt-bindings: Add bindings for Richtek rt9123p
      ASoC: codecs: Add support for Richtek rt9123p
      ASoC: codecs: rt9123: Fix sparse cast warning

Colin Ian King (3):
      ASoC: cs48l32: Fix spelling mistake "exceeeds" -> "exceeds"
      ASoC: rt712-sdca: remove redundant else path of if statement
      ASoC: rt712-sdca: remove redundant else path of if statement

Cristian Ciocaltea (1):
      ASoC: amd: acp: Drop superfluous assignment in acp_sof_probe()

Daniel Baluta (1):
      ASoC: SOF: imx8m: Use reset controller API to control the DSP

Daniel Dadap (2):
      ALSA: hda - Add new driver for HDA controllers listed via ACPI
      ALSA: hda/tegra: Switch to two-argument strscpy()

Dr. David Alan Gilbert (11):
      ASoC: codecs: Remove unused rt566[58]_sel_asrc_clk_src
      ALSA: pcm: Remove unused snd_pcm_rate_range_to_bits
      ALSA: pcm: Remove unused snd_dmaengine_pcm_open_request_chan
      ALSA: seq: Remove unused snd_seq_queue_client_leave_cells
      ALSA: core: Remove unused snd_device_get_state
      ALSA: core: Remove unused snd_jack_set_parent
      ALSA: hda: Remove unused snd_hda_add_nid
      ALSA: hda: Remove unused snd_hdac_stream_get_spbmaxfifo
      ALSA: gus: Remove deadcode
      ASoC: Intel: atom: Remove unused functions
      ALSA: msnd: Remove midi code

Franti¹ek Kuèera (2):
      ALSA: usb-audio: Add Pioneer DJ DJM-V10 support
      ALSA: usb-audio: Rename Pioneer mixer channel controls

Greg Kroah-Hartman (1):
      ALSA: core: fix up bus match const issues.

Hector Martin (3):
      ASoC: tas2770: Power cycle amp on ISENSE/VSENSE change
      ASoC: tas2770: Support setting the PDM TX slot
      ASoC: tas2764: Enable main IRQs

Helen Koike (1):
      ASoC: Intel: Remove unused SND_SOC_INTEL_DA7219_MAX98357A_GENERIC

I Hsin Cheng (1):
      ASoC: intel/sdw_utils: Assign initial value in asoc_sdw_rt_amp_spk_rtd_init()

James Calligeros (2):
      ASoC: tas2770: expose die temp to hwmon
      ASoC: tas2764: expose die temp to hwmon

Jaroslav Kysela (1):
      firmware: cs_dsp: Fix OOB memory read access in KUnit test

Johan Hovold (2):
      ASoC: codecs: wcd938x: fix mux error handling
      ASoC: codecs: wcd938x: drop unnecessary mux flag assignment

Julien Massot (6):
      ASoC: mediatek: mt8195: Move rt5682 specific dapm routes
      ASoC: mediatek: mt8195: Set ETDM1/2 IN/OUT to COMP_DUMMY()
      ASoC: mediatek: mt8195: Add mt8195-mt6359 card
      ASoC: dt-bindings: mt8195: add compatible mt8195_mt6359
      ASoC: dt-bindings: mt8195: add missing audio routing and link-name
      ASoC: SOF: topology: Fix null pointer dereference

Kai Vehmanen (1):
      ALSA: hda: add HDMI codec ID for Intel WCL

Kees Cook (1):
      ASoC: SOF: ipc4-pcm: Adjust pipeline_list->pipelines allocation type

Keguang Zhang (4):
      ASoC: dt-bindings: Add Loongson-1 AC97 Controller
      ASoC: dt-bindings: Add Realtek ALC203 Codec
      ASoC: loongson: Add Loongson-1 AC97 Driver
      ASoC: ac97: Add DT support

Konrad Dybcio (1):
      ASoC: q6apm-lpass-dais: Print APM port id in decimal on enable error

Krzysztof Kozlowski (4):
      ASoC: dt-bindings: maxim,max98925: Fix include placement in DTS example
      ASoC: codecs: wsa88xx/wcd938x: Drop kerneldoc marker from inner comment
      ASoC: codecs: tas2764: Fix Wvoid-pointer-to-enum-cast warning
      ASoC: dt-bindings: mediatek: Simplify mediatek,clk-provider

Kuninori Morimoto (32):
      ASoC: rsnd: use snd_pcm_direction_name()
      ASoC: simple-card-utils: fixup dlc->xxx handling for error case
      spi: sh-msiof: use dev in sh_msiof_spi_probe()
      spi: sh-msiof: ignore driver probing if it was MSIOF Sound
      ASoC: fsl: don't set link->platform if not needed
      dt-bindings: renesas,sh-msiof: Add MSIOF I2S Sound support
      ASoC: renesas: rsnd: allow to use ADG as standalone
      ASoC: renesas: rsnd: care BRGA/BRGB select in rsnd_adg_clk_enable()
      ASoC: renesas: rsnd: enable to use "adg" clock
      ASoC: renesas: add MSIOF sound support
      ASoC: soc-utils: add snd_soc_dlc_is_dummy()
      ASoC: mediatek: mt8188: use snd_soc_dlc_is_dummy()
      ASoC: mediatek: mt8195: use snd_soc_dlc_is_dummy()
      ALSA: sh: use snd_kcontrol_chip()
      ALSA: i2c: use snd_kcontrol_chip()
      ALSA: core: use snd_kcontrol_chip()
      ALSA: virtio: use snd_kcontrol_chip()
      ALSA: pci: hda: use snd_kcontrol_chip()
      ALSA: usb: midi: use snd_kcontrol_chip()
      ALSA: usb: mixer: use snd_kcontrol_chip()
      ALSA: pci: au88x0: use snd_kcontrol_chip()
      ALSA: pci: asihpi: use snd_kcontrol_chip()
      ALSA: pci: ali5451: use snd_kcontrol_chip()
      ALSA: usb: mixer_quirks: use snd_kcontrol_chip()
      ALSA: usb: mixer_us16x08: use snd_kcontrol_chip()
      ASoC: soc.h: remove snd_soc_disconnect_sync()
      ASoC: soc.h: remove unnecessary definitions
      ALSA: isa/gus: remove snd_gf1_lfo_xxx()
      ALSA: wavefront: remove snd_wavefront_xxx()
      ASoC: soc-core: merge snd_soc_unregister_component() and snd_soc_unregister_component_by_driver()
      ASoC: dt-bindings: audio-graph-card2: add missing mic-det-gpios
      ASoC: dt-bindings: audio-graph-card2: reference audio-graph routing property

Mac Chiang (2):
      ASoC: Intel: soc-acpi-intel-lnl/ptl-match: Simplify variable name
      ASoC: Intel: soc-acpi-intel-ptl-match: Add rt713_vb_l3_rt1320_l3 support

Martin Blumenstingl (2):
      ASoC: hdmi-codec: wire up the .prepare callback also for SPDIF DAI ops
      ASoC: meson: meson-card-utils: use of_property_present() for DT parsing

Martin Povi¹er (4):
      ASoC: tas2764: Reinit cache on part reset
      ASoC: tas2764: Raise regmap range maximum
      ASoC: tas2764: Apply Apple quirks
      ASoC: apple: mca: Constrain channels according to TDM mask

Michael Sikora (1):
      ASoC: adau7118: Allow dsp_a mode

Mohammad Rafi Shaik (2):
      ASoC: dt-bindings: qcom,sm8250: Add QCS9100 and QCS9075 sound card
      ASoC: qcom: sc8280xp: Add sound card support for QCS9100 and QCS9075

Mohan Kumar D (1):
      ALSA: hda/tegra: Add Tegra264 support

Nathan Chancellor (1):
      ASoC: cs48l32: Use modern PM_OPS

Naveen Manohar (2):
      ASoC: Intel: soc-acpi-intel-ptl-match: Sort ACPI link/machine tables
      ASoC: Intel: sof_sdw: Add support for wclrvp & ocelot in WCL platform

Nicolas Frattaroli (3):
      ASoC: test-component: add set_tdm_slot stub implementation
      ASoC: dt-bindings: add schema for rockchip SAI controllers
      ASoC: rockchip: add Serial Audio Interface (SAI) driver

Nishanth Menon (1):
      ASoC: tlv320aic3x: Use dev_err_probe

Peng Fan (19):
      ASoC: codec: wcd939x: Convert to GPIO descriptors
      ASoC: codec: wcd938x: Convert to GPIO descriptors
      ASoC: codec: wcd9335: Convert to GPIO descriptors
      ASoC: codec: ak5386: Convert to GPIO descriptors
      ASoC: codec: tpa6130a2: Sort headers alphabetically
      ASoC: codec: tpa6130a2: Remove tpa6130a2_platform_data
      ASoC: codec: tpa6130a2: Convert to GPIO descriptors
      ASoC: codec: twl4030: Sort headers alphabetically
      ASoC: codec: twl4030: Convert to GPIO descriptors
      ASoC: codec: sma1307: Remove including of_gpio.h
      ASoC: codec: cs42l56: Sort headers alphabetically
      ASoC: codec: cs42l56: Drop cs42l56.h
      ASoC: codec: cs42l56: Convert to GPIO descriptors
      ASoC: codec: cs42l73: Sort headers alphabetically
      ASoC: codec: cs42l73: Drop cs42l73.h
      ASoC: codec: cs42l73: Convert to GPIO descriptors
      ASoC: codec: cs42l52: Sort headers alphabetically
      ASoC: codec: cs42l52: Drop cs42l52.h
      ASoC: codec: cs42l52: Convert to GPIO descriptors

Peter Ujfalusi (5):
      ALSA: hda: intel-nhlt: Print errors in intel_nhlt_ssp_device_type()
      PCI: Add Intel Wildcat Lake audio Device ID
      ASoC: SOF: Intel: add initial support for WCL
      ALSA: hda: intel-dsp-config: Add WCL support
      ALSA: hda: hda-intel: add Wildcat Lake support

Philipp Stanner (44):
      ASoC: loongson: Replace deprecated PCI functions
      ALSA: ad1889: Replace deprecated PCI functions
      ALSA: atiixp: Replace deprecated PCI functions
      ALSA: au88x0: Replace deprecated PCI functions
      ALSA: aw2: Replace deprecated PCI functions
      ALSA: bt87x: Replace deprecated PCI functions
      ALSA: cs4281: Replace deprecated PCI functions
      ALSA: hda_intel: Replace deprecated PCI functions
      ALSA: cs5530: Replace deprecated PCI functions
      ALSA: lola: Replace deprecated PCI functions
      ALSA: hdspm: Replace deprecated PCI functions
      ASoC: loongson: Replace deprecated PCI functions
      ALSA: sonicvibes: Use pure devres PCI
      ALSA: rme96: Use pure devres PCI
      ALSA: rme32: Use pure devres PCI
      ALSA: ens1370: Use pure devres PCI
      ALSA: cmipci: Use pure devres PCI
      ALSA: via82: Use pure devres PCI
      ALSA: sis7019: Use pure devres PCI
      ALSA: intel8x: Use pure devres PCI
      ALSA: fm801: Use pure devres PCI
      ALSA: es19x8: Use pure devres PCI
      ALSA: azt3328: Use pure devres PCI
      ALSA: als: Use pure devres PCI
      ALSA: oxygen: Use pure devres PCI
      ALSA: lx6464es: Use pure devres PCI
      ALSA: vx222: Use pure devres PCI
      ALSA: trident: Use pure devres PCI
      ALSA: rme9652: Use pure devres PCI
      ALSA: ymfpci: Use pure devres PCI
      ALSA: riptide: Use pure devres PCI
      ALSA: nm256: Use pure devres PCI
      ALSA: ice: Use pure devres PCI
      ALSA: emu10k1: Use pure devres PCI
      ALSA: echoaudio: Use pure devres PCI
      ALSA: cs5535: Use pure devres PCI
      ALSA: cs46xx: Use pure devres PCI
      ALSA: ca0106: Use pure devres PCI
      ALSA: ali5451: Use pure devres PCI
      ALSA: maestro3: Use pure devres PCI
      ASoC: sof: Use pure devres PCI
      ASoC: intel: avs: Use pure devres PCI
      ASoC: intel: atom: Use pure devres PCI
      ASoC: intel: atom: Return -ENOMEM if pcim_iomap() fails

Richard Fitzgerald (13):
      ASoC: wm_adsp: Use vmemdup_user() instead of open-coding
      ASoC: dt-bindings: Add Cirrus Logic CS48L32 audio DSP
      ASoC: cs48l32: Add driver for Cirrus Logic CS48L32 audio DSP
      ASoC: cs-amp-lib-test: Use flex_array_size()
      ALSA: hda/cirrus_scodec_test: Modernize creation of dummy devices
      ASoC: cs-amp-lib-test: Use faux bus instead of creating a dummy platform device
      firmware: cs_dsp: Add some sanity-checking to test harness
      MAINTAINERS: ASoC: Simplify references to Cirrus Logic include files
      ALSA: hda/hda_cs_dsp_ctl: Delete hda_cs_dsp_ctl module
      ASoC: wm_adsp: Don't use no_free_ptr() when passing to PTR_ERR()
      ALSA: hda/cs35l56: Remove dependency on COMPILE_TEST
      ASoC: Intel: soc-acpi-intel-mtl-match: Add match for CDB35L63-CB2
      ASoC: wm_adsp: Make cirrus_dir const

Sheetal (13):
      dt-bindings: Update Tegra194 and Tegra234 HDA bindings
      dt-bindings: Document Tegra264 HDA Support
      dt-bindings: ASoC: admaif: Add missing properties
      dt-bindings: ASoC: Document Tegra264 APE support
      ASoC: tegra: CIF: Add Tegra264 support
      ASoC: tegra: ADMAIF: Add Tegra264 support
      ASoC: tegra: ASRC: Update ARAM address
      ASoC: tegra: Update PLL rate for Tegra264
      ASoC: tegra: I2S: Add Tegra264 support
      ASoC: tegra: AMX: Add Tegra264 support
      ASoC: tegra: ADX: Add Tegra264 support
      ASoC: tegra: AHUB: Add Tegra264 support
      ASoC: tegra: Tegra264 support in isomgr_bw

Shenghao Ding (8):
      ALSA: hda/tas2781: Create a common header for both spi and i2c tas2781 hda driver
      ALSA: hda/tas2781: Remove tas2781_spi_fwlib.c and leverage SND_SOC_TAS2781_FMWLIB
      ASoC: tas2781: Add a debugfs node for acoustic tuning
      ALSA: hda/tas2781: Create an independent lib to save the shared parts for both SPI and I2C driver
      ALSA: hda/tas2781: Fix the symbol was not declare warning reported by kernel test robot
      ALSA: hda/tas2781: Fix the ld issue reported by kernel test robot
      ASoC: tas2781: Header file cleanup and Move the macro definitions to fwlib
      ALSA: hda/tas2781: Move and unified the calibrated-data getting function for SPI and I2C into the tas2781_hda lib

Shengjiu Wang (7):
      ASoC: fsl_sai: allow to set mclk rate with zero clk_id
      ASoC: fsl_sai: add xlate_tdm_slot_mask() callback
      ASoC: fsl_sai: separate 'is_dsp_mode' for tx and rx
      ASoC: fsl_sai: separate set_tdm_slot() for tx and rx
      ASoC: dt-bindings: fsl,mqs: Reference common DAI properties
      ASoC: dt-bindings: fsl,mqs: Document audio graph port
      ASoC: fsl_xcvr: update platform driver name

Shuming Fan (3):
      ASoC: rt722: fix pop noise at the beginning of headphone playback
      ASoC: rt722: fix pop noise at the beginning of DMIC recording
      ASoC: rt722: make regmap cache-only in probe

Siddarth Gundu (2):
      ALSA: dbri: replace strcpy() with strscpy()
      ALSA: amd7930: replace strcpy() with strscpy()

Simon Trimmer (2):
      ASoC: cs35l56: Log tuning unique identifiers during firmware load
      ALSA: hda: cs35l56: Log tuning unique identifiers during firmware load

Srinivas Kandagatla (3):
      ASoC: codecs: wcd-mbhc: cleanup swap_gnd_mic api
      ASoC: dt-bindings: wcd93xx: add bindings for audio mux controlling hp
      ASoC: codecs: wcd938x: add mux control support for hp audio mux

Stefan Binding (8):
      ASoC: cs35l56: Add Index based on ACPI HID or SDW ID to select regmap config
      ASoC: cs35l56: Add struct to index firmware registers
      ASoC: cs35l56: Add Mute, Volume and Posture registers to firmware register list
      ASoC: cs35l56: Add initial support for CS35L63 for I2C and SoundWire
      ASoC: cs35l56: Read Silicon ID from DIE_STS registers for CS35L63
      ALSA: hda/realtek: Add support for Acer Helios Laptops using CS35L41 HDA
      ALSA: hda: cs35l41: Fix swapped l/r audio channels for Acer Helios laptops
      ASoC: intel: sof_sdw: Add support for CS35L63 into machine driver

Takashi Iwai (4):
      ALSA: korg1212: Replace the pending stop check code with sync_stop PCM ops
      ALSA: usb-audio: Kill timer properly at removal
      ALSA: hda: acpi: Use SYSTEM_SLEEP_PM_OPS()
      ALSA: hda: acpi: Make driver's match data const static

Talhah Peerbhai (1):
      ASoC: amd: yc: Add quirk for Lenovo Yoga Pro 7 14ASP9

Thorsten Blum (11):
      ASoC: codecs: rt5677: Use secs_to_jiffies() instead of msecs_to_jiffies()
      ALSA: cs46xx: Remove commented out code
      ASoC: cs-amp-lib: Replace offsetof() with struct_size()
      ASoC: cs-amp-lib: Annotate struct cirrus_amp_efi_data with __counted_by()
      ASoC: starfive: Use max() to simplify code in jh7110_tdm_syncdiv()
      ASoC: codecs: Use min() to simplify aw_dev_dsp_update_container()
      ASoC: Intel: avs: Fix kcalloc() sizes
      ALSA: intel-hdmi-audio: Replace deprecated strcpy() with strscpy()
      ALSA: sb: Replace deprecated strcpy() with strscpy()
      ALSA: n64: Replace deprecated strcpy() with strscpy()
      ALSA: atmel: Replace deprecated strcpy() with strscpy()

Tony W Wang-oc (1):
      ALSA: HDA: Add Zhaoxin HDMI Controller and Codec support

Vijendar Mukunda (12):
      ASoC: SOF: amd: remove else condition in resume sequence
      ASoC: SOF: amd: add missing acp descriptor field
      ASoC: SOF: amd: add ACP7.1 platform support
      ASoC: SOF: amd: update soundwire specific acp descriptor fields
      ASoC: SOF: amd: enable ACP_PME_EN register for ACP7.0 & ACP7.1 platforms
      ASoC: SOF: amd: refactor acp reset sequence
      ASoC: SOF: amd: enable soundwire host wake irq mask
      ASoC: SOF: amd: add soundwire wake irq handling
      ASoC: SOF: amd: add build support for soundwire
      ASoC: amd: amd_sdw: Fix unlikely uninitialized variable use in create_sdw_dailinks()
      ASoC: amd: sof_amd_sdw: Fix unlikely uninitialized variable use in create_sdw_dailinks()
      ASoC: amd: sof_amd_sdw: add logic to get cpu_pin_id for ACP7.0/ACP7.1 platforms

Wentao Liang (1):
      ASoC: qcom: sdm845: Add error handling in sdm845_slim_snd_hw_params()

Yuanjun Gong (1):
      ASoC: tegra210_ahub: Add check to of_device_get_match_data()

Zhang Enpei (1):
      ASoC: stm: stm32_sai: Use dev_err_probe()

Zhang Yi (4):
      ASoC: codecs: add support for ES8389
      ASoC: dt-bindings: Add Everest ES8389 audio CODEC
      ASoC: dt-bindings: Add Everest ES8375 audio CODEC
      ASoC: codecs: add support for ES8375

---
 .../bindings/bus/nvidia,tegra210-aconnect.yaml     |    1 +
 .../bindings/sound/audio-graph-card2.yaml          |    8 +-
 .../devicetree/bindings/sound/cirrus,cs48l32.yaml  |  195 +
 .../devicetree/bindings/sound/everest,es8375.yaml  |   71 +
 .../devicetree/bindings/sound/everest,es8389.yaml  |   50 +
 .../devicetree/bindings/sound/fsl,mqs.yaml         |   10 +-
 .../bindings/sound/loongson,ls1b-ac97.yaml         |   68 +
 .../devicetree/bindings/sound/maxim,max98925.yaml  |    2 +-
 .../bindings/sound/mediatek,mt8188-mt6359.yaml     |    7 +-
 .../sound/mt8186-mt6366-da7219-max98357.yaml       |    7 +-
 .../devicetree/bindings/sound/mt8195-mt6359.yaml   |    4 +
 .../sound/nvidia,tegra-audio-graph-card.yaml       |    1 +
 .../bindings/sound/nvidia,tegra186-asrc.yaml       |    4 +-
 .../bindings/sound/nvidia,tegra186-dspk.yaml       |    1 +
 .../bindings/sound/nvidia,tegra210-admaif.yaml     |   17 +
 .../bindings/sound/nvidia,tegra210-adx.yaml        |    4 +-
 .../bindings/sound/nvidia,tegra210-ahub.yaml       |    1 +
 .../bindings/sound/nvidia,tegra210-amx.yaml        |    6 +-
 .../bindings/sound/nvidia,tegra210-dmic.yaml       |    1 +
 .../bindings/sound/nvidia,tegra210-i2s.yaml        |    4 +-
 .../bindings/sound/nvidia,tegra210-mbdrc.yaml      |    1 +
 .../bindings/sound/nvidia,tegra210-mixer.yaml      |    1 +
 .../bindings/sound/nvidia,tegra210-mvc.yaml        |    1 +
 .../bindings/sound/nvidia,tegra210-ope.yaml        |    1 +
 .../bindings/sound/nvidia,tegra210-peq.yaml        |    1 +
 .../bindings/sound/nvidia,tegra210-sfc.yaml        |    1 +
 .../bindings/sound/nvidia,tegra30-hda.yaml         |  108 +-
 .../devicetree/bindings/sound/qcom,sm8250.yaml     |    2 +
 .../devicetree/bindings/sound/qcom,wcd938x.yaml    |    6 +
 .../devicetree/bindings/sound/realtek,alc203.yaml  |   36 +
 .../devicetree/bindings/sound/richtek,rt9123.yaml  |   56 +
 .../devicetree/bindings/sound/richtek,rt9123p.yaml |   48 +
 .../bindings/sound/rockchip,rk3576-sai.yaml        |  144 +
 .../devicetree/bindings/spi/renesas,sh-msiof.yaml  |   41 +-
 MAINTAINERS                                        |   18 +-
 drivers/firmware/cirrus/test/cs_dsp_mock_bin.c     |    6 +-
 .../firmware/cirrus/test/cs_dsp_mock_mem_maps.c    |   15 +-
 drivers/firmware/cirrus/test/cs_dsp_mock_wmfw.c    |    4 +
 drivers/spi/spi-sh-msiof.c                         |   42 +-
 include/dt-bindings/sound/cs48l32.h                |   20 +
 include/linux/pci_ids.h                            |    2 +
 include/linux/string_helpers.h                     |    1 +
 include/sound/core.h                               |    1 -
 include/sound/cs-amp-lib.h                         |    2 +-
 include/sound/cs35l56.h                            |   29 +
 include/sound/cs42l52.h                            |   29 -
 include/sound/cs42l56.h                            |   45 -
 include/sound/cs42l73.h                            |   19 -
 include/sound/cs48l32.h                            |   47 +
 include/sound/cs48l32_registers.h                  |  530 +++
 include/sound/dmaengine_pcm.h                      |    2 -
 include/sound/gus.h                                |   22 -
 include/sound/hdaudio.h                            |    6 +-
 include/sound/hdaudio_ext.h                        |    6 +
 include/sound/jack.h                               |    6 -
 include/sound/pcm.h                                |    2 -
 include/sound/sdca_asoc.h                          |   42 +
 include/sound/sdca_function.h                      |   71 +-
 include/sound/snd_wavefront.h                      |    4 -
 include/sound/soc-acpi.h                           |   13 +
 include/sound/soc-dapm.h                           |    4 +
 include/sound/soc.h                                |   15 +-
 include/sound/soc_sdw_utils.h                      |    5 +-
 include/sound/sof.h                                |    1 +
 include/sound/tas2781-comlib-i2c.h                 |   37 +
 include/sound/tas2781.h                            |   81 +-
 include/sound/tpa6130a2-plat.h                     |   17 -
 lib/string_helpers.c                               |   39 +-
 sound/atmel/ac97c.c                                |    9 +-
 sound/core/control.c                               |   14 +-
 sound/core/device.c                                |   23 -
 sound/core/jack.c                                  |   19 -
 sound/core/pcm_dmaengine.c                         |   21 -
 sound/core/pcm_memory.c                            |    2 +-
 sound/core/pcm_misc.c                              |   30 -
 sound/core/seq/seq_queue.c                         |   16 -
 sound/core/seq/seq_queue.h                         |    1 -
 sound/core/seq_device.c                            |    2 +-
 sound/hda/ext/hdac_ext_controller.c                |   19 +
 sound/hda/hda_bus_type.c                           |    6 +-
 sound/hda/hdac_device.c                            |    2 +-
 sound/hda/hdac_stream.c                            |   19 -
 sound/hda/intel-dsp-config.c                       |   10 +-
 sound/hda/intel-nhlt.c                             |   19 +-
 sound/i2c/other/pt2258.c                           |    8 +-
 sound/isa/gus/gus_io.c                             |  229 --
 sound/isa/gus/gus_main.c                           |   14 -
 sound/isa/gus/gus_reset.c                          |   16 +-
 sound/isa/msnd/Makefile                            |    2 +-
 sound/isa/msnd/msnd.h                              |    4 -
 sound/isa/msnd/msnd_midi.c                         |  163 -
 sound/isa/msnd/msnd_pinnacle.c                     |    5 -
 sound/isa/sb/emu8000.c                             |    3 +-
 sound/isa/sb/jazz16.c                              |    5 +-
 sound/isa/sb/sb16.c                                |    5 +-
 sound/isa/sb/sb8.c                                 |    5 +-
 sound/isa/sb/sb8_midi.c                            |    3 +-
 sound/isa/sb/sb_mixer.c                            |    5 +-
 sound/mips/snd-n64.c                               |    9 +-
 sound/pci/ad1889.c                                 |    7 +-
 sound/pci/ali5451/ali5451.c                        |    6 +-
 sound/pci/als300.c                                 |    2 +-
 sound/pci/als4000.c                                |    2 +-
 sound/pci/asihpi/asihpi.c                          |    9 +-
 sound/pci/atiixp.c                                 |    7 +-
 sound/pci/atiixp_modem.c                           |    7 +-
 sound/pci/au88x0/au88x0.c                          |    7 +-
 sound/pci/au88x0/au88x0_a3d.c                      |   10 +-
 sound/pci/aw2/aw2-alsa.c                           |    7 +-
 sound/pci/azt3328.c                                |    2 +-
 sound/pci/bt87x.c                                  |    7 +-
 sound/pci/ca0106/ca0106_main.c                     |    2 +-
 sound/pci/cmipci.c                                 |    2 +-
 sound/pci/cs4281.c                                 |   13 +-
 sound/pci/cs46xx/cs46xx_lib.c                      |    2 +-
 sound/pci/cs46xx/dsp_spos_scb_lib.c                |    7 -
 sound/pci/cs5530.c                                 |    7 +-
 sound/pci/cs5535audio/cs5535audio.c                |    2 +-
 sound/pci/echoaudio/echoaudio.c                    |    2 +-
 sound/pci/emu10k1/emu10k1_main.c                   |    2 +-
 sound/pci/emu10k1/emu10k1x.c                       |    2 +-
 sound/pci/ens1370.c                                |    2 +-
 sound/pci/es1938.c                                 |    2 +-
 sound/pci/es1968.c                                 |    2 +-
 sound/pci/fm801.c                                  |    2 +-
 sound/pci/hda/Kconfig                              |   33 +-
 sound/pci/hda/Makefile                             |    8 +-
 sound/pci/hda/cirrus_scodec_test.c                 |  117 +-
 sound/pci/hda/cs35l41_hda.c                        |   51 +-
 sound/pci/hda/cs35l41_hda_property.c               |    6 +
 sound/pci/hda/cs35l56_hda.c                        |   38 +-
 sound/pci/hda/cs35l56_hda_i2c.c                    |    3 +
 sound/pci/hda/cs35l56_hda_spi.c                    |    3 +
 sound/pci/hda/hda_acpi.c                           |  325 ++
 sound/pci/hda/hda_bind.c                           |    4 +-
 sound/pci/hda/hda_codec.c                          |   31 -
 sound/pci/hda/hda_cs_dsp_ctl.c                     |  249 --
 sound/pci/hda/hda_cs_dsp_ctl.h                     |   39 -
 sound/pci/hda/hda_intel.c                          |   32 +-
 sound/pci/hda/hda_local.h                          |    2 -
 sound/pci/hda/hda_tegra.c                          |   55 +-
 sound/pci/hda/patch_hdmi.c                         |   13 +
 sound/pci/hda/patch_realtek.c                      |   10 +
 sound/pci/hda/tas2781-spi.h                        |  157 -
 sound/pci/hda/tas2781_hda.c                        |  377 ++
 sound/pci/hda/tas2781_hda.h                        |   90 +
 sound/pci/hda/tas2781_hda_i2c.c                    |  498 +--
 sound/pci/hda/tas2781_hda_spi.c                    |  892 ++---
 sound/pci/hda/tas2781_spi_fwlib.c                  | 2006 ----------
 sound/pci/ice1712/ice1712.c                        |    2 +-
 sound/pci/ice1712/ice1724.c                        |    2 +-
 sound/pci/intel8x0.c                               |    2 +-
 sound/pci/intel8x0m.c                              |    2 +-
 sound/pci/korg1212/korg1212.c                      |   75 +-
 sound/pci/lola/lola.c                              |   16 +-
 sound/pci/lx6464es/lx6464es.c                      |    2 +-
 sound/pci/maestro3.c                               |    2 +-
 sound/pci/nm256/nm256.c                            |    2 +-
 sound/pci/oxygen/oxygen_lib.c                      |    2 +-
 sound/pci/riptide/riptide.c                        |    2 +-
 sound/pci/rme32.c                                  |    2 +-
 sound/pci/rme96.c                                  |    2 +-
 sound/pci/rme9652/hdsp.c                           |    2 +-
 sound/pci/rme9652/hdspm.c                          |    7 +-
 sound/pci/rme9652/rme9652.c                        |    2 +-
 sound/pci/sis7019.c                                |    2 +-
 sound/pci/sonicvibes.c                             |    2 +-
 sound/pci/trident/trident_main.c                   |    2 +-
 sound/pci/via82xx.c                                |    2 +-
 sound/pci/via82xx_modem.c                          |    2 +-
 sound/pci/vx222/vx222.c                            |    2 +-
 sound/pci/ymfpci/ymfpci_main.c                     |    2 +-
 sound/sh/aica.c                                    |    8 +-
 sound/soc/amd/acp-da7219-max98357a.c               |    8 +-
 sound/soc/amd/acp-es8336.c                         |    4 +-
 sound/soc/amd/acp-rt5645.c                         |    6 +-
 sound/soc/amd/acp/acp-sdw-legacy-mach.c            |    4 +-
 sound/soc/amd/acp/acp-sdw-sof-mach.c               |   10 +-
 sound/soc/amd/acp/acp-sof-mach.c                   |    2 +-
 sound/soc/amd/yc/acp6x-mach.c                      |    9 +-
 sound/soc/apple/mca.c                              |   23 +
 sound/soc/codecs/Kconfig                           |   47 +-
 sound/soc/codecs/Makefile                          |   14 +-
 sound/soc/codecs/ac97.c                            |   10 +
 sound/soc/codecs/adau7118.c                        |    6 +
 sound/soc/codecs/ak4458.c                          |   10 +-
 sound/soc/codecs/ak5386.c                          |   28 +-
 sound/soc/codecs/aw88166.c                         |    7 +-
 sound/soc/codecs/aw88395/aw88395_device.c          |    7 +-
 sound/soc/codecs/aw88399.c                         |    7 +-
 sound/soc/codecs/cs-amp-lib-test.c                 |   70 +-
 sound/soc/codecs/cs-amp-lib.c                      |    3 +-
 sound/soc/codecs/cs35l56-i2c.c                     |   23 +-
 sound/soc/codecs/cs35l56-sdw.c                     |   91 +-
 sound/soc/codecs/cs35l56-shared.c                  |  257 +-
 sound/soc/codecs/cs35l56-spi.c                     |    3 +
 sound/soc/codecs/cs35l56.c                         |   48 +-
 sound/soc/codecs/cs35l56.h                         |    1 +
 sound/soc/codecs/cs42l52.c                         |  102 +-
 sound/soc/codecs/cs42l56.c                         |   90 +-
 sound/soc/codecs/cs42l73.c                         |   68 +-
 sound/soc/codecs/cs48l32-tables.c                  |  540 +++
 sound/soc/codecs/cs48l32.c                         | 4073 ++++++++++++++++++++
 sound/soc/codecs/cs48l32.h                         |  403 ++
 sound/soc/codecs/es8375.c                          |  793 ++++
 sound/soc/codecs/es8375.h                          |  123 +
 sound/soc/codecs/es8389.c                          |  962 +++++
 sound/soc/codecs/es8389.h                          |  140 +
 sound/soc/codecs/hdmi-codec.c                      |    1 +
 sound/soc/codecs/idt821034.c                       |   19 +-
 sound/soc/codecs/pcm6240.c                         |    3 +-
 sound/soc/codecs/peb2466.c                         |   15 +-
 sound/soc/codecs/rt5665.c                          |   96 -
 sound/soc/codecs/rt5665.h                          |    3 -
 sound/soc/codecs/rt5668.c                          |   43 -
 sound/soc/codecs/rt5668.h                          |    3 -
 sound/soc/codecs/rt5677-spi.c                      |    4 +-
 sound/soc/codecs/rt5677.c                          |    7 +-
 sound/soc/codecs/rt712-sdca-dmic.c                 |    8 +-
 sound/soc/codecs/rt712-sdca.c                      |    8 +-
 sound/soc/codecs/rt722-sdca-sdw.c                  |   20 +
 sound/soc/codecs/rt722-sdca-sdw.h                  |    1 +
 sound/soc/codecs/rt722-sdca.c                      |  322 +-
 sound/soc/codecs/rt722-sdca.h                      |    6 +
 sound/soc/codecs/rt9123.c                          |  503 +++
 sound/soc/codecs/rt9123p.c                         |  171 +
 sound/soc/codecs/sma1307.c                         |    1 -
 sound/soc/codecs/sta32x.c                          |    6 +-
 sound/soc/codecs/tas2764-quirks.h                  |  180 +
 sound/soc/codecs/tas2764.c                         |  139 +-
 sound/soc/codecs/tas2764.h                         |    3 +
 sound/soc/codecs/tas2770.c                         |  151 +-
 sound/soc/codecs/tas2770.h                         |    6 +
 sound/soc/codecs/tas2781-comlib-i2c.c              |  369 ++
 sound/soc/codecs/tas2781-comlib.c                  |  417 +-
 sound/soc/codecs/tas2781-fmwlib.c                  |   25 +-
 sound/soc/codecs/tas2781-i2c.c                     |  158 +-
 sound/soc/codecs/tlv320adc3xxx.c                   |    8 +-
 sound/soc/codecs/tlv320aic3x.c                     |    6 +-
 sound/soc/codecs/tpa6130a2.c                       |   54 +-
 sound/soc/codecs/twl4030.c                         |   79 +-
 sound/soc/codecs/wcd-mbhc-v2.c                     |    2 +-
 sound/soc/codecs/wcd-mbhc-v2.h                     |    2 +-
 sound/soc/codecs/wcd9335.c                         |   15 +-
 sound/soc/codecs/wcd937x.c                         |    2 +-
 sound/soc/codecs/wcd938x-sdw.c                     |    2 +-
 sound/soc/codecs/wcd938x.c                         |   69 +-
 sound/soc/codecs/wcd939x.c                         |   18 +-
 sound/soc/codecs/wm5100.c                          |   10 +-
 sound/soc/codecs/wm8903.c                          |   12 +-
 sound/soc/codecs/wm8962.c                          |   11 +-
 sound/soc/codecs/wm8996.c                          |   10 +-
 sound/soc/codecs/wm_adsp.c                         |   28 +-
 sound/soc/codecs/wsa883x.c                         |    2 +-
 sound/soc/codecs/wsa884x.c                         |    2 +-
 sound/soc/codecs/zl38060.c                         |   12 +-
 sound/soc/fsl/fsl_rpmsg.c                          |   28 +-
 sound/soc/fsl/fsl_rpmsg.h                          |    2 +-
 sound/soc/fsl/fsl_sai.c                            |   90 +-
 sound/soc/fsl/fsl_sai.h                            |    6 +-
 sound/soc/fsl/fsl_xcvr.c                           |    2 +-
 sound/soc/fsl/imx-card.c                           |    7 +-
 sound/soc/fsl/imx-pcm-rpmsg.c                      |   21 +-
 sound/soc/generic/simple-card-utils.c              |   23 +-
 sound/soc/generic/test-component.c                 |   11 +
 sound/soc/intel/atom/sst/sst.h                     |    6 -
 sound/soc/intel/atom/sst/sst_drv_interface.c       |   24 -
 sound/soc/intel/atom/sst/sst_pci.c                 |   59 +-
 sound/soc/intel/atom/sst/sst_pvt.c                 |   33 -
 sound/soc/intel/avs/Makefile                       |    6 +-
 sound/soc/intel/avs/avs.h                          |   13 +-
 sound/soc/intel/avs/board_selection.c              |  183 +-
 sound/soc/intel/avs/boards/Kconfig                 |    8 +
 sound/soc/intel/avs/boards/da7219.c                |   11 +-
 sound/soc/intel/avs/boards/dmic.c                  |   12 +-
 sound/soc/intel/avs/boards/es8336.c                |   11 +-
 sound/soc/intel/avs/boards/hdaudio.c               |   25 +-
 sound/soc/intel/avs/boards/i2s_test.c              |   15 +-
 sound/soc/intel/avs/boards/max98357a.c             |   11 +-
 sound/soc/intel/avs/boards/max98373.c              |   11 +-
 sound/soc/intel/avs/boards/max98927.c              |   11 +-
 sound/soc/intel/avs/boards/nau8825.c               |   11 +-
 sound/soc/intel/avs/boards/pcm3168a.c              |   16 +-
 sound/soc/intel/avs/boards/probe.c                 |    5 +-
 sound/soc/intel/avs/boards/rt274.c                 |   11 +-
 sound/soc/intel/avs/boards/rt286.c                 |   11 +-
 sound/soc/intel/avs/boards/rt298.c                 |   11 +-
 sound/soc/intel/avs/boards/rt5514.c                |   11 +-
 sound/soc/intel/avs/boards/rt5663.c                |   11 +-
 sound/soc/intel/avs/boards/rt5682.c                |   11 +-
 sound/soc/intel/avs/boards/ssm4567.c               |   11 +-
 sound/soc/intel/avs/core.c                         |   68 +-
 sound/soc/intel/avs/dsp.c                          |    2 -
 sound/soc/intel/avs/lnl.c                          |   27 +
 sound/soc/intel/avs/loader.c                       |   11 +-
 sound/soc/intel/avs/messages.h                     |   34 +-
 sound/soc/intel/avs/mtl.c                          |  200 +
 sound/soc/intel/avs/path.c                         |   59 +-
 sound/soc/intel/avs/pcm.c                          |  156 +-
 sound/soc/intel/avs/probes.c                       |    2 +-
 sound/soc/intel/avs/ptl.c                          |   98 +
 sound/soc/intel/avs/registers.h                    |   40 +-
 sound/soc/intel/avs/topology.c                     |    4 +-
 sound/soc/intel/avs/topology.h                     |    2 +-
 sound/soc/intel/avs/utils.h                        |   16 +-
 sound/soc/intel/boards/Kconfig                     |    8 -
 sound/soc/intel/boards/sof_sdw.c                   |   48 +-
 sound/soc/intel/common/Makefile                    |    2 +-
 sound/soc/intel/common/soc-acpi-intel-arl-match.c  |    9 +
 sound/soc/intel/common/soc-acpi-intel-lnl-match.c  |   15 +-
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c  |   49 +-
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c  |  142 +-
 sound/soc/intel/common/sof-function-topology-lib.c |  135 +
 sound/soc/intel/common/sof-function-topology-lib.h |   15 +
 sound/soc/loongson/Kconfig                         |   10 +
 sound/soc/loongson/Makefile                        |    2 +
 sound/soc/loongson/loongson1_ac97.c                |  398 ++
 sound/soc/loongson/loongson_i2s_pci.c              |   13 +-
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c         |  571 +--
 sound/soc/mediatek/mt8188/mt8188-mt6359.c          |    6 +-
 sound/soc/mediatek/mt8195/mt8195-mt6359.c          |   45 +-
 sound/soc/meson/meson-card-utils.c                 |    2 +-
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c            |    2 +-
 sound/soc/qcom/sc8280xp.c                          |    2 +
 sound/soc/qcom/sdm845.c                            |    4 +
 sound/soc/renesas/Kconfig                          |    7 +
 sound/soc/renesas/rcar/Makefile                    |    3 +
 sound/soc/renesas/rcar/adg.c                       |   32 +-
 sound/soc/renesas/rcar/core.c                      |    9 +-
 sound/soc/renesas/rcar/msiof.c                     |  566 +++
 sound/soc/rockchip/Kconfig                         |   10 +
 sound/soc/rockchip/Makefile                        |    2 +
 sound/soc/rockchip/rockchip_sai.c                  | 1555 ++++++++
 sound/soc/rockchip/rockchip_sai.h                  |  251 ++
 sound/soc/sdca/Makefile                            |    2 +-
 sound/soc/sdca/sdca_asoc.c                         | 1311 +++++++
 sound/soc/sdca/sdca_functions.c                    |   10 +-
 sound/soc/sdca/sdca_regmap.c                       |    3 -
 sound/soc/sdw_utils/soc_sdw_rt_amp.c               |    2 +-
 sound/soc/sdw_utils/soc_sdw_utils.c                |  202 +-
 sound/soc/soc-ac97.c                               |   15 +-
 sound/soc/soc-core.c                               |  130 +-
 sound/soc/soc-dapm.c                               |   88 +-
 sound/soc/soc-devres.c                             |    7 +
 sound/soc/soc-utils.c                              |   13 +
 sound/soc/sof/amd/Kconfig                          |    7 +-
 sound/soc/sof/amd/acp-dsp-offset.h                 |   10 +
 sound/soc/sof/amd/acp.c                            |  133 +-
 sound/soc/sof/amd/acp.h                            |    7 +
 sound/soc/sof/amd/pci-acp70.c                      |   10 +-
 sound/soc/sof/core.c                               |   10 +-
 sound/soc/sof/imx/imx8.c                           |   24 +-
 sound/soc/sof/intel/hda.h                          |    1 +
 sound/soc/sof/intel/pci-ptl.c                      |   30 +
 sound/soc/sof/intel/ptl.c                          |   23 +
 sound/soc/sof/ipc4-pcm.c                           |    3 +-
 sound/soc/sof/sof-pci-dev.c                        |   16 +-
 sound/soc/sof/topology.c                           |   99 +-
 sound/soc/starfive/jh7110_tdm.c                    |   13 +-
 sound/soc/stm/stm32_sai.c                          |   18 +-
 sound/soc/sunxi/sun8i-codec.c                      |   13 +-
 sound/soc/tegra/tegra186_asrc.c                    |   18 +-
 sound/soc/tegra/tegra186_asrc.h                    |   12 +-
 sound/soc/tegra/tegra210_admaif.c                  |  223 +-
 sound/soc/tegra/tegra210_admaif.h                  |   78 +
 sound/soc/tegra/tegra210_adx.c                     |  229 +-
 sound/soc/tegra/tegra210_adx.h                     |   36 +-
 sound/soc/tegra/tegra210_ahub.c                    |  850 +++-
 sound/soc/tegra/tegra210_ahub.h                    |   52 +-
 sound/soc/tegra/tegra210_amx.c                     |  229 +-
 sound/soc/tegra/tegra210_amx.h                     |   34 +-
 sound/soc/tegra/tegra210_i2s.c                     |  231 +-
 sound/soc/tegra/tegra210_i2s.h                     |   51 +-
 sound/soc/tegra/tegra_audio_graph_card.c           |   14 +-
 sound/soc/tegra/tegra_cif.h                        |   30 +-
 sound/soc/tegra/tegra_isomgr_bw.c                  |    7 +-
 sound/soc/ti/davinci-mcasp.c                       |    8 +-
 sound/sparc/amd7930.c                              |    9 +-
 sound/sparc/dbri.c                                 |    9 +-
 sound/usb/fcp.c                                    |    3 +-
 sound/usb/midi.c                                   |    5 +-
 sound/usb/mixer.c                                  |   22 +-
 sound/usb/mixer_quirks.c                           |  154 +-
 sound/usb/mixer_scarlett2.c                        |    3 +-
 sound/usb/mixer_us16x08.c                          |   32 +-
 sound/usb/quirks-table.h                           |   51 +
 sound/usb/quirks.c                                 |    1 +
 sound/virtio/virtio_kctl.c                         |    8 +-
 sound/x86/intel_hdmi_audio.c                       |    7 +-
 389 files changed, 21930 insertions(+), 7157 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/cirrus,cs48l32.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es8375.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es8389.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/loongson,ls1b-ac97.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/realtek,alc203.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/richtek,rt9123.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/richtek,rt9123p.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/rockchip,rk3576-sai.yaml
 create mode 100644 include/dt-bindings/sound/cs48l32.h
 delete mode 100644 include/sound/cs42l52.h
 delete mode 100644 include/sound/cs42l56.h
 delete mode 100644 include/sound/cs42l73.h
 create mode 100644 include/sound/cs48l32.h
 create mode 100644 include/sound/cs48l32_registers.h
 create mode 100644 include/sound/sdca_asoc.h
 create mode 100644 include/sound/tas2781-comlib-i2c.h
 delete mode 100644 include/sound/tpa6130a2-plat.h
 delete mode 100644 sound/isa/msnd/msnd_midi.c
 create mode 100644 sound/pci/hda/hda_acpi.c
 delete mode 100644 sound/pci/hda/hda_cs_dsp_ctl.c
 delete mode 100644 sound/pci/hda/hda_cs_dsp_ctl.h
 delete mode 100644 sound/pci/hda/tas2781-spi.h
 create mode 100644 sound/pci/hda/tas2781_hda.c
 create mode 100644 sound/pci/hda/tas2781_hda.h
 delete mode 100644 sound/pci/hda/tas2781_spi_fwlib.c
 create mode 100644 sound/soc/codecs/cs48l32-tables.c
 create mode 100644 sound/soc/codecs/cs48l32.c
 create mode 100644 sound/soc/codecs/cs48l32.h
 create mode 100644 sound/soc/codecs/es8375.c
 create mode 100644 sound/soc/codecs/es8375.h
 create mode 100644 sound/soc/codecs/es8389.c
 create mode 100644 sound/soc/codecs/es8389.h
 create mode 100644 sound/soc/codecs/rt9123.c
 create mode 100644 sound/soc/codecs/rt9123p.c
 create mode 100644 sound/soc/codecs/tas2764-quirks.h
 create mode 100644 sound/soc/codecs/tas2781-comlib-i2c.c
 create mode 100644 sound/soc/intel/avs/lnl.c
 create mode 100644 sound/soc/intel/avs/mtl.c
 create mode 100644 sound/soc/intel/avs/ptl.c
 create mode 100644 sound/soc/intel/common/sof-function-topology-lib.c
 create mode 100644 sound/soc/intel/common/sof-function-topology-lib.h
 create mode 100644 sound/soc/loongson/loongson1_ac97.c
 create mode 100644 sound/soc/renesas/rcar/msiof.c
 create mode 100644 sound/soc/rockchip/rockchip_sai.c
 create mode 100644 sound/soc/rockchip/rockchip_sai.h
 create mode 100644 sound/soc/sdca/sdca_asoc.c

