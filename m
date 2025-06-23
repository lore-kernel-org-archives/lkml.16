Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5EE188CC9
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750679886; cv=none; b=U0D6nFonSFB7nlMPeQl3P6u67fwvWbncl/hjHqYUoqmP7iPVqP9MZwuaMYZMDs8rzQrSXCLHR7vrdqd1NjHxHFpggQRgdNAq8kT9DWe1+QHQEdk9WRPC/i0Ab/IQo+cQKRCOR0qAp5rgLAt7ROuvyf6G1CnwuUJVAt2Fl5aA528=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750679886; c=relaxed/simple;
	bh=72cjFCmD24Kj+63QGAd5ORmDyPkNVI1vAaJn25guyyw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jb7vRJ7aturQsRLQQ3mXEEzg0AP7F73ATcS+z2cXhkRRuTH8lQwdov+a3S/MYM5qG3zXManZ/3fmXbEfYFjmZy8Yb919ItRDGefeHv/xGmrrytNwMSY1/8Cq8NvqPMpowpgGpeKqBiVlLJzjR1Q6cStfyFjgbF6Csy3piC5ua54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TGigCntQ; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TGigCntQ"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 46DCC432A2;
	Mon, 23 Jun 2025 11:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750679876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tOC6uwvwIRMsvFgMBBtmc0lgl6NuOHr5njzJISpueqU=;
	b=TGigCntQHvsp4QAUs2e4HAVvalTFA5cWrtZ2F+OeuDcuX1MnJqEVtjMjvm1AYjkCpUj5aK
	78voDLzgNwD+ZqrcXZI5HJqNlb6RY9uhFRprJjLaG6LMB7LKF9D65cGn2It4UlZ6sQdH/G
	BbTfCD1vlic8thR5pGju1VNHhyR5HP8xc9j5zlforuKLF4X4GxBXRp4VKcSJF8jRjbJZ2K
	X32npA0F0IB6NcKCY8qohfimOG/7CUQBkrPiIDhBD8AcJc0yTnkSXjfUMQ7jqPVSorLcfq
	Bf386bv26vhTCY3yXf3PymkJ6FQZNyngbbt4zN/YNjhD0pYW8Jpn2XSdho5Cgg==
Date: Mon, 23 Jun 2025 13:57:51 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Anusha Srivatsa
 <asrivats@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Hui Pu <Hui.Pu@gehealthcare.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v9 3/3] drm/bridge: add warning for bridges not using
 devm_drm_bridge_alloc()
Message-ID: <20250623135751.683f65c2@booty>
In-Reply-To: <a506cff0-6a0f-44b2-93e5-0488aa041fa2@oss.qualcomm.com>
References: <20250620-drm-bridge-alloc-getput-drm-bridge-c-v9-0-ca53372c9a84@bootlin.com>
	<20250620-drm-bridge-alloc-getput-drm-bridge-c-v9-3-ca53372c9a84@bootlin.com>
	<a506cff0-6a0f-44b2-93e5-0488aa041fa2@oss.qualcomm.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduieeliecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejtefftdelheeghfffffdukefhudejuedvfefhteelfeetgfffkeejteejtddvveenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedujedprhgtphhtthhopegumhhithhrhidrsggrrhihshhhkhhovhesohhsshdrqhhurghltghomhhmrdgtohhmpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrt
 ghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgvpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello Dmitry,

thanks for reviewing!

On Mon, 23 Jun 2025 14:06:43 +0300
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:

> On 20/06/2025 18:59, Luca Ceresoli wrote:
> > To the best of my knowledge, all drivers in the mainline kernel adding a
> > DRM bridge are now converted to using devm_drm_bridge_alloc() for
> > allocation and initialization. Among others this ensures initialization of
> > the bridge refcount, allowing dynamic allocation lifetime.
> > 
> > devm_drm_bridge_alloc() is now mandatory for all new bridges. Code using
> > the old pattern ([devm_]kzalloc + filling the struct fields +
> > drm_bridge_add) is not allowed anymore.
> > 
> > Any drivers that might have been missed during the conversion, patches in
> > flight towards mainline and out-of-tre drivers still using the old pattern
> > will already be caught by a warning looking like:
> > 
> >    ------------[ cut here ]------------
> >    refcount_t: addition on 0; use-after-free.
> >    WARNING: CPU: 2 PID: 83 at lib/refcount.c:25 refcount_warn_saturate+0x120/0x148
> >    [...]
> >    Call trace:
> >     refcount_warn_saturate+0x120/0x148 (P)
> >     drm_bridge_get.part.0+0x70/0x98 [drm]
> >     drm_bridge_add+0x34/0x108 [drm]
> >     sn65dsi83_probe+0x200/0x480 [ti_sn65dsi83]
> >     [...]
> > 
> > This warning comes from the refcount code and happens because
> > drm_bridge_add() is increasing the refcount, which is uninitialized and
> > thus initially zero.
> > 
> > Having a warning and the corresponding stack trace is surely useful, but
> > the warning text does not clarify the root problem nor how to fix it.
> > 
> > Add a DRM_WARN() just before increasing the refcount, so the log will be
> > much more readable:
> > 
> >    [drm] DRM bridge corrupted or not allocated by devm_drm_bridge_alloc()
> >    ------------[ cut here ]------------
> >    refcount_t: addition on 0; use-after-free.
> >    [...etc...]
> > 
> > A DRM_WARN is used because drm_warn and drm_WARN require a struct
> > drm_device pointer which is not yet available when adding a bridge.
> > 
> > Do not print the dev_name() in the warning because struct drm_bridge has no
> > pointer to the struct device. The affected driver should be easy to catch
> > based on the following stack trace however.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > 
> > ---
> > 
> > Changes in v9:
> > - change warning trigger from "refcount != 1" to "container not NULL"
> > 
> > This patch was added in v8
> > ---
> >   drivers/gpu/drm/drm_bridge.c | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > index f001bbe95559aabf0aac9f25f89250ad4e1ad9c8..0b450b334afd82e0460f18fdd248f79d0a2b153d 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -295,6 +295,9 @@ EXPORT_SYMBOL(__devm_drm_bridge_alloc);
> >    */
> >   void drm_bridge_add(struct drm_bridge *bridge)  
> 
> Can we rename this function, making sure that noone can call it 
> directly? E.g. adding two underscores might point out that is is an 
> internal API.

I'm afraid I don't think this would be correct. Every bridge driver is
expected to call drm_bridge_add() at the end of probe/initialization,
to make the DRM subsystem aware that this bridge is ready for being
used.

The point of this patch, which is a completion to [1], is to ensure
that all drivers use the "new" process:

 1. bridge = devm_drm_bridge_alloc()
 2. drm_bridge_add(bridge)

and there are no users of the old process:

 1. bridge = [devm_]kzalloc()
 2. drm_bridge_add(bridge)

Does this addresses your concern?

[1] https://cgit.freedesktop.org/drm/drm-misc/commit/?id=b3f13e00a8de351832df7d628a15ca4db49ca94f

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
