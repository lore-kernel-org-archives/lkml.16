Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5649B22DF97
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 17:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748539273; cv=none; b=RfVNQyZ+lXAx4D/Q/5lU2X4NE/3VmfZ9/5tH+3L5FL2kGUu55XzwfZyDU5XKoOGtGz7UXdvzlb0LrOWythyV4RP+3UAqmF1Y0cmhddY+6Gs9CVom02YCY28X0p6yG6TL/TqMagbqELdeZ5dy5iW9zxXxp+gy4g1Gs8mBrfdG1vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748539273; c=relaxed/simple;
	bh=14XvdjCWpYFMm6zM1TygU+AlStuIOYC9yEl0h75Jbxw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZtSBaoAQyv7kMMRm/bSdrQc3E4eB8fLsjwsEvYiuisSPAzEgACnwiLt3zRyIEfcxplb4JoIIZkYXK/sLNtjK/s9pt0Y7Za6VwvNFOmTNafYOTPDJ8vdcT2jtJG+LtahC2vD/Ms2xb3E3XF4Jwm1bCDFYD6Nwrj19mF+6b6XdJaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=2UaXeMhT; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="2UaXeMhT"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-73c17c770a7so1262999b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 10:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748539270; x=1749144070; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rvmxQNNcyeqgh1bkCI5xLmsBtP3BhbXj24Pg3BrpjWc=;
        b=2UaXeMhTjky4OYmUCPBXbKVWuyYi2rdhnpsD3QPvAOhFhwa/BnsNNmzDVqYCqcHrfk
         EWBrmhSRB1diAXxHbvcD5w4Ad1faSArAlThqee4R8uItD7ywUqBb2ytYYIvspUmALsU5
         bQv5G5ScOtf1qhgn0keXUQ86Ysb843Bs7Gg8fi42yW03i/jsYPazOVPTUXvLMIG3UVhh
         vq7JxH/TD2yM1wCKuBzxptLwjB2nky+lKryf8DpxbXM6+3ds+GfZUCuyBO+r79EbE32u
         vmP6otod5Hg+UnbZiHC5j7JbOtMcpIR+Yz35yplCvX7HlVJsLRVl1alqJJF5Quwpa9Pr
         p5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748539270; x=1749144070;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rvmxQNNcyeqgh1bkCI5xLmsBtP3BhbXj24Pg3BrpjWc=;
        b=lQAl+pXbXguDIhkYeLp6bUQ9hBTRjhbOMdElDurajsmx/SzLhmswNfogIGW6YJlsUK
         T5YDndOQPZLudCwos1AoYGVX3YNm3pphnTobTIECHxqVqLP/stMfqyFbQaV/3XiTGfut
         03m1V8aHk9iSnL4B3LejXF5AwUqJ+wfLGtDBAequxUeWP1pLGG/reqMx5A7C1GumTyQ5
         K7UCwbWdKC3xeterqm1gpcK7saSmJSB24lAuztYfPKgg0ozq5EKKtlR5q0O2K89uYUuq
         +T4Xbov0BEPiqONQ2UsfVWrIiGlPX3RNXQmaY4zdornGqZSJ/AF37fDa0Rsedl7QhQnc
         bV9A==
X-Forwarded-Encrypted: i=1; AJvYcCVcGc2X4FYhd41dtUHOlPSlo13evRc35mOVKpyfBE/kpue5csqm3N3mMcil2u+ZrmcBZ+uTs1i5xxO58Nc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUFCkMUqXzw9ECClClrfFMyjhcXevfaYjqvUhMDbxNNdrQj94o
	LcU99N13tracrnCZXSn/5JM8s07wZ6MoOfKeOYXNiltPZ3b0vKY6d4ffU8IAgE25Spg=
X-Gm-Gg: ASbGncuMZbMOr+u5VmN7yeu0IXsBXx/qfFY+MFtHNsp9exTRTnQq8xoRzgBSaNEX04b
	2WmvmXo7onuJVSboNEj3BZb5ACrSquYD+GzrpPdEpn2J8m3fJYTvoPUldGWfW5abwZ8DVwQB3+L
	tmk9rHEWJNt2K0Do9oJ7xFndcmzWm5V4CbBolZG/ero+H4f/FGSvwaD26SZs7hSWb3VPQ7+FrSG
	WfYOQtrd/YbAxQf0g706t7N07si17hk9oEIi/NgxNDG2pKkEaZhEzD1fcsT+FCb/NqKikUA3L0V
	mnFHl2nLvM0AFZaxNcTdQUsdn5dFBPcSDCr3Yp4ve9xufLs+oeq5aPbif790
X-Google-Smtp-Source: AGHT+IH1834zzk2lUOPVUHGH3EeY98SO550LzAmtRD9p+dqmamQc9GnfdhVQPk+w3gTCeLfLx3OdJA==
X-Received: by 2002:a05:6a20:93a1:b0:1f5:9098:e448 with SMTP id adf61e73a8af0-21ad94f971amr763041637.5.1748539270578;
        Thu, 29 May 2025 10:21:10 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb9711asm214068a12.57.2025.05.29.10.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 10:21:09 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Cc: Sukrut Bellary <sbellary@baylibre.com>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, Roger
 Quadros <rogerq@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Santosh
 Shilimkar <ssantosh@kernel.org>, Bajjuri Praneeth <praneeth@ti.com>,
 Raghavendra Vignesh <vigneshr@ti.com>, Bin Liu <b-liu@ti.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Sukrut Bellary <sbellary@baylibre.com>, Russell
 King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Nishanth
 Menon <nm@ti.com>, Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH 4/4] ARM: multi_v7_defconfig: Enable am335x PM configs
In-Reply-To: <7hbjs3tf1j.fsf@baylibre.com>
References: <20250318230042.3138542-1-sbellary@baylibre.com>
 <20250318230042.3138542-5-sbellary@baylibre.com>
 <7hbjs3tf1j.fsf@baylibre.com>
Date: Thu, 29 May 2025 10:21:09 -0700
Message-ID: <7hldqfnxiy.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Arnd,

Kevin Hilman <khilman@baylibre.com> writes:

> Sukrut Bellary <sbellary@baylibre.com> writes:
>
>> Enable Power management related defconfigs for TI AM335x[1].
>>
>> [1] AM335x TRM - https://www.ti.com/lit/ug/spruh73q/spruh73q.pdf
>>
>> Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
>
> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
>
> Arnd, can you take this via the SoC tree please?

Looks like this slipped through the cracks for v6.16.   Could you apply
this for v6.17 please?

Thanks,

Kevin


>> ---
>>  arch/arm/configs/multi_v7_defconfig | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
>> index 37e3baa33b67..1d2600b5f975 100644
>> --- a/arch/arm/configs/multi_v7_defconfig
>> +++ b/arch/arm/configs/multi_v7_defconfig
>> @@ -985,6 +985,7 @@ CONFIG_EDAC=y
>>  CONFIG_EDAC_LAYERSCAPE=y
>>  CONFIG_EDAC_HIGHBANK_MC=y
>>  CONFIG_EDAC_HIGHBANK_L2=y
>> +CONFIG_RTC_DRV_OMAP=y
>>  CONFIG_RTC_CLASS=y
>>  CONFIG_RTC_DRV_AC100=y
>>  CONFIG_RTC_DRV_AS3722=y
>> @@ -1095,6 +1096,7 @@ CONFIG_TEGRA_IOMMU_SMMU=y
>>  CONFIG_EXYNOS_IOMMU=y
>>  CONFIG_QCOM_IOMMU=y
>>  CONFIG_REMOTEPROC=y
>> +CONFIG_WKUP_M3_RPROC=m
>>  CONFIG_OMAP_REMOTEPROC=m
>>  CONFIG_OMAP_REMOTEPROC_WATCHDOG=y
>>  CONFIG_KEYSTONE_REMOTEPROC=m
>> @@ -1146,6 +1148,8 @@ CONFIG_ARCH_TEGRA_3x_SOC=y
>>  CONFIG_ARCH_TEGRA_114_SOC=y
>>  CONFIG_ARCH_TEGRA_124_SOC=y
>>  CONFIG_SOC_TI=y
>> +CONFIG_AMX3_PM=m
>> +CONFIG_WKUP_M3_IPC=m
>>  CONFIG_KEYSTONE_NAVIGATOR_QMSS=y
>>  CONFIG_KEYSTONE_NAVIGATOR_DMA=y
>>  CONFIG_RASPBERRYPI_POWER=y
>> @@ -1162,6 +1166,7 @@ CONFIG_EXTCON_MAX77693=m
>>  CONFIG_EXTCON_MAX8997=m
>>  CONFIG_EXTCON_USB_GPIO=y
>>  CONFIG_TI_AEMIF=y
>> +CONFIG_TI_EMIF_SRAM=m
>>  CONFIG_STM32_FMC2_EBI=y
>>  CONFIG_EXYNOS5422_DMC=m
>>  CONFIG_IIO=y
>> -- 
>> 2.34.1
