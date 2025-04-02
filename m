Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F3A1F03CE
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 20:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743626948; cv=none; b=JXJ94Ef++6WDkEM01zshOJoR0Am5qayN1RbDSZIMkIqUYqY3Z6RQMZkcGTOOIw9RKFpo9FRI6FNFnxn11Y+GAg5SxAyUqAS1Ev7/C1aUX+2gmKSidz7fWdmt2EL6Fc6jY5LQhfcsTYpIQSjpKaNY8Drjy6BdfEGGsRFELtgUmJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743626948; c=relaxed/simple;
	bh=H0i2KMBMFcDec5UVW9Y/Y/PbNB6zqGI1enytd6buQDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l9eupsVu9szAhFhl7MoX6DtMa3l6RObDlmQLcL+jAbJTt2ZNTpnwVUOe8WPO+PS0gLT5p+gLBB6IsM6BJBez36PdJV+ObwtKV0zA68LQlsX6RRKRPQ50ql0c0uhJXAD0gvy0u+FWuDZtq33HEiqsYz0W5og/2yOo2/6u+e124oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=kDJBJbiY; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="kDJBJbiY"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-72c1818c394so165803a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 13:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743626945; x=1744231745; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PneA/KGio5qHN0s6LVOkmY0X5eDLJLZ6gsMfj989kss=;
        b=kDJBJbiYfteFc81juiYoMVAJDG5SJd6MpyoqKKF+RRVHg9erbwvDIg5R+bQwjKOL3U
         gkhMj+KOAPp1ZJBNJhjbl3aSdvZB4xIIShUEkY8qoyevxsxhxgIQIzeD1Y3G3eWikIJq
         MH8ibxnDHq+ihiODi+4cZV2KGTN8p0eBsdUS+orw2+bP713fPBqfqGKht/1b7aYg9KER
         EdgMYGuLanXJTDMi53p8ENCExOQ18fGOTH7+MBuiuKihQH9N0np3gpU1rXfvxoU8xpWg
         X9/bEOBjCadeT2M7K6NezmKamu+d9zdd6ryN5SxUZDA8KbRf8TcyKdWXwzxaFnNvlkvB
         NPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743626945; x=1744231745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PneA/KGio5qHN0s6LVOkmY0X5eDLJLZ6gsMfj989kss=;
        b=I/C61P+Tqd0JDq+/LpV9b4YnfwBEcgeWwW5A/7Zhzyqcm0Led/rnC1MTzEsGA+YkFb
         LdDACNUN+QMrlQjz0Rqv5Gln9YxhB8aka7sGYrxoQR4kJ42pQhZkAqhya3V+MFLIZWmT
         /pFtvOs6jPoqJh+2IweJtYGUhWY308Z+LxJDuFxtA2pI/V1Mgm20S/3ovoNZefLhID5J
         KSTRUMMsd9GlNnc8YqAOCzIQ8cbhkj0hW4w3ox/x2F/HiknH3TZzNti86sMI6ukTL6u4
         iG6OwM8vxN1avvdGK9jIPKczItSRDpgv42mRxg9kX9WGgBAbNbjDScjcv19v73EOrONY
         tGiA==
X-Forwarded-Encrypted: i=1; AJvYcCVXMUoo9kTQQXH+kA8uUxMSz520ifLzH87tMykxvL6FwkZZmLzlpAA5tOFw8cpMg+Pthf2Pza3yIDkKORI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/HZB6lwDsTLtvhpsevuPNbUCVTi/PgTLBPD/LMfqHIBeUZAQn
	KV76fB8ISI0O2mzAVCa0Rew7lBxebfM/xZ+QaTS9bIqPPrLgm8nvP9cdSTV7rmU=
X-Gm-Gg: ASbGncvMXSSVqRkUG90s0KnqkrXPnH6us/qNwViZUVXKu2zFavFobacrX2Goms1I4+K
	IMISGan0lFNJjfXyiAjo41ftZnZUVGLFDH3U3n7K4K2163YRygfh2QsPmN/1E9JhoV+xNPOBtcR
	ecCucYZCaPvWB1aG719IDXomAI8xN0Evjugi/Q3p5Sfx1uRK7yGYQZhU3uKSvcKpCu94hcolTCX
	3yExLifDUhLy0bj3Fdu/9ViuJEhSgt8l0TdY7yv9V7Ex8PCluAwnd993CSxqm0dcvow30o8geIo
	DzZWZ6CPy9ayOPK3Qh6jXrxDAnPsDKyqVRlXoLTzL4Yj0V7vim6sU6Nm3lbxfWpZj1HPSnpW6d2
	RYxeQKw==
X-Google-Smtp-Source: AGHT+IFWoCgfUq1vdjqIVUCLEyrdA1VjfKcnGwC3l4aghGm2e9OquWNUwBhki4cUzlNFqajANw0wEg==
X-Received: by 2002:a05:6830:6887:b0:72b:a465:d93c with SMTP id 46e09a7af769-72e258ac106mr2530485a34.20.1743626945226;
        Wed, 02 Apr 2025 13:49:05 -0700 (PDT)
Received: from [192.168.0.113] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72c580d30e0sm2390283a34.37.2025.04.02.13.49.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 13:49:03 -0700 (PDT)
Message-ID: <c42b1dc3-34d9-4419-ae2e-5bacffa070b6@baylibre.com>
Date: Wed, 2 Apr 2025 15:49:01 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 7/7] iio: ti-adc128s052: Drop variable vref
To: Matti Vaittinen <mazziesaccount@gmail.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nuno Sa <nuno.sa@analog.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1743573284.git.mazziesaccount@gmail.com>
 <dda9e0710a9293a9f52e64c092f79afd4b719536.1743573284.git.mazziesaccount@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <dda9e0710a9293a9f52e64c092f79afd4b719536.1743573284.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/2/25 1:10 AM, Matti Vaittinen wrote:
> According to Jonathan, variable reference voltages are very rare. It is
> unlikely it is needed, and supporting it makes the code a bit more
> complex.

There is also around 60 other drivers where we could do something like this
in case anyone is bored. :-p

> 
> Simplify the driver and drop the variable vref support.
> 
> Suggested-by: Jonathan Cameron <jic23@kernel.org>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> ---
> Revision History:
>  v2:
>   - New patch
> ---
>  drivers/iio/adc/ti-adc128s052.c | 29 ++++++-----------------------
>  1 file changed, 6 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/iio/adc/ti-adc128s052.c b/drivers/iio/adc/ti-adc128s052.c
> index 0f93c6266527..0bfe4e558c69 100644
> --- a/drivers/iio/adc/ti-adc128s052.c
> +++ b/drivers/iio/adc/ti-adc128s052.c
> @@ -29,13 +29,12 @@ struct adc128_configuration {
>  struct adc128 {
>  	struct spi_device *spi;
>  
> -	struct regulator *reg;
>  	/*
>  	 * Serialize the SPI 'write-channel + read data' accesses and protect
>  	 * the shared buffer.
>  	 */
>  	struct mutex lock;
> -
> +	int vref;

Units in the name are helpful: vref_uv.

Could also consider doing division in probe and storing vref_mv instead
since we never use the microvolts part.

>  	union {
>  		__be16 rx_buffer;
>  		u8 tx_buffer[2];

