Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8DB13B58B
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 09:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750584728; cv=none; b=QIIr5Lw4EoZb+8FLriv0GmG1pxV9rJLvtEZvRzf/5RBNyFGzZ3e+ETMfcvzJ3SV5C712zFZexGjcNlIvA4NH3DAhTTSHCfNe0XEX0lW1DzKrVy3pFdmQXnZigzH1KCJcwjO8MI20XGfwkEkyyHrNjgUyeGSduv8L5oZzvGf2j5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750584728; c=relaxed/simple;
	bh=SK/Scp2evJ7oxS0LuSoIroKqQUaFdexYMVy5yXP/mHs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fgYmU6+gQjpUJ6mlFnD7tqlqkmzoSlo+5aUjVdcQy0trb9v7ZeMBPqSHuYY3/qba7baCjfnINq4TKo1CwI7cn1nOPWC7h19Fy48GTcrVmDGL1uEWSyRzayKg/K23UV5qVHDUPa5qZlz2vs7fbVssMjXsdgO0XYj6fD7Bhd1wotw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OQFUkg8X; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tgQ2rV1b; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zAbZ+Ilk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eTDuhkp/; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OQFUkg8X";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tgQ2rV1b";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zAbZ+Ilk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eTDuhkp/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CE4121F388;
	Sun, 22 Jun 2025 09:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750584725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eXbPdzoN3z/dImJCR/ZE4KPTLkgMQ7udahG1QxRCciI=;
	b=OQFUkg8XjI1aabOHPu3kkiSoWQ2F1V/4o+zBljmMxc9/0I81CVGpHMuRYxr2/YY8OY97GY
	YM6O1rpkHRKkbPadSGlmA0REHvfO+MYRRYN+rIf39JvXMyPVq5o6Xzdh4pBHD2pjqkjfQb
	qe0OIjjH/7Ojcn+NIH3TCedo8oxJE3s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750584725;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eXbPdzoN3z/dImJCR/ZE4KPTLkgMQ7udahG1QxRCciI=;
	b=tgQ2rV1b7Pxv6g8kz7u225K2dltzt3zRrOG+TGnvHJZeVxHSZuLPAtiodVkRb1uEX7JxDC
	8QyZP11WTXXLaeDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zAbZ+Ilk;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="eTDuhkp/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750584723; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eXbPdzoN3z/dImJCR/ZE4KPTLkgMQ7udahG1QxRCciI=;
	b=zAbZ+Ilkl+fDVaaL7Rk7Ji8pjqxyhtQ4KZku8aZN2IfHnZQwv8+mcn3FCgc1S9q9rrXUlZ
	RryUk3R4fIBZVI5GH5xuIcwD7Yrz/X4/C56zaKnzITeQNosx0IdM1OBMKHoaWk4EbDBysi
	r1YV+8ePh6i7fOqyO6yj5M3mCKpsKIU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750584723;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eXbPdzoN3z/dImJCR/ZE4KPTLkgMQ7udahG1QxRCciI=;
	b=eTDuhkp/QI1HflyMmK5c3NVzQ+LlUSUAP7Zn7IDFtzz811sDRru7s5dDkflrRqrI5rdGVl
	f668Gzvt0q21kNDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A1D7D13A69;
	Sun, 22 Jun 2025 09:32:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ht3xJZPNV2iWLAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 22 Jun 2025 09:32:03 +0000
Date: Sun, 22 Jun 2025 11:32:03 +0200
Message-ID: <87ldpkw298.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: SunOfLife1 <sunoflife1.git@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek - Enable mute LED on HP Pavilion Laptop 15-eg100
In-Reply-To: <20250621053832.52950-1-sunoflife1.git@gmail.com>
References: <87qzzu8tuc.wl-tiwai@suse.de>
	<20250621053832.52950-1-sunoflife1.git@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: CE4121F388
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid]
X-Spam-Score: -2.01
X-Spam-Level: 

On Sat, 21 Jun 2025 07:36:14 +0200,
SunOfLife1 wrote:
> 
> Sorry about that! This is my first time doing anything like this. ^^;
> I've restored the original patch description with the proper sign-off. Hopefully this is suitable now. :)
> 
> 
> The HP Pavilion Laptop 15-eg100 has Realtek HDA codec ALC287.
> It needs the ALC287_FIXUP_HP_GPIO_LED quirk to enable the mute LED.
> 
> Signed-off-by: Yasmin Fitzgerald <sunoflife1.git@gmail.com>

Applied now.  Thanks.


Takashi
