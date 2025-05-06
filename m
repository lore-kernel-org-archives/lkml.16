Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7233415E5DC;
	Tue,  6 May 2025 14:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746541024; cv=none; b=kMfrQg75Ct/ueRqdjzU5XCW55lE5/r3w5AO3NdrgweicC6knUavP+eXrqkqlQRvjJNNJsMvbjRjHy0f6gpSXOmbeooDBGxA1W2lCxp+h8SWui4iG7J9tU8DIJ9hIJhe+2/b3+VLwl0DISAAQFAXjAg3888a3wAdwgKguCzjFPYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746541024; c=relaxed/simple;
	bh=RR40BhlGIflZAiH8OFxXICiwwKql1UvoZGo4oKCp7ws=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fsD3fbNDbuGvdBQK9QvvjGrFNPSFO6IoKGBoKyJhNg+3PTDq9G5JTEU3+C69USaMnwrXN6fTHs2TiEk6w+t1/C0lDPDblQt5ZB3hfD3+9pLP7dD4f7Fy/uYOTxo7kCz+dE5gfmwps8IfBCr/r4FlElYIXNR0/VHky4E0W/8bviM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=mB4KK8ZA; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="mB4KK8ZA"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 546EGhR61246333
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 May 2025 09:16:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746541003;
	bh=SQ4xo6hk5l/bcEXtSDFBnMutbh2T1oPpRjR/kXjFglk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=mB4KK8ZA3KAIIn1uQKNCKdBQR2FhuT5QQq3ab+bF6hahaGoEJ7dC19Kb4H3EG+4eo
	 xTmng2OhesH+aCbOhw7N8icM7cPG1OXXtv7tG3mnJJuOzcuiARICMjUD2z7CL2c4I1
	 fA6dYHjnQtnTmI3BFWt2Xz5dKelU7SY/Evynx6yo=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 546EGhH4018807
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 May 2025 09:16:43 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 May 2025 09:16:43 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 May 2025 09:16:43 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 546EGgNe110067;
	Tue, 6 May 2025 09:16:42 -0500
Message-ID: <b366f989-3eb5-4716-8dfc-d8f6ce961296@ti.com>
Date: Tue, 6 May 2025 09:16:42 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: ti: k3-am62-phycore-som: Enable
 Co-processors
To: Daniel Schultz <d.schultz@phytec.de>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <upstream@lists.phytec.de>
References: <20250506115502.3515599-1-d.schultz@phytec.de>
 <20250506115502.3515599-2-d.schultz@phytec.de>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250506115502.3515599-2-d.schultz@phytec.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 5/6/25 6:54 AM, Daniel Schultz wrote:
> For every remote processor, set up dedicated memory regions and
> associate the required mailbox channels. Allocate two memory areas
> per remote core: one 1MB region for vring shared buffers, and
> another for external memory used by the remote processor for its
> resource table and trace buffer.
> 
> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
> ---

Reviewed-by: Andrew Davis <afd@ti.com>

>   .../boot/dts/ti/k3-am62-phycore-som.dtsi      | 35 +++++++++++++++----
>   1 file changed, 29 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
> index 2ef4cbaec789..71d165a7abe0 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
> @@ -57,6 +57,18 @@ mcu_m4fss_memory_region: m4f-memory@9cc00000 {
>   			no-map;
>   		};
>   
> +		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9da00000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9da00000 0x00 0x100000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_memory_region: r5f-memory@9db00000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9db00000 0x00 0xc00000>;
> +			no-map;
> +		};
> +
>   		secure_tfa_ddr: tfa@9e780000 {
>   			reg = <0x00 0x9e780000 0x00 0x80000>;
>   			alignment = <0x1000>;
> @@ -68,12 +80,6 @@ secure_ddr: optee@9e800000 {
>   			alignment = <0x1000>;
>   			no-map;
>   		};
> -
> -		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9db00000 {
> -			compatible = "shared-dma-pool";
> -			reg = <0x00 0x9db00000 0x00 0x00c00000>;
> -			no-map;
> -		};
>   	};
>   
>   	vcc_5v0_som: regulator-vcc-5v0-som {
> @@ -226,10 +232,17 @@ cpsw3g_phy1: ethernet-phy@1 {
>   };
>   
>   &mailbox0_cluster0 {
> +	status = "okay";
> +
>   	mbox_m4_0: mbox-m4-0 {
>   		ti,mbox-rx = <0 0 0>;
>   		ti,mbox-tx = <1 0 0>;
>   	};
> +
> +	mbox_r5_0: mbox-r5-0 {
> +		ti,mbox-rx = <2 0 0>;
> +		ti,mbox-tx = <3 0 0>;
> +	};
>   };
>   
>   &main_i2c0 {
> @@ -365,3 +378,13 @@ &sdhci0 {
>   	non-removable;
>   	status = "okay";
>   };
> +
> +&wkup_r5fss0 {
> +	status = "okay";
> +};
> +
> +&wkup_r5fss0_core0 {
> +	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
> +	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
> +			<&wkup_r5fss0_core0_memory_region>;
> +};
