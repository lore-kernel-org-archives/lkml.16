Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E9E42A94
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 07:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745135396; cv=none; b=T0xwIFaOmGHOEfUuc4NR87OcJUn26BB8M9oa4zAxtxZbyohF0ZAgsRqjsyq0kOFyH56WAUlOBp+PnUz9EkAeojuMKkA74UZlZNPKONDuUcXUDD+USHEjSlhWTM4KEJzdST1aVCvHEC3cLIq+Cg17OseLlQsQTZuFT+FABmOA/o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745135396; c=relaxed/simple;
	bh=3erdAmULIY95rowLNakW1trC9jjblPqPQbhBi+dK2dY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aKkGoTmNdqhbqd6HO6K9SlJAZSQYXUhorwdigR94UFgddTGwtwO2qkjPdstUDiGepWcr/UgomYjcZkVR5Wkou3OgfeMh8mxmBkaeAt2RlbRNENOz8DtVaoExy7yA6gLgas72YyCS7dxYA1d8m4IB1eVFY7C/JAN+RiPCkbR0fLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZWWTM9Qe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DCcY41oE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZWWTM9Qe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DCcY41oE; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZWWTM9Qe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DCcY41oE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZWWTM9Qe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DCcY41oE"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 48A841F7B7;
	Sun, 20 Apr 2025 07:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745135387; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eBgxVaieIqG7dUDdWr8amJOLFVs9J9JZCobWB6kEjZ8=;
	b=ZWWTM9Qeqpph5XfrHvtKSwKNp9R75VIbIMoMFcs71X8CMmJ5/9NTPQVEvcuUndDnDzyBCz
	/v+mEQDgzSKQ9/kYIMYvixpcUmUr6xk7v9IlvILsJAmZPVzPMbINUgcvaZlCDjLxUAp7Jq
	6zFFOVDryGmUn/ru1xSlDcF/ZbOLAEM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745135387;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eBgxVaieIqG7dUDdWr8amJOLFVs9J9JZCobWB6kEjZ8=;
	b=DCcY41oEVRzqAKX3NIVvkgCjStkTH8EFzJTauCWBmLWVvzXzOa2mmGRG4g7VCt7Z6jN949
	ek505jjRI/TJV7AA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745135387; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eBgxVaieIqG7dUDdWr8amJOLFVs9J9JZCobWB6kEjZ8=;
	b=ZWWTM9Qeqpph5XfrHvtKSwKNp9R75VIbIMoMFcs71X8CMmJ5/9NTPQVEvcuUndDnDzyBCz
	/v+mEQDgzSKQ9/kYIMYvixpcUmUr6xk7v9IlvILsJAmZPVzPMbINUgcvaZlCDjLxUAp7Jq
	6zFFOVDryGmUn/ru1xSlDcF/ZbOLAEM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745135387;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eBgxVaieIqG7dUDdWr8amJOLFVs9J9JZCobWB6kEjZ8=;
	b=DCcY41oEVRzqAKX3NIVvkgCjStkTH8EFzJTauCWBmLWVvzXzOa2mmGRG4g7VCt7Z6jN949
	ek505jjRI/TJV7AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 220BA13A6A;
	Sun, 20 Apr 2025 07:49:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yIi6BhunBGj9FAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 20 Apr 2025 07:49:47 +0000
Date: Sun, 20 Apr 2025 09:49:46 +0200
Message-ID: <871ptnuvad.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Hillf Danton <hdanton@sina.com>
Cc: alsa-devel@alsa-project.org,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/9] ALSA: usb-audio: Fix possible race at sync of urb completions
In-Reply-To: <20250419080410.4148-1-hdanton@sina.com>
References: <20210929080844.11583-1-tiwai@suse.de>
	<20210929080844.11583-3-tiwai@suse.de>
	<20250418103533.4078-1-hdanton@sina.com>
	<87a58dvia7.wl-tiwai@suse.de>
	<20250418144518.4097-1-hdanton@sina.com>
	<875xj0ve49.wl-tiwai@suse.de>
	<20250419080410.4148-1-hdanton@sina.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -1.80
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[sina.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,sina.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[alsa-project.org,gmail.com,vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 

On Sat, 19 Apr 2025 10:04:08 +0200,
Hillf Danton wrote:
> 
> On Sat, 19 Apr 2025 08:50:46 +0200 Takashi Iwai wrote:
> >On Fri, 18 Apr 2025 16:45:17 +0200, Hillf Danton wrote:
> >> On Fri, 18 Apr 2025 13:08:32 +0200 Takashi Iwai wrote:
> >> > On Fri, 18 Apr 2025 12:35:32 +0200 Hillf Danton wrote:
> >> > > On Wed, 29 Sep 2021 10:08:37 +0200 Takashi Iwai wrote:
> >> > > > USB-audio driver tries to sync with the clear of all pending URBs in
> >> > > > wait_clear_urbs(), and it waits for all bits in active_mask getting
> >> > > > cleared.  This works fine for the normal operations, but when a stream
> >> > > > is managed in the implicit feedback mode, there is still a very thin
> >> > > > race window: namely, in snd_complete_usb(), the active_mask bit for
> >> > > > the current URB is once cleared before re-submitted in
> >> > > > queue_pending_output_urbs().  If wait_clear_urbs() is called during
> >> > > > that period, it may pass the test and go forward even though there may
> >> > > > be a still pending URB.
> >> > > > 
> >> > > > For covering it, this patch adds a new counter to each endpoint to
> >> > > > keep the number of in-flight URBs, and changes wait_clear_urbs()
> >> > > > checking this number instead.  The counter is decremented at the end
> >> > > > of URB complete, hence the reference is kept as long as the URB
> >> > > > complete is in process.
> >> > > > 
> >> > > > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> >> > > > ---
> >> > > >  sound/usb/card.h     | 1 +
> >> > > >  sound/usb/endpoint.c | 7 ++++++-
> >> > > >  2 files changed, 7 insertions(+), 1 deletion(-)
> >> > > > 
> >> > > > diff --git a/sound/usb/card.h b/sound/usb/card.h
> >> > > > index 3329ce710cb9..746a765b2437 100644
> >> > > > --- a/sound/usb/card.h
> >> > > > +++ b/sound/usb/card.h
> >> > > > @@ -97,6 +97,7 @@ struct snd_usb_endpoint {
> >> > > >  	unsigned int nominal_queue_size; /* total buffer sizes in URBs */
> >> > > >  	unsigned long active_mask;	/* bitmask of active urbs */
> >> > > >  	unsigned long unlink_mask;	/* bitmask of unlinked urbs */
> >> > > > +	atomic_t submitted_urbs;	/* currently submitted urbs */
> >> > > >  	char *syncbuf;			/* sync buffer for all sync URBs */
> >> > > >  	dma_addr_t sync_dma;		/* DMA address of syncbuf */
> >> > > >  
> >> > > > diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
> >> > > > index 29c4865966f5..06241568abf7 100644
> >> > > > --- a/sound/usb/endpoint.c
> >> > > > +++ b/sound/usb/endpoint.c
> >> > > > @@ -451,6 +451,7 @@ static void queue_pending_output_urbs(struct snd_usb_endpoint *ep)
> >> > > >  		}
> >> > > >  
> >> > > >  		set_bit(ctx->index, &ep->active_mask);
> >> > > > +		atomic_inc(&ep->submitted_urbs);
> >> > > >  	}
> >> > > >  }
> >> > > >  
> >> > > > @@ -488,6 +489,7 @@ static void snd_complete_urb(struct urb *urb)
> >> > > >  			clear_bit(ctx->index, &ep->active_mask);
> >> > > >  			spin_unlock_irqrestore(&ep->lock, flags);
> >> > > >  			queue_pending_output_urbs(ep);
> >> > > 
> >> > > 			smp_mb();
> >> > > 
> >> > > > +			atomic_dec(&ep->submitted_urbs); /* decrement at last */
> >> > > 
> >> > > Does it match the comment to add a mb?
> >> > 
> >> > How...?  I don't understand your intention.
> >> > 
> >> In addition to the UAF report [1], I saw a customer report of list
> >> corruption of linux-6.1.99 on arm64 this week without reproducer.
> >> 
> >> 	list corruption
> >> 	list_add_tail();
> >> 	push_back_to_ready_list();
> >> 	snd_complete_urb();
> >> 
> >> And after another look at this patch I wonder if the race can not be
> >> erased without the certainty that ep will be no longer used after the
> >> atomic decrement.
> >
> > But why adding more barrier if you perform the atomic op...?
> >
> Because atomic op != ordering, see 26fbe9772b8c ("USB: core: Fix hang 
> in usb_kill_urb by adding memory barriers") for detail for example.
> And c5b2cbdbdac5 ("ipc/mqueue.c: update/document memory barriers") as well.

Still don't get it.  Which reads and writes are you trying to solve?

And more importantly, does it actually help at all?  If yes, I'd
happily take the patch, of course.


thanks,

Takashi
