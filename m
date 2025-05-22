Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E89528FAB8;
	Thu, 22 May 2025 15:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747926662; cv=none; b=iZcw+maxDXzVllfRNzK9J00akXzoqCgVSDQdsTHe37raCRiOhHnV+544+KAnFuC03BVQqEqmcVTdr6+7y8FHagDrHKDc/V2FYDzIJhHn9LB7t62LKfAZ2RGWIi31Ev91cYPMdjA5ScoKoz1fiiIYUJu6uS3yF9G+avzP2rp3zHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747926662; c=relaxed/simple;
	bh=uJG6Jesy9D0JDKrfcqVhvbfKdi/yDrnCTcz3eC5EWHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h5VGIVKHxATKV2EpdJ/JmMVezaaish4r9H0noCGRL48GnuQTyNMEnsYtZirOtIphN8rqYUsO44Pw337MZ6hexMjcJob3+wB0I8IiJ7m1yMMPqs9pKQFsIsHYRDkLb9UOwovk5orN3pkft0odP4QZmQZF1Px+H8jbnU2Mf+UE61U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fT79k9IZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fT79k9IZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4E38C4CEE4;
	Thu, 22 May 2025 15:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747926661;
	bh=uJG6Jesy9D0JDKrfcqVhvbfKdi/yDrnCTcz3eC5EWHc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fT79k9IZmS41Fg9K74ACV1wFXdLWWeQDKL2DpebkYumi+rwUuXcKZQrLx8Xw/p/xM
	 Mo7gnV8T6vH7T1Esp4yK8nmlzmzSOWeTrsyX+hGJJ5ZjUsZ4LFTK9XmeOmM+qFsJbN
	 e/EJBtVrcYQoJUACAsxAgLD/W8d2BxdMKH3d0YWtosQIoRqIRF5azt/dqmmhwGTZOx
	 dE879aJmNOmPbVUMyGlCULowe2BMPa6+GIqjMdckcyezdybuxZLXVa27F9LvYJz2fA
	 0w9xfsY/sVWTZwNNukHngEEIoJvZzT0MFZa6BsN1BF2uI++Qn1HxWMCYGpdXrx6Q0e
	 eNFf9BM+TeMEQ==
Message-ID: <ea79d8fd-8134-4d14-92f6-f656be20cd9f@kernel.org>
Date: Thu, 22 May 2025 17:10:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: mediatek: Add MT8196 VMM driver support
To: "Nancy.Lin" <nancy.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 jason-jh.lin@mediatek.com, singo.chang@mediatek.com,
 paul-pl.chen@mediatek.com
References: <20250522150426.3418225-1-nancy.lin@mediatek.com>
 <20250522150426.3418225-3-nancy.lin@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <20250522150426.3418225-3-nancy.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/05/2025 17:03, Nancy.Lin wrote:
> From: Nancy Lin <nancy.lin@mediatek.com>
> 
> Add a driver for the MediaTek MT8196 VMM (Vcore for MultiMedia)
> controller, which acts as the main power supplier for multimedia power
> domains such as display, video encode, and video decode on MediaTek SoCs.
> 
> The VMM controller provides virtual regulators for multimedia IPs and
> coordinates with the hardware common clock framework (hwccf) and the
> Video Companioin Processor (VCP) to manage power domains. The driver
> uses a hardware voter through HWCCF to notify the VCP to turn on or
> off VMM-related bucks.
> 
> Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
> ---
>  drivers/soc/mediatek/Kconfig       |  12 +
>  drivers/soc/mediatek/Makefile      |   1 +
>  drivers/soc/mediatek/mtk-vmm-drv.c | 471 +++++++++++++++++++++++++++++
>  3 files changed, 484 insertions(+)
>  create mode 100644 drivers/soc/mediatek/mtk-vmm-drv.c
> 
> diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
> index d7293977f06e..4db4a0876083 100644
> --- a/drivers/soc/mediatek/Kconfig
> +++ b/drivers/soc/mediatek/Kconfig
> @@ -69,6 +69,18 @@ config MTK_MMSYS
>  	  Say yes here to add support for the MediaTek Multimedia
>  	  Subsystem (MMSYS).
>  
> +config MTK_VMM
> +	tristate "MediaTek VMM driver"
> +	help
> +	  Say Y here to enable support for the MediaTek VMM (Vcore for
> +	  MultiMedia) controller, which acts as the main power supplier
> +	  for multimedia power domains such as display, video encode and
> +	  decode on MediaTek SoCs. The VMM controller provides virtual
> +	  regulators for multimedia IPs and coordinates with the hardware
> +	  common clock framework (hwccf) and the Video Companion Processor
> +	  (VCP) to manage power domains. The VMM driver uses hardware voter
> +	  through hwccf to notify VCP to turn on/off VMM-related bucks.
> +
>  config MTK_SVS
>  	tristate "MediaTek Smart Voltage Scaling(SVS)"
>  	depends on NVMEM_MTK_EFUSE && NVMEM
> diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
> index 0665573e3c4b..2b2071614ac4 100644
> --- a/drivers/soc/mediatek/Makefile
> +++ b/drivers/soc/mediatek/Makefile
> @@ -6,6 +6,7 @@ obj-$(CONFIG_MTK_INFRACFG) += mtk-infracfg.o
>  obj-$(CONFIG_MTK_PMIC_WRAP) += mtk-pmic-wrap.o
>  obj-$(CONFIG_MTK_REGULATOR_COUPLER) += mtk-regulator-coupler.o
>  obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
> +obj-$(CONFIG_MTK_VMM) += mtk-vmm-drv.o
>  obj-$(CONFIG_MTK_MMSYS) += mtk-mutex.o
>  obj-$(CONFIG_MTK_SVS) += mtk-svs.o
>  obj-$(CONFIG_MTK_SOCINFO) += mtk-socinfo.o
> diff --git a/drivers/soc/mediatek/mtk-vmm-drv.c b/drivers/soc/mediatek/mtk-vmm-drv.c
> new file mode 100644
> index 000000000000..de4ceb7d59fa
> --- /dev/null
> +++ b/drivers/soc/mediatek/mtk-vmm-drv.c
> @@ -0,0 +1,471 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (c) 2025 MediaTek Inc.
> + * Author: Yunfei Dong <yunfei.dong@mediatek.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/kthread.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/driver.h>
> +#if IS_ENABLED(CONFIG_MTK_VCP_RPROC)

And that's the proof you send some sort of downstream code.

This does not exist.

> +#include <linux/remoteproc.h>
> +#include <linux/remoteproc/mtk_vcp_public.h>
> +#endif
> +
> +#define mtk_vmm_dbg(dev, fmt, args...) \
> +	dev_dbg(dev, "[vmm] %s(%d): " fmt "\n", __func__, __LINE__, ##args)

No, you do not get your own debug code.

NAK.

This is nowhere close to upstream code. Don't send us downstream
patterns please.

Best regards,
Krzysztof
