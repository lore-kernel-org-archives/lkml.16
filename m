Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE802746A
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 15:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747667964; cv=none; b=LGDmlPAnGMk2Q/jbWehZMJGv3EWncNvzAO4VqCyqPphWxrNhc4LCCGXrxz7S8yjg/Rse+Oev/saVtsa4oEbuIAx6ES7VgReg6ebMDoMOd+vhzDfesavpLXqaKsCjfWvNKS+7RoXdI+0iV6zKM4WyAH6mEAdSGYpS0gWfR/KlAdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747667964; c=relaxed/simple;
	bh=tntAhuwtyBOmp6htFNeW8IQjOI9aNH5H0vPqH8P866s=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Hmo807FVF9Z061mUQ2DIzddDuEb1HA9KTomtAPIPcHsIZnanRClof+sAHDMPQ6H6xnl/vZhUDrOqAdozdLTfDqcKgu8F1tzJQKXro+nunhItgJd92dOOiBQkNoDjOrnhKjtkoMLy9PyXTpnt2NhwTb6MmX6JfEBcFaSJh/n8AjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=BWgU1QN/; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="BWgU1QN/"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2c2c754af3cso2400852fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747667962; x=1748272762; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5EKse5hj1NGw/nB8cxM05uzDSGMii0q2gV1Cq2JkY9E=;
        b=BWgU1QN/LKwk32fCtfgse7Wk8zO/VHTdOZ8tV35T3nzqgXuD0SG43edgjrYPoIO4iN
         G2c3dFLq6pqn5T7dGx0WxOvVKJsQNvOe2k2iVtxtjfmxWAJLCCbKtbjfO8lYmI6NbTug
         4V54e5/8YJh2ppdyNqsF0WTm3LQV6vK8drFm9PYOsM1LE3Q9XMBSwIkK/QC8xE5aBup+
         IDhI99VLZempUeRw+OH1907ZJk5mBfxZ8mC1FjMrKIBC2NYDQrBf2FV6uHUiMNKaeycs
         oS6oDQr5+KuPIoMI8fsZHZhM0RyrfUQ83AO5DC/fye+smkcXDcAlXCHSc/Lg3Y18ts3H
         twiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747667962; x=1748272762;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5EKse5hj1NGw/nB8cxM05uzDSGMii0q2gV1Cq2JkY9E=;
        b=kzVaHG6q7eoaZmLXd80Dy+3e6nboPyIS0ZmeWcscJpG1PQiT4LA+FEOgzs8HvmE0Xq
         kpmbg+POWGLduqUx7/c32i/St3qeGGyhVsXDnb9D1lpmtJ9pJYjPH7jePpiErdQks6qk
         Vn1oYEwaueP7Mw6rIlEXylTRGyIgRBrsweSdw97pPcuQbsctn8HKegoju2SdfcVAINfD
         t8M2wJZtVBOCuqx2c22RIbcM/aow/GAIx3DelFkiCN6oy+FW4jKvfNTCYotUma8Uhhv8
         MDqj510LqXWBnaW+Qe8S3qHBiyXyHNeHhFdQLAcolQOV8TjECj/1jc68ixSWTaOtbmDL
         oF4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWjpw0ayp6s8/eCHEhU5v5mk19Is6RKfsAKXUsd5QabjcHmtL0Jneqa4C40WJN0/SSuxbRcs7P9CU93WrY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1elNPDR4ONzRreLUUWTzBiqIOHoYdMv3OngFBUMaaJJoqIVfQ
	VIa/LaPg3/1l3WrmRGyDXaFqjxieFVUnI89NVux5swMksAUD91UCmKyA/QFhyytgb4k=
X-Gm-Gg: ASbGncs2tif0KtNuggDYNPAZ69UpcLeUqKqaCrIt7Or2kXjvE/fwM/S7XLZqwov/cPt
	Oi/ezaMyHxGNsG+JHIwtSAQ8Yb6cTx/dJaW/Mqtw9A5qhhvtxRnWOhB5h8hv6N8arE02ZqTLct1
	ZSiluSXJuC91u2AzAr9cyOkeqlSHHBNmKGleZQw8csMqICuzWmlXM/52AonA539/kpAq7hrNbQv
	Roce3TE53oIqcy1TgpJl2tSijDeha6H6eFNCULPR1tCvqCm0G1p7NhEs/F84Z4bVizq8592nhQi
	gItFbMrfK5+bh524MEGsgCJPeL1dptyRs8vN6oiIS6BCFS1btM/IfWxj1GeC8Xu8ZCbnqEaRfeE
	B7Pg8oiNZtg9/FVZsb4MsPh/uM4tGlFhnEwKi
X-Google-Smtp-Source: AGHT+IFT19mMMartSNjrJMxCwooyqG3/r9PDhl/qqeJCFkVUnUH7X7YF87P8Zhw80dNktxGzSl+vIw==
X-Received: by 2002:a05:6870:730d:b0:2d5:cb6:f0d9 with SMTP id 586e51a60fabf-2e3c1b972d9mr7651436fac.3.1747667961663;
        Mon, 19 May 2025 08:19:21 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:a628:91ca:eb5:d6f5? ([2600:8803:e7e4:1d00:a628:91ca:eb5:d6f5])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-734f6a44efdsm1443693a34.2.2025.05.19.08.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 08:19:20 -0700 (PDT)
Message-ID: <d30f6935-45f0-4422-a989-1103e7802ca6@baylibre.com>
Date: Mon, 19 May 2025 10:19:19 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] dt-bindings: iio: adc: adi-axi-adc: add ad7405
 example
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
 Alisa-Dariana Roman <alisadariana@gmail.com>,
 Marcelo Schmitt <marcelo.schmitt@analog.com>,
 =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
 Esteban Blanc <eblanc@baylibre.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250519140220.81489-1-pop.ioan-daniel@analog.com>
 <20250519140220.81489-6-pop.ioan-daniel@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250519140220.81489-6-pop.ioan-daniel@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/19/25 9:02 AM, Pop Ioan Daniel wrote:
> The ad7405 device is defined as a child of the AXI ADC.
> 
> Signed-off-by: Pop Ioan Daniel <pop.ioan-daniel@analog.com>
> ---
> changes in v4:
>  - add ad7405 device that is defined as a child of the AXI ADC
>  .../bindings/iio/adc/adi,axi-adc.yaml           | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,axi-adc.yaml b/Documentation/devicetree/bindings/iio/adc/adi,axi-adc.yaml
> index cf74f84d6103..a6bc8acd101f 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adi,axi-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,axi-adc.yaml
> @@ -135,4 +135,21 @@ examples:
>              io-backends = <&parallel_bus_controller>;
>          };
>      };
> +  - |
> +    axi_adc@44a00000 {
> +        compatible = "adi,axi-adc-10.0.a";
> +        reg = <0x44a00000 0x10000>;
> +        dmas = <&rx_dma 0>;
> +        dma-names = "rx";
> +        clocks = <&axi_clk>;
> +        #io-backend-cells = <0>;
> +
> +        adc@0 {
> +            compatible = "adi,ad7405";
> +            clocks = <&axi_clk_gen 0>;
> +            vdd1-supply = <&vdd1>;
> +            vdd2-supply = <&vdd2>;
> +            io-backends = <&axi_adc>;
> +        };
> +    };
>  ...

I think this example would be better placed in the adi,ad7405 binding.
