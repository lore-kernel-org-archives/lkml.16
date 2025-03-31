Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80931C5D4E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 07:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743407872; cv=none; b=s9DgQe6GNi0FmM4cnjeI3gIn7ywV6FyXsHpS6mA5ILUeZiAXjxivw4V713D+z9lVr1iMm8ZXeynnea3WUGQevsF6qe+u+LzBkY2nDHXJtJu04lNl6W7IMM/g7vQ+Aopto2DK6sFXMSIQ7kePYqIwYtp4/cs+90yvl0zB6zBnqxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743407872; c=relaxed/simple;
	bh=uQAiW0xh9T93oGTP9h3lVCldUH2UyWTjwBomHNA7ZS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FSBs3B2/IYDSa3hwK97nTs/4F8qMWlGQgqqu+7tGJgUrLDymVmnd+UvcK8HfZIc3tSySI932pQWr5YH40TV66/qeyrO/F1Q0dlN0U0mtXEE+mTcKpguc9ftVSS0Ql+LLf7WQn0sm7jIfeDfcId5VTPLEvln+1OoVTSr+Erfp1qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WR6kewrh; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WR6kewrh"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso31349745e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 00:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743407869; x=1744012669; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cb9P2eBGge83IH6frvkGqDaWvyHFdgjejLm11WT27RM=;
        b=WR6kewrh+DlTns+kifM5m0VqpQN1Z1XbF1wEdNQl75EWZrRzZ189c2hZnpy9ngJ7GJ
         Rjc63VXfQL4bXsgtKhOxFa64G9fw6aDoRYhW5/7f1Htd7fr6k9wmlS+WCvf55xCp/EIg
         xC1nhDUxsYSA2HJl4o3Hjpqk3qxK+FYNXNJjK/6FNNnLXlXftxgL+I4d4j1r72wPu8k+
         L4eUweg6x1VSIzZ/MJWCTx4N+cYA3Mr6Zgd3b4qo5i2XMScb/yjhDiOm/8UQHnrrDQHw
         o0ObZrH2lL1yfrj3balfwXcggrNa41VwugEIkde8rgSJjfQooRLmHd1dVlNYhRU0kK9Q
         kkZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743407869; x=1744012669;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cb9P2eBGge83IH6frvkGqDaWvyHFdgjejLm11WT27RM=;
        b=uMf01ztGruZrLGEzt7j1ePDfqsGU8/BK0ps6wgv/9KYE4TzG9TIUnQhEkKznCgezd+
         gRQdnhveI+GyQv5nJwYhn9/etuoBkL1lnqbbNUGpx2un7CGoybtBnWFMZdrmxvuwy7/L
         km56njtEivSwg5BfR7C9h3Mszia/QpQ1oeKbuDd2oLMBCrH28wfIf4Bpizz6BHBZxDBZ
         Kt+RSo6sjwcyQPHWLsTz9Y1DHjfqNjZ3vYF8/wrPnDZ1JcxPPAguzq3lGwxVnABU+uZw
         JfpYaji+ZCNZTvJl8mWsabmSKqgz7OWuTOPTMfE7SHCkmT5vGNQvqdN5f23BZ7499Wzn
         brDg==
X-Forwarded-Encrypted: i=1; AJvYcCWMMWp5oiRYUOGJspCOEbV3QPzkUBFNwb517lPNmWfORuYjCjd6VbL0TTSADpbZC2EW6d8CHFfpxJeblQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxR9esHKjpHjGRpiO3+4sBJOkssSeRw3hX4KhWDUhKKhcBYIMJe
	y78+xH0ZGZ3O/SKew+UjgwA68HPqXTbeJrOtbtVp561+sawIjrADULUBhC9m5Qo=
X-Gm-Gg: ASbGnctKvyYaEKv8i7ppfGkkCm3AGdQ+AHN6Uttf7aS/SmIo+2CbO0QmjseH8GjO+he
	O/mGwi5tklLlpXMIoq91ERujkoqHT+elvmInVph7IqU+//0d5Ks+nkeIs/E4Dwa8vbgQPEwr0ul
	huix63rA9uHVt8X/aEUBLV1Tqo4JXvIdmg3gSA31IWQak6xpiN4aFd835JTCkE90/G1H5brD7A8
	td5s2lqUxa2bFgWemhnYvcu9y7VqmLdaXL1UlyvlIy8SL4rL8U3Ppmq80KfBKctjAME4enHLRux
	PJsncQoERJsnKu44QwciRwAXCbBkHKP5oAOWMNQWM89DT5fAp+EdmL7aXGFjIoHImh+MKtgOv9k
	Onpk/iCuc
X-Google-Smtp-Source: AGHT+IF0unItTD1myndsQvJL4VI58da+77wY4RcvrJ65zVD+XLVyfm1OIgOd+hYMajyXltywN80wAA==
X-Received: by 2002:a05:600c:34c9:b0:43c:f629:66f4 with SMTP id 5b1f17b1804b1-43dabe235ccmr68462625e9.0.1743407868982;
        Mon, 31 Mar 2025 00:57:48 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d82dede21sm156663725e9.4.2025.03.31.00.57.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 00:57:48 -0700 (PDT)
Message-ID: <0638eb8c-d87f-44aa-9f1c-eee529b1e1a1@linaro.org>
Date: Mon, 31 Mar 2025 09:57:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: Add NXP Software Watchdog
 Timer
To: Krzysztof Kozlowski <krzk@kernel.org>, wim@linux-watchdog.org
Cc: linux@roeck-us.net, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, S32@nxp.com,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Thomas Fossati <thomas.fossati@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
References: <20250328151516.2219971-1-daniel.lezcano@linaro.org>
 <c433c28d-c88d-4647-b472-7bc81b332d8c@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <c433c28d-c88d-4647-b472-7bc81b332d8c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/03/2025 06:04, Krzysztof Kozlowski wrote:
> On 28/03/2025 16:15, Daniel Lezcano wrote:
>> +description:
>> +  The System Timer Module supports commonly required system and
>> +  application software timing functions. STM includes a 32-bit
>> +  count-up timer and four 32-bit compare channels with a separate
>> +  interrupt source for each channel. The timer is driven by the STM
>> +
>> +allOf:
>> +  - $ref: watchdog.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - nxp,s32g-wdt
> This wasn't tested, so limited review - this also has wrong compatible,
> There is no such soc as s32g in the kernel. If that's a new soc, come
> with proper top-level bindings and some explanation, because I am sure
> previously we talked with NXP that this is not s32g but something else.

If I refer to Documentation/devicetree/bindings/arm/fsl.yaml

We found the entries:

       - description: S32G2 based Boards
         items:
           - enum:
               - nxp,s32g274a-evb
               - nxp,s32g274a-rdb2
           - const: nxp,s32g2

       - description: S32G3 based Boards
         items:
           - enum:
               - nxp,s32g399a-rdb3
           - const: nxp,s32g3

I guess it should nxp,s32g2-wdt and nxp,s32g3-wdt

Right ?


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
