Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9743A238C0C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750673536; cv=none; b=BFewDSChFpJFhMe9liYV6r+whJ1Im6Fsk8NUUBtbT0NtyzBiRDQ5qCyhVYUlXwwZ9jWaxWEoSBbtBnAdKqt5c/FyySOMtSXFtLoJUqZEZKsbSaEzio6rd8DKdIv2vY+i2dUfDdfLO1hPZBm06UMj0gQkbHV1mH5hK/Qu77Gdkb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750673536; c=relaxed/simple;
	bh=ZyqSs9lshWYc06L8xxKgqIUaV+hzxhbDO1cuH0KIYa4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sBqMq5nWajk6aOJv9OGCUHlUt4oKE45yBze9fMwI0+3EfzPRkQf8YfdAtkcPewl3PpxFX2NJX9qMo11/CmOO07CXCSYwsMMFobPL0WGq6PUVbu/gsEAd84JDNhNhhgJG+k8sRRIyo1PLuLjcER/Ssu55HwR+3FZ344l1otZq+Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L+xW7cbi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L+xW7cbi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750673530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZYLo8wP+y+o3VIS7TqC+HJOW2Pflfi59Nw4T7VkfABc=;
	b=L+xW7cbiEVwgHhnlqtRl7ZD0ifcEaWRFz3ELbvvswsP+BPSOr8AC+nakdSj/+2KRiZBmy6
	f2KzySFER/T7xNxwceo7L9PuSyC0+jgVvfGEWzhXEjPZeaLE1T/CaLCoo/0BSwhPzEdeTy
	TeccD01NzBqnxhOan07whQR1mSS246o=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-aP1WcZcIPHuDp8wcxnSuPA-1; Mon, 23 Jun 2025 06:12:09 -0400
X-MC-Unique: aP1WcZcIPHuDp8wcxnSuPA-1
X-Mimecast-MFC-AGG-ID: aP1WcZcIPHuDp8wcxnSuPA_1750673528
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a578958000so1369221f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 03:12:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750673528; x=1751278328;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYLo8wP+y+o3VIS7TqC+HJOW2Pflfi59Nw4T7VkfABc=;
        b=aczrTxUtIcTQPuPU7195ZKpZTB372fcWPO/uRVE5GYjnLUFtIQ0Ga1zDxR/sgGe+HG
         j+iWGwL7CE92/2DfREw5HVx4aPV3bXp+K2+Jl9EklaH7GDVdhbkf/9IHew7DZYlOs7p1
         2XMV5y0eDykkmqUz2n3iU7GUoMvHfkc6RzVHF7HQokBoJ/m52dLQP9CPW551WN756wfO
         GGGousBRX5wH2yhmt/AZrfCCInwTQOespSRzdtTuatA220rWcf0OYt5pLm7Niuhj0XsN
         VPRRK8UUvjBlgmDYXk3sHlyfZRWRSmRLMT/sMqbvI1W9aJtM3FURI8z+7CS9hRu6TUK4
         esrA==
X-Forwarded-Encrypted: i=1; AJvYcCWwEmB5LmaLhrx6vPuUFD3JQfzfemFykkhQvWelF/I4U+RQ+F2gDQIoQdkXHFMbIXS7oZBSsDQI6chbvSk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzivO/sxeou9vaetXEjPZEPdjTnxYvtZELSacR8ZEhv4y396mCJ
	rVniUZE6EKiODmmKUa9BWzXqAQ0rkOmqoQzhMGloqBfIX7B1eCgFGCWK3aqOg0h5WOw7HgeEoa5
	uvc8z5Fq8MeHk04mfYFcCU1S4nhxIFPa9lmbDhumbLRBmYVfr+l0TOQ0l9cwH5ZR14Q==
X-Gm-Gg: ASbGncvnc3P8X8G7Iu3bdkekgGKf8fB9iPK3118g7jMwrnHcQ7PqDHeB7C5B9iLDqRL
	/P69ZtYxnyTMvK/L42TGC2Tr6dzmTwPJUYw7Jg9aWtNWlFgpikJkHVgsoEOsYCSKZfrd45I5inU
	2/KkbAK3tuaXZ0daiSp6EDIaKyW7pkBjPKxPQossoIsvq75oclSioJuxAzpEuw4e/zyZ1lnZ/i0
	dy+6iVM2JXe7peY6+OV9GpAJw7mTdsX9H5t6VVJsPCsUp8AJ0A4L+0q/+HuBNheWnJD49JIrLxP
	eL8kPzX60pes4h9b68mt1CvOlvDhIYLUqMqlSwj8I8R3+iYmndNL+lfHU0dxjw==
X-Received: by 2002:a5d:64c4:0:b0:3a5:2b75:56cc with SMTP id ffacd0b85a97d-3a6d12a595emr9714559f8f.23.1750673527765;
        Mon, 23 Jun 2025 03:12:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCL4na2uglOQFNEUAANK+zA52+SQuukZvQq//WUH0f114XAeIMlx0mcV3sqHLNJE6Ahlk+RQ==
X-Received: by 2002:a5d:64c4:0:b0:3a5:2b75:56cc with SMTP id ffacd0b85a97d-3a6d12a595emr9714535f8f.23.1750673527348;
        Mon, 23 Jun 2025 03:12:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62? ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d2236452sm8895293f8f.59.2025.06.23.03.12.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 03:12:06 -0700 (PDT)
Message-ID: <acbb1b02-593f-4a46-b4cb-99781d595e33@redhat.com>
Date: Mon, 23 Jun 2025 12:12:05 +0200
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

I just pushed it to drm-misc-next, with the typo in the commit message 
fixed.

Thanks,

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

