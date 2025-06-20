Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B896219A297
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750435079; cv=none; b=MvKmb4KtBO3v7ZDmlDvqZvMQGbhb5JCUdVZO7z2NlY5kxBk38QI6znPYU/RIH+eBaN762gbHJLivJH1h4HTU60WlIBiMuwlcPyqjfsiymEpw2caF1XM4OtbTPG2Mxgt73bHuBKoWo3ufBzhhbk94gVWUOFz1Sc5a1JhYGCqaeEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750435079; c=relaxed/simple;
	bh=1Md4Rl94TD2sWmNzmlmTE8FHJEo05e8/tJTDwN4fK9E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uJ9tTXC5oOM0ZH8nqof/SVkuGfIrCvPmkl/ZmOg9sBD64PcOu18t1X/SHYyHr5nDtg8F+FJhaZWdbEODxt3FZjdDuOJGD9pa43lBtSjD5gpjbdwNyGlg8I3y408lx5qUf7pXOwk9V2f16rIOfh2ND/G3Qvtc/NrBp7MyrcoCjGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VxGZ3Exc; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VxGZ3Exc"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 879E5433D4;
	Fri, 20 Jun 2025 15:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750435074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IihbOFtvzPM1DEENhBrqCNWKLexIYZNuk39SeKESMMc=;
	b=VxGZ3ExcoSlVTfgh5X/Zm/lpf6TgM2TRym9/vkCwrondDiKWindQnBZinB6BXFPweTyzMJ
	bS8cl2JSQ1n9lBzYT/+Eeti4AL+cL68YsuSBMdBriEQR22iSk7or3nO4SDyQRMgR0DdbSX
	cTTNKfkpXryJgcMSnWB2+mlISqYEWcMrsdzfsITKM9xgad9IIOVsMgKOtjykF/E/yvPO/i
	e3+k5h90Pcq359GuLHHrKQHk4bIbOpjjEoHcwrvnoL7/XqMPZEVWll69QuSA0rM+S7otoL
	ps6DR+vQfzCQQk+6YO0xNnoFlJfKG5LAM8prQWJnXqPTW0bXECWLrsujoozKmw==
Date: Fri, 20 Jun 2025 17:57:50 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Anusha Srivatsa <asrivats@redhat.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/bridge: add warning for bridges not using
 devm_drm_bridge_alloc()
Message-ID: <20250620175750.2e8e5203@booty>
In-Reply-To: <20250620-adaptable-loutish-oryx-fee75c@houat>
References: <20250620-drm-bridge-alloc-getput-drm-bridge-c-v1-0-bad7eba5d117@bootlin.com>
	<20250620-drm-bridge-alloc-getput-drm-bridge-c-v1-3-bad7eba5d117@bootlin.com>
	<20250620-adaptable-loutish-oryx-fee75c@houat>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdekkedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudeipdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhor
 dhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgvpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com

Hi Maxime,

On Fri, 20 Jun 2025 13:41:48 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> Hi Luca,
> 
> On Fri, Jun 20, 2025 at 11:32:08AM +0200, Luca Ceresoli wrote:
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
> >   ------------[ cut here ]------------
> >   refcount_t: addition on 0; use-after-free.
> >   WARNING: CPU: 2 PID: 83 at lib/refcount.c:25 refcount_warn_saturate+0x120/0x148
> >   [...]
> >   Call trace:
> >    refcount_warn_saturate+0x120/0x148 (P)
> >    drm_bridge_get.part.0+0x70/0x98 [drm]
> >    drm_bridge_add+0x34/0x108 [drm]
> >    sn65dsi83_probe+0x200/0x480 [ti_sn65dsi83]
> >    [...]
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
> >   [drm] DRM bridge corrupted or not allocated by devm_drm_bridge_alloc()
> >   ------------[ cut here ]------------
> >   refcount_t: addition on 0; use-after-free.
> >   [...etc...]
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
> > This patch was added in v8
> > ---
> >  drivers/gpu/drm/drm_bridge.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > index f001bbe95559aabf0aac9f25f89250ad4e1ad9c8..7d511c28608f1d8ea8fbb81d00efa9e227b02a13 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -295,6 +295,9 @@ EXPORT_SYMBOL(__devm_drm_bridge_alloc);
> >   */
> >  void drm_bridge_add(struct drm_bridge *bridge)
> >  {
> > +	if (kref_read(&bridge->refcount) == 0)
> > +		DRM_WARN("DRM bridge corrupted or not allocated by devm_drm_bridge_alloc()\n");
> > +  
> 
> I'm fine with it on principle, but I wonder if using bridge->container
> is set wouldn't be a more obvious way to check it?

Good point. Indeed the refcount check is potentially fragile because by
its own nature the refcount gets changed at various moments by various
parts of the kernel, unlike the container which is supposed to be never
modified after allocation.

I'll change this for v9.

Ouch, I just realized this does not show as v8 as it should (see cover
letter). Sorry about that, I messed up with my b4 branches, fixing both
things in, well, v9.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
