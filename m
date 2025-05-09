Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B781FB3;
	Fri,  9 May 2025 00:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746750133; cv=none; b=XNUBP69HqMY4NZ3tHm3zW1QB77Mge6U7DTpWgZYWtAtboeMDNHFt4ahG2cH9ywfhWQT/lyFQAsGEW5biT4tVwoNFmws1uCqrMUjbH6GEdSnFvcUgWZn9B3XTuCZnFc29Mm+7r2t35M7yeF6WC0GgzgoLtKohu1y37TCkfVu7IkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746750133; c=relaxed/simple;
	bh=/SCglJLxpclzucDU3yiJFF1ubIuRBF0QgtKl9rIrLbE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qWGPEUTotpSp2o5cdcspRZl/VRknTHFuzpZmnXSoAsSQPY577GFicVY6BvTNL3C4Gk+j0JQRR5Ho1A29X7Q0XIhvQ/gq9Ee60UANfFUg1XtOgZU27jgCreeLSRxxBEcQPxqM6ad5eOxuKhxadgmlVF9IYv/h1dWCX4S5/uTzJP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ZnMgvKw9; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZnMgvKw9"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5490M1R81793366
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 May 2025 19:22:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746750121;
	bh=KgLuOiarV7Aw/Z8jvsxdJySYwSWkOMiQwkRmin6WCk8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ZnMgvKw9fa2F31qOl8FAARz8V0VRLoW9PgbPnwv9BLH9WdtVULXrhSsYZIWQIp8nX
	 qrWPoqATZDq0A8h+hVTkhG8OX+ma6506eiNBSO1X/EV5HqXP9o7AmXz3CQFzJFVmxg
	 yQ+jbg8mW3nh1JYrYlryouKkYWlW8JFGOKJNwpzQ=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5490M1eA018622
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 May 2025 19:22:01 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 May 2025 19:22:01 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 May 2025 19:22:01 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5490M1FS066139;
	Thu, 8 May 2025 19:22:01 -0500
Date: Thu, 8 May 2025 19:22:01 -0500
From: Bryan Brattlof <bb@ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <khasim@ti.com>, <v-singh1@ti.com>,
        <afd@ti.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: ti: Add support for AM62D2-EVM
Message-ID: <20250509002201.g2db6cf5w4mtow6k@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250508091422.288876-1-p-bhagat@ti.com>
 <20250508091422.288876-4-p-bhagat@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250508091422.288876-4-p-bhagat@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On May  8, 2025 thus sayeth Paresh Bhagat:
> AM62D-EVM evaluation module (EVM) is a low-cost expandable platform board
> designed for TI’s AM62D2 SoC. It supports the following interfaces:
> 
> * 4 GB LPDDR4 RAM
> * x2 Gigabit Ethernet expansion connectors
> * x4 3.5mm TRS Audio Jack Line In
> * x4 3.5mm TRS Audio Jack Line Out
> * x2 Audio expansion connectors
> * x1 Type-A USB 2.0, x1 Type-C dual-role device (DRD) USB 2.0
> * x1 UHS-1 capable µSD card slot
> * 32 GB eMMC Flash
> * 512 Mb OSPI NOR flash
> * x4 UARTs via USB 2.0-B
> * XDS110 for onboard JTAG debug using USB
> * Temperature sensors, user push buttons and LEDs
> 
> AM62A7 and AM62D2 SoCs share several peripherals in wakeup, mcu, thermal,
> and portions of the main domain. To improve reuse and reduce duplication,
> common *-wakeup.dtsi, *-mcu.dtsi, *-thermal.dtsi, and *-main.dtsi files
> have been introduced. Each board will have a dedicated DTS file that
> includes both the shared and SoC-specific .dtsi files.
> 
> Schematics Link - https://www.ti.com/lit/zip/sprcal5
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>  arch/arm64/boot/dts/ti/Makefile               |    3 +
>  .../dts/ti/k3-am62a-am62d-common-main.dtsi    | 1013 +++++++++++++++++
>  ...cu.dtsi => k3-am62a-am62d-common-mcu.dtsi} |   26 +-
>  ...tsi => k3-am62a-am62d-common-thermal.dtsi} |    2 +-
>  ...dtsi => k3-am62a-am62d-common-wakeup.dtsi} |    2 +-
>  arch/arm64/boot/dts/ti/k3-am62a-main.dtsi     | 1005 ----------------
>  arch/arm64/boot/dts/ti/k3-am62a.dtsi          |    9 +-
>  arch/arm64/boot/dts/ti/k3-am62d.dtsi          |  123 ++
>  arch/arm64/boot/dts/ti/k3-am62d2-evm.dts      |  533 +++++++++
>  arch/arm64/boot/dts/ti/k3-am62d2.dtsi         |  155 +++
>  10 files changed, 1837 insertions(+), 1034 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am62a-am62d-common-main.dtsi
>  rename arch/arm64/boot/dts/ti/{k3-am62a-mcu.dtsi => k3-am62a-am62d-common-mcu.dtsi} (86%)
>  rename arch/arm64/boot/dts/ti/{k3-am62a-thermal.dtsi => k3-am62a-am62d-common-thermal.dtsi} (94%)
>  rename arch/arm64/boot/dts/ti/{k3-am62a-wakeup.dtsi => k3-am62a-am62d-common-wakeup.dtsi} (97%)
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am62d.dtsi
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am62d2.dtsi
> 

So this diff was kinda a slog and I'm not sure I went through everything 
but I called out some things I saw.

I'll let others chime in here with their opinions but we should probably 
find a way to split this up a little more next time if possible.

...

> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-am62d-common-main.dtsi 
> b/arch/arm64/boot/dts/ti/k3-am62a-am62d-common-main.dtsi
> new file mode 100644
> index 000000000000..570a6413165d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-am62d-common-main.dtsi
> @@ -0,0 +1,1013 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Device Tree file for the MAIN domain peripherals shared by AM62A and AM62D
> + *
> + * Copyright (C) 2022-2024 Texas Instruments Incorporated - https://www.ti.com/

My thinking is this is a new file so we should probably update the 
copyright year while we're here

...


> diff --git a/arch/arm64/boot/dts/ti/k3-am62a.dtsi b/arch/arm64/boot/dts/ti/k3-am62a.dtsi
> index 4d79b3e9486a..e9f28343a4c1 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a.dtsi
> @@ -118,10 +118,13 @@ cbass_wakeup: bus@b00000 {
>  		};
>  	};
>  
> -	#include "k3-am62a-thermal.dtsi"
> +	#include "k3-am62a-am62d-common-thermal.dtsi"

I know we're trying to reduce the boilerplate for very similar chips but 
I think a better way to split this would be to have an industrial and 
automotive qualified thermal #include here rather than a 62D/62A

I'm assuming from the marketing material this will be the same 
automotive qualified AMB package so we could call it something along 
those lines if we want.

...

>  
>  /* Now include the peripherals for each bus segments */
> +#include "k3-am62a-am62d-common-main.dtsi"
> +#include "k3-am62a-am62d-common-mcu.dtsi"
> +#include "k3-am62a-am62d-common-wakeup.dtsi"
> +
> +/* Include AM62P specific peripherals */

    s/AM62P/AM62D/

...

> diff --git a/arch/arm64/boot/dts/ti/k3-am62d.dtsi b/arch/arm64/boot/dts/ti/k3-am62d.dtsi
> new file mode 100644
> index 000000000000..606da1c1f1bc
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am62d.dtsi
> @@ -0,0 +1,123 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Device Tree Source for AM62D SoC Family
> + *
> + * Copyright (C) 2022-2024 Texas Instruments Incorporated - https://www.ti.com/
			 2025
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/soc/ti,sci_pm_domain.h>
> +
> +#include "k3-pinctrl.h"
> +
> +/ {
> +	model = "Texas Instruments K3 AM62D SoC";
> +	compatible = "ti,am62d2";
> +	interrupt-parent = <&gic500>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	chosen { };

No need for this

...


> diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
> new file mode 100644
> index 000000000000..0873c2523607
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
> @@ -0,0 +1,533 @@

...

> +
> +	chosen {
> +		stdout-path = "serial2:115200n8";
> +	};

Look at the 62P and how we used a &phandle for this.

...

> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		/* global cma region */
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			reusable;
> +			size = <0x00 0x2000000>;
> +			alloc-ranges = <0x00 0xc0000000 0x00 0x2000000>;
> +			linux,cma-default;
> +		};
> +
> +		c7x_0_dma_memory_region: c7x-dma-memory@99800000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x99800000 0x00 0x100000>;
> +			no-map;
> +		};
> +
> +		c7x_0_memory_region: c7x-memory@99900000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x99900000 0x00 0xf00000>;
> +			no-map;
> +		};
> +
> +		mcu_r5fss0_core0_dma_memory_region: r5f-dma-memory@9b800000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9b800000 0x00 0x100000>;
> +			no-map;
> +		};
> +
> +		mcu_r5fss0_core0_memory_region: r5f-dma-memory@9b900000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9b900000 0x00 0xf00000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9c800000 0x00 0x100000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9c900000 0x00 0xf00000>;
> +			no-map;
> +		};
> +
> +		secure_tfa_ddr: tfa@80000000 {
> +			reg = <0x00 0x80000000 0x00 0x80000>;

Just a nit pick but while we're respinning this series could you sort 
this? It just makes our lives easier when we inevitably changes this 
when we want to experiment with some other firmware or try to move 
things when someone wants to use a smaller DDR part

> +			alignment = <0x1000>;
> +			no-map;
> +		};
> +
> +		secure_ddr: optee@9e800000 {
> +			reg = <0x00 0x9e800000 0x00 0x01800000>; /* for OP-TEE */
> +			alignment = <0x1000>;
> +			no-map;
> +		};
> +	};

...

> +
> +&mcu_pmx0 {
> +	bootph-all;

Look at how the 62P does this. Newer U-Boot versions are smart enough to 
only prune things if none of their children have an appropriate bootph-* 
flag. So as long as we have a bootph-all flag in this following
&wkup_uart0_pins_default the &mcu_pmx0 will not be pruned

It makes things much cleaner and avoids us having to pull in SoC.dtsi 
stuff here to make the bootloaders happy

> +
> +	wkup_uart0_pins_default: wkup-uart0-default-pins {
> +		pinctrl-single,pins = <
> +			AM62DX_MCU_IOPAD(0x0024, PIN_INPUT, 0) /* (C9) WKUP_UART0_RXD */
> +			AM62DX_MCU_IOPAD(0x0028, PIN_OUTPUT, 0) /* (E9) WKUP_UART0_TXD */
> +			AM62DX_MCU_IOPAD(0x002c, PIN_INPUT, 0) /* (C10) WKUP_UART0_CTSn */
> +			AM62DX_MCU_IOPAD(0x0030, PIN_OUTPUT, 0) /* (C8) WKUP_UART0_RTSn */
> +		>;
> +		bootph-all;
> +	};
> +};
> +
> +/* WKUP UART0 is used for DM firmware logs */
> +&wkup_uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&wkup_uart0_pins_default>;
> +	status = "reserved";
> +	bootph-all;
> +};
> +
> +&main_pmx0 {
> +	bootph-all;

same here

...

> +&secure_proxy_main {
> +	bootph-all;
> +};

So this is where things get weird. The only way U-Boot's R5 SPL will 
talk to TIFS is via the secure proxy thread. It's a requirement of any 
board that uses both the 62A and 63D chip well all the 62* really.

So rather than defining this on every board we should probably just 
throw it in with the &secure_proxy_main node rather than calling it out 
here.

> +
> +&dmsc {
> +	bootph-all;
> +};
> +
> +&k3_pds {
> +	bootph-all;
> +};
> +
> +&k3_clks {
> +	bootph-all;
> +};
> +
> +&k3_reset {
> +	bootph-all;
> +};
> +
> +&wkup_conf {
> +	bootph-all;
> +};
> +
> +&chipid {
> +	bootph-all;
> +};

Same with these. The chipid, clocks, power domains will all be needed 
for booting the SoC regardless of how someone wires the chip. These 
should just go in their respective nodes and be done with it rather than 
each board calling this out.

...

> +
> +&k3_reset {
> +	bootph-all;
> +};
> +
> +&dmsc {
> +	bootph-all;
> +};

I've already snipped this email quite a bit, but I know I've seen these 
duplicates. Double check we're not defining things multiple times. 

...


> diff --git a/arch/arm64/boot/dts/ti/k3-am62d2.dtsi b/arch/arm64/boot/dts/ti/k3-am62d2.dtsi
> new file mode 100644
> index 000000000000..47566fea4157
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am62d2.dtsi
> @@ -0,0 +1,155 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Device Tree Source for AM62D2 SoC family in Quad core configuration
> + *
> + * TRM: https://www.ti.com/lit/zip/spruj16
> + *
> + * Copyright (C) 2020-2024 Texas Instruments Incorporated - https://www.ti.com/

    s/2024/2025

~Bryan

