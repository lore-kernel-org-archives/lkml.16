Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCB6154457
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 19:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738611647; cv=none; b=XpsbmBOzy8XxQUS7JyFxE/hf6HtMw0v6w5tA2i7PozLregTs3Ok70gw3J61LgUaXMmF5Ixqyx8fotoGE8nKPuzWtY8SnLBWxMi9tJ/1OSHejMT7JmPFl3GC+LY2faREV0D++mBIx4RN/HQBYEPlTCuW9G+KjnRfYbkT2C9Ol8j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738611647; c=relaxed/simple;
	bh=4w5hI182C7EhB0pdVM2nhPdeGiASHD7UyoPbGWvGjIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r09XnJpaKXIQmVRqxgBzG21vyv7BpTGtj4216vPlpFfvIMrKBeDIE4SBAhXnrVWbmTFzwM0Rgzockwa0nQnm3mTLMyeml4jBNMF7sD3LL49Dp6Qwv/Yym+nM14wdMAvkHZmtMl6mLEQDSfpmuJAm8Oq58ehwnqDv4lWpXdD9X44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=okSaF/aR; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="okSaF/aR"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3ebadbb14dcso2039106b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 11:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738611644; x=1739216444; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9uBq3XbrrzPz0mKVXuQDtYlXTInCQgyur/dXytapL4E=;
        b=okSaF/aRa1wvAE2zHQCNGL7paMGYWuTveHAxfqOv+Du9H0Yg2kikMImGsGFPrav91t
         +NnhObqDIg7pj1lDx7zF+XPdN/qDz0kxp6Yn9/eTEfW6Tf8C6GfFwDWQ2V0RsQr8D2Ws
         2n9yoX/J3v5FgEEIHy0zs5nLK9yMDGmwTmqrdpl8jd4xEN9ZBo/Q9JS+hgoHh6QNDMcg
         hW+DStHzsXWjgwiNvui3ACKjFkArMGzxnwX0lMv6a+ILu7/5uK6+OYW0OHiNvalO6cOF
         PFxSkb65BJBfr7ZEtHzpzYS4Hjz2Rmwjc0HRFro895a+bEVYyuIdj7aELCXW5JIVZ5/E
         7E6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738611644; x=1739216444;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9uBq3XbrrzPz0mKVXuQDtYlXTInCQgyur/dXytapL4E=;
        b=qA6255D63iTflUf5vMFA4C0O1XvoKU6/4Xggl3Xrby0kLrEY/5S8RxcQRx6X1V3UmR
         8SQlrP6t6T37kk/MAGBnEJSQVDDKfQ8lionh33UNT/cmIGWL0CzxUDNUs6nt9nBNBHcM
         +6PPWEMbqKy8mrBYRLKdlqEB03VKQ4oSKFkdsKlOF4YcDFYuUFJ3pUmgJh/FaJB8806+
         9M91Xvf7ltjX5n0BWhQPNzV9Z46X58tTFQnNyHexHBKcCEV0mHoPaG13iSK02bYPgfvT
         o9gl18mqExKRKgf/3myFVGeJwMwpg2xXAtv4yLQLoyQ0tpG2OnOqhv8WDexhzxpLXKtd
         FLzg==
X-Forwarded-Encrypted: i=1; AJvYcCUivEjmsmHfrxfHddDmxgsQpYLNK4+9FVSHQ65f4OIcNh4n4reRsa6EB/zZMWAt7qGjFTLKv9ewxfTqcdo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9Ng3Y80d6bqXpZM+0qhA1NuhAC1CjO7fE1/fjUsPXZGbLkIc2
	UaimyVSQtPrwD9CNNrl8lXgGIoF9vvgUFswUuCqMNBEEgTnXWZHH9ybH8Lqij1Y=
X-Gm-Gg: ASbGncu6PKkJA99hwEW/ozjDedPf38+1ttfZ/wkh6z1LlVBTbkSFPy6sfbL4rbjFOqg
	g3D06oPAJUgam8V6v8WpRWQOhfysIQr1HY24vRwZ0a8FVnWpJ5rZ8w1K4GN44GoGezhzUZN9npH
	iIO0sJsCwU20J/5JfNYTZyhfDZoaze0SMUa5t3PLfuWZVdA0kmnNxq+NgRfmsV+JBzRG1wBVRds
	N2AhxBb6SM7JuwyOEDbMppaCa/WCUhaM8QWFcDpTzHpdqrM+iJzVbGYPed3rKM6cJe8OtzJllOe
	LJwusmWB0ji6kcs8nTh4yBDu+8lv2hIy0YmVfW+4HJTEqT2ij8ul
X-Google-Smtp-Source: AGHT+IFStWlddd/hN330V2jKOqC9rdF9kDVFIFEz3wnO/4AylHuxPEivSEkFzdJ/qetqDYyi/+6s+A==
X-Received: by 2002:a05:6808:1a06:b0:3ec:d30f:60e3 with SMTP id 5614622812f47-3f323b7318amr17300136b6e.39.1738611644653;
        Mon, 03 Feb 2025 11:40:44 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726618b9f7fsm2907374a34.43.2025.02.03.11.40.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 11:40:43 -0800 (PST)
Message-ID: <2f71bc82-c2c4-46d0-ae39-abfa4f2e8dc4@baylibre.com>
Date: Mon, 3 Feb 2025 13:40:41 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] iio: adc: ad4130: Add filter_type attributes
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: cosmin.tanislav@analog.com, jic23@kernel.org, lars@metafoo.de,
 granquet@baylibre.com, u.kleine-koenig@baylibre.com,
 marcelo.schmitt1@gmail.com
References: <cover.1738608986.git.marcelo.schmitt@analog.com>
 <77e5eb540e5d425016ea77a641e16cd31a2a761a.1738608986.git.marcelo.schmitt@analog.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <77e5eb540e5d425016ea77a641e16cd31a2a761a.1738608986.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/3/25 1:11 PM, Marcelo Schmitt wrote:
> Make filter control also available through filter_type attributes which are
> now standardized in main IIO ABI documentation.
> 
> Suggested-by: David Lechner <dlechner@baylibre.com>
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> ---
> Hi David, I forgot to ask if you wanted it, but I've added a suggested-by tag
> for your advice on v2.

OK with me. :-)

> 
> Thanks,
> Marcelo
> 
>  drivers/iio/adc/ad4130.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/iio/adc/ad4130.c b/drivers/iio/adc/ad4130.c
> index de32cc9d18c5..66097ff65740 100644
> --- a/drivers/iio/adc/ad4130.c
> +++ b/drivers/iio/adc/ad4130.c
> @@ -942,6 +942,9 @@ static const struct iio_chan_spec_ext_info ad4130_filter_mode_ext_info[] = {

I suggest to add a comment here to say that the duplication is intentional and
the filter_mode attributes are for backwards compatibility.

>  	IIO_ENUM("filter_mode", IIO_SEPARATE, &ad4130_filter_mode_enum),
>  	IIO_ENUM_AVAILABLE("filter_mode", IIO_SHARED_BY_TYPE,
>  			   &ad4130_filter_mode_enum),
> +	IIO_ENUM("filter_type", IIO_SEPARATE, &ad4130_filter_mode_enum),
> +	IIO_ENUM_AVAILABLE("filter_type", IIO_SHARED_BY_TYPE,
> +			   &ad4130_filter_mode_enum),
>  	{ }
>  };
>  

With that...

Reviewed-by: David Lechner <dlechner@baylibre.com>
