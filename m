Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C297227BF7F
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745511234; cv=none; b=jxKIF7b3O6da6Y6B3W3kfXAWYZczA6LKa1rLUsuf1MLAJ4ozoCBkLvCe54EdDdo5wTd2wu9pCNSIHL6oaEoVG9C9UlW6z+NsbNBrJj/Fehq7e/v2mYb7stMcTwECtt0eslMie6F4BAs0LRtwhzPcnIV9zb5ebnBANhXAlhigjUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745511234; c=relaxed/simple;
	bh=Dw+SKeV8qbpQrNo+aH6L+cZKLIRLMEZ5C31rjsazirw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=POg2AHP38146C8V5V+vuHmBjEVohI7Ax77a56SXNS1TZr+COlnwocYDirqO6+FZCGkoYOQ/8z/pBrQrRMAweJPnpGkbqnr+axTAljC3JmQsTIM/oeMw1VICbtkcL9lZ4GRgx0TBp+zZdMFn/TeZ+58AktVw19VkIXMGu7XhtCjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q+N+zlIN; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q+N+zlIN"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39efc1365e4so647295f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745511230; x=1746116030; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xoqGBxqToQFbUCVFUs3Rhe0Fq/kgYP3j2kJdzJbbkmM=;
        b=q+N+zlINVknwYD7uAifplmEmpWWH0/d2c9tGpU3g3gr4T1Fm6EACpU5qED+CmUfQ3r
         qsuHeXXjppOXvh1VVxr0Y45m8jz+vOcaJhrZgARrb/gX2/OmishnKSTAKK6PbTQqqjku
         rFNzbfZQeOIDV2qhpjnp8E5ft55ViP+TgBpISl7ZBCNdzLyMIJ2JS4Toj8LLBqhSwWF6
         OXRLuEldmKoXVN1RSde1VV98EmlRvxIIP/hytIIqzrwKqurVHOsKzHd7d4aiA0vNqPM8
         IovEnTCyxIASWbpfGSHiiQocWYKrcVt+9CPWVQpEVln0HXnqKeQD5oOv5UVyjSNl6XDI
         Rr/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745511230; x=1746116030;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xoqGBxqToQFbUCVFUs3Rhe0Fq/kgYP3j2kJdzJbbkmM=;
        b=CTEcL06QtrQZjysJSGQSnT7lB14KOy9r9TkfeM/F/kMbEjU2llLuVjZoRpV4ebCk+a
         h824OfVmsPc1JP4Mb4bxpxq7lsCfVU04YEehh4z/of0kGdy5xrHY1kut3HRONEUFbJkT
         Iny5nArjtA26tBSI+yBbA4gDBEtFYRl+ORiYcH1dKpIrS3gwpS2Kplqv3Mzb875xJhty
         22bgWOaCSAgyjC8MvvAG1vdG8OMvKiNKt+2UTl0pMEJzk05AkVHmTqP12Yz2RJ6ksSlI
         dilOsk0/AAI1SnrbKBthuGb6L8WsHvWoh4cIEL9jYOgSjwrU4UJ3I2PWn9CxY/gtd/Jj
         TlUg==
X-Forwarded-Encrypted: i=1; AJvYcCXWmziXxEUdtsuVEVu5xuB7x+xlehabbF0JFR6aZXh2oqyhxjmhBosEV9NrearBcoNRuP12/Tf1LvJxzqs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFTCciaaWdkBC6zjaT3H+5Umh9AM67uzW09ddHVfg1zmpCNDC2
	g5inux34Yw9V01AtUkIuT+zaYNJ3AHBEiB2U+GpPNb6pUrFVUmgIzhGsuk4/MfE=
X-Gm-Gg: ASbGncvrHnQvhgC6t3y9lNmfNeBsUP0nVlpKn3g69ZqcBmXCgjXWa0F/LCBcGD60pPH
	ZfR0db/OwCKG/XrxCp6xODiuIz948fj23Wgia0lgifgxYe5TauMhUVoMRK2ZjV0TvExfN3kkrJl
	YW1QGGpEmpR3MAiMsW1vxD9Od03CLJTa6ib4GQsac75ZUANqohgdtxUTOHzHbiYxcdIKAdEI3F9
	ym8SsLTCxUUo4Qn+HcCUTZjllUBrQCO4nvuhJfnVj4ciAr2bDd2FmwXdj+2S61dqiCzYBaple0y
	OkQDSLixj0yds6/zNy2pQA7dPoAr7zLYI5ofOB5+YVPUWbWfQv8KQBLGq9wo7z/fds5r9nfBB85
	wxLaSGw==
X-Google-Smtp-Source: AGHT+IHjGEtl8c4nNfdv63Bu0fnAs76LEcgQP5CuedFuXi7DkoDIBaKDKjRS1tXSKCPZK7Jmlww6rg==
X-Received: by 2002:a5d:6dac:0:b0:394:d0c3:da5e with SMTP id ffacd0b85a97d-3a06cfa827cmr2963860f8f.47.1745511230050;
        Thu, 24 Apr 2025 09:13:50 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54c4c5sm2512602f8f.88.2025.04.24.09.13.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 09:13:49 -0700 (PDT)
Message-ID: <d97194a7-2b7d-4a76-998b-92da495e8bd2@linaro.org>
Date: Thu, 24 Apr 2025 17:13:48 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] dt-bindings: media: Add qcom,x1e80100-camss
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org>
 <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-2-edcb2cfc3122@linaro.org>
 <3ec3fd62-bf21-47e7-873c-ce151589d743@linaro.org>
 <54eeb470-cd90-4bc2-b415-6dea1ce2321d@linaro.org>
 <0ab31397-580f-4e5a-b9ad-d9bf79d29106@linaro.org>
 <36feffed-4558-4e59-97db-2f0e916dbfc7@linaro.org>
 <6a4ec36c-c003-4ce8-9433-8c12ed3188ee@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <6a4ec36c-c003-4ce8-9433-8c12ed3188ee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/04/2025 16:54, Krzysztof Kozlowski wrote:
> On 24/04/2025 12:17, Bryan O'Donoghue wrote:
>> On 24/04/2025 11:07, Krzysztof Kozlowski wrote:
>>> On 24/04/2025 11:34, Bryan O'Donoghue wrote:
>>>> On 24/04/2025 07:40, Krzysztof Kozlowski wrote:
>>>>>> +  vdd-csiphy-0p8-supply:
>>>>> Same comment as other series on the lists - this is wrong name. There
>>>>> are no pins named like this and all existing bindings use different name.
>>>>
>>>> The existing bindings are unfortunately not granular enough.
>>>>
>>>> I'll post s series to capture pin-names per the SoC pinout shortly.
>>> How are the pins/supplies actually called?
>>>
>>> Best regards,
>>> Krzysztof
>>
>> I don't think strictly algning to pin-names is what we want.
>>
>> Here are the input pins
>>
>> VDD_A_CSI_0_1_1P2
>> VDD_A_CSI_2_4_1P2
>> VDD_A_CSI_0_1_0P9
>> VDD_A_CSI_2_4_0P9
>>
>> I think the right way to represent this
>>
>> yaml:
>> csiphy0-1p2-supply
>> csiphy1-1p2-supply
> 
> But there is no separate supply for csiphy0 and csiphy1. Such split
> feels fine if you have separate CSI phy device nodes, which now I wonder
> - where are they?
> 
> Best regards,
> Krzysztof

The main hardware argument for it is probably these PHYs do live inside 
of the TITAN_TOP_GDSC power-domain, which is the same collapsible 
power-domain that all of the other CAMSS components live inside of.

As I recall we had a four way - albeit long discussion on this in 
Dublin, you, me, Vlad and Neil and my memory was we would implement 
multiple rails in the existing CAMSS PHY structure and then look at how 
to model the PHYs differently in DTS.

The Test Pattern Generators - TPGs would then also fit into this new 
model for the PHYs.

---
bod
