Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F951F153C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 07:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745479413; cv=none; b=EC+bBYP5LXJKB8ZCWkDPxbT4qI6CJ+f9o8ZDfgqgyqwdH2cLZKyIh/yNP/+TAqlxNPomoH9wzcVG/nzOJpOOnnXs1S3myKd/0LokHYWVmmMGFzLWHDc4DMwXNxdt+ABUHnw1pGMktiMkek6gwh72oyiE2JEbVOFRjPtMLt+YW7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745479413; c=relaxed/simple;
	bh=5NT6kWcIz4H9m0zVWfgV4bUPCBkkH2fpP69Ik4K3HPc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QppGwF4urxM0fgCW6zyi/zCIcPTuiu305WMi/R9Zq6uPqfGStFPeSgbH9qPn/VTM3i9BPVM2etMTLhISGbDxAF5Mbo7pTrm163Jc9zhJdpsoB/lp16Rkabq8ifza29SqaYsow6zPWNIPwOrzFmKuyz0rk9TzHGjrt7sK5/BBEh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AhHzssur; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8gd5MMwf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AhHzssur; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8gd5MMwf; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AhHzssur";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8gd5MMwf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AhHzssur";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8gd5MMwf"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C9CD71F38C;
	Thu, 24 Apr 2025 07:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745479409; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wcud0PH08x8fmB63EBVvjnChXUAuJs8O5JHkRmWvXx0=;
	b=AhHzssurAVQKGr57SWusajemDZp1JCVKusWIkm85IGdSX+ZglWTahk66k089r3F2QXH3Y7
	bjyPX6H1TuATz47f8BzlEhJD0APkNxBibbvPFWSbQFh/J0uBEns+X3gh7fQHUAKt+9ng6r
	0izKXM36FXbkheHzaqNDTwc1k0sX2KE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745479409;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wcud0PH08x8fmB63EBVvjnChXUAuJs8O5JHkRmWvXx0=;
	b=8gd5MMwfsnl1fsJAznYvWqnrRXUNUYRw5J/YEnYMIbB6IExTZyl/J/zrqCebn1L4gstpEi
	MAFv7ZBimvB/lRCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=AhHzssur;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=8gd5MMwf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745479409; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wcud0PH08x8fmB63EBVvjnChXUAuJs8O5JHkRmWvXx0=;
	b=AhHzssurAVQKGr57SWusajemDZp1JCVKusWIkm85IGdSX+ZglWTahk66k089r3F2QXH3Y7
	bjyPX6H1TuATz47f8BzlEhJD0APkNxBibbvPFWSbQFh/J0uBEns+X3gh7fQHUAKt+9ng6r
	0izKXM36FXbkheHzaqNDTwc1k0sX2KE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745479409;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wcud0PH08x8fmB63EBVvjnChXUAuJs8O5JHkRmWvXx0=;
	b=8gd5MMwfsnl1fsJAznYvWqnrRXUNUYRw5J/YEnYMIbB6IExTZyl/J/zrqCebn1L4gstpEi
	MAFv7ZBimvB/lRCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5CB5F1393C;
	Thu, 24 Apr 2025 07:23:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LWtqFfHmCWgBcwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 24 Apr 2025 07:23:29 +0000
Date: Thu, 24 Apr 2025 09:23:28 +0200
Message-ID: <8734dy3tvz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Philipp Stanner <phasta@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jaya Kumar <jayakumar.alsa@gmail.com>,
	Clemens Ladisch <clemens@ladisch.de>,
	Colin Ian King <colin.i.king@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Mark Brown <broonie@kernel.org>,
	liujing <liujing@cmss.chinamobile.com>,
	Andres Urian Florez <andres.emb.sys@gmail.com>,
	Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	David Rhodes <drhodes@opensource.cirrus.com>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/28] ALSA: Phase out hybrid PCI devres API
In-Reply-To: <20250423075346.45907-1-phasta@kernel.org>
References: <20250423075346.45907-1-phasta@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: C9CD71F38C
X-Spam-Score: -2.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,ladisch.de,linux.intel.com,baylibre.com,kernel.org,cmss.chinamobile.com,gmx.de,linux.dev,opensource.cirrus.com,linutronix.de,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, 23 Apr 2025 09:53:18 +0200,
Philipp Stanner wrote:
> 
> Changes in v2:
>   - Add RB from Andy
>   - Remove ASoC patches, branch out this series for Alsa. (Andy)
> 
> Hi,
> 
> a year ago we spent quite some work trying to get PCI into better shape.
> Some pci_ functions can be sometimes managed with devres, which is
> obviously bad. We want to provide an obvious API, where pci_ functions
> are never, and pcim_ functions are always managed.
> 
> Thus, everyone enabling his device with pcim_enable_device() must be
> ported to pcim_ functions. Porting all users will later enable us to
> significantly simplify parts of the PCI subsystem. See here [1] for
> details.
> 
> This patch series does that for sound.
> 
> Feel free to squash the commits as you see fit.
> 
> P.
> 
> [1] https://elixir.bootlin.com/linux/v6.14-rc4/source/drivers/pci/devres.c#L18
> 
> Philipp Stanner (28):
>   ALSA: sonicvibes: Use pure devres PCI
>   ALSA: rme96: Use pure devres PCI
>   ALSA: rme32: Use pure devres PCI
>   ALSA: ens1370: Use pure devres PCI
>   ALSA: cmipci: Use pure devres PCI
>   ALSA: via82: Use pure devres PCI
>   ALSA: sis7019: Use pure devres PCI
>   ALSA: intel8x: Use pure devres PCI
>   ALSA: fm801: Use pure devres PCI
>   ALSA: es19x8: Use pure devres PCI
>   ALSA: azt3328: Use pure devres PCI
>   ALSA: als: Use pure devres PCI
>   ALSA: oxygen: Use pure devres PCI
>   ALSA: lx6464es: Use pure devres PCI
>   ALSA: vx222: Use pure devres PCI
>   ALSA: trident: Use pure devres PCI
>   ALSA: rme9652: Use pure devres PCI
>   ALSA: ymfpci: Use pure devres PCI
>   ALSA: riptide: Use pure devres PCI
>   ALSA: nm256: Use pure devres PCI
>   ALSA: ice: Use pure devres PCI
>   ALSA: emu10k1: Use pure devres PCI
>   ALSA: echoaudio: Use pure devres PCI
>   ALSA: cs5535: Use pure devres PCI
>   ALSA: cs46xx: Use pure devres PCI
>   ALSA: ca0106: Use pure devres PCI
>   ALSA: ali5451: Use pure devres PCI
>   ALSA: maestro3: Use pure devres PCI

Applied to for-next branch now.  Thanks.


Takashi
