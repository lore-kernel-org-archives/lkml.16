Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E878F77;
	Sat, 19 Apr 2025 16:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745079349; cv=none; b=WOX9rSn6r7cDEP1iEjbdeVK6SiCIhEPcN1CGG9F7RyK+xHLukfsDQkASCPtlVUPYfhDCA/B+OFar2ItON7vtHUT6vgXlnPdvz2KN+bGXqiY1SeGBPIDgd2hz1ssFPPTBnZ9Q/y/u2Tw31F1ytV1pVFbn34ckYMQAw97dWveRU5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745079349; c=relaxed/simple;
	bh=Cmo2UhTaXsgRgiUjO3fcZDWhOPOsuWohkxEDQ85u2eA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Y4Sff0OSbA7dKv29oUNCXgCUs/EqfK+vZ6Wx//faaXyK+0jNSL1y8F0M7Te29fG7eKYuQqgvO2a6vPwAs2qNGHFG4vUcVRTDMt0iJpamahmr4/VmyHVTxL/Ha4rFT/VKbR8lr4CUaWGzP8M89/c0rhx4GmSC9n+iUnClbb6Slys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=kAyMGADY; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kAyMGADY"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53JGFajR524814
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 19 Apr 2025 11:15:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745079336;
	bh=buWGzw4SE9V2hN3R6H8rNumoiIUsgBjz7GkDcf7R8Fg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=kAyMGADYTNjGpP9Ph+/+fvtINwW9fYM2IuO+uLJjEQqVCiM1Mbe0H7btQu+utg0eo
	 Slo8+BnxrqUCEQe2u1oif0FT58DxggVsDUqZh5X+n6LOpjORgURXLY9w6OV+4lmr8T
	 79qUPI83/UCjAJALiBmMZiOfydkCFzWOZ6ihBwt0=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53JGFaZI092901
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 19 Apr 2025 11:15:36 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 19
 Apr 2025 11:15:34 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 19 Apr 2025 11:15:35 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53JGFU4H086384;
	Sat, 19 Apr 2025 11:15:30 -0500
Message-ID: <8017c015-73aa-4807-a177-d5391e073981@ti.com>
Date: Sat, 19 Apr 2025 21:45:29 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: ti: k3-j721s2: Add GPU node
To: Matt Coster <matt.coster@imgtec.com>, Nishanth Menon <nm@ti.com>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Frank Binns <frank.binns@imgtec.com>,
        Alessio
 Belle <alessio.belle@imgtec.com>,
        Alexandru Dadu <alexandru.dadu@imgtec.com>,
        Luigi Santivetti <luigi.santivetti@imgtec.com>,
        Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>,
        <u-kumar1@ti.com>
References: <20250417-bxs-4-64-dts-v2-0-9f8c09233114@imgtec.com>
 <20250417-bxs-4-64-dts-v2-2-9f8c09233114@imgtec.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250417-bxs-4-64-dts-v2-2-9f8c09233114@imgtec.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello Matt,

On 4/17/2025 2:40 PM, Matt Coster wrote:
> The J721S2 binding is based on the TI downstream binding in commit
> 54b0f2a00d92 ("arm64: dts: ti: k3-j721s2-main: add gpu node") from [1]
> but with updated compatible strings.

Downstream kernel[1] sha 5657fc069e8b3 ("PENDING: arm64: dts: ti: 
k3-j721s2-main: add gpu node")

also has assigned-clock-rates.

Please check if gpu node needs assigned-rate too.


> The clock[2] and power[3] indices were verified from HTML docs, while
> the intterupt index comes from the TRM[4] (appendix
> "J721S2_Appendix_20241106_Public.xlsx", "Interrupts (inputs)",
> "GPU_BXS464_WRAP0_GPU_SS_0_OS_IRQ_OUT_0").

> [1]: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel
> [2]: https://downloads.ti.com/tisci/esd/latest/5_soc_doc/j721s2/clocks.html
> [3]: https://downloads.ti.com/tisci/esd/latest/5_soc_doc/j721s2/devices.html
> [4]: https://www.ti.com/lit/zip/spruj28 (revision E)
>
> Reviewed-by: Randolph Sapp <rs@ti.com>
> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> ---
> Changes in v2:
> - Add interrupt reference details
> - Add Randolph's Rb
> - Link to v1: https://lore.kernel.org/r/20250415-bxs-4-64-dts-v1-2-f7d3fa06625d@imgtec.com
>
> This patch was previously sent as [DO NOT MERGE]:
> https://lore.kernel.org/r/20250410-sets-bxs-4-64-patch-v1-v6-18-eda620c5865f@imgtec.com
> ---
>   arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
> index 92bf48fdbeba45ecca8c854db5f72fd3666239c5..a79ac41b2c1f51b7193e6133864428bd35a5e835 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
> @@ -2048,4 +2048,16 @@ watchdog8: watchdog@23f0000 {
>   		/* reserved for MAIN_R5F1_1 */
>   		status = "reserved";
>   	};
> +
> +	gpu: gpu@4e20000000 {
> +		compatible = "ti,j721s2-gpu", "img,img-bxs-4-64", "img,img-rogue";
> +		reg = <0x4e 0x20000000 0x00 0x80000>;
> +		clocks = <&k3_clks 130 1>;
> +		clock-names = "core";
> +		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
> +		power-domains = <&k3_pds 130 TI_SCI_PD_EXCLUSIVE>,
> +				<&k3_pds 373 TI_SCI_PD_EXCLUSIVE>;
> +		power-domain-names = "a", "b";
> +		dma-coherent;
> +	};
>   };
>
