Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B60293B7D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751015064; cv=none; b=iNBQrl7l0R+LZQr9sx8SARJF4V6fKGx2MSioWu1Ie86ZdSFmaH3l2VUPD92PUw+AvHky51tOK0GFVpzfADZXIwb/8ggPARXSHPeK/3fQdashCj+gZ1nfHNRAR8tDQ8KmFAONDKvtKkFPTzO8jSjvmLkJvqHMsiySIjCa2dL6v7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751015064; c=relaxed/simple;
	bh=6mBWTKa6P/+vCpBZT8W6CcoZks7wq0ID1jI5oyoVOgE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=c33LR6YlXC35dM79XGJ8nFqgHcmUXjrFfR2yQK29nWIatmOMD4FLynbOu/14aDMq7oy4QJ/oXvnbmxUr5H5Y37/Ysx2LSSv7XECLMbcRVWgFQbOD6SRQ5kPcGwuN2jJb4fU+we1GisN41o1C7YNxNN9UIyjtm6sdQJXmcl4uvKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TO+bQ5Sf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TO+bQ5Sf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751015061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3KmsmsR1zkdWGHUqUCVWxvNYYetoO/L55l7eas6vaQU=;
	b=TO+bQ5Sf4QwOq1GGEtK343EvC7EtuHf3htGAbybTbPUhSEMHxfsBhzLhvvUfE9bDKnVYQk
	tm9MtlOx+XLq1ZY791T531AEhoEzbnMT0fEo7DVeiEY8fyYZhb6sdNm9l0Z6Plcm/4NHrS
	kw0YwtCzSJATxxu87Q2SrVBycKaZ3ko=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-R2gfavTaPKiQcpKrN1f0TQ-1; Fri, 27 Jun 2025 05:04:20 -0400
X-MC-Unique: R2gfavTaPKiQcpKrN1f0TQ-1
X-Mimecast-MFC-AGG-ID: R2gfavTaPKiQcpKrN1f0TQ_1751015059
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4e713e05bso1046974f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 02:04:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751015059; x=1751619859;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3KmsmsR1zkdWGHUqUCVWxvNYYetoO/L55l7eas6vaQU=;
        b=O7YO12hoPI4hR0G/Q0oth9u9W4/PV6eULabwmKIyLuKt5G0yjd8C2gFjFig/YSmEyA
         T8j9DzeRLP4Z3C2l2vg0jkBWIhmYZAGpt2zF8NJNBQWDw5hBcPRSA7UALHTVX1Q2EwEC
         LNao/pWGiYFIdWVHpzUbUeLmc3gFLeY5ufXjJfRqYkW/dDyccJIfBvS7f70E3um+Jsff
         zMeAA3uVwEfMcNDmuY3oetOfEv560gLxMvXAFcqJnr0OJ7SkD2OK0RtYqVd0VNBHL31Z
         w8/CUcoY4K1D0Ic3UA0unBZq2ViC1p4RTQeqScXxzDB0QR/xgMl0sasxAAJGpZS1ZwzY
         j1xA==
X-Forwarded-Encrypted: i=1; AJvYcCU5t6/iOvvDER2Z9yV4E4rLdk3A5kNWuN+X297wyhLk3+MWegSTygZxCDMjD4ATgA5r2gGUU2kjgSHrnWI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcfk0tz9xAakOrMhK9EjErIylXtdWLVuhA8zhz6e+Kjnxj0Fm0
	jIkbRPuJkKAU1xKb496R9OMzDtUZWfcdHGdiD264dxm0/q5d4dXLtCkVIJdN6ZVrLuPIvblFk9o
	mcRPDDr3iznfZ18N8L7b2l6okHDYqHxWBg5igk2lYzzbkHCOY0jgRmmehz/4PjEm2VA==
X-Gm-Gg: ASbGnctlm2n2X8YqPvOSmqHNvMQwMdIkztKG5KadCLIA7jfE/D3OfA0Cl8eF0icaiVM
	0Zn3hnemBhMaIGmz4M6xY7907Jo1kSQiQa0C/pah/GAbuL0Ks5oGR7WczNjHAgyMaNcVFKSUhv6
	uYvjRlWr1xA3Hu6/KZOlf3Sc5wFZmfjSgug1aJHadym2a9F6HlsHokmnIXC5qu2VKlLqCXNfC0M
	n8gQ8vzOmSYyn33MQd7t0469jDu+gNt1yXZ/JfCdSXOMRvhYzDRbhkrr9WIx6Xk6+7rMEzQyZQs
	Ohch8A5gYR+kqlN8k2PINu1EMzAZ3fjmCiQ5pAuFbo7Ei2A5rYivhoPsmljco8524jTYDtp1bIu
	VWvzB
X-Received: by 2002:a05:6000:23c3:b0:3a4:c8c1:aed8 with SMTP id ffacd0b85a97d-3a8ff9ea18bmr1806169f8f.39.1751015058653;
        Fri, 27 Jun 2025 02:04:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvtbVNhtoT88g8GCP3xDLM03Xs+KFxLUDU0up7wRpfFhdOnPdXOQT+WY57/deJVibdF9AU1g==
X-Received: by 2002:a05:6000:23c3:b0:3a4:c8c1:aed8 with SMTP id ffacd0b85a97d-3a8ff9ea18bmr1806130f8f.39.1751015058205;
        Fri, 27 Jun 2025 02:04:18 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fb20esm2169081f8f.36.2025.06.27.02.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:04:17 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Anusha
 Srivatsa <asrivats@redhat.com>, Francesco Dolcini <francesco@dolcini.it>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Maxime
 Ripard <mripard@kernel.org>
Subject: Re: [PATCH v2 1/5] drm/mipi-dsi: Add dev_is_mipi_dsi function
In-Reply-To: <20250626-drm-panel-simple-fixes-v2-1-5afcaa608bdc@kernel.org>
References: <20250626-drm-panel-simple-fixes-v2-0-5afcaa608bdc@kernel.org>
 <20250626-drm-panel-simple-fixes-v2-1-5afcaa608bdc@kernel.org>
Date: Fri, 27 Jun 2025 11:04:16 +0200
Message-ID: <87cyapd08f.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Maxime Ripard <mripard@kernel.org> writes:

Hello Maxime,

> This will be especially useful for generic panels (like panel-simple)
> which can take different code path depending on if they are MIPI-DSI
> devices or platform devices.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 3 ++-
>  include/drm/drm_mipi_dsi.h     | 3 +++
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
> index e5184a0c24651756ee0b1eb27d94083d63eb35a7..21fd647f8ce1a6a862e2f8fb5320e701f26f614f 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -89,16 +89,17 @@ static const struct dev_pm_ops mipi_dsi_device_pm_ops = {
>  	.thaw = pm_generic_thaw,
>  	.poweroff = pm_generic_poweroff,
>  	.restore = pm_generic_restore,
>  };
>  
> -static const struct bus_type mipi_dsi_bus_type = {
> +const struct bus_type mipi_dsi_bus_type = {
>  	.name = "mipi-dsi",
>  	.match = mipi_dsi_device_match,
>  	.uevent = mipi_dsi_uevent,
>  	.pm = &mipi_dsi_device_pm_ops,
>  };
> +EXPORT_SYMBOL_GPL(mipi_dsi_bus_type);
>  
>  /**
>   * of_find_mipi_dsi_device_by_node() - find the MIPI DSI device matching a
>   *    device tree node
>   * @np: device tree node
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index b37860f4a895c25ef8ba1c5b3f44827ef53aa100..6d2c08e8110151a97620389197f1ef79c058329d 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -221,10 +221,13 @@ struct mipi_dsi_multi_context {
>  
>  #define MIPI_DSI_MODULE_PREFIX "mipi-dsi:"
>  
>  #define to_mipi_dsi_device(__dev)	container_of_const(__dev, struct mipi_dsi_device, dev)
>  
> +extern const struct bus_type mipi_dsi_bus_type;
> +#define dev_is_mipi_dsi(dev)	((dev)->bus == &mipi_dsi_bus_type)
> +

Usually I prefer to have static inline functions instead of macros to have
type checking. I see that this header has a mix of both, so I don't have a
strong opinion on what to use in this case.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

