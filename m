Received: from mail-8141.vip.163.com (mail-8141.vip.126.com [60.191.81.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7B3256C71;
	Mon,  7 Jul 2025 03:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.191.81.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751859453; cv=none; b=jRu0GBgVP9myOdmHh6CMj6l1AdCorh+y12gQiaakWROWb5wMy0h/WshYwNPJrZ+s1rTjwmJ1tZ0+BtVBxxbybk7V0p28iLlEVSyAxTdkboVKEjEXKRUXDUOTcdFkwIh4IrlTwNJeNkGThxt1HxxmE3XvC+COzAc1go9AQrGnbxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751859453; c=relaxed/simple;
	bh=k2TdzviJqSo4LBmcVaK4SGuAEg6ja1WQlCxUn6+mvbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=riQHVfYbwX1NDQ9tQogr4zX/muvm3So4V6GGUUDIEb3LR/SY0E4p+jCwHHttcBJUDaWAF/1M/6jv6mIvZew5rxh3963e8fI6tApZVM7FxdR8+6g4V9FEDVp1sCiQMn8FkBBaPrFxsUaqFb9o8koU9vSUxOc8ZXQxSNY0NTWA+YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=WQQQ3KmE; arc=none smtp.client-ip=60.191.81.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="WQQQ3KmE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=oesmI5ePY0ossKfajmISjSZfcDhggP0bYnh+lj+buoU=;
	b=WQQQ3KmEPp5jU24e7Wc/uAmsDbH3yhApgLc+2F73BuqLtNc1F81JKBaS1t9AYL
	EMZO/hRhaD4y4BU4oiGN0kXBUJ5JWOER0NVuIOwWBTp+BEBaMe9FMf2SFK7gGRxO
	k05ARgRcGFX16oDqyWIoPV47YgrPs3HM7EG+x1D9F5CAs=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCXluOqQGtoLdp1AA--.56829S3;
	Mon, 07 Jul 2025 11:36:12 +0800 (CST)
Date: Mon, 7 Jul 2025 11:36:10 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] arm64: dts: imx93-phycore-som: Add RPMsg overlay
Message-ID: <aGtAqi7JWbF5F-31@dragon>
References: <20250619063954.1730231-1-primoz.fiser@norik.com>
 <20250619063954.1730231-2-primoz.fiser@norik.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619063954.1730231-2-primoz.fiser@norik.com>
X-CM-TRANSID:Ms8vCgCXluOqQGtoLdp1AA--.56829S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF4UXw48tr13Jw48KrWfXwb_yoW5CF43pa
	92yFW5WFWIgF1xCr9xXrs2qa4DAws5Aayj9w1UWryUKrWUAry2krsxtrW3Wr4xZw4UAw40
	vFs3WFnFkFnxX3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U4WlgUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNAwwlWhrQKx8tgAA34

On Thu, Jun 19, 2025 at 08:39:51AM +0200, Primoz Fiser wrote:
> Add an overlay used for remote processor inter-core communication
> between A55 and M33 cores on the phyCORE-i.MX93 SoM based boards.
> 
> Overlay adds the required reserved memory regions and enables the
> mailbox unit and the M33 core for RPMsg (Remote Processor Messaging
> Framework).
> 
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |  4 ++
>  .../dts/freescale/imx93-phycore-rpmsg.dtso    | 60 +++++++++++++++++++
>  2 files changed, 64 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx93-phycore-rpmsg.dtso
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 0b473a23d120..08a1de299538 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -324,6 +324,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
> +
> +imx93-phycore-rpmsg-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-segin.dtb imx93-phycore-rpmsg.dtbo
> +dtb-$(CONFIG_ARCH_MXC) += imx93-phycore-rpmsg.dtb
> +
>  dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba91xxca.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-rpmsg.dtso b/arch/arm64/boot/dts/freescale/imx93-phycore-rpmsg.dtso
> new file mode 100644
> index 000000000000..9200113c9ec3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93-phycore-rpmsg.dtso
> @@ -0,0 +1,60 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025 PHYTEC Messtechnik GmbH
> + * Author: Primoz Fiser <primoz.fiser@norik.com>
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&{/} {
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +
> +		vdev0vring0: vdev0vring0@a4000000 {
> +			reg = <0 0xa4000000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev0vring1: vdev0vring1@a4008000 {
> +			reg = <0 0xa4008000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev1vring0: vdev1vring0@a4010000 {
> +			reg = <0 0xa4010000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev1vring1: vdev1vring1@a4018000 {
> +			reg = <0 0xa4018000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		rsc_table: rsc-table@2021e000 {

Can we sort the node in order of unit-address?

Shawn

> +			reg = <0 0x2021e000 0 0x1000>;
> +			no-map;
> +		};
> +
> +		vdevbuffer: vdevbuffer@a4020000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0 0xa4020000 0 0x100000>;
> +			no-map;
> +		};
> +	};
> +};
> +
> +&cm33 {
> +	mbox-names = "tx", "rx", "rxdb";
> +	mboxes = <&mu1 0 1>,
> +		 <&mu1 1 1>,
> +		 <&mu1 3 1>;
> +	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
> +		 <&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
> +	status = "okay";
> +};
> +
> +&mu1 {
> +	status = "okay";
> +};
> -- 
> 2.34.1
> 

