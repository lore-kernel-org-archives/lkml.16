Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8CD2AF04
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 00:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746060430; cv=none; b=PeC/AI/glxCKddxyw37Gdqe1IlVfPgbrueIvgC8uVxEMl9401q9QjowJTYawSoieipbw/RCxFqh5Hu0C07hTfzzHRZLcugXYW91trq7ej5GjyK9oPbHhWPblg7iBX4+r9RLKej7CkMrT/2nEDRmE55/koGuieeDlZG9kOEYdI4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746060430; c=relaxed/simple;
	bh=Icb+pZJ2iMM+dVdas91milhwACkwA8zPurhW9pyoKvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aoDxaod+9DO3fH3eTRH5gI7bkHRh7JT9F0GkVc9WTBILYMTKtkWy8QKJuMMYkxpCHZvV74vJ04b3D4lFbvHH5UwQjSAgd3gFoUk7DbqkGXsPqUaGWJSfnwkW4BDQL9VUBr2slu9vJF3oYzz1gGtz2SU8964pLz2UQuDydmc1gV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HyYpig2A; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HyYpig2A"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-441ab63a415so3890955e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 17:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746060427; x=1746665227; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CtBcAAqRumzpJ4rTrz/zowPnd5Z+XJBF3Z8VAMzb0d8=;
        b=HyYpig2AIfYoeUAq/llZGud19quXMEWFDG8DM9O4LGpGU/KsLFodxu1qsKxNbHBlcG
         5f3L7EPdRP4cyGDtUQIKlIsG6BxylFyWcsjJOv+5iLNjFbRlbzdHOn1+ciMu8zfUkISB
         dAkM/Ijq2ksbbhviOiTNnz3cL8PVsSs3nqpmwibjlj35qWLf3Db3g2cRcWoDqCHtKQ9L
         DdvUaEA/cdybN7+9Dq0gqgcw+TfNd9IAWqq5XEm1wr9eVHRB6Qs2Xt9sU2yBlWQPsxDy
         6xMNU0r+hoe8CEjAjnnDsLxcBpLwL/rBO1hvphfaJnttoU5f0vtmT/xRVSUsqGlt5iyZ
         0mSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746060427; x=1746665227;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CtBcAAqRumzpJ4rTrz/zowPnd5Z+XJBF3Z8VAMzb0d8=;
        b=gpvhi628I17VLa8xKQai7XIa3fCYyLx8DblpHJUVgvwhEAq2K99j6R6inUpQe0H2Ja
         iKs7W7cH6TyfEUWo/WjIgCKKYfZ/rbIbqZH1RDLlaHzEkw46uOtj7VRQR1QxNnsYMhaZ
         +8ruQqxuhSP4BZ6BA87Mel8J0trmussR1M5WvJomC6NxPUrWhOtxL7U7kn+EWjTnNC0g
         GKNcXE/9kACYi/ktRUwEN018h6PF+66GSUi5UC6y77tqWB/iJatcdmsHMI+9Hk3VokQ0
         VK8cpAToLWcZYgI6qCCOUH13WEPFphqbmjDWrtehPCtaZVBJ+rRw6u2Wi3eiHZYUPb/e
         uE+w==
X-Forwarded-Encrypted: i=1; AJvYcCUib4I0VDcJTU+SsnEbUvxnK8YlzecQuLss78zN0+TBu0HUOcrMCBFqeKEriwQ76vx6eLuAnmDOqpUeJ9o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHoZSfQGtkR5Kp3CVDAhsAcBjqBnbE7t+iEnncIvHbrt6ZXGpj
	CsMyRHJqVrgfL/s1c2sTJrD+O/kj8x4R56gg+rtr5sg81827hlotm0HvrmLihrE=
X-Gm-Gg: ASbGncvHr8qTZCQM3pUIumX+GebdrpmNsa5HRfja3BYrrAyX/jGXQSZxsOqvHwmNPPs
	0iZODjSWPtgi1NSI3y+QvkXP1zv1gA2aqOmFhB7WBZ3ege4EQZp5kTeesuAxY0eHAA9JSvq43d0
	UAIWrRfN85OF3/+jJikX5/6e52Uwgptpv9R+5FNPycdxWs59LPc8O779TtUaGwJF9YHbjeZpKUs
	J0eQxMlYKsFGvmrqiboLV4H76DOgL9cq6UgkICI3+ztmrAC687g8yTQMcrH3hqGaOvqt3zgS7N0
	rNEeG5Kwrxv43ksY+MKHj8SZEXvPfBGlT4DVPqteNpqJ/JAyVfJRTIJ9YiiiEt1yAH2e5BsU9pR
	50L9bJw==
X-Google-Smtp-Source: AGHT+IFmbHtqypFHAYEgz34XK2p65MJanyk+f1Rp4pEz/8sdgn2En5b9QtiOnbh8idGH+h36WMLiqw==
X-Received: by 2002:a05:6000:40c9:b0:39f:fd4:aec7 with SMTP id ffacd0b85a97d-3a08f752673mr4547696f8f.7.1746060426770;
        Wed, 30 Apr 2025 17:47:06 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8ca99sm18107538f8f.20.2025.04.30.17.47.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 17:47:05 -0700 (PDT)
Message-ID: <5aa6b273-bb99-421d-a2c5-deef7839d284@linaro.org>
Date: Thu, 1 May 2025 01:47:03 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/13] arm64: defconfig: enable rockchip camera
 interface
To: michael.riesch@collabora.com, Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>
References: <20240220-rk3568-vicap-v6-0-d2f5fbee1551@collabora.com>
 <Vz96yQCdUZBjbVQtcrC3gaAUO1ximV0-SLkMByaR1p3EoVY61j98hMKsCQf1K1MnhDA6w92yhopnWMuUQRaRsw==@protonmail.internalid>
 <20240220-rk3568-vicap-v6-9-d2f5fbee1551@collabora.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240220-rk3568-vicap-v6-9-d2f5fbee1551@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/04/2025 10:15, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> The Rockchip Camera Interface (CIF) is featured in many Rockchip SoCs
> in different variations. Enable the driver for it in the default
> configuration.
> 
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>   arch/arm64/configs/defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 5bb8f09422a2..110ff52195a6 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -858,6 +858,7 @@ CONFIG_VIDEO_RENESAS_FCP=m
>   CONFIG_VIDEO_RENESAS_FDP1=m
>   CONFIG_VIDEO_RENESAS_VSP1=m
>   CONFIG_VIDEO_RCAR_DRIF=m
> +CONFIG_VIDEO_ROCKCHIP_CIF=m
>   CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
>   CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m
>   CONFIG_VIDEO_SAMSUNG_S5P_MFC=m
> 
> --
> 2.39.5
> 
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
