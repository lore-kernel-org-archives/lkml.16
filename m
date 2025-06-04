Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535831F4C8A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 20:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749067702; cv=none; b=uNW0L3r7YHLuZsBMNtpavwLidR4JJtjQ4tJc6UktGrrztR1s0FZRKba2xfA4bhKNEGtqKCPat6bugiiX6UxlS+1z0GVbhm/5CQ5P/tFTIOGVRMWvsJcpkVupLSlWp1Zt5e1ZkH+Z2aMEgkb+T64Cy2V8Jo98XKcCGy/+7wh8wTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749067702; c=relaxed/simple;
	bh=U1OnM+wDx42RJMhEFhzFdLnhJjVXk9QUKvgzs6hObX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=t4IKwy7EIG7MUtg/araxE+gZ56g7/xIVZXEunjf4CO6MtNp1M8gdflGmbmk51AxJ3wDB9UroI0ouLWPgwwBxJSKBQl1njJlojevPaTXRoswjyFO9EOTOWdpHafpHQCMaK1IKC8YPxzq8FROGZuErqj9xaJmJPjIy0EImRUevs3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=RDhnPcVb; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="RDhnPcVb"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-408d7e2b040so191555b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 13:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749067698; x=1749672498; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0GflgBwk2Erquo5jED04z907LZDLKiN9eNZQrfhMtwM=;
        b=RDhnPcVb1xg72o/62ONhztNJPBp6BJg7unzdMVzRaSQl40SVsclJ+OPt2w0y/rAotk
         HEmTEmzILQXVL4nTjmLV9s+jjuIOxNsxj0YMtXL6XgKJkfblHc5oXDWO0PoijZTyKerO
         GeasyaQ+xERBXfTG/u+ihg/+G/7I2XbsnHGyaYTIlzd1XjnlvyTijrYqFKrTfZnRZKRU
         I+ajrlQUumP2kDH9XbcTBqLRlqeCj2XWsz89LlT1jkBrvtPir67lwNmea82lRgAzWrgN
         /YJbpzIv5SioY3ltvSzH34srKL6EZlerVQ/IUKrGcH5XaXaOboI5D9PRwjpU2oQ7tSKS
         Kvxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749067698; x=1749672498;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0GflgBwk2Erquo5jED04z907LZDLKiN9eNZQrfhMtwM=;
        b=uCczBsBu8UAWA5UC6S8nN1Gd5Zkv1bzdNZ1eCrtZl6q6cVU1TdXbVr5552wwOFrUAR
         ZA4CyPk/GQReuIDyM/IlhrWjyllX1pvsszpu52gjiEeTwKtzW3EzraQ9xMm/LwKvNwv2
         50NvD5ct/7MDYvVzzlIY4qcMgRWT6M03yc+bpY72ZF2nFJlt6YgZjz1TnrqtHofavhEd
         xLx9H8QrBVnv4EiyMyavOivk5IzCrQhRc08QQejafn/EYBjYPqTmXKrR0iH+37hRXGQB
         9Qwh5JEygyfgZtHPmpj7f5PlJQHt8KdAdrBB5EuX71vSIwCd5aAb774e4slNMdfIXYJ9
         328Q==
X-Forwarded-Encrypted: i=1; AJvYcCX97LkwoguFGfg08u90gGnxUA82Yj6aF47wf2jmn7Cht3JFJ+2S91dEr2HqMOZzZDERrTL0T1+74rx3OgM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8pZ723zbn4w+iHHVlSnsTfum1qscpYkQIBfT0LYfiYd2sUsyd
	5FJwgdqAT6bcuc7tI7GbxakKVkDJ3rHZC67FOPEv7m1c0wHgCKAOO97F1EnJzua2gZY=
X-Gm-Gg: ASbGncu5WTEVX1jr7rKfifBd6Ax1w/Eyz9iqkKsGpkKy3qe1zdXKLZ2MWjDrdNBlywH
	U3zOLNyQX8Q+leM6rnCIWVObwVOcsWhVqy1vuFKfxf1AWRTgJTKUgOsb0Myvo+jktbs9PFHd56M
	k/lYB8kwfKCpKysUy0mQf7pCk/PDXfR9n0oxVBGVkTOzE9/GAkPTDBFw9xzmq1MyaFYJSqQeYv2
	thAyh7SEPX4P3VddSng8ICrxMJw9YPimPWA3pUcrwCK6rjk1f4JTvx8tyUWFwvjM5CDsYTNNhc4
	LY3vmmb9UeUP90WGzG+slz3b17w9KyvPjFnQ2yQkN2b7J1tu9E8fgywIx97RgZrPwLa0OYEOHEL
	YZ1EOQTSeKUDugPAXS3qZjmD8mQ==
X-Google-Smtp-Source: AGHT+IF0A9E9JcoP0NaXp+49IGKBNN/o1YoH+RW3ZA4P/jSh9TsURsmLa7tjhJk/OQ0OgontXEwQfA==
X-Received: by 2002:a05:6808:11d1:b0:404:e2fe:ee91 with SMTP id 5614622812f47-408f0eadd95mr3375166b6e.8.1749067698218;
        Wed, 04 Jun 2025 13:08:18 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:829:fdd0:311c:c481? ([2600:8803:e7e4:1d00:829:fdd0:311c:c481])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-735af82d2dbsm2363213a34.7.2025.06.04.13.08.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 13:08:17 -0700 (PDT)
Message-ID: <eeef8217-f6d1-40ad-839e-2e0efe3b7d01@baylibre.com>
Date: Wed, 4 Jun 2025 15:08:16 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] dt-bindings: iio: adc: add ad7405
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
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Trevor Gamblin <tgamblin@baylibre.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250604133413.1528693-1-pop.ioan-daniel@analog.com>
 <20250604133413.1528693-5-pop.ioan-daniel@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250604133413.1528693-5-pop.ioan-daniel@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/4/25 8:34 AM, Pop Ioan Daniel wrote:
> Add devicetree bindings for ad7405/adum770x family.
> 
> Signed-off-by: Pop Ioan Daniel <pop.ioan-daniel@analog.com>
> ---
> no changes in v6.

In previous reviews, it was requested to keep the full changelog
of all versions here. This advice applies to all patches in
all series. It makes it easier for reviewers so that we don't
have to go looking at 5 different revisions on lore to remind
us what the history was.

...

> +examples:
> +  - |
> +    adc {
> +        compatible = "adi,ad7405";
> +        clocks = <&axi_clk_gen 0>;
> +        vdd1-supply = <&vdd1>;
> +        vdd2-supply = <&vdd2>;
> +        io-backends = <&axi_adc>;

Changing this one line from :

        io-backends = <&iio_backend>;

is not really a significant change, so Krzysztof's review tag should
have been kept and would have saved him some time in making additional
reviews.

> +    };
> +...

