Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6098A13D24D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 13:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749128578; cv=none; b=Ph26q0rXWD/Kxbdo+CG6mjxrFrFXMmk4wQf6nOGhumG+1aaZScsZRNAqK7CEtrSk2HPABmaNEvv3zTXai9i/DDlS9EL2yR6cV6BjI+p47QB+El1khGAbzfl4eECPCQMbRazEWDYaMlecpjNfHD0pG75ZG2C1gXvK7sq3rdrqpEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749128578; c=relaxed/simple;
	bh=5de8RG8f3o6sWoFM1mI4X9Fp3LN5IoyHomEe0eRNiZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GR+cspHAqr/DdBKMOIqnEzreoy26T2zmVBFXOX63v6/ngSAnPu433jl2t3ZMNqV/Zqa29hr3aLXs/qrNqTUHzv3fPzPIodh4oPmbmWbtMTFGtekQ+lqiZtNMb4hLMf1GNDeyGiltP646nhSpjsmhVemBTZ2VAppZChhYNNWde2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bp6Up4BR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bp6Up4BR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749128574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xg498BWU6yCD+3EXYlmoQ452Swm7wT/w2qqavlOm8pU=;
	b=bp6Up4BRUvC5+8BMszyYS4YNhn30Pd5pGW+qgnlQUE8V/gFzWuUfU1O5uqVgGvb8ZPROgd
	TgXubv1i9iSrbaaJi0472jNCABPo2GfjaNaRwq75y6OJbzjM8AKSI2QMuSbKy9OpHKCZmJ
	w8GU1/Gn47yWejNFuUytb2BthZd29+c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-_2DsAPpYN1mqERet4tER8g-1; Thu, 05 Jun 2025 09:02:51 -0400
X-MC-Unique: _2DsAPpYN1mqERet4tER8g-1
X-Mimecast-MFC-AGG-ID: _2DsAPpYN1mqERet4tER8g_1749128569
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43eea5a5d80so4369365e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 06:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749128569; x=1749733369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xg498BWU6yCD+3EXYlmoQ452Swm7wT/w2qqavlOm8pU=;
        b=FgzRdsJAnMCbYqWmZHdzOtCKGzEBf+QvNmorvFI1wKtd9+fn8wTeZXdjAzMp8NFTHA
         cUHs9zVfToFARp89sWmpjspDEj6rBdes1qrFFVx1Fo+TadBbO3HAHbnBH5PKRsdSQxQ/
         /Rxs0iQMY2EW2jfN2EY+UlehBbxPvvNAulBgxakWjmnTZAYgNQksezpe0EjLtoAMvyVP
         l1kpaK53LrLYfzVERdGpEjbkN74hfw0+p9i7z65Tko/qmFQkgyR5SHF/cDBEy6Mu9lqi
         OHX6kf+L+CXAf/6wKjw746EyKXZrbAdLmMbK3sEERBxII+DWriuKdLfgqZxUyQwhlRa2
         kDgw==
X-Forwarded-Encrypted: i=1; AJvYcCUpCtCgpeAdi6vxQATuGQoYpIy8fw9PVzjGXvhuzm2LL76FueKUWs8it8yzB/A4lN6LZpM6MnnJ1GvLuXY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqxnLWclZbAsaFvsCY6jAhknNKtiGuzhAS2ZLdMD/SUELbHJcF
	RkgQX4g5QWwOrC0xVB2y1MMJ2wvceHNPoRx13N8pUANYsO/90/DkWGwle8yV1GYp34KeMVbyeIh
	kd396UxdJER3nDDBWLXjbuIeiRAiK8DbMHyZpfiHP2fEYiEUEWsBfTTT00XfuvaJzIA==
X-Gm-Gg: ASbGncsql+Ft/dOr8hG6rEFdwqAwzFC6O8MHrjQ/Hr/TmbzUrbIUfyjAtwN2Za0+1Qm
	tuE/doqTUoxvGeDAdFZZ8HEemIoyUdd4ppmHK6fM9T6tYsS5qp8CV542MdZf4MAA9MtBmcMpHEp
	XeBhlYOw+N8Nmb88sVBYGuiYXXCmWvAc9LABm+CvOAk+J+uYOLCmX3KW7Q7IMGUwlD2IEscVZal
	QqHaxMwIdI8KnZhTZ/YKw8W95CN50qYpSV2sQ4Ykyh0bUT0xP3dWmTYfc6lLXTJVoE6ry75ayQW
	aQy6Z87FHJweNR/f2/Kanx4tI0/cj7osnqJ1BJGbGV23HmhtNKs=
X-Received: by 2002:a05:6000:2204:b0:3a1:f564:cd9d with SMTP id ffacd0b85a97d-3a51d961c1fmr5842946f8f.36.1749128569243;
        Thu, 05 Jun 2025 06:02:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLOWcpTWTCDyXBY4w2ZvbieYKYJr5NwdKMUi24PSZUQgwCDHfdsFZ1q9E35GmfdHu/7yFH7g==
X-Received: by 2002:a05:6000:2204:b0:3a1:f564:cd9d with SMTP id ffacd0b85a97d-3a51d961c1fmr5842816f8f.36.1749128568020;
        Thu, 05 Jun 2025 06:02:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00a13fasm24830979f8f.98.2025.06.05.06.02.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 06:02:47 -0700 (PDT)
Message-ID: <f1927c1b-95b7-4d98-9d95-fcd52bd06766@redhat.com>
Date: Thu, 5 Jun 2025 15:02:46 +0200
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

I've just pushed it to drm-misc-next.

Thanks for your contribution.

-- 

Jocelyn

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

