Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B361C289E03;
	Thu, 15 May 2025 09:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747300781; cv=none; b=n0Uy5Vn6sV70iIvgMRLRNagMYuble1mzTKRxWVstbD0+jMvlskFu49vmDJZc3J9urJ7vSioY5Bf627hkP/Aqb2dnoSbb80MQNFWiP7zlviExAuuD0SMMNbhzeQn86JCPBoc7kahapQzAx7iUbYHNihfL9fx/Q6fzRgFEk7JjAjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747300781; c=relaxed/simple;
	bh=f/hB+uXDPj6LiR+Uzv74ybboCFBBl/dQRkcdkfTtDF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iy/7WqY8wP15dCy/2/A0eyAJr81oj6qNkI80CL+6bP+4kUCluwGt2I9ULydf9DY+eifvn5bSJy70EQzJb73/V9jp2MQFDYcGv4MBHucuBZXZotUTl9ZhsVdNb6UGhUCw1fCUJ6WP2O+wnKIcEsOGVdGFUeIhsE8pTInfpfUYw8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BT7x78ik; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BT7x78ik"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so711067e87.1;
        Thu, 15 May 2025 02:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747300778; x=1747905578; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tAVVRaIfque3EwxDjB599VKRD3lH9ncgbq2DZrrZMJ0=;
        b=BT7x78ikq/EON3VR896BNSzl/NjLy+gfe1e4gb+6QxFyt8EcENSILo0PIRO1wJ+X0A
         Yoa0yCkCYTdDWPaDRkKn+SLqAeXxLP+sijCam4a2bVG4H4xRU6UxkMxjNvDga2Qg0VOd
         jTg8TdUGLjv60C9jtZRTj/lWEggX1R12TvGYdxza+DLYvG1thgSO92Bxxxo4S813xBKT
         FFkvw/evohR4Ksl2hX6HrqvOELYsrWNCQqqNL9pP3Bgu7MlfiF7m+IBWKtEZNcgUvuTV
         bVdkbIYVjo7ALw5KI+IGevcPSxJUoI90YiRUHBnjEN/cE1kAFB+BS02/c91h+6tEfGOx
         qM3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747300778; x=1747905578;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tAVVRaIfque3EwxDjB599VKRD3lH9ncgbq2DZrrZMJ0=;
        b=dX41mujzMnAajtHg2ByZirpht7bvjfACjI3oVyeXtYUi6DEku6SuBANsFVpHMbDJFF
         Vj2V+K8fkC6ErECUXHchwiDXORc+jTXBgmVegED7oOI1n6V84q+5uTDaDEaBcJcSLeIf
         +zMb/eniKkKQGhkLqE2SvYzwlZtS58tUwgqSREHCfLa1AY02psR00YBNcdiYND61CqKL
         230PvzGwOZJTj8XXM4xvm+Y6Px0/KZ5gWUyUqff4pGfzzV5qjCcdMdbHzEjKyJ9PHzqh
         Vzl8WDWjPU5K4faWp4n4CFKjQdaRtBKXhuQ0D71sPxlj5w5LiR4nAS/dHJ/hC/vUN0xu
         AmCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGIamhZso3PZfQiRljd7T8wXouueEBra8UdzvO5efWneJXJqobq75GVAto0k4nFLcLy3fvmS1IQ4rx@vger.kernel.org, AJvYcCXj8gGeqW93I0a9Wc0j27AxaisXXdLxDcC3seDL71n30//Erq/6624L54Mxu6R1+23gSC9m67jpeVeEhBBN@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy7ECs2lRY5pu6gr7dc0/q1CLfuwb5FhiSGXDsgOizvQkc2N8d
	ynYDjnxKOxoLeWxLI1fEmKjzTUTPXb3EWpaCldtED4yRc1khh3Fera2tdQ==
X-Gm-Gg: ASbGncuTaMmzSyHNTQxTKn7A79hUszn6beYhFozPGnf6LhS9acZutWOwGIuYR6sa5LT
	EteDfiPCWEGzDa1kkQ+jLMp5hN3n6rUrRAC9UtvgAGf78VV2QArLzeDcOOkgU0voyh52//jVwaI
	dlBAw/ITWMPEjAV1HzlguG4NEU1k/3p5jJXHdw3eFVFfwA9d+/2BRe79wiS91QQJ2EYyFwiDDqC
	wlOAMPfXpxfE7eSygOp1RbPf+ojneoNFGIhwuC7W/XMO3JJh9b+L7xk6qxkGXdbI213RgkXEVPV
	JpmbDd9TMdtlH7CgpLwcTO7cNQTN9QrlqlA5EwNmPuOKBl3XAezTsQ57+qOyfXrAuYf5S1EYJEO
	tDOIJMuhR3rPnejSNgkF6eoiCuiLkJEmV
X-Google-Smtp-Source: AGHT+IFBcq4DqfKlxPbw1MrLx0fBSBJx/jI1yd+Z2wbPyp9w0D8IUldy1X/cWkz4tAEtuvuqupGZyw==
X-Received: by 2002:a05:6512:228c:b0:545:f4b:ed58 with SMTP id 2adb3069b0e04-550d5f94684mr2399058e87.18.1747300777581;
        Thu, 15 May 2025 02:19:37 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc645cee9sm2562141e87.75.2025.05.15.02.19.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 02:19:36 -0700 (PDT)
Message-ID: <7b23de30-06e3-4f02-a8a5-90791628ceed@gmail.com>
Date: Thu, 15 May 2025 12:19:35 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] arm64: dts: imx8mn-bsh-smm-s2-common: Set minimum
 value for VDD_DRAM_VPU_GPU
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
 <20250514082507.1983849-7-dario.binacchi@amarulasolutions.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250514082507.1983849-7-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/05/2025 11:25, Dario Binacchi wrote:
> From: Wolfgang Birkner <wolfgang.birkner@bshg.com>
> 
> Buck3 is called Buck5 in the BD71847 datasheet. This buck supports
> 0.55...1.35V. Set the minimum allowed value.

Setting this to PMIC's minimum value has little benefits because the 
voltage can't be set lower than it anyways.

AFICS, the idea of the regulator-min-microvolt and the 
regulator-max-microvolt is to protect a system which can't tolerate 
lower/higher than NNN voltage. So, basically, these properties are 
meaningful when PMIC can go higher / lower than the system design 
tolerates. In these cases the constrains set in device tree should be 
strictier than the PMIC's range.

The existing regulator-min-microvolt = <700000>; could have resulted 
from the knowledge that the minimum voltage devices connected to the 
BUCK3 (5 in data-sheet) can survive is 700 mV. Dropping this to 500mV 
just because PMIC can go there might be plain wrong, and in some case 
get the device(s) connected to BUCK3/5 upset..

So, please provide better (more) rationale for this change.

> 
> Signed-off-by: Wolfgang Birkner <wolfgang.birkner@bshg.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>   arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> index fd12b97525d1..81fa0a8767e2 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> @@ -135,7 +135,7 @@ buck2_reg: BUCK2 {
>   			buck3_reg: BUCK3 {
>   				/* PMIC_BUCK5 - VDD_DRAM_VPU_GPU */
>   				regulator-name = "buck3";
> -				regulator-min-microvolt = <700000>;
> +				regulator-min-microvolt = <550000>;
>   				regulator-max-microvolt = <1350000>;
>   				regulator-boot-on;
>   				regulator-always-on;

Yours,
	-- Matti

