Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE5F223DD5
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 23:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750115441; cv=none; b=FdRnHbvRYGBMzPZ15pEQSM/0/V1AAaJlY6BXjoHykewX+83rcvtnY+VFzSvC5jdVce617+V3jZHPPCnBlOqfHd3mk+1H9C35FXviyZsQQz/LWjPzMQ5vogpxEgyAJCnUdpFn8VYeh4Q4vg9tpkzq9XKxG+chnkcwAFvmm7nuFBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750115441; c=relaxed/simple;
	bh=Sg/Zeim155lPoBlFzQfHz+7xJEIx+3K9aJFJCsa+t9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oH1ryCtlUAq3gnNOE5Sih+bfxY7MAsX1Y9TGKPHpdrgtXGhjqdNhlgz5CHkWThdwwccKKPA5k3n0gsYqvTRJRJIlrsjjDwKi7T1/wzPl3z0Pi+SkpYenXOhQyM/PN2IZwACestBEg2KbqNOcTj0i5MvFvYHay7GoWelK2doPGic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=jINVkrGZ; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jINVkrGZ"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7382a999970so3333779a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 16:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750115438; x=1750720238; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZhqwSDdN0As9EP8iCCAnsHFrVsuS6BmzZLRtm9F+Ab4=;
        b=jINVkrGZBWazZCfJTImqGL6jTnWdvwBZ+0zBKRsaphS95mW8HkhAXJGBuVf3nqR5VJ
         B+09AiZPh+XRbbkKVNbCzrvnvFSpU+Qj6yy7SQVUapFXBupuIoQBtTFd740OwN2uofSA
         33zLhZf/YGbx3iH6wyxxoSF1NqngJ83IXCS5aqin5SEy4OqG8C/dVlwUuaSgcSOXbuIs
         iSL+CcL5OQ+2tdMUXTevIJxB7hI1ziXD2Au1rUUqU+ttKkp5r2+mncYvp5tU/zyzYtJl
         eRtZ7qzQhx0VqYcQtzSrlTlwlyXdxS2GNROl1qK/BdI5Vx3zlztjVkJEOwekR4+xGdiX
         HelA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750115438; x=1750720238;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZhqwSDdN0As9EP8iCCAnsHFrVsuS6BmzZLRtm9F+Ab4=;
        b=VAaSxuGcmT8G4LqAVn4FaK0j/I9PBKb6C4cksCalqpmijOLraPisEYbIPiZMF8i1RG
         5uURA2J4d+iUT3jUbPsK1rCc3Pu1JjhSofAonljj5+SjFReSDW3XmXxC5nfi0LIAFpfm
         WY3CJBvQuiqC65NsKap/0Y/6+RL+QTC6yWXL3X5QL+ia8HsQ+/GIcJh4HFwJ8L7DAz5L
         oWPpyrvr+wSt3JMAd0tYn7fJpaWXXbEuOBsQmhVTcGnhNTdgixNtPkLMl0ApU5XU9ng0
         cR5POXfteZf7lOD4Ubo6j0KJG+F1snBmkmsN29TzoUuOaAqxs4ddfsp71T4pi4gwrTkZ
         EI6g==
X-Forwarded-Encrypted: i=1; AJvYcCVMLceiQQ+tpkITTc7zDq++LYH7hwBiuxG2MsSQ7UrRwjJ1bpL17hGxz5ahWXBni+vlQP3IJtG/EMXgfo0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo1R2QYBnKt6kCuBHc4QwMbqZvhtYgYcrZSBFNSQYuRJ6SQIgS
	7qxnc7qtjQ31VUpJ4I2JYAWo9goppnZSAWfPj869kwHesvARnS/lN2fgSymX0fHIwuk=
X-Gm-Gg: ASbGncuSvJ9/ZV6SBDCoBztr1kgMeQt2LTjoK551NSH2XgM0uJ6kPTqn+lN9/FVyMjt
	pMN+hXwj3snnsZ20lnTkahDdBT6toWLSsKBfYnwHNVZrHA4Z18BmuC2dQRam5jJ+EQnbq2Hpim9
	IQPbdlU9lOsa/Lrng0u9nqZYgJ/P3/9Ve0rMVIU1mZLE+qNipPYAE3clM+36eZkQ2NUbano1aWS
	4YbyQBid72tsZ0C5rEjUTg+Mrpmed97sM9+5Vu976N8twimVGGdKadCkTSA723h9F5gUvrFVy9G
	IzVrpx5frWVC7F0SfXvRjBJQC1choXtHB40aJ8CDNQFOIPknTVvfFQLoscq7DHFpMr0mMtQ9V7d
	RNZWbn4glCVg8NESYzAm44Q2RMzkXAr8iAp08p20=
X-Google-Smtp-Source: AGHT+IEWczTOKpxrX7Kq4OJFYfDdAA9v5c0yaK836ViXrpfcsn3PHuwhhvfHdkmxcH18lsKBAQA0YA==
X-Received: by 2002:a05:6830:2908:b0:739:fe04:7aec with SMTP id 46e09a7af769-73a363ed869mr7767099a34.26.1750115438134;
        Mon, 16 Jun 2025 16:10:38 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:9583:1e37:58ed:10ae? ([2600:8803:e7e4:1d00:9583:1e37:58ed:10ae])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a28554581sm1377254a34.61.2025.06.16.16.10.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 16:10:37 -0700 (PDT)
Message-ID: <e4d80845-ddf4-487a-8ad4-c9429eccea4c@baylibre.com>
Date: Mon, 16 Jun 2025 18:10:36 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] spi: zynqmp-gqspi: Support multiple buses
To: Sean Anderson <sean.anderson@linux.dev>, Mark Brown <broonie@kernel.org>,
 Michal Simek <michal.simek@amd.com>, linux-spi@vger.kernel.org
Cc: Jinjie Ruan <ruanjinjie@huawei.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
References: <20250616220054.3968946-1-sean.anderson@linux.dev>
 <20250616220054.3968946-6-sean.anderson@linux.dev>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250616220054.3968946-6-sean.anderson@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/16/25 5:00 PM, Sean Anderson wrote:
> Currently, selection of the upper/lower buses is determined by the
> chipselect. Decouple this by allowing explicit bus selection through the
> spi-buses property.
> 
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> ---
> 
> Changes in v2:
> - New
> 
>  drivers/spi/spi-zynqmp-gqspi.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqspi.c
> index 595b6dc10845..add5eea12153 100644
> --- a/drivers/spi/spi-zynqmp-gqspi.c
> +++ b/drivers/spi/spi-zynqmp-gqspi.c
> @@ -465,13 +465,13 @@ static void zynqmp_qspi_chipselect(struct spi_device *qspi, bool is_high)
>  	genfifoentry |= GQSPI_GENFIFO_MODE_SPI;
>  
>  	if (!is_high) {
> -		if (!spi_get_chipselect(qspi, 0)) {
> -			xqspi->genfifobus = GQSPI_GENFIFO_BUS_LOWER;
> +		xqspi->genfifobus =
> +			FIELD_PREP(GQSPI_GENFIFO_BUS_MASK, qspi->buses);
> +		if (!spi_get_chipselect(qspi, 0))
>  			xqspi->genfifocs = GQSPI_GENFIFO_CS_LOWER;
> -		} else {
> -			xqspi->genfifobus = GQSPI_GENFIFO_BUS_UPPER;
> +		else
>  			xqspi->genfifocs = GQSPI_GENFIFO_CS_UPPER;
> -		}
> +

We could possibly drop adding the SPI_CONTROLLER_DEFAULT_BUS_IS_CS flag
and handle the fallback here instead. Like this:

	/*
	 * If spi-buses was not provided in devicetree, assume bus is
	 * the same as chipselect (needed for backwards compatibility).
	 */
	if (qspi->buses)
		xqspi->genfifobus =
			FIELD_PREP(GQSPI_GENFIFO_BUS_MASK, qspi->buses);
	else if (spi_get_chipselect(qspi, 0) == 0)
		xqspi->genfifocs = GQSPI_GENFIFO_BUS_LOWER;
	else
		xqspi->genfifocs = GQSPI_GENFIFO_BUS_UPPER;

>  		genfifoentry |= xqspi->genfifobus;
>  		genfifoentry |= xqspi->genfifocs;
>  		genfifoentry |= GQSPI_GENFIFO_CS_SETUP;
> @@ -1316,6 +1316,8 @@ static int zynqmp_qspi_probe(struct platform_device *pdev)
>  		ctlr->num_chipselect = num_cs;
>  	}
>  
> +	ctlr->num_buses = 2;
> +	ctlr->flags = SPI_CONTROLLER_DEFAULT_BUS_IS_CS;
>  	ctlr->bits_per_word_mask = SPI_BPW_MASK(8);
>  	ctlr->mem_ops = &zynqmp_qspi_mem_ops;
>  	ctlr->mem_caps = &zynqmp_qspi_mem_caps;

