Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1E123C8CB
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 22:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744843178; cv=none; b=uJUk1e9BjiXXmTTNqz7yXLuGedRAcNZoHHiWMU6+XPTR1BVROiGVSmKGKUGbnp1f5DCI0ltwbpNyjToM6TRMeD4docnYENiPYbBq65KDW8YWrb+Q+npMz5TDmBgRXWRt1OSB1qIFDV/PPjrlPxem98apOXMrA/OJwvO2xFFuiIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744843178; c=relaxed/simple;
	bh=7pSbieOb44JNqbvBuAC4+wDetm6bOyJMAa0DQQ55JKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oeNeAsTgyNDA8ZDPLHlQX48M06xjYPTAwZWfS64dCqOm6Si9HMQ+54ytPI9HYWIENZqbkH+dyuHrILaR1RcgGVojhanqbkamTdqEvbH/LEkEFe/vqqMsvwwbmihw+0zZbx4vNiuAJFdr5V5DX58iECrW7uijMIqLyErUz52iGcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=k4w+cl5e; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lf0tjznz; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="k4w+cl5e";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lf0tjznz"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 38E6E13801C5;
	Wed, 16 Apr 2025 18:39:35 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Wed, 16 Apr 2025 18:39:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1744843175; x=1744929575; bh=IaJesaOnBy
	vVNtJjYFAc6fzEc5nFe5m+SmMYD+IpYcg=; b=k4w+cl5eHU/U5mpFnyy3I6GyZ8
	V8ujhjdC2u7K/asTR+AaFcuLqsBeNUhSE87fqzomhfTJ23pBeJiUfxo0/VlFxpBq
	oe2xk6BnziNJglFcdJOdnrlaAv8AiWI3nvdw49eO2uL90fX9Xzgz/5DeN23f2grx
	Pdioe2aRLPoqchIsZD3icA8ddKiJLVhSQ1OuZeeUguecl2XSI5b+mSevw1KEWuvz
	pUcFncn8qDsButIWUcEc2GR0zUaoqYyQDS+CPV8RK4q2eLQbWrUe0qLvxCYDaRbu
	ukEHK8mlmEQc+kYnlLGtZemDl2qIXiN8zMSPbWiSlnZIe0R7arCd+o02u5ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744843175; x=1744929575; bh=IaJesaOnByvVNtJjYFAc6fzEc5nFe5m+SmM
	YD+IpYcg=; b=lf0tjznzAGuk+43HA7gMNvORXa7tpZ7mmvczsXQG2oUiBHAsUtC
	YOBdPMtsy17huxRsxp6ya6MSn3C7XguybAtWCmkI9IDiOHJ5twnwGO1NEhRoZ+j/
	POqbVQqTXCXOc6oNKP8VHxHXajUlxt+2pkbXon0z1JJkPeaM0hCMMBFtmYb8IjMQ
	u8qQkImGqbQnWaP8Xz6657O91mb+tXDOz6yauLkwzep5Jw/U9RG/KhtnCNoX6asw
	QIGi/NLm/OmvsS74SzBWIxUDVHKkmdlNSpqD9QWT07e4J8JJqxlTTGqiUKUaBRcS
	vWTQ24nw7wT/J89aL8scqadMzwCvZBxoRjw==
X-ME-Sender: <xms:pTEAaMXQI_65Nea6Y6fAndqCtAQyTbCFoerALPOLkkTNtQHw2mKZTA>
    <xme:pTEAaAn-YvYMTBdYumNqpulhhmZsZWbz5OkopaRFLDfe6rvT0nQSyoEmNBVjHt30D
    GYuApACnyJPoMqjYiw>
X-ME-Received: <xmr:pTEAaAaYDs4HQ8bJq74B-inzG58v8ttPWFTYHTDxpsxis21C9nd51KsEVz5WjIulQYNAQUBJL7RmqpyKmkVnxckOy9XPdi7XlQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdejheelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    jeenucfhrhhomheplfgrnhhnvgcuifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqe
    enucggtffrrghtthgvrhhnpefgvdffveelgedujeeffeehheekheelheefgfejffeftedu
    geethfeuudefheefteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjsehjrghnnhgruhdrnhgvthdpnhgspghrtghpthhtohepuddvpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopegrlhihshhsrgesrhhoshgvnhiifigvihhgrd
    hiohdprhgtphhtthhopehfnhhklhdrkhgvrhhnvghlsehgmhgrihhlrdgtohhmpdhrtghp
    thhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtg
    homhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvug
    esghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhr
    tghpthhtohepnhgvrghlsehgohhmphgrrdguvghvpdhrtghpthhtoheplhhumhgrgheskh
    gvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:pTEAaLWKN3cc9ah-tifrfeXVJP7VudgBtKTatvZXVypPu_iPtx88Yg>
    <xmx:pTEAaGlxZLqNh0i7Ijj9gKqLYTF04pnYg_S8MDze0GZsijmpmVjCyg>
    <xmx:pTEAaAc8W7ZW4yEFq-jybJYBVIbvpWfYD00dW7asDVCSUQCRS1jQpQ>
    <xmx:pTEAaIFq2HfO1kMlxw66lZpURJ80kIy0zIekfC4JyNrATXtvjVnwXg>
    <xmx:pzEAaGTt1DOA7yVrqDciVS8y-qT1ipyH3TdJ2xPxQWQ2jAyNw8rKnGlQ>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Apr 2025 18:39:33 -0400 (EDT)
Date: Thu, 17 Apr 2025 00:39:31 +0200
From: Janne Grunau <j@jannau.net>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Neal Gompa <neal@gompa.dev>, Dmitry Baryshkov <lumag@kernel.org>,
	dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] drm: adp: Handle drm_crtc_vblank_get() errors
Message-ID: <20250416223931.GC8400@robin.jannau.net>
References: <20250416-drm_adp_fixes-v1-0-772699f13293@jannau.net>
 <20250416-drm_adp_fixes-v1-2-772699f13293@jannau.net>
 <aAAZ6iIUtYcfpcdm@blossom>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aAAZ6iIUtYcfpcdm@blossom>

On Wed, Apr 16, 2025 at 04:58:18PM -0400, Alyssa Rosenzweig wrote:
> > -	spin_lock_irqsave(&crtc->dev->event_lock, flags);
> >  	if (crtc->state->event) {
> > -		drm_crtc_vblank_get(crtc);
> > -		adp->event = crtc->state->event;
> > +		spin_lock_irqsave(&crtc->dev->event_lock, flags);
> > +
> > +		if (drm_crtc_vblank_get(crtc) != 0)
> > +			drm_crtc_send_vblank_event(crtc, crtc->state->event);
> > +		else
> > +			adp->event = crtc->state->event;
> > +
> > +		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
> >  	}
> >  	crtc->state->event = NULL;
> > -	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
> 
> Kind of confused about
> 
> >  	crtc->state->event = NULL;
> 
> now being out of the lock. Should we set to NULL in the if, since
> if we don't take the if, we know event is already NULL? Or should we
> hold the lock for the whole time, the way the code did before your
> change? I'm not sure between the two, but the in-between here smells
> wrong.

I struggled with this as well. To my understanding event_lock is
necessary for drm_crtc_send_vblank_event(), adp->event and
drm_crtc_vblank_get(). The first according to event_lock's
documentation, the second to avoid avoid races with the irq handler and
the third to ensure vblank interrupts are not disabled.
Based on examples in other drivers I assumed `crtc->state->event` is
protected by another lock held externally. Not sure about that now. To
my understanding sruct drm_crtc::mutex protects `crtc->state`.

I did not move "crtc->state->event = NULL;" to avoid churn. No point
setting it to NULL if it is already NULL.

I'll look tomorrow if the locking for crtc->state->event is sufficient.

Janne
