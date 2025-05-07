Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E315231C9F;
	Wed,  7 May 2025 11:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746616010; cv=none; b=G/We1SFmmcqdPvwHhoaaXpSFSlWSoIkMxyCit9ekVyK4WURYxLRt190QdgyvW1KjRnqTiXaKB2Ra5pKOpVklIb2KaF3nYJtDNLhnw3Xn6wietywY/nPPRQ2VOllo8821aWH4M6q7319HL70gplFLE00yYzuh0jw478aPBAx9qSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746616010; c=relaxed/simple;
	bh=aOkcXIBKJAR9llayqzp+OuFfdvHH0nZj+heQRjsae+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gpmKkXlNLRC2gt42VFYWMIQ1uEwtRbSJQr1JFq6fhy1SAiQaRZ29jCtJWc4UgAJWE7wtc5j7zV0jEU/f409mXfGd6dhzPlm6iukIQFBYX7u/AbiGhmnGd40UuhCc2GD2vLlznxnCzmBfu4Dl8PoqZCkB3X8mB3B1CW3fEIbOrUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y/pgV53M; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/pgV53M"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5f6222c6c4cso10048366a12.1;
        Wed, 07 May 2025 04:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746616007; x=1747220807; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=duDxhGSUaa+DKP3WsDW9rwdEeqUl14A6M/ImrV8wnQY=;
        b=Y/pgV53M1LUsw7oxKzlx3Kp4xxGli1l8THui/VYrbzdGZecy5CjVoO/bDh8bWxV1Hg
         nwX1OYnsxNcPkQt4qFErseVO+KZiq6DBDnNQFaNp/LoroperWm8BIKZXgIopGKJl3i4s
         toaCtUMu5TFDqe2OUsXgmKgX+S3UaLLsmAHOJH/JkcRDLm6/KpQpqdoWEnFqyp4+/yTH
         QUFWaF2eDbyZxyjYGddAmEhN+HgksTAdHQF7B9ycvn6UyWVYHIHaWWSWZ08l4cQcxzG3
         8JOq3YmmA/GRIcOsaEHoe4DGpWVe9Ce74mgk3Suh3Mcb+0U0HEtwfRR3GtXgNsv/VFqu
         YO7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746616007; x=1747220807;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=duDxhGSUaa+DKP3WsDW9rwdEeqUl14A6M/ImrV8wnQY=;
        b=mlp36XTjszEp04XJOJS/rNZkb8OmO2aN+Fwt9GtHBj1IAyl2YRnGNB7HmJt4rJTBCZ
         r3s+fE2387rEqyeHM6xiJhqXNYKjbRhXUNvQSeP6wQoTxNga0VzQ2XwTV8hPMR2wqjmX
         F3RnrGdZU1bRvXvnJFYTWhVpwJB888U66mF2VcDgs8vcFBFbbz3JzRTlykM3ct7MzcnQ
         7itIlp+hIiLpYWlyTpVa6hH8lGlF/kHFrPjyBNMhsdV047tWa9idluReOQA6veu5wqNJ
         wX+/YwHw7xbfE+Yxx52EnjyNhSLz0I9wL9bSijxZgyH+xomoWLH7EFElRQZWY0ARvqsE
         qVWg==
X-Forwarded-Encrypted: i=1; AJvYcCVyXyAsJALMU4taCvczYUHJJ+V2AOAA5s+GZw304+PBSjzcjLjCQDup4g6jA1mj8kPTXIjMRZahiIuMB1cG@vger.kernel.org, AJvYcCWywCNWBw0T57BIFfS+YEN0DKOdRR3hcEBSDoUCv/tNKre5hjbbEk2oOF5P4v65U9CLpM22sdnV/Kg2@vger.kernel.org
X-Gm-Message-State: AOJu0YwQgjfZGSDbYVX1fRnSs0DuHm01999Ct+tURO0Lqdxni2tXoVR6
	nNWX5tSxXbxS9jT7JusdzLgFEHiZKvllVZF/xqx72FmM6DXv+fnV
X-Gm-Gg: ASbGncvw2Do7JrYul8C6mFxx6qItR/jkB3PSwrx3B26opaCyzTcNFYLvnjMmHoCv9hZ
	QNhnbSAgoAOnZwamNZh6mhCNYfJ2Ej1r0geIBTCeKH+LUxWGBDd0CzcTSL5oDEUtmW4sxZddcak
	haFWKOVxu6WiPm1C3xxiG9fZ11Ve7oYnBt0rs73mBIjzkR5PdOLISeNIF8WE9iyfhOvZTF/+Rrj
	i8H1i017j7xJITGgoPf1Su63XMy+6vHSsL5DoyYESIYx8R6T2WkmHIrsxfNmKqqoLP36JtJIW8C
	1oe+fJg2AwRWgEsd3z+FcjO3vRNFrWtqKhCzj/uDlQuSAtTWug==
X-Google-Smtp-Source: AGHT+IHUTGuZKxGzeUHzGfykWA8vb3hzItLyZnesCtBXdESu0mFRGfHYDE/15YKTQH60qIZWWmK6oA==
X-Received: by 2002:a17:907:c388:b0:ace:d3f0:e51d with SMTP id a640c23a62f3a-ad1e8d89b0cmr288549566b.54.1746616006898;
        Wed, 07 May 2025 04:06:46 -0700 (PDT)
Received: from [192.168.1.130] ([188.193.103.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad18914d067sm888907766b.3.2025.05.07.04.06.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 04:06:46 -0700 (PDT)
Message-ID: <63665c17-da37-4b5b-9c2d-28d5a669680f@gmail.com>
Date: Wed, 7 May 2025 13:06:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] ARM: dts: stm32: add initial support for
 stm32mp157-ultra-fly-sbc board
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?B?QsO2cmdlIFN0csO8bXBmZWw=?= <boerge.struempfel@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250505115827.29593-1-goran.radni@gmail.com>
 <20250505115827.29593-5-goran.radni@gmail.com>
 <2d0ff289-06f6-4bde-a238-097d22573d4e@lunn.ch>
Content-Language: en-US
From: Goran Radenovic <goran.radni@gmail.com>
In-Reply-To: <2d0ff289-06f6-4bde-a238-097d22573d4e@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

thank You very much for Your comments.

Andrew Lunn wrote:
>> +&ethernet0 {
>> +	status = "okay";
>> +	pinctrl-0 = <&ethernet0_ux_rgmii_pins_a>;
>> +	pinctrl-1 = <&ethernet0_ux_rgmii_pins_sleep_a>;
>> +	pinctrl-names = "default", "sleep";
>> +	phy-mode = "rgmii-id";
>> +	max-speed = <1000>;
> 
> max-speed is probably pointless, rgmii cannot do more than 1G.

Agreed. I'll drop the `max-speed` property in the next revision.


>> +	phy-handle = <&phy1>;
>> +
>> +	mdio {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		compatible = "snps,dwmac-mdio";
>> +		phy1: ethernet-phy@1 {
>> +			reg = <1>;
>> +			interrupt-parent = <&gpiod>;
>> +			interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
> 
> PHY interrupts are 99% time level, not edge.

That is correct, but I am facing strange behavior, when I set 
IRQ_TYPE_LEVEL_LOW.
My board stops booting at:

[    2.343233] Waiting for root device /dev/mmcblk0p4...
[   12.638818] platform 5a006000.usbphyc: deferred probe pending
[   12.643192] platform 49000000.usb-otg: deferred probe pending
[   12.649029] platform 48003000.adc: deferred probe pending
[   12.654277] platform 5800d000.usb: deferred probe pending
[   12.659744] platform 5800c000.usb: deferred probe pending
[   12.665089] amba 58005000.mmc: deferred probe pending
[   12.670239] amba 58007000.mmc: deferred probe pending
[   12.675185] platform 50025000.vrefbuf: deferred probe pending

I must investigate this. If You have any idea, You are welcome to share it.

> 	Andrew

