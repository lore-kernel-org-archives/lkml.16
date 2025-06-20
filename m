Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1974CA95C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 13:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750425557; cv=none; b=jxvZlCojahPhuP1IPCJASIH7UE//quodcOcuZm5d+MVoIpFPYkSOYTQ22vmQzXUOH8WcJ10koddxiyhknXMAyUApzLjCKYaZJWTbVd/59dwGBOVAsquaUpKdR/YbsmAK32KuEeWVwr0wzL6W85mlKZ5ZO0QOroGwOPQTep+fWAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750425557; c=relaxed/simple;
	bh=UYboRpcf2l6D1iqKjxqKWDn9qWV4TH/OyIbBTGBpKlw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VrsrKkidb6qR9ybys41IOc7NvFfLVA0UcRIZLbd+KXwgk967aATTyPeGfldLMB2Oy0MZSfgd2r91PoreCc5Neq9AMIBxU07hVua2VubrZ+Fu+u+pWwEgxddJUNlBXGqAQ6OwxUf76BzbixVg+xykUIp9s6+wP6Sw+czbEUVyhFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=CI/g0L5a; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="CI/g0L5a"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2ea58f008e9so1482477fac.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 06:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750425553; x=1751030353; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=85nsbaEK6Tnb7LEAxhlSFVrthkkPjQvKgGVR+IA4SPA=;
        b=CI/g0L5a05qTpY6fIJspqv+KDcbRojKqTXEKvoEvLsMiXtDlNpX/PPkXCVxlYLQQ+k
         3uVTz6AMdzmOcgpsl4Ie5G86u8ieoqyKmz1rkcswhNtVPCmIrNwbsmUFy7OwGgu2+3PV
         fFlE0Agj2P7aZj2fEXticzdlGXrA4+dX96aZU1nsjfj0FRP+lY9t95nzTYkFcAbCwnd0
         PE6yqT/0LAozN20Awrg75/Q/Hg6wwNfqyb1NqAov9SPHDpq2vZ66JmMhnbfRctKSUqPn
         y9Cr3HyI3zy4b6vxjs/klDaHsxElJNlaZ4NY6dp0fZZawTZsAYEwkbljkoin5RIbNr3z
         ZTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750425553; x=1751030353;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=85nsbaEK6Tnb7LEAxhlSFVrthkkPjQvKgGVR+IA4SPA=;
        b=IHORLXBf8OB3hC0SIMKJgGaz6ANiw/mTLZZdEMI594UmNzrzzXnx0ZW0m8Dnx1BabE
         UDGumkMNcMmR47QnzUcftw//ExiAVVAScAjZawvcotm4Mpy4efxwlCh5Q2g5XL7RvjDD
         ZdEcx1yrSlNtcdAj4p1B+URwGJ6LUJOL/cOT664ifDrbKDwSmbANxgXNa7sE8N5J2dK6
         nShmJTbwI8ftt9iYOWVF1lL6WM1XMWW13uIj5uB6Ort4nu3047lgF5/41oJHSkwnIS3t
         V1/n+SFPz5wnnFQBBnKkngvhPmKNSf2alGAAd8PBUDPqy3jiTL5kEhcALcXwu6N8Jnax
         x3Ow==
X-Gm-Message-State: AOJu0Yy04YH4D3FrE3djrXH2b+mAj3Fl8FhX7XXPI8ICLcjGM8+Rg9ch
	PyALd9A1p6RP360jFP7yHWD9quYXaAlGid9+ogYP9uXWOEFVUv558XlGOf/T0frUMQY=
X-Gm-Gg: ASbGnctJqvTcNrghh0UQ63uSD5nPrhFC19nFM8Dk0hmDcneKxQ49NL8lmxrAPXhYzsp
	CFsImEWbLpypNShiqmq5gHEKXRJmLJnhHQdY45Y0QTAfb7uG0tmqY90i+mnLQzLqZVyNdTS4CZM
	0k6fj0FY9ngwKQGgd3JyJMEOLwl/QfTaafOWwdaeUiLptD6BLByeEEGnxAEjiuKXuzx98c1yR2z
	h0WUac5mTeYUatAzFVehXI7Mx98ZtRWnLMB1uD86xHVmKqUKqDC0N70L0jpuJ6wk+nCtMA7MfWp
	zYGFh73bq7HR1EHhs44oaubApbNDUIr8LmLwYU1kh53qenUp5iV/5hQDfKwjyh69673ssLRpGfT
	+O9kLzM6/i+MdJh6SRka2NlEPS7uNq0frrqGKpC0=
X-Google-Smtp-Source: AGHT+IFB1egOnI3wTOzC6Gt7TYLJB8opelbR9lz+HHIeqFUUdilNUH0J122GTltzseWPkp6skmjj0A==
X-Received: by 2002:a05:6870:2b12:b0:2df:b3b9:5dfe with SMTP id 586e51a60fabf-2eeee5e5ef9mr2209324fac.29.1750425553093;
        Fri, 20 Jun 2025 06:19:13 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:5504:5211:6fc4:c093? ([2600:8803:e7e4:1d00:5504:5211:6fc4:c093])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ee8a8e3710sm380533fac.27.2025.06.20.06.19.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 06:19:11 -0700 (PDT)
Message-ID: <2efc99c5-d1ce-43ee-8747-df0e6b0e73c5@baylibre.com>
Date: Fri, 20 Jun 2025 08:19:09 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] Add the iio driver for bosch pressure sensor
 bmp390. The bmp390 is a pressure sensor module. It will support SPI and I2C
 protocol based on configuration.
To: liquancin.mereenamathai@in.bosch.com, linux-iio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, jic23@kernel.org, nuno.sa@analog.com,
 andy@kernel.org, vassilisamir@gmail.com, marcelo.schmitt1@gmail.com,
 javier.carrasco.cruz@gmail.com, Xu.Zhang@cn.bosch.com,
 Maoting.Bian@cn.bosch.com
References: <20250620045456.1151-1-liquancin.mereenamathai@in.bosch.com>
 <20250620045456.1151-2-liquancin.mereenamathai@in.bosch.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250620045456.1151-2-liquancin.mereenamathai@in.bosch.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/19/25 11:54 PM, liquancin.mereenamathai@in.bosch.com wrote:
> From: Liquancin Mereena Mathai <liquancin.mereenamathai@in.bosch.com>
> 
> Implemented features:
> * raw data access for pressure and temp through sysfs
> * iio buffer tool support for continuous sampling

A driver only doing these two things should be 100s of lines, not
thousands. Clearly, there is a lot more going on than this.

So in addition to Krzysztof's advice, please split out the driver into
separate patches for different features. Ideally a whole series is 1000
or maybe 1500 lines max and individual patches 500 lines max. This will
make it much easier to review and it will give you a chance to explain
things in more detail in each commit message.

> 
> Signed-off-by: Liquancin Mereena Mathai <liquancin.mereenamathai@in.bosch.com>
> ---
>  MAINTAINERS                                   |    7 +
>  drivers/iio/pressure/Kconfig                  |   26 +
>  drivers/iio/pressure/Makefile                 |    1 +
>  drivers/iio/pressure/bmp390/Kconfig           |   29 +
>  drivers/iio/pressure/bmp390/Makefile          |   32 +
>  drivers/iio/pressure/bmp390/bmp3.c            | 2781 +++++++++++++++++
>  drivers/iio/pressure/bmp390/bmp3.h            |  537 ++++
>  drivers/iio/pressure/bmp390/bmp390_driver.c   | 1604 ++++++++++
>  drivers/iio/pressure/bmp390/bmp390_driver.h   |  232 ++
>  drivers/iio/pressure/bmp390/bmp390_i2c.c      |  328 ++
>  .../iio/pressure/bmp390/bmp390_iio_buffer.c   |  220 ++
>  drivers/iio/pressure/bmp390/bmp390_spi.c      |  286 ++
>  drivers/iio/pressure/bmp390/bmp3_defs.h       |  871 ++++++
>  drivers/iio/pressure/bmp390/bmp3_selftest.c   |  184 ++
>  drivers/iio/pressure/bmp390/bmp3_selftest.h   |   93 +
>  15 files changed, 7231 insertions(+)
