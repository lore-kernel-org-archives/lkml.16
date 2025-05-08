Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE692874E4
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 18:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746727313; cv=none; b=q85EwRXqth0jJNdRVd0RzZXlv4tttPcwEKuJ0IQBPOVDf0YbekcPp7ioQnqqIKWkua82NZCuYAWiNwV86xuiXe2LBNQ0G+q9P07PORm2Y+cC+ZL8fruvFSTFAVSVrEbuFNQEQ6U2OzbE5jeOe5xLbRk6LCH6w//McCH5NvhGihA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746727313; c=relaxed/simple;
	bh=HSk91ZH8Z8a8mL6LPGseY5cs3UZzjzpo+FRepoBv918=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D6AjiWc3+eHlRU0MThEwVHb061FygJf5yUYY3qtccOf57XwLjAROblO2uHjmzMoU8IMq1MQ8ZYkz0hIXkXdFYsga4OF3mDUgjdjAdNXE0MHB1ZsgJd1OftUjEeViwO8Yj8/AjLMi1ptSsp4+KYJFWUQirdMEO3XyfaQx1NaK8hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=H2tG1pGa; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="H2tG1pGa"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-603f54a6cb5so799342eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 11:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746727311; x=1747332111; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qsLFXZQvKp0g3hRvIjf83N1PFE6uMNvpNp3Q+PhYMmM=;
        b=H2tG1pGagIhv0/NGCYUGj5dS1Vka2+LifTLBUjZ4hcYe8m6TEMczqwHhAzaexGmUOF
         SnFwNYJa2a7Pl5BmKEQJkyTgeKbE1msPyAR2wDLW5jS0wBFWXQHiVmiwBQ2BOkruIlet
         uQ/G3RmSIKh/tWikw+j1HUyUqVsQq9KHy8DRo04CxEM70yiMdYbt6HZetIIrkeMqz6jJ
         ZkxG2olP1G8UsdidIpy6xnbkHHDOyYmBcMbJ/kvkccDnGjAFay+HaBZvrCa4U6Wadtzk
         I4WTUAgVda0aLC5n2t6fWygyZY8kIJHficIwP0qht+YpkOm7o7kcwrV6cDshwTtlgVK9
         PEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746727311; x=1747332111;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qsLFXZQvKp0g3hRvIjf83N1PFE6uMNvpNp3Q+PhYMmM=;
        b=P3NfpPNtRawHM90+R77NbhD/JzNCllDBsL0DfjG729JXKam2OnR9pVjSd/Oklpb9xn
         Ep6lSCJh2mWItY+KPcLWIYgRzKYNN8ANgfri/FdRk37/Wkj0cMmqM3CFQT+vV5Fg1xtv
         Uz4dnh2SLmwpg2tH/b/JEwElo922b6QhgvfiAOErWw/eKXnrsARU/A44Icflm0ClnLZL
         fINRKQzAY7qP+sORW40fUm0lPcU1QAB49j1OAFasUfhoNjF+Ml687tc/prD4TaxTrxn/
         vG+IbKJXeTEl5GPvMGfraV+ZXMtlCzP1HYacm0ejq3rwCMXnmj6lDCHkNZQ4uVm1mgFF
         IInA==
X-Forwarded-Encrypted: i=1; AJvYcCXgR7vZExUNB/+19JeBUC+ZTx+/E+a3LZU69GlZgLt7sR3rsG447IrJpe30TVTzfoqHnR0wXK3YrlYSn4E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKuHpfEChb4khDJNhQzRNuPBU3GYeT/ifslOY3xkpnEpP5tJzr
	jI/IY6oh4CyNzaHdK6p5t8Nk/IeuP2bP3EEDH5jYr+akj4JVkM2gDJg6AffP03lqK+3DJRACSr3
	9
X-Gm-Gg: ASbGncv+ZLizdOdd485GLafEVkozSl2WW+0SLLaqnd4EHs4bBPAOkWtN2LLHCHzep4q
	koFEbD4hNZpRTI1qCjXjcz8/SqPf89B0ikikk+nxIZNSz2syIhHpnivcPJ9ghbeuLZJvmvcyRK4
	UQcUgswqSTbeKuarK/IkhwlVpQk7Ese0nvFCLoYxQfO2pAhLjOGVsVOLPjNH1imFHHl9wL4Y8o0
	zBYXs84H/lCIxNf9f3Jgc+u2YG88jVh+RViRgehhhuAn/5rfYl6linN/YOaUnyEZEwK1XWxBOcP
	3ZewFQzZdI0sMzNKkf+eGmqyMmUH+fgDTe1IEhbvHHJjlkkhlmb4HQy6v7lW7A6Z8BO7hRYWv3v
	WeFssIIyjAr6Za8LJcg==
X-Google-Smtp-Source: AGHT+IGfy9VFecJiszoyTCogAO3d6b7hz+I7yrjTrXWHFhmGYTeSyuJFnQR1Y514e+k2eucOaAM9DA==
X-Received: by 2002:a05:6820:1f07:b0:606:26bb:db78 with SMTP id 006d021491bc7-6084c126876mr274106eaf.8.1746727310744;
        Thu, 08 May 2025 11:01:50 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:1120:d1cf:c64a:ac7e? ([2600:8803:e7e4:1d00:1120:d1cf:c64a:ac7e])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6083fe3c829sm84390eaf.15.2025.05.08.11.01.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 11:01:50 -0700 (PDT)
Message-ID: <21b0e8e3-f9ca-4fa4-ba24-233d2e96944e@baylibre.com>
Date: Thu, 8 May 2025 13:01:49 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/12] iio: adc: ad7768-1: add multiple scan types to
 support 16-bits mode
To: Jonathan Santos <Jonathan.Santos@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Cc: andy@kernel.org, nuno.sa@analog.com, Michael.Hennerich@analog.com,
 marcelo.schmitt@analog.com, jic23@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, marcelo.schmitt1@gmail.com,
 linus.walleij@linaro.org, brgl@bgdev.pl, lgirdwood@gmail.com,
 broonie@kernel.org, jonath4nns@gmail.com,
 David Lechner <dlechner@baylire.com>
References: <cover.1746662899.git.Jonathan.Santos@analog.com>
 <8b8f861422b15b1316a1513cd66abc544ab8c5bd.1746662899.git.Jonathan.Santos@analog.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <8b8f861422b15b1316a1513cd66abc544ab8c5bd.1746662899.git.Jonathan.Santos@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/8/25 12:04 PM, Jonathan Santos wrote:
> When the device is configured to decimation x8, only possible in the
> sinc5 filter, output data is reduced to 16-bits in order to support
> 1 MHz of sampling frequency due to clock limitation.
> 
> Use multiple scan types feature to enable the driver to switch
> scan type at runtime, making it possible to support both 24-bit and
> 16-bit resolution.
> 
> Reviewed-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> Reviewed-by: David Lechner <dlechner@baylire.com>
> Signed-off-by: Jonathan Santos <Jonathan.Santos@analog.com>
> ---
> v7 Changes:
> * Added TODO comment to use spi_bpw_to_bytes() helper function.
> * Minor commit description changes.
> 

...

> @@ -675,9 +723,16 @@ static irqreturn_t ad7768_trigger_handler(int irq, void *p)
>  	struct iio_poll_func *pf = p;
>  	struct iio_dev *indio_dev = pf->indio_dev;
>  	struct ad7768_state *st = iio_priv(indio_dev);
> +	const struct iio_scan_type *scan_type;
>  	int ret;
>  
> -	ret = spi_read(st->spi, &st->data.scan.chan, 3);
> +	scan_type = iio_get_current_scan_type(indio_dev, &indio_dev->channels[0]);
> +	if (IS_ERR(scan_type))
> +		goto out;
> +
> +	/* TODO: Use spi_bpw_to_bytes() helper function. */

spi_bpw_to_bytes() is to get buffer size when setting bits_per_word. It doesn't
apply to spi_read(). So we should drop this comment.

> +	ret = spi_read(st->spi, &st->data.scan.chan,
> +		       BITS_TO_BYTES(scan_type->realbits));

If we replaced BITS_TO_BYTES() with spi_bpw_to_bytes(), then it would read 4
bytes instead of 3 when realbits == 24, which isn't what we want.

>  	if (ret < 0)
>  		goto out;
>  

