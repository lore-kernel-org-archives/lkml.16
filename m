Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8E822173C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 10:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750933149; cv=none; b=XUX487O9m5e5NbG3ulk+64CTYjM8X/YsOWkTZrMoCG37MqgiaAJZo0w0Uod4nSoASZ1w+rL0mp0ahxbWY0NdVXMON/AbTwXthb9bhXoh2a+mkjTVobrEd1GqkQvyq36p+uScvjs9gZ7YDNZGfVHkHLE7PskuaL4VHVta1UeTrTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750933149; c=relaxed/simple;
	bh=ORf1jAoipV+9qFhNmjCAhgnKjCxHxHChKLRLA7Th/yM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gq42+2MhsS3jW20b5qALf6xW4AVLXKSooGXRAn/a74qboZ3cU4i2kK9wbVhpQ9t3uoFo1/pU6iLvx/GCFGxCAgJqkq5Nvscb+GfV/895WcdBk7BU/0SVPw4qYiyAw7gnYCSO6MKGWAFJJHLnx3zDnHNtraQb4yGFBv4i94iIXYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q+Ty9IYA; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q+Ty9IYA"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-453647147c6so8646195e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 03:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750933146; x=1751537946; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wOgwuucZNG7PSzZM8+FS4NfuM4P4osp+GB3jAEqWNYo=;
        b=q+Ty9IYA8iLeNXXN7XE3LQ+B1anf74IpWnaYs6zPYmuZgkc7bfA+aZ7foTH/wvFCDz
         h1FiwW6Ja5akBYE1UqS+YvPtIRPt1T3KNAEyKg6NhwCIBAS8qomGEzkV34t533HoVmos
         cCJFuNDNOfL3V3+w/xmVCrmnVMrhi9uHSmCzsXHoLzyQ+K7bgqUHFD0ibkfrIiDNnEz1
         s3WkbOQl3eyq4unWsGk5H7jbPLXSPB2uJykjYcb2/W7Zd8L7HUyiM0BqZxgckrppN4r5
         QYgNbys+JnM+lovVK+fKVDOSqo8V0PBRryQB/avtXvcgeSh93v7gnw3cDayd2nWmyv0X
         3t1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750933146; x=1751537946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wOgwuucZNG7PSzZM8+FS4NfuM4P4osp+GB3jAEqWNYo=;
        b=kROTtN26vMOaFqbjliR1BSnZxxVFUfkRAu3zH0F5La2sQJxUyCIVahjG3oCQwFreJR
         NerfXl9MFZp3W7PbP82Bqvq7eM8g+4LMDuFuRlW0FgFa46KRVIEJPh4IU0xjIH6KrsEO
         WOKeyTlAwaXo9h+gN9xRSVXBQLnBALABFbKT0F9XjNel6FreHIlqxZgw/dOzItXmywPY
         shunQIEBOY1z5vtMOVzXaOz+myVLMEkREpXsLsmPVfjM7dE7+FSXsB0zizyumf8L6nl6
         Yqox0B3mxAR41R7NEwstD5t0DWVQNGUw00XpyEaR+uKG21pegcCAXm2eNC5W2e52syyN
         g54g==
X-Gm-Message-State: AOJu0Yy7+sN3sjWoVVS09oxRURu0c9Nrplpr3faOfZRndW31jeC0wgPD
	Gwo2GtKUNKqFjR1Z7hVTYJcuDLJ6meherJZ5Yn+FWxqVGGrSb3u6EBAKm7WVk5jPTB8=
X-Gm-Gg: ASbGncswI5o9QkWgkQ9D3fXujaqPzPWGHe4FLrMXXO8VBiLTd5yWCQea+GZdEJE41sI
	qHUcoZC/NJuJpgvD5/jGhjYKRYBa8MZ+5vyjgBeWH9myq1hJjijTGabGKvaW5/qgGHpyb1QIBHo
	evw/lHldV0915rkBZu4qlg0DT+Yzvewq3P6bS5VjnpM//gOlwClaZAA79JPKNRsHkh+tiXieke/
	DTfrm8NfD6tFXU6Ezd+PhdAQhBc0D4s/ZlSROlwbWCrjfRoMeKnjNcyfa1fO/LIBR0v25bRnh5p
	TvUgbfL6OtAE0KXY6ZI8+Pdx/ohVlkWA83knP/dZIORpn/TbmbU8yYa91H4GEnBkNfA5ytt32yp
	78kMQp/B3ZrWQC15X0iwIi7rLZWg=
X-Google-Smtp-Source: AGHT+IHhY4kA1SbAViLB8X9Km2mENEE84lQY6AN+7FfCsVcgs/PjhB+h05Xzr97C7x/nhon5QU5BGw==
X-Received: by 2002:a05:600c:548f:b0:442:f98e:f37 with SMTP id 5b1f17b1804b1-45381b0f431mr60466415e9.21.1750933146492;
        Thu, 26 Jun 2025 03:19:06 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538234bc1fsm45131555e9.14.2025.06.26.03.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 03:19:05 -0700 (PDT)
Message-ID: <e928a7c5-56d5-4f2b-b667-bdbefb506d1f@linaro.org>
Date: Thu, 26 Jun 2025 11:19:04 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] media: dt-bindings: Add qcom,msm8939-camss
To: Krzysztof Kozlowski <krzk@kernel.org>, vincent.knecht@mailoo.org,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250613-camss-8x39-vbif-v5-0-a002301a7730@mailoo.org>
 <20250613-camss-8x39-vbif-v5-3-a002301a7730@mailoo.org>
 <50fa344c-d683-420c-a3b5-837ec6d8e93e@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <50fa344c-d683-420c-a3b5-837ec6d8e93e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/06/2025 11:00, Krzysztof Kozlowski wrote:
>> +  reg-names:
>> +    items:
>> +      - const: csi_clk_mux
> No, I already provided arguments in two lengthy discussions - this is
> not sorted by name.
> 
> Keep the same order as in previous device, so msm8916 for example. Or
> any other, but listen to some requests to sort it by some arbitrary rule
> which was never communicated by DT maintainers.

I don't think if you look through the history that you can find a 
consistent rule that was used to arrange the registers.

So we are trying to have a consistent way of doing that. Thats why the 
last number of additions have been sort by name, because it seemed to be 
the most consistent.

commit c830aff08d51f8391e59fc6744757c58e320b41b
Author: Barnabás Czémán <barnabas.czeman@mainlining.org>
Date:   Sun Nov 3 10:45:35 2024 +0100

     media: dt-bindings: Add qcom,msm8953-camss

commit 2ab7f87a7f4bf392e3836a2600f115a1baa1415c
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date:   Fri Mar 14 13:14:00 2025 +0000

     dt-bindings: media: Add qcom,x1e80100-camss

commit c35ad8e3c59714e9cef96036edad1529e70d1a7a
Author: Depeng Shao <quic_depengs@quicinc.com>
Date:   Mon Jan 13 10:01:29 2025 +0530

     dt-bindings: media: camss: Add qcom,sm8550-camss binding

commit 0274ea59f83e4650c75b1a0370fbfa540bb88f9e
Author: Richard Acayan <mailingradian@gmail.com>
Date:   Tue Feb 4 22:50:15 2025 -0500

     dt-bindings: media: camss: Add qcom,sdm670-camss

commit 5593555343f3ec299ca28d46a478e718c1119f74
Author: Vikram Sharma <quic_vikramsa@quicinc.com>
Date:   Sat Dec 7 00:48:56 2024 +0530

     media: dt-bindings: Add qcom,sc7280-camss

---
bod
