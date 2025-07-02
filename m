Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C2030B9B0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751468842; cv=none; b=EvSwMdUMAhz2AlmnLGsUc0LOm5jhCUU4HbTrTXvQMqdIW452fdQYts6FC1vPJO06tAtw+R3FPrWFPT7KIyUuUGYOSFTSXvZMscdSznyes8HO3FL0Zh5iZ33yXTrhyqjZNEhGtEJQZJw7wWWgtaBDWF2CBAHTK2p5dNngAT1/PNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751468842; c=relaxed/simple;
	bh=cn2NRI5mu8mp2JvptDQmdNR3iEYDCKiW6RwP36IdYcE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RRgdVd/AXAeTQUQT07LcDnHhdlECfoEQ2BmUCj6N4XHiKLWQTXHqUWmLN9F5ukylfwOICLQ+1srdRsaojo5stbtN1/NkIg3NNESWyzN+i0Is5e6AxOZn88HCXimQFkVazJLCwiRIJlSsKpfoUuyIH4B+MrRDidrMQ05NjaEoVHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=rpglmKEv; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="rpglmKEv"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-61208b86da2so158360eaf.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 08:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751468840; x=1752073640; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z+yF8Byfsy0CuO73SgfsROHb/6ylMyJG4365Xzkg/tU=;
        b=rpglmKEvds1+pdW7sRoDilSXNV5TzQif0EQwoG8XN2LeqUU2czx1bgjNhLhrW4lDYo
         eP+ZKGkcTeq06R/knz5JOXuOfAH6J4HzfFpwDV1OygWgLfshsYK5zD+HoaZahX+vF1qC
         BkgyYnKmlyUNlwOle0bSVvcKOW5CobavEyL0Pb4ElGjUCGVdWp+e8HO8ZMZCjiSFnT17
         OBrF1tOZyLob92vmiYSDTZP9ZYqwmuwuEzbZ7kuylC9LSXXSuxNJXnHoKGzo4JQXFAsi
         O1ZOI2CU91ZqVDCs0Iecuic4KsUe6Duv4c7xidaTRd08/dsNKTg31q3DRM9uv21BAswI
         ZqtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751468840; x=1752073640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+yF8Byfsy0CuO73SgfsROHb/6ylMyJG4365Xzkg/tU=;
        b=n6BKWwYRWqMQtjA3C7thDNqfYQ/ZsCBouGf9lHwTgj1qmeoYfH2JE00c9g2yjOvVuQ
         dBO9rNIvzRoG78rjwKGhTZrkzhxVdOpKdnpReN/9vE0NH5HnIqIqXtTqCvIeqCbUGVTg
         /SxtO1OrDLnXa+WiVIQE3g926xkozW8drGJmhq/K+ol3KUdGi7o63MhNmxAsr64cOhaS
         F43RhtUwLor4UEovmrkJlQn/QaOFK9/BphLB3Y3wDcR7iXs+WZcWCQZHf4Bkr5rI6T0P
         pqRNulKMmuZUHkDJPQMdCQavUDqyz8JiTD/8bFwBMDXPw7lWOztCSBGrjwkBp30Ks6PR
         NcJw==
X-Forwarded-Encrypted: i=1; AJvYcCUVzjp4qhMde5vQ+GbOlqsaYtTKSeKs8vtusp3+pQVtQag0Zq9FFkKOzvSlwmu2WpLomg2EpZl+y3vJle0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcPjtKnQ+QmJuNGxQWamk/8Tw787+Unmt4bHnmlGuOQobLKPG7
	D4IHY6QqvRzWHPHrtKcwTM/hxmI/R7LTP0X59qm5YYMhRC75s7FnzhXJ19S61w9N0Jo=
X-Gm-Gg: ASbGncvXlHOHeasi88LxkttysT+3Alsln4cLDr5D+gf+V59eq7Y8FML/zNLHn74NjVW
	/Evrp8D6IHsfFd2BdysIv6Yy5ELYMDvVK+JgjgoEAm8tuoss3XyFnrDumS9yfuxUubpTK9n1/UN
	ti1zGlrCv4QZFM6HHv4/qJVTscxNyC3zc/HkcThJi/SPDvlY2JggTYvTD+WZwXGqJxKYVZ2bQ5I
	48syUj+aLK8YyGrVwVK2opfL/CMJMLAGK9J4+yj6CWIS+WjdkT82ua9+oTzedn7DTbTCnVc2Xb8
	vbOJu/yXNuR+lQlzrccW1iXt381gIvPu8cS2Jmh+/a+UAXziV4v2PgevMH/TJFO5O6cUKZ+qU2A
	NxhQv0oqb4rt9mpC3kq5RQKS635sQpV/qlmrHNN8=
X-Google-Smtp-Source: AGHT+IE1PW5FUH+qwlJtTOdD0wGyWz6EDOBzlYeJCn84Z90rIwVxi1VgT+rOkeUbBg33/zG427zvaQ==
X-Received: by 2002:a05:6820:1994:b0:611:9a4d:fc44 with SMTP id 006d021491bc7-61201244fcfmr2268633eaf.3.1751468839839;
        Wed, 02 Jul 2025 08:07:19 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:5c00:24f0:997b:5458? ([2600:8803:e7e4:1d00:5c00:24f0:997b:5458])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-611b8474da2sm1700798eaf.6.2025.07.02.08.07.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 08:07:18 -0700 (PDT)
Message-ID: <3778ad13-3b62-4f68-946d-b861b0df4272@baylibre.com>
Date: Wed, 2 Jul 2025 10:07:17 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: imu: adis16550: rework clock range test
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Robert Budai <robert.budai@analog.com>,
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250702-iio-imu-adis16550-rework-clock-range-test-v1-1-b45f3a3b0dc1@baylibre.com>
 <aGVIBVsFPcVw3lN6@smile.fi.intel.com> <aGVJPRmn1-HUBb40@smile.fi.intel.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <aGVJPRmn1-HUBb40@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/2/25 9:59 AM, Andy Shevchenko wrote:
> On Wed, Jul 02, 2025 at 05:53:57PM +0300, Andy Shevchenko wrote:
>> On Wed, Jul 02, 2025 at 09:27:45AM -0500, David Lechner wrote:
>>> Rework the clock rate range test to test if sync_mode_data != NULL
>>> instead of testing if the for loop index variable. This makes it easier
>>> for static analyzers to see that we aren't using an uninitialized
>>> sync_mode_data [1].
>>
>> But at the same time it makes it not to be the usual pattern.,,
> 
> Reading the static analyser output I think the first hunk is only what we need,
> but this is still false positive and it's problem of that static
> analyser. Have you filed a bug there? (My point is that modifying the code for
> the advantage of false positives of some static analyser is wrong road to go
> in my opinion.)
> 

I agree that we shouldn't fix this _only_ to make the static analyzer
happy. But I had to think quite a bit harder to see that the existing
code was correct compared to what I have proposed here.

But if this is a common pattern that I just haven't learned to identify
at a glance yet and everybody else can easily see that the existing code
is correct, then perhaps it isn't worth the change.

