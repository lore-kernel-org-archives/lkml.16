Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309A917597;
	Mon,  9 Jun 2025 00:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749429001; cv=none; b=AFppbzQoNUWPfmd6GqQTYoq1WMXR7eKQp18OgUpFnuU49swqCoy3vM/pRvbWSlREpCpTqa63gBqdHkWi6C3UehjAvt3AfytrZR6qe3HfgTHuLUWtm9gyQk0wavji82WkXZfhcp24oJI0etHFV8M3XWGUZz5VN+BfdGjybBm9lgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749429001; c=relaxed/simple;
	bh=0jYDCBNZ6DwUBMSWLHRaFKu/hxwP8QN5LAEctm4z0rA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J7mCcefgJsFKog+we3NqgIjmtsH+wlOQG5hu+98Ye1YWe/3nLCau+C0E96Xst2yBqfKlPyk4et1pr2FZUM59BVZbqNNchf5O2YDUBDq4Q7E4edG0DeJNwzGHQCNOXO66DhwObjb5D3tRAAG3ElhEl75DEmRkbLK40YF/2ld25hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=nll3BYm1; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="nll3BYm1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=ejOiuAu+r1wLg7BZWzmD/TtBER1FPcOof82sSDt9gCM=; b=nll3BYm1Any6boC2
	3JtKnvEveQ1ZucuqZ8iBrckUXIil0zsldm/bMGSFgKnJORsq7sUJtrgGy08yzGgtY/6YNsxAqSX76
	SpgrOp4RSo/4iwoZ45meIn9RE3j+LuSqjVn+V41PUpe5NPukgBM926gjonRAoMQBXmBFkjXGEGSn7
	ti2UX3wECoTjlrq9fwb7n6uls+CfnQpSNzkT0fAwlu6ylVs0fBNB9rdgWRLya7KPGMtDSfmmDGT0K
	vM9P3jzvUwzsBGofgdM5FHxj8h/E22GgFr34/ur1dR/XDvPJ0UcdBAti9pN1UY5E0pAPK4qqqkGca
	TD7Ic6qVmb0ICGjSFw==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1uOQOe-008JGS-2v;
	Mon, 09 Jun 2025 00:29:52 +0000
Date: Mon, 9 Jun 2025 00:29:52 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: core: Remove unused usb_unlink_anchored_urbs
Message-ID: <aEYrADEFcXYFPpud@gallifrey>
References: <20250608235617.200731-1-linux@treblig.org>
 <f154dfd9-006a-43e0-9127-9f7f2e377027@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <f154dfd9-006a-43e0-9127-9f7f2e377027@infradead.org>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-34-amd64 (x86_64)
X-Uptime: 00:29:18 up 42 days,  8:42,  1 user,  load average: 0.00, 0.00, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Randy Dunlap (rdunlap@infradead.org) wrote:
> 
> 
> On 6/8/25 4:56 PM, linux@treblig.org wrote:
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> > usb_unlink_anchored_urbs() has been unused since it's last use was
> 
> s/it's/its/ (same in previous patch's description)

Oops, I'm terrible for doing that.

> > removed in 2009 by
> > commit 9b9c5aaeedfd ("ar9170: xmit code revamp")
> > 
> > Remove it.
> > 
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> 
> Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks for the fast ack's.

Dave

> Thanks.
> 
> > ---
> >  Documentation/driver-api/usb/anchors.rst | 11 ---------
> >  drivers/usb/core/urb.c                   | 29 +++---------------------
> >  include/linux/usb.h                      |  1 -
> >  3 files changed, 3 insertions(+), 38 deletions(-)
> > 
> > diff --git a/Documentation/driver-api/usb/anchors.rst b/Documentation/driver-api/usb/anchors.rst
> > index 4b248e691bd6..5a93d171e76c 100644
> > --- a/Documentation/driver-api/usb/anchors.rst
> > +++ b/Documentation/driver-api/usb/anchors.rst
> > @@ -45,17 +45,6 @@ This function kills all URBs associated with an anchor. The URBs
> >  are called in the reverse temporal order they were submitted.
> >  This way no data can be reordered.
> >  
> > -:c:func:`usb_unlink_anchored_urbs`
> > -----------------------------------
> > -
> > -
> > -This function unlinks all URBs associated with an anchor. The URBs
> > -are processed in the reverse temporal order they were submitted.
> > -This is similar to :c:func:`usb_kill_anchored_urbs`, but it will not sleep.
> > -Therefore no guarantee is made that the URBs have been unlinked when
> > -the call returns. They may be unlinked later but will be unlinked in
> > -finite time.
> > -
> >  :c:func:`usb_scuttle_anchored_urbs`
> >  -----------------------------------
> >  
> > diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
> > index 5e52a35486af..0e58a8531d6e 100644
> > --- a/drivers/usb/core/urb.c
> > +++ b/drivers/usb/core/urb.c
> > @@ -597,10 +597,9 @@ EXPORT_SYMBOL_GPL(usb_submit_urb);
> >   * code).
> >   *
> >   * Drivers should not call this routine or related routines, such as
> > - * usb_kill_urb() or usb_unlink_anchored_urbs(), after their disconnect
> > - * method has returned.  The disconnect function should synchronize with
> > - * a driver's I/O routines to insure that all URB-related activity has
> > - * completed before it returns.
> > + * usb_kill_urb(), after their disconnect method has returned. The
> > + * disconnect function should synchronize with a driver's I/O routines
> > + * to insure that all URB-related activity has completed before it returns.
> >   *
> >   * This request is asynchronous, however the HCD might call the ->complete()
> >   * callback during unlink. Therefore when drivers call usb_unlink_urb(), they
> > @@ -890,28 +889,6 @@ void usb_unpoison_anchored_urbs(struct usb_anchor *anchor)
> >  	spin_unlock_irqrestore(&anchor->lock, flags);
> >  }
> >  EXPORT_SYMBOL_GPL(usb_unpoison_anchored_urbs);
> > -/**
> > - * usb_unlink_anchored_urbs - asynchronously cancel transfer requests en masse
> > - * @anchor: anchor the requests are bound to
> > - *
> > - * this allows all outstanding URBs to be unlinked starting
> > - * from the back of the queue. This function is asynchronous.
> > - * The unlinking is just triggered. It may happen after this
> > - * function has returned.
> > - *
> > - * This routine should not be called by a driver after its disconnect
> > - * method has returned.
> > - */
> > -void usb_unlink_anchored_urbs(struct usb_anchor *anchor)
> > -{
> > -	struct urb *victim;
> > -
> > -	while ((victim = usb_get_from_anchor(anchor)) != NULL) {
> > -		usb_unlink_urb(victim);
> > -		usb_put_urb(victim);
> > -	}
> > -}
> > -EXPORT_SYMBOL_GPL(usb_unlink_anchored_urbs);
> >  
> >  /**
> >   * usb_anchor_suspend_wakeups
> > diff --git a/include/linux/usb.h b/include/linux/usb.h
> > index 1b2545b4363b..e8662843e68c 100644
> > --- a/include/linux/usb.h
> > +++ b/include/linux/usb.h
> > @@ -1780,7 +1780,6 @@ extern void usb_block_urb(struct urb *urb);
> >  extern void usb_kill_anchored_urbs(struct usb_anchor *anchor);
> >  extern void usb_poison_anchored_urbs(struct usb_anchor *anchor);
> >  extern void usb_unpoison_anchored_urbs(struct usb_anchor *anchor);
> > -extern void usb_unlink_anchored_urbs(struct usb_anchor *anchor);
> >  extern void usb_anchor_suspend_wakeups(struct usb_anchor *anchor);
> >  extern void usb_anchor_resume_wakeups(struct usb_anchor *anchor);
> >  extern void usb_anchor_urb(struct urb *urb, struct usb_anchor *anchor);
> 
> -- 
> ~Randy
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
