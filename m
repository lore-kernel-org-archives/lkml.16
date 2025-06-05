Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBC01EF39E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 12:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749127691; cv=none; b=BzVXk2IqKow71DCKJMHpUM9bNGuW9ipIk9tjtec78VPPnrMgtSHc7My8NISsp7ZN+QzBpLc6gl+N4j02hl1hieH30AOHhr/RJekFmj+wCsF3rOyKAj8GbOIVXIdOdz6n6YA30lx2AqrFBFNcM0SleGJ9zt6k1EBa3+P9o8ajxRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749127691; c=relaxed/simple;
	bh=wWC8vTRxd4PCSHw6ozhyBpPg3oAWX6S9agX0DtmSV7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kl/a8JBvDFBHREJyUp7ob6CmHYodl9aQMjRV8Y6yKg3jNPbzwl39gc52XktA3/CS9EWwoQ3lHCitJiO7aFJ1q/dVv6MPRxdYks4G+TSvKELFuR+2XsRf2Q17fhS2mBCPTppWxL+FjdNFXTY+BoLZqvdYKEAYixkRKaQDkjrgPOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tid6uU+A; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tid6uU+A"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a36e090102so517485f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 05:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749127688; x=1749732488; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DD3X3bkoKyLMyd5gKvCIGY/mSWv524B+viUEHfNcoG4=;
        b=tid6uU+AkAHmk57IwrAFgnQ9ZjzvLpPOIF5/QkAMcrZH8jTdkF6z0KgRUv+ZsQYfvP
         zRyvtxXBxW9D+JXadJMvphKJLF29X1veMxoRLQOfGlKjZHHmYFi+LDEcbkEHfOqn/GQo
         O6GWiKMmyOm9lCxQNhz/JliXgpvIHYTkOrdQmxQQr0spex8l8IZ9qg+RVDcPNYXf8Yly
         6cIcBxeKi0mh6RxgyFXILLZ4TFNRm89UN3D6x4cXbBWJOSlEetFtaWIZoPMRfL95QuhY
         9B1ekyM62fHkz71YcAczCLxGKnzvSMA8x86gR+NLqdvIvKy28eekPLMI+DWWKleRxdcJ
         v/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749127688; x=1749732488;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DD3X3bkoKyLMyd5gKvCIGY/mSWv524B+viUEHfNcoG4=;
        b=l3pTl7JRfgysoqdp9GavjKGB21I7JgCWLq+bP4xVr7AHLvQbZ4e5OlRF81L3h7v8Ro
         1YemaaqdmOCfG7p/t3FCH8qLyJQoEdM7QlXuljiQS6cbdvacyNZ3MCawAykU7OAxxlK3
         ykx4grRbjFgmW3RU8JTsFGA09T4YdgvG7vaaXEQNcTR4oXHhiT4fwmJpKgpMG8vvo1SQ
         7u/kFQxIHb+48FgIMlEBb4VM8GQnN77ue7eeGJ87BSUieB1TTaK8Q3BLTYNnM9PSAczI
         0qps3vbrfDivMRLx5AfPjda9tFH8PzclhoSQYm05Jb4LHU9sxvpnIjLWcvdVPAwhaIQk
         uf3w==
X-Forwarded-Encrypted: i=1; AJvYcCV9HLP8pUUVPS1CUPR8TGu+znryVAyoRf9+y+2PkhYsuBbeYSoh2MSGbZkqbd9Ico/0EenHiiGacqhBvOA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSvd9Ga+fBVPvgrCy2oP+AN7q6eizJqDkJF+qAoHJaypXEmDDC
	FpKqGEBmRE6PU5z/uOBw4s8Ofhec8vyGP0MMyIsvvTpgrBmajAvBeMVCea8MEd3ogZk=
X-Gm-Gg: ASbGncuSv58lXgCfw/U7HfvIkpViVJ3PJHFsU8Q/GwViocLy8L1a0e4eDzIqg1bVm3f
	UFNEHOsoz+vxJw7qJ4Cei2P8hd8VTDAfFTHqRaaeV3Fnp3bXvX15CFKSshXq7DIrptJQ7aZcubi
	6CjxyX0UGKO6Sgi+Tme/XeHEDPcHP66SQrxZkTcA9+YkP+vwshHdQZAscmYQgIjSA74mEFS14ls
	8X0zufwr1GtmA+Fb6KXKu6RLjrk0xIpGN9gBK+a1FrApC6SlaFHKJV+2puzKQb7zoMPtKcIc6uh
	dCSEX5iYfGBjVY5wWnBCftxoAMTReKQ57imNFJaoZvGCXdpXsxs8hN9lw9E=
X-Google-Smtp-Source: AGHT+IEwmO65LIe9TsZFLYgqhHXDd2a/mab3lz1o4pMeJkOsxlaOnFsXZyBKpwTgYdWa5aLH5sL/BA==
X-Received: by 2002:a05:6000:2210:b0:3a4:f7ae:77e8 with SMTP id ffacd0b85a97d-3a51dbcd100mr5959406f8f.15.1749127688507;
        Thu, 05 Jun 2025 05:48:08 -0700 (PDT)
Received: from [192.168.1.221] ([5.30.189.74])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00971e4sm24840719f8f.65.2025.06.05.05.48.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 05:48:08 -0700 (PDT)
Message-ID: <550a7ead-99a8-44ac-af49-c0e9d79c35c9@linaro.org>
Date: Thu, 5 Jun 2025 15:48:04 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 2/3] arm64: dts: qcom: sc8280xp: Add GPI DMA
 configuration
To: Pengyu Luo <mitltlatltl@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@foundries.io>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250605075434.412580-1-mitltlatltl@gmail.com>
 <20250605075434.412580-3-mitltlatltl@gmail.com>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <20250605075434.412580-3-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/5/25 10:54, Pengyu Luo wrote:
> SPI on SC8280XP requires DMA (GSI) mode to function properly. Without it,
> SPI controllers fall back to FIFO mode, which causes:
> 
> [    0.901296] geni_spi 898000.spi: error -ENODEV: Failed to get tx DMA ch
> [    0.901305] geni_spi 898000.spi: FIFO mode disabled, but couldn't get DMA, fall back to FIFO mode
> ...
> [   45.605974] goodix-spi-hid spi0.0: SPI transfer timed out
> [   45.605988] geni_spi 898000.spi: Can't set CS when prev xfer running
> [   46.621555] spi_master spi0: failed to transfer one message from queue
> [   46.621568] spi_master spi0: noqueue transfer failed
> [   46.621577] goodix-spi-hid spi0.0: spi transfer error: -110
> [   46.621585] goodix-spi-hid spi0.0: probe with driver goodix-spi-hid failed with error -110
> 
> Therefore, add GPI DMA controller nodes for qup{0,1,2}, and add DMA
> channels for SPI and I2C, UART is excluded for now, as it does not
> yet support this mode.
> 
> Note that, since there is no public schematic, this configuration

Device tree should describe the hardware, not hold a configuration. If
you are configuring hardware, DT is not the place for this. Same goes
for the commit short message.

> is derived from Windows drivers. The drivers do not expose any DMA
> channel mask information, so all available channels are enabled.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>


