Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42372194C6A
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 10:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739270872; cv=none; b=ckSOb7nVD4EFYiHnD/I6o4313n8dMqBEZxETRZe3+7IjPCVex+TobY7iEwm//W3WPsLyMZLGIpJZFu7q7LeBiE3bxg//Lkw/B2f4vKBulxp0jEdRDMaGMJ3z9fAmiYX/R66g8Or/whKa4uYG4F3L2uzPq9Lho978yxCGd8n2ja8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739270872; c=relaxed/simple;
	bh=579fv1XExwCZOcJDn+n9kksyej+uW1ld5ECqziTaRfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lq7ZQ8Mf1CnG/vJZdcv+gDmO85l6mwMrX8LbhmcSroGuQ3l9b84jHabZ0xpjEwT0+SEy0w2FsMbLq6+ZyfZi4JsAtuN93JZrRAxRr4w4DPsuvLLvaIgOTHisToH8ti7WRV7HAVz8vO0pK15WIvhZIZYpXaw5xEKBgCVNrnz2pIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XDsd/vC8; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XDsd/vC8"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43934d41730so27348715e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 02:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739270868; x=1739875668; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3z2WrpIbqGO59OxOaPQUr9I7um0YLfwHWbKn0eevJp0=;
        b=XDsd/vC85V1PL+uD1FyHfQW+pbVpg9/BPwHFDgTyZ8FVbUlSTdc6rNlD5nyzn/Y6DJ
         G80va04gv1k4fhSjpFaR5uxlvCF9kktLB4TPhD6oHJe0DDcxGm7xnp4eYWL4bQGYu7Nb
         UvUYQuoOijHjHBluOjcjy17WD+aYF05qcV79PuN5vzje/dV5TEd6htHxehg3k55RQz7o
         XFqbZh7P5Et6g4PziK2tUH/7USCZXXzs44ZTlfkS4Ai1k+0LOic7dw5Cr8EHnxkAZGyB
         /hcHoDIQ4L5FXkbW1n/rwoxYiBI9o7q5nV0Bi690yV1RbY3Jqc2Zry1+mH7GLwjgMti8
         hTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739270868; x=1739875668;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3z2WrpIbqGO59OxOaPQUr9I7um0YLfwHWbKn0eevJp0=;
        b=xUCNmAoS3DbpqVrs4djciAf3gIs1iWeAy5HLzJIZgkYkqwSnyol2N0jUP6bhRdUfH/
         pFHvbdowhJDHHzpMD8gZmNkUY3MBXfUKTD2aK8Cf5sNtQn4oiTJ5us9xWKcN/eAYYFX3
         bzB4vCw0SFZRaqJNaEz6bonEXOqUSf5Fi1sUS11rBdhFMg/vYdVwj7SLsu06NwobZQGb
         ZVB6lVZ223VLHEYz24KqmOd9aF6tyywMHyiPbj2n0gqHhV5xkw+fIjk8+86sRdQx3EfH
         98lAmkMG8tuVQg1oNuM2iIy/hxY9Ms9Kdn2ujP+dDvZ0EpeJxbwx4rXlkCqvw8W0Kb1w
         Rgvg==
X-Forwarded-Encrypted: i=1; AJvYcCX2oDRiXVHdqcRqB1OS3+QErVLRpIWd1BX3PD6I5YNWnoDfoNPwWppXp7OKy3whkiwlTB6fI4pE6GpMTEM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBqdPHgBwc09lwBI/J4QJse6/h0gxJ4zBrjgQDmpsM/VGAeTcJ
	NpgB9ReQibs/qXhzwwYFuPAbOiYRKjrqEv6wRSpWWwsJ8AHK5l0+
X-Gm-Gg: ASbGnct9yQMQ1dTUGnGbK/7J8RJ75Tp6qw8O5xPvOvNJdMv7GiPvwFfXgnV6maurZxv
	JhyLR+6JaX0o54qRbT3yvLhYDB9PP8VAn5Btejt87NWH6TcfAFU2ulWDsGgGh51V/AZczsT44mX
	CEdl8oMrUBGVF2KiTE5fLUtyJux25t+CWgmG/Yy0F+UsmJpHalsxwmboW5jusDgCuO4KaDXKivT
	Qu+4ae0OzWfzIVZ4v7ovA31NpUBSu3W/pDCxv96yVDgRJREzS2mWLXupvWQJ2FAK/OofWzzobNB
	iEH2yVQZ1eaa3w==
X-Google-Smtp-Source: AGHT+IGtdlweOo571IPX3EKplhspOj40WtSQc2DZqUTOYRNOun5+d+YyvFJoSlvSpJcxMRj91u3Kvw==
X-Received: by 2002:a05:600c:34c7:b0:439:4cc4:95cb with SMTP id 5b1f17b1804b1-4394cc4983bmr21201385e9.21.1739270868308;
        Tue, 11 Feb 2025 02:47:48 -0800 (PST)
Received: from fedora ([94.73.37.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dce18d6f9sm10908338f8f.29.2025.02.11.02.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 02:47:47 -0800 (PST)
Date: Tue, 11 Feb 2025 11:47:46 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/13] drm/vkms: Allow to attach planes and CRTCs
Message-ID: <Z6sq0h0lKxjmBcxk@fedora>
References: <20250129110059.12199-1-jose.exposito89@gmail.com>
 <20250129110059.12199-10-jose.exposito89@gmail.com>
 <Z5uDJd4iV9Vnrp9e@louis-chauvet-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5uDJd4iV9Vnrp9e@louis-chauvet-laptop>

On Thu, Jan 30, 2025 at 02:48:21PM +0100, Louis Chauvet wrote:
> On 29/01/25 - 12:00, José Expósito wrote:
> > Add a list of possible CRTCs to the plane configuration and helpers to
> > attach, detach and get the primary and cursor planes attached to a CRTC.
> > 
> > Now that the default configuration has its planes and CRTC correctly
> > attached, configure the output following the configuration.
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
> > diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> 
> [...]
> 
> > -static bool valid_plane_type(struct vkms_config *config)
> > +static bool valid_plane_type(struct vkms_config *config,
> > +			     struct vkms_config_crtc *crtc_cfg)
> 
> What do you think about renaming it to "valid_planes_for_crtc" to reflect 
> the fact you tests if a CRTC is attached to a valid combination of planes?
> 
> >  {
> >  	struct vkms_config_plane *plane_cfg;
> >  	bool has_primary_plane = false;
> >  	bool has_cursor_plane = false;
> >  
> >  	list_for_each_entry(plane_cfg, &config->planes, link) {
> > +		struct vkms_config_crtc *possible_crtc;
> > +		unsigned long idx = 0;
> >  		enum drm_plane_type type;
> >  
> >  		type = vkms_config_plane_get_type(plane_cfg);
> >  
> > -		if (type == DRM_PLANE_TYPE_PRIMARY) {
> > -			if (has_primary_plane) {
> > -				pr_err("Multiple primary planes\n");
> > -				return false;
> > -			}
> > +		xa_for_each(&plane_cfg->possible_crtcs, idx, possible_crtc) {
> > +			if (possible_crtc != crtc_cfg)
> > +				continue;
> >  
> > -			has_primary_plane = true;
> > -		} else if (type == DRM_PLANE_TYPE_CURSOR) {
> > -			if (has_cursor_plane) {
> > -				pr_err("Multiple cursor planes\n");
> > -				return false;
> > -			}
> > +			if (type == DRM_PLANE_TYPE_PRIMARY) {
> > +				if (has_primary_plane) {
> > +					pr_err("Multiple primary planes\n");
> > +					return false;
> > +				}
> >  
> > -			has_cursor_plane = true;
> > +				has_primary_plane = true;
> > +			} else if (type == DRM_PLANE_TYPE_CURSOR) {
> > +				if (has_cursor_plane) {
> > +					pr_err("Multiple cursor planes\n");
> > +					return false;
> > +				}
> > +
> > +				has_cursor_plane = true;
> > +			}
> >  		}
> >  	}
> 
> [...]
> 
> > +int __must_check vkms_config_plane_attach_crtc(struct vkms_config_plane *plane_cfg,
> > +					       struct vkms_config_crtc *crtc_cfg)
> > +{
> > +	struct vkms_config_crtc *possible_crtc;
> > +	unsigned long idx = 0;
> > +	u32 crtc_idx = 0;
> > +
> > +	xa_for_each(&plane_cfg->possible_crtcs, idx, possible_crtc) {
> > +		if (possible_crtc == crtc_cfg)
> > +			return -EINVAL;
> 
> Is it really an error? After this call, we expect plane and crtc to be 
> attached, so if the plane is already attached, I don't see any issue.

In my opinion, this could be either handled as an error or not. I think that
there are arguments for both approaches but, for our use case, I think that it
is better to return an error.

Since the main (and for the moment only) user of this function will be configfs,
it is very convenient to return an error to avoid creating 2 links between
plane <-> crtc.

If we allow to create multiple links, and the user deletes one of them, the
items would be still linked, which is a bit unexpected.

The same applies to the other vkms_config_*_attach_* functions.

For these reasons, I didn't change it in v2, let me know your opinion.
Jose

> > +	}
> > +
> > +	return xa_alloc(&plane_cfg->possible_crtcs, &crtc_idx, crtc_cfg,
> > +			xa_limit_32b, GFP_KERNEL);
> > +}
> > +
> 
> [...]
> 
> > +struct vkms_config_crtc **vkms_config_plane_get_possible_crtcs(struct vkms_config_plane *plane_cfg,
> > +							       size_t *out_length)
> > +{
> > +	struct vkms_config_crtc **array;
> > +	struct vkms_config_crtc *possible_crtc;
> > +	unsigned long idx;
> > +	size_t length = 0;
> > +	int n = 0;
> > +
> > +	xa_for_each(&plane_cfg->possible_crtcs, idx, possible_crtc)
> > +		length++;
> > +
> > +	if (length == 0) {
> > +		*out_length = length;
> > +		return NULL;
> > +	}
> > +
> > +	array = kmalloc_array(length, sizeof(*array), GFP_KERNEL);
> > +	if (!array)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	xa_for_each(&plane_cfg->possible_crtcs, idx, possible_crtc) {
> > +		array[n] = possible_crtc;
> > +		n++;
> > +	}
> > +
> > +	*out_length = length;
> > +	return array;
> > +}
> 
> Same as before, can we use an iterator?
> 
> > +static struct vkms_config_plane *vkms_config_crtc_get_plane(const struct vkms_config *config,
> > +							    struct vkms_config_crtc *crtc_cfg,
> > +							    enum drm_plane_type type)
> 
> Even if this is a private function, can we add a comment explaning that 
> the returned value is only one of the available planes of this type?
> 
> 	/**
> 	 * vkms_config_crtc_get_plane() - Get the first attached plane 
>          * found of a specific type
> 	 * @config: configuration containing the crtc and the planes
> 	 * @crtc_cfg: Only find planes attached to this CRTC
> 	 * @type: Plane type to search
> 	 *
> 	 * Returns:
> 	 * The first plane found attached to @crtc_cfg with the type 
> 	 * @type.
> 	 */
> 
> > +{
> > +	struct vkms_config_plane *plane_cfg;
> > +	struct vkms_config_crtc *possible_crtc;
> > +	enum drm_plane_type current_type;
> > +	unsigned long idx;
> > +
> > +	list_for_each_entry(plane_cfg, &config->planes, link) {
> > +		current_type = vkms_config_plane_get_type(plane_cfg);
> > +
> > +		xa_for_each(&plane_cfg->possible_crtcs, idx, possible_crtc) {
> > +			if (possible_crtc == crtc_cfg && current_type == type)
> > +				return plane_cfg;
> > +		}
> > +	}
> > +
> > +	return NULL;
> > +}
> 
> [...]
> 
> > diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> 
> [...]
> 
> > +/**
> > + * vkms_config_crtc_primary_plane() - Return the primary plane for a CRTC
> > + * @config: Configuration containing the CRTC
> > + * @crtc_config: Target CRTC
> > + *
> > + * Returns:
> > + * The primary plane or NULL if none is assigned yet.
> > + */
> 
> Same as above, can you speficy that it is one of the primary plane?
> 
> > +struct vkms_config_plane *vkms_config_crtc_primary_plane(const struct vkms_config *config,
> > +							 struct vkms_config_crtc *crtc_cfg);
> > +
> > +/**
> > + * vkms_config_crtc_cursor_plane() - Return the cursor plane for a CRTC
> 
> Ditto
> 
> [...]
> 
> > diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> 
> [...]
> 
> > @@ -35,19 +41,54 @@ int vkms_output_init(struct vkms_device *vkmsdev)
> >  			ret = PTR_ERR(plane_cfg->plane);
> >  			goto err_free;
> >  		}
> > +	}
> > +
> > +	for (n = 0; n < n_crtcs; n++) {
> > +		struct vkms_config_crtc *crtc_cfg;
> > +		struct vkms_config_plane *primary, *cursor;
> > +
> > +		crtc_cfg = crtc_cfgs[n];
> > +		primary = vkms_config_crtc_primary_plane(vkmsdev->config, crtc_cfg);
> > +		cursor = vkms_config_crtc_cursor_plane(vkmsdev->config, crtc_cfg);
> 
> Linked with a previous comment: here we have no garantee that primary is a 
> valid pointer, can we check it or call vkms_config_is_valid to ensure it?
> 
> > +		crtc_cfg->crtc = vkms_crtc_init(dev, &primary->plane->base,
> > +						cursor ? &cursor->plane->base : NULL);
> > +		if (IS_ERR(crtc_cfg->crtc)) {
> > +			DRM_ERROR("Failed to allocate CRTC\n");
> > +			ret = PTR_ERR(crtc_cfg->crtc);
> > +			goto err_free;
> > +		}
> 
> [...]
