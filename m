Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7427D1DDC3F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 06:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750314342; cv=none; b=L8VHV+xLxH9X5pyHwnPC4w93na9TYnhkFMnyZPl4cJiZLwaoyMHYEkMV8Fdu+l5AnIf58EcZ/EvynrDM+cNXx+CdAhT/9GvksJLmnyUklxwmK0wWORD0WBjG8FGfruer+QrFKS8gialuLu5UFoh2V8YYD0pI6LAbc96y130BX+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750314342; c=relaxed/simple;
	bh=JG3nvfiN+nfkKfMXtVntmeqB5dj2FvNfrLBFrwh5UM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WC1fWNQjnD12oHGZV2N87LcYzxZVvaq6Z3UWz2Jz1aekEwNDPS3Eba3/dyCx/LHOAivQGVgxNu9xALtAKKRPsaMbLi79cyMvHAEyKUhv9ax9PULgzrAoPUfGQWDp67dIerW9xcszsD4S4u5JqWjOMibg2PG2JiOOwxSAegrc7S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V4zDLsTM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V4zDLsTM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750314339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pfhEtd1jwHhvY5Akc+bs9I+OMHq84rXrBLaKDXZZDvg=;
	b=V4zDLsTMcz2fjhOQuYLQzqtWDIP0z5muuNyBr8FXVIFnDSumzYj9H8BlsbRbytyYBmeMF7
	PvOcWNBXeDkyCiJ2NDor37Y8JVmVNoHxnXP/o8TBI0N86hNxvLOiUiVT9cvDHgAP9Mlc67
	XJWE/PB2jiCBokqWgSTZvw6ZhDbxQlY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-eYt5x1H7OXWwnN9_M4zJbQ-1; Thu, 19 Jun 2025 02:12:48 -0400
X-MC-Unique: eYt5x1H7OXWwnN9_M4zJbQ-1
X-Mimecast-MFC-AGG-ID: eYt5x1H7OXWwnN9_M4zJbQ_1750313567
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450d6768d4dso2378175e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 23:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750313567; x=1750918367;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pfhEtd1jwHhvY5Akc+bs9I+OMHq84rXrBLaKDXZZDvg=;
        b=iRTOSJgpWWUgvCH32jhPkBlMQCHcJN8OF3ncZ18qf+a4UxwuPNUeo7zsNGme/hFjLx
         yteQ+q8u7b93laTPzeIlTbiE8HDGfNNDJLRBh1WPJVJ6tZo5pHLHSmBqXM1WZaQ8h9i0
         XbMtScJYYAMKyGkH6XLafC+xREdMXwP90Q5LjPSARIFe7+EWem1ZWIctYMqFH/byHG9E
         TMre5Dj0UarK+vaYocxx4372+S7vAXUeKqpFGzoP4enfJSvNunI+7Ldm1tYELuomIs12
         BH4IbxK+rwrHVbsYAr0XosodIaVkNLMxmR0ldMG6OD/rj/NrDpkYxuHpiYx97un2FU5L
         y8wg==
X-Forwarded-Encrypted: i=1; AJvYcCWhA024yR+3W8pa3ac681Ce0VtGI02LCJTuHSWQNbNWOAPA1Zt5K6IH9rdbekXFiFpHm0B+QcdkLLSYKMQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIXBHN5BxStw15/XeVt48s0TfAUUjii1xKZPZxFMyBinBnBwjW
	TjZLwWNLzt2aLPC3TTJUAtTTDJl/E4Xhr+Uxgj/fXBmI+pgKTtzTliFJ6iTfxvpxIyQMFf4P9rl
	tdX+OF7aYpyGjGnMBKwKxt0aIvQBuySXmQq9ktu/VUYUAa5ANYnh4HEtJKmKqro0m0w==
X-Gm-Gg: ASbGnctRvQCWZ5Oh4DO6ybGOxN3TguYo34bzriQQ8WzfWff+VWLKcc3362ZR57Q6C57
	KEZKJTXxXavqtGrU5ZpW/4asanexsaLEpUwpxrZWHlCW+6ldJD4OkM7coo6pIvtaZM/ZVtf/G26
	t5ufYcf3QeBA+tKyDD9I1nj1RenuJy/bKIGF8Eb0lqXmdl+bgSKpuwx+QAhutW0V7JZ3WCYen75
	6Nhvq5mXY5/k9aQs+CDXh7iDcrpBhQiAfLU2sG2VkB2xFo/8yPMg/q88O6no28drMvXxkmPYwLD
	eQC3C31vxupTJ2MSHAAaetaAqYVC
X-Received: by 2002:a05:600c:8012:b0:43b:ce36:7574 with SMTP id 5b1f17b1804b1-4533cae684fmr198267255e9.11.1750313566742;
        Wed, 18 Jun 2025 23:12:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGv4EqMqSDWgujH3nkvWTbJJTf6ltr+z032AO09GMUBmRwveoEtpo/cuFt1a8jxgEJEJ0WV8A==
X-Received: by 2002:a05:600c:8012:b0:43b:ce36:7574 with SMTP id 5b1f17b1804b1-4533cae684fmr198266955e9.11.1750313566319;
        Wed, 18 Jun 2025 23:12:46 -0700 (PDT)
Received: from [192.168.190.158] ([37.167.112.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ebd02basm17508635e9.39.2025.06.18.23.12.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 23:12:45 -0700 (PDT)
Message-ID: <30f0ea0c-d8fb-461e-86ab-6e7677beac3c@redhat.com>
Date: Thu, 19 Jun 2025 08:12:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-next] drm/bochs: Add support for drm_panic
To: Ryosuke Yasuoka <ryasuoka@redhat.com>, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250613132023.106946-1-ryasuoka@redhat.com>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250613132023.106946-1-ryasuoka@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/06/2025 15:20, Ryosuke Yasuoka wrote:
> Add drm_panic moudle for bochs drm so that panic screen can be displayed
> on panic.

Thanks for the patch, it's simple and looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

If no objections, I will push it next Monday.

Best regards,

-- 

Jocelyn

> 
> Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
> ---
>   drivers/gpu/drm/tiny/bochs.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
> index 8706763af8fb..ed42ad5c4927 100644
> --- a/drivers/gpu/drm/tiny/bochs.c
> +++ b/drivers/gpu/drm/tiny/bochs.c
> @@ -19,6 +19,7 @@
>   #include <drm/drm_gem_shmem_helper.h>
>   #include <drm/drm_managed.h>
>   #include <drm/drm_module.h>
> +#include <drm/drm_panic.h>
>   #include <drm/drm_plane_helper.h>
>   #include <drm/drm_probe_helper.h>
>   
> @@ -469,10 +470,28 @@ static void bochs_primary_plane_helper_atomic_update(struct drm_plane *plane,
>   	bochs_hw_setformat(bochs, fb->format);
>   }
>   
> +static int bochs_primary_plane_helper_get_scanout_buffer(struct drm_plane *plane,
> +							  struct drm_scanout_buffer *sb)
> +{
> +	struct bochs_device *bochs = to_bochs_device(plane->dev);
> +	struct iosys_map map = IOSYS_MAP_INIT_VADDR_IOMEM(bochs->fb_map);
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
>   static const struct drm_plane_helper_funcs bochs_primary_plane_helper_funcs = {
>   	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
>   	.atomic_check = bochs_primary_plane_helper_atomic_check,
>   	.atomic_update = bochs_primary_plane_helper_atomic_update,
> +	.get_scanout_buffer = bochs_primary_plane_helper_get_scanout_buffer,
>   };
>   
>   static const struct drm_plane_funcs bochs_primary_plane_funcs = {
> 
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494

