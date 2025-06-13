Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEBE291C17
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 09:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749806968; cv=none; b=ZikknnF6thImd/hhoo7csTwkZFJIpRhXEVESAUN4vsznZtuinDgviv7A5nAh9tUgJhqBnAb/NajqogDmm63Gzjy/UuU50bH3kmWPHBBnlR0xyLffDTP+fLcGTr0IN87I9CWMccaphkyTtNzA+Pk/HJ4z8Zf2paE2a79y/tnU8SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749806968; c=relaxed/simple;
	bh=aaWU0JbRBgJpEiuAAKKpR0HniuEKPBx62vLLuPv5jcc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IofQE7Nd77mKYru9SGRiXSirEsw9So58/5fLGf1iNRyP3/OSJPlSVLYEXKgAIQdaMEUIqd3Q14UDIqfSp6mDCFiBJI6Kk5oQ+bzOg2ULzMAbWLink4UnvPoU6VkhmMjLJ7ulC5/sW8Mr8Qu5oqpieeWnoGEcj8gJ5NCp/ADoY7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XHHurhqz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yklLGTdN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XHHurhqz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yklLGTdN; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XHHurhqz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yklLGTdN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XHHurhqz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yklLGTdN"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3B9311F7F7;
	Fri, 13 Jun 2025 09:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749806963; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=72rtZU9GPUCX6PrpkBBfovdIHSFV6jLcLA2KhXYzn7A=;
	b=XHHurhqzQ7lHaxDJMcutUKIg/R/gLJcWMndGnSXfm3w9lF0Kh11U3VyRnW8kPdyw34Sv9h
	K6QSUfc4ODnwptBFyXqK2gLWnaK08u6wMLqktiWpQSGEJ0DUklE/rdoXn82HJSfq1+KGB2
	IFLo9BBcCh+gT6fxohNqV1+msbuE4Y4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749806963;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=72rtZU9GPUCX6PrpkBBfovdIHSFV6jLcLA2KhXYzn7A=;
	b=yklLGTdNEzPOLGMCIFlLpbe509WfQuwTWxUr3TEiaiaPPNRfq4a5oa1YRUo2Brzv+xHSMV
	nXJfYUuNGZgjalBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749806963; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=72rtZU9GPUCX6PrpkBBfovdIHSFV6jLcLA2KhXYzn7A=;
	b=XHHurhqzQ7lHaxDJMcutUKIg/R/gLJcWMndGnSXfm3w9lF0Kh11U3VyRnW8kPdyw34Sv9h
	K6QSUfc4ODnwptBFyXqK2gLWnaK08u6wMLqktiWpQSGEJ0DUklE/rdoXn82HJSfq1+KGB2
	IFLo9BBcCh+gT6fxohNqV1+msbuE4Y4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749806963;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=72rtZU9GPUCX6PrpkBBfovdIHSFV6jLcLA2KhXYzn7A=;
	b=yklLGTdNEzPOLGMCIFlLpbe509WfQuwTWxUr3TEiaiaPPNRfq4a5oa1YRUo2Brzv+xHSMV
	nXJfYUuNGZgjalBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E5B76137FE;
	Fri, 13 Jun 2025 09:29:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rTHMNnLvS2hZOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 13 Jun 2025 09:29:22 +0000
Date: Fri, 13 Jun 2025 11:29:22 +0200
Message-ID: <878qlwrnv1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH 3/3] ALSA: pcm: Convert snd_pcm_sync_ptr() to user_access_begin/user_access_end()
In-Reply-To: <79b86a0618328ba1d0cb5cf4011fd73ac6900e8f.1749724478.git.christophe.leroy@csgroup.eu>
References: <7baa34d4046c7750799b11830d38a46f8b581765.1749724478.git.christophe.leroy@csgroup.eu>
	<79b86a0618328ba1d0cb5cf4011fd73ac6900e8f.1749724478.git.christophe.leroy@csgroup.eu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-7.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -7.30

On Thu, 12 Jun 2025 12:51:05 +0200,
Christophe Leroy wrote:
> 
> Now that snd_pcm_sync_ptr_get_user() and snd_pcm_sync_ptr_put_user()
> are converted to user_access_begin/user_access_end(),
> snd_pcm_sync_ptr_get_user() is more efficient than a raw get_user()
> followed by a copy_from_user(). And because copy_{to/from}_user() are
> generic functions focussed on transfer of big data blocks to/from user,
> snd_pcm_sync_ptr_put_user() is also more efficient for small amont of
> data.
> 
> So use snd_pcm_sync_ptr_get_user() and snd_pcm_sync_ptr_put_user() in
> snd_pcm_sync_ptr() too.
> 
> In order to have snd_pcm_mmap_status32 similar to snd_pcm_mmap_status,
> replace to tsamp_{sec/nsec} and audio_tstamp_{sec/nsec} by equivalent
> struct __snd_timespec.
> 
> snd_pcm_ioctl_sync_ptr_buggy() is left as it is because the conversion
> wouldn't be straigh-forward do to the workaround it provides.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Through a quick glance, all patches look almost fine, but one favor to
ask: this patch contains the convert from s32/s32 pair to struct
__snd_timespec.  It should be factored out to a prerequisite patch
instead of burying in a big change.

I'm asking it because this timepsec definition is very confusing (and
complex) due to historical reasons, and it should be handled with a
special care.
IIUC, struct __snd_timespec is always s32/s32 for the kernel code, so
the conversion must be fine.  This needs to be commented in the
commit.


Thanks!

Takashi
