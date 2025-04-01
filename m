Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5A120D4F0
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743525069; cv=none; b=gxafnJiCGhqyCaQMyhvvXqCRhuKuCiUDET+kbSUYZsluKPILlFtPCrG8aAmP8tZJUbkvdDvwtnkmuMrQW7Xv8x9ou5KrkSgi88YHHDmxmaGPSs/1c2rujNkau4kLnLTq1XPSq3VrrC1lMur0k46sG3ztXyKIAGoPTPb57t87PYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743525069; c=relaxed/simple;
	bh=A+8CGVk+rHAGbpJizcWomttlBO48kDl6sqlUmqTyKeU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XVP/sDMTkHtKiZqFpoRaZyubu5x13Plvkwxp32bhmc2+wTtj0w8heU0T2fYvFzgywIOYXOAX7AMPVOkNAKtbdhxBnCw17VhCbTX+EuoqdOusb06PoR0ZLI+1Q6SpVZ9YfO/OFWiO5bq8CTrOqRI12KnMBbz6pi+czm7jKBKw9qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=M4bvoux/; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="M4bvoux/"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3f6eaa017d0so3619278b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743525065; x=1744129865; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DIV9rDTCBYi/ZllmsgW2UcNi1UuQ/GGccoikNyYbqtg=;
        b=M4bvoux/hLbXvcgkPNY5thr8Chc2me65K1M+dghTe3mdBlSeaWIkMeGhYHn0xNTCXt
         KqD4Jkszy4gk26iEDuvoKl+5RgCxtFaG5h7o2qyt/H07ANJxQUMIB0dSfHveuZxMVYcK
         K0Jm/H3cbwuOLVnd7eyJ2jTHehONzxlOouCzXxkpNLFuOmI4J6EasFmQk/SZbZWeQ+Ow
         Bw5oQ/eM8LlRY9UnhQRaT4b+NCYdMRAf6qte579V6BbooM1AgESgnR+xqFYJwQPc9xAp
         FzUv/Cq/cVYlj0Yo093DJIYtgQAAfcAreKO8gzdBxbhzYOLppjbWkZ+Kw/BYLRFbN93S
         tsow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743525065; x=1744129865;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DIV9rDTCBYi/ZllmsgW2UcNi1UuQ/GGccoikNyYbqtg=;
        b=I8wALkiuT+9Az6X5kHZSZhfQwHT/wqKTKvGsHjVDG+45dCTOu8UFP5zdLgzR+dMcvh
         K9WEvJzSA89jWNZjko+k/Cv/o6OVijMrXvmL5vFHfIEEGGXSE3FzenVSucc7lTy6BZy6
         oiHsjbKxj1fXwVKmqq+4aysdiM6b3zcNHIE9WPbo47zMXukCMxp8Qfa3ymlGOLOIZxvi
         JDdNsRrlAUvvngWJeRusuERi3gxXDiFrkCqsB8m0E/I8z5bEk5827deyMpw+EJ5O8+Q4
         +IB0wz7c2SIXInzrbDyINisBchQqGvLyq0FLgSfJn0MaS0aKv9kASW5Aqoj+2/jlpBlo
         MUBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgdtSDYHNwvpDT4oXvWO11KVuH+VC2kJ7EC4hCg1iypTPXIRkD0xjWU75ofICjuK5zJgcUvZmz0DV2I+U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4Ss10QJWR3fb0QexuItFK1wfMK0/e3ev/ZshxdWvKYzx1oY7T
	rRqRRHhixF+8x2Sh8ah8R1da3UtLLUQsaukES8xDYZh0ECTruUhQNQuU57TFt6c=
X-Gm-Gg: ASbGnctKlraw9PVWiVBttB8PrOZxXNEpVGsMZ+sk1JzaJh3AhbyP9vLf5yHs9LFWrpx
	WpGvdANsTskOSWYlPCNxTd0niwbeqWvr7sD+3dzrtRpzA4gemMSHmBxc4a+6xylpla9i3b33H/4
	HzcUaHLhBhSpAIn9mT6c6lvs3G+f7yDpFIiOOZ4aK08PYXKuhZX54fjGuqKKtAaNcLH+jwFqU+G
	B0rtcb+5n6IuMD88zCtT1VZtM9B+0/pXiOvKp5zPH0cotZUASqk+4sGTARN9U9sz92oBmNFZN+O
	lR8AvywLLeNoUAxFtqLWlMXKCWlisecKB7d4uJjqZinWv6EQcT4dmsZn97HX/NHNrus1m10j77n
	APyjAUw==
X-Google-Smtp-Source: AGHT+IFgxLHlEUHTiaVhBN/WS2y8zglVhq63twptXpO0781V1TyVKN+bnKqC1lUMJ1xUmse1ytdXjA==
X-Received: by 2002:a05:6808:1b13:b0:3f7:e553:56c6 with SMTP id 5614622812f47-3ff0f5d0107mr7722566b6e.37.1743525065453;
        Tue, 01 Apr 2025 09:31:05 -0700 (PDT)
Received: from [192.168.0.113] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2c86a5758e0sm2367583fac.29.2025.04.01.09.31.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 09:31:05 -0700 (PDT)
Message-ID: <c72e422c-1ad0-4314-8171-1c3830f63fa5@baylibre.com>
Date: Tue, 1 Apr 2025 11:31:04 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/17] iio: adc: ad7768-1: convert driver to use regmap
To: Jonathan Santos <Jonathan.Santos@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Cc: lars@metafoo.de, Michael.Hennerich@analog.com,
 marcelo.schmitt@analog.com, jic23@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linus.walleij@linaro.org,
 brgl@bgdev.pl, lgirdwood@gmail.com, broonie@kernel.org,
 marcelo.schmitt1@gmail.com, jonath4nns@gmail.com
References: <cover.1741268122.git.Jonathan.Santos@analog.com>
 <b0c7976d4bc817b7056ef40e3ce870b42e8a2d80.1741268122.git.Jonathan.Santos@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <b0c7976d4bc817b7056ef40e3ce870b42e8a2d80.1741268122.git.Jonathan.Santos@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/6/25 3:02 PM, Jonathan Santos wrote:
> Convert the AD7768-1 driver to use the regmap API for register
> access. This change simplifies and standardizes register interactions,
> reducing code duplication and improving maintainability.
> 
> Create two regmap configurations, one for 8-bit register values and
> other for 24-bit register values.
> 
> Since we are using regmap now, define the remaining registers from 0x32
> to 0x34.
> 
> Signed-off-by: Jonathan Santos <Jonathan.Santos@analog.com>
> ---

Reviewed-by: David Lechner <dlechner@baylibre.com>

> +static const struct regmap_range ad7768_regmap_rd_ranges[] = {
> +	regmap_reg_range(AD7768_REG_CHIP_TYPE, AD7768_REG_DIG_DIAG_ENABLE),

Technically, there are a few holes in here where registers are not defined
so we could split this up in to a few ranges to only include registers that
actually contain a useful value.

> +	regmap_reg_range(AD7768_REG_MASTER_STATUS, AD7768_REG_COEFF_CONTROL),
> +	regmap_reg_range(AD7768_REG_ACCESS_KEY, AD7768_REG_ACCESS_KEY),
> +};
>  
