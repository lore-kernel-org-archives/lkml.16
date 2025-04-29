Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3815A208D0
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 19:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745956066; cv=none; b=s8Lhgny1bp7OqEPxl5jf5hq5zxC8+RBUejaW9fAwFMdiQkGSCn3b8okdi/j61CPPtm1luoulkYB8LZpXH2Bx87RU1Y7QZd5n2km5jgGd/P6nNvxGyJN51lCdVZB0nN0CA2CItu4Bb//cKqiIvq5507rEvqgmS+2VxMuOEqL87h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745956066; c=relaxed/simple;
	bh=ugjyf/jMyKKt/zcQVDlLaFsLZEJxdrKZne7xK3f5sUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pd7qhwr5ZlTLFdVgCVHp5/QMHhaNTsYWO9uHEEVuOmQ0lkz22zdKBLhwu4mh3O4YmmYn7FxZ60E20pGjckgpAMBPJtVU9Qs8VdVru2/fexYrQytuwJ/3GCB6CyEnepkJz5c0SjFs2LjF2BAgLt7nuxf5dP+tNDufJYz/AZ32cSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=gdesoaGn; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gdesoaGn"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2d071fcd89bso1841299fac.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745956063; x=1746560863; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PNMUgH5uNY4IqYIYRqaJEMyg/HY2VEe42NNCO90DOAc=;
        b=gdesoaGnaIjkBQMOEMiWnQSmtkpyMRn3qpZSwNEDsPhqZ7kppm7tIXCviOdpJqlVQv
         bACpzRAZwNkkBNj8TBN2JAiHLCdSqgMP89TnRrlq57hGtL8ntn6kAVCAheqP+ncIzEX9
         AnSf/NsZ5SR284jJW4QVa21xCDe11O4t4nAWfxiCE/hy/uyZllX2vjhd+BTFrKNLS6cq
         ya6pZw3FESzLyNkRDvz7yfMi28DdgwpzSUIQ11nrvIesdcgMA1OPsgQeOSNc/jj8SB9N
         Woq1xyuJvDX9GgSttyVU+oKWirh7x7ben88mKeuXzZwnmdmxt2+7/pO3CvqWC45RM5Wb
         lA5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745956063; x=1746560863;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PNMUgH5uNY4IqYIYRqaJEMyg/HY2VEe42NNCO90DOAc=;
        b=V5iUhHICxv5/sjQn9W2ElTYQZAD/arYMzDbPbUoENw1WxMfhG6sbj+W/SkkdcOt/9n
         ln3RQ+0+JopryOLAgDFX1aSIGSHjcnAdjdqoKeHWosFcDJZrjd27r6pt937/nV4aEMIF
         iTNCneaq3cV1LZvnHm0xTyvvv4P6u2Ak1Azt5psVBIrbHnmZ0xTy/Nk5HCmE6CdkSTta
         pNZRVtaXmfdVCaK5nB7qsv9Prvqi1PUDq1Bqy8kJ//hPXBJKGgEW+RFWGTVE3dtI3Ue4
         aTuI2AsV4VChMdGXBCFx9AsuMu7jBbOY53bqAJyQ98T6yB5IAjongoaDBtt9WvJ8+6hO
         XmPg==
X-Forwarded-Encrypted: i=1; AJvYcCWyvjidcJ25NxicF4hp/85d36spn57PqUPYkYYnntxWu9xVSuHV6e3Fm6mUJiW4T/KAeBqyPULH7tDIlSA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4hbCtoc+yOQW49rxRfgsSdCRFqdQMi1dx5OaORD0hzqNiu83u
	QFnQTXXWlD4IPVh/3WX8cVSc1BHQXWTX8pszaza0POonk+6oak9JkKd1HmP7oGs=
X-Gm-Gg: ASbGncs/0aKxKsJbLA98Axs1ebXd7ZAl07vvW+tbSAjjdB2on5VaauuOXAdQBnvffyD
	Tx5jxWsjirXfEu8rCMqWChmZOsisFo5QOOTWMlaRM8/7eNEvE3FbnD3q3/Gsa8dXSPA1CFqU2y1
	wAaGOd2uL236YQnWeJIOeaFwIyCKH8DnHZ/tMa2EUVux70e+ZhK2zm4NpKLzJsrqDYGR8uJ7rA+
	aqEBgIF/ecgMFzZS8sLTm/OPhnbu/WVGrYYePDTcQfgFtSiaMjl1YfgE3y3Dv/nZRiKCf2iulFN
	Y9VWzKuxrObql91XaX9oOto6DFvR4HqcmoAjyy/d4zttqHn0dmjDWt0lfTzmaJJjfH99FmITrgt
	+ALOnN5OuEIsf1GHuuRQzgg6N/FdM
X-Google-Smtp-Source: AGHT+IF2u4BGVcklS8e42c3uNUIrh7aRuex4nRoeOZeNBykrvHleyFegxvqc61saZCq3sjivYkKrMA==
X-Received: by 2002:a05:6871:358f:b0:2d0:3078:e72f with SMTP id 586e51a60fabf-2da6a2b0b6fmr225244fac.26.1745956063148;
        Tue, 29 Apr 2025 12:47:43 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:dc17:157d:e8b2:3ad6? ([2600:8803:e7e4:1d00:dc17:157d:e8b2:3ad6])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d973c18da5sm2955704fac.47.2025.04.29.12.47.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 12:47:42 -0700 (PDT)
Message-ID: <38e243b0-e81b-4d4d-97fe-91ea2bec6270@baylibre.com>
Date: Tue, 29 Apr 2025 14:47:41 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Eugen Hristev <eugen.hristev@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-0-6f7f6126f1cb@baylibre.com>
 <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-1-6f7f6126f1cb@baylibre.com>
 <1d90fae5-9c58-4a77-b81c-2946e7cc74d4@baylibre.com>
 <5c762653-b636-45bd-8800-e804ad8dfda5@baylibre.com>
 <CAHp75VfcmvLhBDjbu6x46wGyzG+i7=rVypzSm11qzWN9Qq_rew@mail.gmail.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <CAHp75VfcmvLhBDjbu6x46wGyzG+i7=rVypzSm11qzWN9Qq_rew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/29/25 2:36 PM, Andy Shevchenko wrote:
> On Tue, Apr 29, 2025 at 10:31 PM David Lechner <dlechner@baylibre.com> wrote:
>> On 4/28/25 9:12 PM, David Lechner wrote:
>>> On 4/28/25 3:23 PM, David Lechner wrote:
>>>> Add new macros to help with the common case of declaring a buffer that
>>>> is safe to use with iio_push_to_buffers_with_ts(). This is not trivial
>>>> to do correctly because of the alignment requirements of the timestamp.
>>>> This will make it easier for both authors and reviewers.
>>>>
>>>> To avoid double __align() attributes in cases where we also need DMA
>>>> alignment, add a 2nd variant IIO_DECLARE_DMA_BUFFER_WITH_TS().
> 
> ...
> 
>>>> +/**
>>>> + * IIO_DECLARE_DMA_BUFFER_WITH_TS() - Declare a DMA-aligned buffer with timestamp
>>>> + * @type: element type of the buffer
>>>> + * @name: identifier name of the buffer
>>>> + * @count: number of elements in the buffer
>>>> + *
>>>> + * Same as IIO_DECLARE_BUFFER_WITH_TS(), but is uses __aligned(IIO_DMA_MINALIGN)
>>>> + * to ensure that the buffer doesn't share cachelines with anything that comes
>>>> + * before it in a struct. This should not be used for stack-allocated buffers
>>>> + * as stack memory cannot generally be used for DMA.
>>>> + */
>>>> +#define IIO_DECLARE_DMA_BUFFER_WITH_TS(type, name, count)   \
>>>> +    __IIO_DECLARE_BUFFER_WITH_TS(type, name, count)         \
>>>> +    /* IIO_DMA_MINALIGN may be 4 on some 32-bit arches. */  \
>>>> +    __aligned(MAX(IIO_DMA_MINALIGN, sizeof(s64)))
>>>
>>> I just realized my logic behind this is faulty. It assumes sizeof(s64) ==
>>> __alignof__(s64), but that isn't always true and that is what caused the builds
>>> to hit the static_assert() on v3.
>>>
>>> We should be able to leave this as __aligned(IIO_DMA_MINALIGN)
>>>
>>> And have this (with better error message):
>>>
>>> static assert(IIO_DMA_MINALIGN % __alignof__(s64) == 0);
>>
>> I was working late yesterday and should have saved that reply until morning
>> to think about it more!
>>
>> We do want to align to to sizeof(s64) instead of __alignof__(s64) to avoid
>> issues with, e.g. 32-bit kernel and 64-bit userspace (same reason that
>> aligned_s64 exists and always uses 8-byte alignment).
>>
>> So I think this patch is correct as-is after all.
> 
> I'm wondering, shouldn't it be better just to make sure that
> IIO_DMA_MINALIGN is always bigger or equal to sizeof(s64)?
> 

Sounds reasonable to me. From what I have seen while working on this is that
there are quite a few drivers using IIO_DMA_MINALIGN expecting it to be
sufficient for timestamp alignment, which as it seems is not always the case.

I'll wait for Jonathan to weigh in though before spinning up a new patch.
