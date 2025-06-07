Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459291F151C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 11:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749297229; cv=none; b=rwnGMn50jVqr62Ltc8pWcsOYiFftEiixvB4QOd3Gug9NT0Ozp0Ec0QckNjtQEgU2VynOKXDlspEMsPnENCZV/Hr5S11rxo8qIa1YNJ7WRlzT9thu4QCELtLN/tWxa2PSOeiRyLbVNsJ9LUX5KlglvYSKur9tYg02o0pRmSSnVQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749297229; c=relaxed/simple;
	bh=cp3+wkd9Hpa8eQl7ggQCHHzlYrcncTVdbZUFHWH1E5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=omPcIFWppjd0zf32/xC5qE+19T2T+7MlZKYC8yOwxqxrNRmf8uM4Xnz0LJjAMFHh38JTBJ1xvW48GVpMZoBfouE9ZlfD7ZXakwIH1NO3yj4b6oy4VQhcluBLKt626SGkTslFKhfwxsOq5ACS5LjCdr2Duur7/2bEMFTM9/Kh4AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=XA/jAUSX; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="XA/jAUSX"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-606c5c9438fso5575166a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 04:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1749297226; x=1749902026; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j6NM0r2GKpKHtz5Be10A+IWfM525/OoNZ5yJnNFLV3s=;
        b=XA/jAUSXkfpqJ9U0tXz6zII3LmmsDnxz/HwA/79wdYj5cpGNFPedH8U+/vWPf6KkKk
         rvOVEH8ZE237lJrhdZqz3Co9AmoWuglltNjP2HyDO5tFAOAjslKMvAxBioDOpAtlsvWQ
         LcHcp6HsDUrVndyAVIh4qDsxTCsOwWMgkem8Ztoutdpz4GxOV1/NegJUjyngnZgPWSyy
         tMRxKYEveId7AzZ41oAdOBB1TnhgsrbjILsTMOlxAxlaC+FOGeW0PoGF6k+6WfnT3p+P
         kr5E3JhkhAqQbiHYBfokdmWTgZpBTmXAkcWIqzeFNDRQl+FsHa087tmxDq8AdvZjIfBl
         symA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749297226; x=1749902026;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j6NM0r2GKpKHtz5Be10A+IWfM525/OoNZ5yJnNFLV3s=;
        b=bCyfW+2DD5oRAV0YPJ+CeHE1h4mGsu9Sd6kRxUeoasQVJOlRJKKDCOh4Qd1X22T8EB
         YU9PmwmiuknyLG7JQt8nEKHM/qQh7tz0HZBjmnAGY8sa6ZSspp+Nl9+la6uWJ73yFeWY
         kghCYpRBwW5m2Dn1qptZ1rfHxzh1tr5vKAJG6FXzhOV4dIMrC2XnWYxykDVPQLlgEcrb
         UdFMn2TG+62NxbVTFePoJNh6LKcpTT8khyRAHNShMgu+LQnKxFmxYsu0K3Hhh34WD6b0
         PN2JxiLAoA9BezKdE+gNs2ibK/xk5+V/3Xqvdw/U95acyUKsOFBXayEWiQMJfvVbFMUP
         ROCg==
X-Forwarded-Encrypted: i=1; AJvYcCVNdKufVuuL4WL4W0YfLDIv8a2Apb7ufA4F/h+kX7Ij2/3ixHbj5SgWJzWTZZ1t4ky8dago0RaPpXKkWQI=@vger.kernel.org
X-Gm-Message-State: AOJu0YykQYPSv60kiSeA5/V5/hWGv9bR2wOIM96at3jLPyZkVGYSav/q
	X/A7K5vsASahyAtwWCGNW41jf/5gk53ZmIxsnBUNKwihRTDJqqUT/QpX6av/VKhPjQE=
X-Gm-Gg: ASbGnctTIdoIN2JBLHhMGhiZyEk6vQeoh5HrMXZXvwTnNK66qqCpPyrS4oGRWhYqecB
	RDXYFjax20/2Q+C0C+sZbnxbvSrX5MAwbqxAUcvHIFTpqu897nkWxXaWmtseY8lLEisBYLC8vkF
	Ppm4Fg/rW0+yDm4EGfAG88fZ5FQoFzqSU/VUK5duh4ZJihYcvV8F/NCkp6KPG40Yt6ZHeulMCrY
	GAtr2MZ4sTjqjg/zvGnYeXcIzsar/wwF9d03slvpRZgxuoUGMu5bTgn98uYzlwEy4Tm4+JDQonu
	DxxpRxUiSdqT589wxMETPoaRaRF2cerzcnLh5CfzJEonRMomsAjfVVyAU8ht
X-Google-Smtp-Source: AGHT+IGv3DrJQc4+ybtE0JmCBcsdqL7KbDx6979eNC8Qxq/j+eIgzAGuXvZa0SEaHvSSsMoEslL4Sw==
X-Received: by 2002:a05:6402:1ed0:b0:606:c48c:fb91 with SMTP id 4fb4d7f45d1cf-60773ecd3a6mr6255248a12.17.1749297225668;
        Sat, 07 Jun 2025 04:53:45 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6077836ffe2sm2265535a12.4.2025.06.07.04.53.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 04:53:45 -0700 (PDT)
Message-ID: <96de4b6c-0e17-44c7-9cf7-832a97a24c2b@tuxon.dev>
Date: Sat, 7 Jun 2025 14:53:44 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] ARM: dts: microchip: sama7g5: Adjust clock xtal
 phandle
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1748030737.git.Ryan.Wanner@microchip.com>
 <569e194346975ac3bb5786c02dc6681625771c00.1748030737.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <569e194346975ac3bb5786c02dc6681625771c00.1748030737.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 23.05.2025 23:24, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Adjust clock xtal phandles to match the new xtal phandle formatting.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  arch/arm/boot/dts/microchip/at91-sama7g5ek.dts | 18 ++++++++----------
>  arch/arm/boot/dts/microchip/sama7g5.dtsi       |  6 ++++--
>  2 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts b/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
> index 2543599013b1..79bf58f8c02e 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
> @@ -35,16 +35,6 @@ aliases {
>  		i2c2 = &i2c9;
>  	};
>  
> -	clocks {
> -		slow_xtal {
> -			clock-frequency = <32768>;
> -		};
> -
> -		main_xtal {
> -			clock-frequency = <24000000>;
> -		};
> -	};
> -
>  	gpio-keys {
>  		compatible = "gpio-keys";
>  
> @@ -512,6 +502,10 @@ spi11: spi@400 {
>  	};
>  };
>  
> +&main_xtal {
> +	clock-frequency = <24000000>;
> +};
> +

Please keep it alphanumerically sorted.

>  &gmac0 {
>  	#address-cells = <1>;
>  	#size-cells = <0>;
> @@ -917,3 +911,7 @@ &vddout25 {
>  	vin-supply = <&vdd_3v3>;
>  	status = "okay";
>  };
> +
> +&slow_xtal {
> +	clock-frequency = <32768>;
> +};

Same for this one.

> diff --git a/arch/arm/boot/dts/microchip/sama7g5.dtsi b/arch/arm/boot/dts/microchip/sama7g5.dtsi
> index 17bcdcf0cf4a..411db7e375a6 100644
> --- a/arch/arm/boot/dts/microchip/sama7g5.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7g5.dtsi
> @@ -117,13 +117,15 @@ map1 {
>  	};
>  
>  	clocks {
> -		slow_xtal: slow_xtal {
> +		slow_xtal: clock-slowxtal {
>  			compatible = "fixed-clock";
> +			clock-output-names = "slow_xtal";
>  			#clock-cells = <0>;
>  		};
>  
> -		main_xtal: main_xtal {
> +		main_xtal: clock-mainxtal {
>  			compatible = "fixed-clock";
> +			clock-output-names = "main_xtal";
>  			#clock-cells = <0>;
>  		};

While at it, can you please also address usb_clk ?

Thank you,
Claudiu

