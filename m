Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321CF1E9B1D
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 13:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738244908; cv=none; b=BXMHwxRaMk70levr1ERNi2QgbY0nzSuXDHcHha501BLy8l/zBHfOAcQ4D7sjCP4AhiHVm5yL2DMSRDO4GEX8hto98Ibi0rMPeplnpZ6N4a7agfp+m21B521V1w/Zj24mEzpXOTzkZLLj27TRQsfK0IA+CLBT9PYCgKbpCWFeedE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738244908; c=relaxed/simple;
	bh=9bhKxQ2wKN3Bl4nu/Cl242FYrBdV4s4AcBFUPARR4iA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aKGX8QJ9ugXl8hL9+MVa6AtEy5XP0/97xOU45swC/cOYwGuW6GLjlI0oWCeQzILbLYNjpbqixICvOJXsOt2j1Xflf4yh82wCUkXMiqfHHLiACv0i2bi/y7HD00arKyt4HrbKJuuth0qtalrX9kfBgWq2wCC94qIBArP4G4pDvkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pn1OW3pr; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pn1OW3pr"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F19F442FB;
	Thu, 30 Jan 2025 13:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738244902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fMKFvNBkVO0/MDUp8nOqVPyZY6wGb4ZRt5EIDceuMt4=;
	b=pn1OW3prdAy82FX1W+4aGunB/VxlV3pBMmAZyPK/BULx+fba+KWh0aDrjYYGbGA7uqLrvE
	c+53KLSRUUur3B7gL2FVMUhSSqpYvKq0i6i8HX21ZeroTJM0o+y8sdWExKlt7Fe1gfpY5I
	F/G7Lqk0Xdt6RspOKvczgy4ZoqhFxuLVokJr5wDiMpt1jn8w72dYWvbFobNyN9fcHb4Tt4
	F5AbpPC6Oyw5HKK9lO3zKUx+ova6voW9MvCSuOAZ3U3A51bvVWR4expVY+4tHC4rxjfe1i
	skhGoFd4NP1/K9Zx7BMWSoyMMNnXMrRscjS/Jp3MqWvNgKQE5oZeI/wOgd4UTA==
Date: Thu, 30 Jan 2025 14:48:20 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/13] drm/vkms: Allow to configure multiple CRTCs
Message-ID: <Z5uDJFHnn1HzWOz4@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
	hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250129110059.12199-1-jose.exposito89@gmail.com>
 <20250129110059.12199-9-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250129110059.12199-9-jose.exposito89@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgjeevteekvdelteduuedugeefjeehueejfeekgfdtuefgteefuedtveeikedvkeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhouhhishdqtghhrghuvhgvthdqlhgrphhtohhppdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepjhhoshgvrdgvgihpohhsihhtohekleesghhmrghilhdrtghomhdprhgtphhtthhopehhrghmohhhrghmmhgvugdrshgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehmvghlihhsshgrrdhsrhifsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhst
 heslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomh
X-GND-Sasl: louis.chauvet@bootlin.com

On 29/01/25 - 12:00, José Expósito wrote:
> Add a list of CRTCs to vkms_config and helper functions to add and
> remove as many CRTCs as wanted.
> 
> For backwards compatibility, add one CRTC to the default configuration.
> 
> A future patch will allow to attach planes and CRTCs, but for the
> moment there are no changes in the way the output is configured.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

Co-developped-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>

[...]

> diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c

[...]

> +static void vkms_config_test_valid_crtc_number(struct kunit *test)
> +{
> +	struct vkms_config *config;
> +	struct vkms_config_crtc *crtc_cfg;
> +	int n;
> +
> +	config = vkms_config_default_create(false, false, false);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> +
> +	/* Invalid: No CRTCs */
> +	crtc_cfg = list_first_entry(&config->crtcs, typeof(*crtc_cfg), link);
> +	vkms_config_destroy_crtc(config, crtc_cfg);
> +	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
> +
> +	/* Invalid: Too many CRTCs */
> +	for (n = 0; n <= 32; n++)
> +		vkms_config_add_crtc(config);
> +
> +	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
> +
> +	vkms_config_destroy(config);
> +}

Same as before, can you rename the fonction to 
vkms_config_test_invalid_crtc_number

[...]

> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c

[...]

> +struct vkms_config_crtc **vkms_config_get_crtcs(const struct vkms_config *config,
> +						size_t *out_length)
> +{
> +	struct vkms_config_crtc **array;
> +	struct vkms_config_crtc *crtc_cfg;
> +	size_t length;
> +	int n = 0;
> +
> +	length = list_count_nodes((struct list_head *)&config->crtcs);
> +	if (length == 0) {
> +		*out_length = length;
> +		return NULL;
> +	}
> +
> +	array = kmalloc_array(length, sizeof(*array), GFP_KERNEL);
> +	if (!array)
> +		return ERR_PTR(-ENOMEM);
> +
> +	list_for_each_entry(crtc_cfg, &config->crtcs, link) {
> +		array[n] = crtc_cfg;
> +		n++;
> +	}
> +
> +	*out_length = length;
> +	return array;
> +}

Same as before, can't we use an iterator?

[...]

> +static bool valid_crtc_number(struct vkms_config *config)
> +{
> +	size_t n_crtcs;
> +
> +	n_crtcs = list_count_nodes(&config->crtcs);
> +	if (n_crtcs <= 0 || n_crtcs >= 32) {
> +		pr_err("The number of CRTCs must be between 1 and 31\n");

I agree we need some logs, but I think pr_err is too agressive (i.e may 
be considered as an error by some test tools).

I think we should at least:
- lower to warn/notice/info
- use drm variants of the macro

> +		return false;
> +	}
> +
> +	return true;
> +}
> +

[...]

> +struct vkms_config_crtc *vkms_config_add_crtc(struct vkms_config *config)
> +{
> +	struct vkms_config_crtc *crtc_cfg;
> +
> +	crtc_cfg = kzalloc(sizeof(*crtc_cfg), GFP_KERNEL);
> +	if (!crtc_cfg)
> +		return ERR_PTR(-ENOMEM);
> +
> +	vkms_config_crtc_set_writeback(crtc_cfg, false);
> +
> +	list_add_tail(&crtc_cfg->link, &config->crtcs);
> +
> +	return crtc_cfg;
> +}
> +
> +void vkms_config_destroy_crtc(struct vkms_config *config,
> +			      struct vkms_config_crtc *crtc_cfg)
> +{
> +	list_del(&crtc_cfg->link);
> +	kfree(crtc_cfg);
> +}

Same as before, the pair add/destroy seems strange.

> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -181,7 +181,8 @@ static int vkms_create(struct vkms_config *config)
>  		goto out_devres;
>  	}
>  
> -	ret = drm_vblank_init(&vkms_device->drm, 1);
> +	ret = drm_vblank_init(&vkms_device->drm,
> +			      vkms_config_get_num_crtcs(config));

At this point we only create one crtc, can you move this change in the 
commit where you create multiple crtc?

>  	if (ret) {
>  		DRM_ERROR("Failed to vblank\n");
>  		goto out_devres;
> -- 
> 2.48.1
> 
