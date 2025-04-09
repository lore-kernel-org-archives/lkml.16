Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DE51AAA1E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 17:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744219355; cv=none; b=Je3XasCBkhExJQTxlVh4CB7GFIQF4VR6+LVq7+1pf/006blcK6zgxBXPLx+CtrYRve8w8SSxk8bg46l0fjBHeoDzY7HPPM5Zlg4wKfVSA9psAgL8H3n1bypGII2LPfVHBBrC27/lkPigKr5De0QZFqibdhhwDKklE9T92UjR9ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744219355; c=relaxed/simple;
	bh=hgmZjl/0GFu7aV9zyA1pqvTUbV9/RCV8jgKjSe4y/j4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VihL/O+YoauOS7w1RvJSuVyhqgqxEQxr1W66Ei9ew72OtJR22cLZOtGmjrQxP3X6bgie2lFcijBN2CQfwjC0EXbUtGpKrOp4Jfs748zM0Q6D7302JzFWtcNFAXi2S/VREJwFGBMBFlaL+nurc1ehXjXZOEoi5FrLw/jexSNUDnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=axX/TkOn; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="axX/TkOn"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2d060c62b61so1321457fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 10:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744219352; x=1744824152; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KUd3DRgpk7IUXe+BG1VM+vufDZdq+6SFGqAIEWolzZ4=;
        b=axX/TkOn0RjSqi5z/NHPBF+rR6/5ih1p+OqpIyjTv491dGMUumA5enzLKFwgEyjCsq
         t30tnVGUeIMhbHHrRAlYasF/BNbJEZNnMRCsUqwtH7E4uC6kPXVB3GeyIKNyRcqMTkCy
         lcZyPNN/ZK+uk8uTismjcfFELQSySyxounFaIpnMP9dPOiwaOyg8RMVRh1z7CeCPD0lq
         m51XYsyxxvl1XuRxsjubfWpdWazTcp7T0iD8Zt+xUoahHEykFjX+/peAxBx3MIlQhJS6
         He/7+w2Be3JapwxfAs7Wxs/WpWL4zeqsrRTQ0AgZiK48tRKNOJ0FTn2L5OcY4XIdoAL8
         AI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744219352; x=1744824152;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KUd3DRgpk7IUXe+BG1VM+vufDZdq+6SFGqAIEWolzZ4=;
        b=JjWkP944Ok+fw9Q+gwgi2EwQgnMm36jxMQW1OsltlILU4J31DFDMKG7ed0gR2sXDVe
         +iM7s5kk2fIawHuwtJDOyje4JcnqHzZwQYSNlmZUv5DLLVPSCeJDWwe9bYqXe1ZbKStF
         ZHkOXy0FHYvovKxL7W+3/HgFbX1Yetg1LYlsvF9hX7xELIgjflYAmz1P/jhcYS5SkVV2
         o9FSOxB7uxN1pzRfoZ7S+V2xBMAfUKnLE/SoOBB5XB+639SgK+jp4VRTBCmHQDBcLty5
         r/mYl4x63KBmhRulC7KNfW3L4axxamGL+SNnjQDz5ksITztDXN/Cs6r7iSmi0JhF41ge
         4Ygg==
X-Forwarded-Encrypted: i=1; AJvYcCX8mvqASm9dRTXrzb4JHVpy0rwrmTGY5DJ8tJ/HMTLPpa21bQR3lvGT0TVhzpH3+l372WapLWMNIE5Hqjc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+SL1kWG+g+PWXnnHuxYYZu94gEvOjKpCVDa1al1gE0XdHWKT3
	90Mf6/Odj2373yv2pgc3EeH+0ch2op4AuiQvhHqXw6QOjs6DeBf+U0jcR51cd08=
X-Gm-Gg: ASbGncs/Gi/LbAUZf4GATIS/qCBO+v8mAKGk5cmfaTJyD3c5m+LPdASDQKUjvluZryd
	5ugfKbBoTxCQS+uAbRdy8c3tp8b78CBhUW+yhA5YZcKuJfduBWzjR3sB8gclelL6EKReZCPspXl
	AbxR285hK6y0BaWIpKmVXxvJJigfOlMv+BtGNXSyKI9JRrw8GRyw8gJLatk6ociFSdUs/Pqtrhy
	akzabn6wpWJxYVWYVjHw47dPqz+RergqcP5ZNDaxLVcPyh3J9MrEjJ6uoOJOv0rBjDxK2kb8Ta+
	8hM2j/fexy75PUMfoTMhn7V/AnN/G92XCV1jiubQo4uob5LcNmTODkeEcsaAL2s6jpqlfPjHACJ
	i2/w/vO0OKpms
X-Google-Smtp-Source: AGHT+IFztP1mzeKLjJidViQDuyETBIHT+PXnlCCfiLa2H6qKas7z84dDHIdYm/LkCN3/HgD7fYGIwg==
X-Received: by 2002:a05:6870:7093:b0:2c1:c10e:3230 with SMTP id 586e51a60fabf-2d091815336mr1861013fac.18.1744219351661;
        Wed, 09 Apr 2025 10:22:31 -0700 (PDT)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d096cd25fesm295633fac.38.2025.04.09.10.22.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 10:22:31 -0700 (PDT)
Message-ID: <97d0cc16-cdd4-449c-87f5-f62e0515de97@baylibre.com>
Date: Wed, 9 Apr 2025 12:22:30 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] iio: adc: ad4000: Add support for SPI offload
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com,
 corbet@lwn.net, marcelo.schmitt1@gmail.com
References: <cover.1743110188.git.marcelo.schmitt@analog.com>
 <386ce043a0e3fc9e8ff71f17aef8de128ce5869e.1743110188.git.marcelo.schmitt@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <386ce043a0e3fc9e8ff71f17aef8de128ce5869e.1743110188.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/27/25 4:24 PM, Marcelo Schmitt wrote:
> FPGA HDL projects can include a PWM generator in addition to SPI-Engine.
> The PWM IP is used to trigger SPI-Engine offload modules that in turn set
> SPI-Engine to execute transfers to poll data from the ADC. That allows data
> to be read at the maximum sample rates. Also, it is possible to set a
> specific sample rate by setting the proper PWM duty cycle and related state
> parameters, thus allowing an adjustable ADC sample rate when a PWM (offload
> trigger) is used in combination with SPI-Engine.
> 
> Add support for SPI offload.
> 
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> ---

I think I spotted a bug. With that fixed...

Reviewed-by: David Lechner <dlechner@baylibre.com>

> @@ -690,6 +942,15 @@ static int ad4000_prepare_3wire_mode_message(struct ad4000_state *st,
>  
>  	xfers[1].rx_buf = &st->scan.data;
>  	xfers[1].len = BITS_TO_BYTES(chan->scan_type.storagebits);

Now this needs to be:

	xfer->len = chan->scan_type.realbits > 16 ? 4 : 2;

Otherwise when there is SPI offload, this could read 2 words because
storagebits is always == 32.

> +
> +	/*
> +	 * If the device is set up for SPI offloading, IIO channel scan_type is
> +	 * set to IIO_CPU. When that is the case, use larger SPI word sizes for
> +	 * single-shot reads too. Thus, sample data can be correctly handled in
> +	 * ad4000_single_conversion() according to scan_type endianness.
> +	 */
> +	if (chan->scan_type.endianness != IIO_BE)
> +		xfers[1].bits_per_word = chan->scan_type.realbits;
>  	xfers[1].delay.value = st->time_spec->t_quiet2_ns;
>  	xfers[1].delay.unit = SPI_DELAY_UNIT_NSECS;
>  

