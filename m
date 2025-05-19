Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94000283C97
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 14:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747665541; cv=none; b=N1JMFv3z3hw+f9Dc4t6nOYL1vtNKNCtXXb3weeOgAmAFD4EITZOZzQZiYJFhH/JAd/3A76ilCmU3rAUkJpvDHqu4bwoS9oOnQIj5DZ3lN8TFqOKQVsZHn4xoOxhIxxqmkuIEmGRezj58eUG7macvKWrkEsPrYdiwIwyXamHoiKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747665541; c=relaxed/simple;
	bh=chRE6XxdHT11yhpTDebpfgvLBa5UebQZjVU6I23L4GU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E/0rnA1UQDmADfFs+eiIWO74GNtryD3yIWZJXh7lgMI7XQP3By6hboQQrmsSAor5HSxyaZ7F1OOGGOUQv0MXqn0wtZ+gyaHy3bnopwHsQJ8Cw9DR4ALvhpYHvDRTZnORA8g/Eo1UWQ1PPH3+QJN93prKoBBlhlyqszRqaAJGoVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VzpjxYwM; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VzpjxYwM"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ad53bcef8c2so26860566b.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747665538; x=1748270338; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VfcR0vo1yJcZ96FpVEWXK/jeLPiIFBVPBnSqTWroSj8=;
        b=VzpjxYwMX4YY4rHDRqFF4WcotbW0r7sEQep9NPsBzokaAAR7K5c8QIlloX1sp+Luvj
         AHjjBC15bs9kwzdh/jPzldPETg+2j2hYzEcOLQKnh6wGOH3gmuPiy2PDclrHZHhFZ/2u
         dEZU7a9ZzrbNQgFk1DySWr0R4YDEh/tHwVJNl58x/LnyUb6Q3gsD98HFNZ9QhsE9slya
         pJOyl7dhZvCuj5Nfi2x9z3M9ZaxyuP7sQlmR93oCFTbC+N+Bu5P87we5N+YdAOPUoqBH
         VBGeDWt2zxmcUMowGhhw+DjtVbirPCheUZU4em1e0d+koEiOE582jQXak2lYgjxM/cCE
         JS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747665538; x=1748270338;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VfcR0vo1yJcZ96FpVEWXK/jeLPiIFBVPBnSqTWroSj8=;
        b=cjI+U/p6MjGMMg+nesKb6K1W1k3+y3Xn8WVANy2qLmVe0ZSrWrmsiRi029aflzQxAS
         /TJ+emxmN1zffqlZNZcDdVB+KhLFftFUlWNSCP7ysWv8i0qttEgdKmqRn5hBZdyLxMcK
         BURVvnbo9xq9DDJbcyH6M6A9IK0PLivVzEjZ41O/k9cr24RmL5PtaHI5x5DugjjT8Zqw
         Nsu4JJKZgLtfw7qDxLe0WEfqsUbRbd1wH/RSg6ldv2+kFyhi5oO/8aFM8zUzIaCNnUsi
         OFIyQyvZqh6MesdwgQvXS7lSpQneROF3XDu4rRMZ2u8yryVitIs8vF5Y3xu64D1H+SdL
         j2kw==
X-Forwarded-Encrypted: i=1; AJvYcCUzUxf1U1EAuKbGvokLElwP5inGK1EkV75UU5S0QDVS1Oka4Pt/CvOR4SsP5FpYjod/RAbMN093AjGyd9E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQe2EEvNikRRp9lo5b9VnQGtciacAvbtw8nBrF2vMLLIpSriIp
	P3xV5BJ9hH5NO0+9WInLxXofQYVzvrPM0bn4zAP57/94pqJr4x46D/h2jNAzQdJgoEbH7+++yJB
	3zJR5
X-Gm-Gg: ASbGncvYgJ+jSiumtLoPnBBgymky9LIGzghfBXlUqN0SsdeFtpOULTo0vx7mIHLTfU3
	GQwYE30LXfQrTvkUvCSeVGwCuO5vItWhoA08CuB9XPZv/+MUMdDznPiNcb3DwVxLQuSheR9VzT+
	w+sYng+skiJeufC1iGeG1L/RUQ6RFB9NqiH/Kem9+RMPbbkdkLNEKtT2uRjQNzyIpKho1Mxdc0p
	VG2mzJRt/4ZwvryKjAh3PyPuQ0pU06hkhm5ZYtKkOBopwnzQ9xqZGFHM21gl22/1MHzWS4IHF6C
	nSBqem21afOhfrwMlaHDXK5ZZA/9q7cslE87kgfDElaWOOGnfCiVeVxo4oDgdV7kOowKRqE=
X-Google-Smtp-Source: AGHT+IGLoowiwCCPUNIbHeGXzeL5pYyvUaeG7cdlWFwoYS+CIUuySk43aV4JQ826A5+uf7PtjZg47w==
X-Received: by 2002:a17:906:8448:b0:ad5:26e5:fb5b with SMTP id a640c23a62f3a-ad52d5bff7bmr365753966b.14.1747665537660;
        Mon, 19 May 2025 07:38:57 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d0717c3sm605314266b.65.2025.05.19.07.38.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 07:38:57 -0700 (PDT)
Message-ID: <f58f085e-fb41-434d-958d-1d6d8c63d793@linaro.org>
Date: Mon, 19 May 2025 16:38:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: stm32: add STM32MP21 clocks and reset
 bindings
To: gabriel.fernandez@foss.st.com, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Nicolas Le Bayon <nicolas.le.bayon@st.com>
References: <20250519142057.260549-1-gabriel.fernandez@foss.st.com>
 <20250519142057.260549-2-gabriel.fernandez@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250519142057.260549-2-gabriel.fernandez@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/05/2025 16:20, gabriel.fernandez@foss.st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> Adds clock and reset binding entries for STM32MP21 SoC family.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> Signed-off-by: Nicolas Le Bayon <nicolas.le.bayon@st.com>


I am pretty sure I gave to ST this feedback already:

You CC-ed an address, which suggests you do not work on mainline kernel
or you do not use get_maintainers.pl/b4/patman. Please rebase and always
work on mainline or start using mentioned tools, so correct addresses
will be used.

> ---
>  .../bindings/clock/st,stm32mp21-rcc.yaml      | 200 ++++++++
>  include/dt-bindings/clock/st,stm32mp21-rcc.h  | 428 ++++++++++++++++++
>  include/dt-bindings/reset/st,stm32mp21-rcc.h  | 140 ++++++
>  3 files changed, 768 insertions(+)

...

> +
> +  access-controllers:
> +    minItems: 1
> +    maxItems: 2

List the items.

> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +  - '#reset-cells'
> +  - clocks


...

> +#define CK_KER_FMC		263
> +#define CK_KER_SDMMC1		264
> +#define CK_KER_SDMMC2		265
> +#define CK_KER_SDMMC3		266
> +#define CK_KER_ETH1		267
> +#define CK_KER_ETH2		268
> +#define CK_KER_ETH1PTP		269
> +#define CK_KER_ETH2PTP		270
> +#define CK_KER_USB2PHY1		271
> +#define CK_KER_USB2PHY2		272
> +#define CK_MCO1			273
> +#define CK_MCO2			274
> +#define CK_KER_DTS		275
> +#define CK_ETH1_RX		276
> +#define CK_ETH1_TX		277
> +#define CK_ETH1_MAC		278
> +#define CK_ETH2_RX		279
> +#define CK_ETH2_TX		280
> +#define CK_ETH2_MAC		281
> +#define CK_ETH1_STP		282
> +#define CK_ETH2_STP		283
> +#define CK_KER_LTDC		284
> +#define HSE_DIV2_CK		285
> +#define CK_DBGMCU		286
> +#define CK_DAP			287
> +#define CK_KER_ETR		288
> +#define CK_KER_STM		289
> +
> +#define STM32MP21_LAST_CLK	290

Drop

> +


...

> +#define DDR_R		113
> +#define DDRPERFM_R	114
> +#define IWDG1_SYS_R	116
> +#define IWDG2_SYS_R	117
> +#define IWDG3_SYS_R	118
> +#define IWDG4_SYS_R	119
> +
> +#define STM32MP21_LAST_RESET	120

Drop

> +
> +#define RST_SCMI_C1_R		0
> +#define RST_SCMI_C2_R		1
> +#define RST_SCMI_C1_HOLDBOOT_R	2
> +#define RST_SCMI_C2_HOLDBOOT_R	3
> +#define RST_SCMI_FMC		4
> +#define RST_SCMI_OSPI1		5
> +#define RST_SCMI_OSPI1DLL	6
> +
> +#endif /* _DT_BINDINGS_STM32MP21_RESET_H_ */


Best regards,
Krzysztof
