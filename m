Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FD24C80
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 00:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749514452; cv=none; b=O55Dwb9TXg7USp44FKt4u7nl0JyrxAVgexfowq6Ixq3UfNQWFN0EgemuyWeAMOv1liloKwB3WmTdMobbB3KkZQKDaP5G4jiK2S53ylyDWNevy8XhlbQEsTgQBMpmGqEPTU6KQZ3emsLfk9qcOrn1A1vjSSABPX5JftfQkdgwbnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749514452; c=relaxed/simple;
	bh=0hOMUP/EVGRFxsyJlXjn8IUYE4/mY2Cc/0ZkYgcQL+A=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=NcHqAdCQdJtMbcM9iFBlZJ0XYhA+8NRvFNhIJOCSa/BEXe7LhzYcEvxQkjOwDXqJRprJi2Nw7B0aW27mq8AHXpcC1VVfnZmFxhKmLojosUPOjG67MvcNM+w4ZsSKsJOjmMzxsRf4SZUICeKcW0vhXy8Q5VXSLQyEDuti916IVpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jo/KfF3e; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jo/KfF3e"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so3636542b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 17:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749514450; x=1750119250; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=SDmh2pXZKhDSuGnDO4AbRoLGbD8cViZkr2cVpnN67Tk=;
        b=Jo/KfF3elMkWFrVCv6oBPkAiKzFQunpWQXvSlxxBhSy6A6g5Z9DyzXOXCQSqmzFrUp
         uV5KEVxmqKRdfRcC2fsylu6XEOnEpJmihlTWoo+n1T4PRO0oKFvEE4Rrl55uvsP6adwW
         KjzDG5AL1ocyXiZV9V40i2fMx3fnD2dNbcf2RJPRuWXm67m71Yn3Tflr/ET5wQJDUMx7
         xhVqV9iC4aDw1j7qAL70uANRrJAFIQrGrWeqL1sk2IxF3x95p8uYKa8zr9pwzaRbm+HT
         umhHz9J61WQgf6N3SRqc2+3vyl8NuSM0o4olB/9FIhDu6jKUR0Ml3TLTFcn5ksp9lTIL
         43/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749514450; x=1750119250;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SDmh2pXZKhDSuGnDO4AbRoLGbD8cViZkr2cVpnN67Tk=;
        b=kq3ARstqr9sabkEYQXYU0Zm5YIraLH1/o+AyRii8lb4tUVZSWfrMjYxXz7/yL5GsG9
         YFJNrqHUTixsr65Zv5D8pU01xgBaxq7MtXWB8vl1oYvWx5OymtwF4LmGgE1XQX+lFO0N
         7jLnmjjQg9ZMpkjTO0K2GhxZ7j/MUXqP3A3aWaaXE10AbqVf4AlHLSdtSedtiLS79Xtg
         58sdRDq7Dih9PIJpBceledh9eva78U5nRtgmxRIyHiaC5+WX0ICj8GV3A9PVS2ju15Ok
         RCWHuz/hRwhrAqkFSnKyhlFbUdRRqROrLOVCd6T8QyZNMwJMcKg01t7urURoHzoDYNpL
         bjYA==
X-Forwarded-Encrypted: i=1; AJvYcCUGfJOZlChcUUUIh3M+cDNUa0/MA6hm2hsMGDB0AoIsqk1VCoJ6fgeTK3/fK+Mzust/qZrta7ojqTSnJ5o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOZ7PnTalTDN/Z0qMX5+F8Qbq7qa+5xxV55/3Nh9Eta4bHhP9w
	fcxMy6XHhmwchl7Rxa9/8gtDcDdOhwaSC/88pqOqIbyKeK8rRKIILewg
X-Gm-Gg: ASbGncsgF6h7NKAPDRFVb4iZy5wK4iB2UL2Hs4PUQ/PH7TNaTZURWMbeewCYXl3Htss
	vdQCPJVgGK6sDpjx1HM1n+/kzaviTbIkfnwrQstBDjq6DzYuFDoFGmy4OVUfNeK4NuEwgwgAk9f
	dSC7G1lcQYRmNZwN0eN8aBR/lK4AgnotYtYAMC/kd/JODg7PdL0XMg35yVzIlSXnEEbFf7+0G53
	aGNcsWbsADUQe+OC7XRhB4XPhRykZ8WxiwmyLepgZUDPi3w/fzzFL65DwklWOmsyKvrxOmWoRYu
	aapV1zIS6vnr9fzKiSeJue+fRZ1EHTc3S9LAqymQGAVaclCnKwneHebnBES79Bqm5WwCYte4j/9
	xyNEA1MS/CbOx+jTfwGfsMCjvKwbw7sSl7n4=
X-Google-Smtp-Source: AGHT+IE6bz0S2Zgw0EqTcXjTqoWNvsI9FyWPVFtwQDc8KiOypngCKu278OAjAOmX+xfaMWqaMGwNng==
X-Received: by 2002:a05:6a00:1822:b0:736:5969:2b6f with SMTP id d2e1a72fcca58-7485ea624c9mr1759998b3a.6.1749514449904;
        Mon, 09 Jun 2025 17:14:09 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af382fcsm6339982b3a.28.2025.06.09.17.14.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 17:14:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a2a0c40e-69d7-4408-add2-88616c92b0ca@roeck-us.net>
Date: Mon, 9 Jun 2025 17:14:08 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: macronix: Drop the redundant flash
 info fields
From: Guenter Roeck <linux@roeck-us.net>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Cheng Ming Lin <linchengming884@gmail.com>, tudor.ambarus@linaro.org,
 mwalle@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, leoyu@mxic.com.tw,
 Cheng Ming Lin <chengminglin@mxic.com.tw>
References: <20250407075400.1113177-1-linchengming884@gmail.com>
 <20250407075400.1113177-2-linchengming884@gmail.com>
 <d98f6eee-d5f7-43b7-bbc8-d6e7e274723a@roeck-us.net>
 <mafs05xh6pf7s.fsf@kernel.org>
 <da58fc81-3c99-4951-85bc-e3c139283b5a@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <da58fc81-3c99-4951-85bc-e3c139283b5a@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/8/25 18:13, Guenter Roeck wrote:
> On 6/8/25 05:53, Pratyush Yadav wrote:
>> On Sat, Jun 07 2025, Guenter Roeck wrote:
>>
>>> Hi,
>>>
>>> On Mon, Apr 07, 2025 at 03:53:58PM +0800, Cheng Ming Lin wrote:
>>>> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
>>>>
>>>> Many flash devices share the same ID but have different part numbers.
>>>> To avoid confusion, the part number field is removed.
>>>>
>>>> Additionally, since SFDP already provides size information and
>>>> functionality covered by no_sfdp_flags, these fields are also removed.
>>>>
>>>> Furthermore, when 4-byte address instruction table is available,
>>>> the SPI_NOR_4B_OPCODES flag is no longer needed and is removed.
>>>>
>>>> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
>>>> Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>>>
>>> With this patch in place, some of my qemu tests no longer recognize the
>>> flash chips (MX25L25635E/F). Do you have a suggestion on how to handle
>>> this other than avoiding Macronix flash chips when working with qemu ?
>>
>> Could you share some logs? Does the flash fail to detect, or does the
>> SFDP-based probing fail? Since this is qemu, it would be even better if
>> you can share a setup/reproduction guide. I have been meaning to set up
>> qemu for SPI NOR testing for some time now, but never got around to
>> figuring it out.
>>
> 
> I suspect that the SFDP data for the affected flashes is incorrect in qemu.
> Since this is very likely a qemu problem, I'll just configure different flash
> chips when running affected tests.
> 

I was able to confirm the above. This is from the kernel log:

[    4.500000] spi-nor spi0.0: BFPT parsing failed. Please consider using SPI_NOR_SKIP_SFDP when declaring the flash
[    4.500000] spi-nor spi0.0: probe with driver spi-nor failed with error -22

Guenter

