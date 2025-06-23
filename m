Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171A1270EDF;
	Mon, 23 Jun 2025 14:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750689956; cv=none; b=M0HWx0YlQslOvY8hqxJUnhJJGxMNfH6oYP4ljvSKEdVcBno43kDs7vrQnYfxAgLS603mHIfcWjxcdi1bsXNykwneKABXpVPDoGEDfuNl+9Y3PFwStjkq4MTrkuT+L+40XnNQEyF7QKaUdxJ5d6rrWqWjg8u4nB7pT5IMpyy88R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750689956; c=relaxed/simple;
	bh=G1/X/lF1xVCL44tGeFV3QtLmz65DgUiIcIqqdvS6/Lw=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q5so4/NhfD8XgIvT964NRLmFjaPKSu1xfBZBb/3bIAeLdfcSF/8Ey648MbEZXdEyMw667j44O3Q41wUoVIDFpTi/ZZFD44Nxn1/nIepSPVtGOB/OsAhI62LxWyhMJP+npEYE2v3FVjVxLNnXXJI/71Kyf+2kNqkWB0aKE1wVImc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=OxxEE1U0; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OxxEE1U0"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55NEjl291582769;
	Mon, 23 Jun 2025 09:45:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750689947;
	bh=aWZzLN00QuY/uLhA+Ts4bqB2SeNX24R8PTnGue61Wmg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=OxxEE1U0Th9Ay7/N/qxBrKSj9oIedkjlcXbGAnhm7rnns0i26wv99xac5QDHXST9Q
	 R3UEjPnH7h34gpG9hxSPZVr9jwQX2WfU7yIboSKlSGAOhjgYLw77Tqv0W4XvM6uPbb
	 mkxCawfkWE8nCMEFyJiXEYiMt+nDvadFve1tAam4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55NEjlYM598026
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 23 Jun 2025 09:45:47 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 23
 Jun 2025 09:45:47 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 23 Jun 2025 09:45:47 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55NEjlgG096006;
	Mon, 23 Jun 2025 09:45:47 -0500
Date: Mon, 23 Jun 2025 09:45:47 -0500
From: Bryan Brattlof <bb@ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <khasim@ti.com>, <v-singh1@ti.com>,
        <afd@ti.com>, <devarsht@ti.com>
Subject: Re: [PATCHv4 1/6] arm64: dts: ti: Add bootph property to nodes at
 source for am62a
Message-ID: <20250623144547.xuitjtmfq6mswmxk@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250623141253.3519546-1-p-bhagat@ti.com>
 <20250623141253.3519546-2-p-bhagat@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250623141253.3519546-2-p-bhagat@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On June 23, 2025 thus sayeth Paresh Bhagat:
> Add bootph property directly into the original definitions of relevant
> nodes (e.g., power domains, USB controllers, and other peripherals)
> within their respective DTSI files (ex. main, mcu, and wakeup)i for
> am62a.
> 
> By defining bootph in the nodes source definitions instead of appending
> it later in final DTS files, this change ensures that the property is
> inherently present wherever the nodes are reused across derived device
> trees.
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62a-main.dtsi   | 15 +++++++++++++++
>  arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi    |  1 +
>  arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi |  3 +++
>  arch/arm64/boot/dts/ti/k3-am62a.dtsi        |  3 +++
>  4 files changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
> index 63e097ddf988..1b7fe4487475 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
> @@ -51,6 +51,7 @@ phy_gmii_sel: phy@4044 {
>  			compatible = "ti,am654-phy-gmii-sel";
>  			reg = <0x4044 0x8>;
>  			#phy-cells = <1>;
> +			bootph-all;
>  		};
>  
>  		epwm_tbclk: clock-controller@4130 {
> @@ -84,6 +85,7 @@ dmss: bus@48000000 {
>  		#size-cells = <2>;
>  		dma-ranges;
>  		ranges = <0x00 0x48000000 0x00 0x48000000 0x00 0x06000000>;
> +		bootph-all;
>  
>  		ti,sci-dev-id = <25>;
>  
> @@ -96,6 +98,7 @@ secure_proxy_main: mailbox@4d000000 {
>  			#mbox-cells = <1>;
>  			interrupt-names = "rx_012";
>  			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
> +			bootph-all;
>  		};
>  
>  		inta_main_dmss: interrupt-controller@48000000 {
> @@ -131,6 +134,7 @@ main_bcdma: dma-controller@485c0100 {
>  			ti,sci-rm-range-bchan = <0x20>; /* BLOCK_COPY_CHAN */
>  			ti,sci-rm-range-rchan = <0x21>; /* SPLIT_TR_RX_CHAN */
>  			ti,sci-rm-range-tchan = <0x22>; /* SPLIT_TR_TX_CHAN */
> +			bootph-all;
>  		};
>  
>  		main_pktdma: dma-controller@485c0000 {
> @@ -167,6 +171,7 @@ main_pktdma: dma-controller@485c0000 {
>  						<0x2c>, /* FLOW_CPSW_RX_CHAN */
>  						<0x2e>, /* FLOW_SAUL_RX_0/1_CHAN */
>  						<0x32>; /* FLOW_SAUL_RX_2/3_CHAN */
> +			bootph-all;
>  		};
>  	};
>  
> @@ -216,20 +221,24 @@ dmsc: system-controller@44043000 {
>  		mbox-names = "rx", "tx";
>  		mboxes = <&secure_proxy_main 12>,
>  			 <&secure_proxy_main 13>;
> +		bootph-all;
>  
>  		k3_pds: power-controller {
>  			compatible = "ti,sci-pm-domain";
>  			#power-domain-cells = <2>;
> +			bootph-all;
>  		};
>  
>  		k3_clks: clock-controller {
>  			compatible = "ti,k2g-sci-clk";
>  			#clock-cells = <2>;
> +			bootph-all;
>  		};
>  
>  		k3_reset: reset-controller {
>  			compatible = "ti,sci-reset";
>  			#reset-cells = <2>;
> +			bootph-all;
>  		};
>  	};
>  
> @@ -254,6 +263,7 @@ secure_proxy_sa3: mailbox@43600000 {
>  		 * firmware on non-MPU processors
>  		 */
>  		status = "disabled";
> +		bootph-all;
>  	};
>  
>  	main_pmx0: pinctrl@f4000 {
> @@ -262,6 +272,7 @@ main_pmx0: pinctrl@f4000 {
>  		#pinctrl-cells = <1>;
>  		pinctrl-single,register-width = <32>;
>  		pinctrl-single,function-mask = <0xffffffff>;
> +		bootph-all;
>  	};
>  
>  	main_esm: esm@420000 {
> @@ -282,6 +293,7 @@ main_timer0: timer@2400000 {
>  		assigned-clock-parents = <&k3_clks 36 3>;
>  		power-domains = <&k3_pds 36 TI_SCI_PD_EXCLUSIVE>;
>  		ti,timer-pwm;
> +		bootph-all;
>  	};
>  
>  	main_timer1: timer@2410000 {
> @@ -653,6 +665,7 @@ usb0: usb@31000000 {
>  			dr_mode = "otg";
>  			snps,usb2-gadget-lpm-disable;
>  			snps,usb2-lpm-disable;
> +			bootph-all;
>  		};
>  	};
>  
> @@ -745,6 +758,7 @@ cpsw_port1: port@1 {
>  				phys = <&phy_gmii_sel 1>;
>  				mac-address = [00 00 00 00 00 00];
>  				ti,syscon-efuse = <&cpsw_mac_syscon 0x0>;
> +				bootph-all;
>  			};
>  
>  			cpsw_port2: port@2 {
> @@ -764,6 +778,7 @@ cpsw3g_mdio: mdio@f00 {
>  			clocks = <&k3_clks 13 0>;
>  			clock-names = "fck";
>  			bus_freq = <1000000>;
> +			bootph-all;
>  		};
>  
>  		cpts@3d000 {
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
> index ee961ced7208..df4aa131097f 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
> @@ -12,6 +12,7 @@ mcu_pmx0: pinctrl@4084000 {
>  		#pinctrl-cells = <1>;
>  		pinctrl-single,register-width = <32>;
>  		pinctrl-single,function-mask = <0xffffffff>;
> +		bootph-all;
>  	};
>  
>  	mcu_esm: esm@4100000 {
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
> index 259ae6ebbfb5..86aae252385c 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
> @@ -13,10 +13,12 @@ wkup_conf: bus@43000000 {
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		ranges = <0x00 0x00 0x43000000 0x20000>;
> +		bootph-all;
>  
>  		chipid: chipid@14 {
>  			compatible = "ti,am654-chipid";
>  			reg = <0x14 0x4>;
> +			bootph-all;
>  		};
>  
>  		opp_efuse_table: syscon@18 {
> @@ -67,6 +69,7 @@ wkup_uart0: serial@0 {
>  			reg = <0 0x100>;
>  			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
>  			status = "disabled";
> +			bootph-pre-ram;
>  	       };
>  	};
>  
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a.dtsi b/arch/arm64/boot/dts/ti/k3-am62a.dtsi
> index 4d79b3e9486a..54eab2c93eff 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a.dtsi
> @@ -50,6 +50,7 @@ cbass_main: bus@f0000 {
>  		compatible = "simple-bus";
>  		#address-cells = <2>;
>  		#size-cells = <2>;
> +		bootph-all;

We only need to add the bootph-* properties to the leaf nodes. U-Boot is 
smart enough to propagate these properties all the way to the root when 
it's pruning the device tree for the bootloaders.

~Bryan
