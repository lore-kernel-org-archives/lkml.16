Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98962853ED
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 20:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747772166; cv=none; b=RWXFWdY2qjEb4RtKW8Gb9f0dip7ENJEk8qLyTYmEnp9b8mOVY65raH8wC6biOZB7P5aPyhhEgZlF2wYuiUj4pcIx9NoVhyDpetkOfIT2JPk5rb4TU1iZ9Y3WuSHPlKHKe0JNGiBDYdujOJOeo2BiSMHMDuVBz2kbb7l+iKk1VM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747772166; c=relaxed/simple;
	bh=xwX8SXBiV4rJxuj4dleNJkMs/Z+TlwBtHelnmb6gjkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BiN8rNfdyC1Ju0Ln2ZLuxv7+Evj9K7Z+3JmWT0p4yqoM2j+wpEz0ARijzoL8/qjf5cy3gPaexrwubjTg7tWF94xF8fvkTR1aria82IQXpD96Hau4SdSpBGObVEGy2D5791mWEi1bHFktC6FhcUuR6SShRjTceo67kkzzVzdQ87k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YCW8JW2x; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YCW8JW2x"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so46133795e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 13:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747772163; x=1748376963; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xwX8SXBiV4rJxuj4dleNJkMs/Z+TlwBtHelnmb6gjkA=;
        b=YCW8JW2xJaOCtXCtzXjKFO0SyIYtxQhgeGbXitkh0FlZcc0ixc3JHDT/lsA/G25Egi
         N59zUsq/VxrXNI/2NQiC+PPquQOcMYfOK1No1h5hXazMOgTeKS5MdEUyBbkarRcKxRzx
         rfTWiZ25SdhY+qZjsDU6FHIxxGZbFw3KWdPP3/m8HEYbxu6yxRJq8pT4FyBvEuH/Z1TQ
         kZK0KAYaTYiaL3OStA8pmrM3QD29plmhlF0XVwoYu1u2QwEFhFhzNSUACotxLeaSbzjp
         LovpnS5C4beuNdVxkh9SmTM16qYmf5K36+ra1Wb7/LqGpSDBGgdqiIkO8bMVn3OLTnuG
         IM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747772163; x=1748376963;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xwX8SXBiV4rJxuj4dleNJkMs/Z+TlwBtHelnmb6gjkA=;
        b=fVn70as0R2+nFUPRY5QgMe93DLN1CmIropZ7w1rVcF96/UZtfa/neWT5FWK9vazYjE
         GJvx504IqPTnjPOoI8BBWbDLSGPSPdvqbNeevYzLtMDxUaa4SqT9zvsrEJAoj5ERERSQ
         OX64I/dkedS9my0j1to8nwb5aYw+vd0oMivjwgpdmuNFCkmlfBAGwehpLUjs/3s3GvpP
         9ccDMXEv6g5jWwotgOVDK0UvmpgK1oLK054WoXzLhLnuYBQvUv+x4yNuTpsXJIpFqEMa
         dVT+lo5us74LLpEV8m3p+eENvrdLREGuN8XGzQ6l/dAJ+pYzJmmNm0I3ans7QsuUdmnJ
         N0+w==
X-Forwarded-Encrypted: i=1; AJvYcCW4uxsYqbeGqE5T8Eu2vSyuMbeTASFv0KK+M6cWjfUFPPY/lSearQlPBTRJtowmrwcO8siL/pmA1FwpnVw=@vger.kernel.org
X-Gm-Message-State: AOJu0YytnuoklHYERHNu3961STJ4dvapq1xBrrq3oO3BGUUxREX8hoxX
	ds6t24IuWuUz3YSJGS1s1la7V2muTIXKbLR1Msrdj5R3TCDQj53jD5OdGJqVNBdpzEo=
X-Gm-Gg: ASbGncuFIjFDK+vVaKA6wBuO7vAfDu4mp+s1mVPM9snI1BP1MMOfPzs6dopmhEzaxux
	wTeIA7HA8O88z76xdMZIy45RceiEyWXiEqkcyn8zbSHZCBe1g/T/TtBVIdhP7nHGebzI4yKV3CC
	1XZs7TJ4BmOpm6dp6nyDLt9U1PK2TW3L7/hb138MymBIT/ltG9rL5KXUdsQq3XgW69a+OIQYRf7
	4m29I3J4Oy2xOdgSdfVD2ebtu4JfbBZyMWGMDmT2rpKOFayhDr/M3WDtlpR0GM25oNwWy2Cx+U9
	vCd3e3vanQkVLGH/yWcQtMptb7lwVNVw+tHK4zDM1hKzmS18o4LRYss4o6WZrlC8f+KZWwKy3Y8
	nVghk0Q7M5L7OFIBF
X-Google-Smtp-Source: AGHT+IFomONvs1EX0RMA446jV5f93QAkM8Rj3K77G0JpdXLi12SD0UAU2iTB/izbisJsPSjdAcCOZw==
X-Received: by 2002:a05:600c:154c:b0:43b:c857:e9d7 with SMTP id 5b1f17b1804b1-442fd93d4fcmr143678295e9.5.1747772163086;
        Tue, 20 May 2025 13:16:03 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a03fsm17212470f8f.22.2025.05.20.13.16.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 13:16:02 -0700 (PDT)
Message-ID: <ba3a8154-2390-4800-a3ed-973eed68ec10@linaro.org>
Date: Tue, 20 May 2025 21:16:01 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: msm8939: Add camss and cci
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20250520-camss-8x39-vbif-v1-0-a12cd6006af9@mailoo.org>
 <20250520-camss-8x39-vbif-v1-4-a12cd6006af9@mailoo.org>
 <30dd203f-d7e7-420a-b310-2c36869f3aa8@linaro.org>
 <5acpcyzscv47uyyjhtpfi3x7oh47wafo4n6kd5iu6zs7rkpzro@nwkupv5mpjpi>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <5acpcyzscv47uyyjhtpfi3x7oh47wafo4n6kd5iu6zs7rkpzro@nwkupv5mpjpi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/05/2025 20:53, Dmitry Baryshkov wrote:
>> <0x01b0ac00 0x0 0x200 0x0>
> No.

Ah you're right I see we are only doing this for new SoCs.

---
bod
