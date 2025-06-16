Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2A6158520
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 06:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750055203; cv=none; b=B5peM8Jo3atWuqUzZbP9EHl52fgNn5Tb1UA42AjlZNNC1wmFMEbWz9qFK0/A6x4W3bZch8wkAbHR8LAm8ZFyVKpwgGVkIMjJy87YG21uOvbKEaTDgLQqSbUV0k1u+WTntsG4EkfgTaqMfNkwYGcluvoBfezx5gWD0A88t3k/RqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750055203; c=relaxed/simple;
	bh=Cd5DJ8GhGdAJV/3P+e6FI2qK0V5T4ipeUo4EYkbuzUM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Aa3MuHDSZf1KGhk7/lFDqD2CD+KYXMtyJZ0zEQ7FWeJQFrrjeLjONAYDz6SzPYBQr+d4eJpjiv7HCLHPPuv0MuCGgljTFaBvV0szULHWKUcG6VuIHLugm+/ivdj4BleMi+g8tWK4BV/HtJz66cC/a8K+SbWJ+kgcbUGOrFRL0Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HC+49SZX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hu6tLGIk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rcifyaT3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=P8Ndl+ub; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HC+49SZX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hu6tLGIk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rcifyaT3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="P8Ndl+ub"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A40981F38F;
	Mon, 16 Jun 2025 06:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750055193; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TM8BnJnwLihHgKpZh1N/pfWX8smWwKIHYxEZVvlFanY=;
	b=HC+49SZXn2eD695SFgZF2P7Aux/mSC+0uzAmjd/djhwhqXr3BTEY4CVHyjfH7ypZNXGymt
	YiAn84/Xz1QPikKo+3RghEjFMYb2gQUP1eBkCxq9Q5XXvU4iIMO9YBTe96SlAgXE6c2gVm
	nWr7AYwQEBR+ky5MsPhvHZrrXViitFY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750055193;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TM8BnJnwLihHgKpZh1N/pfWX8smWwKIHYxEZVvlFanY=;
	b=hu6tLGIk7Eck1KrXI3uz6k5aFBKNymvqTgWgGGYWwXoxLwIZoOyHxbbxQtSqnUeocBYdzc
	NRiU1Sckv49KDcAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750055192; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TM8BnJnwLihHgKpZh1N/pfWX8smWwKIHYxEZVvlFanY=;
	b=rcifyaT3tOUGB0al4+wj+Nmq0HJ+azO6Q+ClMVf118YnKDVs8/SCJjL29VWRpD8SmwFiW1
	5+WDhDWziYOkFF3mAn1ejB2E+CB09BxsbhUEZGpb7Qlx/yOkGTwdOi34RQefoj5d9jMPkG
	pxKL0MveSLfaqoLjFEn/Owbs7woBX8k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750055192;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TM8BnJnwLihHgKpZh1N/pfWX8smWwKIHYxEZVvlFanY=;
	b=P8Ndl+ubhZhzsVH7w3ddyXA7bVC1Q1Dk9e6CHSyl2jsLl2+NT3YQFfFuUvtCvrnyPDlSLJ
	gdNQf+VtPmTs4jCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6E705139E2;
	Mon, 16 Jun 2025 06:26:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WA2IGRi5T2jzEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 16 Jun 2025 06:26:32 +0000
Date: Mon, 16 Jun 2025 08:26:32 +0200
Message-ID: <87o6uop5gn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] ALSA: pcm: Replace [audio_]tstamp_[n]sec by struct __snd_timespec64 in struct snd_pcm_mmap_status_x32
In-Reply-To: <e46139ed61bc52fab51babadb8b656fa1aa15506.1750050658.git.christophe.leroy@csgroup.eu>
References: <e46139ed61bc52fab51babadb8b656fa1aa15506.1750050658.git.christophe.leroy@csgroup.eu>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -7.30

On Mon, 16 Jun 2025 07:12:23 +0200,
Christophe Leroy wrote:
> 
> To match struct __snd_pcm_mmap_status and enable reuse of
> snd_pcm_sync_ptr_get_user() and snd_pcm_sync_ptr_put_user() by
> snd_pcm_sync_ptr() replace tstamp_sec and tstamp_nsec fields by
> a struct __snd_timespec64 in struct snd_pcm_mmap_status_x32.
> Do the same with audio_tstamp_sec and audio_tstamp_nsec.
> 
> This is possible because struct snd_pcm_mmap_status_x32 is packed
> and __SND_STRUCT_TIME64 is always defined for kernel which means
> struct __snd_timespec64 is always defined as struct __kernel_timespec
> which is:
> 
> 	struct __kernel_timespec {
> 		long long tv_sec;
> 		long long tv_nsec;
> 	};
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Fixes: a0f3992ee86e ("ALSA: pcm: Replace [audio_]tstamp_[n]sec by struct __snd_timespec in struct snd_pcm_mmap_status32")
> Closes: https://lore.kernel.org/all/20250616130126.08729b84@canb.auug.org.au/
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> Might be squashed with a0f3992ee86e if you happen to rebase sound tree.

Since your patches are the last ones, I rebased now exceptionally.


thanks,

Takashi
