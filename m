Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D68214813
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745492284; cv=none; b=mbhyctBzxVFjkWgXtfbX8z9MPCJj8tMCwwHKF+AyrMMDN90wZWBT3BYL3T2VGX0hhfkOwz4NTrzyaRPrPpY1Su+YMLmWBq5cvVESqiFQBsDrQk2Sxm0TTdifEwjHmmfy7k2ZkdClLRGT2l9Sia12q4+Mm4FCteweVII4i3UthA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745492284; c=relaxed/simple;
	bh=Pq3S0GGo8xpMxP0bDXdtbOxbHwY8x23r662KDp4Xtds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jjtesMQLONxjXB1SRmZxZNo5RRfZkgM9oJw0HcSb6SAaPIU/h0pDjiF1PeoRbbB2Czv4MRwssX0W5DwFyawGWy0WCs5WcRle632jQY+5eoTk/W/NdZ5BVBzvWlK9ulozaJThj4e1M8ONWWAzIUoHXj9bkFry0Z6iYAIw6l0RP7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SbOr2YdM; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SbOr2YdM"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5ebf57360b6so138964a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 03:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745492281; x=1746097081; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ssmDMFvK6AVB1AC365qjDdhsUWTncGaBlF317y5zUw4=;
        b=SbOr2YdMnddc2Z/6RM+Sdf3NGGVDUKPXP8PU7E1+IsjlkJSfXhVqgF7EUZ/Hwe+Jdu
         ZJmIw5zYJuAFEILeiYFm1sf9DHAWA2gbdQmz1uBs5vdz26H1olpL92I2s3ULZ1JqOODC
         RDql8/T/K3L9YTT659Hkbn14Kp5GydY34ddxa6/8Yav8JhZZ0LckSKZkrFQgDyZhqV6S
         tBZokN41pGgIhyRlvqlwSoEH2U5ZfOuttQXdZBjyIx3Ich18oS+uu9txxMfMwK0YpzWl
         HlycVjIUuM3QqEUOB28zzhYE3IMoIjhznR3Lh95D10ITzleatEzvox20/c68ifRdJ7EK
         AUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745492281; x=1746097081;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ssmDMFvK6AVB1AC365qjDdhsUWTncGaBlF317y5zUw4=;
        b=UH/HAijHCD+CvcrGnLZwuQbO2HGAY33bK3lXE94BAZC4U/FySPfBVzo43fERVuZnqm
         94aDp3M2EPyw7vpeOAnnfgw/JU8s4QHEGLWvWHT1ZFR66anK3gmR+RV9trvshXuk/zQr
         ziV3qszIJNOO5I5U6Zmu/5FyBWdxOdv4/1kdsul5/gwIqHmPPHL5ewU3Ist4s2EUdWNx
         l3kQqTHb5sJzl4rrlRDNMq5a6lUhVvlH7scm/fdnTRIXBWRfN7X2lJxEAKIF7jxUsSBf
         SKlWf2Tkr0Ns9FWA0jXq/27R8EEXQ2mS0hOBTUpOllV0U5/iynp2L2nfELKRusnZlZTP
         u3NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVi5axBM8lN4mZ9SkBUJwVkV2er11NV0K4RyP0GrKurc991112MHY2ljNsB3IED/RemqyOMU0HSf/gz1us=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz5/eeoQDEhf6iw8laE51hfpj7Hrp7aE5GTDNrm+Z3BzLEJwg3
	xDj7yDPvTiVJU19QEzY6DlO3ZPGRl8cB7M1/TUcmtELzTGvwZwi4GS6S+UZAcus=
X-Gm-Gg: ASbGnctBGOnRfznP+65WHHIojQ1XZW1ZP7oC7e9FoW0N9W1MPfyvB+dxT6seZLHqQap
	brHUoKmy4sQofKijGBi8+zOsnDnczsytUEy3rBAbFnLW5i0i/BD4kuZA0NBwm9RrWPMftPuLNpn
	CmVqJekjsgCeGjMArq6pWeneQjWEYUzpjwEpun7nq9etYzgBBYkpegCQb4NzMkmtFidTTynl/RV
	XGyvsU49XCkHD7QSGtGRuMvt7VLSNs5uSi1HL//1Yf8oS1ld0+sCb/3kDqKeHFP0EBvcY73K4HQ
	oTOsBj2woUYVMW+8DMUJ/0hxC+1RrxEM45k8/QOY5e50Pg5I6jn168Za/vo=
X-Google-Smtp-Source: AGHT+IEL2tcLlFbjfMHaH/HmvwZ8klHm8Dlkp5A67ANVR/4NCNCNs6cK4rAntSjE1XGVX1gCkQ4mRg==
X-Received: by 2002:a17:906:f58c:b0:ac7:390f:e36a with SMTP id a640c23a62f3a-ace5744f5a5mr65044266b.14.1745492281259;
        Thu, 24 Apr 2025 03:58:01 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace59c2827esm86486666b.153.2025.04.24.03.57.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 03:58:00 -0700 (PDT)
Message-ID: <ebbdbb2d-d782-4b98-99f3-3f38194ba055@linaro.org>
Date: Thu, 24 Apr 2025 12:57:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] dt-bindings: media: Add qcom,x1e80100-camss
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org>
 <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-2-edcb2cfc3122@linaro.org>
 <3ec3fd62-bf21-47e7-873c-ce151589d743@linaro.org>
 <54eeb470-cd90-4bc2-b415-6dea1ce2321d@linaro.org>
 <0ab31397-580f-4e5a-b9ad-d9bf79d29106@linaro.org>
 <a0ff4fcb-2b9d-4b9f-b5e1-586ff3900719@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <a0ff4fcb-2b9d-4b9f-b5e1-586ff3900719@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/04/2025 12:53, Vladimir Zapolskiy wrote:
> Krzysztof,
> 
> On 4/24/25 13:07, Krzysztof Kozlowski wrote:
>> On 24/04/2025 11:34, Bryan O'Donoghue wrote:
>>> On 24/04/2025 07:40, Krzysztof Kozlowski wrote:
>>>>> +  vdd-csiphy-0p8-supply:
>>>> Same comment as other series on the lists - this is wrong name. There
>>>> are no pins named like this and all existing bindings use different name.
>>>
>>> The existing bindings are unfortunately not granular enough.
>>>
>>> I'll post s series to capture pin-names per the SoC pinout shortly.
>> How are the pins/supplies actually called?
>>
> 
> concerning it I would appreciate if you can review/comment the v2 of SM8650
> CAMSS dt bindings I've just sent recently [1], the equivalent property names on

I don't understand why I need to comment there and discuss the same
thing in three places.

> that platform were named "vdda-csiXY-0p9-supply" for VDD_A_CSI_X_Y_0P9 pin.
> 
> I believe both these platforms and likely the following ones should provide
> similar properties, thus it makes sense to discuss it at the same time.

So isn't this discussion about it? Why do we need to create one more?

> 
> [1] https://lore.kernel.org/linux-arm-msm/20250423221954.1926453-2-vladimir.zapolskiy@linaro.org/

Best regards,
Krzysztof
