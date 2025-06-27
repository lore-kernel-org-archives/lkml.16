Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3614E2D9787
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751042025; cv=none; b=AatPqCT3YAQoOFVlXO6jE6+ob85kCZWFsvO/VKUQC+RuiEy3v8ef3uph+3YR9iPmDpKiF8mcMCHHe322XLsVi2xUhxTxT6F1kSNSsgrvEuqKk03Y6AG1HXvC2dZxCTSkE9hMu/6GLXqsHE1XC/xQ1tgqtr91Va+iK9CnJQJiuiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751042025; c=relaxed/simple;
	bh=dXpLHx9bw5vHEwTl6YxNtXihrgpgrvwSzKzcW4eOMZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l20b9EbCjqTdvhrF2cuD+IuzZ5DzrKYXfWBpijhY0z4/eXEQkETBi7jbZ+Uuxq5YwDGbUKCISy8SxL8umArUNqbggSKs2NIkIf6AnwoCmMOis4WIBJT/Q2NqlGRjFgpWzvs1ohOmCfWMmhqMkovGc89KPSNCJS28axX9pth0N0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=QNBLUm4o; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="QNBLUm4o"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2e95ab2704fso45422fac.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751042022; x=1751646822; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bmp7ryV5xjFvyB+Tl1aiIRJO+LGmYWq5ipUqtE2nDIk=;
        b=QNBLUm4o1dAn/I4+sFGYz0LNxVxmrGf3w9+z0HVb6ed3LkpKV7C9zk0iQVRO1Y42GF
         jTzJb4axom+2E95Jjuo1bEgLcJYEVlSwmsx3VjnHcqg4i4CX4ynW1n5jlxxSfKtN3IbQ
         bcbG57EeIJfMbTSx8DDHV4+UxW7r4gtvnFy1z7qKIEj1WUE2KHyEhh2THQdNAfpDiAHc
         HCz1nE0wSdsFHbajU9lrHY7k9EFHhGUDD4pAgNU84zaENxdGC0dM9RgJxM4gdTX6RAJU
         Y2o6JA1f2t/DIdhG6n+uBav6eo8Z6R89+3qt5MkFzZzimct9bC3Cn44YSwSPn/J2hxWN
         9rdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751042022; x=1751646822;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bmp7ryV5xjFvyB+Tl1aiIRJO+LGmYWq5ipUqtE2nDIk=;
        b=YOmMf9kj732Rsd6nK0LlaaXXLUKmLdAOQfgxFkZ6TAGOjQqamKkmXMySb2rW2daeO5
         bpPG6mTLlfb+DYwAK1bCY+ci0bxlxOXRhiZfOE+vIuAJ7BbPTezsdAyuP7CThjK/jk6V
         AD+xYdqKjpFApD9v0Dl638qDGP0NLuGoyrS8qLG7DphgpC2XR88/Zay3YMJ1OgUcnhJv
         hX8/asU7PFMd1IPIqQQoEplGTq6QeOgPc6hIjN0RErIE2kESGrSkGBOaABnjfvhdP6+s
         Rke0yQMsxnzNv2QN4FaP8f+pyd0/I880wTI9T0jdjHnTk3S/aT03fye97lySuN9FAmau
         aDSA==
X-Forwarded-Encrypted: i=1; AJvYcCX0MYZV3c/YdDaUf7dtJDhmntOAIgTrAuerqXjBRWzIeQTsM4pxFJcj22FjYjzHQpbjadQYd8OBHUqnXXI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2lSgNiZlBf1UpqV4O1zZY3xYNkqQID6u8wFWo5JV4m9x1HMSu
	GZ2i+g6CGjhuMCjLBXufdUlr+TMvm9lIH1WhcTbCWnWAvZfxyrh4fYMMkjDlULYqMpk=
X-Gm-Gg: ASbGnctjd0y4WF0gEAjVDmxPAhuV5Up0w8VNSwxWt/TeJh3ZGZheD4fDcWOWDO7Zzsx
	IsLWZjHQko1OQQ9J2ISThAYUi0iCr3ZEi5x6zEBau5PQjujCdNNUAbY0wgMehzVBkOr+s8TMa6O
	1ZtCcR1yr6Euy9S3/vARIar45EyMYjE4AKgrKEpyatWn8yez69faADzDzzxuf/GlrD7tecQdAV7
	2NCO1DHVjjmt8reQbOUDXGBQiAE/D2GNTfytis64WctiiYaRZAvAgw68gOaWRJXUFZOKm7tUHcH
	Me4EEoJnqXgAlLdIGmfQH5DUYL/oA0Qy7tGLR69ELRnRgCBk7rykgZ8mSOaNpROz+sAdNM3lSNW
	2HlPUy/DwuX96JMudh3eEgM7h2ZpLLqvtjNb2
X-Google-Smtp-Source: AGHT+IG9PvaUabFgVJrthR0i8DVI9WzDhHa//CNFrdsvKRueO/M97DcW61/F3jaCSrG4SYNr0EfeAg==
X-Received: by 2002:a05:6870:9450:b0:2e9:9e9:d94b with SMTP id 586e51a60fabf-2efed8eff8cmr2582939fac.39.1751042022103;
        Fri, 27 Jun 2025 09:33:42 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:1715:453e:e133:7d6? ([2600:8803:e7e4:1d00:1715:453e:e133:7d6])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd4ea5a35sm946883fac.2.2025.06.27.09.33.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 09:33:41 -0700 (PDT)
Message-ID: <1a8dc586-6f22-4583-8692-084813f2df7d@baylibre.com>
Date: Fri, 27 Jun 2025 11:33:41 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] iio: adc: ti-adc128s052: add support for
 adc121s021
To: Lothar Rubusch <l.rubusch@gmail.com>, mazziesaccount@gmail.com,
 jic23@kernel.org, nuno.sa@analog.com, andy@kernel.org
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250625170218.545654-1-l.rubusch@gmail.com>
 <20250625170218.545654-2-l.rubusch@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250625170218.545654-2-l.rubusch@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/25/25 12:02 PM, Lothar Rubusch wrote:
> Add support for the single channel variant(s) of this ADC.
> 
> Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
> ---
>  drivers/iio/adc/ti-adc128s052.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/ti-adc128s052.c b/drivers/iio/adc/ti-adc128s052.c
> index 1b46a8155803..cf271c39e663 100644
> --- a/drivers/iio/adc/ti-adc128s052.c
> +++ b/drivers/iio/adc/ti-adc128s052.c
> @@ -7,6 +7,7 @@
>   * https://www.ti.com/lit/ds/symlink/adc128s052.pdf
>   * https://www.ti.com/lit/ds/symlink/adc122s021.pdf
>   * https://www.ti.com/lit/ds/symlink/adc124s021.pdf
> + * https://www.ti.com/lit/ds/symlink/adc121s021.pdf
>   */
>  
>  #include <linux/cleanup.h>
> @@ -110,6 +111,10 @@ static const struct iio_chan_spec adc128s052_channels[] = {
>  	ADC128_VOLTAGE_CHANNEL(7),
>  };
>  
> +static const struct iio_chan_spec adc121s021_channels[] = {
> +	ADC128_VOLTAGE_CHANNEL(0),
> +};
> +
>  static const struct iio_chan_spec adc122s021_channels[] = {
>  	ADC128_VOLTAGE_CHANNEL(0),
>  	ADC128_VOLTAGE_CHANNEL(1),
> @@ -143,6 +148,10 @@ static const struct adc128_configuration adc128_config[] = {
>  		.refname = "vdd",
>  		.other_regulators = &bd79104_regulators,
>  		.num_other_regulators = 1,
> +	}, {
> +		.channels = adc121s021_channels,
> +		.num_channels = ARRAY_SIZE(adc121s021_channels),
> +		.refname = "vref",
>  	},


Let's try to keep these sorted rather than having rohm in the middle
of ti chips.

Same applies to the rest of the changes in this patch as well (other
than adc121s021_channels[] which look to be in a logical order already).


>  };
>  
> @@ -207,7 +216,10 @@ static const struct of_device_id adc128_of_match[] = {
>  	{ .compatible = "ti,adc124s051", .data = &adc128_config[2] },
>  	{ .compatible = "ti,adc124s101", .data = &adc128_config[2] },
>  	{ .compatible = "rohm,bd79104", .data = &adc128_config[3] },
> -	{ }
> +	{ .compatible = "ti,adc121s021", .data = &adc128_config[4] },
> +	{ .compatible = "ti,adc121s051", .data = &adc128_config[4] },
> +	{ .compatible = "ti,adc121s101", .data = &adc128_config[4] },

We'll need another patch to add these compatible strings to
Documentation/devicetree/bindings/iio/adc/ti,adc128s052.yaml

> +	{ },
>  };
>  MODULE_DEVICE_TABLE(of, adc128_of_match);
>  
> @@ -220,6 +232,9 @@ static const struct spi_device_id adc128_id[] = {
>  	{ "adc124s051", (kernel_ulong_t)&adc128_config[2] },
>  	{ "adc124s101", (kernel_ulong_t)&adc128_config[2] },
>  	{ "bd79104", (kernel_ulong_t)&adc128_config[3] },
> +	{ "adc121s021", (kernel_ulong_t)&adc128_config[4] },
> +	{ "adc121s051", (kernel_ulong_t)&adc128_config[4] },
> +	{ "adc121s101", (kernel_ulong_t)&adc128_config[4] },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(spi, adc128_id);

