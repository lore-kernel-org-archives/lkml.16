Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D94426B778
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 12:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751459883; cv=none; b=TqIoWuNOSSn6KAIwBsjAVZHIrFI90NrHdP+yJPy09X+zNlxeny9sGO0V7cD+PAIuB9c0N39bJrMlFZDT6QxAdcRyZdSIbRNNZXkqdvhZabnC11fDHbC1CceM8/ooEJRqG9suQVDANk2Wtcs73vh6X00v4mZ2sFRcWDL6rt+FxcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751459883; c=relaxed/simple;
	bh=uU+JKWZlOSfzPKyq1XI/5n7j3jfPISn/GknIBu+754Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A/DM0Jlag1CI0sGLUwXEiZ9ch1sY4QkPCcS/xnpP+I11Yx1hnhKflnA2IKerQXqRq/XcbW1jf0Fce1DlnSMFncvuaH0t4riI8unn7/tAPcXKVdyD0wR2HiyxYldWWHZI+pIAbXVYJrOQkWKmT37sXrwMtDHEPpM3AGRIQa8Vl0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=sORhhNBR; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="sORhhNBR"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-73b1fbe64a6so777553a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 05:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751459879; x=1752064679; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ojsw+AkNzV7erO26jokTtJOtY0VwWEiinzqI7J34IJE=;
        b=sORhhNBRPV0VFe2D0Ezy7r9MXnXH/YUd1/ktE9rGR+A08PN4c5H8EY3vH4CSUEchUF
         vJ7C5zPswNnwJql4JNvDf7+IDB/2pZ4kc32caOrxtDGjJ+eeWIRKrwK+XOXgPNCuNLoL
         aKheB+2bNYVq44FJea5TN4gSKTUWGBALNhxL+CBOsTisftoqNAo7jiFLF1KjN22TpVzw
         dV+2cooMGiZxGK1xRjU4cWPMDwW/rnnfxvug0s5znwq4QaljkY2oLWeQbRQAu34/c7TQ
         LIpW0eCGxaNUdaPlRwMI7Ubr4pBug20rntMikarEuwAv2mASAKuMDs6DCMJiDNizWKVb
         r3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751459879; x=1752064679;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ojsw+AkNzV7erO26jokTtJOtY0VwWEiinzqI7J34IJE=;
        b=GV8KzaNLx184krt94nzf9fKqggQ/J+8RPZqjWerwoUyXZy52DJ/5WqA9gJBvbhbG+T
         XKSIFK508sHnARCQAfd8sIGwwz3x7qZaH1ff78axn3sQ3fZlhA2fIq+YL+DjD6Ax9KmL
         3AMw523AtUSs27o3+Qr574t/uT7T8b6E8Si+6RClc1hf5r0y9zDwippQ+xYtVmj+Kqgg
         4Y/mSHtBUVvvU54vdzDZiXblx+qkd4C6IKR5voYJ1sO7gWmKC+I8qX9boRqLhC5/7fst
         zz7NCTM4+OUqWqNHC5WrNQ2tdUMG3y3InECvVBwY6h4SeegRPAMy25wp7W1RtBi7ql8p
         Z4OA==
X-Forwarded-Encrypted: i=1; AJvYcCVbGVuDKXzmw4hNWwLEggciurVV/jLZc5RIwt9pXoD/nIrzhm/e/DVUZtEgnHYbelNLdf0pavQIRf7mE5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWG3sHltyaEd1mThMle4fNp1MezRK/mS4elpqZ9ldPkKP2PxCn
	xDhQp/fZm3tVlkIm4fxx6kARrXbic82hPLUsVq+pFkXmyne4reiS1dq/e9cj/wdmDdk=
X-Gm-Gg: ASbGncugfYug29l6H+h+pqLoRp4TW6SezmJZ72bHShfWT6DSlpUNhuwTHFQenuiv1nx
	aHnWCdcd3yg22poyhIfdSPtS9jgDw5C3JTah5A6Jr/9BKWECfwuadEK9BczpTfHIcFIDOAXYTsg
	3rB3dFRhl2G3bSMQ/fruFqokilsQ9CQkR+Y4yIUCPmQda5eMc2YNDuZA4h8VrkZ6caFk0c+0Z+j
	yY641JF7Eyb9bLPPYILBUNxROA6+voQckgaGZMwMwSahlhvAExFriMTw2z5rPEVZkXrk3Gnbf0H
	zjklBQoyYvGScRn/t5Ckj6b721k3mL52Creqy40Dj6VhZzcka4E+XKldoqGhoWYRetgfx+yDZWo
	zUcNA7qFlYm7M5gc/NZ5StLkwvvBOlBW2Av6j8q0=
X-Google-Smtp-Source: AGHT+IEj5Dc1Netni0tqir/1xbnkQLxei6iTtHulTBtiYZFxi3bplPlig4+mWeKKumJKKpiHaH9WfQ==
X-Received: by 2002:a05:6808:2383:b0:40b:3816:6637 with SMTP id 5614622812f47-40b887f2c1cmr2015465b6e.24.1751459879504;
        Wed, 02 Jul 2025 05:37:59 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:70a7:ca49:a250:f1d5? ([2600:8803:e7e4:1d00:70a7:ca49:a250:f1d5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b32420a76sm2554421b6e.38.2025.07.02.05.37.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 05:37:58 -0700 (PDT)
Message-ID: <e040fcf5-df6e-4d6d-be98-284362c35462@baylibre.com>
Date: Wed, 2 Jul 2025 07:37:56 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/12] spi: offload trigger: add ADI Util Sigma-Delta
 SPI driver
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org
References: <20250701-iio-adc-ad7173-add-spi-offload-support-v3-0-42abb83e3dac@baylibre.com>
 <20250701-iio-adc-ad7173-add-spi-offload-support-v3-10-42abb83e3dac@baylibre.com>
 <52c1fe276d16b68b955a00d0417b40902e2aa56e.camel@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <52c1fe276d16b68b955a00d0417b40902e2aa56e.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/2/25 2:57 AM, Nuno Sá wrote:
> On Tue, 2025-07-01 at 16:37 -0500, David Lechner wrote:
>> Add a new driver for the ADI Util Sigma-Delta SPI FPGA IP core.
>>
>> This is used to trigger a SPI offload based on a RDY signal from an ADC
>> while masking out other signals on the same line.
>>
>> Signed-off-by: David Lechner <dlechner@baylibre.com>
>> ---

---

>> +static int adi_util_sigma_delta_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct spi_offload_trigger_info info = {
>> +		.fwnode = dev_fwnode(dev),
>> +		.ops = &adi_util_sigma_delta_ops,
>> +	};
>> +	struct clk *clk;
>> +
>> +	clk = devm_clk_get_enabled(dev, NULL);
>> +	if (IS_ERR(clk))
>> +		return dev_err_probe(dev, PTR_ERR(clk), "Failed to get
>> clock\n");
>> +
> 
> Small nit. Did you consider enabling/disabling the clock on the trigger
> enable()/disable() callback? I guess the ref clk will be enabled anyways by
> someone else but conceptually kind of makes sense to enable the resource only
> when needed.
> 
> Not a big deal (at least to me).
> 
> - Nuno Sá
> 

I thought about it, but we don't do that for any other FPGA IP cores
so I didn't do it here either.

Since they all use the same AXI clock anyway, disabling the clock
here probably doesn't have any effect in practice since there will
always be other users of the same clock keeping it enabled.
