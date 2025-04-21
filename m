Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C9F22A4E1
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 22:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745275246; cv=none; b=EkJx0J3rq8w/D6wpAflV8QzjSBAwVNlHEmCKOv7Wjzw/JdpBZHTJmbGV2HWmNGAedGlyb3jlF6BjOmAQYp5NsdcmUNYEx8Cxkuywtew0df8iKtYeW2/QD/+B9Nr20IAJKVXi5UKgU1aphvWNFxNaLwKLJTWzpAAiw5UiU1jy2W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745275246; c=relaxed/simple;
	bh=PLiO3MKV4lzQzYAiBtG1vrvS9rWQyJ8D/HS9gjDnR+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p5x2rX+PWHhVA7DQwu/+ueWvCdaqWaLUInmvciMOAn7WNn7cUEmVPzmJXVBuEE1eRP5h9UCQsNZvtxlau0Bwghh3NA0LRZ4+ZYbP5/RjGaaB6somKnciD7kmXDra+E8CjX+u09dSjznNQYockvSnuOjKxD1m3iaEFeg/PsdLlCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=tL3kY0/M; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="tL3kY0/M"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-604f0d27c24so2066766eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 15:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745275243; x=1745880043; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0fmYGYYsZqn1kIj1/3EBJlD/oRzETbREprNZiIc+9EM=;
        b=tL3kY0/MgTf6wA8v58XHNWTDJLw1u8kPuqW/VuDN4GJty6Yokie0I6palFX+W156qJ
         vip2YSe8tBjIGLuowsWAKBDPEgNapw9iUEMFiWT1VPUv7h/uCPLvPzAPcLyC/o0m1RQB
         hsjpxw4Se43Ms9ZTB7+OXEE8H5JkKBMTF+SZDPYvQ89HFbWIAIjqNx6cbVpQoOyCq2ZT
         SU3O8KZvmfOCyK/NgsN4OT6/FxMLMvuVIe5z5z9X+oBeJ/krW4zv7C+H9WJWU4/2XWTi
         QBb1nMZP1dNXHpk3ti0EMZjMTDGYTRQnPdTYU4o8MmR45jj5VHQyQpC7ZCBytA6ZiJHB
         HtBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745275243; x=1745880043;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0fmYGYYsZqn1kIj1/3EBJlD/oRzETbREprNZiIc+9EM=;
        b=XAS26CvOU1iAQAqfuy/sLnGNg81MFgUIOvEpRonEXdw1GlWMZkpRkRZO9G9BlQBM1p
         0iIGIuOdycTzpCOIEt6FbacmRtGrj7aAv1e4CSvUWUGAVr3EAjP9jPZvqcX8gkhciMow
         2Pt10TZl3Q29AATPn+nOc+Zc+1hk31xFPoHOC6J46jXo3M2HOjzwRAysS2sYNobvoEJO
         Po3db+GpC9X6chz273eE9XKdvvKmwdnk7/nM7mngmXSrG8cgIT3CJ6rhurCBBToCGNUs
         Z1T2hhjDY5BADShOEvCfbRDGBqNkJYApXP0f/WhN2Pr+lQep4MJzjS2JHhjXlkRM4NHN
         JBGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkD+QUGh/I7r68LshjoE788zaUZGTgTo+JBPUjbt9G3JN92HUhrzlPp1JBiXMjMPMmNIrR/2UOD5Ttzjg=@vger.kernel.org
X-Gm-Message-State: AOJu0YweQpsa9spkN9Ab/Y5j/bwGEcFlpd1uWy88972EvJ3Oi/kBh0nv
	PG2i9RtfIC/kd5hxUsVxyo7W7tctPiPYBvP7osPtWm23djKF/qNwqwjEusduHhCRI9uZWeKY/hs
	4Fdc=
X-Gm-Gg: ASbGncsK/ulzuqy/8BnUNZNB4TvrzF8u/9i0C/ZKZR8wE3LPhpC37ftpHlHeHxHPvTo
	enSZ8v962vbfUPTT113I2RqIcXP3TD0vY+NBhLg+eiwXm0EMJ0GnrrD+jTpClQ/y+3R8uzDAC19
	bUvtqc7plRUZOrYy6lxAk/BraGdvIxeilgoU6XHS/Tc/u55D3EiMpXJCs3OX+ui/SF1AvFvi8qR
	V1OChmAjwyB/3ynJsxxSjN6woF9xOM0k0gzn5C1STJm4qh68xL7gML+hfyYH/IwvpFW6OZujf8E
	HwAYPVYhrsmLVAHzf+aBF3GdZ/220KvwXm7rpJ2FxHyBg+Nicd+HW9aZCwISZmmoZn69vshC7Ic
	mrlXsBIuQtGbLlxdm2A==
X-Google-Smtp-Source: AGHT+IGizo+tqJwJhClL90usLp1rZV29bmxxNkH+s7w4dj/hTiz0yagi/PZp66qSoS8r5EdlDf+zZA==
X-Received: by 2002:a05:6820:1513:b0:606:26bd:409f with SMTP id 006d021491bc7-60626bd4161mr1467712eaf.6.1745275242780;
        Mon, 21 Apr 2025 15:40:42 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:61f2:6de4:740e:804d? ([2600:8803:e7e4:1d00:61f2:6de4:740e:804d])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-60600c7bf84sm1662222eaf.31.2025.04.21.15.40.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 15:40:42 -0700 (PDT)
Message-ID: <5df8aff0-2bb4-48e3-b1cf-9c09628ab467@baylibre.com>
Date: Mon, 21 Apr 2025 17:40:41 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] iio: introduce IIO_DECLARE_BUFFER_WITH_TS
To: Andy Shevchenko <andy@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250418-iio-introduce-iio_declare_buffer_with_ts-v1-0-ee0c62a33a0f@baylibre.com>
 <20250418-iio-introduce-iio_declare_buffer_with_ts-v1-1-ee0c62a33a0f@baylibre.com>
 <aAPQS9xY4603PJmU@smile.fi.intel.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <aAPQS9xY4603PJmU@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/19/25 11:33 AM, Andy Shevchenko wrote:
> On Fri, Apr 18, 2025 at 05:58:32PM -0500, David Lechner wrote:
>> Add a new macro to help with the common case of declaring a buffer that
>> is safe to use with iio_push_to_buffers_with_ts(). This is not trivial
>> to do correctly because of the alignment requirements of the timestamp.
>> This will make it easier for both authors and reviewers.
> 
> ...
> 
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
>> +	type name[ALIGN((count), sizeof(s64) / sizeof(type)) \
>> +		  + sizeof(s64)/ sizeof(type)] __aligned(sizeof(s64))
> 
> Missing space

Sorry, but my eyes can't find any missing space. Can you be more specific?

> and I would rather to see [...] on the same line independently on> the size as it will give better impression on what's going on here.
> 

As long as Jonathan doesn't mind the long line. :-)


