Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE38E1E493C
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 12:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746447302; cv=none; b=QsJR2pQE9Pep8HUtwmUpQOUekzbH3toLOHTx11KdUG75Q4b9G8WS7tZEnwT1bcDtoXJoaMmvPLz9x3QLW5Fc8c+DF7juYmp++ZyQpgVFK4PS795SclGqC70W9K76pNl0PsQv4ZQIlI91snJ0BxnIHUrzh+Cgxd8I412a88BDi28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746447302; c=relaxed/simple;
	bh=+JunN5LHxQnSTzNrxTkTpwaTbQxXMqM6ucxT3WMKXO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c8LdbLwITJEmCMAVQxkx/RdNTHhOq1AWeKziJ5JWZlMri6EljYbXju/OgFuNUa5rmjj6scegBxWC7O7O4kVgT2TiNalQGoes3bFoVAHe/UlbVObp6V9XQp61Un5p4cFzWuIp+gx6kP6GC9ak410W+vX3Zd/vnWTsMXk87d6Wj+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=mKv/+ktI; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="mKv/+ktI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1746447299;
 bh=2e/MuYHAA+jWnpekvvoY+BPMl0OhYcezCPyB7/Johv8=;
 b=mKv/+ktILGb3Uuf++NNYkyl7QhOFJhwuELweXrhbjuxgAoTFiOSv1Nb7w5El9Sx/lGZJpdYb6
 0Y/jyWTErfEQK8eu0pg27dYwurCnrAc/SWhiqeo2Mjlaj5CFwr6a+blC0K1NpdYGyGmehxnkdpL
 Q2Ge4ZqQuJFCusDWVHLop1K6w1rgGviwSOxNn6RCdlsNT7g8KiB3UtHURUwAtE7iMUDHc10yj6/
 h1XZiJW2R8shP14J3j9jnZv46Vgq41Nkxh9p4Vc3v3n3VY8MHcDcsPQvcO0S+yH01/aAWFaAVwc
 SajZq4/0mXkByOO6Is88Xt8dRKRuOBYgCmmaAfHv6ALA==
X-Forward-Email-ID: 6818abba07f380a11152deca
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.0.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <4dc3a05d-34eb-44d1-9855-7b8e626e1942@kwiboo.se>
Date: Mon, 5 May 2025 14:14:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: rockchip: Add Luckfox Omni3576 Board
 support
To: John Clark <inindev@gmail.com>
Cc: heiko@sntech.de, robh@kernel.org, conor+dt@kernel.org,
 detlev.casanova@collabora.com, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250502205533.51744-1-inindev@gmail.com>
 <20250504102447.153551-1-inindev@gmail.com>
 <20250504102447.153551-4-inindev@gmail.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250504102447.153551-4-inindev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi John,

On 2025-05-04 12:24, John Clark wrote:
> Add device tree for the Luckfox Omni3576 Carrier Board with Core3576
> Module, powered by the Rockchip RK3576 SoC with four Cortex-A72 cores,
> four Cortex-A53 cores, and a Mali-G52 MC3 GPU. This initial
> implementation enables essential functionality for booting Linux and
> basic connectivity.
> 
> Supported and tested features:
>  - UART for serial console
>  - SD card for storage
>  - PCIe with NVMe SSD (detected, mounted, and fully functional)
>  - Gigabit Ethernet 0 with RGMII PHY
>  - USB 2.0 host ports
>  - RK806 PMIC for power management
>  - RTC with timekeeping and wake-up
>  - GPIO-controlled LED with heartbeat trigger
>  - eMMC (enabled, not populated on tested board)
> 
> The device tree provides a foundation for further peripheral support, such
> as WiFi, MIPI-DSI, HDMI, and Ethernet 1, in future updates.
> 
> Tested on Linux 6.15-rc4
> 
> Signed-off-by: John Clark <inindev@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../dts/rockchip/rk3576-luckfox-omni3576.dts  | 779 ++++++++++++++++++
>  2 files changed, 780 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dts
> 
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> index 7948522cb225..22d74367b7e6 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -136,6 +136,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-display-vz.dtbo
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-io-expander.dtbo
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-armsom-sige5.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-evb1-v10.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-luckfox-omni3576.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-roc-pc.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-rock-4d.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3582-radxa-e52c.dtb
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dts b/arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dts
> new file mode 100644
> index 000000000000..73351ba7830c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dts
> @@ -0,0 +1,779 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2024 Rockchip Electronics Co., Ltd.
> + *
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +#include <dt-bindings/soc/rockchip,vop2.h>
> +#include "rk3576.dtsi"
> +
> +/ {
> +	model = "Luckfox Omni3576";
> +	compatible = "luckfox,omni3576", "rockchip,rk3576";

Because this is a carrier board this should probably be something like:

  compatible = "luckfox,omni3576", "luckfox,core3576", "rockchip,rk3576";

And this .dts-file should be split up into something like:
- rk3576-luckfox-core3576.dtsi for parts related to the Core3576 SoM
- rk3576-luckfox-omni3576.dts for parts only related to the carrier board

Regards,
Jonas

[snip]
