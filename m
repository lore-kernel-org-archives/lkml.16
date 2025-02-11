Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528C81F4E39
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 10:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739270609; cv=none; b=uVDOOx1tASp8Q3npUmkCoflEshybYYRZJ3mFqAjq0j2JRgNQeMKaErsP6tcoVAbVsl0y5ncNCOjdlCf05ez+cDVXrHd0Um7lpr6CxpCy1dq0sMwdrawO1yxSuzLrl5Jw6LgTua+P2xg66ySnd219emdgqKxcKQ6DeKFSYT4IcQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739270609; c=relaxed/simple;
	bh=MfM2OWe0WHs/NDi465BnxFlg47nY19jwVJP/jhkZ2cU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NRCUnqa/u3bUO/KpbvfVn8KbooU7KAjjRsRbOjepv46xW0tA2oJSzQnAguKreUVI76i7rfZQbcEDE4G14OGepdIBpU3V2WFWihLMGjdB0Q0ONxXhf4xfMS1Z2lpUhK6TV+lKdRbY5zt4IbHBbMJpBXiqtVgYgX0BVSKwi6J36fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V9PSIylp; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V9PSIylp"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38dc1dfd9f2so3540331f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 02:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739270605; x=1739875405; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ud812bVnrQvOr/WIad3dtJdC2j4RUwkBpvrDh5Q9SnQ=;
        b=V9PSIylpRUPXIZ7CE15cq42sNSGE+Kzw+7BcQ5DjQKcsZp3G2gAynhKRGo+gjxFSA3
         FU409Y3Mbuqmy2miOpnG0sGPDI7SOftRtjluK5xPblymK4cCdtWtNAGjAC0k5QIB8fxN
         jPLib/3ZVqsvS6f3lI6Nu+PDFdmx+xVyn0mWLMHFyxhldBrH2h0bHsU8oSXy2xUGv3bj
         hVuQkkl36cQcA5O7pk2hQqLBSJMLnCkaPesTU9xl8TXLf483IGV8dcN2jrLuRPEGnSoh
         jRLeM5UqY05JrgwbvKp+48r/5V158U8DwFHYSNrwFpuJHRBAsgSNY+xIrleCrQiG2vgj
         s7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739270605; x=1739875405;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ud812bVnrQvOr/WIad3dtJdC2j4RUwkBpvrDh5Q9SnQ=;
        b=YwyLae51do7IO2X+l0b1iNMPRLU5wwcGzJzr6JicPr5ebZzNpPMZX908P9i+8JGCm3
         BdrpBkB4WlirL39VIRkOlKXy5VwL6Z83JzIgrN9VAjOBAXylKZfpg39y/Ezh8dRx72Q8
         ZjpUJSXBN8zpv3XUhaWIVsJ0+mh43OoPjYnrJar++fnOYSJUl1JWphhrYqZsUDyGCfx4
         QFj1v0IgqlJ0RvZP1rNJfCmR4V/LMm/jnjw/R3kQBcWfJ4oxPxTCIFzXcDIauLJIpcyg
         VuhztJ5jypbGVkZGBVlso5+VXaD+WXWcfzG2YMHDHNE/AM4TAHx+huywAi03+nnduLGR
         Zo+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUumQDCnkJ7GcyMIwwwCEXdiJbITRKpSqru3SfSIdjT2NsPUTof+FEzh40mBhDKib3bBH8ttK15C0FiXDc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjP+XsYQOGeBlySuVstTzbsXQPpL54Znn5Qylgf7pV3dT2GHXq
	TVq/mKSrGvBfnNCSMJ0XNaIQQ3c+0G+fO8CypcroU89WBpF5FUWy
X-Gm-Gg: ASbGnct6kBe3bmLxQEBRff2hRYkN3ilmhDL5in6amijC1tZNFlhvTCPCLkJ8GNbJPyv
	bb/f0853Yxd0f/CJulQaE93lvSevPgABtzKETCbjlsoOeP8ZKGvDcWK+K+PaGqMxaDGLSojsd3S
	y3c6gFVjOBZBwwM1BpBj1eik6Z/lSssHwRlROWJEkc0GcbL+J0l+UkgZHNiMzd7FVY+X+gCbc3Z
	+9ga6pWXHCwNehbA49K6/eIWR6nQnUX9hCnUTseGwbpU0B02kv/8GtTGGk/WnQZQyeLqWwhjpSK
	j0HoXfuvLKECNQ==
X-Google-Smtp-Source: AGHT+IHwfkKHX/Cnt52TZJGgeJIa02ga1mr8Uoobeh5uPI1IJl0KZtd7Z5OucENotiuaP1CxwqWr/A==
X-Received: by 2002:a5d:64c2:0:b0:38d:df2d:7ac8 with SMTP id ffacd0b85a97d-38ddf2d7d5dmr7171740f8f.25.1739270605284;
        Tue, 11 Feb 2025 02:43:25 -0800 (PST)
Received: from fedora ([94.73.37.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc09fc2d9sm13653081f8f.6.2025.02.11.02.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 02:43:24 -0800 (PST)
Date: Tue, 11 Feb 2025 11:43:23 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/13] drm/vkms: Allow to configure multiple planes
Message-ID: <Z6spy81Xa-Aoz-HZ@fedora>
References: <20250129110059.12199-1-jose.exposito89@gmail.com>
 <20250129110059.12199-8-jose.exposito89@gmail.com>
 <Z5uDI0QiP2UWGzI8@louis-chauvet-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5uDI0QiP2UWGzI8@louis-chauvet-laptop>

On Thu, Jan 30, 2025 at 02:48:19PM +0100, Louis Chauvet wrote:
> On 29/01/25 - 12:00, José Expósito wrote:
> > Add a list of planes to vkms_config and create as many planes as
> > configured during output initialization.
> > 
> > For backwards compatibility, add one primary plane and, if configured,
> > one cursor plane and NUM_OVERLAY_PLANES planes to the default
> > configuration.
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
> > +static void vkms_config_test_get_planes(struct kunit *test)
> > +{
> > +	struct vkms_config *config;
> > +	struct vkms_config_plane *plane_cfg1, *plane_cfg2;
> > +	struct vkms_config_plane **array;
> > +	size_t length;
> > +
> > +	config = vkms_config_create("test");
> > +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> > +
> > +	array = vkms_config_get_planes(config, &length);
> > +	KUNIT_ASSERT_EQ(test, length, 0);
> > +	KUNIT_ASSERT_NULL(test, array);
> > +
> > +	plane_cfg1 = vkms_config_add_plane(config);
> > +	array = vkms_config_get_planes(config, &length);
> > +	KUNIT_ASSERT_EQ(test, length, 1);
> > +	KUNIT_ASSERT_PTR_EQ(test, array[0], plane_cfg1);
> > +	kfree(array);
> > +
> > +	plane_cfg2 = vkms_config_add_plane(config);
> > +	array = vkms_config_get_planes(config, &length);
> > +	KUNIT_ASSERT_EQ(test, length, 2);
> > +	KUNIT_ASSERT_PTR_EQ(test, array[0], plane_cfg1);
> > +	KUNIT_ASSERT_PTR_EQ(test, array[1], plane_cfg2);
> > +	kfree(array);
> > +
> > +	vkms_config_destroy_plane(plane_cfg1);
> > +	array = vkms_config_get_planes(config, &length);
> > +	KUNIT_ASSERT_EQ(test, length, 1);
> > +	KUNIT_ASSERT_PTR_EQ(test, array[0], plane_cfg2);
> > +	kfree(array);
> > +
> > +	vkms_config_destroy(config);
> > +}
> 
> In this test I have the feeling that vkms_config_get_planes always returns 
> a predictable order. It is maybe trivial here, but I would prefer to shows 
> that the order is not stable, for example:
> 
> 	bool plane_cfg1_found = false;
> 	bool plane_cfg2_found = false;
> 
> 	vkms_config_for_each_plane(config, plane_cfg) {
> 		if (plane_cfg == plane_cfg1)
> 			plane_cfg1_found = true;
> 		else if (plane_cfg == plane_cfg2)
> 			plane_cfg2_found = true;
> 		else
> 			KUNIT_FAILS("Unexpected plane");
> 	}
> 
> 	KUNIT_ASSERT(test, plane_cfg1_found);
> 	KUNIT_ASSERT(test, plane_cfg2_found);
> 
> [...]
> 
> > +static void vkms_config_test_valid_plane_number(struct kunit *test)
> > +{
> > +	struct vkms_config *config;
> > +	struct vkms_config_plane *plane_cfg;
> > +	int n;
> > +
> > +	config = vkms_config_default_create(false, false, false);
> > +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> > +
> > +	/* Invalid: No planes */
> > +	plane_cfg = list_first_entry(&config->planes, typeof(*plane_cfg), link);
> > +	vkms_config_destroy_plane(plane_cfg);
> > +	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
> > +
> > +	/* Invalid: Too many planes */
> > +	for (n = 0; n <= 32; n++)
> > +		vkms_config_add_plane(config);
> > +
> > +	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
> > +
> > +	vkms_config_destroy(config);
> > +}
> 
> For this function, the naming is a bit strange, it says 
> "valid_plane_number", but you test only invalid plane number.

The reason for this naming is that it tests the valid_plane_number()
function called by vkms_config_is_valid(). The applies for the other
valid_* tests.

However, I don't mind changing its name to so it reflects the test
rather than the tested function.

Changed in v2.

> 
> Can you rename it to vkms_config_test_invalid_plane_number?
> 
> [...]
> 
> > diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> 
> [...]
> 
> > +struct vkms_config_plane **vkms_config_get_planes(const struct vkms_config *config,
> > +						  size_t *out_length)
> > +{
> > +	struct vkms_config_plane **array;
> > +	struct vkms_config_plane *plane_cfg;
> > +	size_t length;
> > +	int n = 0;
> > +
> > +	length = list_count_nodes((struct list_head *)&config->planes);
> > +	if (length == 0) {
> > +		*out_length = length;
> > +		return NULL;
> > +	}
> > +
> > +	array = kmalloc_array(length, sizeof(*array), GFP_KERNEL);
> > +	if (!array)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	list_for_each_entry(plane_cfg, &config->planes, link) {
> > +		array[n] = plane_cfg;
> > +		n++;
> > +	}
> > +
> > +	*out_length = length;
> > +	return array;
> > +}
> 
> To join the comment on the test, I am not a big fan of creating a new list 
> to return to the caller, for three reasons:
> - the caller needs to manage an other pointer;
> - the caller needs to understand that the content of the array is only 
>   valid if: the config is not freed, nobody else removed anything from the 
>   planes;
> - the caller may think this list always have the same order if he looks at 
>   the tests.
> 
> I would prefer a simple macro to do an iteration over the config->planes 
> list: (I did not test this macro, but you have this idea)
> 
> 	#define vkms_config_iter_plane(config, plane_cfg) \
> 		list_for_each_entry((plane_cfg), &(config).planes, link)
> 
> This way:
> - no new pointer to manage;
> - if one day we have concurency issue, we just have to protect config, not 
>   config+all the planes;
> - there is no expected order.
> 
> [...]
> 
> >  bool vkms_config_is_valid(struct vkms_config *config)
> >  {
> > +	if (!valid_plane_number(config))
> > +		return false;
> > +
> > +	if (!valid_plane_type(config))
> > +		return false;
> > +
> >  	return true;
> >  }
> 
> I really like the idea to split the validation function, way simpler!
> 
> [...]
> 
> > +void vkms_config_destroy_plane(struct vkms_config_plane *plane_cfg)
> > +{
> > +	list_del(&plane_cfg->link);
> > +	kfree(plane_cfg);
> > +}
> 
> I would prefer a "standard" function pair, i.e.: add/remove or 
> create/destroy, not add/destroy.
> 
> For me it should be create/destroy, you create the plane by using a 
> config, so it is clear it will be attached to it.
> 
> If you choose add/remove, you should explains in the documentation that 
> remove is also doing kfree.
> 
> [...]
> 
> > diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> 
> [...]
> 
> > @@ -11,61 +11,63 @@ int vkms_output_init(struct vkms_device *vkmsdev)
> >  	struct vkms_connector *connector;
> >  	struct drm_encoder *encoder;
> >  	struct vkms_output *output;
> > -	struct vkms_plane *primary, *overlay, *cursor = NULL;
> > -	int ret;
> > +	struct vkms_plane *primary = NULL, *cursor = NULL;
> > +	struct vkms_config_plane **plane_cfgs = NULL;
> > +	size_t n_planes;
> > +	int ret = 0;
> >  	int writeback;
> >  	unsigned int n;
> 
> I think it could be interesting to have a vkms_config_is_valid call here. 
> It will avoid raising DRM errors or create unexpected devices.
> 
> It will also garantee in a later patch that 
> vkms_config_crtc_get_primary_plane is a valid pointer.
> 
> > -	/*
> > -	 * Initialize used plane. One primary plane is required to perform the composition.
> > -	 *
> > -	 * The overlay and cursor planes are not mandatory, but can be used to perform complex
> > -	 * composition.
> > -	 */
> > -	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY);
> > -	if (IS_ERR(primary))
> > -		return PTR_ERR(primary);
> > +	plane_cfgs = vkms_config_get_planes(vkmsdev->config, &n_planes);
> > +	if (IS_ERR(plane_cfgs))
> > +		return PTR_ERR(plane_cfgs);
> 
> If you agree on the iterator implementation, this code could be simplified 
> a lot.
> 
> > -	if (vkmsdev->config->cursor) {
> > -		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR);
> > -		if (IS_ERR(cursor))
> > -			return PTR_ERR(cursor);
> > +	for (n = 0; n < n_planes; n++) {
> > +		struct vkms_config_plane *plane_cfg;
> > +		enum drm_plane_type type;
> > +
> > +		plane_cfg = plane_cfgs[n];
> > +		type = vkms_config_plane_get_type(plane_cfg);
> > +
> > +		plane_cfg->plane = vkms_plane_init(vkmsdev, type);
> 
> Can we pass plane_cfg in vkms_plane_init? This way we don't have to 
> touch vkms_output_init when adding new vkms_config_plane members.

While it'll be required once we allow to configure more parameters, I don't
think we need it right now. To keep things as simple as possible, I'd prefer to
delay it until required.

Thanks,
Jose

> > +		if (IS_ERR(plane_cfg->plane)) {
> > +			DRM_DEV_ERROR(dev->dev, "Failed to init vkms plane\n");
> > +			ret = PTR_ERR(plane_cfg->plane);
> > +			goto err_free;
> > +		}
> > +
> > +		if (type == DRM_PLANE_TYPE_PRIMARY)
> > +			primary = plane_cfg->plane;
> > +		else if (type == DRM_PLANE_TYPE_CURSOR)
> > +			cursor = plane_cfg->plane;
> >  	}
> 
> [...]
