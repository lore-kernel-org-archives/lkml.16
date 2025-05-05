Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307471FF60E
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 11:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746444981; cv=none; b=eLgH3T5Bp2tsxb/wCqFfyyIwRQCg5JLfbbbVqOAg97s0kVcf2ruX0Ge0k8WDsj2twxDsfbgVjEtXEnqoXZO7jrfA/Sj00lQfO9sQqa0nr/uQ/Y4eI8mAdpvqvYZ8w2z4yUx6PJUjrDQXqjFjKb9IU5CxsuaxU5UwhXnW4KKsTDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746444981; c=relaxed/simple;
	bh=6+6LzI3cPXZGRevprqXsbs7mizaq+xNCap1FqHvXGZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cOGn+bZ6pQ8aNROKrmQOqUH7NIfmoqq9q2T4RfObnWvj7dp0kb3ScMOmqmcp7LKU1EjsEoERDIxaSN9dPD8WzPvb8fadHZgslwF/CPtHYedi9RU82YxkDWGIhkhv872EDUS553KgOmU0Ba9ZQHb2kCDVBaw3GhoMSnMgdybt55Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=m9HGVmni; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="m9HGVmni"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39ee623fe64so4357377f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 04:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746444977; x=1747049777; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XEN+uxzlpyNm2pKAMi5M1wIDfAZkX7ftsbauAryH7ng=;
        b=m9HGVmniMu8VW1vQ7IUGPl0f9fUgEzdi5gyyuIVzmWM3nd8PEFYs8gel47P8COmuo5
         /dxAsFiWy24c2pGeCDQIhuJJrUbESGlorTgtlbx6fCNa3oV6ug/WLGA9c6S60sPN6IrT
         GL9pwtiMTUIMDwr0sPL8a1JWft5P5ASNovSykcnpMuAqPQUQ1vp4w/gDNT/8ALZXnTBy
         akAa2otCOJfkYgTr85EBjqZgzN8sjmjGxVdhFSAccUFWAsm1/S+iEIM8vIkQ0vXX128q
         n638GvKOKUYnGQN8TVLLOoaoDQZN3PTQMIyiDJjKUiM/95deU/ayGnAD7972u2G8UXmE
         +qLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746444977; x=1747049777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XEN+uxzlpyNm2pKAMi5M1wIDfAZkX7ftsbauAryH7ng=;
        b=VG6HMdetqE5ZE5iOwFr/sxA3W6QDPtNGYOnKM0YiNEyENWIGimbJTo4NifxBINQarX
         c1W4onDAGncaNDz1QS4pGBDgxsKhu3qLNh+GQfTRnZ5lBwPIK5Q0nSvw01jyzijl2tUk
         w8VehC8jK31fHPJmLo8mbvoXV/4Lj2orkCkpQ9UCmO9f2sBlV8qPwv3SB9PEFN7C05eg
         9ds/beaRpaiMVWOb5PeQtcQpfpn2FjtgVzOKgW/WOIIUtzJEWp9Fw4PeIGnWX6THbgKO
         elLvG/u2qvPB/2F6ihEG5WH+X+dmZh7fpIMl5+NFNEUbeQn6d+PaLrcgeat0olkAkjPl
         789g==
X-Forwarded-Encrypted: i=1; AJvYcCVPpAsvkOprAeHYIuZFp2M1hJ201SeY2mPxipcmcd79Bqf8wY1CX5zwcSvvos2ZivOXPCgQbTHm8SnFz3M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqX7lNdzbv+XKOndajiaUDsBn2RKoKHQmA0Eo1liy3zklQq2jN
	Qrs08bLIkHj6G2OTzliZzN9wMgNS2/op7XkAI9El5Mi98iDLy0P9Y5nvjuZ/HnI=
X-Gm-Gg: ASbGncuwkpyC2BDwBx7Y/DbSdxzkr2KwMFZkJddBBlEk5OeTm5LxcmVITGZX268BfEh
	FkX6dExy3VfxIDzEoH7GVdiJ+0vCVGml3huilkb/UoDhnYsTzlOZQvI/4XXkNaQpJH/Yw4AtbSs
	F+uPtw+QTVZh4P99aJPxPbyXvOqMoR8Qkfp6wZ2Igg99tX2ucP0Z1D+ix521HcpEVcSM+r5VPs8
	7AXsSKN1PcZxgTgTh2Bv4oyT+61VpOIuGJzAGf+XrkXoE8OCUWTCkokXgVfnUuZYyhKj7zr3/Bg
	vg65GV3mZCxaP5wbjrNOYf8f4OfXUmRXh3WxJjEKQKZiORyFbEkRgM0ll3/xJsXC3sInAv5m7mQ
	Lp7szdaA=
X-Google-Smtp-Source: AGHT+IHTOmIWFPX/MeaQQU4CMaDf8mN/ky6ULU0COcHUpnhRVcuiDnmIeGftxwou8pA/tHFTdIiuDA==
X-Received: by 2002:a05:6000:2289:b0:3a0:8c5a:6af3 with SMTP id ffacd0b85a97d-3a09cf4efa3mr5804818f8f.53.1746444977398;
        Mon, 05 May 2025 04:36:17 -0700 (PDT)
Received: from archlinux (host-87-8-31-78.retail.telecomitalia.it. [87.8.31.78])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae0c3dsm10443159f8f.12.2025.05.05.04.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 04:36:16 -0700 (PDT)
Date: Mon, 5 May 2025 13:35:06 +0200
From: Angelo Dureghello <adureghello@baylibre.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Beniamin Bia <beniamin.bia@analog.com>, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] iio: adc: ad7606: fix serial register access
Message-ID: <o3jxdmchpmn5edbeznqecslkw4tnrdei4qqnb66oyyqeizavmg@5uke2kr4hte7>
References: <20250418-wip-bl-ad7606-fix-reg-access-v3-1-d5eeb440c738@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418-wip-bl-ad7606-fix-reg-access-v3-1-d5eeb440c738@baylibre.com>

Hi Jonathan,

any news on this patch ? I would need it to proceed on other new ad7606
features, 

Thanks a lot,
angelo

On 18.04.2025 20:37, Angelo Dureghello wrote:
> From: Angelo Dureghello <adureghello@baylibre.com>
> 
> Fix register read/write routine as per datasheet.
> 
> When reading multiple consecutive registers, only the first one is read
> properly. This is due to missing chip select deassert and assert again
> between first and second 16bit transfer, as shown in the datasheet
> AD7606C-16, rev 0, figure 110.
> 
> Fixes: f2a22e1e172f ("iio: adc: ad7606: Add support for software mode for ad7616")
> Reviewed-by: David Lechner <dlechner@baylibre.com>
> Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> ---
> Changes in v3:
> - fix typo in commit descritpion.
> - Link to v2: https://lore.kernel.org/r/20250418-wip-bl-ad7606-fix-reg-access-v2-1-8b1ade67e185@baylibre.com
> 
> Changes in v2:
> - improve bug description.
> - Link to v1: https://lore.kernel.org/r/20250417-wip-bl-ad7606-fix-reg-access-v1-1-0ce341f3cfc3@baylibre.com
> ---
>  drivers/iio/adc/ad7606_spi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/ad7606_spi.c b/drivers/iio/adc/ad7606_spi.c
> index 997be483ebb93293481b922e13ece4edb47e940a..bd05357a542cf7234d5bb6b718829d6b720262cd 100644
> --- a/drivers/iio/adc/ad7606_spi.c
> +++ b/drivers/iio/adc/ad7606_spi.c
> @@ -103,7 +103,7 @@ static int ad7606_spi_reg_read(struct ad7606_state *st, unsigned int addr)
>  		{
>  			.tx_buf = &st->d16[0],
>  			.len = 2,
> -			.cs_change = 0,
> +			.cs_change = 1,
>  		}, {
>  			.rx_buf = &st->d16[1],
>  			.len = 2,
> 
> ---
> base-commit: 8dc6b228d746b1a900bed28568defb2266fa4c43
> change-id: 20250417-wip-bl-ad7606-fix-reg-access-729c21478d1f
> 
> Best regards,
> -- 
> Angelo Dureghello <adureghello@baylibre.com>
> 
