Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A0F22F751
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 07:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745565342; cv=none; b=mouFtPQXjSzEOdLg5l0ubxoYufKY0gP7/MTscvIMyrtkAfkLfuyOim9/T1gowSfZYEMhNc63Rb1JmV1GGnK4byZHq0z4MSitDQHrMRPrq5kqSw7lATrlE1M0ksLOQBlFCi2fgWoMw+DIssI4RBb3yidzecM0zRL9ykiEgy4IW04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745565342; c=relaxed/simple;
	bh=Z0yNmKrBiTY5ZX2EKRFyzFZhdWxcMonxd/cXfY84SHw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HAFtI6sa9eIRwYgr+gnErb7eT5fHL1jpT9LCyOVbmwdXqwhVPOPEtkkr4mRf7jCn/CyE0eyewAHvUiRD8Owlmhka8xEzjqAzWCWVe4ugX+fFy9QOTPciB4vspn7TeVBe6bG/BdVMUYYZdI+kj+Y7yPah40xTBKpL4wodZh/FAQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G/QM1s2O; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G/QM1s2O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745565338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T7r2z4B/7Mbfi0IDabIkh3LojKAky8fE2btyGmdHAwA=;
	b=G/QM1s2OSWO2YdV0eOVWVAq6F3FsCF78Dl1tpzDct99SujKEz0rrbWKt5xy5x6G9YlQCsP
	JlhpQ2Sleh8oGUimPuxWXu0AWCQCtlxrO9ZppMnb2yLpqZFzx/aRR2DF+NcYgrE50B7kyF
	iZiD3PKkZT2ctho+8yqNct307RMTWqA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-278-qNrgYy0uNluo6vSv2ispwg-1; Fri, 25 Apr 2025 03:15:33 -0400
X-MC-Unique: qNrgYy0uNluo6vSv2ispwg-1
X-Mimecast-MFC-AGG-ID: qNrgYy0uNluo6vSv2ispwg_1745565332
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39ac9b0cb6aso856671f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 00:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745565332; x=1746170132;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T7r2z4B/7Mbfi0IDabIkh3LojKAky8fE2btyGmdHAwA=;
        b=tTkIGmW+GzIazc6GERSfM2HQUCE+PA5FFbBq7baYcm11qJMGy7+C1PaEAbAXRxdzSM
         wj8Eje8/zecEXKaavxOqRCaVkO9gDyZbqMwRzCzjBUliENurSr/hqe89dMkPy5n0/19F
         t0yooMjD4GPOFtiIiM/2s+yR0bCqRBpnh161rucwEEGt+dQXrdYxXoxlOPOeC3948p13
         Yjf96gKaYIoTTWQdoEuYplPEke21wM1+EEGJ3o8AfDaAbdH5KaO1Swrzdwe7W3DE7xVt
         QLORKuvyAwuyEmHS1s8K0a1zRDbqoPGv43zfPby+8g8mNb+iNJ9QJUflbxqdIMUVjx88
         S7Pg==
X-Forwarded-Encrypted: i=1; AJvYcCVAW2m1J1d7sFaXA4s3lFrSAxX2u/UarLfyQLdMIksKLd7iG/RTsw7cbzU1JZAlvFSMWDjzVX7w0m9TBns=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyad3S1hMbAA9JTDQM1ZcfWMMQEIOMRYpA3ANu30aaTsRxfNPx6
	19XsCWwIvCwPdXN2YhuwTpuALT0tL4rNOa05/U5z/xSLp+DB8aGftxGC8G8MDdUeF+E6ZE2BEG0
	yfEYgnzHegKx7LLvvpk62FQyUd6EYWVEref7OjZ7zFQyhpyHITQCN0UQVxoS3Ag==
X-Gm-Gg: ASbGncsEtbv9r9J/Arv6gIHl0Ken9hGP0QgRPdQ29NDe4pLYvIQi9Y1JjvDjifHYH70
	+fc54Y7Dk2jSMTmcqXT1OZcHhPcYd9UpSYaIwzOHAYHHxTGxg6QsVs0CS2dMbBPd5U9V8LkRbnB
	DQgSWUiiiGzrCGxGbZ72tUFbcQgRxbG6ANnSByipKa5mJF2wf5hYgdwd6xYyRRc9XViF3FjAGIO
	p8nRpvMIdL85Zhk00EkM+UAH1Y0cmlCX8G0yIKagQbDWRP1dKu6zAUb4Sf+TI38VFnoB6CP5WUe
	jazZan9tTlHD2Z3VPxlnXJDAy4kAl8OGN7OgcwYbRIngK38Adm/tksifpgbDFNTqJPZXaw==
X-Received: by 2002:a05:6000:186c:b0:39f:fcb:3bf6 with SMTP id ffacd0b85a97d-3a074e0dfccmr653958f8f.2.1745565332264;
        Fri, 25 Apr 2025 00:15:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKjltySyoEEsZUoyQAjvToSkGsH8mjTJtTxmkBO665sLQSkBEEV6kyM0pGb2qhN8WQSJn6fQ==
X-Received: by 2002:a05:6000:186c:b0:39f:fcb:3bf6 with SMTP id ffacd0b85a97d-3a074e0dfccmr653934f8f.2.1745565331871;
        Fri, 25 Apr 2025 00:15:31 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca543bsm1492506f8f.34.2025.04.25.00.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 00:15:31 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Ryosuke Yasuoka <ryasuoka@redhat.com>, drawat.floss@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jfalempe@redhat.com
Cc: Ryosuke Yasuoka <ryasuoka@redhat.com>, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH drm-next v2] drm/hyperv: Replace simple-KMS with regular
 atomic helpers
In-Reply-To: <20250425063234.757344-1-ryasuoka@redhat.com>
References: <20250425063234.757344-1-ryasuoka@redhat.com>
Date: Fri, 25 Apr 2025 09:15:29 +0200
Message-ID: <87wmb8yani.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ryosuke Yasuoka <ryasuoka@redhat.com> writes:

Hello Ryosuke,

> Drop simple-KMS in favor of regular atomic helpers to make the code more
> modular. The simple-KMS helper mix up plane and CRTC state, so it is
> obsolete and should go away [1]. Since it just split the simple-pipe
> functions into per-plane and per-CRTC, no functional changes is
> expected.
>
> [1] https://lore.kernel.org/lkml/dae5089d-e214-4518-b927-5c4149babad8@suse.de/
>
> Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
>



> -static void hyperv_pipe_enable(struct drm_simple_display_pipe *pipe,
> -			       struct drm_crtc_state *crtc_state,
> -			       struct drm_plane_state *plane_state)
> +static const uint32_t hyperv_formats[] = {
> +	DRM_FORMAT_XRGB8888,
> +};
> +
> +static const uint64_t hyperv_modifiers[] = {
> +	DRM_FORMAT_MOD_LINEAR,
> +	DRM_FORMAT_MOD_INVALID
> +};
> +

I think the kernel u32 and u64 types are preferred ?

> +static void hyperv_crtc_helper_atomic_enable(struct drm_crtc *crtc,
> +					     struct drm_atomic_state *state)
>  {
> -	struct hyperv_drm_device *hv = to_hv(pipe->crtc.dev);
> -	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
> +	struct hyperv_drm_device *hv = to_hv(crtc->dev);
> +	struct drm_plane *plane = &hv->plane;
> +	struct drm_plane_state *plane_state = plane->state;
> +	struct drm_crtc_state *crtc_state = crtc->state;
>  
>  	hyperv_hide_hw_ptr(hv->hdev);
>  	hyperv_update_situation(hv->hdev, 1,  hv->screen_depth,
>  				crtc_state->mode.hdisplay,
>  				crtc_state->mode.vdisplay,
>  				plane_state->fb->pitches[0]);
> -	hyperv_blit_to_vram_fullscreen(plane_state->fb, &shadow_plane_state->data[0]);
>  }
>  
> -static int hyperv_pipe_check(struct drm_simple_display_pipe *pipe,
> -			     struct drm_plane_state *plane_state,
> -			     struct drm_crtc_state *crtc_state)
> +static void hyperv_crtc_helper_atomic_disable(struct drm_crtc *crtc,
> +					      struct drm_atomic_state *state)
> +{ }
> +

Why do you need an empty CRTC atomic disable callback? Can you just not
set it instead?

>  
> -static void hyperv_pipe_update(struct drm_simple_display_pipe *pipe,
> -			       struct drm_plane_state *old_state)
> +static void hyperv_plane_atomic_update(struct drm_plane *plane,
> +						      struct drm_atomic_state *old_state)
>  {
> -	struct hyperv_drm_device *hv = to_hv(pipe->crtc.dev);
> -	struct drm_plane_state *state = pipe->plane.state;
> +	struct drm_plane_state *old_pstate = drm_atomic_get_old_plane_state(old_state, plane);
> +	struct hyperv_drm_device *hv = to_hv(plane->dev);
> +	struct drm_plane_state *state = plane->state;

You should never access the plane->state directly, instead the helper
drm_atomic_get_new_plane_state() should be used. You can also rename
the old_state paramete to just state, since it will be used to lookup
both the old and new atomic states.

More info is in the following email from Ville:

https://lore.kernel.org/dri-devel/Yx9pij4LmFHrq81V@intel.com/

>  	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
>  	struct drm_rect rect;
>  
> -	if (drm_atomic_helper_damage_merged(old_state, state, &rect)) {
> +	if (drm_atomic_helper_damage_merged(old_pstate, state, &rect)) {

I know that most of the simple-KMS drivers do this but since this driver
enables FB damage clips support, it is better to iterate over the damage 
areas. For example:

	struct drm_atomic_helper_damage_iter iter;
        struct drm_rect dst_clip;
	struct drm_rect damage;

	drm_atomic_helper_damage_iter_init(&iter, old_pstate, state);
	drm_atomic_for_each_plane_damage(&iter, &damage) {
		dst_clip = state->dst;

		if (!drm_rect_intersect(&dst_clip, &damage))
			continue;

                hyperv_blit_to_vram_rect(state->fb, &shadow_plane_state->data[0], &damage);
                hyperv_update_dirt(hv->hdev, &damage);
        }


Other than these small comments, the patch looks good to me. So if you take
into account my suggestions, feel free to add:

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

