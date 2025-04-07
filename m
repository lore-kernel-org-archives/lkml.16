Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6AC226CE6
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744011480; cv=none; b=h3/RQRBgU2oZREyKl6lJ6gyixvyfhthsQPOu+rrtoGOtV1ueMr0wlAkRHK3Uh3HQlgjLT35krqNWJF/gaDi0NARj7jI31YU7OaSVS33XDzMRiRXtKKFYGXKprESP/Y0KenYwQ/JzvGiU40x82H4wzkhn39Vif5j1yt5yGAnI87Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744011480; c=relaxed/simple;
	bh=wbpn05YOBnvAIAEQiPQ/6y1/bXax+ql2ksAKoSkC61U=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=AjDeTp+eytdTdA9Dd5NYN1b0hs9A8gtcc/DESPVITsjY2tbS/rYb21QRJvZZ6r8yV6E0V92jwRXXrKPSPb31RnrognMZgoAP/pc459CozQDxETxGji5pnGXN0YwGzvcrGNqLX07fk4I23htVhB5ov6QslPsLMzL5W6DxP2pENsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cu7WTj0T; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cu7WTj0T"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso43280755e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744011477; x=1744616277; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T/iUB0JBxFkjp2l/okcxobSe1sYUcwQcPDba5DDM9oY=;
        b=cu7WTj0TyOdy/bX5huGIqakvw0r0K0p8nILUQIvdPL0NMfGUh9pr7nXyBwnybLQNIW
         IHlHvcpJmsj4QIh3PS9ywIjVv/yMMOk3d8mSurbEhcNYUKKlUz4xwtU7AhpifzdZlnoL
         SxhOSCMVOEqvxNlMp6RD8N/vK9LxLVL455DWLjyvrf3ZjwjpBGr3uQwbSMXTZeFLnL7z
         S/B6UcoEBjkEwB+pfEXJcqy3M8/OEG3Gd1ppLzGovVWyIQgfzfDaB29A4C5RwtCARb3m
         mUdjMuS6cZWWEG7evG9jVf0I5MUlJ04Ki0S+uabYlQEYapWsi7sJNkO2+fN6JYkai4lj
         j+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744011477; x=1744616277;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T/iUB0JBxFkjp2l/okcxobSe1sYUcwQcPDba5DDM9oY=;
        b=LMKCN7lChWD1eczSlW+I3JYsaV0CVA6ci5GOWsPBc7BUPJg6Uth0b7+2rpXfb/K2kW
         03lxF6ulJpejlDKqXdDp6HXLR3TCuq+UOqTrMuG09hSu2h6EwlNA+RxJm3RCceseXq7c
         H26AhHOkKJUWStSt7Ss6p0AyluV9h/Smpu+MYN8DRyEtt6km0eWstmKXSNZxhVy6NSvU
         mGFdzZ/Op0GscEEnjz9nLsIHZZlYfRX8/9YOQm0/Bj1tG2W3Mh5ty4V4iu6Am5XUh3c/
         Vat7d9QEBUxJpI5EWzfA3AZKkbs7dMNpa1M2xYC/TNRBwOYhIJvBEOddS41RLqPr9OID
         mCag==
X-Gm-Message-State: AOJu0Yz0mU3fkUayw5kmMdaiWV2qUTtUmxjMqSnAQzuIL78JZx5Zs0zP
	NmAmcGT7PMkEslKktGZJyDxTST6SqD0K0a01zlRyaDH7cPnoOEznmXEvzbjJ8Sg=
X-Gm-Gg: ASbGncv/BZ58vbN1ghHfonln6A5LJH0rh6qGvZu2wRSoV03CeNOTFT/fEHJsfWNZIxT
	zOjvVSY8PxTQhuqEY2mvXRi3cKQqVm0puCwkxDIS6P2iQMLTTUnSHazYENqOTm3/BgfbPUscE3x
	bfiuK+7yDxIkSRn6n1jZn2RexsbLzMNQMeAlxCV0/Wj/O2f0j4EDuZqgGQYk08AUfpCjbK4aJdy
	VVo8zopS8kiN39Mcp3Q6MwQ3g7Cs8QLYTxrYRTphjRMp32wxpSqM9VgFGYqsGIGa4iRIqf5Labs
	Kd252WhB6p7WSmz8mbD905qDL4AzD4YC07oEGoioYKApaxX4inRYYCCMcMadrum8fCF9ELyf/K+
	Fq7etZ69m
X-Google-Smtp-Source: AGHT+IEDc/bRsFcizrk4e4TwMWtU8c1AL1TwXJ0IcJRIR1rjn42XqoKfWILEntbQHzwjOQZAQgc+Vg==
X-Received: by 2002:a05:600c:1e27:b0:43c:fc04:6d35 with SMTP id 5b1f17b1804b1-43ee0615d04mr74241945e9.4.1744011477415;
        Mon, 07 Apr 2025 00:37:57 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43ec1692ba4sm123138995e9.16.2025.04.07.00.37.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 00:37:56 -0700 (PDT)
Message-ID: <c14389a1-1904-450f-98c5-a55351518ed7@linaro.org>
Date: Mon, 7 Apr 2025 09:37:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: timer: Add NXP System Timer Module
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, thomas.fossati@linaro.org,
 Larisa.Grigore@nxp.com, ghennadi.procopciuc@nxp.com,
 krzysztof.kozlowski@linaro.org, S32@nxp.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
References: <20250402090714.3548055-1-daniel.lezcano@linaro.org>
 <20250402090714.3548055-2-daniel.lezcano@linaro.org>
 <2503deb2-b993-7fd1-adf3-cafa1e7bd2f4@oss.nxp.com>
 <67daf656-0e08-471d-afce-22ba8f2fa1f2@linaro.org>
Content-Language: en-US
In-Reply-To: <67daf656-0e08-471d-afce-22ba8f2fa1f2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03/04/2025 17:21, Daniel Lezcano wrote:
> On 03/04/2025 08:33, Ghennadi Procopciuc wrote:
>> On 4/2/2025 12:07 PM, Daniel Lezcano wrote:
>> [ ... ]
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +
>>> +    timer@4011c000 {
>>> +        compatible = "nxp,s32g2-stm";
>>> +        reg = <0x4011c000 0x3000>;
>>> +        interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
>>> +        clocks = <&clks 0x3b>;
>>> +    };
>>
>> The S32G reference manual specifies two clocks for the STM module: one
>> for the registers and another for the counter itself. Shouldn't both
>> clocks be represented in the bindings?
> 
> AFAICS, there are two clocks as described in the documentation for the 
> s32g2 page 843, section 23.7.3 Timer modules.
> 
> The module and the register clock are fed by the XBAR_DIV3_CLK which is 
> an system clock always-on.
> 
> page 1994, 40.5.4 Clocking, the documentation says: "This module has no 
> clocking considerations."
> 
>  From my understanding, we should not describe the XBAR_DIV3_CLK as it 
> is a system clock.

Can you clarify for the STM if you still want to change the binding ?


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
