Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01591F426C
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 14:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746110965; cv=none; b=cOhuElVwFFN0BeV6xLpIyfiH5BFoNVxubJVx9GLDUN7hZulanlHTNUsKsOnGEE2wGWneJWI+CkY0tZFDLQu2ARgmfx4WRTpLIcH4FL9HK4HmT3IQ4i5nXuqqagX3P+4NVUSyNP0vnkzJ4EgKJjL22WPxKFl2tE4nKIlZdBrCrJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746110965; c=relaxed/simple;
	bh=Nj+Buzt0el1DKRoyQF913fIBNhoC13kudc2w1c3kB2I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=McoHn258IMkDkKzwcaoQmXjTtKBYcgt9DZlleaDqcDPG4ujBjRBL7HqQRhk0ndmhmGiHDUJCJ2wXJ94zC6/8Dk6euQs5z6TbdLuVY/ar/O1whTVGAxD4NM+tBXOu3RGgylSN7+dZwEIOX96QyrZ1J1DW+azZBLEhr9S5wnjyMLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=USFeTrTP; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="USFeTrTP"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2d060c62b61so971949fac.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 07:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746110962; x=1746715762; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fEs6umMySeLBJDEE1y2srlfEtA4e3pHxcXG4IeDmkZQ=;
        b=USFeTrTPkhdXxAd7WkSfn4OAjwOwVD2HAJO4uaUBIfotv1a6ORmVRaLKq+mHTPpNjb
         AEoz2Iy/2+FlFZXl8pYrchfyi8QWR7JjbZsWqApOcHQe/NXQP3UnvsC03s/DaLpMXTmz
         Og1MbSNTocB0ycEPs7zsE3FESJ6nlhlener3/Wvm8aexLwJln7ZfF0lgRI1VWscoTb4Q
         3VsKXbtDykX428vUQkQMViv0RSrRPQ5gCypp0qP7oNL/QXnwIuYtswelxcJ/BxXte+l9
         txJ3ch8m57nUbeQZ58OpnNwWCxLfp54wILc0ros1izps2laTAgrkK4nFlKdvGbwcDn15
         fr+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746110963; x=1746715763;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fEs6umMySeLBJDEE1y2srlfEtA4e3pHxcXG4IeDmkZQ=;
        b=RGXYxnVPmN/8h3yleDdBsYmYAUoWpfNB3SQ6oglRuM3qdnHuF8ufNOXzB+BVPSgPqE
         n8DvL5tvCx3EiZdUXdwoxZhpUjNz0E8tIaR4NewEgpg6gevRSW8AERcB2zQ31MK26kPx
         3ZUwreYNtxNhH7ojWufYITLtGbSCyFcLqmyInVK58jDqs5fQ3epoMo6Qsx2F9zBsDAGK
         sTkzt77KkK8lqmscKYR1IZmTpYBEgEUWkKAwYV7UVHdrEkGdVQAtJRyCJr+7iFhTjCwd
         +T8GyY2Nd54WosBJww+i533BlQqzoAZY3WNiwEHMgLnyNQXLO+kV+ip7Cvdsl62TJFEa
         wtbw==
X-Forwarded-Encrypted: i=1; AJvYcCXFswFuAtj7LoHVJh3Ag+0YdL4+ziF78eqQzgTwNhSfDudLCh5goqs9/FZLrurpEGFCnsQBlDuMEPMRmp0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGzeRpl3WUD9wxx3T9DfeOqfnKDsK1z/vP31nBhFjkatwKHCPa
	f2m87iP5WBLWzgWVT8jKuCR70B7bHgLcFetivtX9OZeMcrukuaUaW/yRlla1X/Y=
X-Gm-Gg: ASbGncu63XF3ezNHvpguOV4QwewvO7ivHDGR4T3sb+anokuV+EB5+9wisCI/s1jV9+e
	BnKjqieRo2nxdfZcwvtbI+AGdQ0JwOVu5JG6hZRCpKvz3w0SM6qkA1i3nXoY8/NOiqX7UiggMe5
	rJ9DldXymMi0IMTfXTJeBI+1EgeyeFxvNO1fCJbhhRQPPajrEtkAXwAdQ04gHDhezYunScjeMEl
	4gqvq54z9YNkMruelpn1hbEW9hXQ5jYakUWXYy3NrWVM7Y/zEqjYlVvEqFdlTHjzD2ZfScBBrxn
	sgqwP/z40kJc8YPruu4rLMxAGkJlB6YOsVwDaKIBxYRCpuCewIZ0c+NWylL6VcUGp+xCWnwrViX
	NTFXVTWz6UjwNeIS19rDKrAh5KRHO
X-Google-Smtp-Source: AGHT+IG/sAO6ZHkviN2Ne0zUJ5m6cW80bEv+JtsGzgP47IWE2BU/C39yiIzIqJ5ZMSvTiqGOzJM5KQ==
X-Received: by 2002:a05:6870:47a3:b0:29e:65ed:5c70 with SMTP id 586e51a60fabf-2da6d167ea9mr3635683fac.30.1746110962642;
        Thu, 01 May 2025 07:49:22 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:b1ed:e5d7:8ea6:40e0? ([2600:8803:e7e4:1d00:b1ed:e5d7:8ea6:40e0])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2daa126b723sm147495fac.49.2025.05.01.07.49.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 07:49:21 -0700 (PDT)
Message-ID: <df11dff4-7641-46f8-a604-8727918629c3@baylibre.com>
Date: Thu, 1 May 2025 09:49:20 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] iio: adc: ad7192: Refactor filter config
To: Jonathan Cameron <jic23@kernel.org>
Cc: Alisa-Dariana Roman <alisadariana@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alisa-Dariana Roman <alisa.roman@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>
References: <20250425132051.6154-1-alisa.roman@analog.com>
 <20250425132051.6154-2-alisa.roman@analog.com>
 <6d0ff620-ec1a-4b17-9b5d-b9c48078271a@baylibre.com>
 <20250426133241.7d14c776@jic23-huawei>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250426133241.7d14c776@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/26/25 7:32 AM, Jonathan Cameron wrote:
> On Fri, 25 Apr 2025 10:43:29 -0500
> David Lechner <dlechner@baylibre.com> wrote:
> 
>> On 4/25/25 8:20 AM, Alisa-Dariana Roman wrote:

...

>>> +static const char *const ad7192_filter_modes_str[] = {
>>> +	[AD7192_FILTER_SINC4] =			"sinc4",
>>> +	[AD7192_FILTER_SINC3] =			"sinc3",
>>> +	[AD7192_FILTER_SINC4_CHOP] =		"sinc4+chop",
> 
> Is chop really a filter? I had to look it up and to me at least it
> seems like it isn't even though one thing it does is remove
> some types of noise.  It also removes linear offsets (some types
> of filter kind of do that, but the affect of chop smells more like
> a calibration tweak than a filter)  
> 
> Maybe we need a separate control for chop, rather than trying to
> force it through our already complex filter type attributes?
> 


I was looking at the datasheet for another ADC that popped up on the mailing
list today. https://www.ti.com/lit/ds/symlink/ads1262.pdf

It also has a chop mode and filters very similar to this one. So perhaps another
reason to make chop a separate bool attribute that could considered a "standard"
attribute.
