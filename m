Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B46B290BCE
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 16:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745338515; cv=none; b=mQqUOvQq7S6RGpr3BCEFObjtFRX/LMyGf7zlWGqqMcF/VQh/aQfDbx8GyhOFLi5wmytdu8R4Ypd6HDGuadAQonC7XF8V/rcDv4EUvIDcee4rlX38NoeBX55VjMZIWlM225F6z+hQAZTBoEPfGF14GOAFms5TUQcpFi6gCAAt8SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745338515; c=relaxed/simple;
	bh=smPXZMMT16PcIo7LNQP2eEfghWATEVZLFAGhCTPVX0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mmr2pwDZ1X/eyWBgd3HZphYQM75wLBta6jBwU4YA8gJQXASsm6zKeuw8k3ZK6YuH6HXAqy9r2ZpUkVzn7FDT2DgZKZFOtPz9KIaI2GHVqqpOD54OqGRGAfl7tcvWYTwnai1MsUEDIK+PzCtUlwAl/6eZ8VLXdZhXN7P/ymyQNUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=g4xDRlsK; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="g4xDRlsK"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-72ecb4d9a10so3212287a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745338513; x=1745943313; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oS2bZp2eaQwTZFLdRadzwceZRRndXHL/edMYPujKPfc=;
        b=g4xDRlsKzysemlLdLOmw9nIWLjUtgVgedxE7nNWKW15zCi3CGITWhyRWW3YkbkNBwT
         iI6701gDXBkPCG2V0owqYIw4sbf4K07UGIxOoze51n0GUNp/Xr/YFlA5HGtxOpC8RhQM
         AA1IjQRuwZTtejT2nDyexTKzyrBMQarncuMOg+rYUG6oUsDtwLY7Hqi3RcXvPh9acS8x
         zsUI1iYhdoV0WjjcAiQiJVKo4ADVsy06HZ7hXU+ywvDU8PVgqbzti4+xCqdSNGrv3mGV
         IetolbMtuOjs38FzOls0u7nukZpggqH4rhpPQ5w0yuPVhE80x/ax3w2yLgbyLIcbrgFh
         ClrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745338513; x=1745943313;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oS2bZp2eaQwTZFLdRadzwceZRRndXHL/edMYPujKPfc=;
        b=PslEUwgEyyG/GHBB3WqT6X84RnAdTt1uoF4icrRiiQzJMtV7zYMyIe1THs0WfCepiu
         PXIodx2Nu/GVYMw60jzFdvTGp+NZ67k3HJ+vcXalQkUQ3zqCFtRYXEimuUTvZOkxhHVm
         gCKwlFkfFWwPnj1wHLHkUEXu+6lblfFPehREabMZLKbFE37Bh1Pj82groAV4lxDMvGHA
         GLkedDnaKuZ76mDhsRW4Mq3mbP9daa2EV4z+U7e19nhTCsGtSKmxBf/6YHDDmh3OIeuA
         j877hDHrOGND93gWgEpyAwAZ/4QHqVU7nINSOdXCia3z/L4X5RJn10JOGDPrge6d1SeL
         9GVg==
X-Forwarded-Encrypted: i=1; AJvYcCUqlmyMIU8sfvIKq6qZv38VT2ej7TCHYiSNBqK8nNfG5HYgxTD8ri2Gr3duWdCvL9F0yd9gz1ynXiX39XM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnOfiVsDfYBDdixQA4Lup/t1REXPZRhC0/4vzYyei9GIx3jZ21
	z5r5iDjL7jKK38QTtKZSCwZM/i0bGXmW+F4QqywEKmPQlJE7A7CmTi9njIp9GCs=
X-Gm-Gg: ASbGncsg16rGqrBRuBVj7yagu5zhK2Ao57zVtuQiOoyRwM6E21APvhDDHrO+cLwq9kF
	L9GGqwZjziYsCRuTEhRaYKBbPzaHrETbxHbOtwmUq84cxkhoTDQGjdbkCOKAoHhRPe7pypJRS3R
	HWzmOGZQZ6+jNnDLt5ZMF2ZIY8J6dw4TdqNd7xdSrQZraum23qPQfE495B1+YcLdtct74A+q3YJ
	ALi1m6bNpLcO9gK3lRYuux8E6v2Z/ETSLM4cq8zpLFKVsIcXZGrM+xNMa/6w7EzETzIfcSnGaVN
	Ud4Pc3mfvOedrMiBaaFFTcFizZHFMkYqqoqgU8lzDTxMxr3QVzeWQhGRSMx7P48on3ia3NjaeVq
	lNN02YezFrsgd6ID3lw==
X-Google-Smtp-Source: AGHT+IG4XPv6u71aYUS7zSEkuMCHBx/oad1eblhKOxlpoSde+1YJCcu+j6kGm/XNDy82BZ/hr+trtw==
X-Received: by 2002:a05:6830:d8c:b0:72b:7cc8:435 with SMTP id 46e09a7af769-730063506ddmr10104798a34.24.1745338512900;
        Tue, 22 Apr 2025 09:15:12 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:c8d1:e0ed:ce8b:96a3? ([2600:8803:e7e4:1d00:c8d1:e0ed:ce8b:96a3])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73004884780sm2011197a34.53.2025.04.22.09.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 09:15:12 -0700 (PDT)
Message-ID: <83fd807f-09fe-4732-be48-1b26e9f9401c@baylibre.com>
Date: Tue, 22 Apr 2025 11:15:11 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] iio: introduce IIO_DECLARE_BUFFER_WITH_TS
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250418-iio-introduce-iio_declare_buffer_with_ts-v1-0-ee0c62a33a0f@baylibre.com>
 <20250418-iio-introduce-iio_declare_buffer_with_ts-v1-1-ee0c62a33a0f@baylibre.com>
 <aAPQS9xY4603PJmU@smile.fi.intel.com>
 <5df8aff0-2bb4-48e3-b1cf-9c09628ab467@baylibre.com>
 <aAc47RW0yw97K5sZ@surfacebook.localdomain>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <aAc47RW0yw97K5sZ@surfacebook.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/22/25 1:36 AM, Andy Shevchenko wrote:
> Mon, Apr 21, 2025 at 05:40:41PM -0500, David Lechner kirjoitti:
>> On 4/19/25 11:33 AM, Andy Shevchenko wrote:
>>> On Fri, Apr 18, 2025 at 05:58:32PM -0500, David Lechner wrote:
> 
> ...
> 
>>>> +/**
>>>> + * IIO_DECLARE_BUFFER_WITH_TS() - Declare a buffer with timestamp
>>>> + * @type: element type of the buffer
>>>> + * @name: identifier name of the buffer
>>>> + * @count: number of elements in the buffer
>>>> + *
>>>> + * Declares a buffer that is safe to use with iio_push_to_buffer_with_ts(). In
>>>> + * addition to allocating enough space for @count elements of @type, it also
>>>> + * allocates space for a s64 timestamp at the end of the buffer and ensures
>>>> + * proper alignment of the timestamp.
>>>> + */
>>>> +#define IIO_DECLARE_BUFFER_WITH_TS(type, name, count) \
>>>> +	type name[ALIGN((count), sizeof(s64) / sizeof(type)) \
>>>> +		  + sizeof(s64)/ sizeof(type)] __aligned(sizeof(s64))
>>>
>>> Missing space
>>
>> Sorry, but my eyes can't find any missing space. Can you be more specific?
> 
> As far as I can see it's missed after sizeof(s64)
> Also I don't like to see the leading operators (like +, -, *, &).

:facepalm: yes, I see it now.

> 
>>> and I would rather to see [...] on the same line independently on> the size as it will give better impression on what's going on here.
>>
>> As long as Jonathan doesn't mind the long line. :-)
> 

