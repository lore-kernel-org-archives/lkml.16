Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800E7257440
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 10:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750761888; cv=none; b=RM03qfht3pkBnqK11c0GYMINs6nRpcamd+KbFA2sTY8j3ilHmBMTL+uhQh3ef1TbhAFrQA8tQnLqKPAW0XCpWR4++gYkEpN48ZYPMijAGd/XDRaw7fr2hRatYwXxB2GOSUsPohye8vDhm52yZhs4UUavlgJ0tGWMOeTFexwfExs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750761888; c=relaxed/simple;
	bh=7PA2gziNbvIxRS+8YSKrtWuOO2Xy+BvGqd41uwSHpks=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jq669Z5i0qjMyvibXFo1NyA99uc25H2tJXTD2pbtM2ZgmJxA1EuA3cXJl4Uj28krP3UdoEpX7kbtbne3KL3yeYR94qU6XfJW6X4R6t3AquXC57XQq5LhZtIyi/yFB3+YYgxEm0MmGH4Z3kRJ7paeLRj1jP7Rrq/yIqHc9k5tdkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CJPWWzOg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=udcy+3tY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CJPWWzOg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=udcy+3tY; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CJPWWzOg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="udcy+3tY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CJPWWzOg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="udcy+3tY"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 93E3A1F391;
	Tue, 24 Jun 2025 10:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750761877; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/AyIgRYXGyADTrgPsHn9ho5RLo5YoBvwU62+z8DnzSY=;
	b=CJPWWzOgZs87580Dd+u1BukKnSTpoG1wIkm8ukY7ixQM6S1G2Fi2D5OTWtxvRFNcVbDE2H
	GzPCrr+s4D58TrE+uTnBgN+dr+sCk6dLBF1Tg2ArrTHM7u0NNZzbbIvJVPYmIfRbgDKG7M
	tBFt4hAGZUkLH9zW9zhI+ive7fNEwcE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750761877;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/AyIgRYXGyADTrgPsHn9ho5RLo5YoBvwU62+z8DnzSY=;
	b=udcy+3tY9JO+3arzxNpwQG0k6RfBSUnO1eBhpHh9kekZidcFkCMS375yMI8vipHDOdNUe1
	KPVMDkRQAA10FxDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CJPWWzOg;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=udcy+3tY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750761877; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/AyIgRYXGyADTrgPsHn9ho5RLo5YoBvwU62+z8DnzSY=;
	b=CJPWWzOgZs87580Dd+u1BukKnSTpoG1wIkm8ukY7ixQM6S1G2Fi2D5OTWtxvRFNcVbDE2H
	GzPCrr+s4D58TrE+uTnBgN+dr+sCk6dLBF1Tg2ArrTHM7u0NNZzbbIvJVPYmIfRbgDKG7M
	tBFt4hAGZUkLH9zW9zhI+ive7fNEwcE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750761877;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/AyIgRYXGyADTrgPsHn9ho5RLo5YoBvwU62+z8DnzSY=;
	b=udcy+3tY9JO+3arzxNpwQG0k6RfBSUnO1eBhpHh9kekZidcFkCMS375yMI8vipHDOdNUe1
	KPVMDkRQAA10FxDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 40FE113A24;
	Tue, 24 Jun 2025 10:44:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aZcdDpWBWmiGNQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 24 Jun 2025 10:44:37 +0000
Date: Tue, 24 Jun 2025 12:44:36 +0200
Message-ID: <87cyatl8q3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: GalaxySnail <me@glxys.nl>
Cc: simont@opensource.cirrus.com,
	david.rhodes@cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	lkp@intel.com,
	oe-kbuild-all@lists.linux.dev,
	patches@opensource.cirrus.com,
	perex@perex.cz,
	rf@opensource.cirrus.com,
	tiwai@suse.com
Subject: Re: [PATCH v3] ALSA: hda: add MODULE_FIRMWARE for cs35l41/cs35l56
In-Reply-To: <20250624101716.2365302-2-me@glxys.nl>
References: <002901dbe4ef$57d0cce0$077266a0$@opensource.cirrus.com>
	<20250624101716.2365302-2-me@glxys.nl>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 93E3A1F391
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
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51
X-Spam-Level: 

On Tue, 24 Jun 2025 12:17:17 +0200,
GalaxySnail wrote:
> 
> add firmware information in the .modinfo section, so that userspace
> tools can find out firmware required by cs35l41/cs35l56 kernel module
> 
> Signed-off-by: GalaxySnail <me@glxys.nl>

Signed-off-by is a legal requirement, and it must be a known identity,
no anonymity.  Could you resubmit with a proper name?


thanks,

Takashi


> ---
> Thanks for your review!
> 
> v2 -> v3: fixed typo
> v1 -> v2: fixed missing ';' in the previous patch
> 
>  sound/pci/hda/cs35l41_hda.c | 2 ++
>  sound/pci/hda/cs35l56_hda.c | 4 ++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
> index d5bc81099d0d..17cdce91fdbf 100644
> --- a/sound/pci/hda/cs35l41_hda.c
> +++ b/sound/pci/hda/cs35l41_hda.c
> @@ -2085,3 +2085,5 @@ MODULE_IMPORT_NS("SND_SOC_CS_AMP_LIB");
>  MODULE_AUTHOR("Lucas Tanure, Cirrus Logic Inc, <tanureal@opensource.cirrus.com>");
>  MODULE_LICENSE("GPL");
>  MODULE_IMPORT_NS("FW_CS_DSP");
> +MODULE_FIRMWARE("cirrus/cs35l41-*.wmfw");
> +MODULE_FIRMWARE("cirrus/cs35l41-*.bin");
> diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
> index 3f2fd32f4ad9..eedd8fdd3b8b 100644
> --- a/sound/pci/hda/cs35l56_hda.c
> +++ b/sound/pci/hda/cs35l56_hda.c
> @@ -1122,3 +1122,7 @@ MODULE_IMPORT_NS("SND_SOC_CS_AMP_LIB");
>  MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
>  MODULE_AUTHOR("Simon Trimmer <simont@opensource.cirrus.com>");
>  MODULE_LICENSE("GPL");
> +MODULE_FIRMWARE("cirrus/cs35l54-*.wmfw");
> +MODULE_FIRMWARE("cirrus/cs35l54-*.bin");
> +MODULE_FIRMWARE("cirrus/cs35l56-*.wmfw");
> +MODULE_FIRMWARE("cirrus/cs35l56-*.bin");
> -- 
> 2.50.0
> 
> 
