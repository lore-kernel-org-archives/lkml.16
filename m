Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09980101E6;
	Sat, 19 Apr 2025 14:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745074042; cv=none; b=HTpJinb6mGh/M8cutzo/r7ljTiwlgt+JvzYz5aapn8F674gh4K82fr7h9aPjgD+0tezRfGM/crVT4f2A89caK4QisA+aEYK4m8at4UHVFcXzTD5ctF4o6/tKY7yttwTDYng68tAng9xODfRVttZS31ITgH/Sr8AtycI4LA/JBro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745074042; c=relaxed/simple;
	bh=BHHaBanGguFYkPXO81GJ1xIZFQrOlojkGZV6xTJ6iEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Rgbi0yZlzwq+mHXYH3EyFr70qoQl3041rz0RsPsMbqdDNZW0kGpsn6lttCFDZV4UzyO9edah33TgZteJFqIMkKNFRcXlVOcKdWX3K3NV5Alb+zRaCnaudaRJiNJzshlTSFE7Qwb5/2f3ovskaavHNuOlX1FYnc3mvHRhgtrUBKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Fb5gXpv6; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Fb5gXpv6"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53JElEok1216562
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 19 Apr 2025 09:47:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745074034;
	bh=wOsQo0dZK86u6ePoYRKpFPkcAhNX39c3BBfeb9fF8ko=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Fb5gXpv6yUm8xhHD03n48LzPuHviK1c1g7pdkRVdXlNvikIq2sGjS9p7SBTFFxx+J
	 GKm//lBMopcc3R/mTSQYJnqFROdJY6VI3fVVp+zE5/FV9FeOecYKcLsUB44pPB46S9
	 /wBB+dUyAwJ2YIUq2iYzQdVSteQfHY9z7uur9cKM=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53JElEdC040165
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 19 Apr 2025 09:47:14 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 19
 Apr 2025 09:47:13 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 19 Apr 2025 09:47:13 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53JElAEr127795;
	Sat, 19 Apr 2025 09:47:10 -0500
Message-ID: <fc7b5381-9289-4da2-bab0-e574772bfb86@ti.com>
Date: Sat, 19 Apr 2025 20:17:09 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arm64: dts: ti: k3-am62*: Add non-removable flag
 for eMMC
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>,
        <u-kumar1@ti.com>
References: <20250417233040.3658761-1-jm@ti.com>
 <20250417233040.3658761-5-jm@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250417233040.3658761-5-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 4/18/2025 5:00 AM, Judith Mendez wrote:
> EMMC device is non-removable so add 'non-removable' DT
> property to avoid having to redetect the eMMC after
> suspend/resume.
>
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts | 1 +
>   arch/arm64/boot/dts/ti/k3-am62p5-sk.dts        | 1 +
>   arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 1 +
>   3 files changed, 3 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
> index a5469f2712f09..1c8b4d13fb491 100644
> --- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
> @@ -832,6 +832,7 @@ &main_spi2 {
>   
>   &sdhci0 {
>   	bootph-all;
> +	non-removable;
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&emmc_pins_default>;
>   	disable-wp;


Reviewed-by: Udit Kumar <u-kumar1@ti.com>

> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> index d29f524600af0..43fcb57b34ebf 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> @@ -454,6 +454,7 @@ &main_i2c2 {
> [..]
