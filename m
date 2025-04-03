Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC4B2E62DA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 21:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743717136; cv=none; b=l5EPM4tBbDfcK/0W5P46zVFRA6HXTZzXj3dRTUrx6UG0rbo7Xk485AnwpxvJXeZe6WlS9Z5LOa81LfIhM0LekqKeXrMJZLDVmldBQg5E39xotZ+YN9aXUsKRibL7vHUFw3D9GKFJp0AhXbK7yb45LcpymDFtzpv5dLOQKbWsu5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743717136; c=relaxed/simple;
	bh=GmFKNkwo7OjCRB3zDhtKR6SA8LbXtBX0zH/ZfRsiMlg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QwlJp/avfda2rTpy4lFxoPbSbp9aBEBqCfdpvIp4hWMPNQY46CmYZp6avTIdyuCAEh5mGzWkJr+T6uXWqefBhlsYul1nbyt+CbhtLPYHJ8mgSplOcLDLjCKPP5kXOj6k47Rh0idyDp/ZE3Tl9gid8xMkb8keH+zFbI01BOPGM4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GfzkScJk; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GfzkScJk"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so9397655e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 14:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743717132; x=1744321932; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8CBMfdre7+DE0f35RrLYETNVW6K15tew9xojKyZNltM=;
        b=GfzkScJkbk+vesgboCudw7W+1d88Vkrfi2Q0sg0BxHHolJYMjI66YYbMhXBKfxhhfO
         uwoxMboWY1HQkpobaY8lpYl/e2XpJJ/xjUeLMOAtBBEwStoaCSgHlc4DiFffF3DrK+O2
         nRvlyzcVkqIbel2sueKufqbBPAjD35bbzxgxTMofNOBDtvb0JQuoJiCwHb0ZMQ2Irelb
         0lO4B0QXPJkTNhn1NjWcKXaVMcV31FaDXxPny2gsTO+y/h9I8e401PRt4rQ+p4fOneSn
         KRFgH6ixYUbpHN9hfm3an5RZ2Uk9H2oW0Dexz6EbwFC7vcfJT2UeH4uRTQ+ScN2DPTF6
         wjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743717132; x=1744321932;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8CBMfdre7+DE0f35RrLYETNVW6K15tew9xojKyZNltM=;
        b=bzpzk/BmLXhdrdzCs1FtUuEsVDzNzRvq1for1q3iI1EVxnPPMF25qKzznbC9jbsFfC
         gBI1j4S3m3TWzLssXnMYIutTDF5s/4KlDg9lpvR5wcaffwifatX4/IJD2AHsFvf8i99h
         zEShDHLJSk7Do4meGW+FzUGjfXdYFqcJ/DcBIfUeIhYYXVm1h18yf+eUftHOU3wlXzDt
         5i7wShYyDbcI2f1S6ZniPaNyaNsA8AeGwUgdcB2x0foNvyKmpjnKE3PDiJdk3Gj4K7H9
         lnZvsO0VxHPcLOI6pDY3zPTzZHEZ9SnVgGLzlOii3D+zJg81UcKqFobS5GeDMaFSXNC4
         jkVw==
X-Forwarded-Encrypted: i=1; AJvYcCUcMm8cElwFr1Qr8JAQSogLbw8VjF2MHwyhYQifbxupBlXaS2J137XtlVTRd1L/VZTtuxiENFcgpQ1oAMQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YweM82itrbnk0JzVp9bys7J5dmv2xmsMqJzo3I1UR5+66F85btn
	zmkDyXXtMPFcNgYRyKpySjgODiXXDWKT7XDOxzI5hHe4Kg4lF42b2hJfY4CUUN0=
X-Gm-Gg: ASbGncs43cTA5hNs9Z5R5P5laAlbvB+Rbae1t8cHi5GzbhatEk7GADKVtr1iFWDr+kH
	9EGPRC8S4xeG4oERdBS4d4m1Ys7WcgwOv5Ho99wNmsqL9U9kSQTjEwkiTlbYqmGcSYWhuqeLXsc
	6++X4Qvm2EtorqbfBgagt37Lk4Q2Cuk8MaSwQCOImfx+E7BcHCmpmYFCIjJC5vqsFYz6sOvPHqh
	6F5h/nk9hvYzs6Md98o/1H+vcq/tITQm+cqaZZsUsKZsYuo4vGpodJr1Ve/PLu0ezlEoCV64fDG
	BHrDj50D09ZK1N9NKvGOp/NrNW3yMQTzYKf/yVyHcZ/G0FoGUK9qbGnHAmVRxXQITRv45wIEcNT
	CS4hsoiD2
X-Google-Smtp-Source: AGHT+IG/Xfu2XEhsB4cp+SWI6+hlJEq3oPbspdd1RkIZaN7jaXBv9WIRoN7YzWMpD/aceNrTbTwLeA==
X-Received: by 2002:a05:600c:1f0c:b0:43c:f81d:34 with SMTP id 5b1f17b1804b1-43ecf85db8bmr6388875e9.9.1743717132315;
        Thu, 03 Apr 2025 14:52:12 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43ec364c959sm28482925e9.25.2025.04.03.14.52.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 14:52:11 -0700 (PDT)
Message-ID: <68ece50e-568b-47d0-9d36-b5eb9ec17c2c@linaro.org>
Date: Thu, 3 Apr 2025 23:52:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: Add NXP Software Watchdog
 Timer
To: Krzysztof Kozlowski <krzk@kernel.org>, wim@linux-watchdog.org
Cc: linux@roeck-us.net, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, S32@nxp.com, ghennadi.procopciuc@nxp.com,
 thomas.fossati@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20250402154942.3645283-1-daniel.lezcano@linaro.org>
 <20250402154942.3645283-2-daniel.lezcano@linaro.org>
 <ffe49998-f809-458e-8eda-002d0c0fc32a@kernel.org>
 <c449fba0-476e-495b-abbd-65ba2d44d590@linaro.org>
 <9c47cd4d-41c7-42b9-8f00-a1ea9b9f6ed8@kernel.org>
 <5c2def81-11c2-4e24-b633-aabdb50cab34@linaro.org>
 <a9115802-09da-4475-8957-eb74de3ee36a@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <a9115802-09da-4475-8957-eb74de3ee36a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03/04/2025 17:35, Krzysztof Kozlowski wrote:
> On 03/04/2025 17:33, Daniel Lezcano wrote:
>> On 03/04/2025 16:16, Krzysztof Kozlowski wrote:
>>> On 03/04/2025 01:01, Daniel Lezcano wrote:
>>>> On 02/04/2025 17:56, Krzysztof Kozlowski wrote:
>>>>> On 02/04/2025 17:49, Daniel Lezcano wrote:
>>>>>> Describe the Software Watchdog Timer available on the S32G platforms.
>>>>>>
>>>>>> Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>>>>>> Cc: Thomas Fossati <thomas.fossati@linaro.org>
>>>>>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>>>>>
>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>
>>>>> Best regards,
>>>>> Krzysztof
>>>>
>>>> I ran the make dt_binding_check but inadvertently removed the "oneOf:"
>>>> after :/
>>> Other errors were also not fixed even though you got report on them on
>>> 29th of March.
>>
>> Which ones ?
>>
>> All errors were coming from the oneOf removal, after re-adding it they
>> are all gone
> 
> 
> The same as from previous patchset - wrong unit address, maybe more.

Indeed, my parser was not up-to-date and did not reported the error.

Thanks for pointing this out

   -- Daniel


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
