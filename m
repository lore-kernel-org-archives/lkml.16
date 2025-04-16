Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705C7171658
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744815378; cv=none; b=nEgFTtn9xOqxRgS08gS3bBmzgqvDWG3Z2Soi04TFrQGqewTcD+d7eANRVUxGFAKasIgLkPAVfoj2Lhp6je1BlMMcboPunV5MrErHuf2SUoY6Zx8PNUVU1xn/7tGIIS4fspFeA4U6UnHcHaAzpyqePQp2qmodt1OXRCWaFM8d4do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744815378; c=relaxed/simple;
	bh=TpJkuyVyiGKbiCkxT8923fCXqjl1DNCwQm+CCNcVdJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nYoirgLC9VaRO/FUzjdBCCBkUL1NSnfZlDPPHAql/1Oo9wuu1otmfnhGNv0AeHpmNTmVacImQ1YCy4Ovm3ykOIWanliWK546MHPtbgFpSWikMOk6iW9ppabdtGKbWCvjpXauMCcI59Wjr3VBLQOJvAkJ6sUtoR5IqZwOWvz49rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=cqTapv4o; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="cqTapv4o"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-72c14138668so1731353a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744815374; x=1745420174; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H8pTGTrXsv1bU7lsSy6vhbggWvwnaQhyzXjfsFA3qKU=;
        b=cqTapv4o95ToTaNomeYqjiq2psvCA9vXOdein6A6R/XHMprlApK1LR/tTYaHviIkLN
         D8m6QSDYhvhe+sUPhlj8ZXkZ2TZ9I5S101hks9hFvEpIgYd0C8lc/u0ImfAUriZEmhb0
         W3QaI4//C4b/0mmCUenDFhnYhUpW1OUJ3ciDC4/UgsIT9aznGIWfbqPOJl0SF8LIeZEx
         i015Z6HiCq5k+vKAC5Dm8vtVOGq1vJCiJPGd5/mGDOVJasXdD8OKDhP9sU+NNMxXlTz8
         gg5TgS+HiL5kZ+4W3tGwQlGjOadaO+Kyr2Ydod9dPmFOSvEBk74TjkWjXveCAsEbIg3a
         bbCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744815374; x=1745420174;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H8pTGTrXsv1bU7lsSy6vhbggWvwnaQhyzXjfsFA3qKU=;
        b=Mt3T7j4sNmxpWOV9y3jWWywZibvcIlJMr/j4Ox+dZgLVtaR54wdaSHnNWQZn9LQMbM
         p5Pm7aQnX60RUJL3ubbnekyGAFg1XRKd8GM0/kLshD7ULjtb8ML+aFDfoViX1vpOB/E4
         A/IbU74ffFJ/y2TG9GAlb+9ztjpie+XfO9PFSkzfxT/VwtlNDEQ8GdXMzBFrsSlsyQoY
         EkE6TtOcEu6k4K9Ts8YPmHP1ILZQ4A/oWfRhJzJysCgD2hzC9tp29niMAbMI1coK/9Gw
         zPolnjvfxOkoWhFobDj5DlYYPk1aeCbSShF4X6hqUF0V2jxxwyFK7AxDCCIkXSA8rNBd
         PxqQ==
X-Forwarded-Encrypted: i=1; AJvYcCURBzB9Z4/ZISRhXdS7FAUVeeJYLUvkqP8QCYwv+/X37svaVvhfSC4NUXcsF6J+zRWPUgBGjgCClTm1eIY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw14YunzkaT+AGaJLJd4h3N7nvciUMOoIcsCCvIH7Cpu7Im2QNo
	g/ealkWLyT0egXrJdyLyxIifAbGHg9bZIaEwnUZ0EwmgnslvRamoRTOYRmFYeCI=
X-Gm-Gg: ASbGncvLRxYIC170DdFQdQna91+lhvAAVFKlXCUe8Ki0VA8V0AnnvwqiZtU1JAaOVEv
	knyjNEuUAeAuW1rWbRg2Q5o7SmkLBslfZcC5XEwA1DKJNqE7Fgz/lT1XtXACSoxsuMMHXWmHWvP
	0iTXECaRcvOtosYr/UNPN8oNPUTfCNl/0AIN12zhf7zgPUlFI9rsN2TblhozppUg6iteIFjkpIc
	QszRWizfgEE8zVfUnK+T2xpnRZIc9NhRsGTLXwqDSmIeMhzSxdob+QRg60uMwBbAI1ZuAcAtTZH
	DBjmFM7jYwJwjFvWlAQiUI4yRJzShEKxp2RarWlhflaE2QXIY9eS7KALa7R6FzHtS4O7cD3EcuD
	m5KrJZ1RylF/VxcIvYbuTDGBwOjYg
X-Google-Smtp-Source: AGHT+IHdqhtFZPPAlHvZWZ21iQNUSR5yWEe2y+iJIz1IDF8U/7b477uDDwHean2EZ4U2BNcEasuINg==
X-Received: by 2002:a05:6830:2a16:b0:72b:7fc2:2f1 with SMTP id 46e09a7af769-72ec6bb9ca3mr1506039a34.12.1744815374378;
        Wed, 16 Apr 2025 07:56:14 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:58f0:670c:6b15:7fd3? ([2600:8803:e7e4:1d00:58f0:670c:6b15:7fd3])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72e73d8cc9asm2849274a34.30.2025.04.16.07.56.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 07:56:13 -0700 (PDT)
Message-ID: <bd28d718-ab7e-4470-a4de-22b995db8b94@baylibre.com>
Date: Wed, 16 Apr 2025 09:56:12 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] spi: Add spi_bpw_to_bytes() helper and use it
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250416062013.1826421-1-andriy.shevchenko@linux.intel.com>
 <20250416062013.1826421-2-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250416062013.1826421-2-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/16/25 1:16 AM, Andy Shevchenko wrote:
> This helper converts the given bits per word to bytes. The result
> will always be power-of-two (e.g. for 37 bits it returns 8 bytes)
> or 0 for 0 input.
> 
> There are a couple of cases in SPI that are using the same approach
> and at least one more (in IIO) would benefit of it. Add a helper
> for everyone.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/spi/spi.c       |  2 +-
>  include/linux/spi/spi.h | 15 +++++++++++++++
>  2 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index b0e7702951fe..1bc0fdbb1bd7 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -3800,7 +3800,7 @@ int spi_split_transfers_maxwords(struct spi_controller *ctlr,
>  		size_t maxsize;
>  		int ret;
>  
> -		maxsize = maxwords * roundup_pow_of_two(BITS_TO_BYTES(xfer->bits_per_word));
> +		maxsize = maxwords * spi_bpw_to_bytes(xfer->bits_per_word);
>  		if (xfer->len > maxsize) {
>  			ret = __spi_split_transfer_maxsize(ctlr, msg, &xfer,
>  							   maxsize);
> diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
> index 834a09bd8ccc..abfc7f5e19e4 100644
> --- a/include/linux/spi/spi.h
> +++ b/include/linux/spi/spi.h
> @@ -1340,6 +1340,21 @@ static inline bool spi_is_bpw_supported(struct spi_device *spi, u32 bpw)
>  	return false;
>  }
>  
> +/**
> + * spi_bpw_to_bytes - Covert bits per word to bytes
> + * @bpw: Bits per word
> + *
> + * This function converts the given @bpw to bytes. The result is always
> + * power-of-two (e.g. for 37 bits it returns 8 bytes) or 0 for 0 input.

The SPI subsystem currently only supports bpw up to 32, so perhaps not
the best choice of value for the example. I would go with 20 bits getting
rounded up to 4 bytes to match the existing docs for @bits_per_word.

> + *
> + * Returns:
> + * Bytes for the given @bpw.
> + */
> +static inline u32 spi_bpw_to_bytes(u32 bpw)
> +{
> +	return roundup_pow_of_two(BITS_TO_BYTES(bpw));

Do we need to #include <linux/log2.h> for roundup_pow_of_two()?

> +}
> +
>  /**
>   * spi_controller_xfer_timeout - Compute a suitable timeout value
>   * @ctlr: SPI device

