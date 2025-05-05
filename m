Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB4C175D39
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 12:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746449486; cv=none; b=c4yJMIVORKh4nftlSN1ApwPMHJyEyDmAn9LIvcMV8jE+F7XHQEvp1tF9uRm6fydUO1LofbREPz147drCeU+2h8Bqks9a467mK7ao3QLk1bjo/56i8xOlQz71vZ69VzQeqon4eLQOKPzWqu6kNsN3KLdlzvhQxWmtjk3EkdiYKx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746449486; c=relaxed/simple;
	bh=bIcSozAc+xYMSh9sVPfx52QKRR51aePq1H3jYrBumaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GhMNr7XSvrQkk8A27vhIKbvzfG7y3q7RMq34byfOa2qEEdaz5HU86Q1iMqQbWUwexeXXz7H91XYVW3JexIuvHyKqUCvXJY0glW9ZOHDOqbc0DqNweiLwji5SfkpqAz94qDewvOhE0YfYH7oyvbcRjtbHbzKVXuugenGHVyGDZRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UlGAAT89; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UlGAAT89"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39123ad8a9fso258748f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 05:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746449482; x=1747054282; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ndsmfORnkICQk8jSCedUOIfsQUGdzXAUTeHyArpuUsw=;
        b=UlGAAT89VCzGo6sDBKGbYBg6ro5Bk6wF3VdRXWJsMrGKzTSKu6VoObRmVUln/iDp+P
         Ff9NRkPm8mwrHDEmxAYRhO9B2WQqsIfGgxjjg9bpUok0Pmo30eeW1c7rEsWk/ZG4k4FZ
         XmYikuZQRXwhedUTZ7xRUNSLdz98aFvZ7vph0Wem7ylrtQGJaBeztPVdWVl3L4rYMzwB
         oF5mLe8ZvFUE9Lmej4iR8Kw0Czj7mQjXdOlm3gLYMYULn/X4bw8aZuMVUpkjllqIEAL1
         82GNPxupSxAgOnI1RKM5Rt6UGv9vXmyRlA8j43DkPMU187X41S8y9etp1mpYfQKooynn
         l32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746449482; x=1747054282;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ndsmfORnkICQk8jSCedUOIfsQUGdzXAUTeHyArpuUsw=;
        b=fv2Ubt8ls12f4GnjUlvr+YKt6btEhyNEiStRTWidDHgBhKWX+F9m3/eIPChW4vgM2M
         DwGa3djyUlFLtQexhNqt7/LM9s2edACjswrGemuHCzmFWwOWfgf27x8eym/we2L0PY4N
         T85P98dMx2t/O3GPMxSIKzKAjQuR9433vzbxWfIn2xeCY2rRWQmOg5FEDfUW4r5uOA+U
         Ge3Spb4RStYL15Zok1JsTyqMET+b9H43xcIZrxqMeBawKuFtwvxaZ25Ee4VhEPbC48Vx
         YYWEHn1uGrBgh5DRGkhVscyzU6JZpTHw22WtHpjitJvM+LdeGGLVfhbG62ZDX4X1+WFn
         MZyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2ZKjWrXcjMSgHP56HO1aV04umVDCGMElZQjocGQfs8WrX7+f3FdYethnGWDkqCw4dgqQIVgVt63DzPL0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0/lkjg0IfrTDpWgibP2nbPIxulBtG1R82tjp6J8s+FbYv2pK1
	l4Y+v7+rekBcCOS98NL9Ra34uztOo3F3PB0e1liqQfBF5+VkJCtEuVktMxzZKpA=
X-Gm-Gg: ASbGncs2MR7P6Yz10ttLuRC4l9G21spb+MNravAQFA6ekPj0QNT0YvynU2m1jlpjp0G
	Qu8jJVW98odoqdPiYFZ3s0/X+85MAsPIL7UhbwIS9URAgB3zscN3KFvKtTYhMuRZAlawjYS+myo
	KQlc5Ca/0FAA2HYGyPwEFFaW+/5QCn4twdK5LvqEvVcRf/a0RE6mVgwgO0ksj+VifCy4V/DHjVv
	Yl9BGFsSYocAgGQQmDlftkBJtc0wRHgPZ8WMi58tRVgxf4ildrUJdGKoKwR9ekk353BXh3+t6RW
	eF/bYsB6yx0FpMe4SIaR/1lH17J3cPh7cv9/tEVK/wfIdpHNA7wOxawS/aw=
X-Google-Smtp-Source: AGHT+IFh9MqrVoggZusz4VHj0uAdGrHI1bTqOdCSn/SPHpGaUlPhaICa/6fcOPCGmTg/zC8S7KfQeQ==
X-Received: by 2002:a05:6000:1a88:b0:3a0:6c12:237e with SMTP id ffacd0b85a97d-3a099af3ac6mr3160293f8f.16.1746449481965;
        Mon, 05 May 2025 05:51:21 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b0ffbfsm10134616f8f.80.2025.05.05.05.51.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 05:51:21 -0700 (PDT)
Message-ID: <a53149e6-2273-458f-9fa3-89fec112f4d4@linaro.org>
Date: Mon, 5 May 2025 14:51:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 0/3] Add STM32MP25 SPI NOR support
To: Patrice CHOTARD <patrice.chotard@foss.st.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: christophe.kerello@foss.st.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250428-upstream_ospi_v6-v11-0-1548736fd9d2@foss.st.com>
 <174636664232.45285.4829080141383638928.b4-ty@linaro.org>
 <ec294e4f-274a-45ae-ac10-464ae4ae6f66@kernel.org>
 <6d697e1e-84da-4988-8564-91430e820fef@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <6d697e1e-84da-4988-8564-91430e820fef@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/05/2025 14:15, Patrice CHOTARD wrote:
> 
> 
> On 5/4/25 18:16, Krzysztof Kozlowski wrote:
>> On 04/05/2025 15:50, Krzysztof Kozlowski wrote:
>>>
>>> On Mon, 28 Apr 2025 10:58:29 +0200, Patrice Chotard wrote:
>>>> This series adds SPI NOR support for STM32MP25 SoCs from STMicroelectronics.
>>>>
>>>> On STM32MP25 SoCs family, an Octo Memory Manager block manages the muxing,
>>>> the memory area split, the chip select override and the time constraint
>>>> between its 2 Octo SPI children.
>>>>
>>>> Due to these depedencies, this series adds support for:
>>>>   - Octo Memory Manager driver.
>>>>   - Octo SPI driver.
>>>>   - yaml schema for Octo Memory Manager and Octo SPI drivers.
>>>>
>>>> [...]
>>>
>>> Applied, thanks!
>>>
>>> [1/3] dt-bindings: memory-controllers: Add STM32 Octo Memory Manager controller
>>>       https://git.kernel.org/krzk/linux-mem-ctrl/c/43eb1b288072641b7de8f5d5c15bde69e6e8589a
>>
>> And dropped everything - it is full of warnings.
> 
> Hi Krzysztof,
> 
> What are the warnings you encountered ?
> 
> On my side, i double check and found nothing wrong neither on bindings side nor on source code side:
> 
> I previously checked that everything was up to date : 

stm32_firewall_device.h:117:5: error: no previous prototype for
‘stm32_firewall_get_firewall’ [-Werror=missing-prototypes]
  117 | int stm32_firewall_get_firewall(struct device_node *np, struct
stm32_firewall *firewall,

and several other like that.

See:
https://krzk.eu/#/builders/38/builds/915
https://krzk.eu/#/builders/40/builds/900


Best regards,
Krzysztof
