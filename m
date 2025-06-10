Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FAC27A92F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749541425; cv=none; b=RIKQjeIFTThf3+CoOpizAoLInBiNwtepM2s0wC4kxhnFxRvimTpXSQuyejpZ7aSCslHp35B3YTgKBIdMVjs5XcXfgbb2TFbZFl4qiSAJ1xe40t9hVqZ5qbmNkbvLUxUYXcoQ9oH+VEgnUJRSC0WOG34M2uwL1Bsmw/h+yDuCG8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749541425; c=relaxed/simple;
	bh=tLCGN1EjzaCequ4K7x4vShuXvzpwLxZEfpHMz3OrYhg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aOwN81R/GzaK5mR576FWTPsrzjKh+PqBtIp+w7EPN6LJGMi2cILI0ZSvw0qYfW86giN8HRNUMXryGuKLgni1BQ6jIIV1aJCSnnuUj65knxezeAR1IlOHZr4yHs016puh0dmKZD25dGFjREp9zcYST98MLeAIMdlK3iUteiYzHKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C5n320pO; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C5n320pO"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-236377f00easo5891225ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 00:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749541422; x=1750146222; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=OfU97cZH2HgHI7uIemmkAw8kJldevbQFXn6zd95g/RE=;
        b=C5n320pOqaanZhr7e+ztpFsPWjymyZwIGrWJcc+aq5b398wpoFCpnQ3FhC+9TXrgwr
         i7Al12llpcjWuDEnaRzzbP1EomniNiDR/3ASRxG0XK1FVLFxCivUa7Y25n1ZiZ6kMF9K
         4xHYKVkb2nVFUxgCpMRwMQo0+p3zo/+JPivdgI0eSqrr6oRNw1SwIaNyxEjsoOBlyN7v
         FeT3QuOq8wHRFTu5T7mgiSpFHQyhDb5AXiieoZI1cWL1Wg5yrBOg/MgEr2VyV2X0RCos
         9EUl2ZKzjWOLKDNGBNquAeRrYDklMa7TECpi7H/WxSUM4lgF6oOMdN1fAH3HAc2/VMd+
         0w8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749541422; x=1750146222;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OfU97cZH2HgHI7uIemmkAw8kJldevbQFXn6zd95g/RE=;
        b=HIlhg+VRHJ1L3ZQatjXOZY8GXSxVHCV+La5wWDufP3kRqgQIsrQVNv8xvWss7iRxU5
         t4GT4sFy0PudeOVDE9MZkvAdgD4HX0Vy0UfqxZnJ72Fs3dFjjTQnc8Qhs4WsvRTj8YtR
         1S8y9Wic/4G6N8cHbZx/IO+TgPFSafqC85ipWVFQnw6Oo6Rl6eSf8UQlf4kFPUzAPqDg
         90ESRgcgS8hperlwiZcrn7tzA1wB4INBn6aF5KKIsjj1gqjp8cSkvcqT7r9iE2g5oocV
         g0GB/Gb1loR+G2HP6FxZTW3HQp3R1kfWSUt1BnDHkB2o2jqU1QlVYrwgh6p8Te0rHQN8
         7DCw==
X-Forwarded-Encrypted: i=1; AJvYcCURgdm9PqUK83pYpMUceoIfY6Xb4Af5t7UNUEjSoAmokPFnspAVqooof3Euj1oOZuFIn4zHKIDIT7L8ZVo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDMU4y7DJTvb2ygRG+YF5i/80EfOOWfq9fOW1IBAofBmBujMVX
	9WwkLYZZOlWSbQc3/N/RjJBEXA7/w+v7kadWBYxs9RGFZlahHyEBp0ef
X-Gm-Gg: ASbGncuvE1r5vmrmLjxD31+R78tu1QyIDq37zO6yAmpM9t1h6DMYJpqgjg5fQcmx0OB
	HJtK4x+5JAhvcvQOCaLVHIHvWNtv/Pqg7vJSm9vl0qNgMJHPvXDhPrd+BOsb9XniJMRM10MdYGH
	U2vVu5gkN/CcDCVtt/hiRVYFVVENjp/LQjNbLrmK87Dqk0bIoOCI0vfXd5CFeCXDa3haHVlDmx8
	mDxlKJHYCzdb4JRg1HvW52QIoWaoGatYFk0DR/ZxZ7uOva0PCzbUcZpvPG0+xvTxgoXL2cmQsPO
	9HTJVVG0/8+ehzLDO7wzyxN8uxYh8D/82qL+hPGMzl52Ln7fL4XeETsicZoTJf8ZQZhqKfwHHcY
	Pb/aE9oGiLJ9Sew698MjXYh57i9hPT4fdZ3I=
X-Google-Smtp-Source: AGHT+IHdhMgBtQokcJ/Q7bh9+BcN8CJW/QMCpCT6PI94inpveIKBqilCMqdGnB1z9W9y+xUFTQDFQQ==
X-Received: by 2002:a17:902:dacb:b0:235:f70:fd39 with SMTP id d9443c01a7336-23601ced438mr229890505ad.10.1749541422122;
        Tue, 10 Jun 2025 00:43:42 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5ed59cdcsm6305969a12.12.2025.06.10.00.43.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 00:43:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8d4bd876-3571-46e5-857a-948e58b21c5b@roeck-us.net>
Date: Tue, 10 Jun 2025 00:43:40 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: macronix: Drop the redundant flash
 info fields
To: Cheng Ming Lin <linchengming884@gmail.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,
 Cheng Ming Lin <chengminglin@mxic.com.tw>, mwalle@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 alvinzhou@mxic.com.tw, leoyu@mxic.com.tw
References: <20250407075400.1113177-1-linchengming884@gmail.com>
 <20250407075400.1113177-2-linchengming884@gmail.com>
 <d98f6eee-d5f7-43b7-bbc8-d6e7e274723a@roeck-us.net>
 <mafs05xh6pf7s.fsf@kernel.org>
 <da58fc81-3c99-4951-85bc-e3c139283b5a@roeck-us.net>
 <a2a0c40e-69d7-4408-add2-88616c92b0ca@roeck-us.net>
 <aa2a4480-9b78-4ed9-8f9d-b18a87eb01e9@linaro.org>
 <CAAyq3SYybDgBvkTKh2ZB4UdKq1XV_nnzx3Tj1P915W5x_7_nNA@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAAyq3SYybDgBvkTKh2ZB4UdKq1XV_nnzx3Tj1P915W5x_7_nNA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/10/25 00:29, Cheng Ming Lin wrote:
> Tudor Ambarus <tudor.ambarus@linaro.org> 於 2025年6月10日 週二 下午2:46寫道：
>>
>>
>>
>> On 6/10/25 1:14 AM, Guenter Roeck wrote:
>>> On 6/8/25 18:13, Guenter Roeck wrote:
>>>> On 6/8/25 05:53, Pratyush Yadav wrote:
>>>>> On Sat, Jun 07 2025, Guenter Roeck wrote:
>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> On Mon, Apr 07, 2025 at 03:53:58PM +0800, Cheng Ming Lin wrote:
>>>>>>> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
>>>>>>>
>>>>>>> Many flash devices share the same ID but have different part numbers.
>>>>>>> To avoid confusion, the part number field is removed.
>>>>>>>
>>>>>>> Additionally, since SFDP already provides size information and
>>>>>>> functionality covered by no_sfdp_flags, these fields are also removed.
>>>>>>>
>>>>>>> Furthermore, when 4-byte address instruction table is available,
>>>>>>> the SPI_NOR_4B_OPCODES flag is no longer needed and is removed.
>>>>>>>
>>>>>>> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
>>>>>>> Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>>>>>>
>>>>>> With this patch in place, some of my qemu tests no longer recognize the
>>>>>> flash chips (MX25L25635E/F). Do you have a suggestion on how to handle
>>>>>> this other than avoiding Macronix flash chips when working with qemu ?
>>>>>
>>>>> Could you share some logs? Does the flash fail to detect, or does the
>>>>> SFDP-based probing fail? Since this is qemu, it would be even better if
>>>>> you can share a setup/reproduction guide. I have been meaning to set up
>>>>> qemu for SPI NOR testing for some time now, but never got around to
>>>>> figuring it out.
>>>>>
>>>>
>>>> I suspect that the SFDP data for the affected flashes is incorrect in
>>>> qemu.
>>>> Since this is very likely a qemu problem, I'll just configure
>>>> different flash
>>>> chips when running affected tests.
>>>>
>>>
>>> I was able to confirm the above. This is from the kernel log:
>>>
>>> [    4.500000] spi-nor spi0.0: BFPT parsing failed. Please consider
>>> using SPI_NOR_SKIP_SFDP when declaring the flash
>>> [    4.500000] spi-nor spi0.0: probe with driver spi-nor failed with
>>> error -22
>>>
>>
>> It's likely the problem where the same flash ID is used for different
>> flavors of flashes. Typically we differentiate the flavors by comparing
>> their SFDP data and use post SFDP hooks to amend where needed. If no one
>> cares about fixing it, we can undo the change for the affected flash or
>> revert the patch entirely. Cheng?
>>
> 
> Since this patch removed the size field, the issue occurs because the
> "spi_nor_init_params" function now processes the "spi_nor_parse_sfdp"
> function. As a result, the error is likely caused by a problem during the
> SFDP parsing, which leads to the failure of "spi_nor_init_params".
> 
> The issue can be resolved by adding .size = SZ_32M to the flash_info for
> MX25L25635E to prevent failures caused by SFDP parsing.
> 
> The root cause of this problem lies in the failure of parsing the SFDP
> data for the flash, rather than an issue with the patch itself. I believe
> we should not revert this patch.
> 

I tend to agree. The problem is very likely on the qemu side and should be
addressed there.

Guenter

