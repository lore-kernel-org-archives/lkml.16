Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91338210185;
	Fri,  2 May 2025 12:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746188672; cv=none; b=S5wTPT3DRSwJy0yh+/vHMv+cJRqAfxvAvlFeFIKdsyPgk0mjNbZqC/ffICEueiJrUO9rEzKj+seaDebmyw42PgYMCe6xNwIKYWCvi9Pc7w1B7ySrfu2CBvipYcgayQ15p4bstt5qNco7BkiP+a3I2WOu18rGnbmktl5EegVuPNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746188672; c=relaxed/simple;
	bh=mA3KD3PUVorrTg8pUSETBIodjsOseISzTYIY4e13tCk=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oayxoiIO27vkvqe+T19fpQ90B8fcxgwzxCnzTItm7G2UDp0zCwh5Qc62LbD3RdD5ujoY7KQ9lxW9dQkRuM+OIB7bNsT++XjKIu628bvDI8UrRGu41exssBmjkrJCRdpTatQX8vFsQQ9kMP9MbZPaDv53nFTPlyapQF9SU1+snVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=vkO3agk7; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vkO3agk7"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542CONHa232051
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 07:24:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746188663;
	bh=bsBaMgMVIV9pKDtfbcIi9RmwwVkkoMKgBlMiHOfLv1Y=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=vkO3agk7QcCFUTpwrspnqF8oDSO+Cal/siWBnUaqwoyqqczU1JamHNddCNatrrGNe
	 UCBZDonb7rFCBKae4Tx0yfqCjXeiehMWwHY6oQw4WCc4iUhQXVpZzBvswdBxVUJY+A
	 zUFHoVAH3QPOd4lBWjoYByMXs5zHuZU5aVTz4Y8g=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542CON7K007231
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 07:24:23 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 07:24:23 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 07:24:23 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542CONdL009817;
	Fri, 2 May 2025 07:24:23 -0500
Date: Fri, 2 May 2025 07:24:23 -0500
From: Nishanth Menon <nm@ti.com>
To: Judith Mendez <jm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hari Nagalla
	<hnagalla@ti.com>,
        Beleswar Padhi <b-padhi@ti.com>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am62-main: Add PRUSS-M node
Message-ID: <20250502122423.weyvgng4s4zcjdxh@document>
References: <20250430144343.972234-1-jm@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250430144343.972234-1-jm@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 09:43-20250430, Judith Mendez wrote:
> From: Kishon Vijay Abraham I <kishon@ti.com>
> 
> Add the DT node for the PRUSS-M processor subsystem that is present
> on the K3 AM62x SoCs. The K3 AM62x family of SoC has one PRUSS-M
> instance and it has two Programmable Real-Time Units (PRU0 and PRU1).
> 
> Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
> [ Judith: Fix pruss_iclk id for pruss_coreclk_mux ]
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
> Changelog:
> - drop internal tags
> - rebase against ti-k3-dts-next
> - fix header
> 
> Link to v1:
> https://lore.kernel.org/linux-devicetree/20250108222048.818835-1-jm@ti.com/
> ---
>  arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 90 ++++++++++++++++++++++++
>  1 file changed, 90 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> index 7d355aa73ea2..ee53e663b5bd 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> @@ -1079,6 +1079,96 @@ dphy0: phy@30110000 {
>  		status = "disabled";
>  	};
>  
> +	pruss: pruss@30040000 {
> +		compatible = "ti,am625-pruss";
> +		reg = <0x00 0x30040000 0x00 0x80000>;
> +		power-domains = <&k3_pds 81 TI_SCI_PD_EXCLUSIVE>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0x00 0x30040000 0x80000>;

Should this not be default disabled? pruss needs pinmux to operate
correctly, right?

> +
> +		pruss_mem: memories@0 {
> +			reg = <0x0 0x2000>,
> +			      <0x2000 0x2000>,
> +			      <0x10000 0x10000>;
> +			reg-names = "dram0", "dram1", "shrdram2";
> +		};
> +
> +		pruss_cfg: cfg@26000 {
> +			compatible = "ti,pruss-cfg", "syscon";
> +			reg = <0x26000 0x200>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0x0 0x26000 0x2000>;
> +
> +			clocks {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				pruss_coreclk_mux: coreclk-mux@3c {
> +					reg = <0x3c>;
> +					#clock-cells = <0>;
> +					clocks = <&k3_clks 81 0>,  /* pruss_core_clk */
> +						 <&k3_clks 81 14>; /* pruss_iclk */
> +					assigned-clocks = <&pruss_coreclk_mux>;
> +					assigned-clock-parents = <&k3_clks 81 14>;
> +				};
> +
> +				pruss_iepclk_mux: iepclk-mux@30 {
> +					reg = <0x30>;
> +					#clock-cells = <0>;
> +					clocks = <&k3_clks 81 3>,	/* pruss_iep_clk */
> +						 <&pruss_coreclk_mux>;	/* pruss_coreclk_mux */
> +					assigned-clocks = <&pruss_iepclk_mux>;
> +					assigned-clock-parents = <&pruss_coreclk_mux>;
> +				};
> +			};
> +		};
> +
> +		pruss_intc: interrupt-controller@20000 {
> +			compatible = "ti,pruss-intc";
> +			reg = <0x20000 0x2000>;
> +			interrupt-controller;
> +			#interrupt-cells = <3>;
> +			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "host_intr0", "host_intr1",
> +					  "host_intr2", "host_intr3",
> +					  "host_intr4", "host_intr5",
> +					  "host_intr6", "host_intr7";
> +		};
> +
> +		pru0: pru@34000 {
> +			compatible = "ti,am625-pru";
> +			reg = <0x34000 0x3000>,
> +			      <0x22000 0x100>,
> +			      <0x22400 0x100>;
> +			reg-names = "iram", "control", "debug";
> +			firmware-name = "am62x-pru0-fw";
> +			interrupt-parent = <&pruss_intc>;
> +			interrupts = <16 2 2>;
> +			interrupt-names = "vring";
> +		};
> +
> +		pru1: pru@38000 {
> +			compatible = "ti,am625-pru";
> +			reg = <0x38000 0x3000>,
> +			      <0x24000 0x100>,
> +			      <0x24400 0x100>;
> +			reg-names = "iram", "control", "debug";
> +			firmware-name = "am62x-pru1-fw";
> +			interrupt-parent = <&pruss_intc>;
> +			interrupts = <18 3 3>;
> +			interrupt-names = "vring";
> +		};
> +	};
> +
>  	gpmc0: memory-controller@3b000000 {
>  		compatible = "ti,am64-gpmc";
>  		power-domains = <&k3_pds 80 TI_SCI_PD_EXCLUSIVE>;
> -- 
> 2.49.0
> 
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
