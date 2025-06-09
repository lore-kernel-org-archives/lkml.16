Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EF61E87B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 01:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749431596; cv=none; b=eJykxM1Odaoi9Hfk5K+TvSbNrENHYi0AOPIZobmuAkm80IJANEX+D1vSNuK/3x6hpoe+zfA93wpsYxGKhR3cW1ddqVV/lXYqvNmOCJV6d0Fj5fze2WnzUiF1Otn3O7m8cXVRyQoONMSnfxUIfxIan07/JjuKzNoE90ry1bSr62I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749431596; c=relaxed/simple;
	bh=70U6i0Sckk66iXN3e8lgVUlWgEY67B1AttL8H7TupYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fngSSrZUxrCtzkmyVVfRhyW1IftCB2NcOfjvPlW0CZ9n05bqj3LG2H3I9IwLjD9kQ1yPOM/81fqlKDgTJbOMk4nflglj4ZZP8BHg5jodx0WK8558P+tIbgNr226hvKlbFWVhecsMEh9z6A2d5u8+7TjXMG6qPWpiObzKbnf2bHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i8eypQC3; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i8eypQC3"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-747fc7506d4so3607978b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 18:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749431593; x=1750036393; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Zzv2Z32HyhBbevN9sWOTHP2DeH7U5lczNhzolLKy40k=;
        b=i8eypQC3fe1SC16KUyEWGSP0K4RzmJs0usrGGKtXvGUCw6L608nGLJARaFj+3j3R3X
         rD1hCeHrFaUBCxPvGtRigFT8qua7yV51NHsizj6hQzgXWP4v7bdj/BeS5L0Tfhqxg+4W
         Xk5hrdDVVrqA3q5qLtkU2oa/7wg7VYziIUAjg0RPa74lHpFaLnnzYuMaeAm00lhzUrBw
         qTKzxLRz+jWYkGffqcfJJdi6JKtBnHh2nCW5w0zJz3oCAWPHrmslhLTRkZdhNP5upYuP
         dhi4QTV3Akd1B5Emx8hrggGZGojWJbuWr9/d2a0k8tQA9s8Zogo35iP45lxYWEgLArh2
         KL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749431593; x=1750036393;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zzv2Z32HyhBbevN9sWOTHP2DeH7U5lczNhzolLKy40k=;
        b=ZFAotGwVg0sQzrw9Mh22ab5UPrM83W2BYctz6v9Q4aI8Q7QUZtGrVhGcZVTmfbYzhp
         dty+BX/K3YUX3v+Kn6tHE13v4h0stZODip8t+Bl/uXwOU+FvQvv02btssHfW2Sj9I+OU
         BSDgsD4+0NCJrApcEoGqWE9Mz19pzNJxkdG2kPCEZtBG8vTSxqHkMrbWYq3A5J8cW0Ld
         lLnRynir+7bcG9HaerQ4ZqXjU4BzSEUurAJkdaPunDWh3URqvunQgtDnwfQEIvx63qlg
         DOa5eHhzXF5aL24gZpoUWLq2d2Jc55ueSdpd/ztk5VwV6Wc7wKsxuXqwA8G8Hh74cvRU
         u33w==
X-Forwarded-Encrypted: i=1; AJvYcCXXhK4jYswG/byXrhwXKsLmSaETh5Hhzot9qAXugHLxRLqY+LNUeuVda8SPiJ6HNFu3gfAbbfGg7rbBoic=@vger.kernel.org
X-Gm-Message-State: AOJu0YxY0iWkuV3kLnBGmJM6Do4JatRn/Qi54Cz0YJQG58BvqGS/rCzU
	tl7OCmigrGP4XX70kct21N+POwp3SRS9GydjNH38XxP8ay2NH0kUkk27b36nqOtt
X-Gm-Gg: ASbGncvnBJmP+UmSlLck3zfK5ztvP3+ddquNq9R1qC8qxptnZRIKfSOg1KVcSCq42rn
	JKqauzqBXJj3SD49j/OvTavB4fireMWFf28AvkJFgBAJfh764h4n63JOzjXQPzM15oMBME49Ict
	LbaQL1kCx4GxdFhUUyxUM3jvSwnya2o6QTlTWBalnrFIZ4sqlK2uqdrYqGzgSNu+1z/I5Y+hrv8
	gh6qvL39NP63lPKAeEfrV2l0o03C0mTJdecmQ8OayHZPFe+Ktkp9fSIFoy7VEaB39Fw8PisFVLe
	Zh7QuTyr7bpESuzlSaduIIf5fSRyFOEj9lvsXwH3cb9Kj9JHz9oXAXI1nTJpQJ7IykFk5HBiiO0
	MopLEwuqYywq6fgfBm04Dc4sA
X-Google-Smtp-Source: AGHT+IERZXXJmLUp5a0fm5aKZrN/RHRQVF5VsEpm3yXM37V2sOYOT+DgDTx6OM4kL7Ussl4hyDFxwg==
X-Received: by 2002:a05:6a00:2e86:b0:742:a02e:dd8d with SMTP id d2e1a72fcca58-74827f36224mr16505756b3a.20.1749431592641;
        Sun, 08 Jun 2025 18:13:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0ea282sm4603052b3a.151.2025.06.08.18.13.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jun 2025 18:13:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <da58fc81-3c99-4951-85bc-e3c139283b5a@roeck-us.net>
Date: Sun, 8 Jun 2025 18:13:09 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: macronix: Drop the redundant flash
 info fields
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
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <mafs05xh6pf7s.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/8/25 05:53, Pratyush Yadav wrote:
> On Sat, Jun 07 2025, Guenter Roeck wrote:
> 
>> Hi,
>>
>> On Mon, Apr 07, 2025 at 03:53:58PM +0800, Cheng Ming Lin wrote:
>>> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
>>>
>>> Many flash devices share the same ID but have different part numbers.
>>> To avoid confusion, the part number field is removed.
>>>
>>> Additionally, since SFDP already provides size information and
>>> functionality covered by no_sfdp_flags, these fields are also removed.
>>>
>>> Furthermore, when 4-byte address instruction table is available,
>>> the SPI_NOR_4B_OPCODES flag is no longer needed and is removed.
>>>
>>> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
>>> Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>>
>> With this patch in place, some of my qemu tests no longer recognize the
>> flash chips (MX25L25635E/F). Do you have a suggestion on how to handle
>> this other than avoiding Macronix flash chips when working with qemu ?
> 
> Could you share some logs? Does the flash fail to detect, or does the
> SFDP-based probing fail? Since this is qemu, it would be even better if
> you can share a setup/reproduction guide. I have been meaning to set up
> qemu for SPI NOR testing for some time now, but never got around to
> figuring it out.
> 

I suspect that the SFDP data for the affected flashes is incorrect in qemu.
Since this is very likely a qemu problem, I'll just configure different flash
chips when running affected tests.

For reference, here is a sample qemu command line.

qemu-system-arm -M supermicro-x11spi-bmc,fmc-model=n25q256a13,spi-model=n25q256a13 \
	-kernel arch/arm/boot/zImage -no-reboot -snapshot -audio none \
	-drive file=/tmp/flash,format=raw,if=mtd -nic user \
	--append "root=/dev/mtdblock0 rootwait console=ttyS4,115200 earlycon=uart8250,mmio32,0x1e784000,115200n8" \
	-dtb arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dtb \
	-nographic -monitor null -serial stdio

This is with aspeed_g5_defconfig. In this example, ",fmc-model=n25q256a13,spi-model=n25q256a13"
is used to override the default flash model (MX25L25635E) because it longer works after
this patch. Normally that should not be required, but it is useful to test support
for different flash chips.

Guenter

