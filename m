Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B9B2222D2
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747898081; cv=none; b=F3G09XjtOPPiHdOc/UzwjHIXR09MlEY1Gd7fHE4DcWfM06CXfMKrRdXf8h2J5RP5BEb6TqKuoPzV0m8r1E/rgSJlefoB8c243b1i/9wvRObEU7gyUpvqiV41h6W6TTA9D7q6QnTGjM5YWYUtynfQ7pVw6bNXRMHx6xZ+sep0uIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747898081; c=relaxed/simple;
	bh=9xmEj/u5wVzrLFQybLnMAT1cKJNzNIbVPfjonv7ExZU=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=dQKkOOzpF540GdAV2OSnFf2u/Fob1WAYaoGVbuTjgzwXm7UQoW0dSQnEa7N3AE46fBdF4xWZxAz8VYjFbJt2gV5kDiQWofBMjIFefz5x+8Psk7NJPgMetzUyt+4GN5MGe0ImQ30OlS5pBMrYMP4MlCpRm2kGVhDArc1Oiek/lrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Tw7p23rz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=T1GIWouy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Tw7p23rz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=T1GIWouy; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Tw7p23rz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T1GIWouy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Tw7p23rz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T1GIWouy"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DF220339B0;
	Thu, 22 May 2025 07:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747898077; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SaWhhzgQeePUshQJQu5Mm3jqWf7VA2hc4uq6UXsYJNQ=;
	b=Tw7p23rzXOU+RoDE/HsIB1W0YUE2LE3gLS3DgynjufEM568UvpQTJG/USd9478blskzXC3
	VeDEvDhaDpZdg6KVZYqNIRDmAQX5jBwj5TdEDdA+NeVl/JcVOkeWmZBn6SkWTtNwVD/Iqy
	8KtktYGUzu5ODZ3r7qckpwuyUYBO3Es=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747898077;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SaWhhzgQeePUshQJQu5Mm3jqWf7VA2hc4uq6UXsYJNQ=;
	b=T1GIWouy/Zj/ws16fjcGQQOhIWaZa748/DbG8FkQP+ypGEE91HNRI+0QRegiLWU8VJiMTL
	Q9SIZuhz9lQstNDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747898077; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SaWhhzgQeePUshQJQu5Mm3jqWf7VA2hc4uq6UXsYJNQ=;
	b=Tw7p23rzXOU+RoDE/HsIB1W0YUE2LE3gLS3DgynjufEM568UvpQTJG/USd9478blskzXC3
	VeDEvDhaDpZdg6KVZYqNIRDmAQX5jBwj5TdEDdA+NeVl/JcVOkeWmZBn6SkWTtNwVD/Iqy
	8KtktYGUzu5ODZ3r7qckpwuyUYBO3Es=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747898077;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SaWhhzgQeePUshQJQu5Mm3jqWf7VA2hc4uq6UXsYJNQ=;
	b=T1GIWouy/Zj/ws16fjcGQQOhIWaZa748/DbG8FkQP+ypGEE91HNRI+0QRegiLWU8VJiMTL
	Q9SIZuhz9lQstNDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B70B513433;
	Thu, 22 May 2025 07:14:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jQp7K93OLmjpCAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 22 May 2025 07:14:37 +0000
Date: Thu, 22 May 2025 09:14:33 +0200
Message-ID: <87r00h86cm.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 6.15
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
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
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

Linus,

please pull sound fixes for v6.15 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.15

The topmost commit is f709b78aecab519dbcefa9a6603b94ad18c553e3

----------------------------------------------------------------

sound fixes for 6.15

A collection of small fixes for 6.15 final.  It became slightly a
higher amount than expected, but all look easy and safe to apply.

- A fix for PCM core race spotted by fuzzing
- ASoC topology fix for single DAI link
- UAF fix for ASoC SOF Intel HD-audio at reloading
- ASoC SOF Intel and Mediatek fixes
- Trivial HD-audio quirks as usual

----------------------------------------------------------------

Arnd Bergmann (1):
      ASoC: mediatek: mt8188-mt6359: select CONFIG_SND_SOC_MT6359_ACCDET

Chris Chiu (1):
      ALSA: hda/realtek - Add new HP ZBook laptop with micmute led fixup

Ed Burcher (1):
      ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7 14ASP10

Kai Vehmanen (1):
      ASoc: SOF: topology: connect DAI to a single DAI link

Kailang Yang (1):
      ALSA: hda/realtek - restore auto-mute mode for Dell Chrome platform

Nícolas F. R. A. Prado (1):
      ASoC: mediatek: mt8188-mt6359: Depend on MT6359_ACCDET set or disabled

Peter Ujfalusi (3):
      ASoC: SOF: ipc4-control: Use SOF_CTRL_CMD_BINARY as numid for bytes_ext
      ASoC: SOF: ipc4-pcm: Delay reporting is only supported for playback direction
      ASoC: SOF: Intel: hda-bus: Use PIO mode on ACE2+ platforms

Stefan Binding (1):
      ALSA: hda/realtek: Add support for HP Agusta using CS35L41 HDA

Takashi Iwai (1):
      ALSA: pcm: Fix race of buffer access at PCM OSS layer

Tavian Barnes (1):
      ASoC: SOF: Intel: hda: Fix UAF when reloading module

---
 include/sound/pcm.h           |  2 ++
 sound/core/oss/pcm_oss.c      |  3 +--
 sound/core/pcm_native.c       | 11 +++++++++++
 sound/pci/hda/patch_realtek.c |  9 ++++++++-
 sound/soc/mediatek/Kconfig    |  1 +
 sound/soc/sof/intel/hda-bus.c |  2 +-
 sound/soc/sof/intel/hda.c     | 16 +++++++++++++++-
 sound/soc/sof/ipc4-control.c  | 11 ++++++++++-
 sound/soc/sof/ipc4-pcm.c      |  3 ++-
 sound/soc/sof/topology.c      | 18 ++++++++++++++----
 10 files changed, 65 insertions(+), 11 deletions(-)

