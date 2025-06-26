Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D613422DA1F;
	Thu, 26 Jun 2025 06:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750919284; cv=none; b=WGo1rtm9jUEdxGdn7skVqLwgGtVz3QT6eLw/2MbexetEIaVSW3V/RRfCTO9fzhKQqTJFjUSSbgbm0K+yRAWK3tdH0SLKWEJpXVIXSSJf16SUFEZOk2FQTUtk0rA9AZS7+QJrdTMEQKCSBpAKBS8ulHDVWn1i8GVWVQ1uZyk7FOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750919284; c=relaxed/simple;
	bh=/PCeusqfJJty0TGQN+muWHUI9Rd+Wus1EVo/E+R5IJ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MSXheZsDc0Kyl3q7yYNhf9K37fkOH2mUi8p8hbCJwr7hEQT12m7WSJWIzH2jovUi8IUwGbRI5rkqMAQDANcgl8RbZKaQkgTSdT1kOw4joRJ2itzTNkEFK7wSROEUhKtlRfzIvFdvyhCTEIgrEq2JNLXaiUT12urhPptZ+sw3WRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=tR/E59jX; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="tR/E59jX"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55Q6RvsK1660212;
	Thu, 26 Jun 2025 01:27:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750919278;
	bh=3EDX4H5WxxN56BaDRD3fEcV20AEstU4Q3AaPPTiQsak=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=tR/E59jXh1lZmQ+On0WGiCRCCxtMqCLw0C8kCZQiXrIyPx11l8s0XtKVFwEPQsEd6
	 lYUT6HaF6OkB9UtLqfIisM4MM5W86k5gKp47+R6fdl4OAevdDfBlkDlq4d+phdkIDI
	 fuqWg1H0MaWDn88+jVmd2goZ5luI3NXeJ9KaMb9g=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55Q6RvJV3375310
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 26 Jun 2025 01:27:57 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 26
 Jun 2025 01:27:57 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 26 Jun 2025 01:27:57 -0500
Received: from [172.24.227.245] (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55Q6RrJb521448;
	Thu, 26 Jun 2025 01:27:54 -0500
Message-ID: <8c7f70eb-b64c-408d-816f-9adc997e42ec@ti.com>
Date: Thu, 26 Jun 2025 11:57:54 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] arm64: dts: ti: k3-j721s2-main: add DSI & DSI PHY
To: Jayesh Choudhary <j-choudhary@ti.com>, <nm@ti.com>,
        <devicetree@vger.kernel.org>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <u-kumar1@ti.com>
References: <20250624082619.324851-1-j-choudhary@ti.com>
 <20250624082619.324851-4-j-choudhary@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20250624082619.324851-4-j-choudhary@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea



On 24/06/25 13:56, Jayesh Choudhary wrote:
> From: Rahul T R <r-ravikumar@ti.com>
> 
> Add DT nodes for DPI to DSI Bridge and DSI Phy.
> The DSI bridge is Cadence DSI and the PHY is a
> Cadence DPHY with TI wrapper.
> 
> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> [j-choudhary@ti.com: disable dsi and dphy nodes, rename dphy node]
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
> index 83cf0adb2cb7..e17fffc36248 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
> @@ -1795,6 +1795,43 @@ main_spi7: spi@2170000 {
>  		status = "disabled";
>  	};
>  
> +	dphy_tx0: phy@4480000 {
> +		compatible = "ti,j721e-dphy";
> +		reg = <0x0 0x04480000 0x0 0x1000>;
> +		clocks = <&k3_clks 363 8>, <&k3_clks 363 14>;
> +		clock-names = "psm", "pll_ref";
> +		#phy-cells = <0>;
> +		power-domains = <&k3_pds 363 TI_SCI_PD_EXCLUSIVE>;
> +		assigned-clocks = <&k3_clks 363 14>;
> +		assigned-clock-parents = <&k3_clks 363 15>;
> +		assigned-clock-rates = <19200000>;
> +		status = "disabled";
> +	};
> +
> +	dsi0: dsi@4800000 {
> +		compatible = "ti,j721e-dsi";
> +		reg = <0x0 0x04800000 0x0 0x100000>, <0x0 0x04710000 0x0 0x100>;
> +		clocks = <&k3_clks 154 4>, <&k3_clks 154 1>;
> +		clock-names = "dsi_p_clk", "dsi_sys_clk";
> +		power-domains = <&k3_pds 154 TI_SCI_PD_EXCLUSIVE>;
> +		interrupt-parent = <&gic500>;
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

Messed up indentation

> +		};
> +	};
> +
>  	dss: dss@4a00000 {
>  		compatible = "ti,j721e-dss";
>  		reg = <0x00 0x04a00000 0x00 0x10000>, /* common_m */

-- 
Regards
Vignesh
https://ti.com/opensource

