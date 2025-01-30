Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBD61EC017
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 13:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738244912; cv=none; b=qWcnU2ltFXwMqDWDCQE6YjTDwIcPr+/Qu25Gc7V5utBw3RQ7fj4oUQ7Vswr/sysZxVrdHjuBY3nOva+J5BJfyhjR9hW0MgYe1LJ4NpRV5dhAcNxiCWyQFbjBSuide7ThzzQUbqKIQEiA9mKzcmNYXj1bkqIyCfbHszuUNeOpYq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738244912; c=relaxed/simple;
	bh=EvhDGbaRZGGAgm77NgvbOMGYdCLLKBKc9l3VmAB9O78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=REGflkQXR4u/MyXJmhzphK1GSREbSKQeVLUq4rm/j+CoOvps75jL9R+CpAHZGFiOCPUU1uMT532HSJJyIaC9Uygm7yA26p9g21EARkz1NG3sGY2QBkYaDWOu6+7lkoB+v9I2kQvn77fUqzlo+5di8lckkqLxdT5KhcwKlZsyiVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UzcoKMyJ; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UzcoKMyJ"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4AEC7204B4;
	Thu, 30 Jan 2025 13:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738244902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lSH8ChCYlBWnUyGU2beVtSLAp35PZAnCJ6j5QPoh5d4=;
	b=UzcoKMyJR8IVNjGcwsjVyNvYfmvzK6boT2Ow7DwDzUx0bUtqzLi/2PAQMiS7AAbF7fKXmi
	8luYKt3nktQseP/htrJBUCetDHQL6alcoE7ic02AAoAoiY0HvspEn/C4ODz+P5a24UAx3p
	T9GegKP+3x1GZDxLKpxsNiptWI03x9C0u9rcVXRfx/8M2CJqgQbdIFyB8crbQ6saCA9fna
	UK5NK/cQJWskIYk8xggrFZiVlwuwbzD2GF3GG/wxvKjIXflDz0dNPpyYjYHgHNb5ZrHQCw
	UEtk/89cDqMlVnvMGX60dxe5JLi7yC70of/SOLfwqLWf5/aCEl1pIJWc14SSAw==
Date: Thu, 30 Jan 2025 14:48:21 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/13] drm/vkms: Allow to attach planes and CRTCs
Message-ID: <Z5uDJd4iV9Vnrp9e@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
	hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250129110059.12199-1-jose.exposito89@gmail.com>
 <20250129110059.12199-10-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250129110059.12199-10-jose.exposito89@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgjeevteekvdelteduuedugeefjeehueejfeekgfdtuefgteefuedtveeikedvkeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhouhhishdqtghhrghuvhgvthdqlhgrphhtohhppdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepjhhoshgvrdgvgihpohhsihhtohekleesghhmrghilhdrtghomhdprhgtphhtthhopehhrghmohhhrghmmhgvugdrshgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehmvghlihhsshgrrdhsrhifsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhst
 heslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomh
X-GND-Sasl: louis.chauvet@bootlin.com

On 29/01/25 - 12:00, José Expósito wrote:
> Add a list of possible CRTCs to the plane configuration and helpers to
> attach, detach and get the primary and cursor planes attached to a CRTC.
> 
> Now that the default configuration has its planes and CRTC correctly
> attached, configure the output following the configuration.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

Co-developped-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>

[...]

> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c

[...]

> -static bool valid_plane_type(struct vkms_config *config)
> +static bool valid_plane_type(struct vkms_config *config,
> +			     struct vkms_config_crtc *crtc_cfg)

What do you think about renaming it to "valid_planes_for_crtc" to reflect 
the fact you tests if a CRTC is attached to a valid combination of planes?

>  {
>  	struct vkms_config_plane *plane_cfg;
>  	bool has_primary_plane = false;
>  	bool has_cursor_plane = false;
>  
>  	list_for_each_entry(plane_cfg, &config->planes, link) {
> +		struct vkms_config_crtc *possible_crtc;
> +		unsigned long idx = 0;
>  		enum drm_plane_type type;
>  
>  		type = vkms_config_plane_get_type(plane_cfg);
>  
> -		if (type == DRM_PLANE_TYPE_PRIMARY) {
> -			if (has_primary_plane) {
> -				pr_err("Multiple primary planes\n");
> -				return false;
> -			}
> +		xa_for_each(&plane_cfg->possible_crtcs, idx, possible_crtc) {
> +			if (possible_crtc != crtc_cfg)
> +				continue;
>  
> -			has_primary_plane = true;
> -		} else if (type == DRM_PLANE_TYPE_CURSOR) {
> -			if (has_cursor_plane) {
> -				pr_err("Multiple cursor planes\n");
> -				return false;
> -			}
> +			if (type == DRM_PLANE_TYPE_PRIMARY) {
> +				if (has_primary_plane) {
> +					pr_err("Multiple primary planes\n");
> +					return false;
> +				}
>  
> -			has_cursor_plane = true;
> +				has_primary_plane = true;
> +			} else if (type == DRM_PLANE_TYPE_CURSOR) {
> +				if (has_cursor_plane) {
> +					pr_err("Multiple cursor planes\n");
> +					return false;
> +				}
> +
> +				has_cursor_plane = true;
> +			}
>  		}
>  	}

[...]

> +int __must_check vkms_config_plane_attach_crtc(struct vkms_config_plane *plane_cfg,
> +					       struct vkms_config_crtc *crtc_cfg)
> +{
> +	struct vkms_config_crtc *possible_crtc;
> +	unsigned long idx = 0;
> +	u32 crtc_idx = 0;
> +
> +	xa_for_each(&plane_cfg->possible_crtcs, idx, possible_crtc) {
> +		if (possible_crtc == crtc_cfg)
> +			return -EINVAL;

Is it really an error? After this call, we expect plane and crtc to be 
attached, so if the plane is already attached, I don't see any issue.

> +	}
> +
> +	return xa_alloc(&plane_cfg->possible_crtcs, &crtc_idx, crtc_cfg,
> +			xa_limit_32b, GFP_KERNEL);
> +}
> +

[...]

> +struct vkms_config_crtc **vkms_config_plane_get_possible_crtcs(struct vkms_config_plane *plane_cfg,
> +							       size_t *out_length)
> +{
> +	struct vkms_config_crtc **array;
> +	struct vkms_config_crtc *possible_crtc;
> +	unsigned long idx;
> +	size_t length = 0;
> +	int n = 0;
> +
> +	xa_for_each(&plane_cfg->possible_crtcs, idx, possible_crtc)
> +		length++;
> +
> +	if (length == 0) {
> +		*out_length = length;
> +		return NULL;
> +	}
> +
> +	array = kmalloc_array(length, sizeof(*array), GFP_KERNEL);
> +	if (!array)
> +		return ERR_PTR(-ENOMEM);
> +
> +	xa_for_each(&plane_cfg->possible_crtcs, idx, possible_crtc) {
> +		array[n] = possible_crtc;
> +		n++;
> +	}
> +
> +	*out_length = length;
> +	return array;
> +}

Same as before, can we use an iterator?

> +static struct vkms_config_plane *vkms_config_crtc_get_plane(const struct vkms_config *config,
> +							    struct vkms_config_crtc *crtc_cfg,
> +							    enum drm_plane_type type)

Even if this is a private function, can we add a comment explaning that 
the returned value is only one of the available planes of this type?

	/**
	 * vkms_config_crtc_get_plane() - Get the first attached plane 
         * found of a specific type
	 * @config: configuration containing the crtc and the planes
	 * @crtc_cfg: Only find planes attached to this CRTC
	 * @type: Plane type to search
	 *
	 * Returns:
	 * The first plane found attached to @crtc_cfg with the type 
	 * @type.
	 */

> +{
> +	struct vkms_config_plane *plane_cfg;
> +	struct vkms_config_crtc *possible_crtc;
> +	enum drm_plane_type current_type;
> +	unsigned long idx;
> +
> +	list_for_each_entry(plane_cfg, &config->planes, link) {
> +		current_type = vkms_config_plane_get_type(plane_cfg);
> +
> +		xa_for_each(&plane_cfg->possible_crtcs, idx, possible_crtc) {
> +			if (possible_crtc == crtc_cfg && current_type == type)
> +				return plane_cfg;
> +		}
> +	}
> +
> +	return NULL;
> +}

[...]

> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h

[...]

> +/**
> + * vkms_config_crtc_primary_plane() - Return the primary plane for a CRTC
> + * @config: Configuration containing the CRTC
> + * @crtc_config: Target CRTC
> + *
> + * Returns:
> + * The primary plane or NULL if none is assigned yet.
> + */

Same as above, can you speficy that it is one of the primary plane?

> +struct vkms_config_plane *vkms_config_crtc_primary_plane(const struct vkms_config *config,
> +							 struct vkms_config_crtc *crtc_cfg);
> +
> +/**
> + * vkms_config_crtc_cursor_plane() - Return the cursor plane for a CRTC

Ditto

[...]

> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c

[...]

> @@ -35,19 +41,54 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>  			ret = PTR_ERR(plane_cfg->plane);
>  			goto err_free;
>  		}
> +	}
> +
> +	for (n = 0; n < n_crtcs; n++) {
> +		struct vkms_config_crtc *crtc_cfg;
> +		struct vkms_config_plane *primary, *cursor;
> +
> +		crtc_cfg = crtc_cfgs[n];
> +		primary = vkms_config_crtc_primary_plane(vkmsdev->config, crtc_cfg);
> +		cursor = vkms_config_crtc_cursor_plane(vkmsdev->config, crtc_cfg);

Linked with a previous comment: here we have no garantee that primary is a 
valid pointer, can we check it or call vkms_config_is_valid to ensure it?

> +		crtc_cfg->crtc = vkms_crtc_init(dev, &primary->plane->base,
> +						cursor ? &cursor->plane->base : NULL);
> +		if (IS_ERR(crtc_cfg->crtc)) {
> +			DRM_ERROR("Failed to allocate CRTC\n");
> +			ret = PTR_ERR(crtc_cfg->crtc);
> +			goto err_free;
> +		}

[...]
