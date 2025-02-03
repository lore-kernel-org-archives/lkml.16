Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D33200116;
	Mon,  3 Feb 2025 22:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738623220; cv=none; b=aeXoU99cRyVG2oCMFc+g72h90beJJx1uIpCYkXgvSl2ibh7aj4Kd3HTqueZ1/OWFrXgl1p44TYih9OtawWYBiK85GyearOsBK8MYdKRgYdjP/e/W/54aqKDsRpjWrty3kFaBNOYNtDdDjHYGnbnsAOsCgF2Oi+MxGZCIbRGt/0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738623220; c=relaxed/simple;
	bh=Cbey1tNgJkzVNd+C2khjkxAXwlI4IoMpX1zx9KBeNts=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AZO5RNaqzCOic2oiDDGKGQlqAqoV6yBOIWrBRu9793YZU/gFYrKFfbz0UTcnb1FriM7bBIInheQ5o4HBzx4Q4PpxrhZIss0B3Q8loyJhfDC2SDu+OWxEoYyMqWu8HMBW5+F0qAD/qxrk54rOaF78SGFNtdmlvwRWoAjg6JR1H3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=OuPIgu/f; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OuPIgu/f"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 513MrUKY2282347
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 3 Feb 2025 16:53:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738623210;
	bh=7HSxTPHvZylEc2Qtms+g0hXLaiufClLhSA9EWwBglHg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=OuPIgu/fvCEMpUVJA6aeEAR5GhEf9hJJ1MWjjq3gZBmScbtM7Dguq/+ICw69c974P
	 igxqVqNJOZjzuguiJAWixcg9RgtIE61tfY9jvMd0sYrYOCe2rWUImnGkqCAx+EEwkK
	 iLcj5iHWXwd7UYQ1mLCcKaFIHtr+shwoF3nkYMFY=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 513MrUlt091988;
	Mon, 3 Feb 2025 16:53:30 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Feb 2025 16:53:30 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Feb 2025 16:53:29 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 513MrTUD008582;
	Mon, 3 Feb 2025 16:53:29 -0600
Message-ID: <0ab5c5ec-cde3-41f1-8adf-2419b31497c1@ti.com>
Date: Mon, 3 Feb 2025 16:53:29 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] arm64: dts: ti: k3-am62a7-sk: Enable ipc with
 remote processors
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hari Nagalla
	<hnagalla@ti.com>
References: <20250131214611.3288742-1-jm@ti.com>
 <20250131214611.3288742-6-jm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250131214611.3288742-6-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 1/31/25 3:46 PM, Judith Mendez wrote:
> From: Devarsh Thakkar <devarsht@ti.com>
> 
> For each remote proc, reserve memory for IPC and bind the mailbox
> assignments. Two memory regions are reserved for each remote processor.
> The first region of 1MB of memory is used for Vring shared buffers
> and the second region is used as external memory to the remote processor
> for the resource table and for tracebuffer allocations.
> 
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
> Changes since v1:
> - add patches 5-9 to enable ipc and complete device nodes
> ---
>   arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 78 +++++++++++++++++++++++++
>   1 file changed, 78 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> index a6f0d87a50d8a..6f4b037537fec 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> @@ -61,11 +61,41 @@ secure_ddr: optee@9e800000 {
>   			no-map;
>   		};
>   
> +		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9c800000 0x00 0x100000>;
> +			no-map;
> +		};
> +
>   		wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
>   			compatible = "shared-dma-pool";
>   			reg = <0x00 0x9c900000 0x00 0x01e00000>;
>   			no-map;
>   		};
> +
> +		mcu_r5fss0_core0_dma_memory_region: r5f-dma-memory@9b800000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9b800000 0x00 0x100000>;
> +			no-map;
> +		};
> +
> +		mcu_r5fss0_core0_memory_region: r5f-dma-memory@9b900000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9b900000 0x00 0x0f00000>;

There is a leading 0 here and in a couple other places.

s/0x0f00000/0xf00000

> +			no-map;
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
> +			reg = <0x00 0x99900000 0x00 0x01f00000>;

0x01f00000 ? What is this size, all other firmware in all other
K3 use 0xf00000 (16MB), that should be enough for any sane firmware.
If some firmware needs more it is probably doing something hacky
like leaving space for buffer passing internally. That space should
be provided from a shared dma-buf pool or similar mechanism.

Make this 0xf00000 and fix the firmware.

Andrew

> +			no-map;
> +		};
>   	};
>   
>   	opp-table {
> @@ -737,3 +767,51 @@ dpi1_out: endpoint {
>   		};
>   	};
>   };
> +
> +&mailbox0_cluster0 {
> +	mbox_r5_0: mbox-r5-0 {
> +		ti,mbox-rx = <0 0 0>;
> +		ti,mbox-tx = <1 0 0>;
> +	};
> +};
> +
> +&mailbox0_cluster1 {
> +	mbox_c7x_0: mbox-c7x-0 {
> +		ti,mbox-rx = <0 0 0>;
> +		ti,mbox-tx = <1 0 0>;
> +	};
> +};
> +
> +&mailbox0_cluster2 {
> +	mbox_mcu_r5_0: mbox-mcu-r5-0 {
> +		ti,mbox-rx = <0 0 0>;
> +		ti,mbox-tx = <1 0 0>;
> +	};
> +};
> +
> +&wkup_r5fss0 {
> +	status = "okay";
> +};
> +
> +&wkup_r5fss0_core0 {
> +	mboxes = <&mailbox0_cluster0>, <&mbox_r5_0>;
> +	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
> +		<&wkup_r5fss0_core0_memory_region>;
> +};
> +
> +&mcu_r5fss0 {
> +	status = "okay";
> +};
> +
> +&mcu_r5fss0_core0 {
> +	mboxes = <&mailbox0_cluster2>, <&mbox_mcu_r5_0>;
> +	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
> +			<&mcu_r5fss0_core0_memory_region>;
> +};
> +
> +&c7x_0 {
> +	mboxes = <&mailbox0_cluster1>, <&mbox_c7x_0>;
> +	memory-region = <&c7x_0_dma_memory_region>,
> +			<&c7x_0_memory_region>;
> +	status = "okay";
> +};
