Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF64F18A6A9
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747938864; cv=none; b=DsBrZm2hJ1OrZD1tJbWa4Sj0VeIfVMSBmuaWf6SAEH/XN5V54Q+6zpE4oLYqSaTItyJHI/cLmU7tIc2WKS0RBMGYVr+a5cJ38Xt9MJtmb8XPoyfDZ/ak8RHlvsZ+mU34QLIAE0byLb+aj28OuciX3IUK7l+AFsnlNSSgkxrV5bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747938864; c=relaxed/simple;
	bh=8jNEoO2bZW65ROC8gWgbA0OrrFn/suY1XO9xMfVDh9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=LHOa0oLFZgD3u+BnZayVvEfjxP+cK2p2kk3Oi2hO0fHJeGH0+fYsEgi1k81ZjzZI0c0vQ+r6Cbt+NTXZF3/lOj5Z5LkuD1HVBU9kv6oOKaEJc8FPC2t9/rLNORTNOvsJGq7RNtb0RG7wCymFC16W0/6lI+fFJtfI8umSa8qbnc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b2bgwvYI; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b2bgwvYI"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a36561d25cso836260f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747938861; x=1748543661; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w1CTkcCN4mgvmc4O+/bwLsfd/yX/UppF+CPol8YE2Rk=;
        b=b2bgwvYIhhzmRBGN/VhhIR/dzVcZaLp1DaOoTaH+mjXZZcdD5CpPVwBA41HCzm4mI5
         FBFnd2iAVWUf+Y2rCycYYjAJmuQxuaoWHcHHEJlf6V9zB2Toy+EiTukBmC+10Nr0w60p
         y7H/eENsvh09UGA89e4L1tzUb8uuHUjY/sgex+iNbmu5O6H0roGqEaATOqFX8NP9BPeI
         W/DrWq7y2I8MGldSMQD1UqWOUoCP5MUmoWPxRak0wCK8qWtYrunupNgVozFFolUO0clg
         3SAM4Q+V+bK0BAuYSv0KskOF0wHNxFly+x+uAel5I1BY1lmU2+oEov/rFZU33hzyUX0m
         Tqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747938861; x=1748543661;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w1CTkcCN4mgvmc4O+/bwLsfd/yX/UppF+CPol8YE2Rk=;
        b=sb3AlvUJYojAorpdIzGPQJhvoIdDVSla5Xd5phS9C1vLnRhlC/bqgM9P+vJbm901dh
         9XvhUE0VaaN7lGjmjYgjbSACQVDd0MrCFI+HjcWM8vIaJPsHnEUB9nUckeWnfa6G0FcC
         rsTaIp9ciD7UPEW5fuGSVDm+sR2fjBT4F7J9xXahyDKVZQdSG9NFYNpNOy9puPj/Wr9i
         thW+Q0HdNHaW8BzWdgFxHZMmZHuZemovwQVdVe7WzLcKeRTZYdOKFamCr/WSkTp8h7OD
         Tx6ve2zrh8HqhZx8hXcAcEjLdTnX++DKrmnMBgpxeTPJ1q/ihndOgIhunWV2cODbYAeO
         ubrg==
X-Forwarded-Encrypted: i=1; AJvYcCXWyWDNeZ0XT81yoWhnAyuD9kaz5jMWFNP3skEhM9RcE0ZkQyfv+VBxiGrCWSRraJaDSLGBug1RCYckpN4=@vger.kernel.org
X-Gm-Message-State: AOJu0YynmrGjwOpb/DbieLgOWrUBNN1agZSUK3VYXjmXYg1sp8nmWm0S
	rMa2raLA56F30eHgjpP7WPZjcTmVs+vcGOLitvLrenhQnawW8dTWhntvbYvtH91gmk0=
X-Gm-Gg: ASbGncvilCMHRToxvKOfrmwt90F0MHA7GiIV6eSSY7DYjj5bv1iEvUMPpaclUCdbM2c
	8yHLpuJPygBArA8NYSltFtoCwdFa3QOwW4vNua95YkfrlFb1cWgcqMt1f5dfhFqTzFOfOF15bYx
	kj3LH4YVVzIl0+38kXRdFtk8mjlIvpOKHbdAia1baEN0A1lrCqI/f0qY+0hFS+OLoPm10gnk3K3
	V+f5D2y+wokpmuMD9unwi/1oB8u+FcrvmA6y8RnieWnmR/jpo+TgTp5MdMxRgyF3BLBbs50FEvg
	Q3+XmGzX8dyljLaFU8pVn47QM+jw8OaxBJ6mC4KARRZKDQXym3etM7w2xugZBgwECR0xFNCradF
	R36Aj4Q==
X-Google-Smtp-Source: AGHT+IFynnkis2LoFrPbbKd6EFHmR3CK/Wwm2NAwfY4u2siqRPzXLtZHj+YFawT3eXyBiVwktliX4w==
X-Received: by 2002:a05:600c:198d:b0:439:9a40:aa27 with SMTP id 5b1f17b1804b1-442fd66dea4mr98494735e9.5.1747938861256;
        Thu, 22 May 2025 11:34:21 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a3699a9bf3sm19018332f8f.54.2025.05.22.11.34.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 11:34:20 -0700 (PDT)
Message-ID: <5ebc399d-88f4-4d90-adcc-8c9b31efbd95@linaro.org>
Date: Thu, 22 May 2025 20:34:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: mediatek: Do not enable MTK_SOCINFO by default
 during compile testing
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250404112359.255053-1-krzysztof.kozlowski@linaro.org>
 <3e10ed93-dadb-4d0b-b419-28ea492a1603@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <3e10ed93-dadb-4d0b-b419-28ea492a1603@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/04/2025 13:29, AngeloGioacchino Del Regno wrote:
> Il 04/04/25 13:23, Krzysztof Kozlowski ha scritto:
>> Enabling the compile test should not cause automatic enabling of such
>> drivers.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
>> ---

Ping

This was almost two months ago. I would assume that with maintainer
review, this should be applied fast. What is here needed?

Best regards,
Krzysztof
