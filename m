Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2784BA49;
	Mon,  2 Jun 2025 04:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748837570; cv=none; b=WxJP/GAPU08GozSAMst8YUrjcuWyWCPoJUCjDjeAkbA57C4JZUbR54gij4d2N74c/PjHJGeDca3KVqRVOwqQJ09si+K8AVz/4PNqmus9Q5SPeARZwzH9ce76VKsslZt6/Ig6WS9K9eTSYqCvQ+616q44kqITXgpS/U0C6sn+GGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748837570; c=relaxed/simple;
	bh=SXGI68zTpEQxoRLpV8kTenRPwkQ4mgLfAF1yy8lB/ug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c36+wQFFdVsedzKwmoySmpIuWlQJs9RuwFY9/lKDKJQ2TIt25ftqaIzG1P0nQvpUNd+pVbW24QAKfvJDijvJn/kNmDjeOf1Ivg/ctVmgG9aL/SOv7alZSyWGOB4LF+4krvmE6srcGf04n4EFHAxAkBA6efJ/9wf6DTsVjIZuq8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=hrmTsxMf; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="hrmTsxMf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=PM1YUNe6Kcjv4VvPdBukyHU695tq2C+DM6YTTyjSZJQ=;
	b=hrmTsxMffdE5+2LEHRQK4t5V9+FQHtqNu35A1386zBT09uiEhgmhF5lq6FRiS2
	ZDGQ1sn5sS04WCLR6boKt1vkVIxb6HCs6hQDHHsBeCkBNxYiiWwTwAEFcAxvtrtA
	dXXCwUkG8VgJpZXWrblWxIR2M/2m1wccymM5BpLHs7guA=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBX1cmGJD1oH4VrAg--.29433S3;
	Mon, 02 Jun 2025 12:11:52 +0800 (CST)
Date: Mon, 2 Jun 2025 12:11:50 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 5/6] arm64: dts: imx8mp: add aipstz-related definitions
Message-ID: <aD0khjdjv7a1GcO5@dragon>
References: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
 <20250415171919.5623-6-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415171919.5623-6-laurentiumihalcea111@gmail.com>
X-CM-TRANSID:M88vCgBX1cmGJD1oH4VrAg--.29433S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr1UJF47XryUAF4xZF17GFg_yoW5JFyfpa
	43CryUCr1IkF47G3sFvr1fJrn8Ka1fAF429w4agrW8KrnI9a48Kr4Fqr1SgrsFqrn3Ca1F
	9Fn0vw1xurnxX3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U3PEfUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNAiU+Wg9JIjiHQAA3X

On Tue, Apr 15, 2025 at 01:19:18PM -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Add header file with AIPSTZ-related definitions: consumer types,
> master/peripheral configuration bits, and master ID definitions.
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-aipstz.h | 33 +++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  1 +
>  2 files changed, 34 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h b/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
> new file mode 100644
> index 000000000000..b5bfcbcf38b8
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
> +#define IMX8MP_AIPSTZ_MASTER 0x0
> +#define IMX8MP_AIPSTZ_PERIPH 0x1
> +
> +/* master configuration options */
> +#define IMX8MP_AIPSTZ_MPL (1 << 0)
> +#define IMX8MP_AIPSTZ_MTW (1 << 1)
> +#define IMX8MP_AIPSTZ_MTR (1 << 2)
> +#define IMX8MP_AIPSTZ_MBW (1 << 3)
> +
> +/* peripheral configuration options */
> +#define IMX8MP_AIPSTZ_TP (1 << 0)
> +#define IMX8MP_AIPSTZ_WP (1 << 1)
> +#define IMX8MP_AIPSTZ_SP (1 << 2)
> +#define IMX8MP_AIPSTZ_BW (1 << 3)
> +
> +/* master ID definitions */
> +#define IMX8MP_AIPSTZ_EDMA 0 /* AUDIOMIX EDMA */
> +#define IMX8MP_AIPSTZ_CA53 1 /* Cortex-A53 cluster */
> +#define IMX8MP_AIPSTZ_SDMA2 3 /* AUDIOMIX SDMA2 */
> +#define IMX8MP_AIPSTZ_SDMA3 3 /* AUDIOMIX SDMA3 */
> +#define IMX8MP_AIPSTZ_HIFI4 5 /* HIFI4 DSP */
> +#define IMX8MP_AIPSTZ_CM7 6 /* Cortex-M7 */

Could we use tabs to align all these values vertically?

Shawn

> +
> +#endif /* __IMX8MP_AIPSTZ_H */
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> index aa7940c65f2d..ebbc99f9ceba 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -12,6 +12,7 @@
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

