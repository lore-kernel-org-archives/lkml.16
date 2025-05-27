Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A441FCCF8
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 08:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748333518; cv=none; b=M0Ur976Prwbai2x+kSfUYaFe2sh4E2bR5sOlN7tjeTjDvWc1QcZE62PgGq9zbB/6TZ5QNtDtNYedaZtcOWbcXw6PkJV1o9D+0MbvP3pqgt+wSygevI6NsmQX7CoCIjaY8MvtvFxWceazNd7AaIFRthFTi65ztCG2eFjMtnxjviY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748333518; c=relaxed/simple;
	bh=M0Z25TQaMMnFn5IurMQklTpt99v4cvYnHAu/IuqEobk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UBNoV0b+e0J3Kto0R382IQpiLujd37cYgLKQkgH/xG2wLc6f01MygDXDbyN7mxiqB3SSa2FvWsh3Vlmc3d6+5bpjFE99DaqRjaLtPxCDiiEKNHDOj1yLLcYMVAT7x9lt4QsB06YOEqmycpGSURuDApS5SfDmIayrYGcwykMblI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ivVl5llu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ivVl5llu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748333515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uc8SBIaKuW9hd4Ztl1l2JfCcfjBxitXGrH2FjSYGyBI=;
	b=ivVl5llu4DBwRCGO/v62wKHTpLkR7kCUspjWqEZDX90bcPDQlREBOZxj6zK/sUEu/Hdv7x
	M/NHh2FYdIISFj+Mw1ymCWoTHKfbNd0+pjUHVeoDU/WstdVOggRm7T6Xg0fkAEHY87d8bP
	kOt5RgrMuKnX8LkWA2AYEaxeArSAves=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-zdDm7ZGAOoi2Lzu7QDrqTA-1; Tue, 27 May 2025 04:11:53 -0400
X-MC-Unique: zdDm7ZGAOoi2Lzu7QDrqTA-1
X-Mimecast-MFC-AGG-ID: zdDm7ZGAOoi2Lzu7QDrqTA_1748333512
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-442ffaa7dbeso22556185e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 01:11:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748333512; x=1748938312;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uc8SBIaKuW9hd4Ztl1l2JfCcfjBxitXGrH2FjSYGyBI=;
        b=Ex06Q5fRDfnTHpOYbRv3/Y0U3ewe74fQgqJc6CUZWvn5gEmCDLlK/PP8yKvOYlhIVZ
         1j64BcPCQKOgEx8RMbpDyPvWiJMbYlu4T/pl0u3eBd0i2DheLB26yP9cmQqBXE1bXk95
         ntb7fY9LeUTMlW9Ji3lpCSj9bVJKs17dhixLZHbstmJfZH/ZYNztN3rxNu9cDu1d5OYQ
         /KlB4+gTE8MTxr4NEFzkOTlIeGYN+jVfun2Ushk6riAkxcsWYJMH3VCMbck4fMlcD4jR
         oxP9Zykl0F1Y7FEAb4302wqXOC5WWsrKFGXOMs4Dfkeg2uBI+S6NHF5gSeKE0Ele0u4c
         SWAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXne1sBPfKnNjl61TEEkoEo5RwwQOtVeBvxtDjmM4UUzcudl2QhFCCgdpX+3ph4J9jNFkp6CPbetji1rb4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+IRapsutSXQ+BUf4thWgQeMrv9t5vA1NxizM2JT5SaB6E+9L3
	71MV2ewCiUNfbdUTDgINYA1fLX++ZIZmD7VouggI8/zJsemPS9OIe3I3iXb0BLQepcXXPqvJO+i
	9jORZOSiDagxzRUi8eOwd8rM6KNUkRTAQzvpjnMGf0uU0REU1zFKypoKbdIwOrdX+Vw==
X-Gm-Gg: ASbGncsTm3GEmhjNKdVARuQhOH0z9yv0zxPbujFo+NOOtQHsYtPY0nEe5y0JehO8/Do
	EXr6fblw73mJ4RfiYhJ1pVRB70w4iMIlpa10rKIiY+bjmk6zdjD8lRN1LrcbrwLdj+xkZVuKvHq
	d9ruua+mxXDs5MLo04ZVGtcTeswIv+MqmEkHmNfJJFh/wkK0wKHhrDQDrVSFOYGoeJ5yBPDyclR
	qA1KStpGofkvSnL4Maf4/1BxPBSXExF8GROkSwqhszBR8RCDVRLbe8Dyds2b0flpoZXAVD9irbu
	Gm506SEg+h3ArsDZC/mKo8LiCJuHWYeJt6CzgERXwgQCwL0BVJU=
X-Received: by 2002:a05:600c:64c5:b0:43c:fbbf:7bf1 with SMTP id 5b1f17b1804b1-44c935dbb26mr120963485e9.30.1748333512438;
        Tue, 27 May 2025 01:11:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYAtk9413NqBo2PajYHvgPjwcpaG+eT7N4Q6fyVV+Lil0t7i7dtNFpt991DzyOflFbKn4oJA==
X-Received: by 2002:a05:600c:64c5:b0:43c:fbbf:7bf1 with SMTP id 5b1f17b1804b1-44c935dbb26mr120963055e9.30.1748333511996;
        Tue, 27 May 2025 01:11:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f7d975f4sm258858665e9.39.2025.05.27.01.11.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 01:11:50 -0700 (PDT)
Message-ID: <8bfce982-b22a-4ef3-b79e-5e22a3364c5a@redhat.com>
Date: Tue, 27 May 2025 10:11:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC drm-misc-next v2 1/1] drm/hyperv: Add support for
 drm_panic
To: Ryosuke Yasuoka <ryasuoka@redhat.com>, drawat.floss@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250526090117.80593-1-ryasuoka@redhat.com>
 <20250526090117.80593-2-ryasuoka@redhat.com>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250526090117.80593-2-ryasuoka@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/05/2025 11:01, Ryosuke Yasuoka wrote:
> Add drm_panic module for hyperv drm so that panic screen can be
> displayed on panic.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
> ---
>   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c | 36 +++++++++++++++++++++
>   1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> index f7d2e973f79e..945b9482bcb3 100644
> --- a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> @@ -17,6 +17,7 @@
>   #include <drm/drm_gem_framebuffer_helper.h>
>   #include <drm/drm_gem_shmem_helper.h>
>   #include <drm/drm_probe_helper.h>
> +#include <drm/drm_panic.h>
>   #include <drm/drm_plane.h>
>   
>   #include "hyperv_drm.h"
> @@ -181,10 +182,45 @@ static void hyperv_plane_atomic_update(struct drm_plane *plane,
>   	}
>   }
>   
> +static int hyperv_plane_get_scanout_buffer(struct drm_plane *plane,
> +					   struct drm_scanout_buffer *sb)
> +{
> +	struct hyperv_drm_device *hv = to_hv(plane->dev);
> +	struct iosys_map map = IOSYS_MAP_INIT_VADDR_IOMEM(hv->vram);
> +
> +	if (plane->state && plane->state->fb) {
> +		sb->format = plane->state->fb->format;
> +		sb->width = plane->state->fb->width;
> +		sb->height = plane->state->fb->height;
> +		sb->pitch[0] = plane->state->fb->pitches[0];
> +		sb->map[0] = map;
> +		return 0;
> +	}
> +	return -ENODEV;
> +}
> +
> +static void hyperv_plane_panic_flush(struct drm_plane *plane)
> +{
> +	struct hyperv_drm_device *hv = to_hv(plane->dev);
> +	struct drm_rect rect;
> +
> +	if (!plane->state || !plane->state->fb)
> +		return;
> +
> +	rect.x1 = 0;
> +	rect.y1 = 0;
> +	rect.x2 = plane->state->fb->width;
> +	rect.y2 = plane->state->fb->height;
> +
> +	hyperv_update_dirt(hv->hdev, &rect);
> +}
> +
>   static const struct drm_plane_helper_funcs hyperv_plane_helper_funcs = {
>   	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
>   	.atomic_check = hyperv_plane_atomic_check,
>   	.atomic_update = hyperv_plane_atomic_update,
> +	.get_scanout_buffer = hyperv_plane_get_scanout_buffer,
> +	.panic_flush = hyperv_plane_panic_flush,
>   };
>   
>   static const struct drm_plane_funcs hyperv_plane_funcs = {

