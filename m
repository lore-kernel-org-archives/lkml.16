Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F2727FB36
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 15:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747669868; cv=none; b=TWwEcS8GIZxLCVpRqnDPnRwKEvsjPN5YBwU3+GEjltIO2O5Vleol7/+PHxqIzfYBY6/bCCduAqtP3zikuRrFVQ+feB+ufkfLh6rzZcRc/KiYnGQiTN+uY3aHwciOM41ANgztA3n2iC1Xy5VyO03dKI4sH6a1JCAmwPLBb3lpj1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747669868; c=relaxed/simple;
	bh=WtXjgHGgOeWhkZnhe3EEZ4oiWzAptq+Fxpl6tc7EjZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qVFSNFvady9HMKYpKr8BT2t0smBPOtLEP9i3yfPEKf5XI/IaiktEYU1NIwZHIYuDFI85oaisW2duqrZSDvZMNl6gV6BfZRujTgDEujzcrrf31iohAHyzAX4+NYn1eKIAcsfd64KqfMkIXLBIQQFeKVEBPWKqkJj1Ng9w1PyHNGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=UamEbpn7; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="UamEbpn7"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3fbc00143d6so3759967b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747669865; x=1748274665; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4R1jjXpvGFZooNqwzquS4BoBFMZHfpqMKV80JZ1CvuA=;
        b=UamEbpn7nxELoA44WJVW+ubaZsRxztzIsnnd13E+2z4vp862uIczRd9CEos95UifYD
         B0VonvuLci4OIyZ7V6wXx9fRIypzCd8FzLG/wPPuhA6ctbNiIZHGVe2rhH0AsUcSvhcj
         hhPB1PZw21DaEekMxn/j5ccKUjuL3Yoa0CqBJKyUjtATfQUaORRTmeKru3km2f5Wr+K+
         9R8Eg+qHEtL8SRCn5e98nd7TQklxagYH52Raymc9++p7bjmoRG11u4oGBvtftDNIB+gj
         PjA74NNFbBwCEI61ejpHeeJtu+NjKyUexEH2To2wi7ca1bn5cCWl9D7kP8FtCPc9zj6k
         +hdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747669865; x=1748274665;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4R1jjXpvGFZooNqwzquS4BoBFMZHfpqMKV80JZ1CvuA=;
        b=LzA3ne/v4fqSIQJXWbbzYpBZexvrnWwv4qNryEFmJrpA84nsj90MKAUEIqorwGPTJf
         YDNEtccTlxosugVBwXpSFmhnPXwluzxF3Osv2cZaWAN0GoXVPf6c6f1WvArAkQxJ4n5X
         XNx/9uHYR7JgoDo7wQhe2/y5qYx63Qdv0qVRVEAmya7y0hQVpOjf9YkRTVFrq+u+acBl
         zr4HUKnIkwLhy6k68r47qstc5/C/gNMBeKEGFSw5F7IiaGQsIIf9xvAnRHwZBRqjUTF8
         xC6Ufhy8frBSn5T/eeMnK7uDSfvSc08zROoOs7iJWI9g36wwvT2HENvt8xxNgLWsu/O2
         WDBg==
X-Forwarded-Encrypted: i=1; AJvYcCUwOj3ZeT/P5D58TVp5FsEnQGG9q8oYshhoKXlKt+o+If0prfmHmzvn6pg+IP6Y9cSj8ps58DBeXU2AM58=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6q2/73a7GHhcTDVHy9qX/rqqo27JjTdC5NYt6hlDtMp0QKaWd
	R7p3LraHlzgbja01qyVMdQIYUQ8qaTcI9GzE55lIwONGC9jwwrpoJ9Ogk0gvDam7Fws=
X-Gm-Gg: ASbGnctcl2DpHjgGyyF2Kqb4kPOWac1k007bxA6+WCp0OTNUkA7Z5ae6UfqD29D7IC8
	Ywxy42VV9fFSJHZAMRw7KT4TbVLafZFrwoXWuhY/8rU5Iu2YGbHuVyVKkkGRxQ3Dhq+o36LGgF6
	8Hs0k2i/Tcp4xHFKiZ7tDWaMd6NNDJf2TBIjScnYXOvfHSsmy0mhb7uT2kS0DSx+cTaerWq2K2J
	xqkTHc405q9wNOzLUe/d91YVjfojVgMhl94+Et9lgFf4ZtCThj2kRtGUn5HYwjva8Oe6fFmmuEA
	eztQ2SKAnZc8OMu0qAIW2gzowQ93Mqwa8pmdGccGcbyIQXfTc6wBReFNGW6xpOC0rdh9d4QWz4f
	aa+NQrWb0Yt6Le+8/tlRD31pnmA==
X-Google-Smtp-Source: AGHT+IFr8We/4x3wKFarQINBJsR1rX8wHZI8lP1EpQm+Tg4CIOj5A2c5zLtagPVbttrgQ1CNzVdJBg==
X-Received: by 2002:a05:6808:3a12:b0:402:1caf:7789 with SMTP id 5614622812f47-404d8767942mr9511245b6e.14.1747669864661;
        Mon, 19 May 2025 08:51:04 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:a628:91ca:eb5:d6f5? ([2600:8803:e7e4:1d00:a628:91ca:eb5:d6f5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-404d97d6129sm1404336b6e.8.2025.05.19.08.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 08:51:04 -0700 (PDT)
Message-ID: <9f5dcb2d-3fa9-4e39-9cf9-c5a23847224a@baylibre.com>
Date: Mon, 19 May 2025 10:51:03 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/10] iio: adc: ad4080: add driver support
To: Antoniu Miclaus <antoniu.miclaus@analog.com>, jic23@kernel.org,
 robh@kernel.org, conor+dt@kernel.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250516082630.8236-1-antoniu.miclaus@analog.com>
 <20250516082630.8236-10-antoniu.miclaus@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250516082630.8236-10-antoniu.miclaus@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/16/25 3:26 AM, Antoniu Miclaus wrote:
> Add support for AD4080 high-speed, low noise, low distortion,
> 20-bit, Easy Drive, successive approximation register (SAR)
> analog-to-digital converter (ADC).
> 
> Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
> ---


...

> +static int ad4080_properties_parse(struct ad4080_state *st)
> +{
> +	struct device *dev = regmap_get_device(st->regmap);
> +
> +	st->lvds_cnv_en = device_property_read_bool(dev, "adi,lvds-cnv-enable");
> +
> +	st->num_lanes = 1;
> +	device_property_read_u32(dev, "adi,num-lanes", &st->num_lanes);
> +	if (!st->num_lanes)

Error checking seems not strict enough. Allowed values are only 1 and 2.

> +		return dev_err_probe(dev, -EINVAL,
> +				     "Invalid 'adi,num-lanes' value: %u",
> +				     st->num_lanes);
> +
> +	return 0;
> +}
> +

