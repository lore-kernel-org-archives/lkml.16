Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11840256C69
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739207489; cv=none; b=RoyHn6uzdEKX5MMQ4WH7ujE3iAkiDQ3K92yXexNK2zHeyuV8SZLYjdPoC1yjw7Q5aSiIp8C4HJL5lHaTOaot4htK4dFBZyQErqUwSnaXov11Y82Le/vQFJPMS3YfjwEPOAVyJ+wPopp3w7cg1JAANk0ebUZaQRK0UeRoCceJk0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739207489; c=relaxed/simple;
	bh=l6ixI9ocsg5QZ16cvn2QkpaT8QZyQoyW5ibERsaeAMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZkobXV0PbkigM6QW5jhqPDi4nwPcyk7ovd3/0w4FDAiJXerxSy2rh6nN5VGQiLb/0lu9V5ACt4OxqgLN5Swe5T8LO5h86mzyN/9j3kg+NJ7kMaQ0jh96nr/V0wq1bsYx9a8xIGD70q+ImFQog4HJjmkWRZicTHkw0SBAX2wf9fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=LrQG0WeQ; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="LrQG0WeQ"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2a8690dcb35so1392255fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 09:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739207486; x=1739812286; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y62wEuUB23NjmeSDjcZkJZH4kkElpdd1L2B2fifJwGY=;
        b=LrQG0WeQbLzRgqLVKAkVeAz4SHc4lcfp6bMBkIsb+jVM0E4FE7akiPx+EYM8VSC8/6
         /hi/wJ0PgriVCqlPCNjJZFUrtwqqUVGgIi4GXI9a0102U1BIFzBKwpwIMXHry92rPydn
         pfc4rAP11sr8VP2+t/+0EJT+rXtM7n+9pBGCaLcjEgrxGm9IVe6VfBH6F5R6FqPZvQg8
         d2h2SpkL5260d3eMxyVDkYTHuzSzdeAej6e3e2WHBwcCMoqqyGrMJVqPvmb8I8rqv6ED
         Y/buAZrg21luPF79Wne8GJY1Z8XSN0U0K7RFEsAUrOSca+YXCJeLsE+J5DggIitggNcS
         v7WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739207486; x=1739812286;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y62wEuUB23NjmeSDjcZkJZH4kkElpdd1L2B2fifJwGY=;
        b=vFh9BJIewzt2tlzeVTwvbn0/NETKRGDJnJkGRMWaroXRzvvSXJ6ztt7sBjiWfMSoFM
         VHfqTUvLh95D0NJFczbZBMyNjbNtdmkjDgOdeJnVVIjgqDLer/7iIo47b/cxDDymuaNk
         tLypda53omdQixSopSXgdhysCxgf/wuIRQdQ6h4AOeTNQFrFEUqeh6BqaPc0WmdZ3md9
         IHsE8y2h1vV87bllhJxCZ71sMWAdHsq6PphzzjWaws9TUMqXjgQPg9u2c9e2hxKqQ/V6
         4sc1XS5lkJu8PLVLA9EtKQaAW5jmqc2M+ap8jE1II0hpDb3pv8RJ/R1zhZ6nxshQEcuV
         rZjA==
X-Forwarded-Encrypted: i=1; AJvYcCXdfOatJLZsMC+OpiNtz8OxA65jHJezure1nht44jJlK6Ftl5lsgalPR1cvBOu/kP85vKGlrxSS8CIH0Ww=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIRf29LI3pvHsSM3LTwgdEps6NUbJ6ELkOM+rP8eOf9nizn4pE
	v+yYYofu9gXh06FutlxvyfO8gn4EExBP7wSdeugnA4dj4C/dWut7VtU6HwC8y+k=
X-Gm-Gg: ASbGncsMpyqlpftYIabYNceHfPGIrgVWpb2YKqEeCofU4m4ftvcak3pmaGndWhs/Dfw
	8V12TiOCzmjjQisHzm1U2mq7MXiMjjGSdJOOqX+Kh/wt0ycsm8boVnbj4t4Tiy2+RMri+oHI66t
	htqvb/eIUH8wVb23yWl401pNLAc/VaWWQlx7UIELi13mHa8Ur+aZUm2W8+WwLp3PeXcJW/dLrpL
	cRH7ckHhP/3tCjabbuO+m4ODzvRK/VOg2LF8WntxlAsJweYJ2HDnJg56K1B2+1hsSLPnDtVIV58
	vxrPrW6g1KUs6fMZOeQqT8m0ADwUcMXONh1axgOlNQQJTy6/gDwd
X-Google-Smtp-Source: AGHT+IEo4eH2CuOA2OmnMHMRwgQDew3LfoTfoARBZw+mgbte0DXZ4AUD2tzn6839+X+KetyoPMS0Gw==
X-Received: by 2002:a05:6871:6aa:b0:29d:ca24:c044 with SMTP id 586e51a60fabf-2b83eb4d220mr8661498fac.8.1739207486107;
        Mon, 10 Feb 2025 09:11:26 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b8a8c46e7dsm251881fac.35.2025.02.10.09.11.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 09:11:25 -0800 (PST)
Message-ID: <27d2a88c-b44a-4712-b066-b999e41774f0@baylibre.com>
Date: Mon, 10 Feb 2025 11:11:23 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/17] spi: add basic support for SPI offloading
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Mark Brown <broonie@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, Michael Hennerich <Michael.Hennerich@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>, David Jander <david@protonic.nl>,
 Martin Sperl <kernel@martin.sperl.org>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20250207-dlech-mainline-spi-engine-offload-2-v8-0-e48a489be48c@baylibre.com>
 <20250207-dlech-mainline-spi-engine-offload-2-v8-1-e48a489be48c@baylibre.com>
 <Z6otFlsmEikIbI__@black.fi.intel.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <Z6otFlsmEikIbI__@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/10/25 10:45 AM, Andy Shevchenko wrote:
> On Fri, Feb 07, 2025 at 02:08:58PM -0600, David Lechner wrote:
>> Add the basic infrastructure to support SPI offload providers and
>> consumers.
>>
>> SPI offloading is a feature that allows the SPI controller to perform
>> transfers without any CPU intervention. This is useful, e.g. for
>> high-speed data acquisition.
>>
>> SPI controllers with offload support need to implement the get_offload
>> and put_offload callbacks and can use the devm_spi_offload_alloc() to
>> allocate offload instances.
>>
>> SPI peripheral drivers will call devm_spi_offload_get() to get a
>> reference to the matching offload instance. This offload instance can
>> then be attached to a SPI message to request offloading that message.
>>
>> It is expected that SPI controllers with offload support will check for
>> the offload instance in the SPI message in the ctlr->optimize_message()
>> callback and handle it accordingly.
>>
>> CONFIG_SPI_OFFLOAD is intended to be a select-only option. Both
>> consumer and provider drivers should `select SPI_OFFLOAD` in their
>> Kconfig to ensure that the SPI core is built with offload support.
> 
> (I know that this is now in SPI tree, but still we have time to address something)
> 
>> +++ b/include/linux/spi/offload/consumer.h
> 
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (C) 2024 Analog Devices Inc.
>> + * Copyright (C) 2024 BayLibre, SAS
>> + */
>> +
>> +#ifndef __LINUX_SPI_OFFLOAD_CONSUMER_H
>> +#define __LINUX_SPI_OFFLOAD_CONSUMER_H
>> +
>> +#include <linux/module.h>
>> +#include <linux/spi/offload/types.h>
>> +#include <linux/types.h>
> 
>> +MODULE_IMPORT_NS("SPI_OFFLOAD");
> 
> This diminishes the point of the namespaces. Anybody who includes a (dangling)
> header gets namespace imported, which is not good. Same for other globally
> visible headers.
> 
> (This is the main concern of this patch).

In this case, we specifically split up the headers so that the only time you
would ever include this header is if you need to call functions in this
namespace (i.e. struct definitions are in linux/spi/offload/types.h which
doesn't import the namespace). So this doesn't actually seem like a problem
to me.

