Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B28A242D80
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 19:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745955068; cv=none; b=GoEZ0NwAqrFKkTUfxPuEDwBRFEuV5Xkr3GvQhDpbPjeiCndhZVy6dPibgQjqu6t4fTv21lQIMSKZKkx52ET/tglXDH2f3Zljpp2KGSIZBG40mdYjvCEUU5fDAzHjFD1cMkpAGiDCjZuSwuox275AfQKOUOV4P3MF/rQ6HsFpBgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745955068; c=relaxed/simple;
	bh=F5u0T2bd9f9E1hJDBLndIIX0IL37h+00zGgcWxHjWgU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Jby8iLuTIKrczAs11E7NUtaNXeEPJvCXDv0RlKGNv9nLwV6hMmKX32q4uVyssZRMvMFCrpkZ/jC1wRUftjbtmDzTzYHo2DYNNcCd9kM8jrQjGGGPnQWMhDOcV97hsg/xLYBwbXrvhep8CXRddyB/dJl0yh2mMw89iEt1tGVuohg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=QC3IWbjc; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="QC3IWbjc"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-72c27166ab3so4867476a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745955063; x=1746559863; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IEA9coPSR+RXT/e6kG1IdF6r8oRJJfl6KimXKU4XDp0=;
        b=QC3IWbjc5ICniceVNhODfd+Z01/cXFbxwXw5jf44xK0a5SQgZawFIb+aI4Xpirif4s
         zew7UhV1UWg6A/ocFc93bp/JwnHp0Sjodbv/ilzJ9UCdH7O3ASxxQBoryImmed9IjGjZ
         ggn5HFjSilGYpa85+/5v1eXwgfwHQb+nLID6PeBOaVz+5oDlRawI2bmACEx67NTsMdCR
         937JSleIBXlQBLxv2wzAacin4OPW8luxbolNcxR4A/ohpmNDhNd17LexQxi0F858MkgD
         pzdvj8vHEUlA2udN93B8Rk23h49IZhSwNDXWTeCCT5P23po3XTpAstIHD7et/O8QOfcp
         HBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745955063; x=1746559863;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IEA9coPSR+RXT/e6kG1IdF6r8oRJJfl6KimXKU4XDp0=;
        b=rd/UAgI03+eXEHnjpB0UJTa2FQeGzWPf0ak0fE4i6jIV0b+lQrpIY3I66ihZRXps4o
         RlCPwwn0gcX95NA6h7JRbV7tRZcCcx/LCJoHeoG1O+1nTezLrobzBSq8KuIGZ8kvWGvR
         Bng659wexG6lBkrVCx6AkIF3PqMRr1vjXgS085uq6tT5X/hzhOhvt1iC/MqN5sL+yS6C
         /HDqMi3q7zmPTKa8LG7EPTdgLzibKTscgtY+fs5dbt6qWs74o+CckpzBDmXm0uxaHZFK
         6Cvst7y8Toa746RgKpXnicHA+k9T5k14bQYBAAu60dzcR5FOVX5PLr0177Vhcvl3MVdw
         V72w==
X-Forwarded-Encrypted: i=1; AJvYcCUShO2kHxlf89kgSpMiLwGhoEKEO8sSGDOMelBabM/7jKG494MKQhYJ1u15ejrZ276JcYRz5mxqmOAY/yM=@vger.kernel.org
X-Gm-Message-State: AOJu0YybQ1oengMvSkmtwYVWRVHpciKEpESTBULPvwPncrQ/amW7h2Jw
	8wSUOU3JeIUN5AJwmT5UpTy6Z4XDU2VQwn/tsmL9C6DFgEi5Oih76dSwZVdCN0K4c5Km9YOVs7C
	O
X-Gm-Gg: ASbGncuXy2huPczb2CP+z0dJAxZqlUJTXM0aqCnp/SOjUgr58WAOLqp190CGQMnNHab
	9BIstv0rUGkIS0TedpTphczJJv+wgkawwzTh1lOAp8l1/VTaOj1eNVPw37QWn4JRsfXXUX1j1rc
	VKUar9l4XmzeOnbDUUjDOCCqZZ9KN5c/uJMUIpeK0DyGcjQ5tZ9eT+Y+l/w/x3kn0I7c0GERlKe
	XXfURktXUp8m0QA3R4REK9fV55GvZMe+YT8mVRAM/QZCcvOI6qK0YxSB1pGqdPa/d7Cc/GB7BhZ
	Np6XMaq+OHccB1+ztb90njsqVu/Uw9nME+0et/6i/0GT/On3rspb56h6VlfZIvWjDj/0sBKarbb
	uUp+6tySIknyFBN3WFw==
X-Google-Smtp-Source: AGHT+IEaVlZVZe+jb2HlViK5TnZL0Nc4jro3bTaGV2+pNP/R765+0tJ8r0OzgrEjBUiZuFEMIPtr+g==
X-Received: by 2002:a05:6830:4420:b0:727:42aa:e888 with SMTP id 46e09a7af769-731c0ab2949mr234320a34.27.1745955063337;
        Tue, 29 Apr 2025 12:31:03 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:dc17:157d:e8b2:3ad6? ([2600:8803:e7e4:1d00:dc17:157d:e8b2:3ad6])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7308b0f35b0sm444024a34.11.2025.04.29.12.31.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 12:31:02 -0700 (PDT)
Message-ID: <5c762653-b636-45bd-8800-e804ad8dfda5@baylibre.com>
Date: Tue, 29 Apr 2025 14:31:02 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
From: David Lechner <dlechner@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Eugen Hristev <eugen.hristev@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-0-6f7f6126f1cb@baylibre.com>
 <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-1-6f7f6126f1cb@baylibre.com>
 <1d90fae5-9c58-4a77-b81c-2946e7cc74d4@baylibre.com>
Content-Language: en-US
In-Reply-To: <1d90fae5-9c58-4a77-b81c-2946e7cc74d4@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/28/25 9:12 PM, David Lechner wrote:
> On 4/28/25 3:23 PM, David Lechner wrote:
>> Add new macros to help with the common case of declaring a buffer that
>> is safe to use with iio_push_to_buffers_with_ts(). This is not trivial
>> to do correctly because of the alignment requirements of the timestamp.
>> This will make it easier for both authors and reviewers.
>>
>> To avoid double __align() attributes in cases where we also need DMA
>> alignment, add a 2nd variant IIO_DECLARE_DMA_BUFFER_WITH_TS().
>>
>> Signed-off-by: David Lechner <dlechner@baylibre.com>
>> ---
> 
> ...
> 
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
>> +#define IIO_DECLARE_DMA_BUFFER_WITH_TS(type, name, count)	\
>> +	__IIO_DECLARE_BUFFER_WITH_TS(type, name, count)		\
>> +	/* IIO_DMA_MINALIGN may be 4 on some 32-bit arches. */	\
>> +	__aligned(MAX(IIO_DMA_MINALIGN, sizeof(s64)))
> 
> I just realized my logic behind this is faulty. It assumes sizeof(s64) ==
> __alignof__(s64), but that isn't always true and that is what caused the builds
> to hit the static_assert() on v3.
> 
> We should be able to leave this as __aligned(IIO_DMA_MINALIGN)
> 
> And have this (with better error message):
> 
> static assert(IIO_DMA_MINALIGN % __alignof__(s64) == 0);

I was working late yesterday and should have saved that reply until morning
to think about it more!

We do want to align to to sizeof(s64) instead of __alignof__(s64) to avoid
issues with, e.g. 32-bit kernel and 64-bit userspace (same reason that
aligned_s64 exists and always uses 8-byte alignment).

So I think this patch is correct as-is after all.
