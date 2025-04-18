Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E792121D3EF
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 19:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745003349; cv=none; b=RQtCT9lFshi851idHhk41AWBs24bP34FNAGb9KCSusQzQjgc4VQjm78jQ9ZKCglE/Ic5riIJr2j9qpuicIH6PpcNiwa7A7KSOnNbfAEtLpXuUt4mLJl7VMoObps6MkHXsn7D2/AjvrChrHI65RITyC3E8QdeGW+eWR6q6VWr1aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745003349; c=relaxed/simple;
	bh=N3mqmqfcODct2AexTU3blKtP+e5GHWSpg1sAN4RdBIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lMzBvmMDWyImg5GG5aZCzABUWB6nrwfFxwkkNoevHrvHNLv5Z4+G3gI5JobxBYDgmWcR51JA7YZRVfdY0yIS52Rvt3ETpi3Q3ewddYMXk8Csl5Xc7S3sCiDscsJL9NOPY7/EkNRYycNWenobq9etSgCUNz03GL3A5a4VWmqARbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=UGPpn5Tq; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="UGPpn5Tq"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-603ff8e90acso431468eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 12:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745003347; x=1745608147; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pG1Bxch6x3OgorYiiEYLNmcSoJ8xuGTKE7oUjof+wN4=;
        b=UGPpn5TqJRVZw95WO1yjvenBFuG8ug1tPfIjdf7WuDI4zD7zgob8LcYE6Btd5ylANd
         Mb3E1+Mem4b8dFDfymkHRoXaAqOANnZfbEX8a46r/7v5OYI5XGsj6F1TsKvob5EVLJ5k
         c+dci0ygUboCV2Hnt0+c8RGoocIAmgyMU9RzFZwAkU6pc2kDeiVl5ccHz39F5szAcNqh
         Rois1EWtiSRa1ywLhe4FFbtcUhvuzsw3pqaj8trSpGGSEFXIXkSOeBEs6vODDh/xX9gC
         WE8eF3BD1HOihVDMC8DdfnAR+8vw73QByksz1UTCuyydrHQJpIPOWGTt8vqqpzhZUXcV
         fSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745003347; x=1745608147;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pG1Bxch6x3OgorYiiEYLNmcSoJ8xuGTKE7oUjof+wN4=;
        b=O8kaoNAG3pJyHUlBHTrkRPrqoBdf5OnY1OZQdy5aWQcyTq7YuwNtKsghXl52xed8l2
         E+9HQVp7J/8sn2EyiHqYYHBPqJzTU6ZY8+K+733O0iHusl2xrmKITgdqL2ibLKFA88H5
         vuQU9BmbFBjRMupoMp5/vU9AhKFyfay5mE+t71IJHSBkKSuFvxzZ9E0b9jVf0iDggX67
         vuywQhDPOJvP0wOJxI0+FhME7MnaMUVgSXk+0s0lBRDTtsUu8EBQdOddMT4IQMNFUsiO
         iVdoKGzLv9N+Q8oK5er/pTrcPM03V6YUumm3gkaPlTihzO8gJjSvz2sFh0rPqjSOz+CN
         JQCA==
X-Forwarded-Encrypted: i=1; AJvYcCXKSdMvtL0WNj44XiVETAUcfS+X95nHft2ZcBTHMGRoRymHfZXdT9KyDhXyk1Uu52AS98uHY7p+0DtpGU8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAnXMo84VaOJ9i3Lor16gGctYEVqF9iGcmzg7ob79Tq9LLbMx+
	nZJfplqKZIjHkWjr1acEKLQlx3nfrx+yxZKHpJO1jZY6NdU8vAQlzYwfdWYOJNY=
X-Gm-Gg: ASbGnctIgp3BwvFGyT1N21N2pK0NHKy1InmesKK26JcXLOBYUweO+k2VKJ2elCskXD6
	ra9wPLwGxz+KumM7jjEmjOlzKYgpS9qBTY77eUaixIORsLqkDPMsKmB4Vq7AznlSArIXNvq3vPT
	1o7AmdTW1RevHbGiUO+1d5xKvFXNZf+eUeJEK/KUqcsOJAiQZzbo1Sy0bJ/5PKSkx4ssuMKnBcA
	K5Fbi++LISyVht//yDevINfmuTieZgTZmFcDrTgwbRDeMrITvS3nAl8h8bEZ7KeQ7BU0oOzSNRO
	EEMHW9nQqc4EsqTX3fqnDepefqrEuDgZoLICiZ1DAexydG2WXozDkYe2Gl5aDxRlyMPJrOnlaXU
	CBk4kwzPxUMJJcad6zg==
X-Google-Smtp-Source: AGHT+IFx+Ev5S1uBDcn7BVitaXEYapaEjznsEh35Pj5xuyFGfgsakDxrFpZPL1Vb+Snxu1p+KuguuA==
X-Received: by 2002:a05:6808:6905:b0:3fa:25c8:a037 with SMTP id 5614622812f47-401c0c143e0mr1988465b6e.29.1745003346958;
        Fri, 18 Apr 2025 12:09:06 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279? ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-605ff5ee212sm474001eaf.13.2025.04.18.12.09.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 12:09:05 -0700 (PDT)
Message-ID: <ed5c4b46-0b3f-4278-ba8e-6f6977f18429@baylibre.com>
Date: Fri, 18 Apr 2025 14:09:04 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: amplifiers: ada4250: use DMA-safe memory for
 regmap_bulk_read()
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250418-iio-amplifiers-ada4250-simplify-data-buffer-in-init-v1-1-7e7bd6dad423@baylibre.com>
 <CAHp75Vdxdbqu6qkbuo5y4jADOH_h9Re6m8icSj3Je4hnVsha0g@mail.gmail.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <CAHp75Vdxdbqu6qkbuo5y4jADOH_h9Re6m8icSj3Je4hnVsha0g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/18/25 1:58 PM, Andy Shevchenko wrote:
> 
> 
> пʼятниця, 18 квітня 2025 р. David Lechner <dlechner@baylibre.com <mailto:dlechner@baylibre.com>> пише:
> 
>     Use DMA-safe memory instead of stack-allocated memory for the call to
>     regmap_bulk_read() in the ada4250_init() function as this could be used
>     directly by a SPI controller.
> 
> 
> Sorry, but can you elaborate more on this? If driver doesn’t override the callbacks the regmap SPI uses spi_write_then_read() which is supposed to be dma safe. 
>  
> 

Ah, I didn't dig that far down. Will send a new patch that just cleans up the
unnecessary alignment and unaligned call.

(Also can't believe you sent HTML mail!)

