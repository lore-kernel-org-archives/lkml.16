Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D359B22D790;
	Tue,  6 May 2025 14:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746541260; cv=none; b=Ym2XqhK5gtQli9GwjdzG2c58fMQ5hqVW1UspZ7SKr1OkoyjN2hvvj60MF5kW1I1qqU2cez1MLhHZDfwOj9bGb1M+okdO2Ce4Hje0f6lCaTj3JHpFSYrKigEPFEdLbDPdjYkVaMtBc0qv5XLxOhzJhi0jT5KE7JzSImCoML+J/NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746541260; c=relaxed/simple;
	bh=ib/YOnEc7gj+AkNBN57FooheBSBL8SXMOoeixm0jhWA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pVKwg0rAh803LKTSw2FEVQFSdWtT1SUVqf728QYCGFGOLC2wNyiaKZ1CSXBBMgnaabUa2MxfG+00Gj8IvailTplP6yTbAi3CHpyPqiA6bPkOiB+/iEebPTf+rWvL/rqNfiUhuCNFryv+VyxUqVHBENQy1zsZTPuNZoh/eZQ5e+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=uWRmYS2k; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uWRmYS2k"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 546EKlqT520569
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 May 2025 09:20:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746541247;
	bh=XwFxSS6/0etFSYGRDk49i+vv0sGzyJkpooN2+dhNmek=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=uWRmYS2kcd1ZnrEn9vFIhYXxpWKNmBXhKhWwUX1I3R+l854ZjL9Sds8WRDalA615M
	 53zKqJURtekMsaKqJ4MIlFtlc73pe2ShurCmtpXyafn1YAVwnTAvtQSSbKohqrVfBv
	 wYF9t/hTXpZDzeAsEQ+SQJfB7+JFLNNlNJKqgyjc=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 546EKl6S021374
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 May 2025 09:20:47 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 May 2025 09:20:46 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 May 2025 09:20:46 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 546EKk23114438;
	Tue, 6 May 2025 09:20:46 -0500
Message-ID: <8ffefea3-e458-4a9e-968b-89b7541d3b5e@ti.com>
Date: Tue, 6 May 2025 09:20:46 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: ti: k3-am62a-phycore-som: Enable
 Co-processors
To: Daniel Schultz <d.schultz@phytec.de>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <upstream@lists.phytec.de>, <w.egorov@phytec.de>
References: <20250506133604.294920-1-d.schultz@phytec.de>
 <20250506133604.294920-3-d.schultz@phytec.de>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250506133604.294920-3-d.schultz@phytec.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 5/6/25 8:36 AM, Daniel Schultz wrote:
> For every remote processor, set up dedicated memory regions and
> associate the required mailbox channels. Allocate two memory areas
> per remote core: one 1MB region for vring shared buffers, and
> another for external memory used by the remote processor for its
> resource table and trace buffer.
> 
> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
> ---
>   .../boot/dts/ti/k3-am62a-phycore-som.dtsi     | 96 +++++++++++++++++--
>   1 file changed, 90 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
> index 147d56b87984..049aa358e796 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
> @@ -59,6 +59,42 @@ linux,cma {
>   			linux,cma-default;
>   		};
>   
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
>   		secure_tfa_ddr: tfa@9e780000 {
>   			reg = <0x00 0x9e780000 0x00 0x80000>;
>   			alignment = <0x1000>;
> @@ -70,12 +106,6 @@ secure_ddr: optee@9e800000 {
>   			alignment = <0x1000>;
>   			no-map;
>   		};
> -
> -		wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
> -			compatible = "shared-dma-pool";
> -			reg = <0x00 0x9c900000 0x00 0x01e00000>;
> -			no-map;
> -		};
>   	};
>   
>   	vcc_5v0_som: regulator-vcc-5v0-som {
> @@ -170,6 +200,13 @@ AM62AX_IOPAD(0x1f4, PIN_INPUT, 0) /* (D16) EXTINTn */
>   	};
>   };
>   
> +&c7x_0 {
> +	mboxes = <&mailbox0_cluster1>, <&mbox_c7x_0>;
> +	memory-region = <&c7x_0_dma_memory_region>,
> +			<&c7x_0_memory_region>;
> +	status = "okay";
> +};
> +
>   &cpsw3g {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&main_rgmii1_pins_default>;
> @@ -200,6 +237,33 @@ &fss {
>   	status = "okay";
>   };
>   
> +&mailbox0_cluster0 {
> +	status = "okay";
> +
> +	mbox_r5_0: mbox-r5-0 {
> +		ti,mbox-rx = <0 0 0>;
> +		ti,mbox-tx = <1 0 0>;
> +	};
> +};
> +
> +&mailbox0_cluster1 {
> +	status = "okay";
> +
> +	mbox_c7x_0: mbox-c7x-0 {
> +		ti,mbox-rx = <0 0 0>;
> +		ti,mbox-tx = <1 0 0>;
> +	};
> +};
> +
> +&mailbox0_cluster2 {
> +	status = "okay";
> +
> +	mbox_mcu_r5_0: mbox-mcu-r5-0 {
> +		ti,mbox-rx = <0 0 0>;
> +		ti,mbox-tx = <1 0 0>;
> +	};
> +};
> +
>   &main_i2c0 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&main_i2c0_pins_default>;
> @@ -315,6 +379,16 @@ &main_pktdma {
>   	bootph-all;
>   };
>   
> +&mcu_r5fss0 {
> +	status = "okay";
> +};
> +
> +&mcu_r5fss0_core0 {
> +	mboxes = <&mailbox0_cluster2>, <&mbox_mcu_r5_0>;

These mboxes items should be combined as they are both part of a single
two-element item, not a big deal for now as the output DTB is the same,

Reviewed-by: Andrew Davis <afd@ti.com>

> +	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
> +			<&mcu_r5fss0_core0_memory_region>;
> +};
> +
>   &ospi0 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&ospi0_pins_default>;
> @@ -343,3 +417,13 @@ &sdhci0 {
>   	bootph-all;
>   	status = "okay";
>   };
> +
> +&wkup_r5fss0 {
> +	status = "okay";
> +};
> +
> +&wkup_r5fss0_core0 {
> +	mboxes = <&mailbox0_cluster0>, <&mbox_r5_0>;
> +	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
> +			<&wkup_r5fss0_core0_memory_region>;
> +};
