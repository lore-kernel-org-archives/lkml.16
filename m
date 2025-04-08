Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5617020A5EE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 05:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744089785; cv=none; b=F+Ev8y4lN+RGoORHAGynBN5EtmhHea6uJSb4ANHeGTknWYBJ8rF+jQ45Sz/VL6W5l21O5qibEnlqmKmgK/4WqxGYZzl5MTG7i0yUM/qu/2l355hPh8UO83UloqUs8+BbHhrIiCp795wDxFjVG31on71Mdd6zAkbwYzhGnR3kbMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744089785; c=relaxed/simple;
	bh=kuaUaBppjC3pVohX/ZirHPmZTmFoBhG+ay7OGmaCfK4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ccfm8f5Xub8b4+cjvE1qagSwIYU0tIiIzs2KhJUsz7sn4vSEwz3tRm/jIjR0OrRQOs8oC42QYqHCNiZllYdICVuGK1+2wVtEH2xnQiHYiu8QE1mjx7DnCc0Zr9iERowpRWuHwYoMAORRz9drOvLclO3telMmmPyoJTSnoAYdlMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kN/mGuLB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TreGu643; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kN/mGuLB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TreGu643; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kN/mGuLB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TreGu643";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kN/mGuLB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TreGu643"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 927A92117F;
	Tue,  8 Apr 2025 05:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744089775; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MaL9R8uqMyLYrAkKk+9UKfW5eq2Lkk+0ZVyqZSvS72Q=;
	b=kN/mGuLB52nPNRsKhhmBHd5RxhLR5oOmAYILDYFTKYzvXqDH8ImCsIvg9I6cmZmmdPjdRb
	H2nAQwtK3KauvvCeU/HrjMHhL45/zUOwppwzUy4N28w+B1PpZaTjGF7PjOEk3MhOUFwfba
	FE8bVRpqGZDvhOaaZyYBFo6XETwYPYw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744089775;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MaL9R8uqMyLYrAkKk+9UKfW5eq2Lkk+0ZVyqZSvS72Q=;
	b=TreGu64377ixgPhqf+aCfCDtrTyXRmccmZzNVWiTbeDuU79vhhlkWr1Z1vntgWAzc5RAHR
	gR4uLre76R0YmGCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="kN/mGuLB";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=TreGu643
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744089775; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MaL9R8uqMyLYrAkKk+9UKfW5eq2Lkk+0ZVyqZSvS72Q=;
	b=kN/mGuLB52nPNRsKhhmBHd5RxhLR5oOmAYILDYFTKYzvXqDH8ImCsIvg9I6cmZmmdPjdRb
	H2nAQwtK3KauvvCeU/HrjMHhL45/zUOwppwzUy4N28w+B1PpZaTjGF7PjOEk3MhOUFwfba
	FE8bVRpqGZDvhOaaZyYBFo6XETwYPYw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744089775;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MaL9R8uqMyLYrAkKk+9UKfW5eq2Lkk+0ZVyqZSvS72Q=;
	b=TreGu64377ixgPhqf+aCfCDtrTyXRmccmZzNVWiTbeDuU79vhhlkWr1Z1vntgWAzc5RAHR
	gR4uLre76R0YmGCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 092DB1371A;
	Tue,  8 Apr 2025 05:22:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id m2duAK+y9Gd+GQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 08 Apr 2025 05:22:55 +0000
Date: Tue, 08 Apr 2025 07:22:54 +0200
Message-ID: <87tt6zb51t.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Clemens Ladisch <clemens@ladisch.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Maxim Mikityanskiy <maxtram95@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	He Lugang <helugang@uniontech.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Tang Bin <tangbin@cmss.chinamobile.com>,
	Philipp Stanner <phasta@kernel.org>,
	linux-parisc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 00/11] sound: Replace deprecated PCI functions
In-Reply-To: <174406895437.1337819.1919250165088744285.b4-ty@kernel.org>
References: <20250404121911.85277-2-phasta@kernel.org>
	<174406895437.1337819.1919250165088744285.b4-ty@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 927A92117F
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,ladisch.de,gmail.com,linux.dev,linux.intel.com,renesas.com,uniontech.com,baylibre.com,loongson.cn,cmss.chinamobile.com,kernel.org,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Tue, 08 Apr 2025 01:35:54 +0200,
Mark Brown wrote:
> 
> On Fri, 04 Apr 2025 14:19:01 +0200, Philipp Stanner wrote:
> > pcim_iomap_table() and pcim_iomap_regions() have been deprecated by the
> > PCI subsystem. In sound/, they can easily be replaced with
> > pcim_iomap_region().
> > 
> > This series was around some time in late summer last year as a single
> > patch. I lost track of it for a while, but Takashi Iwai (AFAIR)
> > requested that I split it by component.
> > 
> > [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> 
> Thanks!
> 
> [11/11] ASoC: loongson: Replace deprecated PCI functions
>         commit: 7288aa73e5cfb3f37ae93b55d7b7d63eca5140a8
> 
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
> 
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
> 
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
> 
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.

Oh, I already applied this one blindly as a part of series to my
tree.  But it's a trivial fix and shouldn't be a big problem to apply
twice...


Takashi
