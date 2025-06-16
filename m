Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BF8218EB1
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 21:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750108293; cv=none; b=NKf8tPjdKOCv6LYTInFttT0Rp48Rx/eDmaBqUp0r6yNfYybI9PJdKku6bfK6MAVrvhJnmh6P2BdN/HkQpga39epzfXIjtzupUneYWlnJGOddZc0Hpr+JiUubBJIPcp0ivuo4r578sTnI97lL6Jd8B6ukeTWRUW8heBHpm8KBBM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750108293; c=relaxed/simple;
	bh=QDEJC9lNPPxMJgzIsPCXcaBWEEtBKY1BQcD54BSSUUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jKF63rxkprbLZru1Zm1Cofz8lfch0DRyVIt/MfSuXcfOqgLDzV6vOP57r08IGwk7xpUJZ7i5fbB89/IOL0Tn8ey0w3sk0JFOEbR7amMy5lmtxSoGjH9QSRWaFGjj1yFQ3uBgFHiDaszYsRAPksIyoHN7hxcD8P38NTphoMGsLho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vW48Ws+G; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vW48Ws+G"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-739f2508ffaso3760123a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750108290; x=1750713090; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qYkNHZ7Min5h27AdAztgUbznbIMSIi9ilTeWa8MhK+E=;
        b=vW48Ws+GXJxUskFWMuXzMMaakcBhTzo6DQIB4Hnm/eaH2/XJrnM8kfpk+QSoMN6Hml
         UmyofMcVvMYyz/Y8FD6h//WFwJshRvWvRsviQ6zQhemWgrshK8HvKPj3iXnQehT+LdYZ
         uhYwEQ2iJPB4Klvzd0boMZclTzEQPaYu160d+jJYQ0I5eDVt8GeetyAkz+aro3mTZbQw
         udSUS0Ul61J0cYppKjdW8kVV9l8ANeWeDekwx+LC7EUC+rvHrfIgbNDw0qXwh66llwuK
         r+zK59BasfH+NGffR8AVavN6DWhhNjs1DZgzPQj47WR0Kgjkd0rawP5wKk29DpKuWP/M
         ft6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750108290; x=1750713090;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qYkNHZ7Min5h27AdAztgUbznbIMSIi9ilTeWa8MhK+E=;
        b=PJ/biq5mMutBEJb246bMnupQhZxlPp8KvtaKSFIiKAutR0kiXtQyKRXzlHCUUt+ZOK
         TUVQdWj9hf4YogHHI0oNTRkmT5X71U+9SXFt3kWU7UePSmy/zoNXgb/b6ngv8NaaHq89
         MyVAaB2bXdWLE5WjC0/7B6QZMaCHjT1zXB+9sUB8JEhFFF3ifCbB8K7DQnSQ/ElzHuBx
         kCCD/ROpydc1A6uYENy37f1wPQdjpDNiNe9YlBMFtwNlaTkMMajVAPZhs8dChLCYYnmD
         ukT+DY+Q2ZY027Wq3OPYJ7l6CS9+dy4d35zvYBg0jTHZxhkXrhxP3WudBkMsybmnsKb7
         7vAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWH4tWcpPdMJZlT3J/zS5CQ56P+6wbujiScPUzmLSC9IKUBsHALQiGCn3j8Og0+fL2kNtuun32kmtwVlZ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZkd8XctXSYPCsMg1mtp3Ct3gCKdnaFntHGi7Y0SL3oOfFpKwF
	Sgx1HhgBWcRlNHS1pvoPRzm7RD2RqjmtY0VZVwfYkL9kBkoHQjD/ZRplg+05ZXmCL6k=
X-Gm-Gg: ASbGncsO6YmK7PRaTRJO/7ZdRDXaK/0HiP3MXPz5sYwIhY82qesiansknlhkG1P/I9+
	4GdRfJdLTRIU86wtqlmbCu/GHgZ62rrAMdBcBqpg4MCMnrZRKWG3pL//3LNBuWE+VlYg/ACL9/h
	nTd777lfpkBm3sCCZ+JykT2OYA/CiFMukZRc4xqZwufu4wKvGTv8aS0YxWNxZG+gDbPD/Gmn4Bx
	RG1M3N5Ar3zEYn+OHQ6biwpvXj71IIekx8LPkH/tZ8Nnt+M1HxFjar2YiW//LE3gBDh4yvMCL3J
	NEs2HcW7Ifa3a9CmBmbhJTPMn4EmVVFwaDM/UC6VUhonyj7DB9zCzK/kBEZ/jBsfsp537xKJPiN
	zNUhZcDdjB9vAD7DPKHl2Wkfys2Otpz54VLiE5hM=
X-Google-Smtp-Source: AGHT+IEVfg00pTGaPRzK4Tu/NTTi24yJzRagmZrO6SxeTxUYhm24UeyDhh597dYIx3cwF5Ovt4WWcw==
X-Received: by 2002:a05:6830:7203:b0:735:afba:ba99 with SMTP id 46e09a7af769-73a363069e3mr6270036a34.4.1750108290314;
        Mon, 16 Jun 2025 14:11:30 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:9583:1e37:58ed:10ae? ([2600:8803:e7e4:1d00:9583:1e37:58ed:10ae])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a283dbf9asm1344501a34.12.2025.06.16.14.11.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 14:11:29 -0700 (PDT)
Message-ID: <656c43dd-c39d-4e35-a9d8-70383c0836a0@baylibre.com>
Date: Mon, 16 Jun 2025 16:11:29 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/11] iio: adc: ad4170: Add clock provider support
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com,
 nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl,
 marcelo.schmitt1@gmail.com
References: <cover.1749582679.git.marcelo.schmitt@analog.com>
 <5ac4b2d54f426d997cbb067530ab8e9af9bdcf16.1749582679.git.marcelo.schmitt@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <5ac4b2d54f426d997cbb067530ab8e9af9bdcf16.1749582679.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/10/25 3:33 PM, Marcelo Schmitt wrote:
> The AD4170 chip can use an externally supplied clock at the XTAL2 pin, or
> an external crystal connected to the XTAL1 and XTAL2 pins. Alternatively,
> the AD4170 can provide its 16 MHz internal clock at the XTAL2 pin. In
> addition, the chip has a programmable clock divider that allows dividing
> the external or internal clock frequency, however, control for that is not
> provided in this patch. Extend the AD4170 driver so it effectively uses the
> provided external clock, if any, or supplies its own clock as a clock
> provider.
> 

...

> +static int ad4170_clock_select(struct iio_dev *indio_dev)
> +{
> +	struct ad4170_state *st = iio_priv(indio_dev);
> +	struct device *dev = &st->spi->dev;
> +	struct clk *ext_clk;
> +	int ret;
> +
> +	ext_clk = devm_clk_get_optional_enabled(dev, NULL);
> +	if (IS_ERR(ext_clk))
> +		return dev_err_probe(dev, PTR_ERR(ext_clk),
> +				     "Failed to get external clock\n");
> +
> +	if (!ext_clk) {
> +		/* Use internal clock reference */
> +		st->mclk_hz = AD4170_INT_CLOCK_16MHZ;
> +		st->clock_ctrl |= FIELD_PREP(AD4170_CLOCK_CTRL_CLOCKSEL_MSK,
> +					     AD4170_CLOCK_CTRL_CLOCKSEL_INT_OUT);
> +
> +		if (!device_property_read_bool(&st->spi->dev, "#clock-cells"))

This isn't a flag, so device_property_present() is probably more correct.

> +			return 0;
> +
> +		return ad4170_register_clk_provider(indio_dev);
> +	}
> +
> +	/* Read optional clock-names prop to specify the external clock type */
> +	ret = device_property_match_property_string(dev, "clock-names",
> +						    ad4170_clk_sel,
> +						    ARRAY_SIZE(ad4170_clk_sel));
> +
> +	ret = ret < 0 ? 0 : ret; /* Default to external clock if no clock-names */
> +	st->clock_ctrl |= FIELD_PREP(AD4170_CLOCK_CTRL_CLOCKSEL_MSK,
> +				     AD4170_CLOCK_CTRL_CLOCKSEL_EXT + ret);
> +
> +	st->mclk_hz = clk_get_rate(ext_clk);
> +	if (st->mclk_hz < AD4170_EXT_CLOCK_MHZ_MIN ||
> +	    st->mclk_hz > AD4170_EXT_CLOCK_MHZ_MAX) {
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Invalid external clock frequency %u\n",
> +				     st->mclk_hz);
> +	}
> +
> +	return 0;
> +}

