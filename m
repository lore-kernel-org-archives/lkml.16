Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1A02D7BF
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745305404; cv=none; b=Q0B/XILqEIo5nRlKhvMdIYfxSruHhq9AnzlhPPyCv+9wukvlbAaonvU0bqPQHeu0ldvy6onZ7mHpvX8EnwLQACCiss3dsbhHesbNG/uiW5ZC2HT7pj5ZB+g2g48dCc6PZGLJxZrE7CrjEHn1YR+FuEWpyFTVlXZYc56RlVPwNuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745305404; c=relaxed/simple;
	bh=LxEMLyPQ73fG9lIO06/X1CO1m6w/U4PQMOW7fYfmYJc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nEV22Ly3zi11UZtvfjj+6taZofy6goXrl1AbGp88oaFNx92g2lIK+jH/jSczkIyMl6YoOXP4QaaOSi/bsp+G2pdihLIZAt7cw5astrwhdn/a+9c9ukuOfZHDItrIlItD2p0aah5uKMAH0P+YbyCgEZbhpSdlxbxK1DsC2/SjQV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NsRNPcul; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NGE7oubV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=E0iXbANk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sd/KqWJn; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NsRNPcul";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NGE7oubV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E0iXbANk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sd/KqWJn"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DDA692124C;
	Tue, 22 Apr 2025 07:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745305401; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xrtPbid4FDSsTkJYjZhOuQ0DFTDDsbBQ/VbjS7sQ97Q=;
	b=NsRNPculeM3m0hpZwsJKd4G5Ds7/1L4wUS4B+hW6ZCfQ88hz9CT/CJZwXNTf6tNOZUlYwA
	VjnOIPEOjtEKUy7gRMCWUWxRdy8ZrWWyY+PYyg43urp404MwfjvnRBD63gRm48K+ZIjkcm
	JQF4FWV5yQFtjKyXE3vLQCTuR/ZztHM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745305401;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xrtPbid4FDSsTkJYjZhOuQ0DFTDDsbBQ/VbjS7sQ97Q=;
	b=NGE7oubVus6DbGtO4KNpPy/4/OGdHv+26MdkdIDYoZLe2nia7TSB2Yq/0T4MJiOl72ym6b
	n8GVNOhpgsYIOaDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=E0iXbANk;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="sd/KqWJn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745305400; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xrtPbid4FDSsTkJYjZhOuQ0DFTDDsbBQ/VbjS7sQ97Q=;
	b=E0iXbANkozczCxrjIRZfnzehGy7XxRwkxPaTIGb7rr8xGvJpuAgFWOOnxEPoVNfxKNYBN/
	kGWLzSe52MI0sGiJ7Fy+OT5/B3pw8TlYHnQtY7uzJbp0yvc0vmiL0k9nGTLnChVL6dbneA
	DLvqjDDaI8HceK8okdx+qvLj8yyNFr0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745305400;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xrtPbid4FDSsTkJYjZhOuQ0DFTDDsbBQ/VbjS7sQ97Q=;
	b=sd/KqWJngiZhCnOxzErXVXCZ/+WjDzvNBwkKH+nPqdaCXZsdBqLpL/tzIg2q0ci9UW5hCl
	jjIto27uuuHuggCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B4FF9137CF;
	Tue, 22 Apr 2025 07:03:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3C1cKjg/B2iOMgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 22 Apr 2025 07:03:20 +0000
Date: Tue, 22 Apr 2025 09:03:20 +0200
Message-ID: <875xiwu18n.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Hillf Danton <hdanton@sina.com>
Cc: alsa-devel@alsa-project.org,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/9] ALSA: usb-audio: Fix possible race at sync of urb completions
In-Reply-To: <20250421233900.4221-1-hdanton@sina.com>
References: <20210929080844.11583-1-tiwai@suse.de>
	<20210929080844.11583-3-tiwai@suse.de>
	<20250418103533.4078-1-hdanton@sina.com>
	<87a58dvia7.wl-tiwai@suse.de>
	<20250418144518.4097-1-hdanton@sina.com>
	<875xj0ve49.wl-tiwai@suse.de>
	<20250419080410.4148-1-hdanton@sina.com>
	<871ptnuvad.wl-tiwai@suse.de>
	<87mscat1tq.wl-tiwai@suse.de>
	<20250421104343.4197-1-hdanton@sina.com>
	<878qnttwcx.wl-tiwai@suse.de>
	<20250421233900.4221-1-hdanton@sina.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: DDA692124C
X-Spam-Score: -2.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[sina.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,sina.com];
	FREEMAIL_CC(0.00)[alsa-project.org,gmail.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Tue, 22 Apr 2025 01:38:59 +0200,
Hillf Danton wrote:
> 
> On Mon, 21 Apr 2025 16:36:30 +0200 Takashi Iwai wrote:
> > On Mon, 21 Apr 2025 12:43:42 +0200, Hillf Danton wrote:
> > > I misread "Which reads and writes are you trying to solve?" though I
> > > showed the read/write, but it is a bad case particulay with UAF.
> > > 
> > > Could you tell us what will happen if the race is not fixed? Could ep
> > > be freed with in-flight urbs for example?
> > 
> > Before the patch, wait_clear_urbs() might return earlier than actually
> > all pending eps are finished, so it can be UAF.
> > 
> Got it.
> 
> > > Is it still race if the wait loop in wait_clear_urbs() ends before the
> > > urb complete callbace completes, given the last sentence in your commit
> > > message? If nope, igore my noise please.
> > 
> > Well, your concern about the missing barrier -- that would
> > wait_clear_urbs() missing the refcount decrement, hence it would be
> > rather to make the return delayed.  So it shouldn't lead to further
> > UAF, but at most it might lead to an unnecessary delay.
> > 
> > That said, I'm willing to take a fix even for a theoretical issue if
> > it clarifies what it really fixes.  But scratching a random surface
> > isn't what we want.
> > 
> Thank you for shedding light on the race, given
> a) the mb in 26fbe9772b8c ("USB: core: Fix hang in usb_kill_urb by adding memory barriers")
> b) the urb complete callback is invoked in giveback, see __usb_hcd_giveback_urb()
> 
> use the urb routines instead to close the race.

I'm afraid that it can break things as of this form; the stopped
stream might be restarted without reinitializing URBs.  That is, this
isn't called only from disconnect or close, but also just for stopping
the stream in the middle, too.


Takashi

> 
> Note the one second timeout is also cut.
> 
> 	Hillf
> 
> --- x/sound/usb/endpoint.c
> +++ y/sound/usb/endpoint.c
> @@ -996,24 +996,14 @@ void snd_usb_endpoint_suspend(struct snd
>   */
>  static int wait_clear_urbs(struct snd_usb_endpoint *ep)
>  {
> -	unsigned long end_time = jiffies + msecs_to_jiffies(1000);
> -	int alive;
> -
>  	if (atomic_read(&ep->state) != EP_STATE_STOPPING)
>  		return 0;
>  
> -	do {
> -		alive = atomic_read(&ep->submitted_urbs);
> -		if (!alive)
> -			break;
> -
> -		schedule_timeout_uninterruptible(1);
> -	} while (time_before(jiffies, end_time));
> +	for (int i = 0; i < ep->nurbs; i++) {
> +		struct snd_urb_ctx *u = &ep->urb[i];
>  
> -	if (alive)
> -		usb_audio_err(ep->chip,
> -			"timeout: still %d active urbs on EP #%x\n",
> -			alive, ep->ep_num);
> +		usb_kill_urb(u->urb);
> +	}
>  
>  	if (ep_state_update(ep, EP_STATE_STOPPING, EP_STATE_STOPPED)) {
>  		ep->sync_sink = NULL;
