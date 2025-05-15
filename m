Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D372297A45;
	Thu, 15 May 2025 09:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747301329; cv=none; b=uyv145iik5Rt0V1oIobbZsndQqTWHZyJItOueflOBZ9VeQghORqOHklOn+DOufLS7rNW5qkGkodsHosiUZgxcZrejlCLmvcOMPULn1gw4Uj2iAcEERsI/BAsuHAdtJpxQ1uqy0UiNqJDlqf86BIjhrQ6IzTHreAmpdFbRQA/S0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747301329; c=relaxed/simple;
	bh=8HDKOO78NW4n9McYgFb9i+h1xt2fE41Co7f0h1JCzP0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ka5ilLG9mgWMCGLGkN4iTdOIji1xDmNLRGKhKRlj/C8ZZI/2NhMyEaY5379QOyP4tPUAiSB7eRstOcQblP8T8wCmK7iHlHfF+gDDc9cBUr2sgcY8wgBEORXUiu4ec5ld5jhucGNT//l7os7S5qGMBEKoSSpNxfjoHA+agVzpYC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kzNZ0+sg; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kzNZ0+sg"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54b10956398so826487e87.0;
        Thu, 15 May 2025 02:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747301325; x=1747906125; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oUZnZ1nzA1VahWTXdD9nimd4WKEUhUq33YKSElfIzC4=;
        b=kzNZ0+sgAtXt6OMLSIS7JLJ7WdN7k3VrsZt89yuHdc4NR4cifthDdNQBs2vm+QCNjx
         6JF72Vo2NeFb39s3Mwibzc2yYronm9lAhBQ7DOwxeJhVbKTsaVQgcZkYZxjy8bC0n4x2
         E3MvhVh5oFo+bSsCNAExfSnm5EGYG1Qzv3nM1m7y/K89Ctac1bw51l2UJeQn+PJsfDs1
         iI+ZokRdHVFOXQIVp4nKqgWdlSRsFZu+VirWS6rbZ10DRipHABolRl8p5V9HdfLwn7NL
         7sGH2qaaX/fE1I41XwiI3pR7HnJa7DMR6gCkFpT6myAYYMqEoP34G3iTO+QNPjA5y/fo
         Iiuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747301325; x=1747906125;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oUZnZ1nzA1VahWTXdD9nimd4WKEUhUq33YKSElfIzC4=;
        b=YLhn+xE2+7XSyVk4iPfgpBLlfGYXEJqppDr54RBqi1vG6LWKBJQFPP1JjC+pjoI/a/
         bQXMqV39vaAaGFZB5JXjZ883HdP92qii7ohC8/wkwpAwbgW01rBYpW9QKZycZEwMSXwS
         sasEQKGDsNVogzBmqWo57VCaliD7rNmLieoFD0HQfJ0rpM/H51dqsinJSiRcA5ELHOPd
         3bF88c/wZHOWHlE+dt2jZ9aM7uosDOZRrVU5klmsUafLJKin2P5O6l6XmKIvgDj7vh9k
         Zw4QC6WvgxkK6eXDIpe6x1TvzmN5D6cE8FB861xn4HYjnkZ6Ed4ND3ZzLRrEGx0TzN9C
         fSYg==
X-Forwarded-Encrypted: i=1; AJvYcCUGHiM5AUKsIhw2Q+KHsI1GFZqS/7ic4DausFfIiOYQolnCjpj1608FA/NW4L5q/tX9/WAnF98jE13V7mCU@vger.kernel.org, AJvYcCXHmaurjFjhbPcfGFNVH3jvtv+r77XJj7GCZABcszWt4SwUj0e8xKt/vzdy+SBfQD4bVmvOefzoCEG0@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2W8OsEM+j4iobKpHnJO2qp885vpm8NBBO7LjpQZ+7VzUZrvNS
	M7mnlckiwqQDyAJTkkzFYli9wZrbHf+68f48EisovG0kb4XY52X2pNQW
X-Gm-Gg: ASbGncu1rN+L7Lu+RVdp4sFbE+qRy4f6d0BoOYRqt37o+SqLUQ6j0p0tAusPGLveNfj
	jC2rG5kfbtrlkYqOhvMmokHqCN0GxfW8g5bWSEyod3szncpf9vdsouuz3cGlNjbGxoNGywIP2kW
	h2Z0395PTghKpPkSO6BSRy7D0ApB3p0b9A4eUDxH4INerUpV6u/XBoWRfEGtcuzf4ZcmNdjh+UL
	Yi9kts7OPTBBjoWdPFeaSwoiri/Js8YgeBfiiWc3b9v4ynuyRYqPWrxaqtT0iAUXNUat2mK+EAJ
	ZCgh9CSRBWG105NC0GW3+UzfcXrLJZqNC8bhWhrbOlXRczf1t5JELrQYcdjN/6MFYJsR8xYUC14
	vbs4iVqdpdAUzYKqSeyFhULvptQirtHFN
X-Google-Smtp-Source: AGHT+IGtzN/vJeQqjXNcCh6S+CyPGXXKJUFYk7VQPziFd4r34mBTi90PPXGWHwTS9SK3MYrz0Qwrbw==
X-Received: by 2002:a05:6512:b11:b0:549:9643:68d0 with SMTP id 2adb3069b0e04-550db97d223mr937454e87.17.1747301325041;
        Thu, 15 May 2025 02:28:45 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc644fafdsm2565109e87.51.2025.05.15.02.28.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 02:28:44 -0700 (PDT)
Message-ID: <fb5b60e9-eaf9-42bc-9bda-0c80bd55f81d@gmail.com>
Date: Thu, 15 May 2025 12:28:43 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] arm64: dts: imx8mn-bsh-smm-s2-common: Disable PMIC
 SNVS reset target state
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
Cc: Simon Holesch <simon.holesch@bshg.com>,
 Karthikdatt Anantharamrao <karthikdatt.anantharamrao@in.bosch.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Wolfgang Birkner <wolfgang.birkner@bshg.com>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
 <20250514082507.1983849-10-dario.binacchi@amarulasolutions.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250514082507.1983849-10-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/05/2025 11:25, Dario Binacchi wrote:
> From: Wolfgang Birkner <wolfgang.birkner@bshg.com>
> 
> VDD_DRAM was disabled on standby, therefore the reference hardware did not
> wake up reliable. Use PMIC reset target state READY instead of SNVS, to
> keep VDD_DRAM active during standby.

There is something I'm not quite sure I understand. Lookin at the 
BD71847 data-sheet, the VDD_DRAM is OFF at READY.

(Page 27, Table 3-8. Voltage Rails ON/OFF for Respective Power State)

https://fscdn.rohm.com/en/products/databook/datasheet/ic/power/switching_regulator_system/bd71847amwv-e.pdf

Please, explain.

Yours,
	-- Matti

> 
> Signed-off-by: Wolfgang Birkner <wolfgang.birkner@bshg.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
>   arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> index ea8d741c6904..633874b3bf66 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> @@ -94,7 +94,6 @@ bd71847: pmic@4b {
>   		pinctrl-0 = <&pinctrl_pmic>;
>   		interrupt-parent = <&gpio1>;
>   		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
> -		rohm,reset-snvs-powered;
>   
>   		#clock-cells = <0>;
>   		clocks = <&osc_32k>;

