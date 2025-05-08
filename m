Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA8E27875C
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 18:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746729941; cv=none; b=q52dBjc9q84AL5B6Exr33nDeyPjwaGwAZ2ctlM1RwcOoDHWvgL9q1GxCxmiVUQCUshH/s7U52I6YgRC6pJigNNzqDLtsze89v5pLSWWsQ+XhBfOwwmTnrcjOz5oUK1WoYUfTR60T11CE0E3VYFuTvOPidNi6/jFaNIFOpxUPrVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746729941; c=relaxed/simple;
	bh=Uct7WpTbq1dVFAi32TSot7daA1ZweH7/AhYF2940CgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BdI6EuTjd/hjm9aqC6ENqQQx7IyRevZ3yvTgJOIVHHNiM8fbwHwsYOdH9qXESOGANMOpDZSTzasfD8bwJYRscjg3UO2Du5fegaHkrzHoalqaDWafatyv2FRm9UaQ80ed2/Ow/D2F0JQmUQBuCvXoGGrpQzjvGOi4G8QWWoD5Tfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=RTDH8MnA; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="RTDH8MnA"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-72c173211feso417044a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 11:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746729938; x=1747334738; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7hks92hn75KYYjxsE5MEgCk2mRAPj5PUobg5bbR8tjA=;
        b=RTDH8MnAtbEspuqAXR2hH9hYTlCrpWMqKSiY1PMVZ/5lX1oi8l9bYbETk9vHL9iB30
         s/i1KDPIFeMNeUE/efK9FYSvA2C+xOg7OvyMorpf24oQ0qx2CcbC21KBQ/wyVsvrV9Uy
         ZVWJ5SQMzctTw4uvJabU5FNwa9376WQznvvpIhMvStp92Kj94l7HPyQReUGL9Tj640ai
         /WNNxzNPzMSNM1uDTHcrE5zr516/5wcwwJFYMDihUXPmTGgHd2KFmtm89D1/7C2OU0dO
         b72JGo74bKZLs4XhusxjtPts6l8aum2URVcvGUna0lqfT0vAxUzXsvSY4c5/6vAk+FSR
         XpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746729938; x=1747334738;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7hks92hn75KYYjxsE5MEgCk2mRAPj5PUobg5bbR8tjA=;
        b=GkJalrO9J66NEd7mIkRa/UE/Htke7oKYg3QVx2deJUihsyFs1oYiGjjQho0W58ZcCy
         ZSiRNYyPjN+UDTlKzG/f8hbzNGR7zt/eIEpp4N7Z+jumWKdpm2WBxLB3Q5FcrSRlyWtK
         cLqSP9NgUrqCzmN1vXKCv1vIN69M+Oa2T7Ja8hY4LJVEYEWgE91hh/XMrTsBiDR6TCW8
         xaUf4EWEwV4u0QWDAAxz6rBcfqFv8Oe4YKDLMhG95mkcBOB2dq6hG6mIuMRVG+UYpDXA
         fEtlq3+sQbCYhRn3WBdb28OjDCnPyw21znfOeINzk22QiH+TzuIHZw3amwOkn2BlSstb
         3n/A==
X-Forwarded-Encrypted: i=1; AJvYcCWIFbP+1ekQNRqhO2lUwKlzS8h8BOu6jYqZdeO2Ii0/m1xMe8yHHC8ez9QjzandwZwD8Cm/oBt+rOd5GEY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaTAnu3QdSbGBZwlCVx8g3jQr4Rz/4VYePLkknNwLScXDmX4Mz
	cBrPJBoRFs1gZxMWhP4dVt6m823zbtH/6BSO7adiPksyYlNYXx6rw5V06U8MMwk=
X-Gm-Gg: ASbGnct4lZwMW+0P3KpXlL6T2N+aBc/04AU31QRwzO5aG5XtEHbQFYMcnKnJHw0t2DB
	6fLogaK+qTwyjUQIfcqmeAuWNnKEuLrEuF3wB/UWs20UGimTPQ2/HaTFmqssGEH93ITgq3rfadJ
	7IRzbV9o4o/naRwW6f2uKSik4a7uvUTBYAjDvnhz8S9p36Vg4CWQ9bCAIuNyT86Y9GDIlYOdbF3
	jJwO3F0kY0PwbjIqdlH8dzY0a5QoOHbt4sOp6utEODl5N9ZhOTKlnsACcQjXwVXFBJHzQHU/kPM
	wz14bqLb9/mYdmFbIUCQyjjDuf0T8sCKkeGWHFpz3Pn4aIpDV5+xHCAiGkttNIV2ToFqTYnoWEN
	kYrAMtxRzAFfAyhruSA2fXYF4/3Xt
X-Google-Smtp-Source: AGHT+IEV7HHfBnOTMYTqZ03O7GNZheqbXVNvcqho/27ZV2olGwgw41vQ4kxYrohJ8syOgcp1dkfrgQ==
X-Received: by 2002:a05:6830:2589:b0:72b:9bb3:67cf with SMTP id 46e09a7af769-732269ce7e8mr741252a34.9.1746729938430;
        Thu, 08 May 2025 11:45:38 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:1120:d1cf:c64a:ac7e? ([2600:8803:e7e4:1d00:1120:d1cf:c64a:ac7e])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-732265ce4c4sm168093a34.48.2025.05.08.11.45.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 11:45:38 -0700 (PDT)
Message-ID: <662fa2f9-b28c-4831-9f76-7d2af8267466@baylibre.com>
Date: Thu, 8 May 2025 13:45:37 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/12] iio: adc: ad7768-1: add support for
 Synchronization over SPI
To: Jonathan Santos <Jonathan.Santos@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Cc: andy@kernel.org, nuno.sa@analog.com, Michael.Hennerich@analog.com,
 marcelo.schmitt@analog.com, jic23@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, marcelo.schmitt1@gmail.com,
 linus.walleij@linaro.org, brgl@bgdev.pl, lgirdwood@gmail.com,
 broonie@kernel.org, jonath4nns@gmail.com
References: <cover.1746662899.git.Jonathan.Santos@analog.com>
 <b65b085b29dd08e4f24485f37e7063c463637475.1746662899.git.Jonathan.Santos@analog.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <b65b085b29dd08e4f24485f37e7063c463637475.1746662899.git.Jonathan.Santos@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/8/25 12:04 PM, Jonathan Santos wrote:
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

...

> +static int ad7768_trigger_sources_get_sync(struct device *dev,
> +					   struct ad7768_state *st)
> +{
> +	struct fwnode_reference_args args;
> +	struct fwnode_handle *fwnode = dev_fwnode(dev);
> +	int ret;
> +
> +	/*
> +	 * The AD7768-1 allows two primary methods for driving the SYNC_IN pin
> +	 * to synchronize one or more devices:
> +	 * 1. Using an external GPIO.
> +	 * 2. Using a SPI command, where the SYNC_OUT pin generates a
> +	 *    synchronization pulse that drives the SYNC_IN pin.
> +	 */
> +	if (!fwnode_property_present(fwnode, "trigger-sources")) {
> +		/*
> +		 * In the absence of trigger-sources property, enable self
> +		 * synchronization over SPI (SYNC_OUT).
> +		 */
> +		st->en_spi_sync = true;
> +		return 0;
> +	}
> +
> +	ret = fwnode_property_get_reference_args(fwnode,
> +						 "trigger-sources",
> +						 "#trigger-source-cells",
> +						 0,
> +						 AD7768_TRIGGER_SOURCE_SYNC_IDX,
> +						 &args);
> +	if (ret)
> +		return ret;
> +
> +	fwnode = args.fwnode;
> +	/*
> +	 * First, try getting the GPIO trigger source and fallback to
> +	 * synchronization over SPI in case of failure.
> +	 */
> +	st->gpio_sync_in = ad7768_trigger_source_get_gpio(dev, fwnode);
> +	if (!IS_ERR(st->gpio_sync_in))
> +		goto out_put_node;

I think we want to return the error in some cases here, e.g. deferred probe
so rather:

	st->gpio_sync_in = ad7768_trigger_source_get_gpio(dev, fwnode);
	ret = PTR_ERR_OR_ZERO(st->gpio_sync_in);
	if (ret != -EINVAL)
		goto out_put_node;

	/*
	 * EINVAL means that the trigger was not a gpio trigger and we should
	 * try something else.
	 */

This is assuming devm_fwnode_gpiod_get_index() doesn't return EINVAL which
could be confused as the return value for ad7768_trigger_source_get_gpio().

Or just inline ad7768_trigger_source_get_gpio() here and avoid that possibility.

> +
> +	/*
> +	 * TODO: Support the other cases when we have a trigger subsystem to
> +	 * reliably handle other types of devices as trigger sources.
> +	 *
> +	 * For now, return an error message. For self triggering, omit the
> +	 * trigger-sources property.
> +	 */
> +	ret = dev_err_probe(dev, -EOPNOTSUPP, "Invalid synchronization trigger source\n");
> +
> +out_put_node:
> +	fwnode_handle_put(args.fwnode);
> +	return ret;
> +}
