Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8F21D61BC
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749826749; cv=none; b=f+0KFap9N7PT9h2qSxGnWjmLgDcmMicCCRftU2n0alJznvIfq/DHbDj+q7AzeyjIELDqeNYGtSRuLCaj5/4aiUkD67VDptbhlc3VBOomqApqsMmsmVNNOJjjQwkWppi4CMJcsYeL9pJlZiSRfhfB/hWGlIUpDYuWZctf1GzVj58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749826749; c=relaxed/simple;
	bh=pUKI2jfySVdWRDHA1kr+oyakX4sySindSmx0hr3ZFTQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A+Tc4sDrRBv5m+fc31fj6+Tv7PZoW4gQFCIK0UnwCu8PFgsJlPoeDbxiEYC2DkAd6zY/zO+yF/kzzogjKtIV5yTGZyYejo+kkKyXSxDuQzIUGSDYPBEBSQS1J9vtx/v91V1fFDqTWIjcw8QynGEb9fPTSzkJhbwfERLltjwTM0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=n/QA8JZM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oUtr1uH0; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=n/QA8JZM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oUtr1uH0; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="n/QA8JZM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oUtr1uH0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="n/QA8JZM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oUtr1uH0"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 47F6E21998;
	Fri, 13 Jun 2025 14:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749826746; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RvnuzgtMSI9Np/g2y/zyYte66ezEy6r674XqmB2jKLk=;
	b=n/QA8JZMV23zhNbjtY69jGC9whE4ZOSKm2+qTzm4per3XpCWNo4AAlfBW1zHMm1WNEuhy4
	f2oC2gpKMWdlF1b8RWRaH85z03+AayLp4zpV+vGPJXaqZQFOQ1sgi9wfs+l2Dxc6dPzfdQ
	YgG3YBZfgB3GriEcR2yieLnm/KdCWI8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749826746;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RvnuzgtMSI9Np/g2y/zyYte66ezEy6r674XqmB2jKLk=;
	b=oUtr1uH04N97QdcVlxl8mWqPIHnKKZfLYmyeFEbjl2wBHPKWyZ/Zw6BAoQjKGI/ViBP5XV
	6W56eswJ/xiFuuCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749826746; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RvnuzgtMSI9Np/g2y/zyYte66ezEy6r674XqmB2jKLk=;
	b=n/QA8JZMV23zhNbjtY69jGC9whE4ZOSKm2+qTzm4per3XpCWNo4AAlfBW1zHMm1WNEuhy4
	f2oC2gpKMWdlF1b8RWRaH85z03+AayLp4zpV+vGPJXaqZQFOQ1sgi9wfs+l2Dxc6dPzfdQ
	YgG3YBZfgB3GriEcR2yieLnm/KdCWI8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749826746;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RvnuzgtMSI9Np/g2y/zyYte66ezEy6r674XqmB2jKLk=;
	b=oUtr1uH04N97QdcVlxl8mWqPIHnKKZfLYmyeFEbjl2wBHPKWyZ/Zw6BAoQjKGI/ViBP5XV
	6W56eswJ/xiFuuCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 048D913782;
	Fri, 13 Jun 2025 14:59:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5GxrO7k8TGh8IAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 13 Jun 2025 14:59:05 +0000
Date: Fri, 13 Jun 2025 16:59:05 +0200
Message-ID: <87tt4jr8li.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH 3/3] ALSA: pcm: Convert snd_pcm_sync_ptr() to user_access_begin/user_access_end()
In-Reply-To: <4f2f8e14-22d2-44f1-82cd-5f2a3b5117b1@csgroup.eu>
References: <7baa34d4046c7750799b11830d38a46f8b581765.1749724478.git.christophe.leroy@csgroup.eu>
	<79b86a0618328ba1d0cb5cf4011fd73ac6900e8f.1749724478.git.christophe.leroy@csgroup.eu>
	<878qlwrnv1.wl-tiwai@suse.de>
	<2df61bbf-76f6-4932-a347-7820350a156e@csgroup.eu>
	<87wm9frf5x.wl-tiwai@suse.de>
	<4f2f8e14-22d2-44f1-82cd-5f2a3b5117b1@csgroup.eu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -7.27
X-Spamd-Result: default: False [-7.27 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.17)[-0.860];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
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

On Fri, 13 Jun 2025 14:46:46 +0200,
Christophe Leroy wrote:
> 
> 
> 
> Le 13/06/2025 à 14:37, Takashi Iwai a écrit :
> > On Fri, 13 Jun 2025 13:03:04 +0200,
> > Christophe Leroy wrote:
> >> 
> >> 
> >> 
> >> Le 13/06/2025 à 11:29, Takashi Iwai a écrit :
> >>> On Thu, 12 Jun 2025 12:51:05 +0200,
> >>> Christophe Leroy wrote:
> >>>> 
> >>>> Now that snd_pcm_sync_ptr_get_user() and snd_pcm_sync_ptr_put_user()
> >>>> are converted to user_access_begin/user_access_end(),
> >>>> snd_pcm_sync_ptr_get_user() is more efficient than a raw get_user()
> >>>> followed by a copy_from_user(). And because copy_{to/from}_user() are
> >>>> generic functions focussed on transfer of big data blocks to/from user,
> >>>> snd_pcm_sync_ptr_put_user() is also more efficient for small amont of
> >>>> data.
> >>>> 
> >>>> So use snd_pcm_sync_ptr_get_user() and snd_pcm_sync_ptr_put_user() in
> >>>> snd_pcm_sync_ptr() too.
> >>>> 
> >>>> In order to have snd_pcm_mmap_status32 similar to snd_pcm_mmap_status,
> >>>> replace to tsamp_{sec/nsec} and audio_tstamp_{sec/nsec} by equivalent
> >>>> struct __snd_timespec.
> >>>> 
> >>>> snd_pcm_ioctl_sync_ptr_buggy() is left as it is because the conversion
> >>>> wouldn't be straigh-forward do to the workaround it provides.
> >>>> 
> >>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> >>> 
> >>> Through a quick glance, all patches look almost fine, but one favor to
> >>> ask: this patch contains the convert from s32/s32 pair to struct
> >>> __snd_timespec.  It should be factored out to a prerequisite patch
> >>> instead of burying in a big change.
> >> 
> >> Shall I understand you prefer this series over the more simple "ALSA:
> >> pcm: Convert snd_pcm_ioctl_sync_ptr_{compat/x32} to
> >> user_access_begin/user_access_end()" patch ?
> > 
> > Err, no, sorry for ambiguity.
> 
> Then I'm lost.
> 
> I sent two alternative proposals:
> A/ Single patch, simple, handling only two fonctions
> snd_pcm_ioctl_sync_ptr_{compat/x32} , without refactoring. [1]
> B/ This RFC series, more elaborate, refactoring and putting user copy
> into helper macros. [2]
> 
> So the question was to be sure you prefer alternative B over
> alternative A. I guess the answer is YES as you asking me improve it.

Right, let's go with the RFC series with refactoring.


thanks,

Takashi

> 
> [1]
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/8df11af98033e4cb4d9b0f16d6e9d5b69110b036.1749724057.git.christophe.leroy@csgroup.eu/
> [2]
> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?state=*&series=460665
> 
> 
> > I wanted to move the replacement of tstamp_sec/nsec with struct
> > __snd_timespec as a small preliminary patch from patch#3.
> > That is,
> 
> Yes that's what I understood.
> 
> Thanks
> Christophe
> 
> 
> > --- a/sound/core/pcm_native.c
> > +++ b/sound/core/pcm_native.c
> > @@ -3103,11 +3103,9 @@ struct snd_pcm_mmap_status32 {
> >   	snd_pcm_state_t state;
> >   	s32 pad1;
> >   	u32 hw_ptr;
> > -	s32 tstamp_sec;
> > -	s32 tstamp_nsec;
> > +	struct __snd_timespec tstamp;
> >   	snd_pcm_state_t suspended_state;
> > -	s32 audio_tstamp_sec;
> > -	s32 audio_tstamp_nsec;
> > +	struct __snd_timespec audio_tstamp;
> >   } __packed;
> > etc.  By factoring this out, it becomes clear that the timespec
> > compatibility is fully cared.
> > 
> > __snd_timespec may be defined in different ways on user-space, but in
> > the kernel code, it's a single definition of s32/s32 pair.  This needs
> > to be emphasized.
> > 
> > 
> > thanks,
> > 
> > Takashi
> 
