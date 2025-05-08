Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF5620C46F
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 11:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746705322; cv=none; b=nznYyZqimtD65OY9+B+00TfO9PL5ZmLrhE25GzMcOAg26QSq3RfHTFvnrggmfH2MtUUWxg2Ku36D8qj9ePeK6x8VPMFSG4chYf94Vc4wyxj8v2XMtwST70H17on8VFztbTfCYxZnVVtvyu4TmnXotvhOEDPvMUU+4/PghCe6g+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746705322; c=relaxed/simple;
	bh=midlBCKcdFgiAxhf8+dL21uCfSmZow643JGt2nOszyQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S5BoDXCvShs3znQYcBOWH+RoOpwQ3dOGFIMoil6jkjJEvbGEpK9jkcHhGiVcZIeXRcnGhRjmLk9NyZ6oVddtrcmaZu14AjzaFVcXDfvvPe9F5mqx0Kb6yTOdSKiA81FhV95tA3huQJAk271c2nst29hPMgK0++Hcy+b6bBHhbWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=yj9IOSyo; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="yj9IOSyo"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-86135af1045so96323039f.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 04:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746705319; x=1747310119; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vhDurVJcqA9s7Wksb9BxQ/qUoHZJHNjRKlauWc65nyw=;
        b=yj9IOSyos/2saqVLEyGeLbQt/rUa9mYt3NhqDeAw8s6FsJd6+Zy5UMvAtrcivef0f5
         sNT71id1s7dz+FPKwhUbbjs/FPo38v+ljrCtYfdyvPVkiAwtxtbb15fqqRlKFDFJyhLv
         66mHNjmpWaYn1sxL3eQBnMwkmY339/rHm6n213OEa8Edu2c5j3vbFlSsI0PjC2RuVwMt
         UjxT+DwYLEU8sghN3de80bBL44jiV53/a7d5+pLAyAVsgpu9FHk7BClPeSp74ujG7/JR
         jSqOJ8tY0f8MrAL+m1+pHxls7MtbMZMg5175Sc+VXfshctXqN+M2rJywyYGPExFTXVpd
         +osA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746705319; x=1747310119;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vhDurVJcqA9s7Wksb9BxQ/qUoHZJHNjRKlauWc65nyw=;
        b=tVlQvWQxYb/JRp3qpX82J3wE1mL2EmkwtCvjWCZ4/SdXO7yVenDRkMDCjyJeyYhcbI
         HExbv0k7bz5v59a4QPHPD738CWC2Yd7GCaBo0h19WOUs8hkkB2gyPTUdwIsG2d8dNyuI
         BU9BJYQw69VgKQHjuCINyCF5W83mF68HcrxAGYuDrAccBmtRqrIfCfmUA1PVz01DcIWA
         3ZQufSBe9vUaJh/dnF94AaexFsaNuwySksVXvRdPLiiUNya94K9JGgn518SfRDWUKn1d
         TeW9gfbpoMMTAdhfjj1KMcOef4zM7RQX2apoFHqb2V+yUeMOXrPoc3SzIKTea1ersyh1
         xNrA==
X-Forwarded-Encrypted: i=1; AJvYcCVtbP7qfbOauG0oxTWTzziI8eiXgOYG4b79bagv40pSMUIkwiJzkMk2pPd6keYonmAgns6HpYrHn0RXzlo=@vger.kernel.org
X-Gm-Message-State: AOJu0YztH1T4gij1uIxUU682ZItiTfdgOUE8QRgFCF5ZSw09J1Za+2g/
	zU0QEyT4WjMEEEHcbRmsJfFnv5OcNkeNXnEjp5tShXTq/xg/FICJoaf/Gvi/19Y=
X-Gm-Gg: ASbGncvQOHnFffm7YCF4vZuXpc+rVTUOMLN7Tm0wfqUbIMd62bbRFdYO9s4nQxzoOqm
	pskX3elrtN9cw3SkQJzjhN2ZYREi8qRQkcJ+tVfUpKLH7KVja4OvNUHLg19eagP0XzCN1a6ZG/C
	yWqLd3cor5gdJ9dRQMuxp6LgGn+n0WD+vxfGs5+LWNHtXjxYge5yei05ZkvI4VY9K8e69Qyk3fR
	Wsg0Q6cO7aIvhVT6fQJj6rrmi33SlRIDBuyLCqnkKSrUmJ85TwNJph4lXuwDfMshEUuhDPIkL5f
	T0Thppwll2MvAakmkP3lLlYW9or28Fx2SNM0n5Z2QuA6GUEbNL3tKzXqIGeFYQSMCtqMCjmbZ43
	hBbX2
X-Google-Smtp-Source: AGHT+IEh2FhuFJwVM0F6B9wDjDp9naJK3ymVtjg5UbqAxVbspiUli3XlMFk+hC4tqNPEL0TAprtw2A==
X-Received: by 2002:a05:6602:140d:b0:85b:5494:5519 with SMTP id ca18e2360f4ac-8675502ea2bmr392308139f.5.1746705319163;
        Thu, 08 May 2025 04:55:19 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88a91464csm3168549173.31.2025.05.08.04.55.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 04:55:18 -0700 (PDT)
Message-ID: <d2614363-1dab-4ea3-b79a-5d3c02c4bc17@riscstar.com>
Date: Thu, 8 May 2025 06:55:17 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] reset: spacemit: add support for SpacemiT CCU
 resets
To: Haylen Chu <heylenay@4d2.org>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, dlan@gentoo.org
Cc: inochiama@outlook.com, guodong@riscstar.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250506210638.2800228-1-elder@riscstar.com>
 <20250506210638.2800228-5-elder@riscstar.com> <aBxDQ1_2xJjGlwNf@ketchup>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aBxDQ1_2xJjGlwNf@ketchup>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/8/25 12:38 AM, Haylen Chu wrote:
> On Tue, May 06, 2025 at 04:06:35PM -0500, Alex Elder wrote:
>> Implement reset support for SpacemiT CCUs.  The code is structured to
>> handle SpacemiT resets generically, while defining the set of specific
>> reset controllers and their resets in an SoC-specific source file.  A
>> SpacemiT reset controller device is an auxiliary device associated with
>> a clock controller (CCU).
>>
>> This initial patch defines the reset controllers for the MPMU, APBC, and
>> MPMU CCUs, which already defined clock controllers.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/reset/Kconfig           |   1 +
>>   drivers/reset/Makefile          |   1 +
>>   drivers/reset/spacemit/Kconfig  |  12 +++
>>   drivers/reset/spacemit/Makefile |   7 ++
>>   drivers/reset/spacemit/core.c   |  61 +++++++++++
>>   drivers/reset/spacemit/core.h   |  39 +++++++
>>   drivers/reset/spacemit/k1.c     | 177 ++++++++++++++++++++++++++++++++
>>   7 files changed, 298 insertions(+)
>>   create mode 100644 drivers/reset/spacemit/Kconfig
>>   create mode 100644 drivers/reset/spacemit/Makefile
>>   create mode 100644 drivers/reset/spacemit/core.c
>>   create mode 100644 drivers/reset/spacemit/core.h
>>   create mode 100644 drivers/reset/spacemit/k1.c
>>
> 
> ...
> 
>> diff --git a/drivers/reset/spacemit/Kconfig b/drivers/reset/spacemit/Kconfig
>> new file mode 100644
>> index 0000000000000..4ff3487a99eff
>> --- /dev/null
>> +++ b/drivers/reset/spacemit/Kconfig
>> @@ -0,0 +1,12 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +
>> +config RESET_SPACEMIT
>> +	bool
>> +
>> +config RESET_SPACEMIT_K1
>> +	tristate "SpacemiT K1 reset driver"
>> +	depends on ARCH_SPACEMIT || COMPILE_TEST
>> +	select RESET_SPACEMIT
>> +	default ARCH_SPACEMIT
>> +	help
>> +	  This enables the reset controller driver for the SpacemiT K1 SoC.
> 
> With auxiliary bus introduced, Kconfig entries for both the reset and
> clock should select AUXILIARY_BUS, or building defconfig will fail with
> undefined references,

Wow, I really should have made this v1 of a new series.  You point
out several problems that came out of this using the auxiliary
device framework, which I should have tested more thoroughly.

Yes I will update this to select that, and will test it before
my next version.

> 
>          riscv64-unknown-linux-musl-ld: drivers/clk/spacemit/ccu-k1.o: in function `k1_ccu_probe':
>          ccu-k1.c:(.text+0x19c): undefined reference to `auxiliary_device_init'
>          riscv64-unknown-linux-musl-ld: ccu-k1.c:(.text+0x226): undefined reference to `__auxiliary_device_add'
>          riscv64-unknown-linux-musl-ld: drivers/reset/spacemit/k1.o: in function `spacemit_k1_reset_driver_init':
>          k1.c:(.init.text+0x1a): undefined reference to `__auxiliary_driver_register'
>          riscv64-unknown-linux-musl-ld: drivers/reset/spacemit/k1.o: in function `spacemit_k1_reset_driver_exit':
>          k1.c:(.exit.text+0x10): undefined reference to `auxiliary_driver_unregister'
> 
>> diff --git a/drivers/reset/spacemit/Makefile b/drivers/reset/spacemit/Makefile
>> new file mode 100644
>> index 0000000000000..3a064e9d5d6b4
>> --- /dev/null
>> +++ b/drivers/reset/spacemit/Makefile
>> @@ -0,0 +1,7 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +obj-$(CONFIG_RESET_SPACEMIT)			+= reset_spacemit.o
> 
> As RESET_SPACEMIT is defined as bool, the reset driver will never be
> compiled as a module... so either the RESET_SPACEMIT_K1 should be
> limited to bool as well or you could take an approach similar to the
> clock driver.

I'm not sure I understand this statement, at least in this
context.  This pattern is used to define a single module
"reset_spacemit.o" out of several source files.

But I think you're saying that RESET_SPACEMIT and
RESET_SPACEMIT_K1 should both be bool, or both be
tristate.  I will resolve that question before I
send the next version.

>> +reset_spacemit-y				:= core.o
>> +
>> +reset_spacemit-$(CONFIG_RESET_SPACEMIT_K1)	+= k1.o
> 
> ...
> 
>> new file mode 100644
>> index 0000000000000..19a34f151b214
>> --- /dev/null
>> +++ b/drivers/reset/spacemit/k1.c
> 
> ...
> 
>> +MODULE_DEVICE_TABLE(auxiliary, spacemit_k1_reset_ids);
>> +
>> +#undef K1_AUX_DEV_ID
>> +
>> +static struct auxiliary_driver spacemit_k1_reset_driver = {
>> +	.probe          = spacemit_k1_reset_probe,
>> +	.id_table       = spacemit_k1_reset_ids,
>> +};
>> +module_auxiliary_driver(spacemit_k1_reset_driver);
>> -- 
>> 2.45.2
> 
> If you're willing to make the reset driver buildable as a module, please
> add MODULE_{LICENSE,DESCRIPTION} statements and possibly also
> MODULE_AUTHOR(), or modpost will complain,

OK, thank you.

					-Alex

> 
> 	ERROR: modpost: missing MODULE_LICENSE() in drivers/reset/spacemit/reset_spacemit.o
> 	WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/reset/spacemit/reset_spacemit.o
> 
> Best regards,
> Haylen Chu

