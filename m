Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A6528467A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745513866; cv=none; b=tKcWhi2gIZio2xNto/J3Uov3OecMiSVLgPCW7GHME4i5RfHSmJlqMTZ7CBrvoLkXs1ElX7ZtZfb3ApwVv5Gc+8aH9Ce8SktgJLocmWnj/fJDa7yfelZjusuGK8dSu6hthUmfHVxgHQ4ntO+kaY+wznEcRmWqJLQ7yY02oXf6SeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745513866; c=relaxed/simple;
	bh=yj4rCFYUboh+oGGNVwQYJQBo6D0RI06SDrhlkvLGY0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ah12Ea/3i+NUVKLfltUdR79nGrcNfD/208RUDGFsElMWMI3Wy8OM+4/2Z8c1Y3LiYUjcDVWxmDpIiel4Am5cK0vvJOU9imkNEpGCtWm1imdkYsIhLF4/2iAfB1QTKQYuUu1FLoo3KYozKijO3wx3x3s4mclxIqi0SLpLPRNL4lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=exMHs3Lm; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="exMHs3Lm"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e728841ed96so1034419276.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745513863; x=1746118663; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9CKM2cs1qGXFMlOy1JK4RKIIOdS1MYoTVq0pqbGBT8I=;
        b=exMHs3LmYMlf9whwT3msph2IKLOMNotERPPSYCTo5JXOg6qmCKa2+K/4cXoNz1kuVY
         AEHWISu33ok1r00IxMony/80PGTjPVcZ3s1VkI/J2zmo3TxpLtq87djQOa0HDxyxSwG8
         tjQuxFKRuqarx7H4190ybOqMBh3hcoGuLLrCY6y0CeK6g8lRJSVFQXbCVayX2P0CzkuO
         m3GON/tGHF+0hUTIsYT6ae5stQIu5ChkgW9K/tuNjlQna+E6sdTC7Nyi7QhrxNkrgEtH
         wkqrAdnu5hTeHHObBNHW3McnTHQEsfehDdeUS+GUsNa4uuVzBhRL6QcoqleTYW8jty8K
         jPgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513863; x=1746118663;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9CKM2cs1qGXFMlOy1JK4RKIIOdS1MYoTVq0pqbGBT8I=;
        b=VlsRinU1wWlcsLhN8hrVCZtDrHQAYASM3/4x6gpPqISjvGcddZmeoaR/Y9eco4MRKy
         BLFX13/21wIOd3rhBnuIfynXALbtZ3IeO3smezPZ+2qYWnHIga0YGslOtET40Got4TgX
         ETy9BifebJvYNxhMpxrEhW9Z/ytMqt9zf48ggFSahQiF+v6KHSIojUIpWTOr+32a7CX0
         WtYErJlkl2Igj7F4XejpBPdAI6Oc7GegT0yu9V9LiJtfKzDwmRxJtPo+INlVJyLiDyfN
         3NA7NpNR5Q9jOKqc6e9aCXx/3oatdHjthzg7lUC1q3wshciHyK82+ahA+OcuJYhq1BjK
         /eIA==
X-Forwarded-Encrypted: i=1; AJvYcCXu3IHOR+PSVM2oN6hGcuTK1NEGlJrvgb2uN5/6m7glrQ5lop1DBqJg7m5SMKY8a/K9PgTSdCDrw1oR8OI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxugMzf1MtLlGxGsb7Fj64tLYDuZKv7I0x/pspYox4f/KwRJy7c
	abDGZ6B6h/7HHuSuW1WzW8Pyx8OOqSLuP2yJKLF30I7pKycPAi4gO3hDUJ5lFlKRoIMOs2jMUze
	6tXC0ljfhAAbFjSsm0kzxLckKS7JIK11iAincnw==
X-Gm-Gg: ASbGnctIKwCjhOX46JGzYhiXNaOgC9qW5f2ML6B/haZB1DrET1iEBre+Z0X4BMiGTh5
	qaqLkDpbmB6BB1DE1TIROztVZxjX7NSTpWroQudIqxD2BCYoOeLRFPow0LAYrgX64RQ3BlHWo3x
	0Jw70mkHiKVb2leVPFZJaqHOA=
X-Google-Smtp-Source: AGHT+IFGTdWSdsZcdsNen5sZq4wJnWapLXpFuPlaVUGf+rGu5EnJXdabOZuRe3KyJ3ZRIkLzq1oum5ZWE02emFXzcCY=
X-Received: by 2002:a05:6902:1ac8:b0:e6d:ecbb:e530 with SMTP id
 3f1490d57ef6-e7312d44613mr185101276.27.1745513863337; Thu, 24 Apr 2025
 09:57:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415032314.44997-1-kever.yang@rock-chips.com>
In-Reply-To: <20250415032314.44997-1-kever.yang@rock-chips.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 24 Apr 2025 18:57:06 +0200
X-Gm-Features: ATxdqUGgd2BtezeD6Buv4aip6IDl4W4AEEpLnidEVI-YRjiR40IiiYl0lpXZjps
Message-ID: <CAPDyKFqdx+ZmEWJeyw3hAWXYhH4ibMK96FpJ5B2wfLC6QiOOAA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: power: rockchip: Add support for
 RK3562 SoC
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org, 
	Finley Xiao <finley.xiao@rock-chips.com>, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Elaine Zhang <zhangqing@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Apr 2025 at 05:23, Kever Yang <kever.yang@rock-chips.com> wrote:
>
> From: Finley Xiao <finley.xiao@rock-chips.com>
>
> According to a description from TRM, add all the power domains.
>
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Applied for next, thanks!

Kind regards
Uffe


> ---
>
> Changes in v4:
> - Collect review tag from Heiko
>
> Changes in v3:
> - squash the header file and the binding document
> - Update license
>
> Changes in v2:
> - rename to rockchip,rk3562-power.h
> - update the subject
> - use dual license
>
>  .../power/rockchip,power-controller.yaml      |  1 +
>  .../dt-bindings/power/rockchip,rk3562-power.h | 35 +++++++++++++++++++
>  2 files changed, 36 insertions(+)
>  create mode 100644 include/dt-bindings/power/rockchip,rk3562-power.h
>
> diff --git a/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml b/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml
> index ebab98987e49..f494b7710c09 100644
> --- a/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml
> +++ b/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml
> @@ -40,6 +40,7 @@ properties:
>        - rockchip,rk3366-power-controller
>        - rockchip,rk3368-power-controller
>        - rockchip,rk3399-power-controller
> +      - rockchip,rk3562-power-controller
>        - rockchip,rk3568-power-controller
>        - rockchip,rk3576-power-controller
>        - rockchip,rk3588-power-controller
> diff --git a/include/dt-bindings/power/rockchip,rk3562-power.h b/include/dt-bindings/power/rockchip,rk3562-power.h
> new file mode 100644
> index 000000000000..5182c2427a55
> --- /dev/null
> +++ b/include/dt-bindings/power/rockchip,rk3562-power.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2022-2024 Rockchip Electronics Co., Ltd.
> + */
> +#ifndef __DT_BINDINGS_POWER_RK3562_POWER_H__
> +#define __DT_BINDINGS_POWER_RK3562_POWER_H__
> +
> +/* VD_CORE */
> +#define RK3562_PD_CPU_0                0
> +#define RK3562_PD_CPU_1                1
> +#define RK3562_PD_CPU_2                2
> +#define RK3562_PD_CPU_3                3
> +#define RK3562_PD_CORE_ALIVE   4
> +
> +/* VD_PMU */
> +#define RK3562_PD_PMU          5
> +#define RK3562_PD_PMU_ALIVE    6
> +
> +/* VD_NPU */
> +#define RK3562_PD_NPU          7
> +
> +/* VD_GPU */
> +#define RK3562_PD_GPU          8
> +
> +/* VD_LOGIC */
> +#define RK3562_PD_DDR          9
> +#define RK3562_PD_VEPU         10
> +#define RK3562_PD_VDPU         11
> +#define RK3562_PD_VI           12
> +#define RK3562_PD_VO           13
> +#define RK3562_PD_RGA          14
> +#define RK3562_PD_PHP          15
> +#define RK3562_PD_LOGIC_ALIVE  16
> +
> +#endif
> --
> 2.25.1
>
