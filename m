Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D6F277015
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 13:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744983506; cv=none; b=Hol1P3yRhhs4lfC+aHiuGBUgybDVO1mm0iRABP5LNeJaPsLNf6E0XN0gnX2EQFFhS/FaXMwdk6DQ9oLtK1amqwQnPtbHaPMnxqu/JyruUNUyYmpW+Bxmo2zLlfoofX/DsVDaVD+VxYQtO18cjBP2JFPAvJRu6llIBaGFds4FZZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744983506; c=relaxed/simple;
	bh=uNPAmOkyXrXKI21dJPKiHtF/AiAGws8IUUtspmfI4uQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:In-Reply-To:
	 From:Content-Type; b=ZEdZJTCZyEzepW9vP/oucbFXS1Wx9y8/dXhoKiPhMT34h9hP6iDsEwLvCeiGFCW02i53+PzlBweaGttcFhUAU0aYkEJcq/ZfI2MfPCh4nYR5kMBZXHuds51vB3yspLEMu4GX/kp++wSPhanNyySBRDQR9ugPUBLDjKkZnOQDo84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VzWaieuv; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VzWaieuv"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22c50beb0d5so2184445ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 06:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744983504; x=1745588304; darn=vger.kernel.org;
        h=content-transfer-encoding:from:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gPTcC0Qo0IfweDpTBHJVf2QO3zsuTW+Lm6WypoA0fRY=;
        b=VzWaieuv2030yKsGJc117WvqCL/Y7vrJRNl3uytXskZO0QnXUJ8wpij1qY6BD8zTup
         xAmxFOmFI/sfjJtUfZURZlq4Ix9LR6Bnh0Hzn0ONpXJ7IP/DzZG2ggZt6C0HOdkPSfhD
         6xPrUiy8V9w0RjBekgXMNqsSbubKm06YWA+y07J9g5crhahwt1oYHTeEo6crHtjsBbWz
         TW3W+Z0XMcOBQB9BG3+OWXhv+ugvQDYQPxCVhsGGUzKHSTfE00jHat4BN6OoaR8ZmHEw
         1OA6skv4o64fUEX3OaG94HPQAQkc5wkwYR7sT+n6QqKzHiKinniZkQZE3g5cKn/RrXxJ
         Vreg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744983504; x=1745588304;
        h=content-transfer-encoding:from:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gPTcC0Qo0IfweDpTBHJVf2QO3zsuTW+Lm6WypoA0fRY=;
        b=U3+eVHezwkS4g5r6l5OG8v9obIPoI+HTdrNWUNmHZx4ebh7hJC3VS0gcv/BSOGquyi
         VI/qI3lyRDhIAKbvRQeo5t/gVAYfLIUWyr1Hp69oofc0Py47593BqOj1BQVPjHEMUD8x
         MCGL5ti0GtD2avw5+V4cHAqo0Y6Gua0EsDyFlyXgh1Nq09ivirS794WCCS0Y5CuArvZC
         iT1U2lX45D/baWR/M1yliWHp5tQjj5ety57p1TbYIRBz6y6VU5pr6dHdg7StJMI1SvOe
         6yuDEDSieyYIgloDZSCHpAZy9xyxJl1xD+mbN1S6lPRvJ6ZnO1nT1F5kVPS+Ejf/cgMi
         Ahjg==
X-Forwarded-Encrypted: i=1; AJvYcCUoIPY1Q8rTEdm/02J4hpNpiNIm6ImUnU1pD6CbkKnUxwhZL5vFbhGoZw1rHyoBeALfGizCGskmbfjdfJA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq5k7ow5lJYW3dgC16c+mothWImsEcLO/TZjMFDjBFCs5u7H+U
	+JbfpYxPzeupyNMCDx+tgTTkN0ZKIEVT57BJgPdPKoIAA6gApm/5
X-Gm-Gg: ASbGncuw1wUU/8fJ9be6mfsrqhrHd5U2RObzPkd+Z3RdmqDJG3TeKtmZ3Qu6mEMoivQ
	fZ/ZPtcHGJfbze7+hXMTzjuO/lBzka2MHwDYWGoz7+5CZHk6yXFSyFNl0S3KBCNLxThCVd3+IDk
	HKg+7yj6AGkumZOftcuAmQfulVjvH1z92PORN51HGabxSRVsK7hp3xtGoo2RglJNPulY2qPTw+/
	Ur4ZRHXXfZcd7q4gVWdF8EhDG8YZE9W1KqLHJbTJDC+Vza3TIYkPyoZ/8kCNGU4xwp0m77ucLRG
	PCZQSlYLOmRF2s26LqClekjO49GQ6egClAIFsYe5XvcGP/49zsK7SekXE7bvsGVfrVHjmAdagR8
	34CGxlVmiHV/QL4YffsR4ojogmg==
X-Google-Smtp-Source: AGHT+IEYryzzRgr0FcDDUzJNYZVMf5qL5xMbHqFRL9xrVSNiBPnB48rP0O+OYmAEiF3wFKWEMbeD2w==
X-Received: by 2002:a17:902:d4cc:b0:215:a57e:88d6 with SMTP id d9443c01a7336-22c530bc997mr14523115ad.0.1744983503877;
        Fri, 18 Apr 2025 06:38:23 -0700 (PDT)
Received: from ?IPV6:2406:3400:21b:310:2ef0:5dff:fe09:98db? ([2406:3400:21b:310:2ef0:5dff:fe09:98db])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bdb1d2sm16663205ad.25.2025.04.18.06.38.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 06:38:23 -0700 (PDT)
Message-ID: <417a77f3-8532-4528-9c3d-89671d1e6177@gmail.com>
Date: Fri, 18 Apr 2025 23:38:16 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/panfrost: reorder pd/clk/rst sequence
To: Philippe Simons <simons.philippe@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>,
 =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20250403055210.54486-1-simons.philippe@gmail.com>
 <20250403055210.54486-4-simons.philippe@gmail.com>
Content-Language: en-US
In-Reply-To: <20250403055210.54486-4-simons.philippe@gmail.com>
From: John Williams <porschemad911@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I have regression tested this patch on the following devices:

Powkiddy RGB10X - Rockchip RK3326 (Mali G31)

Powkiddy RGB20 Pro - Rockchip RK3566 (Mali G52)

Odroid Go Ultra - Amlogic S922X (Mali G52)

Gameforce ACE - Rockchip RK3588S (Mali G610)

No regressions found during cold boot or with wake after sleep.

Tested-by: John Williams <porschemad911@gmail.com>

On 3/4/25 16:52, Philippe Simons wrote:
> According to Mali manuals, the powerup sequence should be
> enable pd, asserting the reset then enabling the clock and
> the reverse for powerdown.
>
> Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
> ---
>   drivers/gpu/drm/panfrost/panfrost_device.c | 38 +++++++++++-----------
>   1 file changed, 19 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> index 93d48e97ce10..5d35076b2e6d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -209,10 +209,20 @@ int panfrost_device_init(struct panfrost_device *pfdev)
>   
>   	spin_lock_init(&pfdev->cycle_counter.lock);
>   
> +	err = panfrost_pm_domain_init(pfdev);
> +	if (err)
> +		return err;
> +
> +	err = panfrost_reset_init(pfdev);
> +	if (err) {
> +		dev_err(pfdev->dev, "reset init failed %d\n", err);
> +		goto out_pm_domain;
> +	}
> +
>   	err = panfrost_clk_init(pfdev);
>   	if (err) {
>   		dev_err(pfdev->dev, "clk init failed %d\n", err);
> -		return err;
> +		goto out_reset;
>   	}
>   
>   	err = panfrost_devfreq_init(pfdev);
> @@ -229,25 +239,15 @@ int panfrost_device_init(struct panfrost_device *pfdev)
>   			goto out_devfreq;
>   	}
>   
> -	err = panfrost_reset_init(pfdev);
> -	if (err) {
> -		dev_err(pfdev->dev, "reset init failed %d\n", err);
> -		goto out_regulator;
> -	}
> -
> -	err = panfrost_pm_domain_init(pfdev);
> -	if (err)
> -		goto out_reset;
> -
>   	pfdev->iomem = devm_platform_ioremap_resource(pfdev->pdev, 0);
>   	if (IS_ERR(pfdev->iomem)) {
>   		err = PTR_ERR(pfdev->iomem);
> -		goto out_pm_domain;
> +		goto out_regulator;
>   	}
>   
>   	err = panfrost_gpu_init(pfdev);
>   	if (err)
> -		goto out_pm_domain;
> +		goto out_regulator;
>   
>   	err = panfrost_mmu_init(pfdev);
>   	if (err)
> @@ -268,16 +268,16 @@ int panfrost_device_init(struct panfrost_device *pfdev)
>   	panfrost_mmu_fini(pfdev);
>   out_gpu:
>   	panfrost_gpu_fini(pfdev);
> -out_pm_domain:
> -	panfrost_pm_domain_fini(pfdev);
> -out_reset:
> -	panfrost_reset_fini(pfdev);
>   out_regulator:
>   	panfrost_regulator_fini(pfdev);
>   out_devfreq:
>   	panfrost_devfreq_fini(pfdev);
>   out_clk:
>   	panfrost_clk_fini(pfdev);
> +out_reset:
> +	panfrost_reset_fini(pfdev);
> +out_pm_domain:
> +	panfrost_pm_domain_fini(pfdev);
>   	return err;
>   }
>   
> @@ -287,11 +287,11 @@ void panfrost_device_fini(struct panfrost_device *pfdev)
>   	panfrost_job_fini(pfdev);
>   	panfrost_mmu_fini(pfdev);
>   	panfrost_gpu_fini(pfdev);
> -	panfrost_pm_domain_fini(pfdev);
> -	panfrost_reset_fini(pfdev);
>   	panfrost_devfreq_fini(pfdev);
>   	panfrost_regulator_fini(pfdev);
>   	panfrost_clk_fini(pfdev);
> +	panfrost_reset_fini(pfdev);
> +	panfrost_pm_domain_fini(pfdev);
>   }
>   
>   #define PANFROST_EXCEPTION(id) \
