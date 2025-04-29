Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCF825F7AB
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745915731; cv=none; b=TZVu1pUrsqy4sHEPcC1McIk72DIBr7LX8VAD/BzIYuFOsEnLZMInd5BrBGxaTNPqIgmHnlLWgofMg3ezsur0AKmZAx1q59Fna5CItsUb0M4Pnh/3OFZqRXJ75j6npo0Ui+R2pEiT6CyPNnBJUJ2rFZWBzlHEtZIsbTFteI4ecJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745915731; c=relaxed/simple;
	bh=ZaO56ejThSxRzS1nBO1hWUV9qmuFiNNZzzBGRbfNtPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HLc3S1DurEiUNU0Sb/IC1qbisIUEGA29YB0h6Th4lICgnkEbOQrrtDO2na+zqo7Fq1uO4/o2vq12dvuW6HapZhmRgqixnA2N6uWl3/NOC4P/zz+/KEpSR6YOnbjwXMCPE4jzoMGVtz9Silm0B+wuSs0AMRZ6dHkr6uBkSULVjiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=jPPFzB0N; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jPPFzB0N"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso55430445e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 01:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745915727; x=1746520527; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hyI+vkzvATQ+oPRkGM6xS0Ik29eThJkeSR9qIvKwiD4=;
        b=jPPFzB0NH5NI/kMCO7W/4UoWXwo87888+JuHw6RINARoMGZOLdQWwidTpuww86xo9P
         Yqr/EknhyW2azq+2QfyUFORDA6o8NhMYplWJ6NCYSp6LM7DziAL0Ft7tTDLbPkbbj2Hx
         BA9Okf6G6H9DAIH1PlJhGbunQbrWc9bO5kbjykh+A7MwaFxiqKTLXKQhnHYGMtM7TvNn
         4sZdLJqgqIxqzCjlDQa9on6zpvE/IM6WX89TD4QvHYNyfAw1mGLgc8zRPn0q8SvEEgPS
         rLjj/NExwt8C7JGndnzvvB+0HJkIxf9dN2Fuk8axLyWUSgoh6gkDACVUZtIKV6TQINhf
         6k9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745915727; x=1746520527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hyI+vkzvATQ+oPRkGM6xS0Ik29eThJkeSR9qIvKwiD4=;
        b=lHqWgYRsx8PkYqW+yfbM/wBrdORghIQao4OTO6e+f5n0UQjVwhFsDnLOapxnSDm0qE
         1yUgyQpijGzKxsee56jt3Vamk+gxjL1UOZUzlO8+/JRsl0/jNXdwiQGCriVdIfrVy37U
         hNIC/GMJSaSnJeuAlcUbcLPHEFpNJM6prDOa2WzsfjILaOmtUGFBFUqlNCU3ICVscULs
         2qsBqOh3RDypEmpQbqashmxO3xaGInOpuDh28Xh8fV6QdVZknp2A/o3iuaViA/ZU1DDH
         ZirmxraMItAfu4KPzhJFMCYZnddL0DtxfcbYWh+XXr1n/E+79V6zRWa99gScZS0/tLqn
         ncJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWP6fseVS4SOGDGNmhhuA8xgDp4Hi/hIJ6Bi1hsK0uz2zGLP0deair5614M78pWV0gjQUUeeehBdfcFRZA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLRFOfQP2XdEZSC5KUOC4qHBhFaLlPp/WtJ2z2e3puKuOvb1Wy
	vmTcZYS8rbP3oiHGYCtY/zHo98KRMT+C+s8ixIxnezHBNc80lS/p4Nkl+nnKO2I=
X-Gm-Gg: ASbGncvfCqwJZuQ7tjt6Trps9xSvy3Nz+jDSMqUZ3j6gjCpR0tTpIFwkBGAyZmyk6WA
	4u14AfvKIpP762Ac28N8ReOL3dV+dLNk/voRYzbFIYfrQXmxoRV7McUupuJ9FhaiBBzrFx0hagZ
	+3UtdYLixdOhw5mXuIhyH5yAtCzLOipyIfytFCXkjvEjtNjCACgRM0crNPa6TPRK6M3NvTPzT61
	B1+tdoTjdoPZufGIfYxmJ+bAQyqiAU3WZVeUCmR0yH+M+S/4/hn4Qy8Cqh+yia1kDZmqgee7kBk
	Dj5Q7W6BAlaCWwzeNCEAaQHK4EPw3IAJ07YC4dRBAD2ymdLdsYKCuL3rEla0q1mKjDVokHKWU52
	iijzeYQ0=
X-Google-Smtp-Source: AGHT+IFZhCkQOIyJ9oPlNzZA28oEmoeLDHWRYZCNcJUG9KfhtjcqugnktaaeS4AF/qgx1AjGsb+yrw==
X-Received: by 2002:a05:6000:188c:b0:3a0:82de:f228 with SMTP id ffacd0b85a97d-3a082def248mr6959999f8f.45.1745915727089;
        Tue, 29 Apr 2025 01:35:27 -0700 (PDT)
Received: from archlinux (host-87-8-31-78.retail.telecomitalia.it. [87.8.31.78])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e461bfsm13422566f8f.79.2025.04.29.01.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:35:26 -0700 (PDT)
Date: Tue, 29 Apr 2025 10:34:14 +0200
From: Angelo Dureghello <adureghello@baylibre.com>
To: David Lechner <dlechner@baylibre.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, 
	Beniamin Bia <beniamin.bia@analog.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: adc: ad7606_spi: fix reg write value mask
Message-ID: <upz2umlx6qjnfiw5wvheukvfvolvea4anq7hky2vz5yi2w5wea@ormxyycioexv>
References: <20250428-iio-adc-ad7606_spi-fix-write-value-mask-v1-1-a2d5e85a809f@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428-iio-adc-ad7606_spi-fix-write-value-mask-v1-1-a2d5e85a809f@baylibre.com>

On 28.04.2025 20:55, David Lechner wrote:
> Fix incorrect value mask for register write. Register values are 8-bit,
> not 9. If this function was called with a value > 0xFF and an even addr,
> it would cause writing to the next register.
> 
> Fixes: f2a22e1e172f ("iio: adc: ad7606: Add support for software mode for ad7616")
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
>  drivers/iio/adc/ad7606_spi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/ad7606_spi.c b/drivers/iio/adc/ad7606_spi.c
> index bd05357a542cf7234d5bb6b718829d6b720262cd..6c1228c7b1b11058cb5186513f032f7c8c8aa8f4 100644
> --- a/drivers/iio/adc/ad7606_spi.c
> +++ b/drivers/iio/adc/ad7606_spi.c
> @@ -127,7 +127,7 @@ static int ad7606_spi_reg_write(struct ad7606_state *st,
>  	struct spi_device *spi = to_spi_device(st->dev);
>  
>  	st->d16[0] = cpu_to_be16((st->bops->rd_wr_cmd(addr, 1) << 8) |
> -				  (val & 0x1FF));
> +				  (val & 0xFF));
>  
>  	return spi_write(spi, &st->d16[0], sizeof(st->d16[0]));
>  }
> 
> ---
> base-commit: aa1bd0b0ad048855d9efbee4ee8b9a6eee536256
> change-id: 20250428-iio-adc-ad7606_spi-fix-write-value-mask-7acdcca46227

Reviewed-by: Angelo Dureghello <adureghello@baylibre.com>

> 
> Best regards,
> -- 
> David Lechner <dlechner@baylibre.com>
> 
