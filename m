Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3EB78F33
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 11:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738667748; cv=none; b=UyD0ivDeUN40Ltvrcr//OZMbi5dhyWC6WYAzuEjKxaZ9dBXz8XKQehlnje8mNxMtWrq8BJJjvs26btivTVUe37yPPJ6R3qURVO2SQPknP7XF4FiAyVwKUd0yToiiraYTZIrRF00fZOXa0v2wqPsEym9V35nLvC6OPKgcyQi+8AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738667748; c=relaxed/simple;
	bh=f/dJVHZaoNM4Tcl0bBtr9zQW1v91cU0Px9ZAW/4Q6OY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XkLDhsTltno0FM4wRGMyM1Xh1vaNmZW81YODkzGZcyAC6nRil+7j7KT/bZ7bUVUfPvrHcoxX22DNRrBZtKgBaL5XePGbyZXqmXGMPbO5C0h97Rim733mOPRBjJ+mq/qJetUDtwfMRjJLbbpN1ZKz73jzhGM9zaEC9r4hdZ0HIIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=OfNMwVSw; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="OfNMwVSw"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-436345cc17bso40326445e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 03:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1738667745; x=1739272545; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s2SfD4Gn61MFQawkBcj2q/218D2jiOKMHITzYwMlqEs=;
        b=OfNMwVSw+CiVwb+PLwJgGY4lqzhPwLOSGVpEoEM34ZyWNoe0ovexrDbneC7WHI8rZ6
         s6/0d+Qyd3m1A70sISDvTTwkU7+qErcg3b2PmfI7u3u//ZKhNTxLhOlXpTGlyk01IsWB
         2eMNfJhF5JozKGqgN/nSBtSbiMiRaUItIk+7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738667745; x=1739272545;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s2SfD4Gn61MFQawkBcj2q/218D2jiOKMHITzYwMlqEs=;
        b=CyjBuVyfVBJH8Yj5xRoosP7UOhpBNfkexaI3MhynC79XItk18zFxo8375+/ZeNDEQn
         gzlnufPJW1vkjvo7aVTsAYaOj7J1kmX0ugkKCsdB+g+8ID+N5A/uNOljDErM0/i54TAG
         Ut8+6fuiQdxH201DrncJgJnwMAv0TCGU+F60i8yZ58tzmYAn5DwqNYxIJJvSBc0/cMoJ
         3yWQxxLz38hy/Q22ulXS4tmOyKaNjUcqagI6Lpk6oQw42n1OeasLIFap02Es+x4G+ykB
         4JvCAS4s12RmNnb3emWHwxgUm6HKnS5TDw1svMxni0wCMQ7NgrKrp7sxqLgi0e/7mXIw
         Os/w==
X-Forwarded-Encrypted: i=1; AJvYcCVG7G4uJVRqWPZvloOBUyXIe3C/+SJEtsvPctazu313gxDpNpS9fG1ZjK70qHbWdioTDYtOqcBWgyl/BEM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvu2Kgqa7S/3xmdAPaHBL8g1pDSEZEPZic71UoY0WcVty4xWDb
	V5TrhbdfKHDif2zBSjufSFFTDpGsgeQTNJNvqySHgwproh/OAED5vhbGSK6a5js=
X-Gm-Gg: ASbGncuS+hABHVZB+mhfATfc/uYZjmtAVWAEoIn5z4mcvMeZlbEI5WJijS//JiH33No
	+aIzRyatugFm9diRK9rk/wQZ69IZl43qLIUWiWMw++HBWZq4YancTfWpZNuUseXwD6X8kjjrgl4
	TZHrNwvbv228WZK2n0UNyAA/XzBvLUg5t2nIHJ13C2nJJDiWan5hpSHoXnFemDYTRvIqQj4A1xO
	5ZIbra0HXu73E8aGVwAtU/fkQZvBvlGOizv0XFsDo5a54i5qT+8hgU8AkFatinFLvQ4zNwIAu58
	JTB0FXGVuYa3sYgav35COt3rNtw=
X-Google-Smtp-Source: AGHT+IEhi3bvOg4+34PKysGfB6hzTPcUQgampsEPyThrWoRpNZx+SHoGK/R2iUfFL+AtOAeSuipPlA==
X-Received: by 2002:a5d:5f82:0:b0:385:f060:b7fc with SMTP id ffacd0b85a97d-38c51960052mr23268766f8f.25.1738667744860;
        Tue, 04 Feb 2025 03:15:44 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e245efbcsm183097995e9.33.2025.02.04.03.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 03:15:44 -0800 (PST)
Date: Tue, 4 Feb 2025 12:15:42 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] drm/tests: hdmi: Remove redundant assignments
Message-ID: <Z6H23pkOfcQb8-PP@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250129-test-kunit-v2-0-fe59c43805d5@kernel.org>
 <20250129-test-kunit-v2-2-fe59c43805d5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129-test-kunit-v2-2-fe59c43805d5@kernel.org>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Wed, Jan 29, 2025 at 03:21:54PM +0100, Maxime Ripard wrote:
> Some tests have the drm pointer assigned multiple times to the same
> value. Drop the redundant assignments.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> index e814b538c46c4d342604436beca64ac0bdb31526..32e0477deb45c1481a7d23bb6e6a74de52845d1c 100644
> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> @@ -479,11 +479,10 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode_vic_1(struct kunit *test)
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
>  
>  	mode = drm_kunit_display_mode_from_cea_vic(test, drm, 1);
>  	KUNIT_ASSERT_NOT_NULL(test, mode);
>  
> -	drm = &priv->drm;
>  	crtc = priv->crtc;
>  	ret = light_up_connector(test, drm, crtc, conn, mode, ctx);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
>  	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
> @@ -593,11 +592,10 @@ static void drm_test_check_broadcast_rgb_full_cea_mode_vic_1(struct kunit *test)
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
>  
>  	mode = drm_kunit_display_mode_from_cea_vic(test, drm, 1);
>  	KUNIT_ASSERT_NOT_NULL(test, mode);
>  
> -	drm = &priv->drm;
>  	crtc = priv->crtc;
>  	ret = light_up_connector(test, drm, crtc, conn, mode, ctx);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
>  	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
> @@ -709,11 +707,10 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode_vic_1(struct kunit *te
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
>  
>  	mode = drm_kunit_display_mode_from_cea_vic(test, drm, 1);
>  	KUNIT_ASSERT_NOT_NULL(test, mode);
>  
> -	drm = &priv->drm;
>  	crtc = priv->crtc;
>  	ret = light_up_connector(test, drm, crtc, conn, mode, ctx);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
>  	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
> @@ -1311,11 +1308,10 @@ static void drm_test_check_output_bpc_format_vic_1(struct kunit *test)
>  	 * Thus, we have to calculate the rate by hand.
>  	 */
>  	rate = mode->clock * 1500;
>  	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
>  
> -	drm = &priv->drm;
>  	crtc = priv->crtc;
>  	ret = light_up_connector(test, drm, crtc, conn, mode, ctx);
>  	KUNIT_EXPECT_EQ(test, ret, 0);
>  
>  	conn_state = conn->state;
> 
> -- 
> 2.47.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
