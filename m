Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568DC1F7580
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 11:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748260310; cv=none; b=hfcIxqA+wuWr6W1t2nyuH613pIoM3a8J0I0Vzs3vo+kPP+Y+sGPL0iddpTFfTGRF7NS1GSnIxg/zwxQ0abdNCps2Oy7b0zMXUix/4U9ZGHz8Jk5yE/e/h/018LyCC5OtE2p9qVSPr3Hv3Rn1Ho33llXwhov85l9AJx5/UM9UtE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748260310; c=relaxed/simple;
	bh=YUl+LniuRqXwPFoieCrz3mrVNskGRoqOG3tDKzMc2Bs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MRbdQ48PZg5QoxXNDR4RttJfZbhqY2egve0fL2V/jSj4fh2kDJDk8A0PsC3zi7wq/P0DAuhW2SvPKB01lQ138ijT4QxKXeqvHYNI74lrXJOnGI3HtkU6N6oQNVnMmhHZrqTfYwU51cQW+zkJE3TplEp189QBWqV/dChjlYL90z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CHZ2Z5dL; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CHZ2Z5dL"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 529631FCF2;
	Mon, 26 May 2025 11:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748260305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Tdi5jvOj+ZF1sdciG4N6LmPUOlWbTsnNeyOnw17ID8=;
	b=CHZ2Z5dLx0ZEjSMcREhkZan3iUwE836qjBOnNWc+BoQzE/7X6Ukoj2udOp7U2jsgFK1NIb
	8gkRjnsivsj8arsVnEJxJPYlkMDcrKuM+9fHD9Qs2oLr6Qb+rqkZ5FwKHkPhkJRf4NbD1m
	FIScw2FLsASt3DcoJBIYa2I/cOtnHFyZAjN8smfCPJCBADB8SsxhpUbWbXKtdcGni2WeVs
	jVY96JegIOpqJ3+iYRUh6OEeLmOsjdQPvAmELR6llK3rzxM8k3jJUjksEJeq72aZB7tneB
	cXj9koF0QFcdb+s7/HujvSHdkZGWABYDLOEY4KsG581fHscBJv0pos3SE6fftQ==
Date: Mon, 26 May 2025 13:51:41 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Anusha
 Srivatsa <asrivats@redhat.com>, Paul Kocialkowski <paulk@sys-base.io>,
 Dmitry Baryshkov <lumag@kernel.org>, =?UTF-8?B?SGVydsOp?= Codina
 <herve.codina@bootlin.com>, Hui Pu <Hui.Pu@gehealthcare.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/3] dmr/bridge: add a .destroy func
Message-ID: <20250526135141.5a84185c@booty>
In-Reply-To: <20250522-hot-hopeful-smilodon-dfb5b6@houat>
References: <20250516-drm-bridge-alloc-doc-test-v8-0-7e356fd58ba5@bootlin.com>
	<20250516-drm-bridge-alloc-doc-test-v8-2-7e356fd58ba5@bootlin.com>
	<20250522-hot-hopeful-smilodon-dfb5b6@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddujeeggeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtleejjeduvddutefftdduleefudfgudeltdeuffeuudefgfdugeekgedtieehudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudelpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvl
 hdrtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com

Hi Maxime,

On Thu, 22 May 2025 17:43:37 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> On Fri, May 16, 2025 at 06:48:38PM +0200, Luca Ceresoli wrote:
> > Some users of DRM bridges may need to execute specific code just before
> > deallocation.
> > 
> > As of now the only known user would be KUnit tests.
> > 
> > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > 
> > ---
> > 
> > This patch is new in v8. The .destroy callback had appeared in v5 as well
> > [5], but as part of a larger patch and for different reason that do not
> > apply anymore.
> > 
> > [5] https://lore.kernel.org/all/20241231-hotplug-drm-bridge-v5-3-173065a1ece1@bootlin.com/#t
> > ---
> >  drivers/gpu/drm/drm_bridge.c |  2 ++
> >  include/drm/drm_bridge.h     | 10 ++++++++++
> >  2 files changed, 12 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > index b4c89ec01998b849018ce031c7cd84614e65e710..6185cb29fe3162264f0912c09c205fb467975dee 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -203,6 +203,8 @@ static void __drm_bridge_free(struct kref *kref)
> >  {
> >  	struct drm_bridge *bridge = container_of(kref, struct drm_bridge, refcount);
> >  
> > +	if (bridge->funcs->destroy)
> > +		bridge->funcs->destroy(bridge);
> >  	kfree(bridge->container);
> >  }
> >  
> > diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> > index 4e418a29a9ff9d014d6ac0910a5d9bcf7118195e..3ccd493faa580845c2ed1166f398eca27b464261 100644
> > --- a/include/drm/drm_bridge.h
> > +++ b/include/drm/drm_bridge.h
> > @@ -86,6 +86,16 @@ struct drm_bridge_funcs {
> >  	 */
> >  	void (*detach)(struct drm_bridge *bridge);
> >  
> > +	/**
> > +	 * @destroy:
> > +	 *
> > +	 * This callback is invoked when the bridge is about to be
> > +	 * deallocated.
> > +	 *
> > +	 * The @destroy callback is optional.
> > +	 */
> > +	void (*destroy)(struct drm_bridge *bridge);
> > +  
> 
> destroy is before detach in alphabetical order, but otherwise it looks
> good to me.

I saw the struct is not alpha-ordered right now, so I did not get it
should be, and it looked like keeping .attach and .detach nearby would
be good.

> Once fixed,
> Acked-by: Maxime Ripard <mripard@kernel.org>

OK, will send new iteration with .destroy before .detach, thanks for
the review.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
