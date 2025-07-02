Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CC02D0C9C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751468667; cv=none; b=U9EOmsnrRow0wR22d5lBxMhvSoOrvk6RCKGktqQpyTHJgl2r7sZ0MjYJxEURA9suT7G0NaVbXK9DZOdfUOYiXK4XS+0yo9Z0f785vFVJ0eZ0FhUQyV2nFFHQQTBNRIjJjW2iCkk1BEC4RJB0EHbTQeD/zq8PJ0gJwDTm+hnb19M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751468667; c=relaxed/simple;
	bh=+1Y6ZNOjjbezKMVrD98UVg4jqhd2A4KkLJqkx9x2Baw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sx77RYDxfxbOAM/+oe4R0OI9Pf3TwWriu6UtEaTX4B/5KfZPGzrWJq2BtrTY7gFzeJN+v2ifUZUJ5TbJJB8mhJmEV3A9oj0RkJoxT1fP27eA3fXyRiZEMT/obAZfY9+RBsVtQYb/rFoW+eZ8SFKEtpMP7tBx5qN8NAStRse+z3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ttuknxK9; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ttuknxK9"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-60d666804ebso4040520eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 08:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751468665; x=1752073465; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EpSkZNRj+KNJmdYaS5yXC0vQwBvPJpgN8lcF/7GiAl8=;
        b=ttuknxK98Vt3loy6Us3Hs02Rl0a4FcCwv8We5fMr0+10SedIQrpSr1JkDw3BUvLhCQ
         vCrTsZ0APQJAIGU8vE14VL/2rx923USjgEFaiTzWx+icUnWuNr/4I8/Kd/p+F7evkmEj
         K0dfjGMAQ35tYZV22CK9urHHG87q0Zvxj7VJZScJ461DF+B1QMdjhzoJEW4lyNbkkARd
         p9QL2sctCB/QX2bw6f+uV5WuOdesQJVXxHOaE0eGU5R1uybr5kgugB5NDKYr2dEcHQTW
         hWm5rxIHjX+r60CkFduv6q36EcNObTf2Gwc1b83/NVlCo7RPQArLvta8wLFh4VkrEuZ6
         KQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751468665; x=1752073465;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EpSkZNRj+KNJmdYaS5yXC0vQwBvPJpgN8lcF/7GiAl8=;
        b=nV/zNIfpDWnnIdlZ4shLYvHHsN+V78h9wwhWvaT8/ADIq9pVK9V8EIQg8VCwHN4Yfx
         LNn6TZj21MgTAZZGsscWv5ASIjLZa3LjIdaNOjEdhCU3NxyvOloEMptvgUWLgFfkTNmk
         SReP9Z2EMyXnHra5ADCJALWK5F5zPCDssz9x0pjSxx+x3cFWBENdta35c6sHSZih9tnh
         qvsXTMMrC0pFHp11whH0oSQ6/uz333+vlghUOqw+oRJqAWBzYLjQt3m+OqQcP1vb132s
         X1Ax5o/TqFXyuhyMelSkGQnWyfCSbwPJOJq53I+ibndx0kWAJUhwgnAwtxNVbVucwfjY
         ywiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrCNSpVz2UPqAE/KAJGR2iati7jB1cC+Gz58nszOSJ+HFY3B6w+CzzuHKgpSUIqbs30aKbTElu37mgtO8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDvXzZwrZsqrM60aIfS8KTgzvqwIHHfB8mgY9MXNf3MWLo8nhF
	MYl6FYPNlEfHuwu/8MhRw9wfl406/n+16+7hwcSuDz/ZUqgoSeeom+QkR0zo9FB8HmM=
X-Gm-Gg: ASbGnctmz0/5eQyoU6AM9foiBzvzAmNsn/FFYFxP6mzSFRo+arPbi/SxtCz4E02YD3D
	zfYjDO69NOJ56nCgfeACupHA6WM2Qo+sVk/gtIMweEFq/2AsX5r7WpUYqnhOPrng1Z38KEZDo3D
	laJzCFRqOYsX9e7eVSBtD04Lp6Dz5o6QDhJTQz/pkfQ/Ar/tl320sfB1bv3asf9gw92Y7U2MHme
	rm8YGlpxl41Qxy7ynBuTgBkKS2jNOqjdeKTyzWfPO60S8Gqm60VHzAaBCajdiUjpWBcERnubJhR
	TFigLMnAkKVSoQSdzj66RF07c/iq+xOP/g/dnE9XpsvLsnsnsicC32jTCQ9PrNNPh2K4aq8Qeop
	G2AvfnZfGkBk/ygzTGVk5jUPjX+YRA9U+Is2YBHpr6DjprQuGEg==
X-Google-Smtp-Source: AGHT+IFce9C5ghIoSx3a2rGe/4a+oNnev+bEZ9sPLErCFoyKvHyn2elLjaO6JeBMAX7wGFfiUCYBRw==
X-Received: by 2002:a05:6871:796:b0:2d4:dc79:b92 with SMTP id 586e51a60fabf-2f6472a600cmr2079285fac.6.1751468664770;
        Wed, 02 Jul 2025 08:04:24 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:5c00:24f0:997b:5458? ([2600:8803:e7e4:1d00:5c00:24f0:997b:5458])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73afb124960sm2543365a34.66.2025.07.02.08.04.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 08:04:24 -0700 (PDT)
Message-ID: <e474db53-1b52-48b0-9253-2f62a3861bb4@baylibre.com>
Date: Wed, 2 Jul 2025 10:04:23 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: st_lsm6dsx: Replace scnprintf with sysfs_emit
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Akshay Bansod <akbansd@gmail.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250702135855.59955-1-akbansd@gmail.com>
 <f96b68a5-d750-45f0-8cdd-9761b5daca1d@baylibre.com>
 <aGVIcBLgXZj_YR7B@smile.fi.intel.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <aGVIcBLgXZj_YR7B@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/2/25 9:55 AM, Andy Shevchenko wrote:
> On Wed, Jul 02, 2025 at 09:16:51AM -0500, David Lechner wrote:
>> On 7/2/25 8:58 AM, Akshay Bansod wrote:
>>> Update the sysfs interface for sampling frequency and scale attributes.
>>> Replace `scnprintf()` with `sysfs_emit_at()` which is PAGE_SIZE-aware
>>> and recommended for use in sysfs.
> 
> ...
> 
>>> +		len += sysfs_emit_at(buf, len, "%d.%03d ",
>>>  				 odr_table->odr_avl[i].milli_hz / 1000,
>>>  				 odr_table->odr_avl[i].milli_hz % 1000);
>>
>> Let's keep checkpatch happy and change the indent of the wrapped lines to
>> line up with ( since the ( moved.
> 
> While I see the point, wouldn't be better to have 1000 replaced with MILLI
> at the same time?
> 

For anything with 3 zeros, I don't consider MILLI better (or worse).
Science shows that the average human can easily see 3 or 4 things
without having to count them [1]. So it is only when we start getting
more 0s than that is when I think we should be picky about using macros
instead.

And in this particular case, we are converting milli to micro so `1000`
should be replaced by `(MICRO / MILLI)` if we are going to do that.

[1]: https://www.scientificamerican.com/article/your-brain-finds-it-easy-to-size-up-four-objects-but-not-five-heres-why/
