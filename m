Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D0C1F473A
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 10:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739270683; cv=none; b=kEECq6SIfKvb1e48twWA9nchaInsRmuLXaE39wDIX63B4rVoTbj1xFrBW740pKtW6BRV3wxeS1oTPKCR6kLn09/87VsbTYxqheat/u4WQCZ6V1aLJbS/wtW7pUajUHwdeGwmdMDwA2ELiYnzIoe5chGBAf19GTa1+kl18e8eZjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739270683; c=relaxed/simple;
	bh=ZSYX5J+kB/QWD1n9ivRYM0GHXtsmbJF5T35MTJn55UQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KBUC/QiK7Sp7BccWGQwwTXCBcR+rRC/92W2mYpb5OXp7m/wRwvjr7yVC62Ea78jj8scSrxHJsQ7oef/zpKucV8UcieV3cO20vUnUQOxISw4zc/CVmJMXzz8qVszcMuUr+9SEQYA8owJaqptyjyHOLOweiHtn5peiWFboWaM1sYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJD7G4ib; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJD7G4ib"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43618283d48so37100725e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 02:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739270679; x=1739875479; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kJcFMQJvlRYWjrCqI8QX/Ukpl5nZX3icPZpoJRtpLMo=;
        b=IJD7G4ib47a6Kz0JEdfEpM59wy2QfROgjCHA4EMAnkZw4JNbwtbYykQ6xuoRjI/6te
         8z0rV/odNYBCeg6QNXwTBVUSuAO8GPInMzWRQ12FsnU0amMf/DR+WUZD4vDRo8OGjNf+
         yhWMbRGvBnM9OyHtituK4t6sZiCgkaYLyLLiH0TLcmnM4f6jPh2bmdlrSmjXsKa+i6DA
         MfJv1fQPSKBX449/ZMLg7gk73UuIHtSUwYCrmBaCcDfeRIz3veWPCMIip4LmbyhLg8RY
         e+368qBWo+f6idJUuoiqGSpMj0ZCNGbp+XWObzmCwbSsdQDoIxEKzHQAzt8Q8P4t1mcz
         UxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739270679; x=1739875479;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kJcFMQJvlRYWjrCqI8QX/Ukpl5nZX3icPZpoJRtpLMo=;
        b=p9cfZYV0N7kktqhtZbf/PR/DsCE9N55Aac3RxKN2nHa97fS76/FySFNgqVDtLsP7Au
         EzTe1skqxlbd42uy0paGlT99FZ+ndRcilegkv1rHQuEeU3ELZOrBaNAbOboy8R6MUWqq
         dT69G4Z57awM6PhKqg1PZCIKvA5HN+JE2qirOMUiRJuEH7S9/4jOds+KWWuS0weNuhIt
         pJp19CLb3YXpzakAikgUQLA7vj4Ns9dP1CeEBvccjXft+mKVgzgBXgK89hF8szCNYABE
         OIpX1YHTMq0SrxKFCssbOpVKpq/0ezCb9AshAD6XIpz9lkIfiXPmLIQAjeb8xqVf7t/u
         dXyg==
X-Forwarded-Encrypted: i=1; AJvYcCUy9IivIVEDVZy8gGgC+JaSBzmi2gHYqpBO9PvuwThH1bUqbvKnrpOYvAbm2vpbM4FiAfj+upwYVpjkzUU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxR9lfTAXCtl+2R+E/WzTgnD8JYxsv9JyKmPugJ5Zv16/n6hHuk
	yv7LZASka4AzdLD5gtmY9RZJ+FbmZZNf8Msgt2HFUlMxkS8KOmOp
X-Gm-Gg: ASbGncsiK9DLJ5PU0F4ILtyb+rpEw0V/sRy/FzEXfBbG2ErtpB8NXyT+kk8YB49Zswg
	8iQI9ZXBHXBHE65Lxh+7CIOoIP/z8MA+GkCvyeVMdGt7lH0/z2+utDzml02SBQJOZNpxT4EADkg
	dcQ/7RfuW9dbLaMkzFJiju8PDCmbrnU9Nd1cNfmQI0MeU8eIX91B9In9B6aIxq7meQIC98sY49V
	SmA+orN/6jSbwu+GNKkmz3l1X1E0Errm18j1IoQ+IDV54eOZSUCbXBPBCaOvLuRDDZi0kIq9xNb
	sHd9QrsrDTCkIQ==
X-Google-Smtp-Source: AGHT+IG+NM23xq1Gg1pDDKGgZB+1gTyiM2grB+zK5t5NeWTG07g3GKXCcgUgvelC4ZDkV8YcysruPg==
X-Received: by 2002:a05:600c:4e13:b0:434:9499:9e87 with SMTP id 5b1f17b1804b1-4394c8538fdmr25448345e9.25.1739270679131;
        Tue, 11 Feb 2025 02:44:39 -0800 (PST)
Received: from fedora ([94.73.37.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da965b3sm178045935e9.5.2025.02.11.02.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 02:44:38 -0800 (PST)
Date: Tue, 11 Feb 2025 11:44:37 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/13] drm/vkms: Allow to configure multiple CRTCs
Message-ID: <Z6sqFdvtwSxHD-FO@fedora>
References: <20250129110059.12199-1-jose.exposito89@gmail.com>
 <20250129110059.12199-9-jose.exposito89@gmail.com>
 <Z5uDJFHnn1HzWOz4@louis-chauvet-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5uDJFHnn1HzWOz4@louis-chauvet-laptop>

On Thu, Jan 30, 2025 at 02:48:20PM +0100, Louis Chauvet wrote:
> On 29/01/25 - 12:00, José Expósito wrote:
> > Add a list of CRTCs to vkms_config and helper functions to add and
> > remove as many CRTCs as wanted.
> > 
> > For backwards compatibility, add one CRTC to the default configuration.
> > 
> > A future patch will allow to attach planes and CRTCs, but for the
> > moment there are no changes in the way the output is configured.
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> 
> Co-developped-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> 
> [...]
> 
> > diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> 
> [...]
> 
> > +static void vkms_config_test_valid_crtc_number(struct kunit *test)
> > +{
> > +	struct vkms_config *config;
> > +	struct vkms_config_crtc *crtc_cfg;
> > +	int n;
> > +
> > +	config = vkms_config_default_create(false, false, false);
> > +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> > +
> > +	/* Invalid: No CRTCs */
> > +	crtc_cfg = list_first_entry(&config->crtcs, typeof(*crtc_cfg), link);
> > +	vkms_config_destroy_crtc(config, crtc_cfg);
> > +	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
> > +
> > +	/* Invalid: Too many CRTCs */
> > +	for (n = 0; n <= 32; n++)
> > +		vkms_config_add_crtc(config);
> > +
> > +	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
> > +
> > +	vkms_config_destroy(config);
> > +}
> 
> Same as before, can you rename the fonction to 
> vkms_config_test_invalid_crtc_number
> 
> [...]
> 
> > diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> 
> [...]
> 
> > +struct vkms_config_crtc **vkms_config_get_crtcs(const struct vkms_config *config,
> > +						size_t *out_length)
> > +{
> > +	struct vkms_config_crtc **array;
> > +	struct vkms_config_crtc *crtc_cfg;
> > +	size_t length;
> > +	int n = 0;
> > +
> > +	length = list_count_nodes((struct list_head *)&config->crtcs);
> > +	if (length == 0) {
> > +		*out_length = length;
> > +		return NULL;
> > +	}
> > +
> > +	array = kmalloc_array(length, sizeof(*array), GFP_KERNEL);
> > +	if (!array)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	list_for_each_entry(crtc_cfg, &config->crtcs, link) {
> > +		array[n] = crtc_cfg;
> > +		n++;
> > +	}
> > +
> > +	*out_length = length;
> > +	return array;
> > +}
> 
> Same as before, can't we use an iterator?
> 
> [...]
> 
> > +static bool valid_crtc_number(struct vkms_config *config)
> > +{
> > +	size_t n_crtcs;
> > +
> > +	n_crtcs = list_count_nodes(&config->crtcs);
> > +	if (n_crtcs <= 0 || n_crtcs >= 32) {
> > +		pr_err("The number of CRTCs must be between 1 and 31\n");
> 
> I agree we need some logs, but I think pr_err is too agressive (i.e may 
> be considered as an error by some test tools).
> 
> I think we should at least:
> - lower to warn/notice/info
> - use drm variants of the macro
> 
> > +		return false;
> > +	}
> > +
> > +	return true;
> > +}
> > +
> 
> [...]
> 
> > +struct vkms_config_crtc *vkms_config_add_crtc(struct vkms_config *config)
> > +{
> > +	struct vkms_config_crtc *crtc_cfg;
> > +
> > +	crtc_cfg = kzalloc(sizeof(*crtc_cfg), GFP_KERNEL);
> > +	if (!crtc_cfg)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	vkms_config_crtc_set_writeback(crtc_cfg, false);
> > +
> > +	list_add_tail(&crtc_cfg->link, &config->crtcs);
> > +
> > +	return crtc_cfg;
> > +}
> > +
> > +void vkms_config_destroy_crtc(struct vkms_config *config,
> > +			      struct vkms_config_crtc *crtc_cfg)
> > +{
> > +	list_del(&crtc_cfg->link);
> > +	kfree(crtc_cfg);
> > +}
> 
> Same as before, the pair add/destroy seems strange.
> 
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > @@ -181,7 +181,8 @@ static int vkms_create(struct vkms_config *config)
> >  		goto out_devres;
> >  	}
> >  
> > -	ret = drm_vblank_init(&vkms_device->drm, 1);
> > +	ret = drm_vblank_init(&vkms_device->drm,
> > +			      vkms_config_get_num_crtcs(config));
> 
> At this point we only create one crtc, can you move this change in the 
> commit where you create multiple crtc?

Since the code to add more than one CRTCs is unused but technically present, I
think that this is the right patch to use this function.

Anyway, at the moment it'll always return 1, so it is a no-op.

I didn't change it in v2, let me know if it works for you.

Thanks,
Jose

> >  	if (ret) {
> >  		DRM_ERROR("Failed to vblank\n");
> >  		goto out_devres;
> > -- 
> > 2.48.1
> > 
