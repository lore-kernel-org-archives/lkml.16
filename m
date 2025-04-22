Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2582B2367AA
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745303793; cv=none; b=jVr8r6yGUO7Sfy81Wf73z3nK/oX8kpGHNcCaRmv1+PEDVUUCBv1bP6SYmr/CAWy7soKRFhkCEGkVTt4lhHUToCi+w43EKjDHV4Dyo68NMW8w0Cy4gAkQHhsC5k2TPBQaK27qT/lARvyxSa6gYvmA28bwzhb801jyJi4/hmfmfto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745303793; c=relaxed/simple;
	bh=GiP/jlLbMozxOxUvrEms2VWQOoLHWMI7XjFly4V6b/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KSiJZj22AceCvFk50RvdBPLK47tMFfDX+UJhJ8rqj2BUPq9MfQiE17m0jk5SrNx22e3FI0jfhsxTM0pknHBktyGwXDsmsnQcxiciORKXzgwQIyOhj10XUrMOvIluJKC010ekQ6sP8ELAKQ8925fjp1jtm+Pl8d/Bqh61ljr4+EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jQin1pY+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jQin1pY+"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43d0782d787so33651855e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 23:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745303789; x=1745908589; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MuuIFzXKAKOtJ/juljvbLrxvScq2q/lihuCqoG9qgYs=;
        b=jQin1pY+RUBpSOckThD/4Cxz17cwvJAHyvhaJy9LpLFMygyd1RjiIxiEno4Uzt7vEg
         lCVW07f/Gyyy6bF5jaZb/rUOaOjXyicvKOET8Fh4ijj2XAn7gOwuYG8Q3u8uDcPGEkJI
         IC6g67UrvSEEeSFYMq/8caHqaZMNYd3BVhBGYQrLXRByZ9WqJRob03fmdc2dhPG0KbrB
         Kw34xmN0Od09X7XIYDGQ1FqmerXoe6+my4otXymdPHxRtAAOMjnN5XFFevzq4kevMAB+
         DKkGUrUPJA501VFyTrui8MqO3Ir4eQpo7l1TUeKrHCNP8QCLJMmVZJ1Dj/Y4cgB61BCO
         BWyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745303789; x=1745908589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MuuIFzXKAKOtJ/juljvbLrxvScq2q/lihuCqoG9qgYs=;
        b=guBwiKcR27UHgRqZxdz2lW4wZ5WNKB7aBpGRZ7Scg8Y5BgAndDpD0x+c/phKm7foia
         MdmW/2zAq4sg1KfnH1llhVfeD4VQaxmejwsCsgYTPDoT6D8lQPANXB9Cw5tmXvV1bg/0
         ojFDjVE1rR13U8MzF/x6vv03pLi9Nb716DzRjqSzgIi8CPHfrdOH2kIhAJLD9K0a09MG
         CUc+Ve3hSQzA5J6vj/Wt4u9CyI/KweXyUlyvJQcgKAbUTYjHlZaSShzJWV7+oamnmKKD
         3C/3Nv130tn4geWp2szA8uPdhJEd39dQzm82YmrOdpz7MYEvnsudDXnqxe2z9k1XLgJv
         /F5w==
X-Forwarded-Encrypted: i=1; AJvYcCXTb9cQcxZpNV6sZHaTATVJ7kCV5G3DyWgzWtTYix3z1o0WW/Kxry3igrskPhmAjTQHKKFLTLRynMiBz6s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqbGlpFUDSOGForfG9ZWki6JBbHHpB3W/WUNb1c4naHvFGd0gg
	lhD4jsXV41aanqihEaeihO91i8dliP9FZEOiqjcw0NrdgjW9kIRmF4mCT3xXdeA=
X-Gm-Gg: ASbGncv9x9TdH65ckNPjWK1DLFIVVEF+SnNMI+CxYS/MKvwSA2odMrUE3gJD9lMoaWq
	srQrZc4kZ87dUAOorg5EkpPmjpp9xM54eb5iqTQJiXDK3tpXMcI+ZA9Q9DugjVDXhlMz1EWpCmI
	4W90OI/vjEpQkMtvHEPalds2PnWYYjiiMVr7p0s0GNrNKstarsRkwl1YVeDSidEnd4kOp4v8qix
	HuIuJpdhDwVNHV/XZIs943ZbzjlBn7ofRxAaYyUmPhNCVXsfeQkEhnSaNEjU7wUcPW2HyUEPbIS
	1vm5Xb8zFrDXJsDcc2iI4TZogwTv1UTevT/qwwk3iRHQ5w==
X-Google-Smtp-Source: AGHT+IG58ERkjB/D7cQnQR9ULR7mf0eJW0CrGoysFAmK0fVh9EIq2V04mHgq1He3cbNy5XZ0uVNl7A==
X-Received: by 2002:a05:600c:1c12:b0:43e:ee80:c233 with SMTP id 5b1f17b1804b1-4406ac20146mr111342455e9.32.1745303789459;
        Mon, 21 Apr 2025 23:36:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39efa433133sm13898825f8f.28.2025.04.21.23.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 23:36:29 -0700 (PDT)
Date: Tue, 22 Apr 2025 09:36:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, Michael.Hennerich@analog.com,
	sonic.zhang@analog.com, vapier@gentoo.org,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH 3/5] staging: iio: adc: ad7816: Introduce chip_info and
 use pointer matching
Message-ID: <b17dc4de-9fd2-410e-8c5e-f27e550d3eca@stanley.mountain>
References: <20250419135638.810070-1-gshahrouzi@gmail.com>
 <20250419135638.810070-4-gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250419135638.810070-4-gshahrouzi@gmail.com>

On Sat, Apr 19, 2025 at 09:56:36AM -0400, Gabriel Shahrouzi wrote:
> @@ -84,7 +98,7 @@ static int ad7816_spi_read(struct ad7816_state *chip, u16 *data)
>  		gpiod_set_value(chip->convert_pin, 1);
>  	}
>  
> -	if (chip->id == ID_AD7816 || chip->id == ID_AD7817) {
> +	if (chip->chip_info == &ad7816_info_ad7816 || chip->chip_info == &ad7817_info_ad7817) {
>  		while (gpiod_get_value(chip->busy_pin))
>  			cpu_relax();
>  	}
> @@ -353,6 +367,7 @@ static int ad7816_probe(struct spi_device *spi_dev)
>  {
>  	struct ad7816_state *chip;
>  	struct iio_dev *indio_dev;
> +	const struct ad7816_chip_info *info;
>  	int i, ret;
>  
>  	indio_dev = devm_iio_device_alloc(&spi_dev->dev, sizeof(*chip));
> @@ -362,11 +377,15 @@ static int ad7816_probe(struct spi_device *spi_dev)
>  	/* this is only used for device removal purposes */
>  	dev_set_drvdata(&spi_dev->dev, indio_dev);
>  
> +	info = device_get_match_data(&spi_dev->dev);
> +	if (!info)
> +		return -ENODEV;
> +	chip->chip_info = info;
> +
>  	chip->spi_dev = spi_dev;
>  	for (i = 0; i <= AD7816_CS_MAX; i++)
>  		chip->oti_data[i] = 203;
>  
> -	chip->id = spi_get_device_id(spi_dev)->driver_data;

Delete the struct ad7816_state ->id member since you are no longer setting
or using it.

Btw, this patch didn't apply for me on linux-next.

regards,
dan carpenter

