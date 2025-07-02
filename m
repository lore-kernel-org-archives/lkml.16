Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169092EFDAB
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 14:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751465819; cv=none; b=miLXwc5n9zNQ7RHc7ponoKbaykEW6qZVMbM6mVSVeq8mRe/EOK8KjxMSS7Kw2a+BxwWwe5TzDU5d2PkA3KZAEsF4rdBNerCgyw31JPIzODNl2LXTdNW3m/pJZMwH4W0scrmgORlCZSuZ+WXorRfhRsmA1PP3aUOJaX3g39GBXyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751465819; c=relaxed/simple;
	bh=ivkSgMTtV81CdANQ5XafOK5UJU4ttt5I90ZuP9XelP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U9FeNApyVyt3GqjS9nSF7bRqi6XbzRhEwEAFDBkjj1c4PYGwwykzSvQ4nAgHBeTXXh8sfHXhs3lJ2WPlVDr1oC7aespwSjzqhW0r6EDKDR1qeZixheq3H89S5ih4ECJGXgYgWLYWyO3LJDwzPwZO3dD+K+mPOEZuEN9CjNdZGAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=QIJsd0F/; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="QIJsd0F/"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2e95ab2704fso3061351fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 07:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751465815; x=1752070615; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sCNt8orVvRnPdLUcXvMNqNxbNUJlKlGrsoDHbOPwgJM=;
        b=QIJsd0F/MbFF49Boy+x1Af49w/0wyrnkTsPYjdyr9VuNaiOCkgY23qxpljBn7nqmAp
         liOIHpmk/RCAdlYe0wweHopiZBw0ShCotJCrr7CijEH0teqdvRPrhFYQIy3rHqk4nIrI
         uZLHdY/RkOgJhvj7b7tmQSjHGRRqlTm7v12KSGANWWKbKJcHI0g9jaIZI7Yuvw5anyDI
         uVwK6o6T7mH5TrL1r9rjtD1NkFPixUBzdloXmnqW5qA9dmX5vQ/D13kBYVx44mZGGbc2
         hLg66JW1Mn+TSLgVmmd8fJYNcp6+AfBn0nFPibF7DWjenQKPDp8nVdxCQ9KcirRN4/ja
         3Bxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751465815; x=1752070615;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sCNt8orVvRnPdLUcXvMNqNxbNUJlKlGrsoDHbOPwgJM=;
        b=u3AYwIeA16D4H8DeUrc78sPN71O+M9wyOLjLuGXLRzOspT+HYYFZcOUrzPq1DgHtCm
         ptKBY27OA/MrBavU+fEXET+SRRntbtPVUG8X/hFO6JQ7FY5EaNzYw4Se89puB4yIh0U5
         ICh/Yl4w4u7tBVzsXUkv0rxq85y5dYhQbmbepiTd9HSIs68tpMOQ50BRPT2eJKXXAftQ
         GsuaffLD+rCMiFKM54JmZ7fVBo5IRdsDstZ5DbrO7YH7MXSd23mzeg1k2kEVBq18m+La
         +4QmQkgNUL0DFtVJtrB5TuBjkF1Az4vRP7ZY6Xh2KJ1paQb1OxlyjGu4mrDyPmg9xdOW
         B3OA==
X-Forwarded-Encrypted: i=1; AJvYcCVri7HRg3+K0FH5wZ0Gh4zEiuQL5Zgodua5KQ05keSGb15Tz/wm0ocJENvCwIEQl+ckp8BFcwMq7ZLA29Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs2Be50XBNsHN/jAqQe8n5MOMtHiAbR7xTPRMIl+1jhukxtx6z
	hzdaJMfk4FJpqn9FoepL5+Ptii23PvG5mC0BXOqxzXOjwEwi4W5QW4hUow8Hph2C6i8=
X-Gm-Gg: ASbGncv+RX6/rPJ0yyKhhR3uLkf3dgGe4Tv1bLYgnGEzNG6SejmQobfstlPgh96k/iM
	jZQ5JCULcri0qXYyjCJs+WsrkCM++H+fTbZd2OtODJ7sDGuopMqHaPs40KbuHOfeVinLIsxXONh
	VN0GvgycxEcL23hS9cZq3SL2K3CMORo2ynl1U9uwPOCuAgi8nwuX94/2lwXbQLLoP4cVRFuH0yq
	ykwSD+WaMcLTUHScJudmh/HMnTlzMtuMuXde5S7/dFsE3j4qwcYxLFcAzK0pUy+7pJlG1oiQA2X
	nujGoIleXMUsOWV7lSm6nsAnR+twslb7G4UiS7TGWSrtuqgAMHgBIpf2fRqaJOy01RSivp150li
	sYgNLx+mUmq9nMuMoB2jf5S20WVb/hxRRRW0haK0=
X-Google-Smtp-Source: AGHT+IE3wezFD6gq5YO9AtpQHZYWN89aAqaWHJI6eS+Rikhf0NRsNSoAVq5E1EldNNLhjkG+5ZMahA==
X-Received: by 2002:a05:6870:288:b0:296:b568:7901 with SMTP id 586e51a60fabf-2f5a8c19495mr1923947fac.16.1751465814997;
        Wed, 02 Jul 2025 07:16:54 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:70a7:ca49:a250:f1d5? ([2600:8803:e7e4:1d00:70a7:ca49:a250:f1d5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd50f9748sm3929916fac.37.2025.07.02.07.16.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 07:16:53 -0700 (PDT)
Message-ID: <f96b68a5-d750-45f0-8cdd-9761b5daca1d@baylibre.com>
Date: Wed, 2 Jul 2025 09:16:51 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: st_lsm6dsx: Replace scnprintf with sysfs_emit
To: Akshay Bansod <akbansd@gmail.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250702135855.59955-1-akbansd@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250702135855.59955-1-akbansd@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/2/25 8:58 AM, Akshay Bansod wrote:
> Update the sysfs interface for sampling frequency and scale attributes.
> Replace `scnprintf()` with `sysfs_emit_at()` which is PAGE_SIZE-aware
> and recommended for use in sysfs.
> 
> Signed-off-by: Akshay Bansod <akbansd@gmail.com>
> ---
> 
> Testing:
> - Built the driver (`st_lsm6dsx_i2c`) as a module.
> - Tested using `i2c-stub` to mock the device.
> - Verified that reading sysfs attributes like `sampling_frequency_available`
>   works correctly and shows no change in functionality.

Nice to see it was actually tested. :-)

> 
>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
> index c65ad4982..1cef10919 100644
> --- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
> +++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
> @@ -2035,7 +2035,7 @@ st_lsm6dsx_sysfs_sampling_frequency_avail(struct device *dev,
>  
>  	odr_table = &sensor->hw->settings->odr_table[sensor->id];
>  	for (i = 0; i < odr_table->odr_len; i++)
> -		len += scnprintf(buf + len, PAGE_SIZE - len, "%d.%03d ",
> +		len += sysfs_emit_at(buf, len, "%d.%03d ",
>  				 odr_table->odr_avl[i].milli_hz / 1000,
>  				 odr_table->odr_avl[i].milli_hz % 1000);

Let's keep checkpatch happy and change the indent of the wrapped lines to
line up with ( since the ( moved.

>  	buf[len - 1] = '\n';
> @@ -2054,7 +2054,7 @@ static ssize_t st_lsm6dsx_sysfs_scale_avail(struct device *dev,
>  
>  	fs_table = &hw->settings->fs_table[sensor->id];
>  	for (i = 0; i < fs_table->fs_len; i++)
> -		len += scnprintf(buf + len, PAGE_SIZE - len, "0.%09u ",
> +		len += sysfs_emit_at(buf, len, "0.%09u ",
>  				 fs_table->fs_avl[i].gain);

ditto

>  	buf[len - 1] = '\n';
>  

