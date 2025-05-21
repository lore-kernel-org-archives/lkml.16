Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A75270830
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 16:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747845447; cv=none; b=h/sTHqHV6clpDzW+aiyr5J9g73l3SuhnJSU8Oxq/J68ip8iOHdt+vcatRPM6mXdYu421VnNwJJrqR4kB5D4w1spYyEDVPT2tzJT8TaMkmmBPyeyTDEeJZ340x3Mk1xtBHqzb/3kTFET7CTyNcRGci9AuwRV8xR3e0Pg+6NQIk0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747845447; c=relaxed/simple;
	bh=WJFUbwt79LbK9/J1fsOgKFPQjzT6ApcXZz7LeXZIw0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BgIujKKqeJptru1AMjW929cShnxXaDVq0p6T5857TNlctjpi4VsLocecaSvjKdSSmwlnQiZBT0z+5SK8CJ3j/eSAwXwUFEC3jCor4aUYKDgOv6VgtOXKyvh19dJLp68pEwxZYJpBHgCfgTMQNP61hhaV5OGABrQoNDwjjtaBgQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nXdPVyvD; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nXdPVyvD"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-441c0d42233so7671175e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 09:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747845443; x=1748450243; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uPhAxNPlN8w7KN4mk2d71UA7Gp44ccgbareXesaXo7k=;
        b=nXdPVyvD1+1tPbh1C3rDKLvIVm+Fj6HFh8M3uva+fg2UfnVNp27V8fc1CYZAL5YTaR
         pQXzOlCqZJ2Ih8QHv6L9Dl9fmedZKhyrBUH1EapnBE7PGoMHv3UnELchAhVctbPLBbMc
         XRrKt+eE22ico6RVUh8d3Ow7MAwBWajv1CV1KM+3UsrJxISWydXjP0XepKc9vIVCfnVA
         xpDuVvMGByx/KAWFxFSSu2LyKYGZojPkbBF+LIN6Eua36pl4YHeJs9b29h9m7w0eO2Az
         yzHsUFlaAe31BINGHKfFGBCJFuP/U5YYzOfDA9cCPaMU6XuDsMJ+noKt99U2P3KH9CYD
         WUKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747845443; x=1748450243;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uPhAxNPlN8w7KN4mk2d71UA7Gp44ccgbareXesaXo7k=;
        b=mOU+TvLe5U+MkvTSIMaqsVfhMlSLwYUDDwWjoSj4Kp50C5Z6e3lYZCB+hgTdZ4IkTp
         icIU/8EsHjTC5Yw6bvn617xmQEAKXqwRImtoAqb7NtVjmrbtk64OWqtyYKC3NT7oNIgs
         +oBK4LgbYUqKMf4CmmKAdW7kFaWDEjQm+3YlWD2izf76puvVUDO6eXynyQClkz5ZpUWr
         lzlEtpY6WawUi5HYi/isDkUkM9MhfvovP9fzaN+OyaLHAwWW5pF5BhnCkZGkuVD+EU7w
         bYNGGUf7zxzwn3wGsu/7Eyzfh2HXSF+pLwU+9bvnQwBiRUmN6OQDeRuPfTZQvxM8w+wx
         NiJA==
X-Forwarded-Encrypted: i=1; AJvYcCXxOECIY6la+vFhooT2uHgZmXOPwNPrZnn3hWBasCCv2pBHYVWVVuimoesqjILYaRglZswcU1h9Hprwfd4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYiYzPac2JZQexxjZVUOv4L1SGcTTurG4vHnavDtFpFFQYpPQw
	ZjgCamjH1vjlrjWaulKbP5pJeTE4xBSeEm9oQKLBDDLz4vx7NkbnPUld2PlA3I3Fb+c=
X-Gm-Gg: ASbGncspOlGUx/KEt9nZKtb2BWvKK90NhJGz4nJO2mNzAugo5PzfawOcDa9/sR9Negg
	Ji8qOtEuYzWREsles/cuKRbhe45E416dMiT0kfNLJPm3ZYYHe94IQohtf3+89elv2J3/pef+eXi
	as2WFOEOUxsF2QB0DzUMQKt9d7xZ6KShAhqhoaQ1qIj3yZYTPJieLjiRW2URv73/Rfm2TcP8w9e
	PcUfPSj6VR4M59Y7Zm3ugqG6ymwQ9Sp0T6rSKX5sZ5RIcIg00SIQ3RcyTyhQCZVwvTq6dC43B0+
	pydgJGuSgWjSy9MEG7LsA6Z5LqfDrCdvcQrACtfFsH0UO2C4zXjkBONIu9wUMxc9V5wK37s=
X-Google-Smtp-Source: AGHT+IGKEZFWGoW9i9E1hLPiMyQOZA2hm2DX8YhQYDQHY5AVNna2aWPBWC6SlKyT6rfNygJSZXQN8g==
X-Received: by 2002:a05:600c:c0c3:10b0:441:d244:1463 with SMTP id 5b1f17b1804b1-442fd5a3c67mr46998565e9.0.1747845443398;
        Wed, 21 May 2025 09:37:23 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb56sm72808095e9.27.2025.05.21.09.37.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 09:37:22 -0700 (PDT)
Message-ID: <9846275b-8841-4bbc-88a6-fd6360a7f638@linaro.org>
Date: Wed, 21 May 2025 18:37:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [V1 2/2] drivers soc: add support for ST stm32mp13xx family
To: Rodolfo Giometti <giometti@enneenne.com>,
 Yann Gautier <yann.gautier@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Eric Fourmont <eric.fourmont-ext@st.com>, linux-kernel@vger.kernel.org
References: <20250519130859.3389704-1-giometti@enneenne.com>
 <20250519130859.3389704-3-giometti@enneenne.com>
 <815b3972-8258-445a-a028-fd1707c7c1be@foss.st.com>
 <cf69b49a-e2bf-44a9-ad7b-df01572457b0@enneenne.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <cf69b49a-e2bf-44a9-ad7b-df01572457b0@enneenne.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/05/2025 17:44, Rodolfo Giometti wrote:
> On 20/05/25 18:58, Yann Gautier wrote:
>> On 5/19/25 15:08, Rodolfo Giometti wrote:
> 
> [snip]
> 
>>> +static int __init stm32mp13_soc_get_rpn_uid(u32 *rpn, u32 uid[3])
>>> +{
>>> +    struct device_node *np;
>>> +    void __iomem *regs;
>>> +    static const struct of_device_id devids[] = {
>>> +        { .compatible = "st,stm32mp13-bsec" },
>>> +        { },
>>> +    };
>>
>> As said by Krzysztof, you cannot access the OTP fuses this way.
>> There is already a driver for that: drivers/nvmem/stm32-romem.c.
>> And the information there should be accessed through nvmem framework.
>>
>> For the UID, you should add this in your first patch:
>>              uid_otp: uid-otp@34 {
>>                  reg = <0x34 0xc>;
>>              };
>>
>> And add &part_number_otp and &uid_otp to your driver nvmem-cells property:
>> nvmem-cells = <&cfg0_otp>, <&part_number_otp>, <&uid_otp>;
> 
> I see, but since the device is called by the device_initcall(), when I try to 
> use the nvmem framework I always get the EPROBE_DEFER error. :(

.... for a reason.

I already said, this must not be device_initcall(), at least not without
proper arguments which were not given. IMHO, these should be also
documented, but we have poor history of doing that.

In any case manual probe ordering is fragile and should be avoided.

Best regards,
Krzysztof
