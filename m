Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C883E19F115
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 18:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148333; cv=none; b=OwcECoja5rAQjK9q3P3PSXIyejZEONwpBSmCWSYiU+n7lnVk17Q8ADKMVPbQHtPORXQT+PU5Nq211cYWZPs4TJjj8snsPMUpebM+6XTp8jfi4ls48OUxsVUPTY5fSfgItJowfqbx1jMQfdjrePX4yh/PGq3WLTe1Xr/bLoN+0W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148333; c=relaxed/simple;
	bh=zHUtngLVqSEzJxnrFQn9wCmr98Xaj04/ojU983UZOcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nYpznO8N94ZA4sLGJBGoN2MsWpljkJudPKp55J403OHmu2q4tSLyeVhuI7OL8ut+dxO/uHlh7L9hUeARRUGpJdiDRR5xJFvVqkZxCBLBdfFcfseJLvPCRGWYZrd4ZXgg+WYYJh0/a8Os5xfoM32XyuoBDQEdpsJ3uy9Vi/6P/20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HknfJRJG; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HknfJRJG"
Received: by mail.gandi.net (Postfix) with ESMTPSA id F068943A44;
	Thu,  5 Jun 2025 18:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749148322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zPZNF5bEHba9k6vIOW/VukHg1eq0fNfZYGtVAdLeg+g=;
	b=HknfJRJGzx8XPl8qn4PYSCthquzFJMwaozl0rT0LwbSM7P0U2fYePSF0VhijC3QRVPEUHD
	eKd2cwPK9GEVAaQ0WR9JzJbGpIKVx1OibtDrNpdyHoih7jf0S/2Zz33kSUya31mUjOsVW2
	JQ6yR6gxWkRRlPrRWkYp385G9LEuzF6V2kKCjJfsjtHTnOe2fRj6nGUowDkXY0qcOSUnaI
	NKq6I6ARt3lfStzlpnvWmyuFQI798gUi2dzAF36P/833U5VEyne8ALgqymJg6woZlEQzFl
	zpCwX69S1glyfLqkF89B0ZWhzmyqp27JBPJlDpUpvTXbFj07asF6Gbnk8ozWjA==
Date: Thu, 5 Jun 2025 20:31:58 +0200
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
Subject: Re: [PATCH v8 3/3] drm/tests: bridge: add KUnit tests for
 devm_drm_bridge_alloc()
Message-ID: <20250605203158.0846e8de@booty>
In-Reply-To: <20250527-smiling-peacock-from-uranus-dc032f@houat>
References: <20250516-drm-bridge-alloc-doc-test-v8-0-7e356fd58ba5@bootlin.com>
	<20250516-drm-bridge-alloc-doc-test-v8-3-7e356fd58ba5@bootlin.com>
	<20250527-smiling-peacock-from-uranus-dc032f@houat>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdegtddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvuddvrddutdehrdduhedtrddvhedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdduvddruddthedrudehtddrvdehvddphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudelpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmo
 hhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello Maxime,

thanks for reviewing this series.

On Tue, 27 May 2025 18:10:31 +0200
Maxime Ripard <mripard@kernel.org> wrote:

[...]

> > @@ -422,11 +424,93 @@ static struct kunit_suite drm_bridge_helper_reset_crtc_test_suite = {
> >  	.test_cases = drm_bridge_helper_reset_crtc_tests,
> >  };
> >  
> > +struct drm_bridge_alloc_test_ctx {  
> 
> drm_bridge_alloc_priv
> 
> > +	struct device *dev;
> > +	struct dummy_drm_bridge *dummy_br;
> > +	bool destroyed;  
> 
> This can be in drm_bridge_priv

Not really, because drm_bridge_priv will be freed just after calling
.destroy, and we need .destroyed after the free happened.

[...]

> > +static const struct drm_bridge_funcs drm_bridge_dummy_funcs = {
> > +	.destroy = dummy_drm_bridge_destroy,
> > +};  
> 
> And same here, you don't need to create yet another function set, just
> add it to the existing ones.

OK, but it implies further changes.

In this version of this patch, the alloc tests being introduced use
drm_bridge_alloc_priv, while the other tests using the existing
function sets rely on drm_bridge_init_priv which has different fields.
So if all tests will call .destroy, we always need a valid struct
pointer for drm_bridge_priv.data.

Based on this, I think the only solution is to not introduce
drm_bridge_alloc_priv, and instead put its members (struct device *dev and bool
destroyed) to drm_bridge_init_priv, and then use drm_bridge_init_priv
for all tests.

The change is not very invasive, and perhaps even a cleanup, thus I'm
going to send as above in v9.


I'm OK with all the other changes you proposed. All queued for v9.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
