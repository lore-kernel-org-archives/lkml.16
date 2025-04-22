Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47B122ACFA
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745304090; cv=none; b=DRJY9zsrjpmDfIe9+EnywOQP9CyO6xhgBvEp2fPGnfajgS/Jo9TiRrLzWNEzA9peDseXpjrv8ho/bSMMreB5tzcSqJfer3fhYJ/L5xbaPRywZ25LCLmsvlYm+PYk4Ic5HRuKLvlOay9w8UgSB0Bfz2QIXGybayQMf0yMvp8N/2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745304090; c=relaxed/simple;
	bh=b+b5f49WuUM/GVoPNhs0qQ519kURG3dfG9PkIjCLyIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PFnoiwPi42QdunhqFtFbQeQ/Jski4NoSLB7LzbPZAVZe5IfRuEFEz9LJYVppJd4bhFPHqftT/pQPfWdShJminlLdc49cpjBZa4ocFoRho2iBT5Se5RafXy5oEkU5EDg5SAgedyC85IKqsWCJVkZWR5suOCBzjhT3BuhAI8WXRWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mIZB4NhY; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mIZB4NhY"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so2845308f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 23:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745304087; x=1745908887; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/pURcEhBEHdxpYhnWEBaI44DGcypxp9nMdkY7Iw/QyY=;
        b=mIZB4NhY2Em5fUD+AIIZaDIGXx3gP4tfN6A2+ln32O7AP39GEajZhAZrgE8y4l5Jst
         hOfXTbXTyb++vmLLReUyPXoyXbEPbbQUlt3EIEzswb9r30MhOr2ctBOA1e9TeGFNhluJ
         2is9+ydhd5p24+helWXoHQ8sOGeslEsckXz9svyHfSDEgUxh9cfNwk+2M+jMIpxj44U9
         7yKeHsSPOwDeCRp2nUv2GcvSoLIr3GjPOtcBfgsHXDKlSFKOfJXicfCRN/Yck1w14mbp
         ceE4rulaZiJhIMa41Fph4vY0HqWvsrAZHxPxqI69KRqJLVXaLoK6GcRTnm+vmbXaPAuq
         wymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745304087; x=1745908887;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/pURcEhBEHdxpYhnWEBaI44DGcypxp9nMdkY7Iw/QyY=;
        b=H+T2KQt2i5E23vpTjngjPf+/a/vVmhGYChIZ07i4+7Wp8V4VvTsG9525glOG/xooEn
         tIMmqe5hj5AtrAB3oHefmEb54wfZ+BW2mz5jlEM9r0UuUa2lQ/+fDEKDgnpbar/OUg8U
         d74/qNNRJkbtIun1HNxrF1EPwKqA3lO5RaSRemwhUrkpDhcC6Q5JEvwxAzwtUOg1Fk9l
         autsRGnrSNOMTMf7g69S5zXh+0d15zDTtXQtf+wqaJLZqcKMnIqnvZkcm8O3K96NnOtc
         /U5o/DjzNczIz0jjprWm7xylnYpfLgzRekaI2UWWOdZdQTQYeCDFjzZrl4H4/eCNzdUj
         2Epw==
X-Forwarded-Encrypted: i=1; AJvYcCXAuRoOU7HXHiE6W6tST6m09yyNJENYwVVPsV4RVMTRZw4j/TCiUP5nwO40VxN4J6OHXw3lxx7vomao0fg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxThGdQgBuGGTiYFTEbVo8mdyMkPpn1alYEpdmcMYofKfIrtlo4
	9yRTlCU5PWHCT4SMf1SQfTpe/ZooURHT8U8tXjN9O8GZPNr6kkL/hhnOVbc77W4=
X-Gm-Gg: ASbGncubZuDjjPjeVu4q9uaIetwyF2GDhPZYfQZLsBr1xpCRMk8547BmZL5ORLwW7b6
	NIjHlZYFO1X3eZZ4AbJxrvC6Olok8VH4sgNoSa4s0VMt71IUGqWofbOD41+crMB1/WhUakshkN7
	yCS+cOOQOwGyqqpgp9XQr5sQvfqQvHlQMqPJ3wxaDkxYPxKRAsCO2Lk/Q7jyxDwp1q3CP7o+2oZ
	QH53i/PG6cAMD3KEX4br1G4bE4vL4JeI34xFLaouaL7PmZNFSW1SJWJv9BNJnj3I4mwHK4LliwU
	5EL9JIBiatQyL/979U2Ap0KyQZvCx2XLNV/aJUP7ht86Ig==
X-Google-Smtp-Source: AGHT+IGY+z1SYzbAwHQ1bDwluBsR27wnP/M2SunDoCiRoLo03vSfRP0XeHzwdWtlYLn2l6uyLgUtbw==
X-Received: by 2002:a5d:584e:0:b0:39c:2264:43ea with SMTP id ffacd0b85a97d-39efba2a69bmr11843060f8f.3.1745304086981;
        Mon, 21 Apr 2025 23:41:26 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4406d5bbc13sm159163195e9.17.2025.04.21.23.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 23:41:26 -0700 (PDT)
Date: Tue, 22 Apr 2025 09:41:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, Michael.Hennerich@analog.com,
	sonic.zhang@analog.com, vapier@gentoo.org,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH 4/5] staging: iio: adc: ad7816: Use chip_info for device
 capabilities
Message-ID: <0145edf4-aef9-45c2-9a74-8c15abb1286c@stanley.mountain>
References: <20250419135638.810070-1-gshahrouzi@gmail.com>
 <20250419135638.810070-5-gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250419135638.810070-5-gshahrouzi@gmail.com>

On Sat, Apr 19, 2025 at 09:56:37AM -0400, Gabriel Shahrouzi wrote:
> Move device-specific capability information, like the presence of a
> BUSY pin, into the ad7816_chip_info structure.
> 
> Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> ---
>  drivers/staging/iio/adc/ad7816.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
> index 39310ade770d0..ab7520a8a3da9 100644
> --- a/drivers/staging/iio/adc/ad7816.c
> +++ b/drivers/staging/iio/adc/ad7816.c
> @@ -44,21 +44,25 @@
>  struct ad7816_chip_info {
>  	const char *name;
>  	u8 max_channels;
> +	bool has_busy_pin;
>  };
>  
>  static const struct ad7816_chip_info ad7816_info_ad7816 = {
>  	.name = "ad7816",
>  	.max_channels = 0,
> +	.has_busy_pin = true,
>  };
>  
>  static const struct ad7816_chip_info ad7817_info_ad7817 = {
>  	.name = "ad7817",
>  	.max_channels = 3,
> +	.has_busy_pin = true,
>  };
>  
>  static const struct ad7816_chip_info ad7818_info_ad7818 = {
>  	.name = "ad7818",
>  	.max_channels = 1,
> +	.has_busy_pin = false,
>  };
>  
>  struct ad7816_state {
> @@ -98,7 +102,7 @@ static int ad7816_spi_read(struct ad7816_state *chip, u16 *data)
>  		gpiod_set_value(chip->convert_pin, 1);
>  	}
>  
> -	if (chip->chip_info == &ad7816_info_ad7816 || chip->chip_info == &ad7817_info_ad7817) {
> +	if (chip->chip_info->has_busy_pin) {
>  		while (gpiod_get_value(chip->busy_pin))
>  			cpu_relax();
>  	}

Here we could just check if (chip->busy_pin)...  The place you really need
to change is ad7816_probe().

regards,
dan carpenter

