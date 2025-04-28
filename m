Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7760B27935F;
	Mon, 28 Apr 2025 16:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745857461; cv=none; b=BofYacpVOdaChGaBNY/b2RYWK61HXJLQLUIP/LyUlmUicMpagQh4Rgd6b1ypD8qCwivBKSimAWxtfi2PsNuXMy8lBa7boo6NhF4qaPxG1DxmaAMBbtWT/SzwtnDKrJHDxqr5SSK73IlQpCvA540u6mRUCNhVKuzTeJQ+GtrO9mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745857461; c=relaxed/simple;
	bh=CHBCp6cdsJoZymwJjoigCt9VlbbXnAa9bSNchk1wmqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qj6LUSVC4KPcPTd1/Vd9vdYgYEY3/9jaUgaWi9iHjvopWCEJcBQEKl1dpYP5IMP1/Fx7YdlMaIZkc6XuAE3JsA0oouLgjM5xhYzYCq/iuM7sC4AtJRaWfVjpv9DkxaVxpTa0ctz/XGdwLNF1wflMgEF5uRCrhPMy27iren1YHgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=BPDZRIut; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BPDZRIut"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53SGOCqJ2821103
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 11:24:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745857452;
	bh=pLCRaOu6Tt3QIEat0TyIkyelowGCiPWKGTNSyRo/nPE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=BPDZRIutC8V4ELh+wV6b8dCune1mLxqJ2gVOwKmJ58FO2WOuRKvinMXHUI91+rEJF
	 7upqnTaJpw5Q6Z+twKycCmru6wZ6qzJb7kkMfKCuFPwfflNzjIIVETWsprTrvxwLG+
	 Rg37T5jK54Q3TIGJIq2jQfu9j4gT3b3VJoxUUH3w=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53SGOCPL028905
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Apr 2025 11:24:12 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Apr 2025 11:24:12 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Apr 2025 11:24:12 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53SGOB4S127609;
	Mon, 28 Apr 2025 11:24:11 -0500
Message-ID: <f8424c7e-e778-4140-9cf9-83f43cef1a04@ti.com>
Date: Mon, 28 Apr 2025 11:24:11 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/11] arm64: dts: ti: k3-am62x-sk-common: Enable IPC
 with remote processors
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hari Nagalla <hnagalla@ti.com>,
        Beleswar
 Prasad <b-padhi@ti.com>,
        Markus Schneider-Pargmann <msp@baylibre.com>,
        Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>
References: <20250415153147.1844076-1-jm@ti.com>
 <20250415153147.1844076-9-jm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250415153147.1844076-9-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 4/15/25 10:31 AM, Judith Mendez wrote:
> From: Hari Nagalla <hnagalla@ti.com>
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

Acked-by: Andrew Davis <afd@ti.com>

>   .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 34 ++++++++++++++++---
>   1 file changed, 29 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
> index d52cb2a5a589a..364b2ba6af958 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
> @@ -70,6 +70,18 @@ mcu_m4fss_memory_region: m4f-memory@9cc00000 {
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
> @@ -82,11 +94,6 @@ secure_ddr: optee@9e800000 {
>   			no-map;
>   		};
>   
> -		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9db00000 {
> -			compatible = "shared-dma-pool";
> -			reg = <0x00 0x9db00000 0x00 0xc00000>;
> -			no-map;
> -		};
>   	};
>   
>   	leds {
> @@ -476,10 +483,17 @@ cpsw3g_phy0: ethernet-phy@0 {
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
>   &mcu_m4fss {
> @@ -489,6 +503,16 @@ &mcu_m4fss {
>   	status = "okay";
>   };
>   
> +&wkup_r5fss0 {
> +	status = "okay";
> +};
> +
> +&wkup_r5fss0_core0 {
> +	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
> +	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
> +			<&wkup_r5fss0_core0_memory_region>;
> +};
> +
>   &usbss0 {
>   	bootph-all;
>   	status = "okay";
