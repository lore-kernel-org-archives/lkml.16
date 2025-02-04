Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D911531C4
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 11:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738667869; cv=none; b=krabkVm76pBRFXNBb/xPOD1WVnuIU35kfIvCHb3+BMz44dTNkJFUEpve4RDRHsbWQ844m4gZ77I1RsTmnLgA6aXSzgmzrUBekWddmODuGOmM1GmZtiPqQo2bxAL4dXkab8F7jaYdKs4yCsAJFnOu3pL8igHDinMDnq6y2qfqqZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738667869; c=relaxed/simple;
	bh=OWNXdIgLRqV3Cv8pWxtggttGRKUupV/uhEsfnxxZAWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KytlBosiWHylahxIuQ1DQs9YFKWXnb5NEqILsjatIHWcgY+FGqJNB3lUTa/p74w2gIvElKsXDmox6Ils/ggq1M8297EDXjBCAxMWE8/GHpW5DWJHBWFt+FmWy8dO1ltId6Y+ULXGiOlWnIk2NPnQgqBjui+IcJyVseBFGL0OCik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=P0v7XfUU; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="P0v7XfUU"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43635796b48so33544865e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 03:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1738667865; x=1739272665; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=//Htk02SnQSST0sgWrnR1e9ytu0nhcLewwoj92Nb0ko=;
        b=P0v7XfUUOBjr0T39JOg4sj2qLvhvjbzFN7OKJ3dFj5y5ODZZecc3/sMXuoqQZLKsqM
         LKWGCZ69xvNl65bYcFxPbDV3dDjWO5ZC3rVDsMkFMlOiDGAjXcl9wdrGxQ2Nzx5Q+/aB
         5thUn/tVHZSEjGLHvfGMwMTAYW7o3+2B/oL1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738667865; x=1739272665;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=//Htk02SnQSST0sgWrnR1e9ytu0nhcLewwoj92Nb0ko=;
        b=IQIkcitIieEBGGE05rRbZx7AA/GgR2SB6XRcz9ArvLO7QFYekzqmp79BV8neDL4lKb
         5XCigykzVAXOOC1KIdU+dWedzID80tiUpTXB1x5GUMuAd3N9CCPArtwGAokA8hQbQivL
         1DPfNCQIvL/DGZXswExPcFYRm30uZHNP26K0/hWmKwIlB+5tJbvAO8Epeo5w3Dq4M5JB
         wLfsB8C9Zn5T8orfnHjcI8l3Za/xpJ3cjnn01K8Et/qi/lvJqisLNGUd6im0rC8dgf/5
         K7QVIxrrKEOSK7/CL6WoE3QBOFMxjL+hy6uvJbGKhP9kjfzuhCFDe4CCjEQmwrPdfn+H
         EBmA==
X-Forwarded-Encrypted: i=1; AJvYcCW2VyEfAF8H4AeuD5sfDMQImtJtLqW7n7MFHemSHXWpgLr/JroHEKB0XdEocIyDCa6yLm3JD3GIHcAmb7M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWHANWPtXlCvX5vtUR4U3g7NNoLrrWND+EBRnnIooijYNR4pY1
	Mrprd7UE1d6lGqzsv62pGCBipWg4GtDsV4GXKl3MGnntTSlFaSjlTVBF5hAgT6EyDMFYgwOA9Gv
	O
X-Gm-Gg: ASbGncuZIJ3nrcbFDhEIN2upRjZEk0dVUOfc1iXoc148hpioDEYj1auCDm4lrsBbdtr
	4qBT28VZlcl3ujxb47YU2GakUTQf8ugKk16oxc9dRk4sRBztyPI1Cwle/9ULYs/3ER6NZA83ZSW
	FdxUvQm50FOlrFR1m6fADVfnD4i91bi2xnXKLbccmwQw7wwp1zU0FpLHxEOGzka7gDDrvzoxVPf
	CXlUGRVAGIQDLiHx/gQQYstHuiplFvEOi7fYQKzGt9cLONagGMnMkdBB5Ldq0Y1sUoHNF7EiglI
	1iQ+5GSTsk+eWZK0A5qRLZL/d3A=
X-Google-Smtp-Source: AGHT+IEWZ4GlFzKg2S8HMxS/drBNBOT7cVaWhl0e7SHsBvXNUeMpCGxdyfdxPeErUZInS29O4g+AbQ==
X-Received: by 2002:a05:600c:3505:b0:434:92f8:54a8 with SMTP id 5b1f17b1804b1-43905f29411mr19756025e9.0.1738667864984;
        Tue, 04 Feb 2025 03:17:44 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23de016sm190037695e9.9.2025.02.04.03.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 03:17:44 -0800 (PST)
Date: Tue, 4 Feb 2025 12:17:42 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] drm/tests: hdmi: Fix recursive locking
Message-ID: <Z6H3Vv872R9PARK6@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250129-test-kunit-v2-0-fe59c43805d5@kernel.org>
 <20250129-test-kunit-v2-4-fe59c43805d5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129-test-kunit-v2-4-fe59c43805d5@kernel.org>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Wed, Jan 29, 2025 at 03:21:56PM +0100, Maxime Ripard wrote:
> The find_preferred_mode() functions takes the mode_config mutex, but due
> to the order most tests have, is called with the crtc_ww_class_mutex
> taken. This raises a warning for a circular dependency when running the
> tests with lockdep.
> 
> Reorder the tests to call find_preferred_mode before the acquire context
> has been created to avoid the issue.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

On the last two patches: Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 114 ++++++++++-----------
>  1 file changed, 57 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> index c265d28631603f266ba606564e77b8f965b7f83b..037c19875daf8b9b13e7702c8640dde1547f817c 100644
> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> @@ -291,16 +291,16 @@ static void drm_test_check_broadcast_rgb_crtc_mode_changed(struct kunit *test)
>  
>  	drm = &priv->drm;
>  	crtc = priv->crtc;
>  	conn = &priv->connector;
>  
> -	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> -
>  	preferred = find_preferred_mode(conn);
>  	KUNIT_ASSERT_NOT_NULL(test, preferred);
>  
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
>  	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
>  	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> @@ -355,16 +355,16 @@ static void drm_test_check_broadcast_rgb_crtc_mode_not_changed(struct kunit *tes
>  
>  	drm = &priv->drm;
>  	crtc = priv->crtc;
>  	conn = &priv->connector;
>  
> -	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> -
>  	preferred = find_preferred_mode(conn);
>  	KUNIT_ASSERT_NOT_NULL(test, preferred);
>  
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
>  	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
>  	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> @@ -420,17 +420,17 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode(struct kunit *test)
>  	drm = &priv->drm;
>  	crtc = priv->crtc;
>  	conn = &priv->connector;
>  	KUNIT_ASSERT_TRUE(test, conn->display_info.is_hdmi);
>  
> -	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> -
>  	preferred = find_preferred_mode(conn);
>  	KUNIT_ASSERT_NOT_NULL(test, preferred);
>  	KUNIT_ASSERT_NE(test, drm_match_cea_mode(preferred), 1);
>  
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
>  	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
>  	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> @@ -531,17 +531,17 @@ static void drm_test_check_broadcast_rgb_full_cea_mode(struct kunit *test)
>  	drm = &priv->drm;
>  	crtc = priv->crtc;
>  	conn = &priv->connector;
>  	KUNIT_ASSERT_TRUE(test, conn->display_info.is_hdmi);
>  
> -	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> -
>  	preferred = find_preferred_mode(conn);
>  	KUNIT_ASSERT_NOT_NULL(test, preferred);
>  	KUNIT_ASSERT_NE(test, drm_match_cea_mode(preferred), 1);
>  
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
>  	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
>  	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> @@ -646,17 +646,17 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode(struct kunit *test)
>  	drm = &priv->drm;
>  	crtc = priv->crtc;
>  	conn = &priv->connector;
>  	KUNIT_ASSERT_TRUE(test, conn->display_info.is_hdmi);
>  
> -	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> -
>  	preferred = find_preferred_mode(conn);
>  	KUNIT_ASSERT_NOT_NULL(test, preferred);
>  	KUNIT_ASSERT_NE(test, drm_match_cea_mode(preferred), 1);
>  
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
>  	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
>  	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> @@ -766,16 +766,16 @@ static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
>  	ret = set_connector_edid(test, conn,
>  				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
>  				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
>  	KUNIT_ASSERT_GT(test, ret, 0);
>  
> -	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> -
>  	preferred = find_preferred_mode(conn);
>  	KUNIT_ASSERT_NOT_NULL(test, preferred);
>  
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
>  	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
>  	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> @@ -840,16 +840,16 @@ static void drm_test_check_output_bpc_crtc_mode_not_changed(struct kunit *test)
>  	ret = set_connector_edid(test, conn,
>  				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
>  				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
>  	KUNIT_ASSERT_GT(test, ret, 0);
>  
> -	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> -
>  	preferred = find_preferred_mode(conn);
>  	KUNIT_ASSERT_NOT_NULL(test, preferred);
>  
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
>  	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
>  	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> @@ -914,16 +914,16 @@ static void drm_test_check_output_bpc_dvi(struct kunit *test)
>  	KUNIT_ASSERT_GT(test, ret, 0);
>  
>  	info = &conn->display_info;
>  	KUNIT_ASSERT_FALSE(test, info->is_hdmi);
>  
> -	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> -
>  	preferred = find_preferred_mode(conn);
>  	KUNIT_ASSERT_NOT_NULL(test, preferred);
>  
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
>  	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
>  	conn_state = conn->state;
>  	KUNIT_ASSERT_NOT_NULL(test, conn_state);
> @@ -958,17 +958,17 @@ static void drm_test_check_tmds_char_rate_rgb_8bpc(struct kunit *test)
>  	ret = set_connector_edid(test, conn,
>  				 test_edid_hdmi_1080p_rgb_max_200mhz,
>  				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
>  	KUNIT_ASSERT_GT(test, ret, 0);
>  
> -	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> -
>  	preferred = find_preferred_mode(conn);
>  	KUNIT_ASSERT_NOT_NULL(test, preferred);
>  	KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
>  
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
>  	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
>  	conn_state = conn->state;
>  	KUNIT_ASSERT_NOT_NULL(test, conn_state);
> @@ -1005,17 +1005,17 @@ static void drm_test_check_tmds_char_rate_rgb_10bpc(struct kunit *test)
>  	ret = set_connector_edid(test, conn,
>  				 test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz,
>  				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz));
>  	KUNIT_ASSERT_GT(test, ret, 0);
>  
> -	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> -
>  	preferred = find_preferred_mode(conn);
>  	KUNIT_ASSERT_NOT_NULL(test, preferred);
>  	KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
>  
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
>  	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
>  	conn_state = conn->state;
>  	KUNIT_ASSERT_NOT_NULL(test, conn_state);
> @@ -1052,17 +1052,17 @@ static void drm_test_check_tmds_char_rate_rgb_12bpc(struct kunit *test)
>  	ret = set_connector_edid(test, conn,
>  				 test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz,
>  				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz));
>  	KUNIT_ASSERT_GT(test, ret, 0);
>  
> -	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> -
>  	preferred = find_preferred_mode(conn);
>  	KUNIT_ASSERT_NOT_NULL(test, preferred);
>  	KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
>  
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
>  	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
>  	conn_state = conn->state;
>  	KUNIT_ASSERT_NOT_NULL(test, conn_state);
> @@ -1099,16 +1099,16 @@ static void drm_test_check_hdmi_funcs_reject_rate(struct kunit *test)
>  
>  	drm = &priv->drm;
>  	crtc = priv->crtc;
>  	conn = &priv->connector;
>  
> -	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> -
>  	preferred = find_preferred_mode(conn);
>  	KUNIT_ASSERT_NOT_NULL(test, preferred);
>  
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
>  	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
>  	/* You shouldn't be doing that at home. */
>  	conn->hdmi.funcs = &reject_connector_hdmi_funcs;
> @@ -1164,23 +1164,23 @@ static void drm_test_check_max_tmds_rate_bpc_fallback(struct kunit *test)
>  
>  	info = &conn->display_info;
>  	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
>  	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
>  
> -	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> -
>  	preferred = find_preferred_mode(conn);
>  	KUNIT_ASSERT_NOT_NULL(test, preferred);
>  	KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
>  
>  	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_RGB);
>  	KUNIT_ASSERT_GT(test, rate, info->max_tmds_clock * 1000);
>  
>  	rate = drm_hdmi_compute_mode_clock(preferred, 10, HDMI_COLORSPACE_RGB);
>  	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
>  
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
>  	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
>  	KUNIT_EXPECT_EQ(test, ret, 0);
>  
>  	conn_state = conn->state;
>  	KUNIT_ASSERT_NOT_NULL(test, conn_state);
> @@ -1233,13 +1233,10 @@ static void drm_test_check_max_tmds_rate_format_fallback(struct kunit *test)
>  
>  	info = &conn->display_info;
>  	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
>  	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
>  
> -	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> -
>  	preferred = find_preferred_mode(conn);
>  	KUNIT_ASSERT_NOT_NULL(test, preferred);
>  	KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
>  
>  	rate = drm_hdmi_compute_mode_clock(preferred, 10, HDMI_COLORSPACE_RGB);
> @@ -1249,10 +1246,13 @@ static void drm_test_check_max_tmds_rate_format_fallback(struct kunit *test)
>  	KUNIT_ASSERT_GT(test, rate, info->max_tmds_clock * 1000);
>  
>  	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_YUV422);
>  	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
>  
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
>  	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
>  	KUNIT_EXPECT_EQ(test, ret, 0);
>  
>  	conn_state = conn->state;
>  	KUNIT_ASSERT_NOT_NULL(test, conn_state);
> @@ -1295,13 +1295,10 @@ static void drm_test_check_output_bpc_format_vic_1(struct kunit *test)
>  
>  	info = &conn->display_info;
>  	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
>  	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
>  
> -	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> -
>  	mode = drm_kunit_display_mode_from_cea_vic(test, drm, 1);
>  	KUNIT_ASSERT_NOT_NULL(test, mode);
>  
>  	/*
>  	 * NOTE: We can't use drm_hdmi_compute_mode_clock()
> @@ -1311,10 +1308,13 @@ static void drm_test_check_output_bpc_format_vic_1(struct kunit *test)
>  	 * Thus, we have to calculate the rate by hand.
>  	 */
>  	rate = mode->clock * 1500;
>  	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
>  
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
>  	crtc = priv->crtc;
>  	ret = light_up_connector(test, drm, crtc, conn, mode, ctx);
>  	KUNIT_EXPECT_EQ(test, ret, 0);
>  
>  	conn_state = conn->state;
> @@ -1356,13 +1356,10 @@ static void drm_test_check_output_bpc_format_driver_rgb_only(struct kunit *test)
>  
>  	info = &conn->display_info;
>  	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
>  	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
>  
> -	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> -
>  	preferred = find_preferred_mode(conn);
>  	KUNIT_ASSERT_NOT_NULL(test, preferred);
>  
>  	/*
>  	 * We're making sure that YUV422 would be the preferred option
> @@ -1377,10 +1374,13 @@ static void drm_test_check_output_bpc_format_driver_rgb_only(struct kunit *test)
>  	KUNIT_ASSERT_GT(test, rate, info->max_tmds_clock * 1000);
>  
>  	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_YUV422);
>  	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
>  
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
>  	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
>  	KUNIT_EXPECT_EQ(test, ret, 0);
>  
>  	conn_state = conn->state;
>  	KUNIT_ASSERT_NOT_NULL(test, conn_state);
> @@ -1423,13 +1423,10 @@ static void drm_test_check_output_bpc_format_display_rgb_only(struct kunit *test
>  
>  	info = &conn->display_info;
>  	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
>  	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
>  
> -	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> -
>  	preferred = find_preferred_mode(conn);
>  	KUNIT_ASSERT_NOT_NULL(test, preferred);
>  
>  	/*
>  	 * We're making sure that YUV422 would be the preferred option
> @@ -1444,10 +1441,13 @@ static void drm_test_check_output_bpc_format_display_rgb_only(struct kunit *test
>  	KUNIT_ASSERT_GT(test, rate, info->max_tmds_clock * 1000);
>  
>  	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_YUV422);
>  	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
>  
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
>  	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
>  	KUNIT_EXPECT_EQ(test, ret, 0);
>  
>  	conn_state = conn->state;
>  	KUNIT_ASSERT_NOT_NULL(test, conn_state);
> @@ -1489,23 +1489,23 @@ static void drm_test_check_output_bpc_format_driver_8bpc_only(struct kunit *test
>  
>  	info = &conn->display_info;
>  	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
>  	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
>  
> -	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> -
>  	preferred = find_preferred_mode(conn);
>  	KUNIT_ASSERT_NOT_NULL(test, preferred);
>  
>  	/*
>  	 * We're making sure that we have headroom on the TMDS character
>  	 * clock to actually use 12bpc.
>  	 */
>  	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_RGB);
>  	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
>  
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
>  	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
>  	KUNIT_EXPECT_EQ(test, ret, 0);
>  
>  	conn_state = conn->state;
>  	KUNIT_ASSERT_NOT_NULL(test, conn_state);
> @@ -1549,23 +1549,23 @@ static void drm_test_check_output_bpc_format_display_8bpc_only(struct kunit *tes
>  
>  	info = &conn->display_info;
>  	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
>  	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
>  
> -	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> -
>  	preferred = find_preferred_mode(conn);
>  	KUNIT_ASSERT_NOT_NULL(test, preferred);
>  
>  	/*
>  	 * We're making sure that we have headroom on the TMDS character
>  	 * clock to actually use 12bpc.
>  	 */
>  	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_RGB);
>  	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
>  
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
>  	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
>  	KUNIT_EXPECT_EQ(test, ret, 0);
>  
>  	conn_state = conn->state;
>  	KUNIT_ASSERT_NOT_NULL(test, conn_state);
> 
> -- 
> 2.47.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
