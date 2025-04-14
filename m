Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23F718B47D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 16:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744646453; cv=none; b=CApLHzcySN6S+cEmgoXp5A/jNcp2QKeTpCJlnv0CY2xidMm3xJsgpylfmlhAs4RKrW8ar0p8o04PWSwEvNx+a5DZTdjI5ESLq+bR+nKX6+kEe97V3ffH9scLxgW6xve3+VS0YkklFS3GrtGjwmjh8s4imSHe1F/CP2wZeqf89qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744646453; c=relaxed/simple;
	bh=CvIYgw+DS4zmr9C/v4ZseWU7rAi0uG5BXIwSagLDIvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z4u8+38t9AD1GNJzlT1UPNccbam3ikE0enSU+C4mtQOSaej6i5aciAGbnPg2/B4kcbk29HgIMhKatICT1Vh3RRRaCkXiFmD5VKt2a3Lxq+7zgLJ2OHeGtqENUpCERZ1FBm9gepES6Jwi3ZZaoZRnNoPjgDiL4zo4ooMQOSWpVGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=B/uoqCdC; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="B/uoqCdC"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3d5e68418b5so35889495ab.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 09:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744646449; x=1745251249; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QYswdOj8OkkGd0hypTI/qCj7jZdQJWmSZe4gJo9OFqU=;
        b=B/uoqCdCpVqhPBu0ldXwLig3F96dan7+pfmwzBf7uVO328vjQy82nQ8XjdQ1Vc/CAu
         el9e6lLqOqjTCNejfv4cm/SV8iZv93sH9Nc/Gw6oBEx82iuetDExetZzP8tW92kAMymy
         +1vieSO92boEdUH8e8dmiQ6RhqTfnIjlVpALeTXu26jgouoXLFIGORCuUv29DK/wR9ii
         hTpY+uTNg5FU2uKRC7SxQT6rZURGO+9RWOAf3vEMIF+zFRvCkkrT6IzVqV9Vk7r3P4YG
         xCgix+S0d2yK6itFevFOFR0YN4zX9VCQJZSVZZy1gAbOdmYK1BXR8+kggx6h9CxslPRx
         ixiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744646449; x=1745251249;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QYswdOj8OkkGd0hypTI/qCj7jZdQJWmSZe4gJo9OFqU=;
        b=pQlSTF1kHL1fNstY4c/+TTjJIk55X3hJdAymH25WKjAD2rjOZITpEG/O+UmUsfEMbU
         s+wXgUKgqaZtqTLemyPHgBo6hyAAZam1zOS0lzCtHlyUWfQOYn928T7YFQznhKj2KPTI
         h960CIYxLCriBLzbvj1qwHZqBSVzRa/eRghvi1CzOl7uEFUwVzRMuYdYSjHATMH6mnwL
         Dv5RSr4/9Pyolc/iVr6jJ/+1oM6fLdzv72YOydIhELFV6zu6nGJrEYbs0qzD+PPbV3bb
         41+G+K3/V3TAH14imKRaCS5UJMbcjqlJVOU+o+98nEr0lGYwu2i5D1qPK2usjUPDXa32
         TMKg==
X-Forwarded-Encrypted: i=1; AJvYcCWivHOn5OkulcgKs9QQwxDWhUjRfuuQvQwBc1jAlv+8u0AKJMOBXLrTnxIoHJe9NzLcnpEQCNJ4R5mJWds=@vger.kernel.org
X-Gm-Message-State: AOJu0YywQHsxpxHJoh5nxKhek1cXACuoa8Jv0L4vTY7Eu8V4TGm2byZ3
	k+PvEI8mk11YV1ewOH4Kz69x4YgkJs7CyeSLf37A8K83mV8nf44CdBHaVl0LZhJN56YKwLacOrH
	D
X-Gm-Gg: ASbGncu989mrqJsYPnhbNirL1+ohpK7KgoRhcfbjoCBA88RCLn/DjB+Z7GKEWtZSPa1
	svhTRaZvmA6Ycp1chYpu7rQ1mNIoydQIP1kaTB7sD0vqDnOWzOEUVfB+MGX2/cv2UHvNNut1CEw
	FW6BBHq0ZB8E6L0np4pxiLBTSO6by1mNbD7oWiyFN4NQaTvEW9JqapY5mTTut8TEyDyWNFVKfeL
	2Qz8VQsqlFWtL67fwX/EBFGy8LDIzU7N8Zgkg8xRrFGNCQwuuhqQfFyYl/cvFE1iEuE4sp7cwD1
	a3lU0o1AmXL3F/NU3xNCJtB3EPvycu3/9gkzm5T4izAbg7IUocyhtA3wjg==
X-Google-Smtp-Source: AGHT+IHe3l3IdKEf2EIxEwSF8Xnhn98r0RQtuVLorIVoWb4ht7Iy5IoHWekoLkjH68FO20YrBiRk1g==
X-Received: by 2002:a05:6e02:b2a:b0:3d2:b72d:a502 with SMTP id e9e14a558f8ab-3d7ec27330bmr141379655ab.22.1744646447034;
        Mon, 14 Apr 2025 09:00:47 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.166])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d7dba8536asm27766165ab.28.2025.04.14.09.00.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 09:00:46 -0700 (PDT)
Message-ID: <0dc3bb03-3708-4134-96bf-d5f95187e8bb@sifive.com>
Date: Mon, 14 Apr 2025 11:00:44 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/10] riscv: dts: eswin: add HiFive Premier P550 board
 device tree
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Min Lin <linmin@eswincomputing.com>,
 Pritesh Patel <pritesh.patel@einfochips.com>, Yangyu Chen
 <cyy@cyyself.name>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Yu Chien Peter Lin <peterlin@andestech.com>,
 Charlie Jenkins <charlie@rivosinc.com>,
 Kanak Shilledar <kanakshilledar@gmail.com>,
 Darshan Prajapati <darshan.prajapati@einfochips.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner
 <heiko@sntech.de>, Aradhya Bhatia <a-bhatia1@ti.com>, rafal@milecki.pl,
 Anup Patel <anup@brainfault.org>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
 <20250410152519.1358964-11-pinkesh.vaghela@einfochips.com>
 <956d76b0-4f82-4f95-8f70-70896d488bd3@collabora.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <956d76b0-4f82-4f95-8f70-70896d488bd3@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ariel,

On 2025-04-14 7:55 AM, Ariel D'Alessandro wrote:
> Hi Pinkesh,
> 
> On 4/10/25 12:25 PM, Pinkesh Vaghela wrote:
>> From: Min Lin <linmin@eswincomputing.com>
>>
>> Add initial board data for HiFive Premier P550 Development board
>>
>> Currently the data populated in this DT file describes the board
>> DRAM configuration, UART and GPIO.
>>
>> Signed-off-by: Min Lin <linmin@eswincomputing.com>
>> Co-developed-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
>> Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
>> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
>> Tested-by: Samuel Holland <samuel.holland@sifive.com>
>> ---
>>   arch/riscv/boot/dts/Makefile                  |  1 +
>>   arch/riscv/boot/dts/eswin/Makefile            |  2 ++
>>   .../dts/eswin/eic7700-hifive-premier-p550.dts | 29 +++++++++++++++++++
>>   3 files changed, 32 insertions(+)
>>   create mode 100644 arch/riscv/boot/dts/eswin/Makefile
>>   create mode 100644 arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
>>
>> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
>> index 64a898da9aee..29a97a663ea2 100644
>> --- a/arch/riscv/boot/dts/Makefile
>> +++ b/arch/riscv/boot/dts/Makefile
>> @@ -1,6 +1,7 @@
>>   # SPDX-License-Identifier: GPL-2.0
>>   subdir-y += allwinner
>>   subdir-y += canaan
>> +subdir-y += eswin
>>   subdir-y += microchip
>>   subdir-y += renesas
>>   subdir-y += sifive
>> diff --git a/arch/riscv/boot/dts/eswin/Makefile b/arch/riscv/boot/dts/eswin/
>> Makefile
>> new file mode 100644
>> index 000000000000..224101ae471e
>> --- /dev/null
>> +++ b/arch/riscv/boot/dts/eswin/Makefile
>> @@ -0,0 +1,2 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +dtb-$(CONFIG_ARCH_ESWIN) += eic7700-hifive-premier-p550.dtb
>> diff --git a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts b/arch/
>> riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
>> new file mode 100644
>> index 000000000000..131ed1fc6b2e
>> --- /dev/null
>> +++ b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
>> @@ -0,0 +1,29 @@
>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>> +/*
>> + * Copyright (c) 2024, Beijing ESWIN Computing Technology Co., Ltd.
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "eic7700.dtsi"
>> +
>> +/ {
>> +    compatible = "sifive,hifive-premier-p550", "eswin,eic7700";
>> +    model = "SiFive HiFive Premier P550";
>> +
>> +    aliases {
>> +        serial0 = &uart0;
>> +    };
>> +
>> +    chosen {
>> +        stdout-path = "serial0:115200n8";
>> +    };
>> +};
>> +
>> +&uart0 {
>> +    status = "okay";
>> +};
>> +
>> +&uart2 {
>> +    status = "okay";
>> +};
> 
> Although commit log says that this includes DRAM configuration, looks like it's
> missing? In order to test this patchset, had to add this following memory
> definition (picked from vendor kernel repository):
> 
>     L50: memory@80000000 {
>             compatible = "sifive,axi4-mem-port", "sifive,axi4-port",
> "sifive,mem-port";
>             device_type = "memory";
>             reg = <0x0 0x80000000 0x7f 0x80000000>;
>             sifive,port-width-bytes = <32>;
>     };

That is a misstatement in the commit message. The memory node is not included in
the static devicetree because the amount of RAM installed on the board is
variable. It is the responsibility of firmware to provide the memory map, either
through EFI or by patching the memory node into the DT at runtime. I believe the
current BSP U-Boot does the former but not the latter.

Regards,
Samuel

