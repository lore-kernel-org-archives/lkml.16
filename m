Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BF62505BB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 16:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743697583; cv=none; b=HfUWt3F/a7eSSCod43p12brDlMv7JkfmIGPe0MWelRpW+NlUzQMfWNGYcW+iC2nYEKZS5loMrDNhc9HeE6lSUZuKosdzlGg02jyLpzbE7wgB1S9Wd1LHoe8vlcyDEborIKTDBotpoXamdCHDchz3jQIPETaWE0VeF/oVBkSsit0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743697583; c=relaxed/simple;
	bh=+s8s3iJwvgJFaiQIGmpy8fRqd2r8FfQyKC/ROUIwOkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jS5mVlTnQeaHB0OPb22/oj7gIlf1EwzxiKfRCj0hcKQhMzEjQgN7bgTO7+6sH0mMASYUqD1JPXEfv9qfXe9oBWrx0qEc0/1qZwcMC3/NzFZwtC2MVT2izLdXxfPyc8dv43a+0pinYc9JaR3bIlD2AIzDJuR6toj+PUo7mxynTCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=tgsxo7Lc; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="tgsxo7Lc"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6f6ca9a3425so13620777b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 09:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1743697580; x=1744302380; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gm8Etobzk8cCk6jshrfzA7BBUoXgq8Cf4UsElyUuFB0=;
        b=tgsxo7LcZTdvY+zIoAEc6qjvQDNyrDG+Y1WwmkZIxQ8yzNNgnbZxdl8nP7w4GddLc2
         vCv2YeH4OAGSc7VlvzX8Y36KKdQQhlBeNMM76yw/Lkfd6uiLc6YNog8IoXwxi005mrVm
         6buLxH2oNBplZYHYfiAaKF1dK5L6S64Spzb8tT2X5L+vNaaA9Hk8jXMH7HRvCBsDRLhq
         MNnSqk5qWD+uiLHE7qUFdn6fcfpo15f8sMdQoI6VFUR+WEGAECeSTs8cl9YjSJj0OnwF
         b+gxqZF1MJDMjxo9jJLPXdp/17vbd8YBV1KWORzO5lngPWhfkPckdR1wmW0n7lBMlB/K
         lEbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743697580; x=1744302380;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gm8Etobzk8cCk6jshrfzA7BBUoXgq8Cf4UsElyUuFB0=;
        b=TLaa+GeRfmnJXJDQIQr9A1Oul+ZrD3yNsP9x9hZIMj7EdJdqASc65P9gD4V9Z9C/0V
         L9Lr0kLGX33o4p3uG/baM3WoebT5Rk5wpol9cc+TfVXDjHKz5LEXET/bVpKVOJjXY0Fy
         JbVNuznvFYalM0cMxMof3CftyH2MvwDClQpgSqv4dzVvFYs3zpVggXpn4tDmom01pX+I
         wUXwl1O3C3Frp7eXcUPGsKb9dTFbFHaKuqmWi17SSdTjj96OVXfXWs4R83Hd8MwgNLTq
         aTviVRoymIjghXIk6o4jhu5B/5M+AyC4SNrRCHrOgTqNk5UZKN2YhaktAfltUA7gRrVG
         1Teg==
X-Forwarded-Encrypted: i=1; AJvYcCU4sq6TcDWFr0v9hT1/+q1HJl5nTtRq0s4v6NOd5/1YD+/mLbOASN2fLMsojgmJJ2oVgmQ/zLUoECN4x3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFz2WHLcw1DZKFAdmkWomDPvKgcZbFkWewPEBvAqEoVNY1jPq2
	O9auv7sYgKVNxjtLd5szgvPAsYtxv52/aV2M7N3aS5l4adsEDN1j1qfnOEmFOB9q8yzCchG94MY
	rUC8dmzFL753NMFrUeG3+XDMsdUTSOlUbxoxniQ==
X-Gm-Gg: ASbGncvXQ9LmMCwh+Rw58aF3usy/Orpbiqz8QrRJ5VYmlXiZRr+/K6tivtYV1U5c8vB
	4pSwJf/TCwQQ4qxevNG9tU4bsJ6bJg8I8SrC5FRqz6pG91Rp8tjLvT0Q6vNt1Fzkaan3zzjLzDx
	J2+7KW+bfPcwYTMfmw3w7ao3YUTsnpDR9Ma+28oq4islTRIrjVIM1vzpmD+lD9gXEG83sm
X-Google-Smtp-Source: AGHT+IGs/lOpJlBNxZfkClJkSSGiTQDpBO7ne5t+K8sFSvFVEpfHXiFzI6JjuxfYULF42IuuaAUSHa6+5r5ZRFQKL/0=
X-Received: by 2002:a05:690c:a8b:b0:6fd:4849:62da with SMTP id
 00721157ae682-703e1581140mr850257b3.22.1743697580267; Thu, 03 Apr 2025
 09:26:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ee4989e2-f55e-4d09-8a0d-306b78b9c9d0@stanley.mountain>
In-Reply-To: <ee4989e2-f55e-4d09-8a0d-306b78b9c9d0@stanley.mountain>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 3 Apr 2025 16:25:55 +0000
X-Gm-Features: AQ5f1JpvJpXj_gh69LgHu7W2pAa3-WCUx4V9ie5tB7F6PHPJUleIgDiNR0yj7Fo
Message-ID: <CAPY8ntCCvXObQ_7GNwjqNMB-=1ucy9WsipvptgvPxk3p2R3Ryg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/vc4: release firmware on error paths in vc4_hvs_bind()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Apr 2025 at 13:14, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> There was a bug where we should have called rpi_firmware_put(firmware)
> if devm_clk_get() failed.  Really, it's better and more readable to
> move all the firmware code together so that we can release it one
> time.
>
> Fixes: 2fa4ef5fb943 ("drm/vc4: hvs: Create hw_init function")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks for the respin

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
> v2: Use a cleaner solution
>
>  drivers/gpu/drm/vc4/vc4_hvs.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
> index 4811d794001f..06aedd906d74 100644
> --- a/drivers/gpu/drm/vc4/vc4_hvs.c
> +++ b/drivers/gpu/drm/vc4/vc4_hvs.c
> @@ -1675,6 +1675,17 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
>                 if (!firmware)
>                         return -EPROBE_DEFER;
>
> +               max_rate = rpi_firmware_clk_get_max_rate(firmware,
> +                                                        RPI_FIRMWARE_CORE_CLK_ID);
> +               rpi_firmware_put(firmware);
> +               if (max_rate >= 550000000)
> +                       hvs->vc5_hdmi_enable_hdmi_20 = true;
> +
> +               if (max_rate >= 600000000)
> +                       hvs->vc5_hdmi_enable_4096by2160 = true;
> +
> +               hvs->max_core_rate = max_rate;
> +
>                 hvs->core_clk = devm_clk_get(&pdev->dev,
>                                              (vc4->gen >= VC4_GEN_6_C) ? "core" : NULL);
>                 if (IS_ERR(hvs->core_clk)) {
> @@ -1689,17 +1700,6 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
>                         return PTR_ERR(hvs->disp_clk);
>                 }
>
> -               max_rate = rpi_firmware_clk_get_max_rate(firmware,
> -                                                        RPI_FIRMWARE_CORE_CLK_ID);
> -               rpi_firmware_put(firmware);
> -               if (max_rate >= 550000000)
> -                       hvs->vc5_hdmi_enable_hdmi_20 = true;
> -
> -               if (max_rate >= 600000000)
> -                       hvs->vc5_hdmi_enable_4096by2160 = true;
> -
> -               hvs->max_core_rate = max_rate;
> -
>                 ret = clk_prepare_enable(hvs->core_clk);
>                 if (ret) {
>                         dev_err(&pdev->dev, "Couldn't enable the core clock\n");
> --
> 2.47.2
>
