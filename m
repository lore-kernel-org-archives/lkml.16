Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FA6184;
	Fri, 20 Jun 2025 13:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750426313; cv=none; b=UVQFP99jTw1W0aynTf1uy7xjwFTSAUohGISgCuQ57hLzIhMHXu6vEz6tEJTrbwdec5zLmadkkS0gd9ikmuetJodTpKg01Mry5vZsDRnc7y9kHxHDjp0ztj5XsDbhwT3UJRM8ipmIfhUPfbooQ786Hfck9+P9VyUZqrDc4/8Fbdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750426313; c=relaxed/simple;
	bh=IJ5pc1pZdgjJrzmGFIWQmgiUZu+S4mq8wHYkZQZYEp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SDg0FrdT7gfP12Ly039kFYXcgxXNCXwDQ8lQ/hzIWL/xrtlhOClgYJh32eTVG/9MglHLcfOxn10ySGaxMMRYwK/yTwU5qyX6z6LkkWyKSFNtUVwCXeJoGYRRL6k/T5JyIF1X59mduN5mL077lQDUDHQvEZOne0U7HYX4LPz0TJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ndYpJkuq; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ndYpJkuq"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b31d578e774so1268522a12.1;
        Fri, 20 Jun 2025 06:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750426311; x=1751031111; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eD67VGoIFc7viTaixF6jhGk+Vu3kiN+A3PvW7sAsva4=;
        b=ndYpJkuq4XT/VVKzN8A3RbUCX6VNfY3IMEM5QdwaDiTN7vOySQMt1Stnfc5eiYphog
         kI31aapSmMqC3X0NGXPi9htJu1G6mb91ilhqUBWJ3fkU7PSTkrmHjNYddvpRmevx02zW
         7d3mP9upiL4T2I0VLAy77C4jxLcOniyz+mHLHWWMiYuMoAYHtBFgwhloOoncFdN2O8iH
         H2G6JBFWybMObOMDvxKCLhPbVPQqixxTnly48Kotk6DP6zUwH2/xVbOvlz3NFvzH5KpW
         XjtK0Vm/PMA7bXbMCwqXot5hLgwdGegNFDs24nbo0YwsVi17QVVWz1l7f+LbfnDMj4cx
         tiVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750426311; x=1751031111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eD67VGoIFc7viTaixF6jhGk+Vu3kiN+A3PvW7sAsva4=;
        b=Uwh7jM3v6+TI3E7sO3/o/T5F5o27VyDROsvBubi2YXn+J0+++2u/zBUXTYtubNVVKa
         a6r9U9UOLsD1m+z5gaZsQKHnhzRpFLnH/8pohrHo96I2QUUVtG+pG20HZ4yrmSOe2bUj
         9iV2xknoT0AkeusMFEa1q9o/4/wqsC6L86kpwws0+QYhzCBGSQU/yTU+NtZH6oXnIRhK
         68+8Ex32UnBE/CV7gFgzesxuhVbbmRy9EySpsWSCcXhBW3NEAyJ+Jvv7usNSPan3jmh+
         X5tlXo4kbNBe1rPtWCzaz9paIN4DBL7zklTlijdWBPVaP12mqeBcwVGNcIhjfNyHqXL3
         LlBg==
X-Forwarded-Encrypted: i=1; AJvYcCVoP4Xeol3lll8TaEJ1OnXHljG0XH6Ikb3geSgjpwN4GEy870ElCqYDV1nLIuKSgWl3bNQ5pZTpiEMB@vger.kernel.org, AJvYcCWzxe4yq8QTt9LKuU/ZhwqI3ifSc+8tGvu2ubNNJxDZCQf49NzvEV1k9NpDnsx+gC71Y96KWQeGXVgZ8qYR@vger.kernel.org
X-Gm-Message-State: AOJu0YzVnwQZHnN0hHIGhYUUUFzrD5thdUVLYANhlxqMV6MKSJt4BmcV
	DmdHZc04AKU4LZUYxIwqCQ+LyzGpcBlmsPSwjtiSqf6AJMJyFEJq07lNZwZspcKuRFKgr+oexea
	I6H9H3zLQVuRRRjldzEE+qAD7p18XvOo=
X-Gm-Gg: ASbGncvfz8VNtOBrrFdGIpnvk7Oo+ZjMwgV1oSgjuaTgGuV6dLtPVUbIoXzo58FnkmG
	kZXgSpSQphCNoHr9qBrGgf/2YDOejKrZVP9Bxwl3Rw7/KdyQql1ow2MWa2j8DNEBefcrzYXnfbY
	tPxFgnLx+qtnoW3fnYPR3J+SfAbJpuUUBhmdBmvvQ7
X-Google-Smtp-Source: AGHT+IH3fQ614Vx5GzkzKNEt57w45C62O8m4Fe+y3Z88xij0+BBvMKQejo4mfuZeKaeYz95v1iqBe0ZzmZyXbsNGhCo=
X-Received: by 2002:a17:90b:2dcb:b0:2ff:4a8d:74f9 with SMTP id
 98e67ed59e1d1-3159f503784mr3641263a91.10.1750426310887; Fri, 20 Jun 2025
 06:31:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com> <20250610160152.1113930-6-laurentiumihalcea111@gmail.com>
In-Reply-To: <20250610160152.1113930-6-laurentiumihalcea111@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 20 Jun 2025 16:33:50 +0300
X-Gm-Features: AX0GCFuHG9nwEDIse9o6OGABxZ9DBwglQi1amT5GMFegc87DEv-xylKcvAMSJZE
Message-ID: <CAEnQRZD0RYeOsy-0cK4CDzroKySoOoKu=nJD4GT+Tyiii9x43A@mail.gmail.com>
Subject: Re: [PATCH v7 5/6] arm64: dts: imx8mp: add aipstz-related definitions
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Frank Li <Frank.Li@nxp.com>, Marco Felsch <m.felsch@pengutronix.de>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 7:04=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Add header file with AIPSTZ-related definitions: consumer types,
> master/peripheral configuration bits, and master ID definitions.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

> ---
>  arch/arm64/boot/dts/freescale/imx8mp-aipstz.h | 33 +++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  1 +
>  2 files changed, 34 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h b/arch/arm64/b=
oot/dts/freescale/imx8mp-aipstz.h
> new file mode 100644
> index 000000000000..6481c484ca37
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#ifndef __IMX8MP_AIPSTZ_H
> +#define __IMX8MP_AIPSTZ_H
> +
> +/* consumer type - master or peripheral */
> +#define IMX8MP_AIPSTZ_MASTER           0x0
> +#define IMX8MP_AIPSTZ_PERIPH           0x1
> +
> +/* master configuration options */
> +#define IMX8MP_AIPSTZ_MPL              (1 << 0)
> +#define IMX8MP_AIPSTZ_MTW              (1 << 1)
> +#define IMX8MP_AIPSTZ_MTR              (1 << 2)
> +#define IMX8MP_AIPSTZ_MBW              (1 << 3)
> +
> +/* peripheral configuration options */
> +#define IMX8MP_AIPSTZ_TP               (1 << 0)
> +#define IMX8MP_AIPSTZ_WP               (1 << 1)
> +#define IMX8MP_AIPSTZ_SP               (1 << 2)
> +#define IMX8MP_AIPSTZ_BW               (1 << 3)
> +
> +/* master ID definitions */
> +#define IMX8MP_AIPSTZ_EDMA             0 /* AUDIOMIX EDMA */
> +#define IMX8MP_AIPSTZ_CA53             1 /* Cortex-A53 cluster */
> +#define IMX8MP_AIPSTZ_SDMA2            3 /* AUDIOMIX SDMA2 */
> +#define IMX8MP_AIPSTZ_SDMA3            3 /* AUDIOMIX SDMA3 */
> +#define IMX8MP_AIPSTZ_HIFI4            5 /* HIFI4 DSP */
> +#define IMX8MP_AIPSTZ_CM7              6 /* Cortex-M7 */
> +
> +#endif /* __IMX8MP_AIPSTZ_H */
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mp.dtsi
> index 307e1671eccf..9b550f225856 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -13,6 +13,7 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/thermal/thermal.h>
>
> +#include "imx8mp-aipstz.h"
>  #include "imx8mp-pinfunc.h"
>
>  / {
> --
> 2.34.1
>
>
