Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2181CB518
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 15:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748015827; cv=none; b=eLOhF/YdDbTJ22KIprMQMdy98zQXFBSFJMi3fQGqPtu59RBrJhc9sEBv+BGQjWvNL867VI5rGC1lliu0CzN4pRitS9onIs6oGjCkABMmgRdWbR9hiBmXfMB7LNAuf9KvfwOLptj0cYFyiBmROgBmHQEuOxgWag5qzBRErByBWvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748015827; c=relaxed/simple;
	bh=ILxEcaiDntXsflkF+6pQtHGgWFkbnjUWXJxdfu3Hvc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xxj1zudDpDn7KhVP/vlqhRKgrMQV5I5M5a3FcK9KdyuZTDvwP8DbXtA9q9VaTzkfoaP4Ys7AjgEs96yRmpqqtTDU3OQMSYxDHWDsghKo7sfVX/LrPSNC3hpK7uLosOc/vPrEsWtogLNYfMYFPldDzbf0nD4Bv0rSIM6D2hNpQKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Ph60W/EX; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Ph60W/EX"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-72c172f1de1so6130397a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 08:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748015824; x=1748620624; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HCbggnBXhDFmScN6GeHb5Y4f9rXuA+BgiNUVjW1ACkE=;
        b=Ph60W/EXNL7g4208D/4r8v0ThIIFZoGRpxHj5uiOMVo8yYqfmRkn3AWzjoFMDcQyU6
         cP8keA8QMPwPjrpJeDi0fsbcq+4DArm97lz7Tc7Q7VOERsXMU7JnWu68JxnDG5v1ydI5
         glgAfebJiiN/Egq2FCUp/ZTD45KSgYdkRGlEpU/kGgmNArhqyCKRuCswvRURHIGU302E
         NXMFYVrgVy33HGR3lCqcPpiir+C3pxdcC3+V5KA25vERp0M9KlX+NG67DMYma/jKuMWG
         nBVBUEp9ezO2+erKuJ1RZhfV+0/Y8BghAIGSjZcedTk3kkAOQ/430amCC0LtdYmLkT5G
         7uBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748015824; x=1748620624;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HCbggnBXhDFmScN6GeHb5Y4f9rXuA+BgiNUVjW1ACkE=;
        b=wujA1+kGkUrdR7IAzcFAxLZj1XcDXpVelWHeh7a7z4j7SeHGGJs57OMaXs7oGqRkhI
         fVRjM+M9Yhgr60JzDpGaGvUfefbEuGdluI/UuLewU+fVaK6a4ZUhh6L4RwVmYwnjy8tL
         eLIRHY8Cl/M7UUIp4L+Kt21Py9KomJ1Yw1rOB0FQEwhx9anuBmu9G60vq47hRx/8cFvg
         ksIW1wr7koLshDQdDLp+j7h8cDs93ch86Rlf3VSAm2p+NDH5/IbuZRA5MC7YF5uHl7JO
         3RYofhhRCh6fEd05LMTA/JSJtSxRRfH6gA47Ibxwi0pwO7wEoMSMxaeRwmY6CvJAHtmG
         sL9g==
X-Forwarded-Encrypted: i=1; AJvYcCXGfQLnVM/xoubBFKTfJ2WaJoxBWvDMingQ/hrsKDE8XFOtAgKA4vMb/k3fKKDWdTCLeuCQxhsxzVm6F98=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPoEEP9MKvumSKxNlLrwR+G9/+uOFjTPsyx3wYAdz1+49BS7/v
	ac3RCu/38cKI8txR++DD3PFxdBnLpC3UjlFfHdnWjymMgRLmdh5jPIu3//nfr0LhDg4=
X-Gm-Gg: ASbGnctQp5/8uWRKsip0g5oWpCaVvIIFHHL5+qKrkgWkP0ZCxPWgGbXsZlVpb4KGK5I
	jFC8K5Lfp3QqC+8R7RZMLOojgSHe3h/P2UFIwHYjkk3cifAVl/PjZac/sYolFe3MutAsyzMengp
	oaZQRNtuNYo6xSnqOKxv8yl4/vDOAVbArmSzks10agbO9dJUmQN/atZHKmusrKDexB/2XXGz8uE
	xHFdrvafn0ScFcNtUYYv9dP1EJEjltETHZ2pEBA7eb3pqLpWHSFHsTCbFk//i0/QfG3jn2ztpv4
	QYihNzJH4v7uqwTfCdHcBA3Td7oxvh0OP1ovWh5DyJd+Gs+ScdVW2TBwbtqncakRYzweeaQMcqF
	I88OSAILNC9lcQn3b8ZUQ++QwNzQe
X-Google-Smtp-Source: AGHT+IFc3c1i95mFKKiwhRskWte/zI9f2iV5+4DvWEUtWy3xpbU32DrMGlEVO2qex8u//4NOEEsbzw==
X-Received: by 2002:a05:6830:388d:b0:72c:10d5:783e with SMTP id 46e09a7af769-7355cfb0164mr17458a34.10.1748015824170;
        Fri, 23 May 2025 08:57:04 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:d0c7:531a:e465:4a2e? ([2600:8803:e7e4:1d00:d0c7:531a:e465:4a2e])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-734f6a4b206sm2902299a34.3.2025.05.23.08.57.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 08:57:03 -0700 (PDT)
Message-ID: <bcf45254-6c02-471e-86a6-66599a77c999@baylibre.com>
Date: Fri, 23 May 2025 10:57:02 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: iio: adc: adi,ad7606: fix dt_schema
 validation warning
To: Angelo Dureghello <adureghello@baylibre.com>, Nuno Sa
 <nuno.sa@analog.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, devicetree@vger.kernel.org
References: <20250523-wip-bl-ad7606-dtschema-fixes-v1-1-d9147fb2a199@baylibre.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250523-wip-bl-ad7606-dtschema-fixes-v1-1-d9147fb2a199@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/23/25 9:24 AM, Angelo Dureghello wrote:
> From: Angelo Dureghello <adureghello@baylibre.com>
> 
> Fix following dt_schema warning when offload is used:
> 
>   DTC [C] arch/arm/boot/dts/xilinx/zynq-zed-adv7511-ad7606.dtb
> /home/angelo/dev-baylibre/linux-iio/arch/arm/boot/dts/xilinx/zynq-zed-adv7511-ad7606.dtb: adc@0: 'oneOf' conditional failed, one must be fixed:
> 	'interrupts' is a required property
> 	'io-backends' is a required property
> 	from schema $id: http://devicetree.org/schemas/iio/adc/adi,ad7606.yaml#
> 
> Offload is a third option, so none of the above is needed. Used
> "#trigger-source-cells" to identify offload usage.
> 
> Fixes: ccf8c3f106a2 ("dt-bindings: iio: adc: adi,ad7606: add SPI offload properties")
> Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> ---
> Fix dt_schema validation warning.
> 
> Link: https://lore.kernel.org/linux-iio/20250408-wip-bl-ad3552r-fixes-v4-0-b33c0264bd78@baylibre.com
> ---

I think this is too restrictive. Generally speaking, a trigger could be
connected to trigger something other than a SPI offload. So we wouldn't
want to exclude that possibility as this change would.

The existing binding has the same issue for interrupts. There isn't any
reason that we couldn't have interrupts wired up at the same time we
are using io-backends or SPI offload.

So I think we should just drop this whole oneOf: and let all of these
properties just be optional.

It smells to me like the original binding was written based on what the
driver supports rather than how things could actually be wired up.
