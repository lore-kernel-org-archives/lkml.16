Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1664198A2F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743410303; cv=none; b=OWKmNxNfO71Aqinn28VJMK0LvzTFRmpletaurPZKcNiOXiIG26q13c7y9nXlYPu+14AthdYEbdTFm+hNam+/9z5RwOfmODPWCcilFfQx/n9euVcCywO2vyrh7FHw0jKdbEHgvLYsBMZ+nvjC/T1tE9oNuPeuomC9b9/9Kp0b2Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743410303; c=relaxed/simple;
	bh=C6W79Pn/Wc6018sYDbU26845EKRSckUDtwme8tsuYbg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bpDlwgiZc/vmnS997D4fHIQOiQanrIYH3ALhlrmGWMkhs2BOoC9tmNjJMmh3z1N/VGhfdpcYEfCUD48YQZuCRyMs4ctNmyRqsD+50xCkKg0ruA07WU+jZEZdlRCymTm04W7kHxAIL92spmeozcLrcVoT5VevqPn23WxCLiHSwXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zieLHvui; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zieLHvui"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf848528aso37585345e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 01:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743410300; x=1744015100; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sSvzNDeWLA9j3MF9b45BUxK0OhrQzBBAn5lDkDpSzqk=;
        b=zieLHvui9XmWRTpftBJi0g7mhVjaq6kfvzTbSeDj5QMmU3sWJSTkB5RpLRAHBhvO9a
         ZB22fbF+yLvfA27BKG8t1+BHvlYW6O95UpENV4DMnLnvwtoEbb6A6LRRXOjkCae9ZMJs
         LGLjOlPXMWSY8uCbSfR+w4AWaxAARUvWBG+jiHSvStchPoo0v//W7oPdv4hA+6AlfYTm
         9G4u5eg2GO1vIpwu/bH8aXjEGhT1xVT3tnL4UCgx/dvHHeUDsSTpGWNJKxJ2ZddbxBtG
         0+Q3ho6hdNEZRi9uCnIRLisfMOnHjv2s1DVsiNceC8JjLZFrwymGXxqXIhp9iZkD8BuL
         z5Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743410300; x=1744015100;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sSvzNDeWLA9j3MF9b45BUxK0OhrQzBBAn5lDkDpSzqk=;
        b=Nuaxi4ZENd5I/PugNSGTyarOxGvDzcp2Fr3yRkht9eoaA4hJAV1LqmkoYS9Pc1z1yt
         XViGOUlz4zTVdEmv4ws1t3L6rFXebtH5G3+Q9N/3RBcuk+OidJ0Cj8/1hOIKzV6iUEwO
         9fPN3x0hY4Ek0T2TEZ/Q+RAmt/f4Ayh1RP5vSv31olqILOaKBwVdBiTZDdWpC/nEzyVH
         Is2KwroofowcQYt3rZcUZOKPBTwD0rZ7lQaCjGqcX27Em4arZVY53x70NhOFHDwcdsLD
         1GrOTEG8Y+8+UxNSAt2S5WF9WAv+bKFqrYYU0sY0A11sGNcuTkVfM495lFKaGg4vYAgk
         KudA==
X-Gm-Message-State: AOJu0YxI8Por3hxnnbizBkrmuRo0vnGnlX7GiBz1iVX5id+KfLTHHKn4
	624+F7uZDa4rnb30IiDA5GuGxnfm0WrzDsNC4AsfZe8x4P9qKVKbyg1jSpS4JQ4=
X-Gm-Gg: ASbGnctWGwkbwpNQzW00+jRl0WEkVVzW0CRQeLffitQ8L8LM96urd+DDwhtHfslXfqw
	nWWa/ggZneQejjgHYRqJNSfk05hOZjyWOxnvd8DpJhI/adA2kGIxIIXKLoIdff7GmkdyqYEtooJ
	MZNUSpBSOQEf5e+1yVT3iNmhbttWO0NQcDCkN9awaXF+/h0xY2AaHZq/BPxajCYfgIewaA2DNQl
	qniNmKQx0uTNr4hpLbN3JeK9pmJSrn1WYLqKXdMghPHIKwNGSPLDjZc1pLJXa6/YxLAUA4ZistQ
	uq0ko3MFRyMyczODG94++kJLFZW2cxFTz57L6iouagUrt3POH7t3gxf7kR8l/7cXHBZ+fGNyUE2
	9fZ85FjqY
X-Google-Smtp-Source: AGHT+IHnymAzt9wzLtLJDSjlzRXQxVPcbpSsh6FvhFdIm6eixK9JeGM+C1pvqMUaMqG2vD0oiiyYsQ==
X-Received: by 2002:a05:600c:310c:b0:43b:c0fa:f9cd with SMTP id 5b1f17b1804b1-43db6227ac9mr57538675e9.7.1743410299906;
        Mon, 31 Mar 2025 01:38:19 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d82dedd6fsm163362265e9.7.2025.03.31.01.38.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 01:38:18 -0700 (PDT)
Message-ID: <6bca05ac-13d0-4197-b4af-5509884c83c6@linaro.org>
Date: Mon, 31 Mar 2025 10:38:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: timer: Add NXP System Timer Module
To: Krzysztof Kozlowski <krzk@kernel.org>, tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, thomas.fossati@linaro.org,
 Larisa.Grigore@nxp.com, ghennadi.procopciuc@nxp.com, S32@nxp.com,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
References: <20250328134208.2183653-1-daniel.lezcano@linaro.org>
 <20250328134208.2183653-2-daniel.lezcano@linaro.org>
 <a81c615a-a1f5-4dfc-81ce-6235abed0820@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <a81c615a-a1f5-4dfc-81ce-6235abed0820@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/03/2025 06:03, Krzysztof Kozlowski wrote:
> On 28/03/2025 14:42, Daniel Lezcano wrote:
>> Add the System Timer Module description found on the NXP s32 platform
>> and the compatible for the s32g2 variant.
>>
>> Cc: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Cc: Thomas Fossati <thomas.fossati@linaro.org>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>> ---
> 
> I got only this patch, no cover letter, no changelog. What happened here?

My bad, my scripts needs some more work :)

Will Cc you in the next version

>>   .../bindings/timer/nxp,stm-timer.yaml         | 50 +++++++++++++++++++
>>   1 file changed, 50 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml b/Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml
>> new file mode 100644
>> index 000000000000..a9c0151d62be
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml
> 
> Filename following compatible.
> 
>> @@ -0,0 +1,50 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/timer/nxp,stm-timer.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: NXP System Timer Module (STM)
>> +
>> +maintainers:
>> +  - Daniel Lezcano <daniel.lezcano@kernel.org>
>> +
>> +description:
>> +  The System Timer Module supports commonly required system and application
>> +  software timing functions. STM includes a 32-bit count-up timer and four
>> +  32-bit compare channels with a separate interrupt source for each channel.
>> +  The timer is driven by the STM module clock divided by an 8-bit prescale
>> +  value.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - nxp,s32g-stm
> 
> Previously it was told to me there is no such soc as s32g but they are
> named differently, e.g. s32g2. See other bindings.
> 
> Please consult internally and come with one unified approach to all NXP
> bindings. Otherwise, if this is a real soc, fix this for top level
> compatibles, because there is no s32g there either.
> 
> This applies to all NXP-related patches (which I am sure was previously
> discussed on the lists).
> 
> What is confusing: previous compatible was correct and I did not ask to
> change it.

Yeah, I think the answer is straightforward. It is s32g2 and s32g3, the 
two platforms having the STM. I'll will fix the compatibles.

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
