Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8069E232369
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 07:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743579574; cv=none; b=bWVhiKPCDHhlzlpczTL+dqD7wdG/pMI1xbVZNaeL/YzWj/qLzaX9EOWBNpahg42qnbLFpO1WXx8E2VkF3OP68Yn9wYMY4C3LbmOg08UxjVAHOMriSbe8DY5y0xGP+YaykHVaj8SQ/H95haf9Z54qdiB1id/mPQA7G3Jnn/hX2lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743579574; c=relaxed/simple;
	bh=CPmuAubAKAqNFmAUSCePXbfiA8X6WhDF/f8+BrdG5hM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GzexboTcflZqlsnuTQ4kTv5iGrx5zPzWdZoAvfRr230XKtEVAaTB6pv40eQG3w7sgc2DigS+fe5tKDsH8wAQXcTIR+zAAUnEAmrml4BPwxB4KAiN6CqH9uri3ULJc7a1VGqG55t2hayQdTwigQnvlh9mKV0TzMiW4lil+HFFcmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wGNrQos6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FkWdlKrg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wGNrQos6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FkWdlKrg; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wGNrQos6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FkWdlKrg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wGNrQos6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FkWdlKrg"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9FDAF211A5;
	Wed,  2 Apr 2025 07:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743579570; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hFcncWnUnVxmCYjsLpZJBme4w2fDFnyZsu/k4sDc8RY=;
	b=wGNrQos6VKI2nGEFqICQn5MorSzGlQck57BTnHkT87ARMLdcncNywHXfbZ9hVhirB/Ygec
	4BCcoORUuUCln7PMHqOjLWlXZULTHXT1ld93I2v1F0Tpeh6/p7dlOw6chAAbsGj+iXB1Me
	o5BJCKdiKxZ2I2+lDm7Ef8s41Zbk9h8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743579570;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hFcncWnUnVxmCYjsLpZJBme4w2fDFnyZsu/k4sDc8RY=;
	b=FkWdlKrgmTzd7gOmc2K4L5PfkEat+FyO1drpo3n4eJQahnqcf+bNnHcm7JVOcO1oGR2Dfa
	EH996nydPu394vAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743579570; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hFcncWnUnVxmCYjsLpZJBme4w2fDFnyZsu/k4sDc8RY=;
	b=wGNrQos6VKI2nGEFqICQn5MorSzGlQck57BTnHkT87ARMLdcncNywHXfbZ9hVhirB/Ygec
	4BCcoORUuUCln7PMHqOjLWlXZULTHXT1ld93I2v1F0Tpeh6/p7dlOw6chAAbsGj+iXB1Me
	o5BJCKdiKxZ2I2+lDm7Ef8s41Zbk9h8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743579570;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hFcncWnUnVxmCYjsLpZJBme4w2fDFnyZsu/k4sDc8RY=;
	b=FkWdlKrgmTzd7gOmc2K4L5PfkEat+FyO1drpo3n4eJQahnqcf+bNnHcm7JVOcO1oGR2Dfa
	EH996nydPu394vAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 631B013A4B;
	Wed,  2 Apr 2025 07:39:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0s24FrLp7GcrIAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 02 Apr 2025 07:39:30 +0000
Date: Wed, 02 Apr 2025 09:39:29 +0200
Message-ID: <878qojypu6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "C.D. MacEachern" <craig.daniel.maceachern@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Salvatore Bonaccorso <carnil@debian.org>,
	1100928@bugs.debian.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: Bug#1100928: [regression 6.1.y] microphone no longer records (on VivoBook_ASUSLaptop TP401MARB_J401MA)
In-Reply-To: <CAJ8x=4ibzvVxxv7FzswtwTcYT73XaDOUr7gHWMcdxB+j8+zyyw@mail.gmail.com>
References: <174248253267.1718.4037292692790831697.reportbug@x>
	<Z95s5T6OXFPjRnKf@eldamar.lan>
	<Z-MMsp3XJyNHOlma@eldamar.lan>
	<87iknwb80x.wl-tiwai@suse.de>
	<CAJ8x=4jNhsjw_s-p5FXBk9WScPHEdUMZ0tXnhCiya8fCf_PH7w@mail.gmail.com>
	<Z-ct2D6uIN1f6UbL@eldamar.lan>
	<87zfh43uti.wl-tiwai@suse.de>
	<CAJ8x=4ibzvVxxv7FzswtwTcYT73XaDOUr7gHWMcdxB+j8+zyyw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,debian.org,bugs.debian.org,gmail.com,vger.kernel.org,lists.linux.dev];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Spam-Score: -1.80
X-Spam-Flag: NO

On Tue, 01 Apr 2025 20:21:49 +0200,
C.D. MacEachern wrote:
> 
> 
> Logs attached.

Thanks.  Below is the fix patch.
You can get the same effect by passing model=1043:1271 to
snd-hda-intel module, too, e.g. boot with
  snd_hda_intel.model=1043:1271
boot option.


Takashi

-- 8< --
From: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH] ALSA: hda/realtek: Fix built-in mic on another ASUS VivoBook model

There is another VivoBook model which built-in mic got broken recently
by the fix of the pin sort.  Apply the correct quirk
ALC256_FIXUP_ASUS_MIC_NO_PRESENCE to this model for addressing the
regression, too.

Fixes: 3b4309546b48 ("ALSA: hda: Fix headset detection failure due to unstable sort")
Closes: https://lore.kernel.org/Z95s5T6OXFPjRnKf@eldamar.lan
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index eec3ea1a7e08..79004bc8107b 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10889,6 +10889,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1c43, "ASUS UX8406MA", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x1c62, "ASUS GU603", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x1c63, "ASUS GU605M", ALC285_FIXUP_ASUS_GU605_SPI_SPEAKER2_TO_DAC1),
+	SND_PCI_QUIRK(0x1043, 0x1c80, "ASUS VivoBook TP401", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1c92, "ASUS ROG Strix G15", ALC285_FIXUP_ASUS_G533Z_PINS),
 	SND_PCI_QUIRK(0x1043, 0x1c9f, "ASUS G614JU/JV/JI", ALC285_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1caf, "ASUS G634JY/JZ/JI/JG", ALC285_FIXUP_ASUS_SPI_REAR_SPEAKERS),
-- 
2.49.0

