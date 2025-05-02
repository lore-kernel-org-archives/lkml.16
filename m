Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1211FCFE2
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 06:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746167279; cv=none; b=FMJ9FNZ/MbnSCpK9TlSBD0uEtiY6slnoiEdQqtcYe9XNqpjMfUbwzuAN0k85+sMDpuYP1E4h+BV/7q+PYajZZfWC6EHKW1oP4x3ZqGS6GD3yS9CAW8uCNCe0MbX1w6fg2uF5Sk56iHfoM0NDqlgPE72ZjKruYyEpRuDoVlE7/0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746167279; c=relaxed/simple;
	bh=DC6bWY+6JoFLTwKGE0QKs6o9TAsatigPjvImyJKmohY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=She+yTU5fARAKTgriqKeMylw9x/5tVXQvxEzExqWUZUQ4U6igEJRwoCAaWO6sJ0Pv0ZPDQRaMEuZG8hOCO4Tu5WuJIus968HDZaDrOAk1p9IRBEw1B7EcChq5JyzcxklZvBbM7Jh+eRFIu+2kTGm+6IeuccUmYmfFLu3HhdCrlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MsRP8slx; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MsRP8slx"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43ce4e47a85so2708535e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 23:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746167275; x=1746772075; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b9Zy6aiGL/gGmdnoRcd9oBYXxOrmE/Jk32RKUICekbM=;
        b=MsRP8slxdEA+CNLOoxbPdgVG6gdd3vAd75Dpt6ujD5otvxgo0MF9ID/SFel8/yzB3F
         lIezyeCxEAEXxE6CJp73stdHnvYUmBahMeRJhpib5SnORg9JRaf0WrvICbiqT+IrpBpr
         u4RHnVlfZijEsnQz3Tohp93uWD56+n5v149XhZJZrXQUuCSDGNyKDFKmWpnK50nroqKL
         SRc7aI9REkRs8N/M2Ry/KrdLKZGQ1sN4ELsIpGvc/SoNxp085HQaC5CiNJFTKekwNzMF
         /++GEuNldcCDdJCE/tcw+J9sBTSl+CeTA6OVtX4Wtqz+eRtWCk+DIG69+5twlSS/et1a
         pNfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746167275; x=1746772075;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b9Zy6aiGL/gGmdnoRcd9oBYXxOrmE/Jk32RKUICekbM=;
        b=DMWf0XWBuZPGuCgrQG+/eKxTpsdz1Hi1nVnsb8Tp4AaRXc8j/DHtaHvd4AfVCStO56
         P3KczoxrDdsKO/REeYhCaUtkWCgUXdf89RgX5l2/1AcF4PUiSKejqaD/lQVEH3fLZZZ+
         U0lQlplwhNooYpzdk1I0az4GpraQd2oltwqEO+HlFLsGlWwVqi/rFKCahwJf6VWg+Aow
         zsVTCkTSPiO9TsexRQkDsHTT/rBek2IGl6X4x9S0/43RtdPg/LYHGcGqfiCkjz7ZL4ue
         57MEadg8qDy3hrYveVdo3OiOmpCF3cfHHsZklLHZ5CT/eKAn9uda6n+eoqeGJ9jjy3MA
         8GJw==
X-Forwarded-Encrypted: i=1; AJvYcCXHGGC6+21nqyvx2EpC40iKLWVoZi0vOZDWpmI5l+PJSH0o//OjDbQPtsYPazjtOdrVt0aiLwwGli/Ymbc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXNay8htDR+uVRatMaJYS8oT4Ehcs9HHx3jol4ZxwIThsVxizo
	yOupCSrumYXTD7i5gY+Mf5jGhxoGILPjnDKeI8dSyaNs9GVtoBe9+1J/ezJytMcXCzSMHqHrtgY
	n
X-Gm-Gg: ASbGncvZx1e9CoPfgbjbKi1/GhDLJzXuhnMHEj0BD+s5LBYphb7t7sPa7E8FicE+B3B
	G1cYP/zg9f9RgEkcOLJ4d4pKEVEp3V8Eb4wk4Ik2nTkAez3LjtJ0Vij/ivttZk3gRTLFy3B7KzT
	Z5pzCxEa7SuP9vbt3FWpsBfIcP22dFkS113vxr/CYQVHK2Qh/qER/eBybDuozvXjwYFVt1E/LC6
	yS/7vzWUi/ubLHHe9Vez7R1Z9lelgW2vFKU9cwZSfE54A/uv+Kfj5HVgZJPijnaAvikRXWUOwvS
	hz1sKtRbWdd4QdxRIrrUcchcBN8ddpLWpUB6wVPiTvVQMhhsa8BWQCx1aZU=
X-Google-Smtp-Source: AGHT+IGPYebVeIf4KproBNPUEsdrzFAkpRYzLhgiHF8n+nRcdTmrk783UPr19Te+MKJCkdEhmPKwDQ==
X-Received: by 2002:a05:600c:a016:b0:439:9595:c8f4 with SMTP id 5b1f17b1804b1-441bbe2db57mr4790755e9.0.1746167274864;
        Thu, 01 May 2025 23:27:54 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2b20c3fsm79982195e9.28.2025.05.01.23.27.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 23:27:53 -0700 (PDT)
Message-ID: <86cd570d-416a-49ab-84e3-6bf54873f8eb@linaro.org>
Date: Fri, 2 May 2025 08:27:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] cdx: MAINTAINERS: Explicitly mention Greg who
 handles patches
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal
 <nikhil.agarwal@amd.com>, linux-kernel@vger.kernel.org
References: <20250430-cdx-clean-v2-0-7dbfda9364a9@linaro.org>
 <20250430-cdx-clean-v2-6-7dbfda9364a9@linaro.org>
 <2025050158-tingly-doubling-9795@gregkh>
 <45859218-1bde-48e9-bdcf-4ec94fbd47a6@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <45859218-1bde-48e9-bdcf-4ec94fbd47a6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/05/2025 18:06, Krzysztof Kozlowski wrote:
> On 01/05/2025 17:59, Greg Kroah-Hartman wrote:
>> On Wed, Apr 30, 2025 at 08:41:34PM +0200, Krzysztof Kozlowski wrote:
>>> Patches for CDX bus drivers are applied by Greg Kroah-Hartman, so list
>>> him in the maintainers entry because otherwise contributors would be
>>> surprised their patches got lost.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> ---
>>>  MAINTAINERS | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index b2c3be5f6131432647dd01f22bbf4bf1c8bde9e6..505d7d45ad7d1c007e89a555264ff8cbeaf6e1f4 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -1008,6 +1008,7 @@ F:	Documentation/devicetree/bindings/w1/amd,axi-1wire-host.yaml
>>>  F:	drivers/w1/masters/amd_axi_w1.c
>>>  
>>>  AMD CDX BUS DRIVER
>>> +M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>
>> Sorry, but no, I'm not the maintainer of this driver.  It's up to the
>> maintainer(s) of it to send me the patches on to be merged, it is not up
>> to me to maintain the code at all.
>>
> Sure, I understand. I  will send a v3 without maintainers patch and I
> assume the maintainers will pick them up (unless drivers are orphaned).


And now I found this:
https://lore.kernel.org/lkml/929198a2-6b3b-0f1b-3f36-cd8955ca6f19@amd.com/

"We do not maintain a tree and  patches go via Greg's tree."

which means that patches won't be picked up. Your email does not pop up
on b4/get_maintainers. Overall this means cdx driver might be abandoned,
from contributors point of view.

If that's the case I will send a patch making this orphaned.

More patches which never received any attention or were not picked up:

https://lore.kernel.org/lkml/20250118070833.27201-1-chenqiuji666@gmail.com/
https://lore.kernel.org/lkml/20241203084409.2747897-1-abhijit.gangurde@amd.com/
https://lore.kernel.org/lkml/20250425133929.646493-2-robin.murphy@arm.com/


Best regards,
Krzysztof
