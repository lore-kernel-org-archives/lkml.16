Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06385207A00
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 09:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738663122; cv=none; b=QWIvLXCctOVs9JCNCTop3uBJn0w8meZtWsAu//5yNd7Ix0eqUyn07/wyVj+5nP8bGzB8M22wNQtblr1SkKorLV03gwQvFfcx7TJp84q2t3oZZilJ0kKbR7PMV2XxBXTvPmHvTwQPJiX3d1kAqaR9R7rGGNf5r5B/jhih+dFTBGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738663122; c=relaxed/simple;
	bh=RmazLy+8VHltKrrVyJ/8S8SbJB8nDkoUkCXRWeHQA1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OT8zpjzeFLWTP6ktI0twUJ4HHUDBYLIuyFyP/xZTTlWezYsMuR48t9mOB2WdRc8g4G1baAUyQjCklHDU3W5O2DP5dcqunckfTklfspzqpLQLTqdzv+WFDk9psVOULy5fda7p22WmnLPKnZWMSwRSjbdB9ZUn8uox4nOSyk61YIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NTiTUXeK; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NTiTUXeK"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-437a92d7b96so53508065e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 01:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738663118; x=1739267918; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=REr3JojQsOy+vlvyz0onFg9+R7wkRagQJ4eKviyK6zY=;
        b=NTiTUXeKRHnt6wHJSTsMXuVqkbuRZDmGnosE5t6bTsRE2WeUXOtyaq/t/rcodXrsE7
         1qKEFkKkDpFU6EDrX0jNO3edlLayKwn/r/O6OUNT34pkdGfGNc+5glB8YlYO7fWotwgN
         Jv3bIG2ci1L68Fs3cGXhGdAUcJ1ZwIhmYsXUDY7wmecSFMzEIErYIYLGEiQRxobO3nwf
         vAwlQagBGT5vMoHayouJB8krs61hNLBucMqQhZhw9f6ZbLZJdGrtDYX/5R7fHXJfKcHi
         kKsPttkNlpOm2Y5rPqL2LtjrbPSYewSzlQEMnDCJCXzab5faYrq70K6oY71PeNC3ZTpj
         zcJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738663118; x=1739267918;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=REr3JojQsOy+vlvyz0onFg9+R7wkRagQJ4eKviyK6zY=;
        b=No7jZPwCyK2WxaUooYXLdJjDDneYb8LRYM8xGfzlqFvmLo4LwED9qtOrujgiWqLoK5
         KrrzuoadYro0nvwSIq7LJ57yDPs81Ah2pUG8it2lFsba/9cy8YZknhtAtKcoLuxOOyf5
         GHMp12YZviqxwAUfkOTewt6TNtDDf+U16qH4OPi9CgObQtO8D9kJwYUA+5IJaqnjwuY+
         TTVnRLmYMDA90plSuGQtUG3CUt9/Q2Gno08tDpTTzz4bLZgaddvGVqHelxNia6AzVG73
         Ghzbw4lyvOnOdoVf5oOBJikEPceSgg9PVuBUUGA7ZleZ2SFJkTdpy7pAxTh52gKCbDaO
         reVA==
X-Forwarded-Encrypted: i=1; AJvYcCWq1H38bFQDMMk6mwhhhxZReXST7UKJGKrVqzTJRiMSYxkK75P1D+2AAIjjyK2dngb3/OYexgsyvAJBTKg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgrw7rjHA7H4Axw49iT6H7sAHbB8hIOvXxCRE6sNFJb5aOPysx
	b8H7VxZQh6qup4I2tgOJA/fhRa15+QOqh1mYCZY5EUbNeWPvXywDkn3drtC7Z0A=
X-Gm-Gg: ASbGncsa+29hSeZ6iuh8tHV7sDUk9R3b1RrgHbpYE1VrYtpxGvIda2b0cgfDgEAgd6s
	FE0TDqzm32t3IX0zPqXU4mkVDtmjtWkQTuG9IMnJF4jf5Jh3xEmGDlGK70Dj5uaJcf8BKvn1Nt3
	WO2oL9BBObHq/gRDE2I6tiiU3uSnrmT081r4cxdfgBU4FZJtcJlXGNA977uEYlz7Aql/dbLRalu
	WgVBiU653v9whtAltoaO8SGYQQ66MBRBz30JsceHsAdQGpzVdRuTmkQlgO425f2HeZeMA1BuuKp
	SrO/zfEVS46O
X-Google-Smtp-Source: AGHT+IGghMc4BxN9O+Qe0aM7/qh0cf8oUGD0gp1CkfwZSZ2sexK7/dNOyrn8xIzebmIsfIq0H1OvOg==
X-Received: by 2002:a05:600c:5119:b0:438:a432:7c44 with SMTP id 5b1f17b1804b1-438dc40b281mr195073545e9.21.1738663118009;
        Tue, 04 Feb 2025 01:58:38 -0800 (PST)
Received: from [192.168.2.177] ([81.0.8.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43907f6741esm8565945e9.3.2025.02.04.01.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 01:58:37 -0800 (PST)
Message-ID: <62589d83-f816-40f2-9eef-3f08fc9157ff@suse.com>
Date: Tue, 4 Feb 2025 10:58:35 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: s32g: add the eDMA nodes
To: Larisa Grigore <larisa.grigore@oss.nxp.com>,
 Chester Lin <chester62515@gmail.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, s32@nxp.com,
 clizzi@redhat.com, aruizrui@redhat.com, eballetb@redhat.com
References: <20250203080919.1814455-1-larisa.grigore@oss.nxp.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20250203080919.1814455-1-larisa.grigore@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/02/2025 09:09, Larisa Grigore wrote:
> Add the two eDMA nodes in the device tree in order to enable the probing
> of the S32G2/S32G3 eDMA driver.
> 
> Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
> 
> v2: Moved #dma-cells before dma-channels and clock-names after clocks.
> 
>   arch/arm64/boot/dts/freescale/s32g2.dtsi | 34 ++++++++++++++++++++++++
>   arch/arm64/boot/dts/freescale/s32g3.dtsi | 34 ++++++++++++++++++++++++
>   2 files changed, 68 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> index 7be430b78c83..64eac1dde05b 100644
> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> @@ -317,6 +317,23 @@ usdhc0-200mhz-grp4 {
>   			};
>   		};
>   
> +		edma0: dma-controller@40144000 {
> +			compatible = "nxp,s32g2-edma";
> +			reg = <0x40144000 0x24000>,
> +			      <0x4012c000 0x3000>,
> +			      <0x40130000 0x3000>;
> +			#dma-cells = <2>;
> +			dma-channels = <32>;
> +			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "tx-0-15",
> +					  "tx-16-31",
> +					  "err";
> +			clocks = <&clks 63>, <&clks 64>;
> +			clock-names = "dmamux0", "dmamux1";
> +		};
> +
>   		uart0: serial@401c8000 {
>   			compatible = "nxp,s32g2-linflexuart",
>   				     "fsl,s32v234-linflexuart";
> @@ -333,6 +350,23 @@ uart1: serial@401cc000 {
>   			status = "disabled";
>   		};
>   
> +		edma1: dma-controller@40244000 {
> +			compatible = "nxp,s32g2-edma";
> +			reg = <0x40244000 0x24000>,
> +			      <0x4022c000 0x3000>,
> +			      <0x40230000 0x3000>;
> +			#dma-cells = <2>;
> +			dma-channels = <32>;
> +			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "tx-0-15",
> +					  "tx-16-31",
> +					  "err";
> +			clocks = <&clks 63>, <&clks 64>;
> +			clock-names = "dmamux0", "dmamux1";
> +		};
> +
>   		uart2: serial@402bc000 {
>   			compatible = "nxp,s32g2-linflexuart",
>   				     "fsl,s32v234-linflexuart";
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> index 6c572ffe37ca..4f6201d6c08a 100644
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> @@ -374,6 +374,23 @@ usdhc0-200mhz-grp4 {
>   			};
>   		};
>   
> +		edma0: dma-controller@40144000 {
> +			compatible = "nxp,s32g3-edma", "nxp,s32g2-edma";
> +			reg = <0x40144000 0x24000>,
> +			      <0x4012c000 0x3000>,
> +			      <0x40130000 0x3000>;
> +			#dma-cells = <2>;
> +			dma-channels = <32>;
> +			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "tx-0-15",
> +					  "tx-16-31",
> +					  "err";
> +			clocks = <&clks 63>, <&clks 64>;
> +			clock-names = "dmamux0", "dmamux1";
> +		};
> +
>   		uart0: serial@401c8000 {
>   			compatible = "nxp,s32g3-linflexuart",
>   				     "fsl,s32v234-linflexuart";
> @@ -390,6 +407,23 @@ uart1: serial@401cc000 {
>   			status = "disabled";
>   		};
>   
> +		edma1: dma-controller@40244000 {
> +			compatible = "nxp,s32g3-edma", "nxp,s32g2-edma";
> +			reg = <0x40244000 0x24000>,
> +			      <0x4022c000 0x3000>,
> +			      <0x40230000 0x3000>;
> +			#dma-cells = <2>;
> +			dma-channels = <32>;
> +			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "tx-0-15",
> +					  "tx-16-31",
> +					  "err";
> +			clocks = <&clks 63>, <&clks 64>;
> +			clock-names = "dmamux0", "dmamux1";
> +		};
> +
>   		uart2: serial@402bc000 {
>   			compatible = "nxp,s32g3-linflexuart",
>   				     "fsl,s32v234-linflexuart";

