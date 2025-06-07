Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B898821883C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 11:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749294429; cv=none; b=KcwreA4hRc4F8cHQrdbW61mcRwheeeooRkGrmkN372Yhdi6XvKiJe8DkMk3wKghhqdOOJHmGvmZWMuSH3IIxUi/WatRlnABVFc8N+mUMC5EDVVnlcc4Mb2kkNZAQETQVw6gAZgZVb4YP81z2Kxwrm6AnA8Y+eEOkOlBxz8wl4sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749294429; c=relaxed/simple;
	bh=vicUU9PHI2hVlzAUIoglCN2hj3dmlD4qUda4Sx3foGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PoboXh/bjY+P/7b2DN1Oqsb8BO7R5fBqT0CePLFkWcuK9M7mRwfMXFBoSsbXA3sRT0yJ1TxHg/zueFtGiAAW0tW1GYUR0VXIGuG+mtkX2iCY99V0g6F4s2oij9ingc7uVztJrud0V2h02EIq2Y2LvIdp/2AcjY52mOnj2vP4qTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=aTrMvR0e; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="aTrMvR0e"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-607cf70b00aso88941a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 04:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1749294426; x=1749899226; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZpeOeAdGqxMbXCn6EnheQKl037hSzc1P5CMiTi/s4OA=;
        b=aTrMvR0ekfVYHIA/tiDfCpqsHL+XGnGfduwB0gkxxmTqWzYI3ndoZGG/PmMQlqmIc9
         tbTMfc8xJZgdFupxtZDAiOrfWoMjAo4e19OyPLLPYuKxCs2Az/MguwXuLav58Dx+A8Gc
         HnbuwxlDMphhmHJjfBVQbjDUHjo3a/zCYB6y1oFgah9EkTY117kboIwpazmyA3aDpIBi
         R151OCIofVpaRqO0BrQ0kT0yc69ff/HG390QOk4YuvJ5BieIi7k6fpwlcYxxaWbga7z3
         cLU8HTyrUa54OPTOPwMTxrGkqWSgTBUK4YTJp7qaF738zkBqoQgtkQgMyowHE7GCZqls
         NVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749294426; x=1749899226;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZpeOeAdGqxMbXCn6EnheQKl037hSzc1P5CMiTi/s4OA=;
        b=Rg558OGDUhtO5qLwW5xx2W38ccTLOeDFNEsqPhp6hJWMtRjsJF4XbolD+/ZUYmfjAh
         awKBeGPdjl/IpYjV9Va+OpV9jZTHa3lLby9mJeO3YfrSx8s1eFT7yW/QIg/pmhWMlXR0
         tKgYncfywM/lEmf1SPYAaTJC490XofQpiVuQVGQynbRjFYopYtnqLjkND3icWhOOHEE6
         BiAF60Fm5IfuMcGycIDEvpFvgwx8py068sRh23pVTYaiJS2BbxQe7OmuCA6Z+VstSO3E
         kQotJHPnePmz19Sm6FUkpyXdUY6nm5SoxI1dH7SkLK4xf2l2+TyN1Lx/6xTPs3hgOJKI
         AXBA==
X-Forwarded-Encrypted: i=1; AJvYcCXL16g0uf+BY2VDNq2WQnXLJnEiq2PrbxoD5FZ8VNOzy1pBcXbQlYs7aJyr32N1+NiNO+bWM0MlsztvSE8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxHgcAgjEaqsMakqHcqXXeBKsc+ma0IzRRbJ+85xQ1v5Q2tscC
	C4QcHTLEE+ch0mAhnhJNVRUx9jiTdUmsN0bAYIpLwQ+YFIMQ1RzqbpKk3VhZt7Sx7ENY6EiEqNX
	TgSg/
X-Gm-Gg: ASbGncug7aO+8TkcFACDLJi/qh9lPD4eBwmEoezeNEIrLBTIem1serC11Y/JZ3GinCV
	2Sqp6kURjv8Q/Zv7VdeedPJjL9KZNX16aS2JlPO+bQu4QgG5TPFrj64TL5Cb2/NrYi2y+60Tje9
	mz2YkSKFzU4LitKwS4eSo1DRbs9v3uJZUREXAPfH3ZqxIFS8GDgEil3IkFO7BPHr6LN0+MAsLtz
	y62a0C1ko/ZNvIo2rlV14q6YfdksVAKwEWuTtZMLG+S/+6FONjtgix30CpeC1zbDgBqNx5Xs0Ig
	731np/Wg5mbzJWWtiV0Od4A/OY+1UUaatuKXgh+q+yCnvmSyx1WcaCATLIobakhKEKkO5cs=
X-Google-Smtp-Source: AGHT+IG3M8z181em7vBtuZBZYwhYQocgtGu/WkgrN5sHYgBLnsseshvmDwY/I6GFT297t5L4kOKqyw==
X-Received: by 2002:a05:6402:4407:b0:601:a431:86cc with SMTP id 4fb4d7f45d1cf-60773be8fafmr5653795a12.5.1749294413789;
        Sat, 07 Jun 2025 04:06:53 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc1c8ecsm262161066b.94.2025.06.07.04.06.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 04:06:52 -0700 (PDT)
Message-ID: <55a5a22f-aaf3-448e-a628-6309db283182@tuxon.dev>
Date: Sat, 7 Jun 2025 14:06:51 +0300
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

