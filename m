Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE8928CF4A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745513870; cv=none; b=tioAW6PvRELVOAsaQov+FyhxxpALyEh+Q3DkfMXx3aB/TGkdyOJfdbgJKBFVAVcDTcngAbk93ojF5kKn94d9N/bipMKrfXeia6VZZfxfyUild7bvkMUc9IrfIj5tz2GREUMU5bd9hhHPYX940nmc8NS8oYO2M8AZNKNy7GZxSNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745513870; c=relaxed/simple;
	bh=ligPPdPCxLB7UTAeBo43KtRCRHrkTargE1GzztTMgy4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eahWwGdit3itBgA9ljJQdC7TBf0+0JW6kTzUSqNOwZx25ZrpBAq2NkXUAEL3DkY7HV/ga4UpNcsh9RkFalv+sz3sUSuZd9K2BZtz4Ac4QoaGqWELQRprgGS2C7NtuvL8IkTQTwt8SEZ7b1RbFeRic0haIaY2CLHqFK9BtxWkr74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iEjQpshZ; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iEjQpshZ"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7053f85f059so13034117b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745513867; x=1746118667; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cMFtwR0cjY9A1szP289YoQESj54wwE6Rq8FAwxVKpA4=;
        b=iEjQpshZhyuTnG0Qk39S7iYSZPx4trHrqisuFblEf+ZoEr8rhj9bNOgVjtW0tj3DET
         NgBjBsyG8OMl1pVY1UiuHVIyCiocKjJv7yHGjtVk84opkfaJJ/zsBurn72gjS2TNzqPu
         9e5jYJ1w9YLkLKvNowXSmzjisWb6YECEclLS9ZPLdTEfN/Zw0DYVhc3Zj9BWUOoWVsNX
         G0rukq47kFjMSbVNzXyqqiV7F5XB1zIxQvX6zcyH2w5GAzDCb0Q1tMk0oA0cQHCxKyiX
         /tRrqlhxwOFNn0ZveAUJPDFvB8xR57+66TlAGXkyGa/Xu3sZYk0j4UPVNLGanoyPuJOe
         ek0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513867; x=1746118667;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cMFtwR0cjY9A1szP289YoQESj54wwE6Rq8FAwxVKpA4=;
        b=h8hQkUBHEskCbTS7wDwltyAopOI6PmpqCsNRi9EGCiExYr0W4NRiculrDxOEiRNA+N
         saHA7KB4v+qpwse61z7C6MM5WCymqE1v+P9JlNZuWYn5YxbktNI+4+kkNUk7CSriqrpB
         K7/EgcpnO4mdCmzuaikLx/tY2MPjftU14Q7Ffvn4H0YdHu3ppdD7PKIEOlqavyG8dxsX
         DNygbCU1enLpflnKzcFcxZ8uBaRCjL90KmBnCiwSe+RnncsiRxvZmRmAcAjoysVedi1W
         kvS//ZzcarPCF6qzOhChFirRNk++efO6QyIKEfl6j7DauwDY0NWVdYrHWOO3QpdmPIA+
         wXIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOMeKBsFL3Y5RP9zos+BwfYuuO550/VyPwLyfIEhtJ8BEsclvTOOKcDRD1kqLAgNSd2ouUv2UzjwHwD7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOyDbj6P0q9xcpdolTf/plCZwPu1UZARqpm/F58nvHtMp4DAz1
	sfFUuut1i+im2OiHCGa6t84mqg2w/jgF6joaf5ztm9O/O1UK48gObrwgc6ke0PJV9JOwcUatKar
	07JmlFL30KGjs1jkzT0zGlaGksFLvtKgpS9YCvMj/WRcLg0Gk
X-Gm-Gg: ASbGncvIVsbkKgDd6ZbjZJk/sI1Wdvzhm1Mf0jFPcAwJXqVXyFfCOsLynsDWQCo1xWh
	xt+ZqrUfSX/x+i5YV1p70FmniraLyuWdlT7qe4aecZ4f524J7NUwBLqSrY3JurYKXjSteHAIPDZ
	S/ZAuzOtmxsz9mH2kUKy7c9Y0=
X-Google-Smtp-Source: AGHT+IH5p9xZ9JTlIabjNlX7tQHJrcaoNt4NdS4YrEPTAAfSSCwMBfEDdWwaxwxD2TzmAUDKr0gH0wiBCRrqHBSYDNU=
X-Received: by 2002:a05:690c:385:b0:6fd:2feb:eb6e with SMTP id
 00721157ae682-7084f129df8mr7111907b3.28.1745513866588; Thu, 24 Apr 2025
 09:57:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415032314.44997-1-kever.yang@rock-chips.com> <20250415032314.44997-2-kever.yang@rock-chips.com>
In-Reply-To: <20250415032314.44997-2-kever.yang@rock-chips.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 24 Apr 2025 18:57:10 +0200
X-Gm-Features: ATxdqUHaEq5VBCeeWj8VtNYyErWM1Dmw22DJsOkuoLiPj5dVBYs62HJ1VPg7Ulw
Message-ID: <CAPDyKFqLQsG-rNeYgHT4g2mCWjPzkF2nkktUXxAL95tM7g+Smg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] soc: rockchip: power-domain: add power domain
 support for rk3562
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org, 
	Finley Xiao <finley.xiao@rock-chips.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-pm@vger.kernel.org, 
	Detlev Casanova <detlev.casanova@collabora.com>, linux-kernel@vger.kernel.org, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Peter Geis <pgwipeout@gmail.com>, 
	Shawn Lin <shawn.lin@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Apr 2025 at 05:23, Kever Yang <kever.yang@rock-chips.com> wrote:
>
> From: Finley Xiao <finley.xiao@rock-chips.com>
>
> This driver is modified to support RK3562 SoC.
> Add support to ungate clk.
> Add support to shut down memory for rk3562.
>
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Applied for next and by amending the commit message header, thanks!

Kind regards
Uffe


> ---
>
> Changes in v4:
> - rebase to v6.15-rc1
> - update patch author and Collect review tag
>
> Changes in v3: None
> Changes in v2:
> - update the header after rename
>
>  drivers/pmdomain/rockchip/pm-domains.c | 48 +++++++++++++++++++++++++-
>  1 file changed, 47 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
> index 03bcf79a461f..4cce407bb1eb 100644
> --- a/drivers/pmdomain/rockchip/pm-domains.c
> +++ b/drivers/pmdomain/rockchip/pm-domains.c
> @@ -2,7 +2,7 @@
>  /*
>   * Rockchip Generic power domain support.
>   *
> - * Copyright (c) 2015 ROCKCHIP, Co. Ltd.
> + * Copyright (c) 2015 Rockchip Electronics Co., Ltd.
>   */
>
>  #include <linux/arm-smccc.h>
> @@ -35,6 +35,7 @@
>  #include <dt-bindings/power/rk3366-power.h>
>  #include <dt-bindings/power/rk3368-power.h>
>  #include <dt-bindings/power/rk3399-power.h>
> +#include <dt-bindings/power/rockchip,rk3562-power.h>
>  #include <dt-bindings/power/rk3568-power.h>
>  #include <dt-bindings/power/rockchip,rk3576-power.h>
>  #include <dt-bindings/power/rk3588-power.h>
> @@ -135,6 +136,20 @@ struct rockchip_pmu {
>         .active_wakeup = wakeup,                        \
>  }
>
> +#define DOMAIN_M_G_SD(_name, pwr, status, req, idle, ack, g_mask, mem, wakeup, keepon) \
> +{                                                      \
> +       .name = _name,                                  \
> +       .pwr_w_mask = (pwr) << 16,                      \
> +       .pwr_mask = (pwr),                              \
> +       .status_mask = (status),                        \
> +       .req_w_mask = (req) << 16,                      \
> +       .req_mask = (req),                              \
> +       .idle_mask = (idle),                            \
> +       .ack_mask = (ack),                              \
> +       .clk_ungate_mask = (g_mask),                    \
> +       .active_wakeup = wakeup,                        \
> +}
> +
>  #define DOMAIN_M_O_R(_name, p_offset, pwr, status, m_offset, m_status, r_status, r_offset, req, idle, ack, wakeup, regulator)  \
>  {                                                      \
>         .name = _name,                                  \
> @@ -201,6 +216,9 @@ struct rockchip_pmu {
>  #define DOMAIN_RK3399(name, pwr, status, req, wakeup)          \
>         DOMAIN(name, pwr, status, req, req, req, wakeup)
>
> +#define DOMAIN_RK3562(name, pwr, req, g_mask, mem, wakeup)             \
> +       DOMAIN_M_G_SD(name, pwr, pwr, req, req, req, g_mask, mem, wakeup, false)
> +
>  #define DOMAIN_RK3568(name, pwr, req, wakeup)          \
>         DOMAIN_M(name, pwr, pwr, req, req, req, wakeup)
>
> @@ -1197,6 +1215,18 @@ static const struct rockchip_domain_info rk3399_pm_domains[] = {
>         [RK3399_PD_SDIOAUDIO]   = DOMAIN_RK3399("sdioaudio", BIT(31), BIT(31), BIT(29), true),
>  };
>
> +static const struct rockchip_domain_info rk3562_pm_domains[] = {
> +                                            /* name           pwr     req     g_mask  mem wakeup */
> +       [RK3562_PD_GPU]         = DOMAIN_RK3562("gpu",         BIT(0), BIT(1), BIT(1), 0, false),
> +       [RK3562_PD_NPU]         = DOMAIN_RK3562("npu",         BIT(1), BIT(2), BIT(2), 0, false),
> +       [RK3562_PD_VDPU]        = DOMAIN_RK3562("vdpu",        BIT(2), BIT(6), BIT(6), 0, false),
> +       [RK3562_PD_VEPU]        = DOMAIN_RK3562("vepu",        BIT(3), BIT(7), BIT(7) | BIT(3), 0, false),
> +       [RK3562_PD_RGA]         = DOMAIN_RK3562("rga",         BIT(4), BIT(5), BIT(5) | BIT(4), 0, false),
> +       [RK3562_PD_VI]          = DOMAIN_RK3562("vi",          BIT(5), BIT(3), BIT(3), 0, false),
> +       [RK3562_PD_VO]          = DOMAIN_RK3562("vo",  BIT(6), BIT(4), BIT(4), 16, false),
> +       [RK3562_PD_PHP]         = DOMAIN_RK3562("php",         BIT(7), BIT(8), BIT(8), 0, false),
> +};
> +
>  static const struct rockchip_domain_info rk3568_pm_domains[] = {
>         [RK3568_PD_NPU]         = DOMAIN_RK3568("npu",  BIT(1), BIT(2),  false),
>         [RK3568_PD_GPU]         = DOMAIN_RK3568("gpu",  BIT(0), BIT(1),  false),
> @@ -1398,6 +1428,18 @@ static const struct rockchip_pmu_info rk3399_pmu = {
>         .domain_info = rk3399_pm_domains,
>  };
>
> +static const struct rockchip_pmu_info rk3562_pmu = {
> +       .pwr_offset = 0x210,
> +       .status_offset = 0x230,
> +       .req_offset = 0x110,
> +       .idle_offset = 0x128,
> +       .ack_offset = 0x120,
> +       .clk_ungate_offset = 0x140,
> +
> +       .num_domains = ARRAY_SIZE(rk3562_pm_domains),
> +       .domain_info = rk3562_pm_domains,
> +};
> +
>  static const struct rockchip_pmu_info rk3568_pmu = {
>         .pwr_offset = 0xa0,
>         .status_offset = 0x98,
> @@ -1496,6 +1538,10 @@ static const struct of_device_id rockchip_pm_domain_dt_match[] = {
>                 .compatible = "rockchip,rk3399-power-controller",
>                 .data = (void *)&rk3399_pmu,
>         },
> +       {
> +               .compatible = "rockchip,rk3562-power-controller",
> +               .data = (void *)&rk3562_pmu,
> +       },
>         {
>                 .compatible = "rockchip,rk3568-power-controller",
>                 .data = (void *)&rk3568_pmu,
> --
> 2.25.1
>
