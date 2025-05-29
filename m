Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C061230D1E
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 18:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748544560; cv=none; b=kid3IPlw8albVm1FHZx9yfUUpq6ZXSZlAOYJAZfT7q7rwhkz6RQy8pWkVa3Qo4mg3t/pzUqy47iZvlK8IDDcAG+HbNLE919WQE1W1jWgbNLJEVo2LC1kcABrsL0xeyMqY/CJSnY/4VfaI6G/oi4dUB6XuT9nRf6YCs9gQ+WdaOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748544560; c=relaxed/simple;
	bh=xJyRDDYcv20uqVtmo+sDTTcu2JWML4/vfIqEHh27NfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hmYPfeQ84xoNOAOq4uTq7FDEMXPS47LrFXHSFXRa0kv4Ubvt5rCAmDPAfKQ9bmuv1KceugUwiTgeLVMpjDO+CaOc+7kztLTur2zE5LiLQHeVUQJ8TUAXrpGD2ElxyJb631hIi+WagwTPmpxHvsmnQYF2SL58SaZBbL1vhsNLqmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=iRnrMcCh; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="iRnrMcCh"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-40356cb3352so821751b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 11:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748544557; x=1749149357; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gy3S3Fn/j6b8e9AaQveHk+8wC1o4OB+toc8/xWPhOCw=;
        b=iRnrMcCht6VU+szI+LYTdhQg94qZsjin0qOZwcPXGByODJJj0e6SCZhxi0msSwMaHm
         5B8WVAJhWBTGqbijDsTmRl7NZxQ6JTJ9hcDL7MEmK9dOMISZE5P5EPYhVxKJt0qCtI4Z
         t6aKC6qODPMOXzcL2xpuqdsn2J195bTCLa29nL4aC7liMeQG+stfdyxKX/CGbEdhPJGs
         GznKPbghbVKmqbjd3MkWtyIRSk7FyiUHdineFwE5uJgg2JTAfQKNtqinU9DNZNzunjN9
         1MkbjrM/LK1ULICDRQ5Ua/XgbAXNS9Jpopxc83XjA1avsxSm8iVT8nSU7D2IVytQ0BAb
         gYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748544557; x=1749149357;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gy3S3Fn/j6b8e9AaQveHk+8wC1o4OB+toc8/xWPhOCw=;
        b=hHhNuMG4C8Ichuw5mQXY88L/3dVAH05U+8pqPT5HCnvf3CgmIHQ7NALz0suNgMymoV
         HRCJpro84EEoK+JrqvdIxcteA8nFJqlaXMBCRKwEmDFharr1OySaLNfVsZfMplhSGo7N
         V1iHCijfcAOrIe/RGQrjrb0ocoQ7HCTK84vmGaG7QIlbKAkRHS4UkNtwCdrPLX9sAsi8
         EW2d3t78XQ6btUsocimSWqCP7C7/terJALpc24uFklC1lN0N9DxicX5FmnZLYXKinSIh
         DXuAyYvHih5mB86JJ4i8qrQX9mGfiGWtXNiouVdmTLu6OriQhFG/h+ugQR1vif0L1cZm
         pSxA==
X-Forwarded-Encrypted: i=1; AJvYcCUv7we1FrX89ABAwVjBfOaniSYMdapMrGmPFchBH+b5wPYE4h+DSTSUzY/joxRJC3CHTiwlxTO7iy1K3eE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyel+W24ZAOhPb3hKJ99LdD5QQkfQH2P3B5kYmLgM3/34c3tJTK
	YNVWGQtgy3J2B12ZyLpWvysfMZ3GIoYfPxFkw/Bx7e7MP2ts61Xh96SuF5SUBxmz/8M=
X-Gm-Gg: ASbGncsmxfRoC9IeIWlawO9p4ZSTMkzU1rZ5t93O5YX77sKxqy7jOvp5Bku32Ra9Ver
	TSUt7aSdkB/UJIyVuzm3BopnRJDVDSspyDLOlEmoluCodva02SpIhgRNhXzZlTEC2e/kgAva4Ns
	mYD0EmfUw0zY+kgOhdHcqcCsCb6KBbWYP6AXxEMdQvlU18pPpy8rDqRJDu5poHoWqsLxDBpJwSE
	vjdv1/hxZpnbZ+iVfKF1vKGT/RWyUiJJOA3bziNzG+7NUlMN92aJjrGzRYJQ8Lc045hZFxaHf1Z
	VBa9PYGg/U9JV5KUYAsRq/98meE70DhiF+OFSsFD1/bYqagxxcbrsZVh2TqFpQnct7wZJ/hcf8I
	eJvnEN2mQjqG20pUI7h176IuhWw==
X-Google-Smtp-Source: AGHT+IEyyz+oXXz7Z8GDgMD/9k40e0l32wPzvtqCZnLWspB6lRn1ogv34ZVW2mVeIvxYbrHYa7OYIg==
X-Received: by 2002:a05:6808:6a87:b0:3f8:18a3:b1cc with SMTP id 5614622812f47-40679fd1c7cmr289416b6e.12.1748544557292;
        Thu, 29 May 2025 11:49:17 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:928b:5d5c:6cd9:1a4? ([2600:8803:e7e4:1d00:928b:5d5c:6cd9:1a4])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40678ce8304sm92905b6e.32.2025.05.29.11.49.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 11:49:16 -0700 (PDT)
Message-ID: <67c33f11-0196-44f4-9cdd-762618cb88be@baylibre.com>
Date: Thu, 29 May 2025 13:49:16 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: accel: fxls8962af: Fix use after free in
 fxls8962af_fifo_flush
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Sean Nyekjaer <sean@geanix.com>, Jonathan Cameron <jic23@kernel.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250524-fxlsrace-v1-1-dec506dc87ae@geanix.com>
 <ed40509d-9627-43ce-b209-ca07674988ff@baylibre.com>
 <CAHp75VeAOFXuxsiAEwJ=dMJ8NZsyA7E-h4L=2ZgpprdUXU2EUA@mail.gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <CAHp75VeAOFXuxsiAEwJ=dMJ8NZsyA7E-h4L=2ZgpprdUXU2EUA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/29/25 1:16 PM, Andy Shevchenko wrote:
> On Thu, May 29, 2025 at 7:02 PM David Lechner <dlechner@baylibre.com> wrote:
>> On 5/24/25 5:34 AM, Sean Nyekjaer wrote:
> 
> ...
> 
>> fxls8962af_suspend() calls enable_irq_wake(data->irq); before disabling the
>> interrupt by calling fxls8962af_buffer_predisable(indio_dev);
>>
>> It seems like the order should be reversed.
> 
> AFAIU the wake capability of IRQ line is orthogonal to the interrupt
> controller enabling (unmasking) / disabling (masking) the line itself.
> Or did you mean something else?
> 

I don't know enough about how suspend/wake stuff works to say for sure.

I just saw the comment:

	/*
	 * Disable buffer, as the buffer is so small the device will wake
	 * almost immediately.
	 */

so I assumed someone had observed something like this happening already.
If an interrupt occurs between enable_irq_wake() and actually
going into a low power mode, what effect does it have? I ask because I
don't know.

