Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B46C1A0728
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 07:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748590839; cv=none; b=Xh0NGUiK0uEZKC/GUKCJt1kyr6o6QxBD1pL2USSKNLDU/aspz72VpB4hfYjZQAURqtvZyGHQ1u1uuh1A0zjes9wZ7y5rqaS6RPLzCuKn1xAzgoozW/shgfmdzIYYouZTn3ZZgl2OS6pfDLflSAe9sqjzixi2bNWlBSHxeFmNCN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748590839; c=relaxed/simple;
	bh=+bSTfW0qZWsboO+3q3mk5MmMDncUVPODEtaeJN2kvfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T+BRkM52nDQUbJEYqZAlPmvO64cHtCU9fx3Eoqaebfntuzi3lThLCkVL4BQCDpgEDzLZ5zMtV8WjfMoGSQxAKH6F+1Mhjl0LT4+2HSpW2bHI22VKQfQAp3rjF2GT8CAiurOi4Xd2LeqYOv6IXER2NDbYo4exDobsYHDg7JvH9hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=sibxdDmV; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="sibxdDmV"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-450ccda1a6eso15268045e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 00:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748590835; x=1749195635; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RvsDzEdeuDGjWO0lm4J7QVc99u01mGnvNVsg9qXGJ6c=;
        b=sibxdDmVBZB8bQTrBKCjmoe5L8NyGOVjYWVi4Qw7IInkIxmiwAuuDwgs/A8OOwKOyL
         4QNaVFUizkHD46Qqh/ku8f95FSHHE7s4e8AxCUKO3a3n77PMX+6fedgLx71M3YwrCzdt
         Bi0JBBIlU8usBXeJ/j/GsVhSDMZV183A8Q650kbbqSUx5WXHz3zMvuz4ABNDchHPmN7G
         GnFo42P+LZ8JTn7dEJKMO5UGyTQl6BmPhLePAFBpHre9IAr1k4vClhRQK8DJZHyt69sc
         +NG1CY/o2nNHWwq622Yz9HOmeB9ONFv8QS9SugSAQ4GV/zPZcI4xh85XwsIxDAtsTZT9
         kTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748590835; x=1749195635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RvsDzEdeuDGjWO0lm4J7QVc99u01mGnvNVsg9qXGJ6c=;
        b=jIrVax14esT5Rk18i5QVrTKWuIxIIPkIcUXFeqYHgws9otaAlpYWqNKnYTCNwB1HbK
         s3A4QheGeGcgZYWXQbtk3ds/p3zelhMOc9tL0OvOUab4A33Z61Tajtfpsbf+JotvVHyg
         4xxFUsx0pDRkNIwJtyooJzz4SSSnIgq1G6q7JaxPMYdWYar97PbOkMHCiSmLObbWBJGc
         ejigTzoZ6cZXuk8JDpg1dl+Fv4bF+BkCmr//TeuZqjuzwv4JrxVfHqDkpiua01np2Kue
         KV4vf68WEPoUCH3S5K8fX+B+T5Xc2Tjw52P5vFnqthzRdNFy/Vzy7K0TgB3YypL2ZA47
         K/rQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6q7RR2NarIZJ0KtMx0xmjC6N1SxydvgbNiHyLKslqFJBHZtBvghlxCjfem5u/yI6BQOSgbIeIwEkR5xI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZXqEhWw+xQRda+EbNFVrGBhumn0oJ/fUXepVpDxzUJwjXHYtM
	DQQtge/rZPOlfS1ibaTJYwqe+oA1p2kiIbpAU7cIrl3YziBrqk3xKBJA8ujhlBsMD6eIvKtffwA
	b+nxt
X-Gm-Gg: ASbGncs8puYqbwk3MaBnJct29PFoeUBWMk51bmBCw+RXNpvqWcE7EedoGl9lXbBsBhd
	kjNx7oDVEiloCoaZ9Ue2zY20CHHbqM+3cqL0o5lzAgx74hrIRLu4AqMXCYFZtehGPi4wTlFLs0/
	1CVSW/SHBcdAORx7JxGcTYLFFoAPbgFRap1smHxoH9iqtLsQUYBHojheRYJgTOTJayzeJKhiP/N
	kM//9+CzpJF8VWNpocWBky26nXtZN4u7gFGwevamBoe8IrcauiNPrExLZ2nnVofB705mn+HxujK
	Cgp4Qgp/5u2F5OwYd9OPcYHBEXjPWoM4Hgt1u5Zm6Gxs1aabfzL1XfhrRHNBSOq4Y4+dw1c6SRx
	1i8rc/PotyiIzX+uIWta3xvjgzDU2YQ==
X-Google-Smtp-Source: AGHT+IGjHYdSP9NzIcVp9qDzXHfmzguaFDJ8Wlu8Owbt0r83ig94jmYM/ZNsHYd/fb2Ac0iOC96QbQ==
X-Received: by 2002:a05:600c:314a:b0:43d:1b74:e89a with SMTP id 5b1f17b1804b1-450d880c950mr9802165e9.9.1748590835425;
        Fri, 30 May 2025 00:40:35 -0700 (PDT)
Received: from archlinux (host-80-116-51-117.pool80116.interbusiness.it. [80.116.51.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fb80f6sm10212605e9.28.2025.05.30.00.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 00:40:34 -0700 (PDT)
Date: Fri, 30 May 2025 09:39:10 +0200
From: Angelo Dureghello <adureghello@baylibre.com>
To: David Lechner <dlechner@baylibre.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] iio: adc: ad7606: add enabling of optional Vrefin
 voltage
Message-ID: <dv72cvn7rihavqxg6wnybhedhunabo7bremwb5pkutqljwarcf@eo6zc7vi7fbu>
References: <20250529-wip-bl-ad7606-reference-voltages-v1-0-9b8f16ef0f20@baylibre.com>
 <20250529-wip-bl-ad7606-reference-voltages-v1-2-9b8f16ef0f20@baylibre.com>
 <521f5868-5836-47d9-9a68-88a9d4e843f6@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <521f5868-5836-47d9-9a68-88a9d4e843f6@baylibre.com>

On 29.05.2025 12:52, David Lechner wrote:
> On 5/29/25 4:13 AM, Angelo Dureghello wrote:
> > From: Angelo Dureghello <adureghello@baylibre.com>
> > 
> > Add optional refin voltage enabling. The property "refin-supply" is
> > already available and optional in the current fdt dt_schema.
> > 
> > Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> > ---
> >  drivers/iio/adc/ad7606.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/iio/adc/ad7606.c b/drivers/iio/adc/ad7606.c
> > index 3bbe9c05b5edbc11e8016c995c6ab64104836e7b..21e63260965c32988d0ab3b8bb1201aa2396f1ba 100644
> > --- a/drivers/iio/adc/ad7606.c
> > +++ b/drivers/iio/adc/ad7606.c
> > @@ -1335,6 +1335,10 @@ int ad7606_probe(struct device *dev, int irq, void __iomem *base_address,
> >  		return dev_err_probe(dev, ret,
> >  				     "Failed to enable Vdrive supply\n");
> >  
> > +	ret = devm_regulator_get_enable_optional(dev, "refin");
> > +	if (ret < 0 && ret != -ENODEV)
> 
> < 0 is probably not needed.
>
The above code looks correct to me. What is the issue ?
 
> > +		return dev_err_probe(dev, ret, "failed to get refin voltage\n");
> 
> We aren't reading the voltage, so the message doesn't make sense.
> 
Is it better a 
"failed to get refin-supply\n" or
"failed to enable refin voltage\n"

?

> > +
> >  	st->chip_info = chip_info;
> >  
> >  	if (st->chip_info->oversampling_num) {
> > 
> 
Regards,
angelo
