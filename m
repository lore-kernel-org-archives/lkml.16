Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9C11EA65
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 15:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745853373; cv=none; b=OCvLqIJeObS9tHj30kQk+XGG1bJb5aEu/jJqbxJjt9w7qQO+39jcq6eM7F2lonV4M8A0KPhO9daBnpe6S4GBW2tUekcCwdNsznwo/F5ucEgWJXMpjzf6bFiXoyDzwawMiu/znFbMevT+TDcan8hmR7D7O9W95dJT0hNhtjiVVSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745853373; c=relaxed/simple;
	bh=13vK4Obhj7rvHBAejWjvk3MLDIWpBAKft6VkmzOuptM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gkyb+oSmSxWvgP82c17isKfno/iCBnZ5KQoExKJKAmOvG742tnOgXAzuVyH7TeW31VAZ30Fc2/6MxdULaLHEGBTz0T8YY7SaipxJv0crlYGMrjj88WKFov6miOIn8Tt5h9P6+SRwEP3mnLz28bNdjAI5eziYXoqH/4mJp+Awp8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=MZw5pXdy; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="MZw5pXdy"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3f8df49e75fso1070753b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 08:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745853370; x=1746458170; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+x5yzbFX4AN8b2XmBSA753TErdzmvFUXrJPqVYwSyhA=;
        b=MZw5pXdy9pPcm0/2T/RM5U65Is0jrDUkALlWTist4rSVX7jaghPh/qGus1PAaRYOab
         aUI3vG063etPiboRWztijfxL6xqqRbgMwvwHsjgOPORupYBKpyh+lkD0SY13uiyt1bg6
         29KOrmELm2oIDZGPNVnO953Fql0s7BcdpLwHKj9drAn+YVnOMBWGEBt6y0nLSDW4IUa8
         zcXtxB1SK5KHORAdDt18qteghuJ/Y73+WOTGvUB4LbesVwnmv0CJZ8aE/4JtjzP6eqWv
         nQur8nN7/2TBmo7jhU95FqycrSbzHWDhZckJHYsd9mRf72QaIbX/I6oS8dpSbkT/IgIG
         fKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745853370; x=1746458170;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+x5yzbFX4AN8b2XmBSA753TErdzmvFUXrJPqVYwSyhA=;
        b=k8oaHoBq1NX2+AEk6NWXm0oz4yVnZbjLwXFNB81ZPxDP6PfYqtIoMi6hHGtsUgGykl
         iI7Cv8EbJ8A2i6xfj+tZGuXymlRT00DNnJLtPD9qspDFcgwR3RCumdxOOeeIWy4qShUb
         LlRkPuVdnp4cyaYTk8vlJOHugMjcKJZS0lOPCCzoyAlG33yDFGYJRazWdiXQ0EgwJLAR
         QEswAqEp5YDwbNUUeTyazCU2DbY2wp/gYXNAXnRvaiir5nABMGkAjZ76WyDZT4VKRUDZ
         OJVz2WcvS7LoVMqtZqy3rWYmJh8pJvBuuCm9zCxLeUSOMCcOBAbSEdL9kBFu5Ygk+Kwi
         gYJg==
X-Forwarded-Encrypted: i=1; AJvYcCXS74VVMO4hkHPhLJS0pNmOQzlTkLbVXFMHRMPzEoxRpMj1NeTfWQfjQMs66+DaUNaEcXDag4BTalrvfMk=@vger.kernel.org
X-Gm-Message-State: AOJu0YycaiBhcHuFZL2G8uk7rBWM/WjJdYNqhhZ3mhoXFRQTUu018JjW
	Db+bKV0STTYVWLJvyRDwLazNBlfEB/0XdhgUvJNc2qdZoToWnQyO9alRg44tUPI=
X-Gm-Gg: ASbGncsNuN3Ako25BRsIiDPUJqrAk3YebCe/YKO54cpX+jKXjDnXFB09K7pNLD0aVkX
	Ems7vcRDdH6CodTFzkJML1GTAXsPoxHrUN5KPgcyWbzqEkSHqCDnmD3DfgJAh9IamgXgVIBzR7z
	AAVRzDTOTSvdxiB6VrV78nnjlzn3Q5w5o5E9IKbFc1xMULRjmz54OzIXf8/hxbyVSXvSwQUGalV
	dgrSRSPu8qN/gGrdySOinetb6EJH+kmPiwrj3BAbkhrylMPgGHVrjKCgApSdsBPorwDd58pU0Cz
	pnHzXdpP9TNAq/BxtDKEh9kAXvh/uCxz6L4W4DqTbwfiLbP7hpoc5RMcAzuXWwBn5RVN7jvh35Y
	xaa7yDi3sGTGXP8FxXw==
X-Google-Smtp-Source: AGHT+IF7zkUXkn5KYJTxzpFih+oinj+dC7Pj6YPEzLUjDUEfcVbsAqulIGlLRI1jrQmsg+mM1Vm1sA==
X-Received: by 2002:a05:6808:158a:b0:3f8:eee4:7140 with SMTP id 5614622812f47-401fd7270b7mr6158135b6e.22.1745853369918;
        Mon, 28 Apr 2025 08:16:09 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:cff6:9ed0:6e45:1ff9? ([2600:8803:e7e4:1d00:cff6:9ed0:6e45:1ff9])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-401ec971691sm2083493b6e.39.2025.04.28.08.16.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 08:16:09 -0700 (PDT)
Message-ID: <b7adef4b-68ae-4a49-937b-307e116976f4@baylibre.com>
Date: Mon, 28 Apr 2025 10:16:07 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: ti-adc128s052: Drop variable vref
To: Matti Vaittinen <mazziesaccount@gmail.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <59106e24332743a7f9eb0b13ad6a2f5595ab485a.1745823530.git.mazziesaccount@gmail.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <59106e24332743a7f9eb0b13ad6a2f5595ab485a.1745823530.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/28/25 2:02 AM, Matti Vaittinen wrote:
> According to Jonathan, variable reference voltages are very rare. It is
> unlikely it is needed, and supporting it makes the code a bit more
> complex.
> 
> Simplify the driver and drop the variable vref support.
> 
> Suggested-by: Jonathan Cameron <jic23@kernel.org>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> ---

Reviewed-by: David Lechner <dlechner@baylibre.com>

> @@ -183,17 +173,14 @@ static int adc128_probe(struct spi_device *spi)
>  	indio_dev->channels = config->channels;
>  	indio_dev->num_channels = config->num_channels;
>  
> -	adc->reg = devm_regulator_get(&spi->dev, config->refname);
> -	if (IS_ERR(adc->reg))
> -		return PTR_ERR(adc->reg);
> -
> -	ret = regulator_enable(adc->reg);
> +	ret = devm_regulator_get_enable_read_voltage(&spi->dev,
> +							   config->refname);

Is this properly aligned to the opening "("?


