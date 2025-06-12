Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8757299A94
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 15:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749742402; cv=none; b=iH2btKOTEPRrWVb7ZaxmDWkOnpC0+dJPD4NPxxKyt+T+KEJzCqsKu9SjtE2ExHnUEVnJWI91Jwfeyh5DIyIZ4tJzgLwZfQPopRd2ki3K5XWGxNTn1t5+eS2s3DUdCgOXNmh4isvmYajq88xtnl9kQwmeEujylxn3DwcQoU4XJFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749742402; c=relaxed/simple;
	bh=KSDbdk9DePrgVQr7SrVRa+XwJpeTep3QaQZxdE4b/Sg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZCNaR15Opgr0ufpXJXw3aY2rESw1ZPL8SET0zTDxuJV8pnz77ok+ulpf3D2HLii+XGytYZfPLXazCVPIzz1I2EVl//B97hvUt3iUs5RLHe74Yf7imDGlSfpeUllQOI79F+uLxTJd34l7Ed6bUT7jOAciDiIP44d2Xs3kJ8T9XLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=o1LMGC+1; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="o1LMGC+1"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-72c173211feso355934a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 08:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749742400; x=1750347200; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=occ8UAPK7Y3/XcZHfeUG+9OKXI0GcqA1Hf8ywNuCjso=;
        b=o1LMGC+17cYneAw3/CZqU7ilTUtiP6lObIv0LwdP/YcWyioDtkNGyiz9yRhXiOIWB1
         ShBs2bT/UwptK/yGMmVZmB94rOlwNIrRl8pnXNA6HScSbUGh3wMScXQRD4fT829jSJsH
         8U+/VVUCLQG3NzuzxVDaYzxSHTLBeaw70k1VShr9XuLCh4GL8+RCNw/Ol7qG3Z4MDQKp
         fBBDe++2zgf4I4mdXRI/iKDq7q4x/Ju9CJS0XzUv5qcCbV/L0H1C8ycPU0I+WU2oeIT7
         x4VxyvCb9egbjoO7uOmnulc3GC/ZotZz7kSpTGV0Cc5cvd/eFMVRvDhTcL9FGADoU1TC
         2yQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749742400; x=1750347200;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=occ8UAPK7Y3/XcZHfeUG+9OKXI0GcqA1Hf8ywNuCjso=;
        b=lRCATjhpsrN2OGFOXirWE2iVIXuuGor6fPebgUoTbBv6vmAUu/gen/hjBY0Ogik2FF
         hNaoEYGRcM+7Vcnp069etbKhAnupliFzNZSnqwmEum/CokuR3XV6JTntflBbb2Ohqhyw
         0/51D7Tddm51kbnenUJLT2W/+mgdWVWu8jTBXPKJa91Yq7qlvv7sbUt2ayhLQRmR3b5+
         8NbAIrBLK2B5fhKxxR/5CO5Un/QVSycleguL8cTLZqValzAozWl3jCUtbNZKKo9hilUG
         FIbI8IK3e1cQN8YUgJsZ3wH1RQgcb7bd9xTiQSCRQ++K4ULA7SBLS42BDCSvn35535EJ
         aCmg==
X-Forwarded-Encrypted: i=1; AJvYcCWEch0v10MlMsl+L0xZfP2xKaBWF0NJfxM0gvVNru+Ob1yOAZkOBa7a0E4DTBzXjiu4he2bEYeBvp0h8E0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1ywIYmTUYgPw5sM6CC7/50+Kfoy5qbg6sEcPGA6W5NHVyLa4S
	a0JdoA7moKw9dfBlJi+pDilcdCIRXGsasz3SDkV1WmeM/ZRXaj4GaYdO9/8rQLrB34M=
X-Gm-Gg: ASbGncviWVpWvdPpt2WIyN/ZRiIsM4R+Nq7UiUWXxzWiGbymTMcakvxECjBQ0QXj5Jk
	SgJYbTDuVyyCoTx5Uj6WhPnI71YrGCaG7VNmhAwpQg7eIFkjEqdUr7PHKrEN3Ug2n/eYj925C74
	3tgDAwFGgXLD3Z3fmIOITbVErG3jhlZPGTjOpj85gxRyK9lzFT76Q+RoLcFK8MmZzEUJpkLyuT/
	5j9lxcsGFW6KUfxISokY+Rm2d07i9UuFuRblc1mmNXMwed19Q4CkQeQl5BguZ3uXf84gUnLTEHP
	y33+G9fecN8MYvcAx63oD1Y9z/Y8azHJJa2YwPpWcHbpnL7k0B6geMG4rxM8W9nLNRIdQpEIQm0
	ogZL97CIxXDufrrTmB0Zswh9jU+slSHaro0SYGNY=
X-Google-Smtp-Source: AGHT+IEFXx/HRFaoYx3mDaAcYVHQpIxU0X9BzHa2+b5gg1r4MtPFkD976gxUBECCS4LDkC/56qstdw==
X-Received: by 2002:a05:6871:7bc3:b0:2bd:456c:92a with SMTP id 586e51a60fabf-2eab40ab59emr2388538fac.10.1749742399978;
        Thu, 12 Jun 2025 08:33:19 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:4753:719f:673f:547c? ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2eab891b264sm328859fac.20.2025.06.12.08.33.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 08:33:19 -0700 (PDT)
Message-ID: <5dd8d6ec-8c16-4c7d-aa47-b66d076a83e6@baylibre.com>
Date: Thu, 12 Jun 2025 10:33:17 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] iio: amplifiers: ada4250: use dev_err_probe()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250611-iio-amplifiers-ada4250-simplify-data-buffer-in-init-v3-0-bf85ddea79f2@baylibre.com>
 <20250611-iio-amplifiers-ada4250-simplify-data-buffer-in-init-v3-5-bf85ddea79f2@baylibre.com>
 <aErQojKzbI6al1vn@smile.fi.intel.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <aErQojKzbI6al1vn@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/12/25 8:05 AM, Andy Shevchenko wrote:
> On Wed, Jun 11, 2025 at 04:33:05PM -0500, David Lechner wrote:
>> Use dev_err_probe() when returning an error in the probe function.
> 
> ...
> 
>>  	mutex_init(&st->lock);
> 
> Side note. Switch to devm?

Yup, missed that.

> 
> ...
> 
>>  	ret = ada4250_init(st);
> 
> Is this used only in ->probe() stage? If so, please also move to
> dev_err_probe() there.

After all of the other changes, there was nothing left to convert
to dev_err_probe() there.

> 
>> -	if (ret) {
>> -		dev_err(&spi->dev, "ADA4250 init failed\n");
>> -		return ret;
>> -	}
>> +	if (ret)
>> +		return dev_err_probe(&spi->dev, ret, "ADA4250 init failed\n");
>>  
>>  	return devm_iio_device_register(&spi->dev, indio_dev);
> 

