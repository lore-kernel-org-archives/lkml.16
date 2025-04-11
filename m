Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC05D2367DC;
	Fri, 11 Apr 2025 18:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744395980; cv=none; b=fBE+Ja2WtOoAhFtKyiwdonp75IpS8HPnlq/rNiitOMpiNQRQPl8m7/x9/CA/t0Er2T8ljx0qHcEUqD5PxoCrA8dBGh+Lm/haKXrha7U+zgRyLzrumie4XUtS2CxIHPY/1TZHSzOhD0q70KUvwZsXMLIUUeTDCW8NYhEPZczbjFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744395980; c=relaxed/simple;
	bh=xNljx30klKmmzFx9Gpl8eSxivGP0Z76Q+nAVirlD+sE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eV9I8c6jvjkWPX8zQLBuL03MCy1cUAYVP5WYk1EVaYVrPhuz38HVkLCDIfeprgyaqd87ElC29DL/jRg/lrCgczSp33eoiunKahXV/VnjafUtZWCgpfTLWSKqzBPrQlGe8kOI0An3+AtHaa0U7ezXQdmnAXs7SJfex/KWrwtqFx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=hr+/lquy; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hr+/lquy"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53BIQ9fw1515137
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 13:26:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744395969;
	bh=C46R7wiLtD1J4h2JTuv22/R+I86Xr7Q5T8wzzEPduhk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=hr+/lquyXFaFGqs6cUup/7redD+LZLggyqb4qC4KGUycnL0ANPNBtV2Rfv0HimcRw
	 hnSfDRo1qYGCH6afFulkSlLuWp3tzCHev8gaG/XDmdUrR442hyo8rT9Nls+cBhG8o4
	 87RpV9zewz3fOH5z74LcXt+ggaEsgmruhcatStqw=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53BIQ9RR108037
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Apr 2025 13:26:09 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 13:26:08 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 13:26:08 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53BIQ8Wt086091;
	Fri, 11 Apr 2025 13:26:08 -0500
Date: Fri, 11 Apr 2025 13:26:08 -0500
From: Bryan Brattlof <bb@ti.com>
To: <krzk@kernel.org>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/3] arm64: dts: ti: k3-am62l: add initial
 infrastructure
Message-ID: <20250411182608.cpxr357humjq6ln7@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250407-am62lx-v4-0-ce97749b9eae@ti.com>
 <20250407-am62lx-v4-2-ce97749b9eae@ti.com>
 <20250409-calculating-hungry-mosquito-f8cfeb@shite>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250409-calculating-hungry-mosquito-f8cfeb@shite>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On April  9, 2025 thus sayeth krzk@kernel.org:
> On Mon, Apr 07, 2025 at 10:34:39AM GMT, Bryan Brattlof wrote:
> > From: Vignesh Raghavendra <vigneshr@ti.com>
> > 
> > Add the initial infrastructure needed for the AM62L. ALl of which can be
> > found in the Technical Reference Manual (TRM) located here:
> > 
> >     https://www.ti.com/lit/pdf/sprujb4
> > 
> > Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> > Signed-off-by: Bryan Brattlof <bb@ti.com>
> > ---
> > Changes in v3:
> >  - Added more nodes now that the SCMI interface is ready
> > 
> > Changes in v1:
> >  - switched to non-direct links to TRM updates are automatic
> >  - fixed white space indent issues with a few nodes
> >  - separated out device tree bindings
> > ---
> >  arch/arm64/boot/dts/ti/Makefile              |   3 +
> >  arch/arm64/boot/dts/ti/k3-am62l-main.dtsi    | 672 +++++++++++++++++++++++++++
> >  arch/arm64/boot/dts/ti/k3-am62l-thermal.dtsi |  19 +
> >  arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi  | 144 ++++++
> >  arch/arm64/boot/dts/ti/k3-am62l.dtsi         | 121 +++++
> >  arch/arm64/boot/dts/ti/k3-am62l3.dtsi        |  67 +++
> >  arch/arm64/boot/dts/ti/k3-pinctrl.h          |   2 +
> >  7 files changed, 1028 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> > index 03d4cecfc001c..93df47282add3 100644
> > --- a/arch/arm64/boot/dts/ti/Makefile
> > +++ b/arch/arm64/boot/dts/ti/Makefile
> > @@ -32,6 +32,9 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62-lp-sk-nand.dtbo
> >  dtb-$(CONFIG_ARCH_K3) += k3-am62a7-sk.dtb
> >  dtb-$(CONFIG_ARCH_K3) += k3-am62a7-phyboard-lyra-rdk.dtb
> >  
> > +# Boards with AM62Lx SoCs
> > +dtb-$(CONFIG_ARCH_K3) += k3-am62l3-evm.dtb
> > +
> >  # Boards with AM62Px SoC
> >  dtb-$(CONFIG_ARCH_K3) += k3-am62p5-sk.dtb
> >  
> > diff --git a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
> > new file mode 100644
> > index 0000000000000..697181c2e7f51
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
> > @@ -0,0 +1,672 @@
> > +// SPDX-License-Identifier: GPL-2.0-only or MIT
> > +/*
> > + * Device Tree file for the AM62L main domain peripherals
> > + * Copyright (C) 2024 Texas Instruments Incorporated - https://www.ti.com/
> > + *
> > + * Technical Reference Manual: https://www.ti.com/lit/pdf/sprujb4
> > + */
> > +
> > +&cbass_main {
> > +	gic500: interrupt-controller@1800000 {
> > +		compatible = "arm,gic-v3";
> > +		reg = <0x00 0x01800000 0x00 0x10000>,	/* GICD */
> > +		      <0x00 0x01840000 0x00 0xc0000>,	/* GICR */
> > +		      <0x01 0x00000000 0x00 0x2000>,    /* GICC */
> > +		      <0x01 0x00010000 0x00 0x1000>,    /* GICH */
> > +		      <0x01 0x00020000 0x00 0x2000>;    /* GICV */
> > +		ranges;
> > +		#address-cells = <2>;
> > +		#size-cells = <2>;
> > +		#interrupt-cells = <3>;
> > +		interrupt-controller;
> > +		/*
> > +		 * vcpumntirq:
> > +		 * virtual CPU interface maintenance interrupt
> > +		 */
> > +		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +		gic_its: msi-controller@1820000 {
> > +			compatible = "arm,gic-v3-its";
> > +			reg = <0x00 0x01820000 0x00 0x10000>;
> > +			socionext,synquacer-pre-its = <0x1000000 0x400000>;
> > +			msi-controller;
> > +			#msi-cells = <1>;
> > +		};
> > +	};
> > +
> > +	gpio0: gpio@600000 {
> > +		compatible = "ti,am64-gpio", "ti,keystone-gpio";
> > +		reg = <0x00 0x00600000 0x00 0x100>;
> > +		gpio-controller;
> > +		#gpio-cells = <2>;
> > +		interrupt-parent = <&gic500>;
> > +		interrupts = <GIC_SPI 260 IRQ_TYPE_EDGE_RISING>,
> > +			     <GIC_SPI 261 IRQ_TYPE_EDGE_RISING>,
> > +			     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>,
> > +			     <GIC_SPI 263 IRQ_TYPE_EDGE_RISING>,
> > +			     <GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
> > +			     <GIC_SPI 265 IRQ_TYPE_EDGE_RISING>,
> > +			     <GIC_SPI 266 IRQ_TYPE_EDGE_RISING>,
> > +			     <GIC_SPI 267 IRQ_TYPE_EDGE_RISING>;
> > +		interrupt-controller;
> > +		#interrupt-cells = <2>;
> > +		power-domains = <&scmi_pds 34>;
> > +		clocks = <&scmi_clk 140>;
> > +		clock-names = "gpio";
> > +		ti,ngpio = <126>;
> > +		ti,davinci-gpio-unbanked = <0>;
> > +		status = "disabled";
> > +	};
> > +
> > +	gpio2: gpio@610000 {
> > +		compatible = "ti,am64-gpio", "ti,keystone-gpio";
> 
> 64 or 62?
> > +		reg = <0x00 0x00610000 0x00 0x100>;
> > +		gpio-controller;
> > +		#gpio-cells = <2>;
> > +		interrupt-parent = <&gic500>;
> > +		interrupts = <GIC_SPI 280 IRQ_TYPE_EDGE_RISING>,
> > +			     <GIC_SPI 281 IRQ_TYPE_EDGE_RISING>,
> > +			     <GIC_SPI 282 IRQ_TYPE_EDGE_RISING>,
> > +			     <GIC_SPI 283 IRQ_TYPE_EDGE_RISING>,
> > +			     <GIC_SPI 284 IRQ_TYPE_EDGE_RISING>,
> > +			     <GIC_SPI 285 IRQ_TYPE_EDGE_RISING>,
> > +			     <GIC_SPI 286 IRQ_TYPE_EDGE_RISING>,
> > +			     <GIC_SPI 287 IRQ_TYPE_EDGE_RISING>;
> > +		interrupt-controller;
> > +		#interrupt-cells = <2>;
> > +		power-domains = <&scmi_pds 35>;
> > +		clocks = <&scmi_clk 141>;
> > +		clock-names = "gpio";
> > +		ti,ngpio = <79>;
> > +		ti,davinci-gpio-unbanked = <0>;
> > +		status = "disabled";
> > +	};
> > +
> > +	timer0: timer@2400000 {
> > +		compatible = "ti,am654-timer";
> 
> 64? 654? 62? You need to use proper compatibles matching the hardware
> (see writing bindings).

So most of the K3 generation of TI's SoCs will reuse the IP as long as 
they can. My understanding was to pick the compatible of the platform 
that introduced the driver for that particular IP. Are we suggesting we 
add a compatible for the 62L?

> 
> > +		reg = <0x00 0x2400000 0x00 0x400>;
> > +		interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
> > +		clocks = <&scmi_clk 47>;
> > +		clock-names = "fck";
> > +		power-domains = <&scmi_pds 15>;
> > +		ti,timer-pwm;
> > +	};
> > +
> 
> ...
> 
> > +		chipid: chipid@14 {
> > +			compatible = "ti,am654-chipid";
> > +			reg = <0x14 0x4>;
> > +			bootph-all;
> > +		};
> > +
> > +		usb0_phy_ctrl: syscon@45000 {
> > +			compatible = "ti,am62-usb-phy-ctrl", "syscon";
> > +			reg = <0x45000 0x4>;
> > +			bootph-all;
> > +		};
> > +
> > +		usb1_phy_ctrl: syscon@45004 {
> > +			compatible = "ti,am62-usb-phy-ctrl", "syscon";
> > +			reg = <0x45004 0x4>;
> 
> No, you do not get syscon per register. The entire point of syscon is to
> collect ALL registers. Your device is the syscon, not a register.
> 

My understanding from [0] was that we would need to break this up into 
smaller syscon nodes because the alternative would be to mark the entire 
region as a syscon and every other node using it would need to use it's 
base + offset which was kinda undesirable especially for the small 
number of drivers that need data from this region.

    a-device {
        clocks = <&epwm_tbclk 0>;
    };

~Bryan

[0] https://lore.kernel.org/lkml/20250122-topic-am62-dt-syscon-v6-13-v1-2-515d56edc35e@baylibre.com/

> Best regards,
> Krzysztof
> 
