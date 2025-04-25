Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21603296141
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 22:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745621464; cv=none; b=sFYHkrt7XJ3CHmZ3+syNEf+T+8ckW3EoT5zoUFrGH+gAestbPg6rwD+8MX2HApnxmE8Gznc5UwWNCxI4OFUB9LUao3B8d1/hy/kjnLbBzvsD4BkoJnIftZ0EiU5QLA5rP9R4E2aMUSVWllG26qrQBcQku+1irXj/A25ihLLFZOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745621464; c=relaxed/simple;
	bh=3Sasc5NlzHSJPJvPhpxiizeSf9Uujmi3R3Jl7ykq338=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WhJItOVSKRV1KvUowmA3iuwZBvrAHqluCHS1nDkSTz4kejdnDTYeZ/cm+ov9o70YBYIsMXQLmxmDeP9chMYS4NmnCPSw3hkjXlsdX+EaXI78cLWhoJTLs4CWb8vNfpF2EiaL1+qDg6YTM1DvBN3qC837YXSco8arGgIlQ1Pd8dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ZwUpQbOx; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZwUpQbOx"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3f6eaa017d0so2375647b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 15:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745621461; x=1746226261; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uvQo2x2sdjed241L/Fl7xm8USCWMlw2PIjAk0qokWCI=;
        b=ZwUpQbOxY8cjSIvtNrZYYTuUUMIpvc7dNrzaHTnOFqtekMm47JMOX8XlPbIVFw8yC3
         3wAutpfu0p4A+Q3357F2+FzCMNPzu8GqwIbl49+OhzrW9EqaUaBw5NlbWfqJs5Lanxny
         IPMKXOKJvZJnGOShSkHX9M4PejPSAOK+rouZ8NpvmvKTp1G6k34CuKdVvY0Pj1gKC4qO
         Ln7fPCZ6s9ytk77T7boHbimno/IJZ7Eb7ATnVuJCLdTVkEYBvbAhxmn8j8VjMsqdFILa
         9XsLQx35G45YsBqWPwsCw/QK9H9oGUb+3vrp0ctivQSrt4K6BkzKnBd8vaS3n+KST73C
         tv0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745621461; x=1746226261;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uvQo2x2sdjed241L/Fl7xm8USCWMlw2PIjAk0qokWCI=;
        b=KdwkjOCTRuuYKXCjE2afqncSnIJAVn241pjnNwDbosk80tgdCAIcF3cCkfO0xzFDPS
         alidYHBknhfxN7qtOk8emNxM29V/yi0CAkPgoe0L9hzpUFdlFZselC1xb4VirAxawq/F
         DIMgIKNvZW8ptAL0F1EXD3vOq05C8sjzOOpRoWkDPo5ELLpWVDQ4t1IOv7DWPOy0mTK4
         ldJ8QtKd7nYsMmkRaOvV/d89VDRF2jsm3B+eodwr7cyfIUaVEhp2I2bj+o+PyMs8zNWw
         j4n4UxBao7auJPJ+EsDxcuKjPrCGxCR/tOrKx6Avsq+BKG1MyI9s/xgY6enW2Ja4OkHo
         w4Hg==
X-Forwarded-Encrypted: i=1; AJvYcCUFDqojeNhq+J7LDNOps7jl0UqPstFmoSszmNU+VWX4ZwzBvbeiLA/JzN/pxoNvWUX6ltZECjEjH8V3YxU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyivnPthLxGAEnx5Q10e0cd55VydRj093ZkkV2d9rbn6I51QaG5
	CActxsKZLSl/WvFoDRgs5crcBoptBKhHbt4lLy2t32QSwgrremvzXT59sliA2cA=
X-Gm-Gg: ASbGnctgWoNKiJKXuZKKBmOiFFvYGejkFTwBVrQT+F+9BXywLjzdQ80VPptpatPzdMP
	F7qa3sTnXSQe9g9bNrTmAbx4o5EfOL0MwYoIUyXGUFd1WsRFI3QKTSTwYBrbfyXrNxbwumQsryy
	ynRGeDKCZWdhjlhNmZ1c8DhpbCszKH7lpJpWL+2/PQ9mMPw0rQH+KE212ZrT5F4Nweb3v4rSQcq
	ezauJTsFLG8+zHflIzHrMdsFLR7GfrLLENs4cjYRva2JUSULNyG5R+FBF67MQvjxQgws6GDj+OQ
	+5wAa/k6Vsur8aEMtebJH4+yXf9HhBJJeqp2LaMVvGs9RYDRdbclheOulW3qN5Ve04bn6EkQL+W
	TvqU6itupFOJ8
X-Google-Smtp-Source: AGHT+IGf/m/V8+j34YqopUYkV4XXjKnadKwCWf89O5k3xQSZs+EFyVqb9zHH9xJhJfgtnULMGvX75g==
X-Received: by 2002:a05:6808:2745:b0:3fe:f41d:463a with SMTP id 5614622812f47-401f288d0e8mr2181349b6e.10.1745621461133;
        Fri, 25 Apr 2025 15:51:01 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:96a3:e28:3f6:dbac? ([2600:8803:e7e4:1d00:96a3:e28:3f6:dbac])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-401ec8cb1ebsm971268b6e.18.2025.04.25.15.50.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 15:51:00 -0700 (PDT)
Message-ID: <88a326e7-3910-4e02-b4ba-7afe06402871@baylibre.com>
Date: Fri, 25 Apr 2025 17:50:58 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] dt-bindings: iio: adc: Add adi,ad4052
To: Jorge Marques <jorge.marques@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-pwm@vger.kernel.org
References: <20250422-iio-driver-ad4052-v2-0-638af47e9eb3@analog.com>
 <20250422-iio-driver-ad4052-v2-3-638af47e9eb3@analog.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250422-iio-driver-ad4052-v2-3-638af47e9eb3@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/22/25 6:34 AM, Jorge Marques wrote:
> Add dt-bindings for AD4052 family, devices AD4050/AD4052/AD4056/AD4058,
> low-power with monitor capabilities SAR ADCs.
> Each variant of the family differs in speed and resolution, resulting
> in different scan types and spi word sizes, that are matched by the
> compatible with the chip_info.
> The device contains one input (cnv) and two outputs (gp0, gp1).

Don't need line breaks after every period.

> 
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> ---

...

> +  interrupts:
> +    items:
> +      - description: Signal coming from the GP0 pin (threshold).
> +      - description: Signal coming from the GP1 pin (data ready).
> +
> +  interrupt-names:
> +    items:
> +      - const: gp0
> +      - const: gp1
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +    description: |
> +      The first cell is the GPn number: 0 to 1.
> +      The second cell takes standard GPIO flags.
> +
> +  cnv-gpios:
> +    description: The Convert Input (CNV). If omitted, CNV is tied to SPI CS.
> +    maxItems: 1
> +

Assuming the diagram at [1] is correct, for SPI offload use, we are missing:

  #trigger-source-cells:
    const: 2
    description: |
      Output pins used as trigger source.

      Cell 0 defines which pin:
      * 0 = GP0
      * 1 = GP1

      Cell 1 defines the event:
      * 0 = Data ready
      * 1 = Min threshold
      * 2 = Max threshold
      * 3 = Either threshold
      * 4 = Device ready
      * 5 = Device enable
      * 6 = Chop control

Bonus points for adding a header with macros for the arbitrary event values.

And we are missing:

  pwms:
    maxItems: 1
    description: PWM connected to the CNV pin.

[1]: https://analogdevicesinc.github.io/hdl/projects/ad4052_ardz/index.html

> +  spi-max-frequency:
> +    maximum: 62500000

Datasheet Table 5. SPI Timing—ADC Modes, VIO ≥ 3.0 V says period can be 12 ns.

So that would make max frequency 83333333.

...

> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        adc@0 {
> +            compatible = "adi,ad4052";
> +            reg = <0>;
> +            vdd-supply = <&adc_vdd>;
> +            vio-supply = <&adc_vio>;
> +            spi-max-frequency = <25000000>;
> +
> +            interrupt-parent = <&gpio>;
> +            interrupts = <0 0 IRQ_TYPE_EDGE_RISING>,
> +                         <0 1 IRQ_TYPE_EDGE_FALLING>;
> +            interrupt-names = "gp0", "gp1";
> +            cnv-gpios = <&gpio 2 GPIO_ACTIVE_HIGH>;
> +        };
> +    };

Could be nice to have a 2nd example showing SPI offload usage.

