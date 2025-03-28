Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07CBDDC5;
	Fri, 28 Mar 2025 16:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743178354; cv=none; b=YzOW9gQu0s8AXkV66PurOkLjZAHL5k7ECmGFd7VQwMGSAb1gcrj7ADk1E8aPF138ZTPZs4QIgtdZjhREvEKoO/p0qIG/KcSRDiYcunn3fmnxMYQLeZOeUKmsU1bmnIhwICBS5nrp07dyTZl729f1Z95GV92sIUvYqj9X/rxDC04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743178354; c=relaxed/simple;
	bh=OPcIHkJ6/fJcSNQE3AKAdHTn55RfuZKxqc9gDmE3/vA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KX2fBmggSfqkl9kO6IG4EiZ+qLNsubh3wyWx+UgnUCj7BC6hZ//b5wpqc5JVsNzjGhLaOx2Ak7JwvlN0XTC0bDGsEvbu0GrWAp71syBZCLCVNDol1aqiWswO17MV23t7MDJ7SradiUkr0Kj9aVipR5G8OEMzvHvAef0f0EIVjDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=IRxQNM2G; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="IRxQNM2G"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52SGCOb82157906
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Mar 2025 11:12:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743178344;
	bh=Xm+K+6QmdL1evz0mZ+yxfUZCcJu7K/29bMYYiqKxrYY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=IRxQNM2GHazCM297qQAzmRK5Bwcmac90pPrtqSN8J3xne9c6/htIbghNikNm8f+g0
	 bzl34txTmTuWk7dKIphRFvFDCToQzQRAvHfH6RYZ5h3FPRBpBEe1DZsHdTm29pamXa
	 HmUZOHZ07kwXpAnw67iBsXRKWfyaB7gNwGCEOqIg=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52SGCOmf128593
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 28 Mar 2025 11:12:24 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 28
 Mar 2025 11:12:24 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 28 Mar 2025 11:12:24 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52SGCKTc088176;
	Fri, 28 Mar 2025 11:12:21 -0500
Message-ID: <837cba5f-f49e-4cbf-9cbe-2b25f7c9d4b8@ti.com>
Date: Fri, 28 Mar 2025 21:42:19 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am62p-j722s: add rng node
To: Michael Walle <mwalle@kernel.org>, Nishanth Menon <nm@ti.com>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
References: <20250313144155.2382316-1-mwalle@kernel.org>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250313144155.2382316-1-mwalle@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello Michael

Thanks for patch

On 3/13/2025 8:11 PM, Michael Walle wrote:
> Add the node for the random number generator inside the crypto module.
>
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
> This was tested on a J722S/AM67A. Also, according to the TRM this is the

Could you re-confirm please , after adding this node.  you selected trng 
offered by Linux


> MCU instance of the SA3UL. But it's defined in -main.dtsi. Is this
> correct?

Yes this is correct,

please refer

https://www.ti.com/lit/zip/sprujb3  SPRUJB3A.pdf

table 2.1 Main Memory map, this node falls under main domain

> ---
>   arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> index 6e3beb5c2e01..e868e006318e 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> @@ -227,9 +227,17 @@ crypto: crypto@40900000 {
>   		reg = <0x00 0x40900000 0x00 0x1200>;
>   		#address-cells = <2>;
>   		#size-cells = <2>;
> +		ranges = <0x00 0x40900000 0x00 0x40900000 0x00 0x30000>;
> +
>   		dmas = <&main_pktdma 0xf501 0>, <&main_pktdma 0x7506 0>,
>   		       <&main_pktdma 0x7507 0>;
>   		dma-names = "tx", "rx1", "rx2";
> +
> +		rng: rng@40910000 {
> +			compatible = "inside-secure,safexcel-eip76";
> +			reg = <0x00 0x40910000 0x0 0x7d>;
> +			interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>;

For completeness , this is ok to add this node but should be kept disabled

similar to

https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi#L662 




> +		};
>   	};
>   
>   	secure_proxy_sa3: mailbox@43600000 {
