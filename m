Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F9C1BE238
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 06:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749105443; cv=none; b=n/jGEL7v8pJTKf852axZQNIznfX6Sqz1/MYa5XUx2/ByOW+t77+Pz0BFUiupQYac27vlRVQKKlrPRBP/gizYl1uqnRyNX1A6Ogf0HF6nTbO0ZDIRNH9MiD83VTnPNdoN2AAL6SDQlq5GONfNlmX+0kT/ltsaBFpLCVb+avTL9Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749105443; c=relaxed/simple;
	bh=SC5uOR2LzUcO4kdEG48K4T3TVmr8gOGZc2vFzWgfAzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L0yX83S7b+kye4j83Fo+AmWkNGfhBynMMTqdiuG/VFj/oF5H/7d6tYgqYlBxQwzl6XjCaTZk+krblBYB//DTZXBAcI6d1iVRP2On+nZKI9+b5kEHFEUPDO3wd3xEI+1umL+KBCWZhYhV9FGzJTVwtIOy6dL4qICAhM/1mq99eo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=foundries.io; spf=pass smtp.mailfrom=foundries.io; dkim=pass (2048-bit key) header.d=foundries.io header.i=@foundries.io header.b=EJRGD/bV; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=foundries.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foundries.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foundries.io header.i=@foundries.io header.b="EJRGD/bV"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55324e35f49so639849e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 23:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1749105439; x=1749710239; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kzft8fvBUk0mEm9pC+ysiqHnRwtZTTlz9Fajud+lXJk=;
        b=EJRGD/bVelkkdClmSgRGyOSyzvbuGUzfJvPzRHOuLDKd7PreoUYTRIDklWjAe/8FNz
         TixsoZi1cRzRm40tNBefCdJw7ksHfh2vU/qvdIiO+bC1EQvyYuAivwZZCBRJ2zQVf1ip
         db1TAZLXCylY8eAOBLD/TyCiCdW/AVjo9og4Zn8yQlmWjIiUGwTYLW/B7JfVmv8rmOF0
         eawTm+MYyM+wAU3p7BAc7mKq+wmyWww/n+xplMPJpguJ8AwdKW67Fsdn/LC8AOAnlt8d
         /4iYJ8ZIPvRI89l6yqZccwDDeNzDmD9JS1KqJQ+pefDjeC1VSzY1+1GdSJNTNQCl1qfA
         g2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749105439; x=1749710239;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kzft8fvBUk0mEm9pC+ysiqHnRwtZTTlz9Fajud+lXJk=;
        b=nlal1YpZ0jPGpF+PmTTj3q5wYAZJjTu5DFTxGeDQPxAsl9+Ra/oY61EkdmbjUtlUB7
         SdwcNZSkohmGyJQofmwRCImDvrk7K447VRQu2ZKYqkyGTD6VR0NstAvrcSqjnS870T9W
         24CJ6VCOLzWrFezOz832JtJUk2b34lvTXcjWjih7eR0v5XcBry2dPzfpUzwKhXaBFkwq
         bCqNmouRaEMek5pAkAQCwCOV3I7M3/YwBrwL2VNOzYxJAkfrVXOImcEciOBSAhlP3P6T
         GEz3UoolaPPystn+HhKaFAhOfLgdKBuw7NaCPoOUz50eb//B8eiB4gBcLozkb7Ix/wzo
         df3g==
X-Forwarded-Encrypted: i=1; AJvYcCWFry0b3r8qaxms+ndv26ReRflwzRTsgEL33ryagT+k9HWEnrW3n8FauGAM9nRBK00JU07Tmza7STFMYAo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+omD3CQKfxneIzwn0KEZNiAVJf8T+Y/waVm4rHAfbJugo9qxl
	FxzQHlgH4CxaBq/t964g5oVOuhAdV7UUShWi1JoDFdI3buGLQbDROhlfJNoJrtTeTx0=
X-Gm-Gg: ASbGncuPjZxI1yB47L6e89Xu42ISPUtrcQzOmg1UJBpJ4wxT8K7ts/kHCTkISHokK6j
	7LZ2mj5SmpFk/OqeIeyXLsG7K6EpHUcW/4qTkDDFfXIQ2FHb+KPhJ+XKuIExqyWjvISX+Uwz0XZ
	x2XZ3x28Xueyf64k5zqGx/ClUgcs5oyx+Ysj3Mzo1fbaPL56cyRyv+UJ/OwyS6qYNIymokDc+ZH
	OVjJE4W6dbF6FFXdrjYdeEYT3wjMJgE3SOY1Z7EPO1C+kuQGVd5mdBlzhRJnOGptFqbQV6JgrKf
	2ABR2iKdDMpWYsz6zMW4xHHUyE/26rcer9Sh3G2sOgC6mY6Y16DxUEYyKy42VgYqiNINKX1fI2q
	Y3ynxLKFuEc/903RXaHMFiHQ0tCuLQiNvqg==
X-Google-Smtp-Source: AGHT+IEh5kFBu9DwokZIMmdtqcjl/Iw20bSuedPbGD+ucOARVvJC2ImNqGXKQRyRhDnKRnsBLSyo6Q==
X-Received: by 2002:a05:6512:b86:b0:553:25b2:357d with SMTP id 2adb3069b0e04-55357bd6f7fmr1435916e87.52.1749105439330;
        Wed, 04 Jun 2025 23:37:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55350cab5b7sm1043831e87.52.2025.06.04.23.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 23:37:17 -0700 (PDT)
Date: Thu, 5 Jun 2025 09:37:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@foundries.io>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Add GPI DMA configuration
Message-ID: <3vwz6bzllvhtwcfs34ofygayiquxptu467i7hej2potqsss5k2@phxby4uvhiho>
References: <20250605054208.402581-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605054208.402581-1-mitltlatltl@gmail.com>

On Thu, Jun 05, 2025 at 01:42:07PM +0800, Pengyu Luo wrote:
> SPI on SC8280XP requires DMA (GSI) mode to function properly. Without it,
> SPI controllers fall back to FIFO mode, which causes:
> 
> [    0.901296] geni_spi 898000.spi: error -ENODEV: Failed to get tx DMA ch
> [    0.901305] geni_spi 898000.spi: FIFO mode disabled, but couldn't get DMA, fall back to FIFO mode
> ...
> [   45.605974] goodix-spi-hid spi0.0: SPI transfer timed out
> [   45.605988] geni_spi 898000.spi: Can't set CS when prev xfer running
> [   46.621555] spi_master spi0: failed to transfer one message from queue
> [   46.621568] spi_master spi0: noqueue transfer failed
> [   46.621577] goodix-spi-hid spi0.0: spi transfer error: -110
> [   46.621585] goodix-spi-hid spi0.0: probe with driver goodix-spi-hid failed with error -110
> 
> Therefore, add GPI DMA controller nodes for qup{0,1,2}, and add DMA
> channels for SPI and I2C, UART is excluded for now, as it does not
> yet support this mode.
> 
> Note that, since there is no public schematic, this configuration
> is derived from Windows drivers. The drivers do not expose any DMA
> channel mask information, so all available channels are enabled.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 368 +++++++++++++++++++++++++
>  1 file changed, 368 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index 87555a119..ff93ef837 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -10,6 +10,7 @@
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,sc8280xp-camcc.h>
>  #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
> +#include <dt-bindings/dma/qcom-gpi.h>
>  #include <dt-bindings/interconnect/qcom,osm-l3.h>
>  #include <dt-bindings/interconnect/qcom,sc8280xp.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> @@ -912,6 +913,32 @@ gpu_speed_bin: gpu-speed-bin@18b {
>  			};
>  		};
>  
> +		gpi_dma2: dma-controller@800000 {
> +			compatible = "qcom,sc8280xp-gpi-dma", "qcom,sm6350-gpi-dma";

This will cause warnings when validating against DT schema. Please
extend Documentation/devicetree/bindings/dma/qcom,gpi.yaml and repost
(as separate patches in a series).


-- 
With best wishes
Dmitry
