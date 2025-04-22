Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8744202F79
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745316512; cv=none; b=OmxA2kHjdIFD23oJg/UESFlZnn3//Z4QuuGy4691CDQbgds+GJ1fQdTnnqsalGud/6xhEkYahuX//+/eDGghmITIC+En8Igi/tc+znurRAKjcgxfK6aMVFlxaZGons6Wi77wBj9OuXmABhU75y5iT0wnCZg97SBof9yc8dQepMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745316512; c=relaxed/simple;
	bh=anLjr1tReamUydhT8BOyd5WAfBLORHEW1TH2GPX2hgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gK0BrbLRCPWPMFY1czAvYGrtMUBJhGXPhi58ciPXKkjUhHYcDwMaBUuei5DdUb6Dd8NkkedoTbxaCQbWORLw0kTG8vRzuFVe1Dww+84BjSb8iwoGzR5nXtqZlTT3egCnaQY8fJCnEJinHpgjQsS0u+znNnVwKIupPr66uDHggk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B0mVFHb+; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B0mVFHb+"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so51820285e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 03:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745316509; x=1745921309; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E6B0Yh7dOpmfhINAPeCPvt7WU205S796TEUCdlISV0U=;
        b=B0mVFHb+/5jqS94/znqPq3C2MAjiHd4kCjrdRDFYQ+hzcQ/jLVJ7R3NeBIxywW11sh
         AFg02oOW8w1IKuxQAzVcyb/heCpjaIfwukJhsXnCPuiMqYYwYSrmvQUHDyX18FZNDRUc
         kkt99djSCAfQXwJwitodsg8ssGUo3uT33qLCWqwGmpEdwjOtPnBUUuGxDGFX3ya+xhVe
         vTPORT6FIRj2hyI3C4NOcXfgXsPLGPPYlzUoaipSShBBj3s90X9Q2OkIRXzN3MBdsLGN
         qFYOxtt53VmimipWlDhthAaOibzp+qm8ESw6p5cbAsbXyvin4iO/uAD2jDKpqWgrKqxt
         1NuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745316509; x=1745921309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6B0Yh7dOpmfhINAPeCPvt7WU205S796TEUCdlISV0U=;
        b=bbCfEVYUiYdr1vXb5cKdzUC0fonMSDV1+r4ViFz3Hsy7L0tnwH5ZNWhQoj835sxlJR
         d1sEB+JyvGiinrPHfz17SF+4j/jrDnaPE9aGoNjIgzL0lSvowuKEtKxO7nNrTJFjUXDB
         i8xYEP0rN82PFDyOm5z/tjjapZzAlDS9yy6eznw7GRNkwxAtishyt/ssnS2OFQbqWLVA
         VSyYLEQuGqIuUUccm1X0JyYwAdSdnR7bzJMAQJhPS8f5+Z+Rja25/MeQH2UDF08fiHEt
         bcA/kvK7PU5W9iEbPp3SuffBb4oikE5SWrZUuR5SVYFwMG0eTz5LRYQ+vGg/V7zn6yw7
         BUAw==
X-Forwarded-Encrypted: i=1; AJvYcCXhlTASwFcFJ1xB02IwXWhEc9IHBO6oVtfA2kYRUj+pPh7T8YoqpVfz84VYjb1jyEVoidfxgDU3REG5t50=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs9JomgHGUIHftcxWLFwi+jImDSkmPgS9VKFPse97CePTDXOpM
	6mv5himHzWmYCCQs2AwYTGCY0ho9UBSTDEyC8LMi445II35cUg3j4zcWa53Tnl8=
X-Gm-Gg: ASbGncsVl3ldvBgLe5ds6yBzwltUCoz7TZsL10kFjNKJZzVrztdjW9Xh0c06/0zaFHN
	SCYX1tlxsFag5JaabMs0OScYcGl+sb7yp10wmfdUR50qTZIDUctVVHwWUP14EzHjpUW+JAkLVat
	qZTWoOoudej2cgd9cOguqxTpgs4gzbtjeuppXNbT6ez3cYhx1hYM9lahukiF0vE/tWXD89veJ5x
	fc7NYmSlFOnvb95Anf6MkqjKCIHnUI6pDksl1s5UhK4BL8K5KWUz9CRZxd+gAP5ilGPeBEUtI8k
	gMABRCtYppqorwW/PPt9Fv4TJ9ZtlGwZFdkxuRfJ308VAVe6l2reftFy
X-Google-Smtp-Source: AGHT+IHzVpPPPr7Q08HSTDXKukGfeX85sPIQ5U7vWA+NG5QegCS1HXNyMGxJ3cf6h3kIB4C5AubgEw==
X-Received: by 2002:a05:600c:c0f:b0:43d:7588:6688 with SMTP id 5b1f17b1804b1-4406ab93badmr129900855e9.12.1745316509263;
        Tue, 22 Apr 2025 03:08:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4406d5a9e50sm169732175e9.6.2025.04.22.03.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 03:08:28 -0700 (PDT)
Date: Tue, 22 Apr 2025 13:08:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, Michael.Hennerich@analog.com,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2 3/3] staging: iio: ad9832: Add minor improvements to
 ad9832_write_powerdown
Message-ID: <e712ec88-d925-4a73-8df4-ca3387a903fd@stanley.mountain>
References: <20250420174725.887242-1-gshahrouzi@gmail.com>
 <20250420174725.887242-4-gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420174725.887242-4-gshahrouzi@gmail.com>

On Sun, Apr 20, 2025 at 01:47:25PM -0400, Gabriel Shahrouzi wrote:
> Minimize size of type that needs to be used by replacing unsigned long
> with bool. Avoid redundancy by checking if cached power state is the
> same as the one requested.
> 
> Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> ---
>  drivers/staging/iio/frequency/ad9832.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
> index a8fc20379efed..2ab6026d56b5c 100644
> --- a/drivers/staging/iio/frequency/ad9832.c
> +++ b/drivers/staging/iio/frequency/ad9832.c
> @@ -173,13 +173,19 @@ static ssize_t ad9832_write_powerdown(struct device *dev, struct device_attribut
>  	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
>  	struct ad9832_state *st = iio_priv(indio_dev);
>  	int ret;
> -	unsigned long val;
> +	bool val;
> +	bool cur;
>  
> -	ret = kstrtoul(buf, 10, &val);
> +	ret = kstrtobool(buf, &val);
>  	if (ret)
> -		goto error_ret;
> +		return ret;

Fold this whole thing into patch 2.  Don't write something and then fix
it in the next patch.

>  
>  	mutex_lock(&st->lock);
> +
> +	cur = !!(st->ctrl_src & AD9832_SLEEP);
> +	if (val == cur)
> +		goto unlock;
> +
>  	if (val)
>  		st->ctrl_src |= AD9832_SLEEP;
>  	else
> @@ -189,10 +195,10 @@ static ssize_t ad9832_write_powerdown(struct device *dev, struct device_attribut
>  	st->data = cpu_to_be16((AD9832_CMD_SLEEPRESCLR << CMD_SHIFT) |
>  				st->ctrl_src);
>  	ret = spi_sync(st->spi, &st->msg);
> -	mutex_unlock(&st->lock);
>  
> -error_ret:
> -	return ret ? ret : len;
> +unlock:
> +	mutex_unlock(&st->lock);
> +	return len;

This should still be:

	return ret ? ret : len;

regards,
dan carpenter

