Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD18211460
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 08:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744964377; cv=none; b=DbgXlMB84a2eHJy8UwDUiAgXQGRs3lfCpd14SralP254R3reb4DtLrcQ8wtO2HwWGkorAzFTE99n4Rs4ENz8LfxCoMwjzD9WK3+K2WB+K3ZK4cAALzHja++PzrvveWy8ymStTXmses/OApVXkauDe7Wr9TEQV//h5L2DoI1NwNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744964377; c=relaxed/simple;
	bh=OyANNumqNGehMqydbT5YMfLr7i8JOGPuL+legh4Nnyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JvGptbRI1oQjELurUQdjUn9A2PYGXy0lVf52hj5Caa9XRwcclbraIKGHOL/MYg5kilVCvGB2Bod7569OZ6wgJEpAleInpqw28ENJid54px9FSdBxn1GYztOj4c36Q9YejSecas2YAQ+D/OKJUZW7uif+sKOCvaaJLf9c81zFLdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YcTBS4l6; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YcTBS4l6"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43ede096d73so11285525e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 01:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744964373; x=1745569173; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L630Qky/UZ9kI7H0yEROeZ3XG2IusjzeuDyDM/AGMdw=;
        b=YcTBS4l6O3ZSPlDTtRF+jrzXv5lAIuT1X2lVKW5Sk5v1I4R4gi/8eIjsqyHymN6wZ9
         u5YzPyLDu3YXvOijF6POiBJvZ4DofWDfCHfz+/dxd653CUggHyKf5QIjN7FSrvUCdfi0
         x2CMz4ei3FTmVkLHcBto55wrwVdTWqAA76u2I+yV4GJNgb1bSTeoEL9C5PbrsYOOmqrO
         9E5VrCGu40v2eQrKj+gdgyRRU4BJLUBs/4SPRmejtt2ZcR/gbLDb2r5aC1f/iE2DEjfl
         Ga+0Ljm52RQ5sNzyuXO1vjsVkdQD7Ar4Me+4d3QuqX4Dd1V4OqPNgVys1+xkqy/KJREH
         36eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744964373; x=1745569173;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L630Qky/UZ9kI7H0yEROeZ3XG2IusjzeuDyDM/AGMdw=;
        b=elpUaY2oeGgT3gEUgZquJRs3X6j6jU9nzyPEzaG/2e9KTUao56fhQ1+xy4xcnSzu8A
         Wp2yN5XwawKxrHlYdVV+AqR1GhWATs2tvWivTnaTFVfUFb5br5ARvkAkvth6LRxFjkmm
         hOZ0MLo/yHIJo9HVl/lB57FZmKlNK2GYYLvYhQxNFbvjcEjkI7GltU8aLYe04Foew4Gr
         l6IIL18GJlSZSPbUUBnADS1nRFRtIPG01HFdlwA4hgaXbH0eID4SeBUxD82jQ1faiJft
         KZc1B21dSVCLHXjsVv8haNq7uwZfOt14c+TBnP1+T38Hv2ksbkaBamFlA6WlNYHZqAmG
         TJww==
X-Forwarded-Encrypted: i=1; AJvYcCXRO8PVtF2B+mu/QgdJL7H6jrp30N1whN79gGGDB9baKRnuAq02aFCc+NJPD9pZ4yDNCHpNESmx14ap0/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY5VYpTiFeqX4+IAtPG7HI7FAkdpQ/hlRmLbSvcZrybybFmggY
	1Fo0NazX0ek3l87GBmlkmFmIbgTzxJNrKhdPCdAcCkxNFd9TQkEkogK1WpIykcI=
X-Gm-Gg: ASbGncvaUMAQf/8rgHKcVXEit2TyAFGzMaB2KPhUSmPUSo5J9am0zTnzowc6ut7m+bi
	BRhHmdBGbrMvd75yTne5+aDq0tgLoHMQCY1vc2DPG7VcWPm7fJuf4gq+W2hmYQntSNLzUtrMSUA
	PZOY6+i+1KgoDFlhHIPnj75KtbZhT1O0TmAXC+xlHgXEbgPJj0blxO6b0J5Lzb10AE+dMdbHMgP
	a8RvP/rArABGKfAb4uYtZxZ6Y4nUSBy/F5p9iw+UrPlDcMTBs7aJkA7srvM5+dA93NHZ4ZQ46Ns
	59Nj732Ai8IWhpR+B8YL+5VgAwEaxiWLGu/rip9Ov8eNKhBb9ygt/3W0dadGFHqLSh5NgMbJAty
	MEh0=
X-Google-Smtp-Source: AGHT+IHprYn4MpD5iVpcM5XtKPgBCL4PbwyZvt4l+PuNDtvWyynJ4XbaF2lxnyotFbTDZATgIX8ZLA==
X-Received: by 2002:a05:600c:35c9:b0:43d:fa59:cc8f with SMTP id 5b1f17b1804b1-4406ac412f2mr11115405e9.33.1744964373510;
        Fri, 18 Apr 2025 01:19:33 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa433354sm2079318f8f.32.2025.04.18.01.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 01:19:32 -0700 (PDT)
Date: Fri, 18 Apr 2025 10:19:31 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"open list:SAMSUNG THERMAL DRIVER" <linux-pm@vger.kernel.org>,
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH v5 3/3] drivers/thermal/exymos: Fixed the efuse min max
 value for exynos5422
Message-ID: <aAILE01SjRR874jc@mai.linaro.org>
References: <20250410063754.5483-1-linux.amoon@gmail.com>
 <20250410063754.5483-4-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250410063754.5483-4-linux.amoon@gmail.com>

On Thu, Apr 10, 2025 at 12:07:50PM +0530, Anand Moon wrote:
> As per Exynos5422 user manual e-Fuse range min~max range is 16~76.
> if e-Fuse value is out of this range, then thermal sensor may not
> sense thermal data properly. Refactors the efuse value
> initialization logic within exynos_map_dt_data function by
> replacing the nested if-else statements with a switch statement.
> Ensures proper initialization of efuse values based on the SOC type.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>

Same subject typo: s/exymos/exynos/

> ---
> v5: None
> v4: None
> v3: Improve the logic to convert if/else to switch
> ---
>  drivers/thermal/samsung/exynos_tmu.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
> index ac3b9d2c900c..a71cde0a4b17 100644
> --- a/drivers/thermal/samsung/exynos_tmu.c
> +++ b/drivers/thermal/samsung/exynos_tmu.c
> @@ -899,12 +899,23 @@ static int exynos_map_dt_data(struct platform_device *pdev)
>  		data->gain = 8;
>  		data->reference_voltage = 16;
>  		data->efuse_value = 55;
> -		if (data->soc != SOC_ARCH_EXYNOS5420 &&
> -		    data->soc != SOC_ARCH_EXYNOS5420_TRIMINFO)
> +		data->max_efuse_value = 100;
> +		switch (data->soc) {
> +		case SOC_ARCH_EXYNOS3250:
> +		case SOC_ARCH_EXYNOS4412:
> +		case SOC_ARCH_EXYNOS5250:
> +		case SOC_ARCH_EXYNOS5260:
>  			data->min_efuse_value = 40;
> -		else
> +			break;
> +		case SOC_ARCH_EXYNOS5420:
> +		case SOC_ARCH_EXYNOS5420_TRIMINFO:
> +			data->min_efuse_value = 16;
> +			data->max_efuse_value = 76;
> +			break;
> +		default:
>  			data->min_efuse_value = 0;
> -		data->max_efuse_value = 100;
> +			break;
> +		}
>  		break;
>  	case SOC_ARCH_EXYNOS5433:
>  		data->tmu_set_low_temp = exynos5433_tmu_set_low_temp;

Thanks for taking care of cleaning up this portion of code. IMO, it would be
interesting to go a bit further in the house keeping by replacing this big
switch with a set of structures stored as __init sections. The initialization
finds the right structure and does a structure copy to 'data'.

It is up to you to do this change or not.

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
