Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7352727A47A
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 15:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747668505; cv=none; b=WilvVhFSh+ELC5dvMgaKd+XLF6z5GJbSP5V9aPlAaj3xzCloDTyH/C2VTydXIgSmgJDEqEZWYQ/+KLR0UYEmXGDV8qF9ZX3wuRDFKzUVIKBh9NUIYLcMD4UBf/0naKD0ZjHkD1KknNH8CbKCL8ZCbvWQWPsqOjCx0Eu5jdD6E4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747668505; c=relaxed/simple;
	bh=KHxgPGkHJc47h2T7vaf1QrsDbAkmsHgS+s5O8Uan+Pc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SjmCa6Jc2Gq96hx6NkodD/gy9T1tHMCR/y9gOG+5mTiy2XpzW2VrcOfx4IahiB+9Ak8BaAytjSm9NP7k3SA3uktji27mLyPX+VHnKsF8pmJtrBsdou9XxZKI3coOKNdw6pC97L+VLBK+SBr1r10z/+ePv+epOFAaAXhSwIEGAFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=g2ZCtaCj; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="g2ZCtaCj"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-404e580bf09so387645b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747668502; x=1748273302; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gunr5yrkLk/n2a5iSHnU+A4FlqS7JkXXxLbIjVojZgc=;
        b=g2ZCtaCjO82Af217o/dnZNkg8yDVj5g5HY/zI+6tqqzWKJDmuJ82bhYv5cFDQ0vvOn
         1OvMW/r68fFmwYhpUugfXNoDVqBIXEWKR64HoWSKb7XkNPyLW2Vy3MafTNodej5t6/S6
         yzKSFKM6ZoobR86Tqv9wMdSSUZQCauA2wp2iuaGynlAdsMTgyDGAtb7D90AcKvl5qxeS
         aFnlfRxMinlC349E4TsN4XcnrcDCyfJ5s6qIMCWeV8DZ6QBQJhnPHQMmaUGygpSAFgyi
         QXU3GXNPtNAk7u9g4jDzl+VyW9ktcziV+MJKK1cL5ruhOpjYDZ+RtFHwkMZBcnG1oVvS
         ZSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747668502; x=1748273302;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gunr5yrkLk/n2a5iSHnU+A4FlqS7JkXXxLbIjVojZgc=;
        b=GZV+eexn/Pe+MOA1rsYI2Cknzkj6mTCoRtjMTQGrsR7zSYnS+uULO+ripEL6+wGlex
         gniR2WPAQrADV0eybs9ONebYT01VGczymGV9lBYx8Z6GlLFiNbb/UzUzkjQE+ej2U57P
         GymD9qIZxB3pGhxFU6iha+FIZu2/2ELc0Cto0ms3AAfsUycH6YXeyqCTRSFkByhtl9FU
         GCdUGmW7W1nHTYUsjWdZtiHJdFwe6+arP6Xq0oBNjBPI7xCVsTCUAfHiBwqDCdna7exn
         6hZdhY/kjVBZLTwReIGBYNpP/XxVVWzXq1wgaKgqWJvQ+3XD9oE8YRAS6KwylKqoupsr
         /l6g==
X-Forwarded-Encrypted: i=1; AJvYcCVaGh3IP/k/+tRIADzpfzPwVzsB6oabkuR4OZAPXOhrR4r21D8Rxz4s6tGKfKa6NosAeb2K3n0CpvDfKJg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6ApCKfw8hI21yYNiFQ0PUF8vmdwz4AOE4y9ZWBDB8Avb4INJf
	e/rNLwQiJn121k+fUHB/c+uSsACZjsG9ovKaAZgRdujXQfuy01u/E5lsj6YQcKyFfYw=
X-Gm-Gg: ASbGncuUNCSrHMW8syN/VszcmLWYFxb4ZRYR11EwYOUEpApv7OAoClUctdLPadqVsB7
	kYfCsWXl0Vb4aleVMXMSkAIfmWXitIlledkVnbha2bPVqeCHN1SrM+udTS2xNCytPRN4TbPz5jQ
	hqGidGcqT+i9fi+p7sjWvNniXbMg3okCukCagdLfzIBYigLOgzHndMVHL1aKdXa676Pex+s79iF
	MXeyC1FxMCyOMLLmFFLorZLg9IsHNWUIWyiQdsnvUqlkTGYukwUf5nIA5y0G3G814i0/ecNEDzf
	H7pPmkoFtDyJ4lhmGXoqO7H81U8PvEOdJb+wY/3bMWlNwmDpcCogAJ30uh6nAb0APKBGfTwgzMx
	74wbDswE4B4MUpflisFrVxQMaLg==
X-Google-Smtp-Source: AGHT+IENnuG/YXszL2204Pk9pF5KDxPDHR3fkgrZVRSzJWcNVc/KUH1Sh44zKC9K6d9mhWQi2kpzSg==
X-Received: by 2002:a05:6808:164a:b0:3f7:8f77:2a97 with SMTP id 5614622812f47-404da82c7a9mr7623243b6e.34.1747668502340;
        Mon, 19 May 2025 08:28:22 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:a628:91ca:eb5:d6f5? ([2600:8803:e7e4:1d00:a628:91ca:eb5:d6f5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-404dc2d4954sm1265375b6e.48.2025.05.19.08.28.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 08:28:21 -0700 (PDT)
Message-ID: <f06d231d-297f-4c83-b457-b9eb242b9c93@baylibre.com>
Date: Mon, 19 May 2025 10:28:21 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/9] iio: Introduce new timestamp grabbing APIs
To: Gyeyoung Baek <gye976@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250519-timestamp-v1-0-fcb4f6c2721c@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250519-timestamp-v1-0-fcb4f6c2721c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/19/25 9:25 AM, Gyeyoung Baek wrote:
> Support automatic timestamp grabbing by passing `true` to the `timestamp_enabled` parameter of `iio_triggered_buffer_setup_new()`.
> So consumer drivers don't need to set `iio_pollfunc_store_time()` as either the tophalf or bottomhalf manually.
> 
> For this, triggers must indicate whether they will call `poll()`, `poll_nested()`, or both before
> calling `iio_trigger_register()`. This is necessary because the consumer's handler does not know
> in advance which trigger will be attached.
> 
> Once `iio_trigger_attach_poll_func()` is called, a timestamp is grabbed in either the
> tophalf or bottomhalf based on the trigger's type (POLL or POLL_NESTED). If the trigger
> supports both (e.g., at91-sama5d2-adc.c), it is treated as POLL_NESTED since the consumer's
> tophalf is not invoked in poll_nested(), but the bottomhalf always is.
> 
> If the attached trigger supports timestamp grabbing itself, the consumer does not need to handle it.
> Instead, the consumer's `poll_func` pointer is passed to the trigger, which can then store the
> timestamp directly into consumer. Trigger drivers can pass timestamp values to consumers in a consistent
> interface using the new API `iio_trigger_store_time()`.

This is explaining what it does and how it works, but we really want to
know first _why_ we need this and why it is better that what we already
have or what sort of problem this is fixing that the current situation
can't handle.

