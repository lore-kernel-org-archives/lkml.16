Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C8425395D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 02:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745892774; cv=none; b=N1YkB3X8hVybeWxjcDeHDGT7qpkKn0n1UQXKz190uru5BQjKcY5CHRtLA10sjG+odlRXcw+vQGD7VRwXIchkvSMWmICjfA3BquQzvuPxSgp2twMFsP2HJBGoG+EyEsRSmi6HZxdT+ZkHt8o3GpvPuVGsd0vV+pqAMWsjSK8zhwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745892774; c=relaxed/simple;
	bh=pkqVCpFlFxkl36FV0Cieo0EG7h5YuC+3VDYKhhZAHDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h2fBDeNBdjQdE2YJHGiz1n3GE8nEP4K+L05dkdCfpHv7ZLeCRQ0zx7Zjz8jdALJSUpwqiV9GAr8b8hYWi4WaX1NfCTyfa0c/58Q0LolrjZ7wfbfPHL6k115CgQGnNNkeK9U4Z5qbQux2iU+1jDTGnbhbsmOFuY2knkrjQEOpTjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=XyfEX/mz; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="XyfEX/mz"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2c7f876b321so1659382fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 19:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745892770; x=1746497570; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6S4GKpAtROTwbGLe6u4eJsWSI5xTeTy32z267OBAd5w=;
        b=XyfEX/mzyCxZu00M7QYLkDERlKp3Yjp6zf4+HJUtjK9QnVQz3TdKMO6NoYiq/zJykP
         LbDDz1rRq21wOaUfnGbaW4Ou8fFjrvJjoO2Ai5fFU3Oe7rXcaSUDDXVnSyR+xNEEE8oD
         wl+VMsu1wYR/HkEDJhI8ytGVoDVf/i7mDiRSpEat2x+DB9rS9MUue5p4y5pfQrXlGZj4
         bzx9gUYJjZ8fdYybOL40jNoB7OBcEuC6g5NQK81gzWvExug9JjH+EeLyZN6Ie9kJGv7O
         xWeurs3yWls0g/4ocC54oJP+mKeGlLWpiuCFPBsQPNC9eVjMkRBQzmW5FMSLTqdDf9Ut
         CCYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745892770; x=1746497570;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6S4GKpAtROTwbGLe6u4eJsWSI5xTeTy32z267OBAd5w=;
        b=FrQXtr3HXXCnxT7j/m7SRm9/ZgGdLhtVzJv8CEkrreZM2FJyQ8uuZw1PcZPd9lULGo
         2+Pi6q45/YSBAvIJEN0PwaSHWqZGreYcHESY8wtFAr2PKYU201R45G+RPnzKAgSiuywy
         xc2viggyByPCHg6F1uWkAe9riW9lyVuSqklQruIU+w5UY1xIKC2RKjUtmxUHK5kQFsIS
         +0DPmqHbCcqTPY0e+4XSJae9ym88Ygjzp2HfQ8/JV1kquw5OkKESc3c2o0SwAaDIN0nS
         0HpjMiBtgcG2VhR9jurRhO6OHj7yZxs3gnZxcPlISJfvPmydwqaKxJALr8l5svWBmf02
         x5zg==
X-Forwarded-Encrypted: i=1; AJvYcCVaLvkUOsBfSnY8CwueMNoXYG9eC191FVhZ0jPOLiJFcOxbCX0NyqP/ELqwK8VrFb2yYR4072cm8DJRi6w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqCh96qtOieUz0kKE9PwOIFx7ZCJ9vrOZRdiqgNBJGr46XsjCi
	sq4wvJUElAkQXavuu8Y3ojafCR4S8vA2LHojxWWDjIPMKpv8bkvmUalRWY+OnJg=
X-Gm-Gg: ASbGncssMvpF3uB2l9Oz7Km/5z4oH6ke/vLskuOMPLmEilKCMrlD+LDwDFkxYiAKoHL
	S20EZRuCVhnI8QliJ/3vxuChD5BTF/0roVO/BxV/CKagzNGvgcCCTEQ8S5kDRYsvkVAWJmSgeFe
	YA15Sz1FoVkJQbDYHSvvB9I9Ktb6qcItKVFVQr8OobNfWGlFVrBcbKfK+xm2e8QbnkFifWDhidW
	8KpvZWdfoCEhQQqyjPkO0lUoEa3kiBWFVDMaw647GZyZEWUuo5BWwxQPWW6xrQI2l+5XGkpwamh
	cxroKIDrT1TAJFN7Zc1goZaszpSe7djEa4fpIJ0qXAxdfGaw7B2sp4Aq8qe+FjgRye9RitYcd7W
	O8m9U9799N+0s5keN3Q==
X-Google-Smtp-Source: AGHT+IE6FyjOxAKnVS0+MaJeSBNlFo7Z99elkvia9LCPi2NOJelDK6TnHtRbBBkq8ITYn9LPKBUkkg==
X-Received: by 2002:a05:6870:718e:b0:29e:43ce:a172 with SMTP id 586e51a60fabf-2d9be84dc03mr6759663fac.28.1745892770447;
        Mon, 28 Apr 2025 19:12:50 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:cff6:9ed0:6e45:1ff9? ([2600:8803:e7e4:1d00:cff6:9ed0:6e45:1ff9])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d973c196e8sm2551773fac.46.2025.04.28.19.12.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 19:12:49 -0700 (PDT)
Message-ID: <1d90fae5-9c58-4a77-b81c-2946e7cc74d4@baylibre.com>
Date: Mon, 28 Apr 2025 21:12:47 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
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
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-1-6f7f6126f1cb@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/28/25 3:23 PM, David Lechner wrote:
> Add new macros to help with the common case of declaring a buffer that
> is safe to use with iio_push_to_buffers_with_ts(). This is not trivial
> to do correctly because of the alignment requirements of the timestamp.
> This will make it easier for both authors and reviewers.
> 
> To avoid double __align() attributes in cases where we also need DMA
> alignment, add a 2nd variant IIO_DECLARE_DMA_BUFFER_WITH_TS().
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---

...

> +/**
> + * IIO_DECLARE_DMA_BUFFER_WITH_TS() - Declare a DMA-aligned buffer with timestamp
> + * @type: element type of the buffer
> + * @name: identifier name of the buffer
> + * @count: number of elements in the buffer
> + *
> + * Same as IIO_DECLARE_BUFFER_WITH_TS(), but is uses __aligned(IIO_DMA_MINALIGN)
> + * to ensure that the buffer doesn't share cachelines with anything that comes
> + * before it in a struct. This should not be used for stack-allocated buffers
> + * as stack memory cannot generally be used for DMA.
> + */
> +#define IIO_DECLARE_DMA_BUFFER_WITH_TS(type, name, count)	\
> +	__IIO_DECLARE_BUFFER_WITH_TS(type, name, count)		\
> +	/* IIO_DMA_MINALIGN may be 4 on some 32-bit arches. */	\
> +	__aligned(MAX(IIO_DMA_MINALIGN, sizeof(s64)))

I just realized my logic behind this is faulty. It assumes sizeof(s64) ==
__alignof__(s64), but that isn't always true and that is what caused the builds
to hit the static_assert() on v3.

We should be able to leave this as __aligned(IIO_DMA_MINALIGN)

And have this (with better error message):

static assert(IIO_DMA_MINALIGN % __alignof__(s64) == 0);
