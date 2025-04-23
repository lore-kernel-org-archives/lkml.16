Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B68A26B09F
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 18:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745433369; cv=none; b=s2EUPG27sozFbpkhZEdT0RqgvDh/RwLCP9IA4Zl1JWf8vJH09LWGdGCRWvATiHnmyNdN8apFJwmbJ7nkt4WC0ApZ0FnHEx862fjqYq8SRN7TZv1Z+b/WuOdq1HDouoQOJX9bYpIWYS126g6AEC/1UU0sUub3M+wX4YSjmfhTO4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745433369; c=relaxed/simple;
	bh=clejbQ4VzB8jGnNyEiAAp7gBsdDMipc8xfdNdEV/f6o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EPRZBSwPaDAPcMkff6+jhhM8YPuILCGcipQoQy93+jD4mbW6OnT3ndPo2UM/Q3A2eai8h2YIkbxoXP5fmFOa3RVkWa7oMAonV2z3YKEK4RjLFgfIQHLTWbZroan49SK2DUSX7XGXY/ERi8iLyM+oFcWf1SbQrG2bc8wdKGBV9Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D40aiJj7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D40aiJj7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745433366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DZNe45ridILK2CdOVqF5AQIHmwtE4BwCZt3v56x2yIY=;
	b=D40aiJj7VkjI7cD+U+3ExIirW2Nz0eQB2QVnjcXzFVmg7kRk0mKC6b/UoDdRCAA42VXcPx
	KXvZQ75EBadyAVD606urG5ZL/NU3srcANoVSB7jXHXPvGAvHMy4oKLY9UjNSfJa33RDB4p
	YPu2TEoGuY1XfRqLbHVLef4FhUhbFO4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-687-oKBTuahxMbuwoQpKb2Kc9g-1; Wed, 23 Apr 2025 14:36:04 -0400
X-MC-Unique: oKBTuahxMbuwoQpKb2Kc9g-1
X-Mimecast-MFC-AGG-ID: oKBTuahxMbuwoQpKb2Kc9g_1745433363
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43cf44b66f7so765605e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:36:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745433363; x=1746038163;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DZNe45ridILK2CdOVqF5AQIHmwtE4BwCZt3v56x2yIY=;
        b=jyJ5RaRLznZl1NuIObojJVFXriuSz8WCl9iCIaVQ/b7k86Hj5yYsvdA6h9OvuoIOeG
         GPT+O3PB4piIneUhLzxPsxw9m99GEZBIWOBmjpleOwZCErm2QWMOEx/sUCkSleV9Gje1
         6ywjzsUvGRfnqSoyKEonVozeGtG1DaIisYpDFZm2mIsEpYDM3Ioul21ArNGvxgkjLZoG
         LMT5yp4eByfhLZZfWTSUhsAToPs1SqJZNjQ+dm1rweW3ZPT5RwxnT9G4t7WKKieGyIin
         ahmIkragMVRecKZeevebBVC+Gbw8LvOBYb/Q2rdekmV6atFZAeNdp0dYhvVEqgMpFXka
         3QTg==
X-Forwarded-Encrypted: i=1; AJvYcCVxqduydgGLvww1qZT9WR1yEDU2f0uMfaw3D2cdPQs3hi28G5SW0eyzSGPs6pk0p9v6gRnm5p9UmAbp2z4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwR+ploKW6MZnLAde4OgoTRq57DvLYU+8QBUuhg9xyepBvGCR9h
	E3EfLuP4KLIME5M9ZsKvQdtTNW6/ANh4pIr9w6hnAUrhe9/RLIHcEeeUA9nrUeodApeN3RItN1W
	W+yFbXzSHNBK160eTxfiiNRDyYvxjePhGy5F6pTGTkasCbEmCRie0iR7ZP2xVRg==
X-Gm-Gg: ASbGnctTwyNMsZz6AkTjKVRl9tx/TnZjoL/bGZvESCUplOFPNljOfgVAPV6sKiRgVrk
	XYAuQP6ETc8/Wox9TJKTrpvrPOP80wpF0TphBRA5Lg8ryCtw7okNaXaEaBSAS+dnWkecSjCPIkQ
	sAs7HoRqaun+3F+HlcFqXebfJDQSP65ot1poAyX6qU+LplLgNM8lDpUgLIws7qIlbQ2CnswzpDD
	XS3dMWvhascHLMDV4PyKTMuLI5L8TCcTKLyfMxJj2Dt3AFIxTGr7U4jBTPKTndGIQ70j3nDq7KX
	izom8wk/nureBO5UTIrRlARJvsaWZfDUrMdLLCJPTzEQMx+v+Vgt3/X4L6FnlGsPLMb99A==
X-Received: by 2002:a5d:648d:0:b0:39c:142c:e889 with SMTP id ffacd0b85a97d-3a06c4154f3mr579131f8f.27.1745433363545;
        Wed, 23 Apr 2025 11:36:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEscSOJRnvzbjZw78Ojyv2Eu8GFNx3irhr5ooUj/zzBGPxiIgsSfqlwkRsklP5kZCHqZ8vATw==
X-Received: by 2002:a5d:648d:0:b0:39c:142c:e889 with SMTP id ffacd0b85a97d-3a06c4154f3mr579105f8f.27.1745433363150;
        Wed, 23 Apr 2025 11:36:03 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa5a2300sm19349612f8f.101.2025.04.23.11.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 11:36:02 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Marcus Folkesson
 <marcus.folkesson@gmail.com>, Thomas Zimmermann <tzimmrmann@suse.de>
Subject: Re: [PATCH v5 2/3] drm/st7571-i2c: add support for Sitronix ST7571
 LCD controller
In-Reply-To: <20250423-st7571-v5-2-a283b752ad39@gmail.com>
References: <20250423-st7571-v5-0-a283b752ad39@gmail.com>
 <20250423-st7571-v5-2-a283b752ad39@gmail.com>
Date: Wed, 23 Apr 2025 20:36:01 +0200
Message-ID: <87v7quafou.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Marcus Folkesson <marcus.folkesson@gmail.com> writes:

Hello Marcus,

I tried to apply your patches to drm-misc and found some issues, so I will
have to ask you to do a final re-spin. Sorry about that...

> Sitronix ST7571 is a 4bit gray scale dot matrix LCD controller.
> The controller has a SPI, I2C and 8bit parallel interface, this
> driver is for the I2C interface only.
>
> Reviewed-by: Thomas Zimmermann <tzimmrmann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  drivers/gpu/drm/tiny/Kconfig      |   11 +
>  drivers/gpu/drm/tiny/Makefile     |    1 +
>  drivers/gpu/drm/tiny/st7571-i2c.c | 1007 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 1019 insertions(+)
>
> diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
> index 94cbdb1337c07f1628a33599a7130369b9d59d98..e4a55482e3bcd3f6851df1d322a14cbe1f96adfb 100644
> --- a/drivers/gpu/drm/tiny/Kconfig
> +++ b/drivers/gpu/drm/tiny/Kconfig
> @@ -232,6 +232,17 @@ config TINYDRM_ST7586
>  
>  	  If M is selected the module will be called st7586.
>  
> +config DRM_ST7571_I2C
> +	tristate "DRM support for Sitronix ST7571 display panels (I2C)"
> +	depends on DRM && I2C && MMU
> +	select DRM_GEM_SHMEM_HELPER
> +	select DRM_KMS_HELPER
> +	select REGMAP_I2C
> +	help
> +	  DRM driver for Sitronix ST7571 panels controlled over I2C.
> +
> +	  if M is selected the module will be called st7571-i2c.
> +

checkpatch here complains about:

WARNING: please write a help paragraph that fully describes the config symbol with at least 4 lines
#144: FILE: drivers/gpu/drm/tiny/Kconfig:215:                                                            
+config DRM_ST7571_I2C
+       tristate "DRM support for Sitronix ST7571 display panels (I2C)"                                  
+       depends on DRM && I2C && MMU                                                                     
+       select DRM_GEM_SHMEM_HELPER                                                                      
+       select DRM_KMS_HELPER                                                                                                                                                                                      
+       select REGMAP_I2C
+       help                                                                                             
+         DRM driver for Sitronix ST7571 panels controlled over I2C.                                     

but honestly I think is just silly and your explanation is good enough so
you could ignore it if you want.

>  config TINYDRM_ST7735R
>  	tristate "DRM support for Sitronix ST7715R/ST7735R display panels"
>  	depends on DRM && SPI
> diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
> index 60816d2eb4ff93b87228ed8eadd60a0a33a1144b..eab7568c92c880cfdf7c2f0b9c4bfac4685dbe95 100644
> --- a/drivers/gpu/drm/tiny/Makefile
> +++ b/drivers/gpu/drm/tiny/Makefile
> @@ -7,6 +7,7 @@ obj-$(CONFIG_DRM_GM12U320)		+= gm12u320.o
>  obj-$(CONFIG_DRM_OFDRM)			+= ofdrm.o
>  obj-$(CONFIG_DRM_PANEL_MIPI_DBI)	+= panel-mipi-dbi.o
>  obj-$(CONFIG_DRM_SIMPLEDRM)		+= simpledrm.o
> +obj-$(CONFIG_DRM_ST7571_I2C)		+= st7571-i2c.o

this chunk doesn't apply on top of the drm-misc/drm-next branch [1] due
the simpledrm driver being moved out of the tiny directory. Please do a
rebase on top of that branch when posting a v6.

[1]: https://gitlab.freedesktop.org/drm/misc/kernel/-/tree/drm-misc-next

[...]

> +++ b/drivers/gpu/drm/tiny/st7571-i2c.c

Please run ./scripts/checkpatch.pl --strict -f -- drivers/gpu/drm/tiny/st7571-i2c.c
since checkpatch complains about some issues. Other than some style nits, it has some
good points IMO. In particular:

[...]

> +
> +static int st7571_fb_update_rect_grayscale(struct drm_framebuffer *fb, struct drm_rect *rect)
> +{
> +	struct st7571_device *st7571 = drm_to_st7571(fb->dev);
> +	uint32_t format = fb->format->format;

CHECK: Prefer kernel type 'u32' over 'uint32_t'                                                          
#523: FILE: drivers/gpu/drm/tiny/st7571-i2c.c:348:
+       uint32_t format = fb->format->format;

[...]

> +
> +static const uint64_t st7571_primary_plane_fmtmods[] = {
> +	DRM_FORMAT_MOD_LINEAR,
> +	DRM_FORMAT_MOD_INVALID
> +};

CHECK: Prefer kernel type 'u64' over 'uint64_t'                                                          
#611: FILE: drivers/gpu/drm/tiny/st7571-i2c.c:436:                                                       
+static const uint64_t st7571_primary_plane_fmtmods[] = {

[...]

> +static void st7571_reset(struct st7571_device *st7571)
> +{
> +	gpiod_set_value_cansleep(st7571->reset, 1);
> +	udelay(20);

CHECK: usleep_range is preferred over udelay; see function description of usleep_range() and udelay().
#993: FILE: drivers/gpu/drm/tiny/st7571-i2c.c:818:                                                       
+       udelay(20);

Specially since this is not in atomic context AFAIK. The Delay and sleep
mechanisms [2] doc has a good explanation about the different functions
provided by the Linux kernel for this.

Feel free to keep my R-B tag if you decide that some of the checkpatch
suggestions are applicable. The most important bit for me is the rebase,
to allow your patch to be cleanly applied on the drm-misc-next branch.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

