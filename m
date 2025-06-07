Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454FFEC4
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 11:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749294392; cv=none; b=ths/mNG87Jw5g6e2KrtSj6CADg5bOilSpPh71/LSj2H7jFvkt5I9+k4w79/bv3lQZQzMic1afHw38vBAAXhejf+sV1hKXzTWUHE2NzZk7zHtCU3ZIJdoPRvMt7In+osqJ4n+i5S6af5btsWfRAXDo+BPqj9ehtg6do+gXEnByWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749294392; c=relaxed/simple;
	bh=kmTQB+yMiFcHzCHY1trlsiEJR2icsWBguc+W8zpcLcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JjmM2rA1fwHdX3+nV+Yk4dytNgZ8rcy96mVWJkgutN66yyYp8pXytRbXYY8uo0T8C7G6vTtCkCsFS5saMaWEChvj35ojo9LS1oGi/FKmQMalnxnTZc6yh/KhbxwvZ4rEOWc8l3HxYmi3yKUz2+d8bQNt9FhV72EiyWrCvPiZWsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=jZ3fB/R0; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="jZ3fB/R0"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-604f26055c6so7889906a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 04:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1749294388; x=1749899188; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wX5KfR9MOdyE8SuFH1WwTnQT5xWHkVGETwnX9lS5vz8=;
        b=jZ3fB/R075s+xWvhzcLNCOqRWPyYWSjvQae1SdkVuENt/lZrOcmGXWO7tPdRWUjW1e
         y/Xhii0B3bTvy19A+3CvTL8cusSflEurX/Hk5zci4Aj6RNe5oyfQMYNXGuxCyYcWk9eV
         p7OSkjYke/QkLzw6iNkGaIJWj0eEgqRn1Qi3eu4p1sRaVOOAAgGzABW93a8xCyN0jTY/
         ESKQP+91KIlEbGjGkcZlD7KZO4j3Xy8VSPhv5dVwULe1RrBL7NxfGu6zu33X76Isecw/
         f9XXGV93qOsRHKz7D35yFN9XyrsWNR8ywJ23oEgls71v1xBBMhPP4FhR3bFdQgc1c8Ya
         7IkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749294388; x=1749899188;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wX5KfR9MOdyE8SuFH1WwTnQT5xWHkVGETwnX9lS5vz8=;
        b=KhyLuKssEpkZSpl5xEpt5vt08k0fKD0uzn+/HxKxvJj5DW4cfYF7UyI/WwtxZAvd5P
         +1kZaFHecIS30ZEdX4wUiMeUUDIOk7ev8cm5dHYR/th5c39MgywPQTZounqWoaEvd20S
         pmYq6egNPX67Ax6eqXtNY1k0pyRqTe25EvpWUXjte+57HxoPForzzB8l42CxDBNQrKKR
         zprmsCFCZYu6kuPaXrvXoLXxg+Hfodx5i2VNWy+sB+daSYN5KfUEoNQKz3H0s8gdR0pi
         OA0RliqLf/89ddh1R8JTMymV+V3B9G1aP2EcZH4sBv/NZzLl+iQLcBeOwKBYIcyu3mWL
         hwcg==
X-Forwarded-Encrypted: i=1; AJvYcCVSu3+KvcQefgPXf/oLbya/vZR8JpNHv3QRgIvhg1075dElFTekRaWd+BkGYCC+UBeWlBnEM7VbTs+D33w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5PjZeXYQbSDDQGNxfQp1HVgowQTtc+jrGXZWLnTpASZjiTcFp
	HtvYPf/fQoFD6d1vd2oLLkPat5HjOl85KNFo8bgL6J4evgCRbJeNMm192c6e2wROa7o=
X-Gm-Gg: ASbGnctc/tZiYdZ/tiGXLSk7B6mzd2jGY0Eg3Joz1DjZKYYQ5Jt7jviGoJCPpY6gTDL
	Lca4awUCmzrnTJj+1qG2QevD+WTlpCznLZI9UpzyXEzXxMTsnklfbyHKHZvHs6iRHiMGl4Ijx7L
	xWv5Jmm7SOW1mBwddpJywz3UFTWHETb63smYBaH+tpDnmwTaDrpicZEEPbM4+R5BE2WkQshnPsi
	V1FwN3Ui7cIkbrULVsLNLyIkGGgIO0lmHm6tBgwHRyIXivtWoh5JJ4V07fHhBMkm6AP0xvCZJOl
	Ci6M82+Ej28Ggg+1Wx0RWrH34uVth1scnjGoH7wskQoM+fPqUd8fUXFHyW/OHft7SCQwy44=
X-Google-Smtp-Source: AGHT+IE+q4EZEeGcYbHs9Cr6SWwfg3TvuJIon+Nk+US7johX0he69tUZyS1HyJZxxpkozjkb+cd2AQ==
X-Received: by 2002:a17:906:6a27:b0:ad5:2d5d:2069 with SMTP id a640c23a62f3a-ade1a9da675mr665733666b.13.1749294387390;
        Sat, 07 Jun 2025 04:06:27 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d75467fsm263858366b.14.2025.06.07.04.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 04:06:26 -0700 (PDT)
Message-ID: <62e644dd-e193-4375-8d05-82b51a8cf0a4@tuxon.dev>
Date: Sat, 7 Jun 2025 14:06:25 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] ARM: dts: microchip: sama5d27_wlsom1: rename
 spi-cs-setup-ns property to spi-cs-setup-delay-ns
To: Manikandan Muralidharan <manikandan.m@microchip.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, tudor.ambarus@linaro.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250521054309.361894-1-manikandan.m@microchip.com>
 <20250521054309.361894-3-manikandan.m@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250521054309.361894-3-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 21.05.2025 08:43, Manikandan Muralidharan wrote:
> The naming scheme for delay properties includes "delay" in the name,
> so renaming spi-cs-setup-ns property to spi-cs-setup-delay-ns.
> 
> Fixes: 417e58ea41ab ("ARM: dts: at91-sama5d27_wlsom1: Set sst26vf064b SPI NOR flash at its maximum frequency")
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>


> ---
> changes in v2:
> - add fixes tag
> ---
>  arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
> index ef11606a82b3..9543214adc9f 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
> +++ b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
> @@ -234,7 +234,7 @@ qspi1_flash: flash@0 {
>  		compatible = "jedec,spi-nor";
>  		reg = <0>;
>  		spi-max-frequency = <104000000>;
> -		spi-cs-setup-ns = <7>;
> +		spi-cs-setup-delay-ns = <7>;
>  		spi-rx-bus-width = <4>;
>  		spi-tx-bus-width = <4>;
>  		m25p,fast-read;

