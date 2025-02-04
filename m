Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C8613C9D4
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 11:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738666912; cv=none; b=s2RksSJTYijYGLI31gKeAJSBvg+AMWTaMr1R22zBaTwhTOsRIKhF7GPTBHDR+NiEAl3eKi1dYpMQXR9Dk9qpf80CS97Z8oHkQxRzpIBIu1NKK1ZBzKOo3vAStQ4iWBdQhg8bjnYo5fm8YnI+jw1h8BCMAk5QXZFu/YOqvtlhPzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738666912; c=relaxed/simple;
	bh=lG+lX0RL2hf6kLY4LG8VNIeUZZgyY3goNyfUTsb69Vo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZoAmRTmpTW/zXYVk18X5o2uk0JeMiguL8eK1Wu6pwwUyntlnR2X6fc1KnKsZ1Ji0aMSAfoyNNAUS2uzOthH0AvlKTT1M+reMf26Z46y5zduivpBlbIwC4mm9tV/14CUdRJb/Dkyv7G4YDx4XEJlh96gJ5pXmPttRIxuqyemok50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=lcYfVy86; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="lcYfVy86"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43675b1155bso62888205e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 03:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1738666909; x=1739271709; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4RRHdA8PEvlS1K4N8G9kevaoe1zJxa3+4zL3bWQzDDc=;
        b=lcYfVy86VrtbIiPdmkusUyRJJKC3A4lpu4qmnrONjkgFPSjRAP9jMSPU7Al0/YV4gJ
         8wdfqJOTF1VtwuN3UpvODPs5IwpMCvk2nC6PId1bLsBq10ht//5aLRMUQfIa7MUypssg
         U+yli76Tda2MXzjDidzWbfgXTQ20PDiK+CEwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738666909; x=1739271709;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4RRHdA8PEvlS1K4N8G9kevaoe1zJxa3+4zL3bWQzDDc=;
        b=h4m5hZsyJiHtxHUNNSr9384v5C5OoOzCFDbjEClOoKi15zsnWhIFU1s7QYA2ctPZZ9
         XorK+4GJN8H2P/PYoX2UoGED0waFd7MmUGinE/we6hFaUzGEFPmR6O5eIp1JNxZ1CxXf
         Btu4CPJ4TCOqpzm17xQ+fkxq0dtjmgjiA1sTr81UFiF6J37reKPw1NRv59jv+/UzIEx+
         ZC0Zu6Nh7RD5jq26TO/5PWL57KP59C3WNscZirPEHBgHw1GzrMXRFXqx6gxM6NhmdYOz
         WPK+7YokDj5uJmSokuhUmyHQF5z2XYjeX/a0SWw0X+2H4f5sg/7K1pheHTrFqliksWvo
         ofNA==
X-Forwarded-Encrypted: i=1; AJvYcCV8JZpwRpjyqTOOMbubT4s2KmTNskWwT5ysJdBk9s/rnTjR3OjBN8GQroffMilK3bDOSnlBSMANGqnT2Uw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoUu4eEfQem7Y9+kU8zib8cztaq1YpokPycgGRcBbJJnRKhL+8
	4LjirhmoUBez+NK2rgbqLFOu5QDc9M22L7/0sj81iR2V/7IiuhIQJKGyIPU7Ptc=
X-Gm-Gg: ASbGncvvko6WTP6iRHhPZq+BQwHm117x6thNJJPLNqZV2JXiqDlmQJ4lwFV5hDZ83+5
	pixXFUQbs8qW0eJxBElAegeVf5ET/VXTeosm5oFINKgSfUXbFhpBRKCdXwHIHls0tEhckfYn93K
	NQoLdDXfdIDFAfx/l0hHFTbuIDdd5lSx6R30Gd5lBotS2ObCQgGwt6jZiZ39rqDD3f4fVkyN0jT
	F5tyRM4dGS4+tdTNVWq9a8FN1jYhcUKDos2Y35uhoR9zlk7cFmI+X8NqiZ8s52uqOKERKeeZSBW
	W7rhiyy4g2yRsarTbKxTQtG7J2I=
X-Google-Smtp-Source: AGHT+IE4tbTEBtOtOWfRx+wMuOIFvnqto2qUCCNbXg7ebOju1AxB69qu9Dm54X12CZTRq0bm1g4AuQ==
X-Received: by 2002:a05:600c:4594:b0:434:f9e1:5cf8 with SMTP id 5b1f17b1804b1-438dc435389mr221006195e9.31.1738666909046;
        Tue, 04 Feb 2025 03:01:49 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23de35csm185128975e9.10.2025.02.04.03.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 03:01:48 -0800 (PST)
Date: Tue, 4 Feb 2025 12:01:46 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] drm/tests: hdmi: Fix WW_MUTEX_SLOWPATH failures
Message-ID: <Z6HzmlUR1gdXJqXZ@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250129-test-kunit-v2-0-fe59c43805d5@kernel.org>
 <20250129-test-kunit-v2-1-fe59c43805d5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129-test-kunit-v2-1-fe59c43805d5@kernel.org>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Wed, Jan 29, 2025 at 03:21:53PM +0100, Maxime Ripard wrote:
> The light_up_connector helper function in the HDMI infrastructure unit
> tests uses drm_atomic_set_crtc_for_connector(), but fails when it
> returns an error.
> 
> This function can return EDEADLK though if the sequence needs to be
> restarted, and WW_MUTEX_SLOWPATH is meant to test that we handle it
> properly.
> 
> Let's handle EDEADLK and restart the sequence in our tests as well.
> 
> Fixes: eb66d34d793e ("drm/tests: Add output bpc tests")
> Reported-by: Dave Airlie <airlied@gmail.com>
> Closes: https://lore.kernel.org/r/CAPM=9tzJ4-ERDxvuwrCyUPY0=+P44orhp1kLWVGL7MCfpQjMEQ@mail.gmail.com/
> Link: https://lore.kernel.org/r/20241031091558.2435850-1-mripard@kernel.org
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> index c3b693bb966f1f8b04066d19f520bfa4bf11c23d..e814b538c46c4d342604436beca64ac0bdb31526 100644
> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> @@ -68,14 +68,21 @@ static int light_up_connector(struct kunit *test,
>  	int ret;
>  
>  	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
>  
> +retry:
>  	conn_state = drm_atomic_get_connector_state(state, connector);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
>  
>  	ret = drm_atomic_set_crtc_for_connector(conn_state, crtc);
> +	if (ret == -EDEADLK) {
> +		drm_atomic_state_clear(state);
> +		ret = drm_modeset_backoff(ctx);
> +		if (!ret)
> +			goto retry;
> +	}

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

>  	KUNIT_EXPECT_EQ(test, ret, 0);
>  
>  	crtc_state = drm_atomic_get_crtc_state(state, crtc);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
>  
> 
> -- 
> 2.47.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
