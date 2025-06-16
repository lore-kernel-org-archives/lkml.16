Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5795E20FABC
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 20:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750107190; cv=none; b=CefNVsVx3CqTQ6Zp/zK7JQeVLr9Ah/M7KOw61JuHQZ+/upqgnHGsCIg6dTwljrM3xPtqRkKDV8jxxyrrJIaLwqyIYP0v8bz6a7rYzc4z1E43bZQYpV/DmEDSzM3P6S4GcEVnUVUHV4YizpOVjP7ZP27mVw2TnZH0kIzHrLd5jk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750107190; c=relaxed/simple;
	bh=Fgc2WWVhmZSNbwYEBSqxyC8hN2ImBZ7wr5GI6gGURtc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c/6RUvf2vrj/rXYbN8Ox5YqLoBtI3DkLlBQqyW/o2NoM/AOWhRBsIcT1zt3IJg1sExXeBQoRlZY9GmkDJ9SODPJknz8CYNfXLA43S/qbg7BHL+W91M+HDbb99ewzpRvMKZW9Eos3eoDTW1dCMYTvs7CQMV/UHxtwu0skoVq2JIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=3e5LjKGi; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="3e5LjKGi"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-400fa6eafa9so3511823b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750107187; x=1750711987; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y8tqSOUPgM1bEdf4klAOUys4IG+Ji9moxOsELLoPJnk=;
        b=3e5LjKGi+PaHpPwAxSWsy05puAGIByyAtxpKsXJe3l9dzhTesO/jCjl9ZLznA7MK1I
         fnn0eSXXdYgyxvBH6soKWMdtwD7wM9P292MVT8PNw5XTIgBIW3lMSZTHL4gd4YI4btJ+
         r/Rw7y+8CV1Zf+oU2t0QFybi8Mh29RsLg/ltE8YCuY5VHtsrNt9jeH71VAIpCzYcrqV+
         oTgy7A+0Q8YrdRB7dwjT9cwjHMq5P5I9GawreWlDA2rWoM8Ez2laX8A0AdK0fZyLadpG
         l3XeGRpgcoIWbcAmM1nm+WK+lHijSoOaadGkn6EMVIwVH25xWVbfXj108PhDWSziLd16
         tiyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750107187; x=1750711987;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y8tqSOUPgM1bEdf4klAOUys4IG+Ji9moxOsELLoPJnk=;
        b=Bp9DcW/8KYnggzRYTQv7JJT5jwPuqVS3LASLkpqC+lG6GRkfYSeJIq/TGKbcaeYN9s
         M8B1eXqJDbQjbBnUK73iJO1/h5yq9pNbC0L+8PeZWldOs+tHa9DmPSq/x5ZSgT3wmr4x
         3UM7hkmMAY0EO0rPQ4vIyvTQFhCKN1jP6p4JiTcGDmy26Uqak+UaDuRmOWtQJR+fBPRT
         qIiVABgaZN0sEcPr7jz0P2N/3U9QTKuDGtbDVdm9COuYW0PJnN41GI9LijvkVVamtskP
         MmOr1cw5wVkEtMNUH2JFNhoZw1VwONfoylmWl1GqRztcVPV12wKmGLEsZ2Q+MKEVKZ28
         2dpA==
X-Forwarded-Encrypted: i=1; AJvYcCUL7oZFz/QXRx/ydUEkuCp37TWMU1XRPX6pcgXFGnkabiw7XHWOlGPPqgNATl15cQf4Aqq51qA5UCqqYqo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa0JPGucEllNA2LDeicGlRM48vxnM9WExqlpc5WeZHx6zM/8nx
	gAdZlWvhZedMN+2kHtiCv26+Kdqrit23ZY9MgjuZ+HJnHRQ91d3rkMYk/ebg8Ox7XVI=
X-Gm-Gg: ASbGncvkqoqYJvqNyKreKFrT44izs+FjLVlvXNUAn6M7akc79NPAH2dBDspz7rVve1y
	8IG2Kcjkbvlc5MvuXDJ5nYgT3aTQp+G7ngCNMY+h5HdjBfWcmFPX7DVGBa5ATzIyH5tz7Llh7nM
	dWUlNuS4/AXfTi7fUf5/gc3/2oE35+/PC/OMc8AePR9tYC4kXM7LITP52MaPI3hmb8YutFe3K+/
	UW76lZNwCW6ZMd9D33KtYAfA7hfJFChoAdbfVxaSuz1+wx8OM6mnrvMzRACLTeJj7lU0y8PeTUv
	gho+R6EfDvPNHsu0HXh1D2KlZj/M/pXE8p1Nll3BTqmGSOd8YmbECcVtiDTbR6Xp4EGcQc1OkTw
	wheE6sM7tWaeN97+MT+zFHxQAbP9U2FlJqxaIp6ANPFN3cW/5Mg==
X-Google-Smtp-Source: AGHT+IHzYq6GWzIf6b3qYtzYTGBw6n+PghC3rAzoIMdm1SgQulh9Kqlg0au1m+bSuRR9JTofx3sYSA==
X-Received: by 2002:a05:6808:2026:b0:406:6d79:49d2 with SMTP id 5614622812f47-40a7c24c65cmr7434326b6e.26.1750107187404;
        Mon, 16 Jun 2025 13:53:07 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:9583:1e37:58ed:10ae? ([2600:8803:e7e4:1d00:9583:1e37:58ed:10ae])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a740c2306sm1627122b6e.11.2025.06.16.13.53.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 13:53:07 -0700 (PDT)
Message-ID: <ac4aa95e-2309-49a0-b498-2bc3ee232a36@baylibre.com>
Date: Mon, 16 Jun 2025 15:53:06 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/11] iio: adc: ad4170: Add digital filter and sample
 frequency config support
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com,
 nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl,
 marcelo.schmitt1@gmail.com
References: <cover.1749582679.git.marcelo.schmitt@analog.com>
 <dd8a615936dfebb6cd7c8110db2fbe0b81776608.1749582679.git.marcelo.schmitt@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <dd8a615936dfebb6cd7c8110db2fbe0b81776608.1749582679.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/10/25 3:32 PM, Marcelo Schmitt wrote:
> Add support for sinc3, sinc5, and averaged sinc5 digital filters along with
> sample frequency configuration.

Wouldn't mind having a sentence here explaining why post filter control
was omitted.

> 
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> ---

...

>  
> +static const char * const ad4170_filt_names[] = {
> +	[AD4170_SINC5_AVG] = "sinc5+avg",

Do we need to document this as possible type in
Documentation/ABI/testing/sysfs-bus-iio?

> +	[AD4170_SINC5] = "sinc5",
> +	[AD4170_SINC3] = "sinc3",
> +};
> +
