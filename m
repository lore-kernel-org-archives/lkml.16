Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DFD2A1AA
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 15:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747407983; cv=none; b=dRoiYPUwEIR3Zvypwf4r3wGGkXXV1wJ+UIsgJ9FgouPUx+24ZxzIDccdIeDor6N0bJsUJCYw8A7Z+uWSSAn8qG9hEoib3tkOxSwRFbiXvCWPbm7fvoPR6udVjuxIgCCjEVeBfw1Bb1tSNE1VXYoL9gR3TjPWIiYXA56ln1+QW+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747407983; c=relaxed/simple;
	bh=As7Rkm/JYreRJiwzAowlqj582z5EZuQ3RvoMXzdUMsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=k6nyJDPfUhO4msD/VpwHCIzmGe3Ba70LThEmDanGa20rFIxNU+zrGIBYGZEgYFohL4774MzlCNrw+HIrLAYQMYIpSxJdgtZBVFOP6e5kbC0bAt2l2JA7mD4VBVMRb9RMpOl8LoMFuPQ0Edqo/Ung8opRz2eMtFqkYe+wHTUy5pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=q4k+XqCi; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="q4k+XqCi"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-72ecc0eeb8bso886997a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 08:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747407980; x=1748012780; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6E5sJD07CRMQgKBqZr6EF6WZtkGakiuVCUUKvmHWSCU=;
        b=q4k+XqCi6CkVjqFvF+QpdCdA0dRM9Ik1OSnzeI/SRnsfPPdXP2L0Vkjd4wTpKNzvF1
         JKCjZNEgyllQ8P4uFI78xhGTAh+xZw4AkC+e/qNgH4ejHpfaV/Pxy556oFXYilxXDaq1
         wWfTgQln4YGkWPGfszBclvN7loPMVaSc7dcDGavcxCYyK+ocJD+w2AOnDTE7tTBX6Yk/
         2VO74nLvbtcPOBx/a4stqnXdBwYO9e5qTSRKC+PcqDTIEzNgWE7MHSWGGPzNgzQojff6
         XMoQ+VJtLoC6YsNx1oAZqumDduUeLBUp3x/zSK8km3jpQRKr6MjoAyZmSy2VQid6g5X6
         IUKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747407980; x=1748012780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6E5sJD07CRMQgKBqZr6EF6WZtkGakiuVCUUKvmHWSCU=;
        b=ndvoYYtkttCOPhYwhCQIRSHlLDxeLPbdBMv+DX3FGc5K/L4F7gqM6FXQf4iQo8jH4M
         /6eKOaBpawowCLR+gxmTLSm6lzPzW7qiosPfn9Pc290pPjrJx7R6wJHnKRNIwEGYgAIw
         ZNsQjwYp8U9Sj3Zemdc2B1/OTmVjUGCoSE630Sn2D09NEOPLY8rBpjN1F+PY8g2bhgH6
         HYdAEiWMxEDxOiLDHkX0JlTg48dJ6KBrQvrV26hlDAEH4TMMUroXOCeDdnrEVCyBPKca
         iW9UI+Z8CLA6SogmkLlbVNlVJb7T0TADx+w3c+qOmK8DhP8/uio9trO/yS1EmMUjT9Hj
         pTKA==
X-Forwarded-Encrypted: i=1; AJvYcCUeh1otVH4KiQaLJWHdzmodmc2V6aL9hUTVcVkpzvP/oJtxXdgY/1TM0V7uP04zo0czbLxcINLN1UgAw3c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsYNHuwu/KirMo8BFhHn+MdenQEyxvRZkUIVldnaalwX4Zv2op
	MSq4u/6r8rMMmrXfP2/cdsVP+ffKALMrDUgfiRU1rbnh7t6TPp0MnTEK9rvdcC/CnkM=
X-Gm-Gg: ASbGnctPcVRrOcyVT3Dj2lPO+mVJrj0nXgWy8EwyZ4wWCrOPr5Z1vsUToHBLyeAdmRA
	9+sji1VLxmKc30yPtUcR82N84ZQbXv4W3wexGa0v2xVXz8okd0unBlKSFobAJzXEQo0xITZKGqg
	dm91WB19V0s5c73F4M/lAe2gU/qyZ5+mjkOMD4qsmjMEAOjKO5Qle+7/mx+wbNvUM4Mv2N0Nvcx
	9OYzXIXn7a9oKZTQZfm7/145ydH20fftBM35scGDT5jpdbVhH9O34aKovAerk6azTm1CRHTFrfw
	kjhxddqlshBQZMaTIMTyiQn8CYCZkt/XyyGu46XCaIJKy9CRhOeU9SQ2MTmkv9zf3+WSQHUKKJZ
	W9iAn4O9Ty43E/nIDfDMisFTLag==
X-Google-Smtp-Source: AGHT+IFNOC7/t80C43iYWbNQzEGuk10Mb1xdW6ECIzwFbq1f/1fkIf8gMb9rA6Zq8f1jvKiFz3JtFA==
X-Received: by 2002:a05:6830:658c:b0:727:372e:600e with SMTP id 46e09a7af769-734f6b1a0cdmr2441246a34.14.1747407979684;
        Fri, 16 May 2025 08:06:19 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:d2f:9b08:7c22:3090? ([2600:8803:e7e4:1d00:d2f:9b08:7c22:3090])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-734f6b39e93sm372843a34.54.2025.05.16.08.06.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 08:06:19 -0700 (PDT)
Message-ID: <8e5a9176-1652-41a5-bb8c-cea0d44e4d2d@baylibre.com>
Date: Fri, 16 May 2025 10:06:18 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] iio: backend: update
 iio_backend_oversampling_ratio_set
To: Pop Ioan Daniel <pop.ioan-daniel@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Sergiu Cuciurean <sergiu.cuciurean@analog.com>,
 Dragos Bogdan <dragos.bogdan@analog.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Tobias Sperling <tobias.sperling@softing.com>,
 Marcelo Schmitt <marcelo.schmitt@analog.com>,
 Alisa-Dariana Roman <alisadariana@gmail.com>,
 =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
 Herve Codina <herve.codina@bootlin.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250516105810.3028541-1-pop.ioan-daniel@analog.com>
 <20250516105810.3028541-2-pop.ioan-daniel@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250516105810.3028541-2-pop.ioan-daniel@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/16/25 5:58 AM, Pop Ioan Daniel wrote:
> In the function iio_backend_oversampling_ratio_set the chan parameter
> was added. The function can be used in contexts where the channel
> must be specified. All affected files have been modified.
> 
> Signed-off-by: Pop Ioan Daniel <pop.ioan-daniel@analog.com>
> ---
> changes in v3:
>  - fix ad4851_set_oversampling_ratio function channel error
>  drivers/iio/adc/ad4851.c           | 6 +++---
>  drivers/iio/adc/adi-axi-adc.c      | 3 ++-
>  drivers/iio/industrialio-backend.c | 3 ++-
>  include/linux/iio/backend.h        | 3 ++-
>  4 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iio/adc/ad4851.c b/drivers/iio/adc/ad4851.c
> index 98ebc853db79..fccfca256670 100644
> --- a/drivers/iio/adc/ad4851.c
> +++ b/drivers/iio/adc/ad4851.c
> @@ -294,7 +294,7 @@ static int ad4851_scale_fill(struct iio_dev *indio_dev)
>  }
>  
>  static int ad4851_set_oversampling_ratio(struct iio_dev *indio_dev,
> -					 const struct iio_chan_spec *chan,
> +					 unsigned int chan,

I think passing the channel here is misleading since this is setting the
oversampling ratio for all channels, not just the one specified.

I would suggest to make a separate patch that removes the unused
const struct iio_chan_spec *chan parameter first.

>  					 unsigned int osr)
>  {
>  	struct ad4851_state *st = iio_priv(indio_dev);
> @@ -321,7 +321,7 @@ static int ad4851_set_oversampling_ratio(struct iio_dev *indio_dev,
>  			return ret;
>  	}
>  
> -	ret = iio_backend_oversampling_ratio_set(st->back, osr);
> +	ret = iio_backend_oversampling_ratio_set(st->back, chan, osr);


Then in this patch, just pass 0 here instead of chan with a comment that
the channel is ignored by the backend being used here.

>  	if (ret)
>  		return ret;
>  
