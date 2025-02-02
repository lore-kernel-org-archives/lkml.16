Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F2817580;
	Sun,  2 Feb 2025 09:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738489358; cv=none; b=tLUbJnuJKdz2pZzBurVDL4JcH+Cr8ira28Kux5UuIgph6uWwdDyhjgn/rIIy6xcPdQ5a3vdUYc+HeJ2/NHoz8FbE2cAQddF6E1em3++YWqxEI2mk7jrhLIl8O7urU318ea1X+MBfUo+sqmdSBCJ+iuqmkz2euZAEiu+0AQxHGH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738489358; c=relaxed/simple;
	bh=uAcHndF4ypXlGfCYyOtriXxYdQvRmPbX7xM+I5T+BFU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XvDYkKOA9L3JgTun6nGh1/0vlANL27pzWlFkr4XfYz0NFJ82y3cF5eGQXBC8Y7nMn+RTYPqk3emL0zss5BClBYb7Jri3iTH/ywEHzk0hsdmV9d/g0y24BiCXB8ClkZVyIfvs1KnnuXTbkuyEU8KStBn0GiP1/9rklfNFAoZvQi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=MNU7IPTV; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MNU7IPTV"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5129gVwS2003669
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 2 Feb 2025 03:42:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738489351;
	bh=L/i4eRZNbI/2LmwrJhJ+kldcgaXTdKy2bIex3xqeu3Y=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=MNU7IPTVB3lbOGGEs3E+uSvqf/2w70m1y7OUnHVIWJblL1LOQBpzXkcAxRQkmZt1v
	 QUdNxe5SsIvGW7Hctjt/PqgnxGli5/z0QMMhO6zV14J8P8HI2coB1WhZ0DR5iFtkut
	 LMhrPhBMEBTUaKAQ8z4gbErN+KZ7FMqjJXe9YYhI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5129gVDu023079
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 2 Feb 2025 03:42:31 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 2
 Feb 2025 03:42:31 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 2 Feb 2025 03:42:30 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.104])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5129gTt3124995;
	Sun, 2 Feb 2025 03:42:30 -0600
Date: Sun, 2 Feb 2025 15:12:29 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-j784s4-j742s2-evm: Add overlay to
 enable USB0 Type-A
Message-ID: <yui6gakfnu43wrpupqjzodd2hcwk4tbqrjunauottazjvxbx3l@in54codtcgg3>
References: <20250124124150.2024963-1-s-vadapalli@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250124124150.2024963-1-s-vadapalli@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Fri, Jan 24, 2025 at 06:11:49PM +0530, Siddharth Vadapalli wrote:

This patch has been merged with the following series due to Makefile
dependencies:
https://lore.kernel.org/r/20250202093636.2699064-1-s-vadapalli@ti.com/
and therefore has been superseded by its equivalent in the above series.

Regards,
Siddharth.

> The USB0 instance of the USB controller on both the J742S2 EVM and the
> J784S4 EVM supports a single USB interface at a time among the following:
> 1. USB3.1 Gen1 Type C interface
> 2. Two USB2.0 Type A interfaces via an on-board USB Hub.
> 
> By default, the USB3.1 Gen1 Type C interface is supported on both of the
> EVMs. Enable the USB2.0 Type A interface by configuring the USB2.0_MUX_SEL
> mux. Additionally, set the Dual-Role Mode to Host since a Type-A interface
> is only associated with the Host Mode of operation.
> 
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
> 
> Hello,
> 
> This patch is based on linux-next tagged next-20250124.
> Since Linux boot is broken on all TI K3 SoCs including
> J742S2 and J784S4 due to:
> https://github.com/torvalds/linux/commit/ba5095ebbc7a
> as indicated at:
> https://lore.kernel.org/r/b2413460-ec8b-4c77-99b8-4c32b262439a@ti.com/
> this patch was tested on J784S4-EVM by reverting the aforementioned commit.
> Logs validating the USB2.0 Type-A Connector on J784S4-EVM using a USB Pen
> Drive:
> https://gist.github.com/Siddharth-Vadapalli-at-TI/663d703912ae574e39d7a78421e404c8
> 
> Regards,
> Siddharth.
> 
>  arch/arm64/boot/dts/ti/Makefile               |  7 +++++
>  .../ti/k3-j784s4-j742s2-evm-usb0-type-a.dtso  | 29 +++++++++++++++++++
>  2 files changed, 36 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-usb0-type-a.dtso
> 
> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> index 8a4bdf87e2d4..95b8fd0981d7 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
> @@ -127,6 +127,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm.dtb
>  dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-pcie0-pcie1-ep.dtbo
>  dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-quad-port-eth-exp1.dtbo
>  dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-usxgmii-exp1-exp2.dtbo
> +dtb-$(CONFIG_ARCH_K3) += k3-j784s4-j742s2-evm-usb0-type-a.dtbo
>  
>  # Boards with J742S2 SoC
>  dtb-$(CONFIG_ARCH_K3) += k3-j742s2-evm.dtb
> @@ -209,10 +210,14 @@ k3-j721e-sk-csi2-dual-imx219-dtbs := k3-j721e-sk.dtb \
>  	k3-j721e-sk-csi2-dual-imx219.dtbo
>  k3-j721s2-evm-pcie1-ep-dtbs := k3-j721s2-common-proc-board.dtb \
>  	k3-j721s2-evm-pcie1-ep.dtbo
> +k3-j742s2-evm-usb0-type-a-dtbs := k3-j742s2-evm.dtb \
> +	k3-j784s4-j742s2-evm-usb0-type-a.dtbo
>  k3-j784s4-evm-pcie0-pcie1-ep-dtbs := k3-j784s4-evm.dtb \
>  	k3-j784s4-evm-pcie0-pcie1-ep.dtbo
>  k3-j784s4-evm-quad-port-eth-exp1-dtbs := k3-j784s4-evm.dtb \
>  	k3-j784s4-evm-quad-port-eth-exp1.dtbo
> +k3-j784s4-evm-usb0-type-a-dtbs := k3-j784s4-evm.dtb \
> +	k3-j784s4-j742s2-evm-usb0-type-a.dtbo
>  k3-j784s4-evm-usxgmii-exp1-exp2-dtbs := k3-j784s4-evm.dtb \
>  	k3-j784s4-evm-usxgmii-exp1-exp2.dtbo
>  dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
> @@ -243,8 +248,10 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
>  	k3-j721e-evm-pcie1-ep.dtb \
>  	k3-j721e-sk-csi2-dual-imx219.dtb \
>  	k3-j721s2-evm-pcie1-ep.dtb \
> +	k3-j742s2-evm-usb0-type-a.dtb \
>  	k3-j784s4-evm-pcie0-pcie1-ep.dtb \
>  	k3-j784s4-evm-quad-port-eth-exp1.dtb \
> +	k3-j784s4-evm-usb0-type-a.dtb \
>  	k3-j784s4-evm-usxgmii-exp1-exp2.dtb
>  
>  # Enable support for device-tree overlays
> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-usb0-type-a.dtso b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-usb0-type-a.dtso
> new file mode 100644
> index 000000000000..ba15d72d86d6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-usb0-type-a.dtso
> @@ -0,0 +1,29 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/**
> + * DT Overlay for enabling USB0 instance of USB on J784S4 and J742S2 EVMs for
> + * Host Mode of operation with the Type-A Connector.
> + *
> + * J784S4 EVM Product Link: https://www.ti.com/tool/J784S4XEVM
> + * J742S2 EVM Product Link: https://www.ti.com/tool/J742S2XH01EVM
> + *
> + * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com/
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&exp2 {
> +	p12-hog {
> +		/* P12 - USB2.0_MUX_SEL */
> +		gpio-hog;
> +		gpios = <12 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "USB2.0_MUX_SEL";
> +	};
> +};
> +
> +&usb0 {
> +	dr_mode = "host";
> +};
> -- 
> 2.43.0
> 
