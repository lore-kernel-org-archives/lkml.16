Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67280219319
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 11:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749294414; cv=none; b=YkUHQtzvyYrWq/kGt+NXO/NI6rjaXMlpJK7Xu3bMD+7VxLK8iCw13BEcLy812B4b7Akbu05ZMsIt2J4iRD2xjHB30B/AsEOBXGfnBgvxhb12vZmEDhz9m/y6mUeObAUW+Caik/CpuR4+tY671VYjeQAUP2ILV3TPp49K31FHmUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749294414; c=relaxed/simple;
	bh=vicUU9PHI2hVlzAUIoglCN2hj3dmlD4qUda4Sx3foGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=sL/KV2GDD+gRBOaJRRgZP52neFNOFNHRhK7hnpmk7dIU6T/MLxK0bH4WOyv1BZHH9CSidrCXpSDPhw0C3YR9Nfzd8B+GkWb9Y3dXNvrYowrx9xWXMbcDj+6iZj6rsaQn58+mmgsuFCXrdtsGCM5ZsSdu+K4p/gVjRNAlusyuyHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ax0cq7Bu; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ax0cq7Bu"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-607c2b96b29so1045450a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 04:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1749294408; x=1749899208; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZpeOeAdGqxMbXCn6EnheQKl037hSzc1P5CMiTi/s4OA=;
        b=ax0cq7BuHRZTQtHHCgMKJ+0ZIjG3Cl8Ex4xqmA9j3VyRHSWja8np2Ecfb+5qCjrT9z
         eNFeQ322otm61Y8mmAg26nuzgwqkuez5jR1mJTCqenBFO+M605pG2cvAMn8BEYiLBks0
         huqiuaNIpQKEKH1v4ylpuEBMpAKldGIb/5e7zNycZSuEh7EEDlkmQz50hwS7IFQCF23J
         ZvwtNMotbx78GqsHJAjhgyL7kjVo78CqXBZpGT8uV5zzG55RhkoNFcgZpeKpILliHhf6
         7wijA8SccL3I96iId7QHC/H59B2/ywUiW4jQMRsRYSY+xK7jJIYZP1OlJ4VFYQ++JCdI
         WAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749294408; x=1749899208;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZpeOeAdGqxMbXCn6EnheQKl037hSzc1P5CMiTi/s4OA=;
        b=QqL46pA1bDYWoqidBloYwUmEQg1tsqSCAEt4RoMmOOXIF/lAhGinxACFv8hMMdnR7u
         TZYFCKiUdl7o5YhRZNW/EPOn4Y+7qv7oJJ18UfxDVjs+/FMvI95NZINqtIQjQFh5pK1B
         FjH6Jn7qfA4V+FOzCK6bEyrbGdhpUhpHDHIgTxvABR288F8tNkSuLceLfeNDYHM3gdZT
         vHO14E1yccFXkTCelCVRXQveKHyQ+OizXGXikJFHeJMraoLQihLD/otUhaS+xPuqQhw6
         F5gqa60yxPY4HDiA2YG6y7ur/hLnRdsr/A3c8UNhMKYH3p7THopHQCFzSZ7eNHIMylqd
         6f6g==
X-Forwarded-Encrypted: i=1; AJvYcCVNxYidwXU66fRUQSDnmEMJViz8+1wMSAslONjYL6Rite8D6svmgVDxvZZzAqyX4fCCtxHJajnQ0TukJSo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+vbUdIMpee40L4HCk4NyJ+M4uNy54WyzyIxrsG1MiO2rrTM/r
	s3tBPv/E4V5tMjNUArz+LQJv8CdTvr/VrXrUb/rZSwN3LjgLpkFJaAdeLyCf8tRj790=
X-Gm-Gg: ASbGncujJi3uS2T2ixeczi+3JyumHQ3KtG4fqq651E/AuLN9N/QW7fybNYQuVc5Bxe8
	QdZBE6BiMsqjet1OfPGnhJslqHluBF6Tp5JYWshUIYQJnqElbjzGJIO4MJnSMJBFrieRAEAt1Sl
	Kout72/TnkSRv/MH3WAIm0SvTaTviqPP1KHjK2kJLBjNuqTFmavMK6IHlY3Ftsq6WpbnRzDZReD
	VgNfpCIFgXAd2kWPnNQD2fjDBePuOjAEQ+qD5TCoJ3m5yHEPJfajPE3aNcfzvEket18/YLZl8cy
	aGsbga7nADmDFTAhMK3srrgJzfM/DTX2nsc+R1hfQhEVDAubt1FO2Z4JiJ9+
X-Google-Smtp-Source: AGHT+IHpdpfUQNhMmB8sN9hbFLLY8K5z23WOyAagshrUF6r9enZIOLN8q3wFRn/tdHnAMeprp4PVUg==
X-Received: by 2002:a17:907:9494:b0:ad8:8945:8378 with SMTP id a640c23a62f3a-ade1aa4dd99mr589163866b.19.1749294407543;
        Sat, 07 Jun 2025 04:06:47 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc1c8ecsm262161066b.94.2025.06.07.04.06.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 04:06:47 -0700 (PDT)
Message-ID: <3991b725-f115-4dc7-b744-c8dee5f8a477@tuxon.dev>
Date: Sat, 7 Jun 2025 14:06:45 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] ARM: dts: microchip: sama5d2_icp: rename
 spi-cs-setup-ns property to spi-cs-setup-delay-ns
To: Manikandan Muralidharan <manikandan.m@microchip.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, tudor.ambarus@linaro.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250521054309.361894-1-manikandan.m@microchip.com>
 <20250521054309.361894-4-manikandan.m@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250521054309.361894-4-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 21.05.2025 08:43, Manikandan Muralidharan wrote:
> The naming scheme for delay properties includes "delay" in the name,
> so renaming spi-cs-setup-ns property to spi-cs-setup-delay-ns.
> 
> Fixes: 46a8a137d8f6 ("ARM: dts: at91: sama5d2_icp: Set sst26vf064b SPI NOR flash at its maximum frequency")
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> ---
> changes in v2:
> - add fixes tag
> ---
>  arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts b/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts
> index 9fa6f1395aa6..fbae6a9af6c3 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts
> @@ -714,7 +714,7 @@ flash@0 {
>  		compatible = "jedec,spi-nor";
>  		reg = <0>;
>  		spi-max-frequency = <104000000>;
> -		spi-cs-setup-ns = <7>;
> +		spi-cs-setup-delay-ns = <7>;
>  		spi-tx-bus-width = <4>;
>  		spi-rx-bus-width = <4>;
>  		m25p,fast-read;

