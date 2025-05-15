Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6933203710
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 22:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747349183; cv=none; b=FyiF6PmT0I2VMx/PRfAAHzOtbAsuCLraw9UK00enq+vLKTeK+EixmgOVqMQwNWncKmZfGiPTwJaPEx4KvQ3o+nMUge7FEzgBmLrSSCj5EFMcHM0gQXvbAG2xNWvzkNy2RYWc6iof3Rg2G7la+360y4GKmobsMIYA708WsD0GKpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747349183; c=relaxed/simple;
	bh=Okbe/2KWqIm+KMjrFf4qyw5wHvB0mk7h6wO98sc3Dis=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CjTzPC/qMMKS4Vdo5Ieo87s+XwMRHa4dcu7//huIWx1R+SMrO2YKEb9yoRmJh35YHVhij34VCOE1qUiZzIKixjxWC9rbglkaP1ZF5Y+DKKLIGkmPDZ2fNVNElwcXwJFeDsTYFXXPC5j69DRTedLDhg58ymeyD3OmzSb1MYxm+2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=S6stRaRY; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="S6stRaRY"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-72c47631b4cso1291980a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747349180; x=1747953980; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tT+5zkbFGy9sTtFziMZdKaBTQT2P04GP8qxEZ3+rxaY=;
        b=S6stRaRYD1ieg/ZD3bGSnRW9mEqlnVxYUK/Qldgo0hyWZPdqto6Rf5RQZ7P1Ta3UC/
         wM/GSs8TZ/f+Q7t4et8cnQnmSw16zeEnpHxoaDZlaCkUwFXf6yj32nrYN6EsyvT9/t3O
         ekPr+x4yhN4UG81ApHMs8AFowz5eQFzemEO+tbDOa7w0w3O2EV6+a+P9eNlnSDHmrpPj
         jKVjC9iNlm/RxBxYnYEki/t2DZU1Q3YmQ0ogP+z9tEoASpzSIsi2eYltn51MQEAakuzu
         NpKjgTkat0721kEDBzPAIN9P5MQSsSs9A17IlyNcyBDSAaF12Iabpcu/KnkvzXdP9Cbe
         8Kxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747349180; x=1747953980;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tT+5zkbFGy9sTtFziMZdKaBTQT2P04GP8qxEZ3+rxaY=;
        b=U3Ijzyqy7al94IoKgDqFgrAUKg99bc+nxFWQ/jkOvzBSJYh52c9FVzS0DZhg/d/kdi
         0zcNEHWBf+yidzUfPnkqHAWJfBYRVokEb7+/V+ms/w4fztBDcE7OemHrflhILgHXIgHA
         fWJddmvxvRuu3J9ZztYnAZbdZ7E6AI1gKtBfs734zQyYr62AzeJIyF5HnHOXFM09ECsC
         4pdTN6kqc8WQOYKuxrv7AB6Kzp6zZ7MzRAUTtfA17LgGmefJOkyxhORVT8FBx3zsuSMW
         HQoNwqcIRBCUDf77T3RdQ1IIohy/Q3Y1f2R3yocBISA6+4WDyn1CvI4Z/XvL5WhZqX0z
         l5ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWv4da1Q4UhS6zLo/BR2NJ/h/IcBaYxmm+yTWlIyjE7J2eQn7jEebNNzpiUQQ1EFt1FQk8Th4MZn3XmcLk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzH3uXJ8+UNMt43ak4vF+PJaOzslMeZG8kTPupgGGGIBLClgB5s
	6BnqDA7WLD3Xl6CofiRgQ5RGoRlDWKWiNZlSdHD0S3svBHJYSjYrDviqEVoh4vI5k0c=
X-Gm-Gg: ASbGnctO8jLTha5ozCcmDgsRyDY5IMtUHKGATIy5dm3/QvVjJaxcdLiv2cWi9MbclBt
	nAS0fYpR01XpUOKwYhj5aFsiXgvQ9sto9F+6kLRcIRdYkvu1JcJh7TbCfh3C6iw3dj5/KcvQ9nU
	B4fuCwtcuAYiW2Tftxegm04SQOpThJ4kBFj3W3ouQB9nWuZVUN7U26P4h9zB5EOHqOWa/t6TmTU
	mxymyasUT9TmAdWk6oLrx1h1GD1ynfGK/RxGEm8KO1gSoqk3HQFTbUG2fFgDPc0WN/mc3FUZnBE
	pxrzkmhQY8x3jJvnAbPBVXc9/pC6rCjGfhFFkZW5ZpGOBLKAyrU7PFxKz0pqjACdFUuVUodXNXV
	LlaeO/CVfRAYLuoNk5TNeGz9R6g==
X-Google-Smtp-Source: AGHT+IFhHozagJiiH8lFQ/5BLvvM2ieE+0AF/NY8f1iOOJlNdx0dpvjsxQ1MIqHxkc+4/QrKfbvXUA==
X-Received: by 2002:a05:6830:2a17:b0:72b:9cb4:acf with SMTP id 46e09a7af769-734f6b851ebmr978464a34.25.1747349179789;
        Thu, 15 May 2025 15:46:19 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:d2f:9b08:7c22:3090? ([2600:8803:e7e4:1d00:d2f:9b08:7c22:3090])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-734f6b3ab44sm133562a34.43.2025.05.15.15.46.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 15:46:18 -0700 (PDT)
Message-ID: <4d3b02c6-0cca-45c8-827d-3ab1dac401af@baylibre.com>
Date: Thu, 15 May 2025 17:46:17 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/11] iio: adc: ad7768-1: add support for
 Synchronization over SPI
To: Jonathan Santos <Jonathan.Santos@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Cc: andy@kernel.org, nuno.sa@analog.com, Michael.Hennerich@analog.com,
 marcelo.schmitt@analog.com, jic23@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, marcelo.schmitt1@gmail.com,
 linus.walleij@linaro.org, brgl@bgdev.pl, lgirdwood@gmail.com,
 broonie@kernel.org, jonath4nns@gmail.com
References: <cover.1747175187.git.Jonathan.Santos@analog.com>
 <59f45c9af16fa68f2a479f824129f5a9f2cd0997.1747175187.git.Jonathan.Santos@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <59f45c9af16fa68f2a479f824129f5a9f2cd0997.1747175187.git.Jonathan.Santos@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/15/25 4:13 PM, Jonathan Santos wrote:
> The synchronization method using GPIO requires the generated pulse to be
> truly synchronous with the base MCLK signal. When it is not possible to
> do that in hardware, the datasheet recommends using synchronization over
> SPI, where the generated pulse is already synchronous with MCLK. This
> requires the SYNC_OUT pin to be connected to the SYNC_IN pin.
> 
> Use trigger-sources property to enable device synchronization over SPI
> and multi-device synchronization while replacing sync-in-gpios property.
> 
> Signed-off-by: Jonathan Santos <Jonathan.Santos@analog.com>
> ---
Reviewed-by: David Lechner <dlechner@baylibre.com>

