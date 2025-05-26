Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA8819539F
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 08:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748246901; cv=none; b=oMng9lOOWJ4UFZ4tdb1K+G8+ipjGlasoTISiKhZdQylA/ihRdAM/VW/RABA4s37bTMOAehY/+PbRUbWyOj5fumlDC+vFI98cbOrb4Dg3UsvUCHMcMjtQ8mfP2qYz+QwiF/BBye2gCZZhTFpACk1YOdW5i0hrChjEEnQ+SRT/y4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748246901; c=relaxed/simple;
	bh=qikYQ594dHPzQSHOybBoJ/egvS0Gkm2FJWnwnF9iYIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=le2vDmEBAvcdnO2+O/86k/otI5lvjvtYs2GsnqDQSaAqUEIexOGr4K1wY7onBapquZjYxXF7REFL0ulQmJB8GHlIkeWWwUHjhMYGyAVh2asR918Ox6bOLaVr9AQHBUCW53WUjXsL3j3h/GKgIB1taIYiYae0lsUCgig7OLzJO6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vw0lfOGW; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vw0lfOGW"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-440685d6afcso25020125e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 01:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748246897; x=1748851697; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PNtdNqosyMirRG+hBdGG1axM0lRFh93U59Adrxl0txw=;
        b=Vw0lfOGWgzvwSI4uK896G9Z27CaRXl27MbQr9VEotgiWI1ImbleC8vhIlp2e3IXdgh
         qy7T7G07VgqbRs496UH/szi1RDW5wbXG6UjPouHX4B/U0E6tGw+f1Dxb7rhCZhmoxJAa
         83K7Rrxyami+nplaDVsDt4BqTjosWEYwx5LHYcLHeuzJ4YrK9SdVb6BzLYOo67SMjeHj
         zoSW4xIqwxlIAxoFOlihrvw1Vrtpor3bTOFLqUMpVG2vq0popAVKEll9jktQwtW+t0Uu
         saAyrSgJPba8HVV6xsMaDSOFIp2iJjvZT5v/X5zchkwLCNfHwyyxHzt7Mw364QAHYhW7
         9uWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748246897; x=1748851697;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PNtdNqosyMirRG+hBdGG1axM0lRFh93U59Adrxl0txw=;
        b=nhiLbVsrTqjM0wj3vAHTZbXIchM3XxGQAl6+1gXDvm5fiyBgUALnMAV3at+7sZESNa
         we+SO4Svo7HOFMPk6S5gXX8ti7zBlPU+jOZImfAnWpRSNUS8S8qGuVtb6ERUzr4YGgHo
         kKlUhveVtlzqpSWojaiqouPqHdujVvXNqRZvAdKOKka1O5HcYGFuP2ifwdbJIlc5Gwgx
         33nPTAI30jCSLbDsxGTXZBTdcYUyt8bWEmWTCAyptHtCpJwKkkEUkkhTH9ejfxvy+4N0
         iJK/rWv1PrCChtSov2l5k548n5Uz3FxuIY28FU9cJDx0G7OIAh27OAdxsVkgdj9y2nFE
         6D+A==
X-Gm-Message-State: AOJu0Yyb0+y2leVfV9k6PpuU628qyPMyemktZj/0xrL50hOBtGdZqDxr
	VW4cLny7xvo9qe6K2moQijhhipdxfIDewarDy804Yd4A48nTpWKwt9QJz+qOwOdMqY4=
X-Gm-Gg: ASbGnctOXb3dM/mnsvNGkcVHP6ps5l6OPSqe/1MvwFClVJBGhOyiJP0wk6cM93HWxdX
	MhPWAsVcmLRo4gakXLh/7MKEiSi44LsmNUiG5Ub/X93IsCDAUgad7J5HA6uRbQfgWYqfr497+hE
	TUoe6p41N3C5CTC4dgkDkjli5qwyyUh5R3z1kdFWwqvomNhDzQejc60V5goj9I1cdqJS8XaHWyH
	ye3BjGpLceMn7jU6roGV7KJcwu2HUv6xAnfKFsnVUEQ4swHX+GjHdLOinzsb63y/sO/X8eG8BvL
	TqyuDJsiDR+MriAdg7kQCN7GPNedY4uLgHU/Id44l+CupioCGm3lHx98zm1HQIWoY7zi3qRf7cZ
	+CJazluvApnQyz6/F
X-Google-Smtp-Source: AGHT+IE+GT/k7iSve/MABXaWUg+ZYYfI2oijlh2cTs+Cmlin8FoBbD6JtFcM6qKiPeDGC3ExVb+yAQ==
X-Received: by 2002:a05:600c:5294:b0:442:dc6f:7a20 with SMTP id 5b1f17b1804b1-44c93da7cdbmr59657575e9.7.1748246897252;
        Mon, 26 May 2025 01:08:17 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f1ef0ac6sm230479385e9.15.2025.05.26.01.08.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 01:08:16 -0700 (PDT)
Message-ID: <f2162241-6423-43b3-a6b5-74e373cd8834@linaro.org>
Date: Mon, 26 May 2025 09:08:15 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] media: qcom: camss: vfe: Add VBIF setting support
To: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250525-camss-8x39-vbif-v2-0-6d3d5c5af456@mailoo.org>
 <20250525-camss-8x39-vbif-v2-1-6d3d5c5af456@mailoo.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250525-camss-8x39-vbif-v2-1-6d3d5c5af456@mailoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/05/2025 20:25, Vincent Knecht via B4 Relay wrote:
> From: Vincent Knecht <vincent.knecht@mailoo.org>
> 
> Some devices need writing values to VFE VBIF registers.
> Add helper functions to do this.
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---
>   drivers/media/platform/qcom/camss/Makefile         |  1 +
>   drivers/media/platform/qcom/camss/camss-vfe-4-1.c  | 11 ++++++++
>   drivers/media/platform/qcom/camss/camss-vfe-vbif.c | 30 ++++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss-vfe-vbif.h | 19 ++++++++++++++
>   drivers/media/platform/qcom/camss/camss-vfe.c      |  9 +++++++
>   drivers/media/platform/qcom/camss/camss-vfe.h      |  3 +++
>   6 files changed, 73 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> index d26a9c24a430a831e0d865db4d96142da5276653..4c66d29ae505ae5adc717ae98f77fb736a6e15b9 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -21,6 +21,7 @@ qcom-camss-objs += \
>   		camss-vfe-680.o \
>   		camss-vfe-780.o \
>   		camss-vfe-gen1.o \
> +		camss-vfe-vbif.o \
>   		camss-vfe.o \
>   		camss-video.o \
>   		camss-format.o \
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
> index 901677293d971cf761944a660ef719af38203f22..520bc16f2a05e34f457a828ecdb1f9502a0470c1 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
> @@ -15,6 +15,7 @@
>   #include "camss.h"
>   #include "camss-vfe.h"
>   #include "camss-vfe-gen1.h"
> +#include "camss-vfe-vbif.h"
>   
>   #define VFE_0_HW_VERSION		0x000
>   
> @@ -733,6 +734,7 @@ static void vfe_set_qos(struct vfe_device *vfe)
>   {
>   	u32 val = VFE_0_BUS_BDG_QOS_CFG_0_CFG;
>   	u32 val7 = VFE_0_BUS_BDG_QOS_CFG_7_CFG;
> +	int ret;
>   
>   	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_QOS_CFG_0);
>   	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_QOS_CFG_1);
> @@ -742,6 +744,15 @@ static void vfe_set_qos(struct vfe_device *vfe)
>   	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_QOS_CFG_5);
>   	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_QOS_CFG_6);
>   	writel_relaxed(val7, vfe->base + VFE_0_BUS_BDG_QOS_CFG_7);
> +
> +	/* SoC-specific VBIF settings */
> +	if (vfe->res->has_vbif) {
> +		ret = vfe_vbif_apply_settings(vfe);
> +		if (ret < 0)
> +			dev_err_ratelimited(vfe->camss->dev,
> +					    "VFE: VBIF error %d\n",
> +					    ret);

Over multiple lines encapsulate with {}

> +	}
>   }
>   
>   static void vfe_set_ds(struct vfe_device *vfe)
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-vbif.c b/drivers/media/platform/qcom/camss/camss-vfe-vbif.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..2ae61b7baa148f0ad63fe3b8751aeb7b8fc12d81
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-vbif.c
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * camss-vfe-vbif.c
> + *
> + * Qualcomm MSM Camera Subsystem - VFE VBIF Module
> + *
> + * Copyright (c) 2025, The Linux Foundation. All rights reserved.
> + *
> + */
> +
> +#include <linux/io.h>
> +
> +#include "camss.h"
> +#include "camss-vfe.h"
> +#include "camss-vfe-vbif.h"
> +
> +void vfe_vbif_reg_write(struct vfe_device *vfe, u32 reg, u32 val)
> +{
> +	writel_relaxed(val, vfe->vbif_base + reg);
> +}
> +
> +int vfe_vbif_apply_settings(struct vfe_device *vfe)
> +{
> +	switch (vfe->camss->res->version) {
> +	default:
> +		break;
> +	}

You have both

if (vfe->res->has_vbif) {

and the above switch, there's no point in checking this twice in two 
different ways.

Choose one, suggest has_vbif is enough.

> +
> +	return 0;
> +}
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-vbif.h b/drivers/media/platform/qcom/camss/camss-vfe-vbif.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..cef1e17dba1f2335a2c8de070bcb6afde98eef87
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-vbif.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * camss-vfe-vbif.h
> + *
> + * Qualcomm MSM Camera Subsystem - VFE VBIF Module
> + *
> + * Copyright (c) 2025, The Linux Foundation. All rights reserved.
> + *
> + */
> +#ifndef QC_MSM_CAMSS_VFE_VBIF_H
> +#define QC_MSM_CAMSS_VFE_VBIF_H
> +
> +#include "camss-vfe.h"
> +
> +void vfe_vbif_reg_write(struct vfe_device *vfe, u32 reg, u32 val);
> +
> +int vfe_vbif_apply_settings(struct vfe_device *vfe);
> +
> +#endif /* QC_MSM_CAMSS_VFE_VBIF_H */
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 4bca6c3abaff9b898ea879674a3ff8f3592d3139..3138562d399444c5cf2ae96bf16b75b85ff5c5ca 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -1807,6 +1807,15 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
>   		return PTR_ERR(vfe->base);
>   	}
>   
> +	if (vfe->res->has_vbif) {
> +		vfe->vbif_base = devm_platform_ioremap_resource_byname(pdev,
> +					vfe->res->vbif_name);
> +		if (IS_ERR(vfe->vbif_base)) {
> +			dev_err(dev, "could not map vbif memory\n");
> +			return PTR_ERR(vfe->vbif_base);
> +		}
> +	}
> +
>   	/* Interrupt */
>   
>   	ret = platform_get_irq_byname(pdev, res->interrupt[0]);
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
> index a23f666be7531e0366c73faea44ed245e7a8e30f..614e932c33da78e02e0800ce6534af7b14822f83 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -136,6 +136,8 @@ struct vfe_subdev_resources {
>   	u8 line_num;
>   	bool has_pd;
>   	char *pd_name;
> +	bool has_vbif;
> +	char *vbif_name;
>   	const struct vfe_hw_ops *hw_ops;
>   	const struct camss_formats *formats_rdi;
>   	const struct camss_formats *formats_pix;
> @@ -145,6 +147,7 @@ struct vfe_device {
>   	struct camss *camss;
>   	u8 id;
>   	void __iomem *base;
> +	void __iomem *vbif_base;
>   	u32 irq;
>   	char irq_name[30];
>   	struct camss_clock *clock;
> 

