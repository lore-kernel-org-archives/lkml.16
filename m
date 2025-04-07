Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856D4227EBB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010663; cv=none; b=qFssfNQ/s1eLHJ6vibWZLQGTQfkg7bFm3XETjNwd/slOvc0ICIriCWgYeQAblSRIsW1DBIj7liSNF3RgnofiM2ubZqdLzFgnMSolbzXEW7/ZC2a+g/I6BKx11H0+klNtfC7fOKv06OuZMQlteu4WKQJhuF6yyuk/c1HZdNyEULs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010663; c=relaxed/simple;
	bh=g2jh8qxFjNVmTT054dLE7NXTT/LDZW8VfnPhvGKcqR0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tYBchEm2AgLVFdziE2pbVEQPPhEkmY+EhjFzb0/P4qA3E+gxOihfD+JMz/8r5BTiQhlQePJPZ/FrJ7C11rMQuqPSQW3dA/f/2c8A0Z0mefjNNMu41NOXUKyH44Amy5y598+iiHVMfZAfA774T7siHB9HoCPzH/X1+OS2Cyxj+qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=biHz2azs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=w/lDg+UF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=biHz2azs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=w/lDg+UF; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="biHz2azs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="w/lDg+UF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="biHz2azs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="w/lDg+UF"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B1D042119D;
	Mon,  7 Apr 2025 07:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744010659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w7OwujLM1Gf7nXgT2lqd0dMzptfeJ2lG7J3xc5dMYGM=;
	b=biHz2azsqZ0hQvKLst7BgyWtUUHbAkWAD5h6NSruBvJtfEtq8AEQOeMh4ZWHuYcQL23c6W
	hvuTebhYywxB7/4ydEQoeQWTUncuXYgFI6j1XW66vqzfbhl1C+Ah4k+DWscpmXGhnk3bwd
	N5TnKN3/k+/bnk+e/EG5ju0/lnfmaL8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744010659;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w7OwujLM1Gf7nXgT2lqd0dMzptfeJ2lG7J3xc5dMYGM=;
	b=w/lDg+UFFS5Wb05qV7wCjYsIh/81zGaXhyVymeIf7+CM6MJ5X0wqMaE8/ddtAFsgW8SFbp
	YaIaoQKn8+eh78AA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=biHz2azs;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="w/lDg+UF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744010659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w7OwujLM1Gf7nXgT2lqd0dMzptfeJ2lG7J3xc5dMYGM=;
	b=biHz2azsqZ0hQvKLst7BgyWtUUHbAkWAD5h6NSruBvJtfEtq8AEQOeMh4ZWHuYcQL23c6W
	hvuTebhYywxB7/4ydEQoeQWTUncuXYgFI6j1XW66vqzfbhl1C+Ah4k+DWscpmXGhnk3bwd
	N5TnKN3/k+/bnk+e/EG5ju0/lnfmaL8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744010659;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w7OwujLM1Gf7nXgT2lqd0dMzptfeJ2lG7J3xc5dMYGM=;
	b=w/lDg+UFFS5Wb05qV7wCjYsIh/81zGaXhyVymeIf7+CM6MJ5X0wqMaE8/ddtAFsgW8SFbp
	YaIaoQKn8+eh78AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 26FD313A4B;
	Mon,  7 Apr 2025 07:24:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jkYwCKN982ccFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 07 Apr 2025 07:24:19 +0000
Date: Mon, 07 Apr 2025 09:24:18 +0200
Message-ID: <87ecy41ljx.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: phasta@kernel.org,
	Philipp Stanner <phasta@mailbox.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Clemens
 Ladisch <clemens@ladisch.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark
 Brown <broonie@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Bard Liao
 <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Maxim Mikityanskiy <maxtram95@gmail.com>,
	Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>,
	He Lugang <helugang@uniontech.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Tang Bin <tangbin@cmss.chinamobile.com>,
	linux-parisc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/11] sound: Replace deprecated PCI functions
In-Reply-To: <01627e70902d331f7a9e8c08bd5c78dc6991ea74.camel@mailbox.org>
References: <20250404121911.85277-2-phasta@kernel.org>
	<87plhs2g4h.wl-tiwai@suse.de>
	<01627e70902d331f7a9e8c08bd5c78dc6991ea74.camel@mailbox.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B1D042119D
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[22];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[suse.de,perex.cz,suse.com,ladisch.de,gmail.com,kernel.org,linux.dev,linux.intel.com,renesas.com,uniontech.com,baylibre.com,loongson.cn,cmss.chinamobile.com,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Fri, 04 Apr 2025 15:49:36 +0200,
Philipp Stanner wrote:
> 
> On Fri, 2025-04-04 at 15:47 +0200, Takashi Iwai wrote:
> > On Fri, 04 Apr 2025 14:19:01 +0200,
> > Philipp Stanner wrote:
> > > 
> > > pcim_iomap_table() and pcim_iomap_regions() have been deprecated by
> > > the
> > > PCI subsystem. In sound/, they can easily be replaced with
> > > pcim_iomap_region().
> > > 
> > > This series was around some time in late summer last year as a
> > > single
> > > patch. I lost track of it for a while, but Takashi Iwai (AFAIR)
> > > requested that I split it by component.
> > > 
> > > So that's being done here. Feel free to squash the patches as you
> > > like.
> > 
> > Thanks for the patches.  I suppose those are no urgent fixes, and can
> > be postponed for 6.16?  If so, I'll pick them up after 6.15-rc1 merge
> > window is closed.
> 
> Sure, those are just improvements that aren't urgent.

Now all patches applied to for-next branch.  Thanks.


Takashi
