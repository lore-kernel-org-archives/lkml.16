Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9D432C8B
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 09:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738922000; cv=none; b=IeFqq6oCbwNvEKb730YzIim01VNKAzgSdX0LYmmRawhU9+SGM+X2dl14uw2o93BMg9FADpAp76VtJ2HkTAO3+JuqyaiPWFsURRNkyRRjC272z6IQ0zvarCJIubADevLRiJGP1/d7V5SezVmSshlqBRnKMtdumgb6buN8O+uLSxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738922000; c=relaxed/simple;
	bh=vcIfYXXJS1n936ujwYTpp+exHAdEBoRDeNDuYzB9ueM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iIew89DOWym2hAcxMWoaphiBMcnIcaxMzd6Id5O0S7GN9Blu/yCB2Zo0nHWZjAnfKUbNrE+H8IVe3oxldztkjFtTgyH+zJFzNNOWpRSBtITtN9kk6TWzkDIzD61S6W7AG330IP7Ms/vxyQKTfFNx6sSPFksPJKd70N7E4bfNPek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uSGOCFQV; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uSGOCFQV"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43624b2d453so21335805e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 01:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738921997; x=1739526797; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HI5le2m9MtRic21XlVw4VlPIjEEeUg5523fwZbcDp5A=;
        b=uSGOCFQVjcmxMKQkSOSAAijs2X1DkoembVfxjfcrwEAbxR0+vzpor1oXQEe4BN0rQY
         /tTK3JSijWEhLuRieI6DnFWWEzr4B8QRSHGVIP0qRwyHN9n13zQ3wyo4D775JDsHid0/
         EM+Rdbix6u0sqGaiZ3aZE9y1eLhVUE3c/KKMyFYNdS7gx1wHlv1SJXUT4jRBHuR0dWY9
         UZOq0KKVxkO/TBhbs2/1WX4mX2DYYAffpj7fSKScC7/f7fX0vbiXPBL0zn5dz0Yjk2Mq
         jU4Afv35/Np/bOU3UKdNXeENY5aPp/AFndFYkYU/pmnMdp4PADjW5A4GHond6p8YQr8y
         tbsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738921997; x=1739526797;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HI5le2m9MtRic21XlVw4VlPIjEEeUg5523fwZbcDp5A=;
        b=iULLig0q0JOM9M3Lh6x1DMtOYnFjLqAupsaq4wsVQHR5LGntouAivrd0WX9qwiBbkk
         MYfpuvtnytewC6Rn129TKkpmZBr+0Yn3yOJcwnXYU3P/k+MZeYvvwv9iT7g5hADbuGB+
         FaWNcjd+Iw529h8+g6htbQztVCDoXjO38ctzgXHSWys0YKMba8yTo2SBDtVeg/gOCOpX
         KIWjIHY93VHDzDWUxPwBhSaq0+5mg3XiIOAupR3Id0ivG40uf9lxRJy6TKijQut1AfWN
         6DAlNOPtAP3cTXQupj1XAvJEgqMrJE4+tfeA19YdiedCFxXrOIRi/J1HnGYUmqsCF4sT
         j28w==
X-Forwarded-Encrypted: i=1; AJvYcCVFPYGST+TyYliLWAZXfjlc4XPXDXZN6+wdc/90a0zoOxW5HHPxMDbS+XFEEV3pDz+1+tNblqZPat/E2kE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzVoeRKKd5vTMvKoagTAztd+C00rvnoLK0WOzyvLBsoLtT3XZ4
	s//GeZUvrQpjNXK6nBv+ZKmBavnw+r/N5L0nOklkxOaquH4YNGU5J1aqMG3ER6JLyXNIsZ/lnF3
	c
X-Gm-Gg: ASbGnctQkL7aseLuIi8oby6Pii2cc8DMXEvIBP71F61M/6YwSaVXDERc5TNVhvbsdKZ
	ZoCMc2K4IFYK272EzVkBcad9fzQ9zlqLaAoqORGL5MVtZqpNlzZTh/6AKcEDhp2Q1e1TY+TZkE7
	76L8Xdb8vX4Ptxo0YPj65pfGJnHa7ICv4xtFAFdvAe2iZpCsR00K0YVhSL8OIy8td5LFWsn/vlv
	DmWeMEJESz50fOPa6riL9R6TwLbMrWXEJm2fQBdHwHIZAh5wz9AQIv4d3ZNnbe6EQPdhZLeManK
	VAIabKjGkFBoBiPETZ8AXLkr
X-Google-Smtp-Source: AGHT+IF/jd4MqZAtMmh1k6zAEYsukyGyHjp1fzUdIn8Rugzvkd2nBmHJEjdc1jWM+2m1hRsz4VyZjg==
X-Received: by 2002:a05:600c:384c:b0:434:fddf:5c0c with SMTP id 5b1f17b1804b1-4392497d1d9mr24860505e9.4.1738921996824;
        Fri, 07 Feb 2025 01:53:16 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390daf4592sm83239435e9.32.2025.02.07.01.53.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 01:53:15 -0800 (PST)
Message-ID: <9f8cefc7-12e9-4c1f-9e4d-e810a3eaecd1@linaro.org>
Date: Fri, 7 Feb 2025 09:53:13 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mtd: spi-nor: macronix: Add support for Macronix NOR
 Flash
To: Michael Walle <mwalle@kernel.org>
Cc: Cheng Ming Lin <linchengming884@gmail.com>, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 alvinzhou@mxic.com.tw, leoyu@mxic.com.tw,
 Cheng Ming Lin <chengminglin@mxic.com.tw>
References: <20250207081846.362919-1-linchengming884@gmail.com>
 <20250207081846.362919-3-linchengming884@gmail.com>
 <41c4d4ac-5f71-40b1-86b9-ae8ee33db538@linaro.org>
 <23d2dd5b30cf25090ef947f9bb984d95@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <23d2dd5b30cf25090ef947f9bb984d95@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/7/25 9:23 AM, Michael Walle wrote:
> Hi,
> 
>> On 2/7/25 8:18 AM, Cheng Ming Lin wrote:
>>> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
>>>
>>> Due to incorrect values in the 4-BAIT table for these two flash IDs,
>>> it is necessary to add these two flash IDs with fixups.
>>>
>>> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
>>
>> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> 
> It would be nice to have some kind of references of the part
> numbers in the commit message/subject ;)
> 

Yes, I agree. Cheng can update when sending v2 and still keep my R-b.
