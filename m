Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFB11E378C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743497184; cv=none; b=Er/bIb8q0rxIgSfrwxmyjFrjRt1pAHCqqEBLLMg4XaR/3WxLyEnP9vYy4h+satrDT0ensyzzPSuMRB6l9k+a66vDBjb3xOoOxocrrpsseQm4QgRTZ905wEgNWhQ2pnp3w0hnN3VTB2ls6J/Nj78NG+DKgs0/hJ2yxjZ6AotxMSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743497184; c=relaxed/simple;
	bh=Eceui0TVVx2rDkmcA8Cj1isv6eadBCZ/Qq9koYryIFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZZESjKmZ4qP1H6rXrhNyG/OBJqak0O2gvoSKq4WKBKJlohdngYXllOT2TliBtQoFzRjfYH2+i7HnPgo2KZLHvV/dwyMM+CD2RTloZN8CwzldXTnuY7FNR17QiMOYMiR9ave6JwJufELXVt24uKhZhaTMWIWvcvb6jJfliUvfq+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kQeWFFMi; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kQeWFFMi"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so821260f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 01:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743497180; x=1744101980; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h1OcP8KDLM4UIUl5mqjKNbP+KOXXApDs25FTbj9zEoI=;
        b=kQeWFFMiMQ0Sph6Tj7CQ5FpWvtPDqT3E1OOLjVm7vsvT2rLSaZM+0+1nx85xofWRp8
         5yTyDvPOLB1d97fRMrscO+0XhuD4+C9O1DIkayRE+phyujPEbmAW2dmMdo3RY+Azz6zE
         U51kZo8ngmtjLwWf+5g67+HLD9zoCFeIOm8DXjXj0QwE9oIppzVBJT5x+3iFg+IV/c1T
         deeVYZnPaKSOqj/eWbQevfEDn4CLqUndPw7OE8yhm/KZIOloFQnlRAJotRacSuLtyU1n
         ctzMbniHNtiDuSEzFBzI52YO/k6O7Szneo0VNIWiP9box/ktD72MKVQ9QgbA2OZ65Ibc
         rNlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743497180; x=1744101980;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h1OcP8KDLM4UIUl5mqjKNbP+KOXXApDs25FTbj9zEoI=;
        b=dsC1Bevi4xB8LF2c1FphIlhkUCLMs6qncrxFrhJ58QfLMlVG58SjSdM6RLwOUY22yE
         d1VmS7IRnRxD2msiNpYcrUrbzhf7xz+VORBRDcYDkoC/I2Cd1R+hpHSMTBUm1d4X5+N8
         YJ5dtQfuBvqrJplf71ep+OgHSKACWUvNtVoqWyVswIgsXCfME5JuC7ReOYSk1mKouVki
         v5zUZyuGcTxpzqEL6bQnml5Q4qVs/OyTLnndMIkxPLeT3jhdQOl3bHv1LHD2UE0IF7vG
         ASce2DIAGcJBIl5tUw9Ce91fW16ogHvCPMqjKDhrNbQpucxldseaa9lriReM3NpB3Y2B
         w7yw==
X-Forwarded-Encrypted: i=1; AJvYcCVchAra2J3tuQawfV/FR4cXoGO7TcxTX52gebsiNV8oZarff1Rp+DWtfRw+MqKwjdVNwel3TQQYq6beWm4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKptXbsH44gSTknuV5Ee9sM/o7iRkmTO8Z5+WFlblKreD3ka9D
	3mMhOhC3/TmIRL/dOIYh/W/R9xz5oyIjJkv1XYjALPmzRQfSzxIyTbW1nHt0hso=
X-Gm-Gg: ASbGnct09MzPp4QdNdfcEoP+9ok/JG5MXp0FiauQN3ZOV3uv2tXiPRFiu8dMxOk/+1e
	wUO8AW1iRiY83bfxFgXgXbNMGFki+BhvgecsmDygFSBdzEFz9oNPNrkRcgzmP7Ak72fkO/L/BkC
	Q8RHljcovgy+NijO/6MOB9S8IqERs/3qPDyMC+PKALN4b5FwFl65HGkQxdaucZ/eV1jQYk3Yi4q
	7DW0PviX5bqe5+ErGCDt9dvtaKSJa/OXOUo8qUOAvaY6RxV+Ii/EtuOjbPxCGcrrQheNGn1L8eC
	qTDHcaoRsqIscSr8T5zEMpwEoVDy/Q7sDcqXXHF8P9yMbLuS7l/QPFKT+GsA3o9/PJ8P+7QUogM
	Jkw75PUXauLxAHhvyTGI=
X-Google-Smtp-Source: AGHT+IG6UQfLzzABD8iS83hdAejooKKRJG1thikhxbGDPDbzft10tjn9XKnzJSrWol6GxnExTBubfQ==
X-Received: by 2002:a05:6000:4282:b0:390:f738:246b with SMTP id ffacd0b85a97d-39c120dc8bamr9918539f8f.15.1743497180629;
        Tue, 01 Apr 2025 01:46:20 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d900013afsm149321615e9.36.2025.04.01.01.46.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 01:46:20 -0700 (PDT)
Message-ID: <16a0832a-7645-44ee-867f-fde8822f219c@linaro.org>
Date: Tue, 1 Apr 2025 10:46:19 +0200
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
 <0638eb8c-d87f-44aa-9f1c-eee529b1e1a1@linaro.org>
 <b14718f2-add3-436d-95a5-908eb9217120@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <b14718f2-add3-436d-95a5-908eb9217120@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 31/03/2025 13:42, Krzysztof Kozlowski wrote:
> On 31/03/2025 09:57, Daniel Lezcano wrote:
>> On 29/03/2025 06:04, Krzysztof Kozlowski wrote:
>>> On 28/03/2025 16:15, Daniel Lezcano wrote:
>>>> +description:
>>>> +  The System Timer Module supports commonly required system and
>>>> +  application software timing functions. STM includes a 32-bit
>>>> +  count-up timer and four 32-bit compare channels with a separate
>>>> +  interrupt source for each channel. The timer is driven by the STM
>>>> +
>>>> +allOf:
>>>> +  - $ref: watchdog.yaml#
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - nxp,s32g-wdt
>>> This wasn't tested, so limited review - this also has wrong compatible,
>>> There is no such soc as s32g in the kernel. If that's a new soc, come
>>> with proper top-level bindings and some explanation, because I am sure
>>> previously we talked with NXP that this is not s32g but something else.
>>
>> If I refer to Documentation/devicetree/bindings/arm/fsl.yaml
>>
>> We found the entries:
>>
>>         - description: S32G2 based Boards
>>           items:
>>             - enum:
>>                 - nxp,s32g274a-evb
>>                 - nxp,s32g274a-rdb2
>>             - const: nxp,s32g2
>>
>>         - description: S32G3 based Boards
>>           items:
>>             - enum:
>>                 - nxp,s32g399a-rdb3
>>             - const: nxp,s32g3
>>
>> I guess it should nxp,s32g2-wdt and nxp,s32g3-wdt
>>
> Yes, with one being the fallback.

Like that ?

properties:
   compatible:
     oneOf:
       - const: nxp,s32g2-wdt
       - items:
           - const: nxp,s32g3-wdt
           - const: nxp,s32g2-wdt

Why a fallback is needed for this case ? It is exactly the same hardware 
for s32g2 and s32g3. Could it be:

properties:
   compatible:
     oneOf:
       - const: nxp,s32g2-wdt
       - const: nxp,s32g3-wdt

?

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
