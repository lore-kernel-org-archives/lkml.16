Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3DD266560
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 20:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751403447; cv=none; b=Unt8JSOZr9Qzsixi/Q1HF2A8Ss6R8miP9IFe91Q3RcnwEX9siI57/9u67P9ehtrJWkV7crJmPouTUZVR3msiq1cZYBSI13A1+IRGjSRYdz2bnAr4RG7A0BDQU2YvSZV7U+CjL5MHO7Kv7PIOYdbGxMDDLzzxoxf2zWTRNhYoKPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751403447; c=relaxed/simple;
	bh=TJykQ/gRq/gf10TIynCQbjQP1Ab2MiEGTp6/NL4ri1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FbRU3T/fCV6M2s2gNqaT9xF18EjFtXPAEDSvYRReTeQdtZEiOzXOZZqSVEaxW3SyEm9x606YRXrjXOBT8ki6swMQULYhZ38Xgorfacow1hNlDv8VxKxoWL31RvoXQ4gPLE/K3NhiD4fWN1bEnFz7MAOXMSuIt4aZPitNPkAtNwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=gZ0sF+XM; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gZ0sF+XM"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-401c43671ecso3024493b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 13:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751403443; x=1752008243; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f3FGHq0li4IAoMzOrmPNDDSYUiPqRZNOr/Yo4wW/FVs=;
        b=gZ0sF+XM1SpimnEhG/gqhiXbxEzZh6jN05bGhoYuexBbmOW8AEXXs57UjjNI2zV4i9
         9B3ewzV3wqv1v6JPgHq1L2NzmVEHTCv8nU5rUIe1Qb6iGD51fXEMA3GWNAkBRQgcCy4e
         1nrDBaQgfJfVw7AanYZwlzkew4cGgisZ+eig1/nPHCuA/KPEEm5BrZYOFQhIQP8G93X+
         ess3OEHJfLwCeOwOS8l6MCgjwtNDnIOXFey9BVmJb5dt2WRDQh54wYz3qnh8b4FFVqdA
         skS3pXdUe6E08aj+L16Y8t96HzFUpk+FKjmelnWF4iAvE0TRH6Aw647byaZQT8G9p5jP
         6bgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751403443; x=1752008243;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f3FGHq0li4IAoMzOrmPNDDSYUiPqRZNOr/Yo4wW/FVs=;
        b=Jpuldc4j6B0QtJ4mQgiDUrRnTO0HTukQtmujCP4uyv8kt2TAfEgpmg1nqjZz7sC0Qv
         c06X4ZClGocT/7rimkcRdT1BvH1CaIi8X9XBaRBLfhhbpsWrvHmwYLzRQh8FEHn039DA
         /IP+uvq9asaofPChJArpiBtASCrvq+42mmx6wCx1PgDdAA3n/4wvbqJZrJ18Yavd3GmK
         p5fqcXtIgcyT9qHZOM9rilc9N65qi6CcffMenISOoNENWCJQmm1PrhaPvrwFmZLG49hP
         fXB6tjvUWp1UsDwaZJeaz1FyVbNbU2NFW28Ms45gZyU1PT/2kisVbLS9TgeTG0cy71DI
         bVjw==
X-Forwarded-Encrypted: i=1; AJvYcCX5u5iGkLUdRsQpG8AAn0c2MfDIhMdhCsokrD3TaQYgent+s9LvztTSnv2gvZl8A8mQMBKRuVysZfy0yys=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu0B8uZN0SXo1fccBg0hSH6WHEQjscuwRzrj5uLWPQBuENui2X
	hw1dwYRVb3np0KfqSIR783SnDpTKTIr2H1adOt9w9zC5p/wHXj64hMBf73NBM+Neock=
X-Gm-Gg: ASbGncvCCeiZ0suhuAjTRW4qBU02hAbPnpE1ndFB869mHTrRx91jJZH7EMZvQMkzwiV
	z/VHbVXT1lCo8aUQFT/irObzqQEgbGRb/gRo3J/LmiAFjCCJzHe2WsI9FhcpjoE4qWDOCMdhdmO
	1MC2PbxksRcew13XU29OnsvdOhmvPDOgcYTk49bldxmUs2dMIFzyTR/55FzIqGTRgSEQ6QSPXng
	CtKSjJdJmHpUT6cWZBINZagQSNRlBeHEFQCkaCDTgPSQfqwEiQItVHSnSQzNykT2y6hd1d9Gxil
	EYg/pYAp7t/D/ulws1DivQz1EBLInYdl2DWcog/vt106Nvj9jCRndnD7ias2Dcsui9sluB19stu
	mDS45uFs5Um1lmSEn+fT0kd5WSEGKgOg9s1Ou3Bc=
X-Google-Smtp-Source: AGHT+IH3mXwfNatjVX7249TuXT4mbijuHY97w9uhrbRcJoybXxQKtykU0E/lA0MVCBy0eHSWIO3Icg==
X-Received: by 2002:a05:6808:19a7:b0:406:6aa1:38d9 with SMTP id 5614622812f47-40b8a7c55c0mr82409b6e.13.1751403443339;
        Tue, 01 Jul 2025 13:57:23 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:70a7:ca49:a250:f1d5? ([2600:8803:e7e4:1d00:70a7:ca49:a250:f1d5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b3240277bsm2268043b6e.23.2025.07.01.13.57.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 13:57:22 -0700 (PDT)
Message-ID: <d1e5f360-cf2b-4c50-bb26-64db47a78c43@baylibre.com>
Date: Tue, 1 Jul 2025 15:57:22 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/11] spi: offload trigger: add ADI Util Sigma-Delta
 SPI driver
To: Jonathan Cameron <jic23@kernel.org>
Cc: Michael Hennerich <Michael.Hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org
References: <20250627-iio-adc-ad7173-add-spi-offload-support-v2-0-f49c55599113@baylibre.com>
 <20250627-iio-adc-ad7173-add-spi-offload-support-v2-9-f49c55599113@baylibre.com>
 <20250628160259.6f220dfd@jic23-huawei>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250628160259.6f220dfd@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/28/25 10:02 AM, Jonathan Cameron wrote:
> On Fri, 27 Jun 2025 18:40:05 -0500
> David Lechner <dlechner@baylibre.com> wrote:
> 
>> Add a new driver for the ADI Util Sigma-Delta SPI FPGA IP core.
>>
>> This is used to trigger a SPI offload based on a RDY signal from an ADC
>> while masking out other signals on the same line.
>>
>> Signed-off-by: David Lechner <dlechner@baylibre.com>
> Hi David, Mark,
> 
> This looks fine to me and I'm not immediately spotting any
> build requirements to mean this (and binding in previous patch)
> need to go through IIO with the rest of the series? Shall I leave
> this for Mark to pick up through the SPI tree if he is happy with it?

Sounds reasonable to me. There is no build-time dependency.

