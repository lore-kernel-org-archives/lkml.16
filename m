Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777EC19A2A3
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745492479; cv=none; b=qyMCELGXtZ0PwkRLxtDMo/+umuB176ctC4q4aUi5JfgkBsTYRAV2Oo/ETAJrplqkvCey2TEF0RyRIzaQCH+omYu46/QL/0eEeHlOaqgIjOcbq4Nk7j1sdqX4nEQeJneSqChJMWe3weKsWDfwSM90rtbo0lWt4EZxoyMiD0GbtN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745492479; c=relaxed/simple;
	bh=LRMvNGED8g7QH78pxs4OzLmg43eZZ9iT6bQtOLqONp8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eqfonkKjtDwK0DG2QzPg9l9++24lgu7/KZjbShggOu0A/nMo+bFx0uQKNH4iMn7OuzVJqgKgEtxNolliHYMz+NnmMmUH5Rq7K3zEoc5sVpj7nW1xWg6PF5URHRLJKblheASFoneHeEiJxf3M8lUq7j3xt1TYi9qRYuu73d7+d/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HmvryqqV; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HmvryqqV"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54acb0a5444so111344e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 04:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745492474; x=1746097274; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fKAiZ5oUfGoNvPn02SKW2hKz0+x21UCr7tagt17mZ3E=;
        b=HmvryqqVVf3TYIVGVXKlQlmDc0v+lplFNO9sND0sEhlOCpZZeWPtJARdHHkDsKI6ns
         X/9mBE9CdRWK5j/QlddQXDRa76fnj0rbdVjznxolmVdV6gC0nrWauyJzVmqyEU5W+5AE
         1SNOSxKyZ783GshHzBWnbEeCdPlcBVbTPRO6chz3JOxiyhnGB9gOR2AnLnX6RFsl983Z
         dtLZG03k+LgId1WHEtx12CoZJPbQKOPRmBZYlwGg4Q3rh3HHx/SVIo+nsCvU57goOMFB
         1Knp15b/UVfq0hR37/q+pyR5meduAb+aMWyvpXCR47ocXssdfe/B90WyzD7zzIt6lL69
         DZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745492474; x=1746097274;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fKAiZ5oUfGoNvPn02SKW2hKz0+x21UCr7tagt17mZ3E=;
        b=XzZrT53fe7fTt1L+1vNDOEZ9iWtmvhJoOLBh53AsFDNGqSQObiEhpBIfVcqgSegdIO
         yvhb3fXb4/ZCh/H88RbMeRFkm7xg+r1o64k296DVQEoCvpg0N393fJQNj+ctRu5xKFPg
         L0TlgxQ1+lib0b0ToJhaazsS+pwGcCtT5MAa807zyYQHrz/jf/d6O1i0bEbKna55FKL4
         GbCvTZk5Tz0ClwGTO5VWsVMuvnYG0NS585+gWRzyP9+lWwwH+afrHJxyH+/PFZ3F6vSF
         vdD0JGadS+2OJYspsBlqBFRPuL8pGi56d+FA7Ms6TevpGaczd1DCVoVNQeNX1vZDXbiT
         RCSg==
X-Forwarded-Encrypted: i=1; AJvYcCXQ8ltSC2R94+/O7H2keGz8Eb9uGFfROuFKTDUChokPXcN6awiwaPet+h6zxXnXENU0+MUzFks60PYRyO4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+E1EQ5AY2QtCOuCISU+aU5IlNDDbodIbesPplVcGM0ZFc64Xu
	uDfHmNyHX5oLj00ZW7eU5smXSfndVHiVvWASKB24gMcI2JgzEawUiZtPGqzSCyw=
X-Gm-Gg: ASbGncuw7OmzaS23T6MqIW+VwWw/IkX/TU3/0lmGresugpp7SYvZBNb3G+Yf1BqC5/T
	0Qcj0uMS5u4nXNbv3mGnsfPTQmD9xawctlsXw002JuanyYJ3tDoE+n1Bomqf82I8O+rPIscpRJe
	O8EEVNhe5olGZoOnAedvw9LihxyZdby7JlFRv9LNy4ayEoA8claDV/ES3/ZM7Pq9jCTENw/Jn2f
	+UDqAhXvduU09IgraOmv1xLnFvMKWZRu8e/yIT/fbiX0LeZgxDntPRE7cYLxs4dB3c48BGRG8Fj
	9KWhYtIuiVXJynEPy7fHV4XhSSth1OtCrW0dO+9BWLjT7wa5x2ZoTze0PHoAVS/k5ZJ+BdYNg0a
	oYKSqAFcu42benrjWdvY=
X-Google-Smtp-Source: AGHT+IGgDVI0PyQ95vORTGKJqjnW2hj2x8uhHnF4g9z7xQDBS5ScvdRcsn0yFlNT9J59RjGOp2CMCg==
X-Received: by 2002:a05:6512:3f1a:b0:549:5769:6ae8 with SMTP id 2adb3069b0e04-54e7c413dfdmr276608e87.1.1745492474321;
        Thu, 24 Apr 2025 04:01:14 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb88d1sm198436e87.252.2025.04.24.04.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 04:01:13 -0700 (PDT)
Message-ID: <df0cffac-498c-45d3-a65c-013ed914d479@linaro.org>
Date: Thu, 24 Apr 2025 14:01:12 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] dt-bindings: media: Add qcom,x1e80100-camss
Content-Language: ru-RU
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
 <36feffed-4558-4e59-97db-2f0e916dbfc7@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <36feffed-4558-4e59-97db-2f0e916dbfc7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/24/25 13:17, Bryan O'Donoghue wrote:
> On 24/04/2025 11:07, Krzysztof Kozlowski wrote:
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
>> Best regards,
>> Krzysztof
> 
> I don't think strictly algning to pin-names is what we want.
> 
> Here are the input pins
> 
> VDD_A_CSI_0_1_1P2
> VDD_A_CSI_2_4_1P2
> VDD_A_CSI_0_1_0P9
> VDD_A_CSI_2_4_0P9
> 
> I think the right way to represent this
> 
> yaml:
> csiphy0-1p2-supply
> csiphy1-1p2-supply
> csiphy2-1p2-supply
> csiphy3-1p2-supply
> 
> dts:
> 
> vdd-csiphy0-0p9-supply = <&vreg_l2c_0p8>;
> vdd-csiphy1-0p9-supply = <&vreg_l2c_0p8>;
> 
> etc
> 
> vdda-csiphy0-1p2-supply = <&vreg_l1c_1p2>;
> 
> because that captures the fact we could have separate lines for each
> phy, names it generically and then leaves it up to the dts
> implementation to represent what actually happened on the PCB.
> 
> That would also work for qcm2290 and sm8650.
> 
> https://lore.kernel.org/linux-arm-msm/20250423221954.1926453-2-vladimir.zapolskiy@linaro.org/
> 
> So for sm8650 instead of
> 
> +  vdda-csi01-0p9-supply:
> +
> +  vdda-csi24-0p9-supply:
> +
> +  vdda-csi35-0p9-supply:
> +
> +  vdda-csi01-1p2-supply:
> +
> +  vdda-csi24-1p2-supply:
> +
> +  vdda-csi35-1p2-supply:
> 
> you would have
> 
> +  vdda-csiphy0-0p9-supply:
> +
> +  vdda-csiphy1-0p9-supply:
> 
> +  vdda-csiphy0-1p2-supply:
> +
> +  vdda-csiphy1-1p2-supply:
>

This option will work for SM8650, if the list of the given 6 supplies,
where one supply property represens a pad to power up two CSIPHYs, is
extended to the list of 12 supplies, one for each individual CSIPHY.

Both options will be technically equivalent/correct, an alternative
one is just two times longer.

I would appreciate to get a maintainer's decision here.

--
Best wishes,
Vladimir
