Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD911C6FFA
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 08:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749457075; cv=none; b=rMeDsfFsTzjN237bExIp66vu3FnuqURnmmXVRNIfxjXuoCQVnJy/k3bOp5OhNNYdEBJjab4yW+Z8DXliVAmVyFulY/QOmDiBSQy016zjKCJ6e0DCGtq07oyh8W12z3oe8AgybetC+RCsu+1/XUpXO6WQPHcS5Ah7uVJl7BqSiCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749457075; c=relaxed/simple;
	bh=6YHW+DFdIWtllvbQlf3/6rMj2nD7j4IotHgXQvmo/Fc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PSuMqPPjnOOzZXR+WbZK4Cl2Vp58GmGHq4SBiV+2C6hZaV9DEvCO5XjPkNkcTi5mXaFwjWZGvYdUxTyrWy2MR/m6WM2uyK473NF6M1t6el9NFZJcXEcCTn97sDlVdUDJIfH55WubZMUbMlDlLergbHr6zBYJ0ILWwOYXvMfqbjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FdDdrXDU; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FdDdrXDU"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ade58ef47c0so150978166b.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 01:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749457072; x=1750061872; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=diVPl0lQKW0yQkA4YVUek0ZBF2jN3vlUnkn9DLqfm9E=;
        b=FdDdrXDUnN2uZ5fKr3VWZSQADIV6Wbf8PeHraG9AvEKKpcol3/dMVIQTIu+CPn7yFq
         PzaYNJCVEXAwqrO5hGAki92mXAWDT32Ik7HoR0UX24VEUY5a4eAbe+P/h7wMpKN2cZee
         RF6xp81jK6SVljUyGiO6YjJ1AHghq1IX/53uMVYwE+39i5pR+I43MrF/cmHhPj6V7kii
         ucTBUz9GFTbC77zNcQNtEUn6J9q8EcToxThQ61adxVQnFspdWY5LVJ+y3McDpUVX7tzp
         8h9SRypB5KV10F+D4psgV3HIn1rYPXcTZsVGDL5OUvmKMw3ADJxfSU9oQw9Ka5o8Up0V
         SWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749457072; x=1750061872;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=diVPl0lQKW0yQkA4YVUek0ZBF2jN3vlUnkn9DLqfm9E=;
        b=MFzjY10sDHw8S8g5IjNsIBZFbIdwE6TA+55D6BbJ8HQDg6cKvNqdzns1gxDIQKF4gh
         004z2FMuNy+a8A8W+v9PF0BH0rrllZASqIykEflPeWZKgoO2UlwkBBkH8ZTfEiX0PD5f
         UH/gz7+TmGfNZCktGFwUTmKk5jbCXxPUbDRAGVaK+RvmGpb2Ppdm0PJ+AmFgZNTJUQbD
         SEo9PPweOg5DmF6wEiF1JMHnRJwQI9MVNIu1XOKRDQcktuWxIPJ9xUqeTdY4TNVpRINm
         +6LdGm8/xmH4BrWePgOszwCk4XbOCRs0zmKX/cduP51zpswB+fydqJPC0f88EjM6rXUO
         artg==
X-Forwarded-Encrypted: i=1; AJvYcCVeb8PcsH+PMGmZh1vqfhXr/BP6HTHB1TXDD54pQOmbtGPGqR+2j3i/7ZVH2zqI98l1o+K+9InNwbQgN30=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy23ksQWg6+8SF0T299HaVLjUSlJXuZMG3g0tbUaT/Nsc6kIy++
	lBrJdonWqZm9lX7qSoOXXQD85IyljHV+2KSfHD8Zcw7dgVf+t9wbcjD0VzZQ0MZHwgU=
X-Gm-Gg: ASbGncubcSg/iC3phrFdeJbFkOKYKFP6t9dwFBibeC1z7Fs/HXuXU1h8I1byYxPsThO
	tszhMm32iWB04BF608IK+nu0UJ7bCld5rZLnKsDRskx88fkJOPg8mgi/cfmPmp537pUrp0grF5v
	hhFc6L4G6SSQj6OKAgLz9wem/MqtAF36+KpwGhQx9Zgw+raa9MRKANvmXSnT7Lmq3Qdt69VPMcb
	gthktVAyk8iYHHWLd4F+U3tJtYq6sMHm34d7jIbzf+1r+OSEy429y1WJTqH2szJpegOhgDovT/+
	oLnm8QZW7//j/58ZATuoHgiL7Qx3PxfjAHLiAheaCSzbih0pFXH5qc4/6L14eekjUYizl7Gk
X-Google-Smtp-Source: AGHT+IHlo5foO57lawT0iBE8NHWy/Wh5VTZ1hRUSX/LNop16FvKZAplu9cVdl/qMvDgzI+koFNCPcw==
X-Received: by 2002:a17:907:cd0d:b0:add:ee2c:7307 with SMTP id a640c23a62f3a-ade075bedd1mr1646702666b.6.1749457071737;
        Mon, 09 Jun 2025 01:17:51 -0700 (PDT)
Received: from [192.168.0.251] ([79.115.63.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc78f47sm511997066b.153.2025.06.09.01.17.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 01:17:51 -0700 (PDT)
Message-ID: <a15fd377-1828-4cb5-8c7b-7d26ea2a7733@linaro.org>
Date: Mon, 9 Jun 2025 09:17:48 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] ARM: dts: microchip: sama5d27_wlsom1: Add
 nvmem-layout in QSPI for EUI48 MAC Address
To: Manikandan Muralidharan <manikandan.m@microchip.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20250521070336.402202-1-manikandan.m@microchip.com>
 <20250521070336.402202-4-manikandan.m@microchip.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250521070336.402202-4-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/21/25 8:03 AM, Manikandan Muralidharan wrote:
> Add nvmem-layout in QSPI to read the EUI48 Mac address by the
> net drivers using the nvmem property.The offset is set to 0x0
> since the factory programmed address is available in the
> resource managed space and the size determine if the requested
> address is of EUI48 (0x6) or EUI-64 (0x8) type.
> This is useful for cases where U-Boot is skipped and the Ethernet
> MAC address is needed to be configured by the kernel
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  .../boot/dts/microchip/at91-sama5d27_wlsom1.dtsi    | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
> index b34c5072425a..be06df1b7d66 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
> +++ b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
> @@ -210,6 +210,9 @@ &macb0 {
>  	#size-cells = <0>;
>  	phy-mode = "rmii";
>  
> +	nvmem-cells = <&mac_address_eui48>;
> +	nvmem-cell-names = "mac-address";
> +
>  	ethernet-phy@0 {
>  		reg = <0x0>;
>  		interrupt-parent = <&pioA>;
> @@ -238,6 +241,16 @@ qspi1_flash: flash@0 {
>  		m25p,fast-read;
>  		status = "disabled";
>  
> +		nvmem-layout {
> +			compatible = "fixed-layout";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			mac_address_eui48: mac-address@0 {
> +				reg = <0x0 0x6>;
> +			};

How would this work if in the future the mchp vendor table adds some
other info that needs to be referenced as nvmem? How do you distinguish
the info from the table?
Would it be possible to have some kind of address and size to reference
the SFDP?

> +		};
> +
>  		partitions {
>  			compatible = "fixed-partitions";
>  			#address-cells = <1>;

