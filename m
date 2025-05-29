Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA9525CC56
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 09:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748511488; cv=none; b=Ove343+u4hr9WHvKwlK5zthzs/E3nTvcHbEHvPlgZnxIGhutykJB7zFxFCRN8AMyxtlbEJ3gCt58CXXZH8Dh99fZVHOwEUnJ2gW5dqzpi672NnMHT2j9oy7vnVS9/fsjf62zQvAfseexjyt676AqpvvVwxfCOMnKb7l1vklQwTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748511488; c=relaxed/simple;
	bh=nidXm6RjwTc3HEwY2WsuPfUBUD+8TIDBoLfPZzX1Ho4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ni6THsmSGmBrS8/5zhsucFkBYxZ2zAZH3Ua21w6XdEvQVg+tKXy9T6KNp/GAKOVpIxAOPtOVMPB6rRknIqWl3I+PL4lYgLN9z4p+A3z5PwqTiBS2+CFX1A1YOUU1nehipx+LOCK3wlfzKZVWhB16SdA3jT1AD1GkGITVSSh8JX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NXDg9ThE; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NXDg9ThE"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a4e57d018cso127227f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 02:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748511485; x=1749116285; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gQA3tchOGlR5qDPRloAnwGTrIDQ4bOFY7MUhX29PeuI=;
        b=NXDg9ThEsnN0M37p7RNXKCXJa5JIerSKPnSYyRkmPCxJuwD/EzirFQu8p43taTdAgz
         mcQzqSphZ84TO2auSVof7ChewaogKVC/qSYxYz6Gs1nHNd+UdZ7xi6H/T4ZAzlwgmXrg
         D3npIUarxb45d/u2jbhyA2H82rUWOafs+bWLf12ykYqV9xTy7drcK0aGSTZIPx7qPMux
         YlDNOHUYR+nZETMjrbq33In7os1oSMSEpotbkFZmqKIuCtqn6zygkCGjkMr/iwoBTgSb
         rXQnQosEwNN85e6F1TLeMqfJyDhBcIe18zDIffwQrA2Xn+66BS2+qFIMoMskLz/BERXg
         ATog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748511485; x=1749116285;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gQA3tchOGlR5qDPRloAnwGTrIDQ4bOFY7MUhX29PeuI=;
        b=IbqdcGkJesETUqur9OYRe0yqaby/XVxUm7prL4JURrszEqeH0LnzPN1vpcKZdxytTm
         WFs3mzwYmZ3QCt1Ps8ZrcFdrpBHwENJBDkt8j7oPjgA2JUnRHO/lF7TQ/3nOhsPkUJeU
         l4pc9yMqIdMIZ/tQk5IKZPuaA5rNK9sJbKN+2V1lDdUB43Fx9UB9GO1pfgiMTUJg05oy
         IglMmQBPwsCVk49gbtibumotO+BQwN5c1FS+6hwV9pVNT4FJ+kB50Ud8pZ5osxn2HNGR
         bHyZtuvHUKZCEjBsYFGlEke+vrIrkXkzSJCG73i7/o8qGsfwe7bCL52FLpnjTmsW3m7a
         KXUw==
X-Forwarded-Encrypted: i=1; AJvYcCWfNxgEvHv9/mEggikHoU7aYO5M7XA2X7cgE3Uwp+fDAaK7AXOnC4VntgKCkmIPQ7W2pUGwiLUmB8Cei7g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBPY1db2ptw0wmEFv1aYAKxSH4vBvknRH85i/QkrfBn7fF6Euo
	9qEf1Bjs9+ZNJl+IhTc/ItEf2c0brHXHc3WuOnjW/7SsA3j18jCEPJ4W24D0SoP/ZoM=
X-Gm-Gg: ASbGncvd733yZywWusJzI2gxnzXkN6usqM5fPQs1TBaFkKE/vFuxJGFamYTri/pycYX
	3dBzA/JPPaEvSb6x6x32Ao3ZAMfrh9NFihGwDQ5vfHsY+Ige0giuE1+4fDWUo4Vg+ZKg8mgIwF7
	pGONVe4TxY5CmZH7kl2RvekBPkNUduchteuO5RyIRaRyKgXQjMdR1Wh28eK5qzAoSw85tq+QKmq
	QV6WgZa6QfmE4EfdEZEajUrYoYqcPUwOAaUcY8EwOMeA6qzFB++hI6G66uY+787+UHrPeMdniic
	1snVhn9l0g1J6iBzpnca0BgGmvcm0umbcS5p7bLK2SDompIhdaMJkpNxyNwJ3V6jpEEVSKo=
X-Google-Smtp-Source: AGHT+IG2KHg1RZohAGcF8Ql9GO6udEqYKqOIjzHEygo2NxgJdK/utVnegk1sAe3vpwYFfGdGIM1yBw==
X-Received: by 2002:a05:6000:2dc4:b0:3a4:e8c8:fb89 with SMTP id ffacd0b85a97d-3a4e8c8fcc2mr1629165f8f.0.1748511485114;
        Thu, 29 May 2025 02:38:05 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f009f865sm1405197f8f.81.2025.05.29.02.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 02:38:04 -0700 (PDT)
Message-ID: <60c39c91-4ef7-4a14-8317-da0e2c3aa962@linaro.org>
Date: Thu, 29 May 2025 11:38:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] ASoC: codecs: More const and unused member cleanups
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Oder Chiou <oder_chiou@realtek.com>, Srinivas Kandagatla <srini@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <20250528-asoc-const-unused-v1-0-19a5d07b9d5c@linaro.org>
 <a4c0d421-9062-4424-a750-ee74e2f0407f@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <a4c0d421-9062-4424-a750-ee74e2f0407f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/05/2025 11:33, Srinivas Kandagatla wrote:
> 
> 
> On 5/28/25 8:59 PM, Krzysztof Kozlowski wrote:
>> Make static data const for code safety and drop some unused fields in
>> structs.
>>
>> This is based on for-v6.16 branch in ASoC tree for context in wcd938x
>> driver.
>>
>> Best regards,
>> Krzysztof
>>
>> ---
>> Krzysztof Kozlowski (8):
>>       ASoC: codecs: Constify regmap configuration static variables
>>       ASoC: fsl: Constify reg_default array
>>       ASoC: codecs: wcd9335: Drop unused sido_input_src field
>>       ASoC: codecs: wcd934x: Drop unused num_rx_port/num_tx_port fields
>>       ASoC: codecs: wcd937x: Drop unused 'struct wcd937x_priv' fields
>>       ASoC: codecs: wcd938x: Drop unused 'struct wcd938x_priv' fields
>>       ASoC: codecs: wcd938x: Drop unused variant field
>>       ASoC: codecs: wcd939x: Drop unused 'struct wcd939x_priv' fields
> 
> 
> Thanks Krzysztof for the cleanups, its surprising to see so many unused
> stuct members in qcom codecs. Did you use any static analysis tool to do
> this or was this manually done?

No, only the tool between seat and keyboard. I should find something
better (more automated), because every 3 months I discover a new unused
field. :) I think now I cleaned them for good, but some new cases are
added when some code is dropped or simplified.

Best regards,
Krzysztof
