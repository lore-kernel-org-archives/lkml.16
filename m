Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5669A19F10A
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 15:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748619582; cv=none; b=YGCxtfLR+h8gx34sR3r0g066Y0wIeR5d/hveV+DNLk+1HqTYPsy13uCZEAK/Q4otCRS/i3tGYP5k+9BJF7FzFUzZrJWle9C9W+0JlHgICoEblyn4jAQ46zE5KrBOqyhECwZ93swwPnCBvnONuRAOT1+8xqJiKUrqYbrvZcKNFAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748619582; c=relaxed/simple;
	bh=b7btFpwI/5wm+1ld40EI1n6LRFzHnxTFCCMCb981U+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E2GiwYiGhY1jn9bcoqQRie9BT3xnMC4b6oN2lFn7WHQip08isYJbi/R0FghP1yGV1TAMAUczWX/gBJ1C4h699chosz4zYpVCHvl2nWSY++PSqv2WqX7e6Ghh4UQV9OimKLPX7A9WJYGnxYtN4Sip5lIilya1InHLrgs5+ylFj0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=kaI9XafS; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="kaI9XafS"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-735ae79a44bso1638050a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 08:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748619579; x=1749224379; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/u7rwzZrSAyNyyRlGLwaH/GU4L7iGPNEX79+p0QShAA=;
        b=kaI9XafSoEdalIm4caDGuC9wGxr12KZGxH4cx3VOl1aSFu5zAcJmOmGwMdEIG7P0gI
         8bgKPkT9JdEwe02Oxtwj0X01OEg1n8ER9+XvyLT7zOB6z1kpWAsoduIMjiGfJiGjr2KI
         ar3qAOCPqKlqlfLGAi30t7Plco952E2z1N0cGl6qZw8Eq2soVDdZTzJlgUWzcYBwUB84
         iqou0D3V5irn+MBLRZlNuCKdPH67i7m181GLYzVtj/ehu3GniBU4yDIPIRDBuy5rHmHi
         /aSxT0mdmHGgChNfL2y8sJVSb7B2p8FZYOTe5OraVlLkv8sBGjVE1IXtiuRLrIALmzeE
         9ZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748619579; x=1749224379;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/u7rwzZrSAyNyyRlGLwaH/GU4L7iGPNEX79+p0QShAA=;
        b=op0XTcMU7rzi+rMWYMLgjeueQqudTXyXb1zNhKyJQPIjU64zbu9+kxgZLLV+0v8vpc
         BJclnXo4HYSk/n6+s0xo4MpQIAtXWQyyF8XzfmcWiLPyinM/dwFIsat16gUBnpZ1I8x/
         Njh2P/sm+LvdIBVEJTJvDYQGjuX+6xhCW4xDkIyghBd/tPVERALgxjp8sYwlIT/1UYof
         vlLOyjwl3zunuTxQxB4njb6aJ1o8mUPxw57qtejxYlc/RWrmVIrPGZgUxCujCh9Pe02U
         ehGUHE6ge/YzMxQ2JMqMf/RY4XviwgAUWObezXv6krgXA59jh+f6aCTeMSnkVbYBJRiT
         /qEw==
X-Forwarded-Encrypted: i=1; AJvYcCX9UlrvYezn+X7UgXr7p8ehQ+2WjhjOsDOXw3wxWzkQ3K8scqYIkkTPAbdE6s1UM0l5RxNcGX/tDVygHQE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/yod77aznLCj7IHR9Bq0DsNduheYBk+kxd8/gFcpDO4mNnEfW
	WuKNRhinx11T7MCnITWHFL2j0vtsiL2cqTE4XwnbfzqZRywwRPmJu0yNff37G884Kg0M9oLgQUF
	anWH3
X-Gm-Gg: ASbGnctgQ2uLlZiP38Yk76ld0Wr/wmdHCoyQjTsVqRvViQivzJlA1rwA827ZbzcmKks
	uCTjKoPZ7BRCHg8PkCCqqKIr9ZPLnI2oiz4uXj09Ng/09MT++axslCKHrlUVAYNhgPgOd861KHo
	Td0ZZj/IXJ5btJhbhuY2Gz2X3aMUrU1/7ek7dnSqSIfXfKM8yuH8vYmZFnllNG8VKY006ntGlMW
	mhfxVE+XX9Fw0pWHpyZ7LZwwPXGsfml4WAbvRgJLZaj8pgQXApsY4200H7Hq6rjolrlNMYxDiQJ
	r/QSUsxxNtGmQ+Eu9SW5bBMlwCQAJ9U1kq76m/bB/ACv5nT+UOcSPbUQ40evD3DUcOdWAbz11CP
	Yz4smI33Axtijzhqy5/kIOieSiFPW
X-Google-Smtp-Source: AGHT+IGG6DMBSGgPWCHIO7NgNhnGv4pO+yLYXB7qonCi9he/56OL0CJOqlpr62QtRv63Lv82VFI8iw==
X-Received: by 2002:a05:6830:2110:b0:72b:84ab:b1bc with SMTP id 46e09a7af769-736688ded63mr2273128a34.2.1748619568685;
        Fri, 30 May 2025 08:39:28 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:29cb:b1cd:c8f4:2777? ([2600:8803:e7e4:1d00:29cb:b1cd:c8f4:2777])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-735af9ef0d7sm621689a34.56.2025.05.30.08.39.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 08:39:28 -0700 (PDT)
Message-ID: <73be8e49-3130-4dcd-9286-689ef55badd9@baylibre.com>
Date: Fri, 30 May 2025 10:39:27 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] iio: adc: ad7606: add enabling of optional Vrefin
 voltage
To: Angelo Dureghello <adureghello@baylibre.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250530-wip-bl-ad7606-reference-voltages-v2-0-d5e1ad7e6f14@baylibre.com>
 <20250530-wip-bl-ad7606-reference-voltages-v2-2-d5e1ad7e6f14@baylibre.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250530-wip-bl-ad7606-reference-voltages-v2-2-d5e1ad7e6f14@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/30/25 9:27 AM, Angelo Dureghello wrote:
> From: Angelo Dureghello <adureghello@baylibre.com>
> 
> Add optional refin voltage enabling. The property "refin-supply" is
> already available and optional in the current fdt dt_schema.
> 
> Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> ---
>  drivers/iio/adc/ad7606.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/iio/adc/ad7606.c b/drivers/iio/adc/ad7606.c
> index 3bbe9c05b5edbc11e8016c995c6ab64104836e7b..4fd9638eb6e56f800c7c97425e45e04f269e3df7 100644
> --- a/drivers/iio/adc/ad7606.c
> +++ b/drivers/iio/adc/ad7606.c
> @@ -1335,6 +1335,11 @@ int ad7606_probe(struct device *dev, int irq, void __iomem *base_address,
>  		return dev_err_probe(dev, ret,
>  				     "Failed to enable Vdrive supply\n");
>  
> +	ret = devm_regulator_get_enable_optional(dev, "refin");
> +	if (ret && ret != -ENODEV)
> +		return dev_err_probe(dev, ret,
> +				     "failed to enable REFIN voltage\n");

s/failed/Failed/
s/voltage/supply/

to be consistent with AVcc and Vdrive messages

> +
>  	st->chip_info = chip_info;
>  
>  	if (st->chip_info->oversampling_num) {
> 

