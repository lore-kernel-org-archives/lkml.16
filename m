Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882901E9B20
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 11:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743593723; cv=none; b=hhQSuSnIpDApcGJUXOllFCgM/rI0/uxBhfuLOwcQWSEd/rtuihtr6U9EBOr1y03qUJZblGQc/PmBxOdxTietV52rpsNPZxEzFnfzMUiqiCA0sUV0qLiIDB8gmzKdAzFitCf59RzrIkbEdwxEhIMKMwGWYoS9QGTCiYHGRiMNmmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743593723; c=relaxed/simple;
	bh=CMMMlPjZNL2MskP5JZ2m0ywYhfJzY2Vi/GF+ouYfsUQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O30bTs8/UVU5Ss/9reyKhfxzLargrLcp8OBtBg5u814lHvU3JLczyEb7RnC9gKppAaaLqpQb1BNAEMOF4JCoKdIh2tU3BJpjGiftV11UH3oTACoHZWYhg2Hy7Psv0Eh5XKUzxNqwRLwAGnPOhm/OW6nwxeW9+59eyLymuKF/IQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=MEIVzlYi; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="MEIVzlYi"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6fead015247so55735297b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 04:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1743593719; x=1744198519; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s1/KlpYm3UM4GjlGHXNbUdwP3FIBF3TOQzxxk/M8qKo=;
        b=MEIVzlYiB5Ftp78/K6i4LEEXLcfhY9MZ7/YUNtkBsB9E7sy1bxuW+Um/TuqRWXVtWH
         Lk6WU2AgUQ9MWocnIaztPZ5fhsVwcS4/Ia1cMJ3HPFG0IQQr/QmNMgFIp833KON2tc04
         m2wRMZLXpqVWDe5Pbr0FqIwhjV5JVzXksZkrE8Lh0jvRfB/kFsxqW4cuUce4kf9b58EH
         6DS0Eyuczwys+mc0Qf8s1P4JHIvvYcYuW2cQevL4RC95Qc23YPX6gLB4/K+kWB9P6uqR
         t9yubM6FSI8Xd3vfhkOUH34WZswdkucLuF7J1vAJnIgFkjFpA/D65VI69K0tiCLy0z/f
         VQvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743593719; x=1744198519;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s1/KlpYm3UM4GjlGHXNbUdwP3FIBF3TOQzxxk/M8qKo=;
        b=O3Ts/Rf7l0Zm4yjVNhhiEc1H35QZHdD+nCZEDkMaW/+ynehSITVHtDoovRW4en+fAN
         WnZcfL2Mst79D8BA0qBBfW+Qdj2Y9DV++coV81SAmyX0x13QH9Hd8Ym37dlXr4Wov+9k
         NJtEkn3w9b2FWK9YIkwBIuywOmAf6nX72+GT1aR17R9JL6V3IPFD3XRnjqDea71b7wRH
         NpUc/r4xCWnhgF5pwaskJjbPZgND26E3jRWgmukXYGCUnRscdGkemAkxJhiptIwwJ4tO
         0gKT9cK3J0iiMyDQaJtWb7HugszZhLofUoFWNLkwnxI/EA32B8snQUJXBAUD9wtxMhiA
         YWUw==
X-Forwarded-Encrypted: i=1; AJvYcCWJBh2FwTi8WsbbRdD4cTsk+TJ9sj3N4yr2B4P5HaHHBUoB/eXRooGk4ckTiHMbJlfBg6wXTs11Aahemnw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZPMD7134AaWlGKVKSlV6BlPeq3L4BfU5TUjAR9ymXp8aJ2Roy
	FQ3Ekgs+oAzb/XERsPbXuKnorMoxRenzneM247rH+tS9S+5B5mT3/NlZdxmkyahU477FTHwpfBA
	6XMnjFjhutkHMZSHxjkTud9s0vSbm7QA+iiZi7g==
X-Gm-Gg: ASbGncvBon2icwArz7LSbhhwd2bRFvyMVNUVrC+59lRP6IJkJwFvNN6Z0nWACgcO4M5
	44JtTQDq5+XwgktVwdVpXnv7Ky2gqGaYMlLpOWdp6fDZnFqnySNF2Ef7HxSA4YpsrBM4THoOTEB
	wCS/QhiBhWd02DxEeSQgNIMhOUL62Otbt4vflAOHGGIAK+cMdCQumBRgM13nq+LwErknLM
X-Google-Smtp-Source: AGHT+IGr8Yxz3zfQtp5zVjqj96xcJ11TwxaJBj5hp4ypVaFwNYzSnui2oiuDQ1M/uFDaiwTUhmCsnNbBU6oKxM6+wWo=
X-Received: by 2002:a05:690c:4d82:b0:6fb:1f78:d9ee with SMTP id
 00721157ae682-702571161cfmr249550377b3.15.1743593719430; Wed, 02 Apr 2025
 04:35:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <8305d098-bd28-45e6-acda-29e629dfccc9@stanley.mountain>
In-Reply-To: <8305d098-bd28-45e6-acda-29e629dfccc9@stanley.mountain>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 2 Apr 2025 11:34:58 +0000
X-Gm-Features: AQ5f1JrgSH9_HopXXMS8ZOVaiXusrf2OzR6y0mAxNfEdCRKuLRfnxeiLZ3pZEkA
Message-ID: <CAPY8ntCtAdWg1yN+DgxRe3np4Nu3aDUrrdqe4Q9WeqJMtbrrAg@mail.gmail.com>
Subject: Re: [PATCH] drm/vc4: release firmware on error paths in vc4_hvs_bind()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan

On Wed, 2 Apr 2025 at 12:00, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> Call rpi_firmware_put() on these two error paths before returning.

Ack that there is an issue here, but it seems easier to me to move the block

        max_rate = rpi_firmware_clk_get_max_rate(firmware,
                             RPI_FIRMWARE_CORE_CLK_ID);
        rpi_firmware_put(firmware);
        if (max_rate >= 550000000)
            hvs->vc5_hdmi_enable_hdmi_20 = true;

        if (max_rate >= 600000000)
            hvs->vc5_hdmi_enable_4096by2160 = true;

        hvs->max_core_rate = max_rate;

to before we make the devm_clk_get calls. It has no dependencies on
having retrieved the clocks, and hopefully means we don't get the same
type of leaks creeping back in in future.

Thanks
  Dave

> Fixes: 2fa4ef5fb943 ("drm/vc4: hvs: Create hw_init function")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/vc4/vc4_hvs.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
> index 4811d794001f..41e9d0aff757 100644
> --- a/drivers/gpu/drm/vc4/vc4_hvs.c
> +++ b/drivers/gpu/drm/vc4/vc4_hvs.c
> @@ -1678,6 +1678,7 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
>                 hvs->core_clk = devm_clk_get(&pdev->dev,
>                                              (vc4->gen >= VC4_GEN_6_C) ? "core" : NULL);
>                 if (IS_ERR(hvs->core_clk)) {
> +                       rpi_firmware_put(firmware);
>                         dev_err(&pdev->dev, "Couldn't get core clock\n");
>                         return PTR_ERR(hvs->core_clk);
>                 }
> @@ -1685,6 +1686,7 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
>                 hvs->disp_clk = devm_clk_get(&pdev->dev,
>                                              (vc4->gen >= VC4_GEN_6_C) ? "disp" : NULL);
>                 if (IS_ERR(hvs->disp_clk)) {
> +                       rpi_firmware_put(firmware);
>                         dev_err(&pdev->dev, "Couldn't get disp clock\n");
>                         return PTR_ERR(hvs->disp_clk);
>                 }
> --
> 2.47.2
>
