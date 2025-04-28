Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B791DB124
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 20:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745872644; cv=none; b=db18jZPlxWp99GHFg5Ctyn0Y5fmGBib3/Ddzflulhe2KyxmzewbQklQoJl//zqQ8sV2PjXizh6MdfPBzKV536p3Lo2DU2kX1hHN18gHp1twWImz8gGq7PqWMhw18dMls+vNWaiiim3QXGosUymilG6grCROG6+Dehc4VccxmY7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745872644; c=relaxed/simple;
	bh=RG16IxyNFQzdJ+l8YiIgV31gwxuUGCnbYmlOxmYE8vM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eC+FJW8/615fIfuCy2NOLlyi01KMVJV/8aWuQ9b188nNyYvUgLFaqMhHbBzRtAgbSp/UEDNwn3zFXDEK8uSXWzcRmHbFKAhq9MHIbUiCSzMbFpPISd+tpZGbioIZwCX65FE7TATKYjrIzn7TpZ/NQQLT1TeQsiTp3pK9T6pRznE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=jHZ5XZ9I; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jHZ5XZ9I"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c58974ed57so577949885a.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745872642; x=1746477442; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RG16IxyNFQzdJ+l8YiIgV31gwxuUGCnbYmlOxmYE8vM=;
        b=jHZ5XZ9IrhxvxoclFe3KfaWjgSd6YqvksZpBCtNMbWHmNzFhW3fWiEjzsBIzr4IYId
         kgZJpSSkkZX8pjLfzTp4tOsRFb6Z9Yn8UPS3iOemVqAFNsTVrnrxmcWALynzXgog1LSS
         lBXJZd50l0bMdWbphuWUWbWqDEUZdYas8hqqky0iHpLcIg6q95jClAv/NqsgGOLTOSOJ
         R43MyCGAVZbU7buO83ZzM1kAwe6elj0dB0YHqBzxGEgbDQWgl4faxxOyp91ESt883KAz
         WTEWcPuBV5TwbnM+hyzreLyZk3lnuT6syQHIrvXyylZjhWNbzhuuxFatdXWfPIWhNlxH
         Bxxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745872642; x=1746477442;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RG16IxyNFQzdJ+l8YiIgV31gwxuUGCnbYmlOxmYE8vM=;
        b=ajkxuOTMAcs4V1Lm4MYxCRnt+6uuNDzaHyuqCMfCvxBiJt7he2Pew2/pIYKYFEtJ1g
         +nUYmERUJATqHqOQoxVlNfrahZPpAV5099EB5r9gZr5SvJYCcX2IZqYWzAYQ5OzHwkrN
         ylt/f7FBxlqhJQuzCtHR1x6aZfqnlhzW+5EamVuRmXw4sjJb7o7cp/GWgQaAv8PBrWDZ
         PISmJk6T+RgSGh2EnGTN/bOdEUrsNvK1NxhltZbstxVIrLY6mAMs5g4jSTt8N+KWyIWP
         2tjGKVXlzu+5CYh0euzR/fFaw8yVnKbHhDEn2OOlubuBNAko9nSFHGSSeMD8p/TDqlGl
         lVcg==
X-Forwarded-Encrypted: i=1; AJvYcCV/rg0cYfzRHdCXDEcYF30zciXFSiIC6ppJw/gFEji8reDur7P0U35zuR4nGNrd65RfOUv+qN5gBQctoSo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUS0rOVb7O+n3LUOgurmpkL4chf2bDlswL5sCtI3gIc011LlpZ
	hxVbX5nN9X+UALXn174muiCGL3n0CHKsC/tXOBc9CDqomrTVPEs0IjddQ5hRLCY=
X-Gm-Gg: ASbGncun0pn8p2RdBZSSh3AvzRu6WM0IJNhMuOHhCaERazBOe1SyR2ALUot5CBqe5lE
	v35hp1T2O9uEM4EiGFgpu8ff/+W1NgJoC/FTkhox3QWLGYueWW5FQDZinGqmjSzSyhiSnnqQ6RJ
	4Wk4JiHhDceFsPdqdGsv2p9k4PtP/znpYpHVkPTx9T8KqQZ2UofQZGifE10Oy1b58jx5yFaN+w/
	q6CGvVitjJErLzARzhjsTQJYuA/+gORzeJCYvEL2maulsYtW3LtSdNBJQPV5ez0deBaOHuFkBxO
	KzkpqnhpEJSfwLiKZLh/3g60Qf8lKmLNUVdkS5mQDbwvVQYz1OaTHLonYLtbo0vSHYLjsaWoqlK
	4WsPpactZ
X-Google-Smtp-Source: AGHT+IE8cclfNjGpRErtSU+IQYlC80KA/mvktmZUSPUgteaPfn+oZPkriEMGFnPqNoJ53MfrrkiFuA==
X-Received: by 2002:a05:6214:19ed:b0:6f2:c88a:50b2 with SMTP id 6a1803df08f44-6f4f1b9bf0bmr10177236d6.3.1745872641862;
        Mon, 28 Apr 2025 13:37:21 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c0ad4382sm65108736d6.125.2025.04.28.13.37.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 13:37:21 -0700 (PDT)
Message-ID: <0082078a-32ef-48cb-a181-c2d598ae29e6@baylibre.com>
Date: Mon, 28 Apr 2025 16:37:19 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] iio: adc: ad4695: rename AD4695_MAX_VIN_CHANNELS
To: David Lechner <dlechner@baylibre.com>, Jonathan Cameron
 <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Eugen Hristev <eugen.hristev@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-0-6f7f6126f1cb@baylibre.com>
 <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-4-6f7f6126f1cb@baylibre.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-4-6f7f6126f1cb@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2025-04-28 16:23, David Lechner wrote:
> Rename AD4695_MAX_CHANNELS to AD4695_MAX_VIN_CHANNELS. It has been a
> point of confusion that this macro is only the voltage input channels
> and not all channels.
>
> Signed-off-by: David Lechner <dlechner@baylibre.com>
Reviewed-by: Trevor Gamblin <tgamblin@baylibre.com>
