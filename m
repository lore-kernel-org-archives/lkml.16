Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363642528EB
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739200625; cv=none; b=f1j9ls1Gd9yhJdXTtxzZstQ44GtgTPtMr8RC54tfADODGQGKKuIY3L6+L4Nyo0C/3aes24gnbVnKxgZlfKWi1Bgs10h5X6AJ3TrwqpUvdE1ZNDPmvef8/e/2U3UknCVsHSKNDE0cdrqBDOzCYIuOJBx5glmG47SdFNR0ld2qZMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739200625; c=relaxed/simple;
	bh=npeySrQDIdbjEdWZVestUdgkXFxlJePjegTD/zD7+4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rp3TnYMNR78KNCvtnoZGMnfoSt8YR7pdt+rSYCWKCBRs71vvPIhtdzBt6VyDr2xJday1gi9xgkq2bseoeMFLcPyKmoPM47k7WtogMLkVgR8VTXHPI8YJb3iwSQRb37SCsl3wiF+WxpQdO17OfDkTo/MfETsy5/nDV2DJoDIwyM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RKPNDebW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RKPNDebW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8425C4CEEC
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739200624;
	bh=npeySrQDIdbjEdWZVestUdgkXFxlJePjegTD/zD7+4o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RKPNDebWhhpwvKqjqW0ZGYy2i9RFGbmOiJxfDtYaeFkAZhCdmYg4IfVHBPM3PYq2A
	 Pv8XhLTurgzqwzqS8XuuyX0Ud63vM8qkbGB+NOfa1R6rbto4KSr3hvcHQ4ulGmZU/b
	 9VpBP9YLJhH1cUj+GsIVq07/hnAUiBN8Pxpn0Y5u0LXZ8HvG6R9ln7wMOjtlihTrgz
	 EVVw7wo/b2j7wpVcTYd7V8vyf/Z6+6ZXsJp+04PxeRxXsSqMgAhFEXad9D4TLdWd9f
	 pWvQi9qPjagGtNXq+jnbaopIdlMo9xapllwlInZVjut2DZznR3H3MHQpODZtmx1clW
	 PqQfVZe3uJCrw==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6f9cc6fefa8so14427557b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:17:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUhYBrjqfjTY79kBeHtgMkli1dkucLELSKS5fBMRpmU8s1jq7vAWJnRCjTcg/EKvxGUhXga1VFjUWF1Jd8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwO5HvPtLB4RsPpuQnE2e0hDRT21x8HF0Wbp1PlKb/jJVw/zsDH
	IEOKZ0Zu3DdQbzOH383YVwlW0q4noxH7ten31cEA6Omuniiul4+pDNO0JMgxnXFyBBy2huicdDV
	3CHzGoO4r4IOakCyY0dv3lpV/NAnU7MuFOGfLUg==
X-Google-Smtp-Source: AGHT+IEuxtsc0xzO9mi3+kRlVNXktUIEV7jpqquejdLvRYC7jrhyqriJbq41PImEwZesVxGBItLG1KHJKThIAsdcER4=
X-Received: by 2002:a05:690c:4513:b0:6f7:598d:34a3 with SMTP id
 00721157ae682-6f9b2349b17mr126196697b3.0.1739200624069; Mon, 10 Feb 2025
 07:17:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250128065645.27140-1-oushixiong1025@163.com>
In-Reply-To: <20250128065645.27140-1-oushixiong1025@163.com>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 10 Feb 2025 16:16:53 +0100
X-Gmail-Original-Message-ID: <CAN6tsi4xwkfZgmJimDvoWUNY0qXJDAhzfXsKG5zcdGN_yv7pZg@mail.gmail.com>
X-Gm-Features: AWEUYZmoZttsZcq5UnGDn813LzZbaiRa_k-lQdQRVeYMxL2zrCT83V22t3LHnhc
Message-ID: <CAN6tsi4xwkfZgmJimDvoWUNY0qXJDAhzfXsKG5zcdGN_yv7pZg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: analogix_dp: Use devm_platform_ioremap_resource()
To: oushixiong1025@163.com
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Shixiong Ou <oushixiong@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2025 at 7:57=E2=80=AFAM <oushixiong1025@163.com> wrote:
>
> From: Shixiong Ou <oushixiong@kylinos.cn>
>
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_ioremap_resource().
>
> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index bfa88409a7ff..f6e4bdc05ba0 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1553,7 +1553,6 @@ analogix_dp_probe(struct device *dev, struct analog=
ix_dp_plat_data *plat_data)
>  {
>         struct platform_device *pdev =3D to_platform_device(dev);
>         struct analogix_dp_device *dp;
> -       struct resource *res;
>         unsigned int irq_flags;
>         int ret;
>
> @@ -1605,9 +1604,7 @@ analogix_dp_probe(struct device *dev, struct analog=
ix_dp_plat_data *plat_data)
>                 return ERR_CAST(dp->clock);
>         }
>
> -       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -
> -       dp->reg_base =3D devm_ioremap_resource(&pdev->dev, res);
> +       dp->reg_base =3D devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(dp->reg_base)) {
>                 ret =3D PTR_ERR(dp->reg_base);
>                 goto err_disable_clk;
> --
> 2.43.0
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
