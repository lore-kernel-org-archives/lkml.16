Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C31B28C873;
	Thu, 15 May 2025 08:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747299171; cv=none; b=GG+jHnGuoNjXYGWeMvPEvlnqYcQE3T3HsCVlcbajFNZUCtxUwmkaKcPJEjlE541oV1lqVjl32I5shn7+NFaQoKexZD5YnmVl4oFUU+lAs5epBBG/AUugoD6lvjdknsKvkbfR0Lsb/BmYMDWX+jTEaqGYzYcEF7DAbhrng90vsFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747299171; c=relaxed/simple;
	bh=baDU5OetjJx39/uqBkmmFjvG7V0MajD4w+Wf3Mhy0sI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YhwWbyhphHfQoxrWxLrvgzdRGpAji0bzGwvO7GBiKkmguDRPUwTL4fUuSV/HKKl8J84SJ7HASzpm4TfC66hISx77zUJkXmir6iA2+VTQoBRnrnKu1Sy92RX2I/YtkGKbyac02XYkMOJRZZB43sY/eXWf/kifJ3Sopby4yM4/veQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eciN1sUm; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eciN1sUm"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54e8e5d2cf0so774622e87.2;
        Thu, 15 May 2025 01:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747299167; x=1747903967; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+nMEUq5ozL3XCKx6Xei2teXG7hWWZhoXqA/EoccK2ek=;
        b=eciN1sUmtr+oBCcIU3zv3Lgxl2s2fm2KqQSanLhwvAqdssKrTDn2Du+cGordkh7osW
         FHMenCdTp3ZZGtrdBciHhVgRhYgztSKiobESTE/RDYH38NGcr/crmv9hUs/KCZKhu2DC
         23a4jTgb2Tjg5QtIvQOjqoa/CAHKXNHUDWa01vDWULgdaI2k1IEFFjJeml4DwjE1R5Zt
         09J1Rl3kBZPIn4emkXR2KB5B3fRmi4xtpp8OG1v+B04lVur+4wMbySrTR1+Bk3fa5FCr
         3xpyUq2oNw/icAL+PL8UgWgj50GnB2kOHJzLvxF03CmO7zNVg0/mS0clGKhcE2/khGfr
         diXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747299167; x=1747903967;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+nMEUq5ozL3XCKx6Xei2teXG7hWWZhoXqA/EoccK2ek=;
        b=uNKYg/tLfsjfcueZaVccrVJmLE/ahs1iEAKHUOoMCafGPr4vd0Yv9E00icYnQu+yoL
         rN0x3kuso2d1oW9VtFfRDoyaqns87tbEFHAdYRf91L9ivMTCdFnjcOjoQhZEQ+HosS6B
         kAskiWPcjyGmCdk4mE2nPwao3qWKkLm3HOM0SQ/OFuhUH4xP4/3o7uJR5UQkh4owc062
         49HxjSp0CHBBEbukYaKNDBAnKQWN7YFApLx4oI0z4YfM6rl79cMnwfxaQROwrXRFHz0z
         iYRUAtc57OqVTkRkC/SqLAw1tcv3ClIgdrBp66lwmh5gsM6jl8onWjyK8xOZ+AwiMbej
         FP0w==
X-Forwarded-Encrypted: i=1; AJvYcCUGq0pPqBgT2+EsgJAO4ek1dgVdfzfxOnIVXzmPyWN3LYJoOB0QyXK9/x6Xi+kb7bwweOTlehVTf23n@vger.kernel.org, AJvYcCVeAh+GnByEBGAvQrC941wI3jwMKw1FEVzEFY0aqFnDBVFbULOgFp3SE4mcPXqaHsVMY/0DAi33KCc83pz9@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9PxSlb2veXFic6hANKbIQsHFCMkSaO25MhaIkuAXnS++7znPh
	hMzBAMvPtt02aLuRp6Obuwzmr5BaY1HZOXr+8OK8GBY99tTYqX0j
X-Gm-Gg: ASbGncvMPCWkA0bdZl7MK2AunZI+8IX4PwfjXwsM+LO9EtFixds3MQ85+4q6DxtzCnH
	Iy8d/60wQ+mfshKgHR624bLrPbGtVTnJxapz2QQy3VuAm+VhUu7xXmrf+bk+MYFx1lSxtTYmACN
	5evbpuGxX3dmwGGw7O71J7bJue3UlFEJM3UCSBmjtY5sI0kYgRXS2zYdevAQEQXOpfKx4wBfliG
	G961PN5cn8OLLXXwJA6YlW6D/cZtLj9PkQ0jOA2iK2YYGAqF1mHyRHExh+kKijkxHsNwEb1OV8S
	fcEkDKfuSH1g4zIbMJqlqkCx8x09cLPxjtkGqXT8Q2erleJdrGnlvCzj0DumdR2sSA6BD6jXiuj
	cMGL2WCUi8gcj2a04D2kg/GzQYWKg3psZ
X-Google-Smtp-Source: AGHT+IFr+Zu/wdjpllwn3ZdGFMnTZxToomXEA+mKUOQn0Jm/AWko6eEHsQCUeWofLoc5bYC55wc4SQ==
X-Received: by 2002:a05:6512:3b9b:b0:549:39d8:51ef with SMTP id 2adb3069b0e04-550dcffc1fbmr627657e87.6.1747299167217;
        Thu, 15 May 2025 01:52:47 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64ccf20sm2530860e87.239.2025.05.15.01.52.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 01:52:46 -0700 (PDT)
Message-ID: <057c6bc2-adf9-4160-9184-6438cbe6e9d4@gmail.com>
Date: Thu, 15 May 2025 11:52:45 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] arm64: dts: imx8mn-bsh-smm-s2-common: Define suspend
 voltage threshold
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
 <20250514082507.1983849-2-dario.binacchi@amarulasolutions.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250514082507.1983849-2-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/05/2025 11:24, Dario Binacchi wrote:
> From: Michael Trimarchi <michael@amarulasolutions.com>
> 
> Voltage threshold should be adjust according to the worst case.

I would love to understand why these voltages are set.

Could you please explain a bit further why this change is done. What 
worst case? What happens if voltages aren't adjusted? What is the 
current voltage (before this patch is applied?).

> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>   .../boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi  | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> index bbb07c650da9..5a1ec2f6a552 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> @@ -105,6 +105,12 @@ buck1_reg: BUCK1 {
>   				regulator-boot-on;
>   				regulator-always-on;
>   				regulator-ramp-delay = <1250>;
> +
> +				/* enable autosuspend threshold */
> +				rohm,dvs-run-voltage = <850000>;
> +				rohm,dvs-idle-voltage = <850000>;
> +				rohm,dvs-suspend-voltage = <850000>;
> +				rohm,no-regulator-enable-control;

The commit message does not explain why the software control of the 
regulator's enable state is changed? Maybe this should be in the 2/9?

>   			};
>   
>   			buck2_reg: BUCK2 {
> @@ -115,6 +121,11 @@ buck2_reg: BUCK2 {
>   				regulator-boot-on;
>   				regulator-always-on;
>   				regulator-ramp-delay = <1250>;
> +
> +				/* enable autosuspend threshold */
> +				rohm,dvs-run-voltage = <960000>;
> +				rohm,dvs-idle-voltage = <860000>;
> +				rohm,no-regulator-enable-control;

same here?

>   			};
>   
>   			buck3_reg: BUCK3 {

Yours,
	-- Matti
