Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F4328D857
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744361232; cv=none; b=XkE56OfMiJoRNjljapV95S4vZUzLXVvc+9wAkVopIc/fAh1PRGIm7IV2+iX1sCW+vjSX/DoTGX0MhTDnOIltsQP0mjuOiYD38IGaZVu5nCuafrPGuICpLbvGLHNPtxmfj7S7T9vEj0HtPslsKqPDNcKqo1IUj3SNGyId1V6ldeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744361232; c=relaxed/simple;
	bh=1kXLBhEZE6OqkXjDzfvvDI9iR/ZxHUV/Xo7u2tQ2L8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HxmBCa9EjqGihePgLiQ1PNKG6DQQm7J65zLPuI9GXnHnPj5m+qNAR5ruP03LvbCwr5tSoW7kwweYUDZ1y9lPL1dE/85mHP87AE6GhwLF4IZOeu4usn5xMgDezhwfnA0V+eiYJxQw3Rh6uZV9KsQZ017TVwysdVMlcSkpruXRjzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=BQZRS5iT; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="BQZRS5iT"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so12857865e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 01:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1744361229; x=1744966029; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=av0XyEZV8I7O/09NYxy8b4TdCFcXqsTkZCmrtSFqumI=;
        b=BQZRS5iT3GBsa7AjVYzOqaU952B7CXiCJxuYy6rfrVgU4YiEkMyWl03xiJMBPfq5rH
         5kpHkLYcxApWgmcnPNBIPuEebiEAKhNeFTCmmZpMNYjfadMlWWF39ObVScswQ7ZhGYob
         dxCnbHM2dKNgXHHuuGMhj7090FmID0CrE2hrv+9ZvmOVSIrqmqn2QDnN1WjMNlDF9rLF
         h7cdrkD+Jc6hKuDpFVgxluNecRub/++ZxTxvdnaqBEADR9R7ggNS0yq7Ovvr+BjtIqJP
         bimNEW3fa5lZ7Hd/oEFaJKchYqgDqKq7KSSW3U4eh0LrnITaGRxJhWkA7yM0C/ihb3Mg
         SErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744361229; x=1744966029;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=av0XyEZV8I7O/09NYxy8b4TdCFcXqsTkZCmrtSFqumI=;
        b=VZpLzH4DLMbBPJI1e1aXadq9ti4RQ+5o6BlBBv2nzGh3Im/9vhiFZm0ENjANXLfhJB
         SkcHLob2OMiwX1St5XJBEiOkm3IfYX1JjBJSg6yxvA0nGKUBESlJfijfuyQjTD6brI8m
         hIqy06qnuiLqiwKRU8iyyM8Yw8pZvGuIO1lqK7LU8dxEcQSU/NQTsz6evWYeS0KlohEu
         xuNP3Es+Tfm29p6RFkvHbZhe1SACJTwgR85Qo3QsYy13dSJ6O9nLQ6YWz+UeNYWAKDkd
         jlv9w5gNzFZcEE6D9KEyKAo1V+nd97ii1n0CjDICWcxWoUgFVb9kHroVg0c3SNcTGc4H
         vC4g==
X-Forwarded-Encrypted: i=1; AJvYcCVSVgkTPJNvPuDzxljdsRaa45kJC4Zc7FOB6BdMAzT/NoldWYrmzG3OheDu4jcbqVkrcgIp3qRrxxMaCfc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzGblEaHCnm9EkILJmdzVqL0DwqTTb859ea7nVT99oXOINc5oq
	v700UA4k53cR1otiekZexvzGR7x4b5Hh7K6PnEsGWjZ6J5yn/2QC3TS3R3nLW7BJ/y4B755OELq
	crC/wP81havEtYLIM9/iM08PyXFoZFNR9foMqpxCcdCro8tx73LNN428=
X-Gm-Gg: ASbGncu+fE7zu1F61sCSpLqZU/iNVl9HVue4PrbCPO9FNjiRbvRfazE6vJHL1SmWXyU
	fvBXaxbsolrxnXTHIGDiUnA+9bYwMDbGo1FIW2WVRp9vFcrlbMlMnDu3n4jp9wq0b/O042AmNmv
	LOOH9sqCw2aXgYNWO5c1RdcJ7vWYy2d2ewlzz0UY5u+DiRY00XMC3ZO73bV5zyLL2SasYriAEEZ
	aXdDQeOUOZgj7WJd4V36+XLaTAxO7Sd3ik5+XJfxwHNRsoeCaFGJe8xFaqHnyGUU4VsZWj4I+jQ
	IRQ14m/VZXAp8oVvmLEqnBtNIzGJfb3mik4YognBjl/hzGoYpY/LoKDmQMH1GkvHAm3UJtAARmD
	RdyA=
X-Google-Smtp-Source: AGHT+IGJGJgfDhxLW8iHULpCr4HAz0c9G33EsC6d7ew/p76jeG1SxX9V0NsZpEV6JXd9okm4Kw08YQ==
X-Received: by 2002:a05:600c:4f4b:b0:43c:f6c6:578c with SMTP id 5b1f17b1804b1-43f3a959415mr13584425e9.15.1744361228774;
        Fri, 11 Apr 2025 01:47:08 -0700 (PDT)
Received: from ?IPV6:2001:67c:2fbc:1:e8be:40be:972d:7ee4? ([2001:67c:2fbc:1:e8be:40be:972d:7ee4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2066d069sm81137665e9.17.2025.04.11.01.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 01:47:08 -0700 (PDT)
Message-ID: <44edfa99-a3a0-4d86-845b-e13c1dff7f2f@openvpn.net>
Date: Fri, 11 Apr 2025 10:47:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v25 01/23] net: introduce OpenVPN Data Channel
 Offload (ovpn)
To: ALOK TIWARI <alok.a.tiwari@oracle.com>
Cc: Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Xiao Liang <shaw.leon@gmail.com>,
 steffen.klassert@secunet.com, antony.antony@secunet.com,
 netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Donald Hunter <donald.hunter@gmail.com>, Shuah Khan <shuah@kernel.org>,
 sd@queasysnail.net, ryazanov.s.a@gmail.com,
 Andrew Lunn <andrew+netdev@lunn.ch>
References: <20250407-b4-ovpn-v25-0-a04eae86e016@openvpn.net>
 <20250407-b4-ovpn-v25-1-a04eae86e016@openvpn.net>
 <7bffe8a8-56f6-40e1-90cb-d9589fd41bee@oracle.com>
Content-Language: en-US
From: Antonio Quartulli <antonio@openvpn.net>
Autocrypt: addr=antonio@openvpn.net; keydata=
 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
Organization: OpenVPN Inc.
In-Reply-To: <7bffe8a8-56f6-40e1-90cb-d9589fd41bee@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alok,

On 10/04/2025 19:51, ALOK TIWARI wrote:
> 
> 
> On 08-04-2025 01:16, Antonio Quartulli wrote:
>> Although it wasn't easy to convince the community, `ovpn` implements
>> only a limited number of the data-channel features supported by the
>> userspace program.
>>
>> Each feature that made it to `ovpn` was attentively vetted to
>> avoid carrying too much legacy along with us (and to give a clear cut to
>> old and probalby-not-so-useful features).
>>
> 
> typo - probably
> 
>> Notably, only encryption using AEAD ciphers (specifically
>> ChaCha20Poly1305 and AES-GCM) was implemented. Supporting any other
>> cipher out there was not deemed useful.
> 
> 
> Thanks,
> Alok

Thanks for reporting various typ0s.
Will fix them in the next version.

Regards,


-- 
Antonio Quartulli
OpenVPN Inc.

