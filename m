Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A75B1FE479
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 00:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738716145; cv=none; b=sV7Si3F++IyM7Y8NNZxIc0kCa4Noat1ijI4pIq33ZZ7YjzgUl+91HM7delncoHbruthCelpav5Faqris3+7fQUO763w2hOpRP3yXAth0Zfb+XRG9ye1XO5QhcFM8XdHfCpNsujDyDAy2EMCmGqojBv6G664muVd57PH4r110LnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738716145; c=relaxed/simple;
	bh=EqaPW3xdiUQmOYSjh5SnP1AS6mP2AmWp8x1emlxStAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=j7UB2wqV3TR3hKZgqZ1B3FsI2rEXErXSysoYdw1EFkSm9vz0bjQrN5VfXTdPSA5O+H0G4vuiQ7jzU2+JZIdz2UsBOniHIV/NYuUBb+WiKkBl/5qTVSNmvo/ehmWzoGAR2purywRMLianOqcTglXND+u5d89Iuou0pxasEFafDHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=F9DMb2JM; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="F9DMb2JM"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-29fb5257e05so1902514fac.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 16:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738716142; x=1739320942; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8HEL22nxOQOcwSnfkdtHhxWLtUiDi8VUF8TCzTHTO4I=;
        b=F9DMb2JMtV8pgILuGt70YVQAA4vITRHVYz0USR8w5u4p54WlQDVF7FxOjWZcnwIFJ4
         3FjVxBD7qjk5hQElWxPClnPqYOfYrZqXYCG21A7lk9nwCJvVBn+5rYN5OVgpy3rG0NhY
         /0eOwiQc3sD+kxjud3hGqI2kxy6MU1lsNpgFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738716142; x=1739320942;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8HEL22nxOQOcwSnfkdtHhxWLtUiDi8VUF8TCzTHTO4I=;
        b=uhOHA53m7sdd8rNEb5WENXx6FYArUZKI0vZDBhOtoOyvKda8zv6lI2Cx7Fnfuacbl3
         TefjAOjkl/6OQsZGOHXRDi4vPz4UhBKwTtpALMfPGnYj+6KP+VZGS92zpE/fG/R9gBe8
         1rn5jM51eSKaU7V/IsBYy6MnLOPkfDi3lsQZLS8saspG7RlQb7nazmeVKRxFGBNGhODx
         QiZcdrWwItH9WLeBqTTz3CzGpdg5hdeItSunp1w0bunwsoQasEAMwAptFIraYmMDiWp5
         0nTD+jr6yI5WDV/T+sBkBa0776+Mg9MAVY4yAvIcF3SCSgLhOoAhhR4Gf7AtwfFXvtjf
         /avA==
X-Forwarded-Encrypted: i=1; AJvYcCXXgj3wtVNRg9EfSi0FGCxF1rvpLTs38POvZtkYZHEIY+DhpR4gO3TH3IeAZ0UYD99AvaGU5QqhXuztaFU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKN4v8vxzyEuZj6Qo/9Lk9l0IZp/AeCp15weR5oEKeFQIexEyf
	pFy49zq/Uq7uk4kp+N+6VhCGu0HIAgSa/6wznm3NHKaTpf1eKkvz94hG9q8IPg==
X-Gm-Gg: ASbGncvQDYyY6cVqT4G4MT6dNZFHhcCcXOPIbes/wTMxy6viYkx9kayB8Zo/7e3wi/v
	eqTMKmAfeFFokL+wHg30gdStCEYxALk5QUvECzxmGgx+ocoVdnDDfJcLR0hILlHf0nW73gb9zjD
	vW5sy0ue84OqRWOMQgzycEupSKAqbbnGW4MeC3lUFzmF68LP4XEsVj9FZCQqVQjfKxb0f1wZQsp
	r1nkd8i6nL1UR+6hqRjxPak0hRx0T7yOsbecOHKt+7kf3kEDUvaEIzChoXIpfRVC7QVge+SNZ0W
	tKaipOm4SyG4FVKFXAV9wab1oJg5NbcSC6r9R0BVFL+Yh9rJUnefoAQ=
X-Google-Smtp-Source: AGHT+IFgAjdHq+56Bk4WdO4hgdHaJGyuOu8aXb46B2HADIqWho9i/IEMEXW/4EWKjmKB6c6nSllcQQ==
X-Received: by 2002:a05:6870:14d4:b0:27d:10f5:347 with SMTP id 586e51a60fabf-2b804f4ebd6mr660767fac.15.1738716142405;
        Tue, 04 Feb 2025 16:42:22 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fc105d8a17sm3452920eaf.38.2025.02.04.16.42.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 16:42:21 -0800 (PST)
Message-ID: <f4adcf94-8a06-4a24-8359-917016b2c4d6@broadcom.com>
Date: Tue, 4 Feb 2025 16:42:20 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kconfig condition on BCM2835_TIMER (and others)
To: Conor Dooley <conor@kernel.org>, daniel.lezcano@linaro.org,
 tglx@linutronix.de, linux-kernel@vger.kernel.org, etienne.buira@free.fr
References: <Z6C5BegftEGzwkN_@Z926fQmE5jqhFMgp6>
 <Z6C6FQxsyX_D4jhY@Z926fQmE5jqhFMgp6>
 <20250204-papaya-grudge-2b7dd5c73917@spud>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20250204-papaya-grudge-2b7dd5c73917@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/4/25 15:31, Conor Dooley wrote:
> On Mon, Feb 03, 2025 at 01:44:05PM +0100, Etienne Buira wrote:
>> Resend with corrected email address.
>>
>> On Mon, Feb 03, 2025 at 01:39:33PM +0100, Etienne Buira wrote:
>>> Hi all,
>>>
>>> I want to build a kernel for Raspberry pi 4B, which, according to the
>>> dtb, has a bc2835-system-timer. This device is handled by
>>> drivers/clocksource/bcm2835_timer.c, which is built depending on
>>> CONFIG_BCM2835_TIMER.
>>>
>>> However, the config option is guarded by "if COMPILE_TEST" condition.
>>>
>>> Shouldn't that condition be ARM64 || COMPILE_TEST (ie be selectable on
>>> arm64 builds)?
> 
> Perhaps, but I'd wonder why arm64 and arm32 are being treated differently.
> Florian, why's there no select on arm64 when the BCM2835 family option
> is enabled?

The Raspberry Pi 4B (Cortex-A72 CPU) primarily makes use of the ARM CPU 
local timer under drivers/clocksource/arm_arch_timer.c, therefore using 
bcm2835_timer.c is not necessary at all as a functional boot requirement.

There is no harm in enabling bcm2835_timer, and the arch_arm_timer.c 
rating being greater (400) than the bcm2835_timer (300), you will get 
the former to be selected anyway.

Feel free to submit a patch to enable the driver for ARM64.
-- 
Florian
