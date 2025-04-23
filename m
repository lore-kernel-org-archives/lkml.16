Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8555519DF4C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745419891; cv=none; b=DwswoUV98zkOZif/GgdFiPkjNclMi7scNsohtNvpnzKiWkIusfT+kDNvr6cEGpDhQVyLIO6ZA/3m0ANFNKOh1ZTXKarLa9icKYBNoaz0/tRx09MCUpXkSX1H+sY604+cilgf4PbzWCX19rzPVzvCfplDEFGwOF3ue82V7/bU+rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745419891; c=relaxed/simple;
	bh=8BPdvxvbsK0vZmPrPm8yRAj5fOOZelwn9qPF1WNyEuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eCEZ/Jvq3l0EQtO1hRI1bu+wx5DMKSQ7VLK4y9jOucjRXlQCmExM/6EQ8PH0mxpphFAJfVv62wdH8IvZ93Wz9XHk3naabYB9qLHR8da7xynO7sGGyTlOzMgrG08zmXbJw/aCCSgo7PnXsHmU2FqwLD/TmwEF//c9L6sL6owmfPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=qJhwYU9V; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="qJhwYU9V"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3f6ab1b8fc1so4201842b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745419887; x=1746024687; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wvwv047VfCd6UZH9Jh21KmwpSxODx1nElqK+UFecJ5w=;
        b=qJhwYU9VQlPjIZUEbZHRpFGb0ZxsUqPXvCv3ejzCXF5hCw4/57VY879vrUVE5gVROw
         ZS9Eo2sHEp3tcc24JHjZ5Oq+FPEX8MQOa47rZas+nM3pTT7FFgRYdWgebuTmgMUB5Rds
         cAfPcDqpTznQBqqjdOMwfqGDw5urwqlHGPMzxW1kaV1kfUtvo9lqELuEMEQidQ7L9PKr
         K0rcStqkxB8fqUsS45EFW0fFR2C2T/1GRfw5BOJKXqBS6VEiq+xX1mdCiTxSS1bcviAP
         vIpCaQPJF+CQxLIddAIPJ4f21esVl8SxqXMDk7unyH1xzzhAFyi1qzidEbmkcBD9WQ9g
         ODGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745419887; x=1746024687;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wvwv047VfCd6UZH9Jh21KmwpSxODx1nElqK+UFecJ5w=;
        b=E8xlp/uAE7NGdv7hynR5w4gzmnxtll8bk/BhTLKqgbRvVL/h+WUSvceGCxksdrDINC
         of/xUE5WsiixBiDefCv0NfdimER8gfkEYdzIyY055b7aC7fr0HvHCqa+9DUe6x6CGbJg
         cyZZfhgBZCJF58cBlVnbMb5t1hxHXp6xm1T+H3oaQ7fuXr+ROrdRaWuzfYJHkp5BrOvF
         NIRSQft32WGI6J7jBDu9UUpgHRzpiv6QOuT6cGAtm53WI5R1QVmdBMb6yLi6Bp0LSqhS
         l4F4xMGfTjMQGyqDBfdPgcGXqo+emr5bgDGA7IwK1prXlB2y2Ysag16jarXY/89Bid2G
         O8TA==
X-Forwarded-Encrypted: i=1; AJvYcCVP7yXfVomi6OqPgazS8UGx3u8lou48L+7hb2LGoksqUB4xfFCOPWxRFHCjILk5nEryeT/zPhIgqrvk/I4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvEx8HnxnEz0b0yB84XnGd2HqkfpbiXi6XMIyf2VpjnFEFHPri
	pu0bD5A/37UHrTS7S/f2iZYn+4yP9Izi9yctoce3vwSc15kNgEPHQQXfoQggD8s=
X-Gm-Gg: ASbGncuZa+OoNVtsYu/wLzQ9nJsongG/5vDleLjA01FljnpjM0mrb27LZLGdYBBLGB1
	Y+CHXJCqNUxGMYQp3qMd7xtHlLnFdm0uvrc3n7N29Bzct+WTz0pV/JTJPhD2TG8J282TT5MekUs
	yGwSIwCAb6gv1J+IykdOp05GrAy2cNIeQbrRWv7uiEBmFwDomYnB5h5xtkgo8WuZYIUecDE6DHh
	Hj9ZXZdDK+f5WWPmqt2LNSwa28OkGLvdbkTwvFJQdQL1cZg5YaGDUIIc27V7M7htAJXVsT9qvTW
	q+nDOflYUgeoCr4ClZ6kMav4qcvRdUzpzAlNKEF60EQoLA/n35XBV/13oHOO9lmg4VE7Zd8zpou
	ungSxRNZ+8VidTus=
X-Google-Smtp-Source: AGHT+IEBGwoz+Ahwpfgm/4AVjbIfHM/ADajlJxdstdyq4SXFSdYnpTORxWm+CfhjvRe0zr/nrusBmw==
X-Received: by 2002:a05:6808:2f17:b0:3f8:c486:9b27 with SMTP id 5614622812f47-401c0a8cc72mr14379361b6e.22.1745419887508;
        Wed, 23 Apr 2025 07:51:27 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:581:f155:b9de:68de? ([2600:8803:e7e4:1d00:581:f155:b9de:68de])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-401beed73e9sm2630018b6e.12.2025.04.23.07.51.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 07:51:27 -0700 (PDT)
Message-ID: <b4218efe-3785-4065-a3f7-57824e882f09@baylibre.com>
Date: Wed, 23 Apr 2025 09:51:25 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Eugen Hristev <eugen.hristev@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-0-3fd36475c706@baylibre.com>
 <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-1-3fd36475c706@baylibre.com>
 <701bfc6a715046044dbc789f1c11c7f85395c7a8.camel@gmail.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <701bfc6a715046044dbc789f1c11c7f85395c7a8.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/23/25 4:18 AM, Nuno Sá wrote:
> Hi David,
> 
> Nice patch, I really think these will be very helpful... Just one comment bellow
> 
> On Tue, 2025-04-22 at 17:07 -0500, David Lechner wrote:
>> Add new macros to help with the common case of declaring a buffer that
>> is safe to use with iio_push_to_buffers_with_ts(). This is not trivial
>> to do correctly because of the alignment requirements of the timestamp.
>> This will make it easier for both authors and reviewers.
>>
>> To avoid double __align() attributes in cases where we also need DMA
>> alignment, add a 2nd variant IIO_DECLARE_DMA_BUFFER_WITH_TS.
>>
>> Signed-off-by: David Lechner <dlechner@baylibre.com>
>> ---
>>  include/linux/iio/iio.h | 36 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 36 insertions(+)
>>
>> diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
>> index
>> 638cf2420fbd85cf2924d09d061df601d1d4bb2a..4dd811e3530e228a6fadbd80cfb2f5068c3d
>> 6a9a 100644
>> --- a/include/linux/iio/iio.h
>> +++ b/include/linux/iio/iio.h
>> @@ -7,6 +7,7 @@
>>  #ifndef _INDUSTRIAL_IO_H_
>>  #define _INDUSTRIAL_IO_H_
>>  
>> +#include <linux/align.h>
>>  #include <linux/device.h>
>>  #include <linux/cdev.h>
>>  #include <linux/compiler_types.h>
>> @@ -777,6 +778,41 @@ static inline void *iio_device_get_drvdata(const struct
>> iio_dev *indio_dev)
>>   * them safe for use with non-coherent DMA.
>>   */
>>  #define IIO_DMA_MINALIGN ARCH_DMA_MINALIGN
>> +
>> +#define _IIO_DECLARE_BUFFER_WITH_TS(type, name, count) \
>> +	type name[ALIGN((count), sizeof(s64) / sizeof(type)) + sizeof(s64) /
>> sizeof(type)]
>> +
>> +/**
>> + * IIO_DECLARE_BUFFER_WITH_TS() - Declare a buffer with timestamp
>> + * @type: element type of the buffer
>> + * @name: identifier name of the buffer
>> + * @count: number of elements in the buffer
>> + *
>> + * Declares a buffer that is safe to use with iio_push_to_buffer_with_ts().
>> In
>> + * addition to allocating enough space for @count elements of @type, it also
>> + * allocates space for a s64 timestamp at the end of the buffer and ensures
>> + * proper alignment of the timestamp.
>> + */
>> +#define IIO_DECLARE_BUFFER_WITH_TS(type, name, count) \
>> +	_IIO_DECLARE_BUFFER_WITH_TS(type, name, count) __aligned(sizeof(s64))
>> +
>> +/**
>> + * IIO_DECLARE_DMA_BUFFER_WITH_TS() - Declare a DMA-aligned buffer with
>> timestamp
>> + * @type: element type of the buffer
>> + * @name: identifier name of the buffer
>> + * @count: number of elements in the buffer
>> + *
>> + * Same as IIO_DECLARE_BUFFER_WITH_TS(), but is uses
>> __aligned(IIO_DMA_MINALIGN)
>> + * to ensure that the buffer doesn't share cachelines with anything that
>> comes
>> + * before it in a struct. This should not be used for stack-allocated buffers
>> + * as stack memory cannot generally be used for DMA.
>> + */
>> +#define IIO_DECLARE_DMA_BUFFER_WITH_TS(type, name, count) \
>> +	_IIO_DECLARE_BUFFER_WITH_TS(type, name, count)
>> __aligned(IIO_DMA_MINALIGN)
>> +
>> +_Static_assert(sizeof(IIO_DMA_MINALIGN) % sizeof(s64) == 0,
>> +	"macros above assume that IIO_DMA_MINALIGN also ensures s64 timestamp
>> alignment");
>>
> 
> I wonder about the usefulness of the above assert... AFAICT, the default

Jonathan seemed minorly concerned that a strange new architecture might have
IIO_DMA_MINALIGN is < 8 some day, so I threw it in there. But agree, it seems
highly unlikely to actually happen.

> alignment is 8 bytes and I could not find any arch defining ARCH_DMA_MINALIGN
> smaller than that (would be very odd to have a cacheline smaller than that these
> days). For bigger values, nowadays they are all power of 2 and I would be
> surprised otherwise. But the more important question to me is what if the above
> assert fails? Will we not allow IIO or some drivers to be used in that
> architecture? It can become a very "painful" situation (assuming these macros
> get widely used). So, IMHO, either we assume the above can happen and rework the
> macros to make it work for that hypotetical case or we assume the above is
> always true and drop the assert. TBH, I think it would be a fair assumption...
> 
> On top of that the assertion is wrong:
> 
> sizeof(IIO_DMA_MINALIGN) != IIO_DMA_MINALIGN :)

Doh!

> 
> On the other hand, as I mentioned in V1, I think that an assertion or
> BUILD_BUG_ON_MSG for making sure 'count' is a compile time constant expression
> would be helpful. Sure, we'll get -Wvla but some developers might still ignore
> the warning and send patches with these arrays. So, it would be neater if we
> fail to build and force them to fix their code.

BUILD_BUG_ON_MSG() won't work because it expands to a do/while loop which won't
work in static struct declarations. But I can try to see if we can come up with
something that works.

