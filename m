Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B9A1E9B32
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745489839; cv=none; b=sV1t/Th8ztKYHOdUrKSUpaMssHefoE8U1D1iKi0ZAQhbFUOVodT23rkYMsi1MM2j02M5cZi7A7WzccxwFKLrY0+1Ly44LYYeDqTtF3qIZNzVviNnXStrkI7f7npnPboXG9hAq8E3+3c1oIIwkZnsZ9m9HQLswyOU5zUJA8grSyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745489839; c=relaxed/simple;
	bh=JgxDASSoJfH/+WDmK4aXcaHmUCS+QeddplH3cTE41pw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oxDXuCfQE73sVJUVqJTwC6aMQ3JtgTZNhpkhHN1HP3iiXhFUm3L6OxzMbHtIYWrPioKdasdD20aVj6ocz1ugZyP0IFMXd9nctrgcexKWdhetc3CenefWeEMliJSnXLqQUdXypr3b6+Yiqbw9O/Oq8E6E2XrHlUN+qJaQDAnoB8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dPLs56kN; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dPLs56kN"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3913958ebf2so646389f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 03:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745489835; x=1746094635; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/+Imx+wQAU0QKY64/Iw1K/RWq1pYJ8SS5BPHHrm4NL8=;
        b=dPLs56kNFzFtqwTzhQ5o+f6TXMXFNBEloI4mq5ZKZI0I5To4D2sdhXUfcbeeRgIClv
         fpJC4b0qYMvsabyA0xoVLE4s24eOCjfsCnvYUMjNUvABFPfKkizXg8WnzTzRzFyz08yQ
         s8NG4lmNdLWxUmrwYlFUVoB3P40gX+7NNO90al6zGyluLuyD0fzhf9QL9rItHyapQ2Lw
         AT97Iux7cKO7YfLK2Ncmqk5qOqsZiFJvc1r3/KG2BImRiEBO91KO6llASFCRNJtqKZWO
         4fkLjmDwiMDn8DfZzRdasODuFH1S7AiW4ja3SxMGOLLSwKpOnKxl3ilbzBZe/1zS+1jo
         Fw4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745489835; x=1746094635;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/+Imx+wQAU0QKY64/Iw1K/RWq1pYJ8SS5BPHHrm4NL8=;
        b=uoWC2/znatJzRTZ2M+hShlDD4mzKZfLQsFS/w/orIPqYI71VycmnpzlfqsSvmnKguk
         Dz+yTuCEJZ99O0VgQLjyHYWNj1MG5oG9bKKa/Gz9Tq0DivhaLHvEX6mChSNM5W8r7ax8
         FfJHGpI7bVCKfYbCPmGV5iNgD/CVzfHBMSFv+0AXLvoOen2aPInU6beqGYgBlVJsXELe
         u4PPjrMnSICeFqWmg6Ncvtq6kXaIjuPoiv5iTN2tsKUR2asTh2tqhhziVIMVNvFaJ3vn
         /YEv0bcZ2fQSBhwJC+XFOgN4H3LbY9QhaUTCMjtcgdVVazoBW8+GOYGe3xnB0E6JZAmF
         8Mbw==
X-Forwarded-Encrypted: i=1; AJvYcCUyBKzA0sYFttseQtkbF3Kv7p6tru0a3hyQU0pYp42/DplrlBW+JfzKbU49yw5Y+wv/otR9lh1VnNZ79Rs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yysa8R8N5XSvGupld15P8gNfALdVBigj4eT/+OuouIcp1zYJs53
	KZhFEEjB9F84P0kcoRAkgcUb1FVoDov9hL9mnRg27CTwYcxiFobxdxH+66kyJp8=
X-Gm-Gg: ASbGncsIT/3tB8hCNVvkKql619CZqcZGLzlFmdoqENfZnIf96ur/RaSfs1ef3lHVjQ9
	8TvqLMwiti+3XdBXQCjJDnMiTgEsYN4SML1KeHacncCTtfzv1DNYUvVHPUzRruoUBkME8eRqJNE
	gJUb43sidNOFlZM+f9k+LbkKmTnrhXBffY+gGi1NTvk94/8WIKuXdp/7Ijb8BZRrsUnP/Kdau03
	+tcvCvTDYbrss8vdcHPRh0XCianAubGtbD8PmovR/Ovww5tLaz+WlpBRfROKX3mAtJktKZrynrp
	39LQaUBzi+rSuXXXVOayVFTyYiiMtcZZbueswjFOOX8MotNN3O0PulYX8smJl4aFv7U+fU1j3NW
	6r7JnvA==
X-Google-Smtp-Source: AGHT+IEC5Ceql13E4xaaL3vBXjhyhbINkr5oD2t6MLRnBCK5ExF8s71Axb37L5Qr5Iw6ung4pwT7lg==
X-Received: by 2002:a05:6000:400f:b0:390:ff25:79c8 with SMTP id ffacd0b85a97d-3a06cf5996amr1872460f8f.20.1745489834980;
        Thu, 24 Apr 2025 03:17:14 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54c246sm1571967f8f.86.2025.04.24.03.17.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 03:17:14 -0700 (PDT)
Message-ID: <36feffed-4558-4e59-97db-2f0e916dbfc7@linaro.org>
Date: Thu, 24 Apr 2025 11:17:13 +0100
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
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <0ab31397-580f-4e5a-b9ad-d9bf79d29106@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/04/2025 11:07, Krzysztof Kozlowski wrote:
> On 24/04/2025 11:34, Bryan O'Donoghue wrote:
>> On 24/04/2025 07:40, Krzysztof Kozlowski wrote:
>>>> +  vdd-csiphy-0p8-supply:
>>> Same comment as other series on the lists - this is wrong name. There
>>> are no pins named like this and all existing bindings use different name.
>>
>> The existing bindings are unfortunately not granular enough.
>>
>> I'll post s series to capture pin-names per the SoC pinout shortly.
> How are the pins/supplies actually called?
> 
> Best regards,
> Krzysztof

I don't think strictly algning to pin-names is what we want.

Here are the input pins

VDD_A_CSI_0_1_1P2
VDD_A_CSI_2_4_1P2
VDD_A_CSI_0_1_0P9
VDD_A_CSI_2_4_0P9

I think the right way to represent this

yaml:
csiphy0-1p2-supply
csiphy1-1p2-supply
csiphy2-1p2-supply
csiphy3-1p2-supply

dts:

vdd-csiphy0-0p9-supply = <&vreg_l2c_0p8>;
vdd-csiphy1-0p9-supply = <&vreg_l2c_0p8>;

etc

vdda-csiphy0-1p2-supply = <&vreg_l1c_1p2>;

because that captures the fact we could have separate lines for each 
phy, names it generically and then leaves it up to the dts 
implementation to represent what actually happened on the PCB.

That would also work for qcm2290 and sm8650.

https://lore.kernel.org/linux-arm-msm/20250423221954.1926453-2-vladimir.zapolskiy@linaro.org/

So for sm8650 instead of

+  vdda-csi01-0p9-supply:
+
+  vdda-csi24-0p9-supply:
+
+  vdda-csi35-0p9-supply:
+
+  vdda-csi01-1p2-supply:
+
+  vdda-csi24-1p2-supply:
+
+  vdda-csi35-1p2-supply:

you would have

+  vdda-csiphy0-0p9-supply:
+
+  vdda-csiphy1-0p9-supply:

+  vdda-csiphy0-1p2-supply:
+
+  vdda-csiphy1-1p2-supply:

Which would then be consistent across SoCs for as long as 0p9 and 1p2 
are the power-domains used by these PHYs.

---
bod
