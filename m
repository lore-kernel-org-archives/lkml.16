Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63FC2185AC;
	Thu, 26 Jun 2025 06:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750919214; cv=none; b=aEzfD57g1bpDHAtVkI4Iu7SA/3kNfgf9oL5N6dD/xmhc6jCzMgtyVMjNvYvVCLGTG3b+jhM+ojcrP0oKZPKtrC1KWOxlw6JBjBRS86HLLVzTCAS/CRqpbllHsz8KMYV7tyE2dySeIYc27pqPajRflu3Uj1LaiFx3RSCULrDQPjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750919214; c=relaxed/simple;
	bh=II1Ir5NR+QRoI3IRUlyDEzWlYvURoigZ+NWr9nLVGgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nKAVMsj1scSdFl6Y9kvE1+HPM0LsBvlvKRIpqW62YjLOWB4YdHBxM/u4gYe0/xJIE42558OLNSIwVoXe9B4zJEc3iouqDX7OJEzTCZYJHBcY8fieV/oQbOFBCrIVm64YHEW1pUFr31+4AWjS+xPfcPRZbnvUUF/Pq/EzGFvCh68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=PVvC2kM3; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PVvC2kM3"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55Q6QkoM1660090;
	Thu, 26 Jun 2025 01:26:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750919206;
	bh=M0QB/ArAtecVdowUteC5U8rjZZ9tDnr2B5EWNpTbhxo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=PVvC2kM3h80BGzcV6LCzJiIka5x7oLOpmH70dB69hek2zkcy+ep+3ZC29a2KNN3l2
	 vjyR4zEJHzth/wvVQ9FL/m2hdveG49AF5IMTqZ2TlPkKT1Olyg1N8HcR4uQd1ppeSy
	 DGAnkyuh1PjKcgYSHBLJtC1A5GjBDFtCMgoYn/iI=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55Q6Qktd3374631
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 26 Jun 2025 01:26:46 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 26
 Jun 2025 01:26:46 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 26 Jun 2025 01:26:46 -0500
Received: from [172.24.227.245] (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55Q6QgrU520141;
	Thu, 26 Jun 2025 01:26:43 -0500
Message-ID: <ed2ccf14-b470-4f3e-a793-61866cf7e26c@ti.com>
Date: Thu, 26 Jun 2025 11:56:42 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] arm64: dts: ti: k3-j784s4-j742s2-main-common: add
 DSI & DSI PHY
To: Jayesh Choudhary <j-choudhary@ti.com>, <nm@ti.com>,
        <devicetree@vger.kernel.org>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <u-kumar1@ti.com>
References: <20250624082619.324851-1-j-choudhary@ti.com>
 <20250624082619.324851-2-j-choudhary@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20250624082619.324851-2-j-choudhary@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi

On 24/06/25 13:56, Jayesh Choudhary wrote:
> Add DT nodes for DPI to DSI Bridge and DSI Phy.
> The DSI bridge is Cadence DSI and the PHY is a
> Cadence DPHY with TI wrapper.
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>  .../dts/ti/k3-j784s4-j742s2-main-common.dtsi  | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> index 363d68fec387..2413c4913a8b 100644
> --- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> @@ -2517,6 +2517,43 @@ watchdog18: watchdog@2550000 {
>  		status = "reserved";
>  	};
>  
> +	dphy_tx0: phy@4480000 {
> +		compatible = "ti,j721e-dphy";
> +		reg = <0x0 0x04480000 0x0 0x1000>;

Follow the convention of the file. Use:

		reg = <0x00 0x04480000 0x00 0x1000>;

Please fix throughout the series.

> +		clocks = <&k3_clks 402 20>, <&k3_clks 402 3>;
> +		clock-names = "psm", "pll_ref";
> +		#phy-cells = <0>;
> +		power-domains = <&k3_pds 402 TI_SCI_PD_EXCLUSIVE>;
> +		assigned-clocks = <&k3_clks 402 3>;
> +		assigned-clock-parents = <&k3_clks 402 4>;
> +		assigned-clock-rates = <19200000>;
> +		status = "disabled";
> +	};
> +
> +	dsi0: dsi@4800000 {
> +		compatible = "ti,j721e-dsi";
> +		reg = <0x0 0x04800000 0x0 0x100000>, <0x0 0x04710000 0x0 0x100>;
> +		clocks = <&k3_clks 215 2>, <&k3_clks 215 5>;
> +		clock-names = "dsi_p_clk", "dsi_sys_clk";
> +		power-domains = <&k3_pds 215 TI_SCI_PD_EXCLUSIVE>;

> +		interrupt-parent = <&gic500>;

This is implied and can be dropped.

> +		interrupts = <GIC_SPI 600 IRQ_TYPE_LEVEL_HIGH>;
> +		phys = <&dphy_tx0>;
> +		phy-names = "dphy";
> +		status = "disabled";
> +
> +		dsi0_ports: ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			port@0 {
> +				reg = <0>;
> +			};
> +			port@1 {
> +				reg = <1>;
> +			};
> +		};
> +	};
> +
>  	mhdp: bridge@a000000 {
>  		compatible = "ti,j721e-mhdp8546";
>  		reg = <0x0 0xa000000 0x0 0x30a00>,

-- 
Regards
Vignesh
https://ti.com/opensource

