Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7921B0402
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 22:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745706858; cv=none; b=Fjto5/Hie9ciJzGllonB+z0rendlPOWf8QB2DU13xC62UEyLV2KZRpQdjWzmdoJq2Jxqn3EQJgKe6HO+e6YugM21EgLGuhZZoN5Y0srKW3jifw1IMzR08ar62L/zTBsTFPsemBwWcfoVkUOJaEkDvFAvl4pakZ9Qn5F8QsRyVi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745706858; c=relaxed/simple;
	bh=KFP/OMt+pVNyA5FsCHR48Mx5Hg0N9JcRJgmsN3DujQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=evJ+/g093vRJdiSqhZ5S0MHRqNx94LXehIDRPt+mpjGSddSbCRDQ16rHaXzn1dcQn2ZBYWddru+qM2ep/AWLjsgJjp42jZElRegLspozfpKphQWwhJnMCoSTSi6b0RWsK1C59kKAC4CWs2OxC7sKk5PSRTpXUaJMtAR/hVwdND0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=BNZzBz+y; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="BNZzBz+y"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3fbc00143d6so3002226b6e.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 15:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745706853; x=1746311653; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iYVVUGhcXIwOLu06TILyWFwu4mq3jXrLLzPklRAXR6Q=;
        b=BNZzBz+yhzpzg/M0/JeYdSA0M4sh+kTyxVvRWshrqxAjCrGijFMxrmGJJGdiW74xnv
         /+bJ7Ygwl9HIAv8l66EUPeuxtMQmPUQD2vvswyh7vBam5dJivvAkGiG2S3SYe8ZwRugp
         w2h/uLtkmMelldCyBxVpJ+zS1Nwirr3Ic4+Od+5iCE4lU2TVwNaLhG1EiIgJgTUlAgtx
         meDP+mAh05TbInY7fBOpapiKmvnaEudqyde6/IsXCABRvsznGCv425fVO0kYpahhNITH
         LzcJO1/4P03/98IKsdO6ymloRoefOjEJTk4V48OTxreyAtFtxTYK6t45mf1MUQ6UCuOv
         c6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745706853; x=1746311653;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iYVVUGhcXIwOLu06TILyWFwu4mq3jXrLLzPklRAXR6Q=;
        b=Zq4cZs/Y4T8rsuBSc+TNaQFVU3hrywDssOg7eg12e66ggtpuHPdnyg1Yhj9HbRGTrL
         YVHc5QHXlppzuYL6SzTBkP31XpqsA1WnnId5LrbzIEVsYVgqzYPhgmOwpFUZjLHzz1o4
         qtZreKfaul1oBGst7FUq0IYiaLjnzwWFxTv0cWsstrVdePzPSEf8QdxZVsjl+S+MuHZb
         ik8b+vsI5a+egwctKRQGTcq3bCi4fMmd5CfNIhi/DqoRa8X2GOiPJGqOAFlJOT95PxYH
         wJiN0HXXbVl7p143MJkdNDwn6YbYYG0LNKc+Zy7ATL+lDQoaytu8AAwSLKOvqblFfS82
         ULsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTphdH7Dpfn2O+8XVfYM+Fk4zW3//2qbXOT0IAHjOTER5ydQD5j0f8H3ftN/vuqz4XJOrFQA7lx5v2GWM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfPJu36FI56+SnlZbRoANH6AnM6gP530Tz/3LQ9XJP5zKAZ7H5
	lWM49fzLcuzq+UCi4A1/kBBNhflLh2Fc1ixkTN4TPkUOMeOBy1FPS1TrrUME4DA=
X-Gm-Gg: ASbGncsQdzGMGRhYdiQh8PIElCbEMoOPKUwg748YF7DUdaa9LB3RqPfg+TEjypOJYtM
	kNnUL+XO7YGiH4mtTnKejiiN/4nXJSY5Gn13r9a5AJqzfkx1b83on2SjyDGDOpDl3uV/j2Q0TIh
	iNiTo+t0QIqkNZDi110aFUSDwNIMJmP4IPzzYrI/ILjzu3f7WRYpDIJjoRvpygnuBaq9Tj2/aZV
	PflaKCcM/mKiDJab4MzOIDYsrqAyo9hNM9TJJBDIJrqsFIDtMkfUpnU26CQpa4OKJw17m+geoHT
	sZXKE8X2ZFuEF5LiYhf6dFJ5ushVX4uT9SHBOZOJ/UowOIXjHJexi0bc5dzpH2/qp/dpKtU/dxo
	Idy85FBGiMoyeLXb6Ag==
X-Google-Smtp-Source: AGHT+IEWcdgjh8/VjhINgT8GfioFVGPqEFDg87O6EIU4BE5z/R9+CNVDT1w95ttosllom+MZY3JBMQ==
X-Received: by 2002:a05:6808:338a:b0:3f9:3de3:c8de with SMTP id 5614622812f47-401f289161fmr3985703b6e.12.1745706853626;
        Sat, 26 Apr 2025 15:34:13 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:96ff:7f79:37f3:5c67? ([2600:8803:e7e4:1d00:96ff:7f79:37f3:5c67])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-401ec977dafsm1329187b6e.41.2025.04.26.15.34.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 15:34:13 -0700 (PDT)
Message-ID: <8a57a332-c2a6-4825-a5f7-d765ea15bd6f@baylibre.com>
Date: Sat, 26 Apr 2025 17:34:10 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
To: Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Eugen Hristev <eugen.hristev@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250425-iio-introduce-iio_declare_buffer_with_ts-v3-0-f12df1bff248@baylibre.com>
 <20250425-iio-introduce-iio_declare_buffer_with_ts-v3-1-f12df1bff248@baylibre.com>
 <20250426123509.0b04f0f9@jic23-huawei>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250426123509.0b04f0f9@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/26/25 6:35 AM, Jonathan Cameron wrote:
> On Fri, 25 Apr 2025 16:08:43 -0500
> David Lechner <dlechner@baylibre.com> wrote:
> 

...

>> @@ -777,6 +779,42 @@ static inline void *iio_device_get_drvdata(const struct iio_dev *indio_dev)
>>   * them safe for use with non-coherent DMA.
>>   */
>>  #define IIO_DMA_MINALIGN ARCH_DMA_MINALIGN
>> +
>> +#define __IIO_DECLARE_BUFFER_WITH_TS(type, name, count) \
>> +	static_assert(count); \
> 
> Why do we care if count is 0?  Or is intent to check if is constant?
> If the thought is we don't care either way about 0 (as rather nonsensical)
> and this will fail to compile if not constant, then perhaps a comment would
> avoid future confusion?

I would be inclined to just leave out the check. But yes, it is just checking
that count is constant and we don't expect 0.

> 
>> +	type name[ALIGN((count), sizeof(s64) / sizeof(type)) + sizeof(s64) / sizeof(type)]
>> +
>> +/**
>> + * IIO_DECLARE_BUFFER_WITH_TS() - Declare a buffer with timestamp
>> + * @type: element type of the buffer
>> + * @name: identifier name of the buffer
>> + * @count: number of elements in the buffer
>> + *
>> + * Declares a buffer that is safe to use with iio_push_to_buffer_with_ts(). In
>> + * addition to allocating enough space for @count elements of @type, it also
>> + * allocates space for a s64 timestamp at the end of the buffer and ensures
>> + * proper alignment of the timestamp.
>> + */
>> +#define IIO_DECLARE_BUFFER_WITH_TS(type, name, count) \
>> +	__IIO_DECLARE_BUFFER_WITH_TS(type, name, count) __aligned(sizeof(s64))
>> +
>> +/**
>> + * IIO_DECLARE_DMA_BUFFER_WITH_TS() - Declare a DMA-aligned buffer with timestamp
>> + * @type: element type of the buffer
>> + * @name: identifier name of the buffer
>> + * @count: number of elements in the buffer
>> + *
>> + * Same as IIO_DECLARE_BUFFER_WITH_TS(), but is uses __aligned(IIO_DMA_MINALIGN)
>> + * to ensure that the buffer doesn't share cachelines with anything that comes
>> + * before it in a struct. This should not be used for stack-allocated buffers
>> + * as stack memory cannot generally be used for DMA.
>> + */
>> +#define IIO_DECLARE_DMA_BUFFER_WITH_TS(type, name, count) \
>> +	__IIO_DECLARE_BUFFER_WITH_TS(type, name, count) __aligned(IIO_DMA_MINALIGN)
>> +
>> +static_assert(IIO_DMA_MINALIGN % sizeof(s64) == 0,
> That message isn't super helpful if seen in a compile log as we aren't reading the code here
> "IIO_DECLARE_DMA_BUFFER_WITH_TS() assumes that ...
> 
>> +	"macros above assume that IIO_DMA_MINALIGN also ensures s64 timestamp alignment");
>> +

Seems we actually have an arch (openrisc) that triggers this [1]. This arch
doesn't define ARCH_DMA_MINALIGN so it falls back to:

#define ARCH_DMA_MINALIGN __alignof__(unsigned long long)

Apparently this is only of those 32-bit arches that only does 4 byte alignment.
From the official docs [2]:

	Current OR32 implementations (OR1200) do not implement 8 byte alignment,
	but do require 4 byte alignment. Therefore the Application Binary
	Interface (chapter 16) uses 4 byte alignment for 8 byte types. Future
	extensions such as ORVDX64 may require natural alignment.

[1]: https://lore.kernel.org/linux-iio/20250425-iio-introduce-iio_declare_buffer_with_ts-v3-0-f12df1bff248@baylibre.com/T/#m91e0332673438793ff76949037ff40a34765ca30
[2]: https://openrisc.io/or1k.html


It looks like this could work (it compiles for me):

	__aligned(MAX(IIO_DMA_MINALIGN, sizeof(s64)))

If that is OK we could leave out the static_assert(), unless we think there
could be an arch with IIO_DMA_MINALIGN not a power of 2?!

