Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDE421E0B7
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 21:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750369881; cv=none; b=n9eO0ANGV46ysimU7JKr1i6j01jRNtPgvRbbXIWAu1JWGIc1JWDFHvDXBZyrWdusY0GPT7G/D9RSqo8bdSq0DaciaBTerFj4cjnNv/brLXNTBHImkyPIKlcRpu1TFs/eeKuWCrtjCGAL6fwoysqOZKV/S/oQ8mjzzmWGEpp0oUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750369881; c=relaxed/simple;
	bh=6b4xdbHAEobeRhtMS7us5of5Xvlx0zvK/T5YXduUbFw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Uwsi/SbJhRCNpMIkuZ46BfyVuSpPVhkVPZt6i6qOlbtDayRoJySpNfsUrp2tVWmcirVN2M8N4g1wEKf4GWtemHTK0OedKMuGGtcRSHd7sf/1u0vNsr8PV8X69EUARhVpt8R3nGo8/JQdikXVEBQAABE6vgHwt0JWeJTgJEKsdLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=d1Wq9FaL; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="d1Wq9FaL"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-235f9ea8d08so10583305ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1750369879; x=1750974679; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QNrd+Ka91X9vzoKAkMJyDjy2RBoEtHPH04v+UX5wZMw=;
        b=d1Wq9FaLII+vaeA0Xit/A9GE3gSxdAS4R2xRlQOJWLte3rSN2shVYJDS/vVKWjQifE
         dtWEQgMbNvJU6ZBWMMhwI84X4tNO2C1hM8EES4vWEErqoLg+sXoWOH0EJGLAmZVAMC/j
         btge3VcybjeoCoGoTldrOdnkjheecMwg+cAl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750369879; x=1750974679;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QNrd+Ka91X9vzoKAkMJyDjy2RBoEtHPH04v+UX5wZMw=;
        b=AXFQ9VqM8HfFZlHeEfloes2dWHUIBj1jC68d2N99Fu068LfHzFIUf7/axjLEG6oAMX
         7UzBqiKBOMgEB7pliQ+4RocXqAMkYlgKczoMAYL8t61YLZ+uGARxgkwojmilYozF2Cef
         L/P9jlPbVYl63p24cX1jpgVGSyIcl4PGgh/goRf4xofXudVMRsgEQkEKFumt3IM6gsoK
         /lxNcC20E0beGa/7vRrdkY640pNYn5HEQvsI06Nb9eCNr3tViVoZbtTZZADnXbeWssDg
         62W7oCnbONF3M+ud/ZG3NA5hojsx4pBVuQOpx8cPkhCoXuDx4Y2IMpggGmWUXLsYbArA
         QDqA==
X-Forwarded-Encrypted: i=1; AJvYcCUCh2+T4nLl07o6vfBghAC8BQ/cKi/+fgy/arnz86W46cbyDaAiS07Jji0TlPhzbhS04z5pw6XOuGmz/Ks=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0nnWsaPa0UoLUvCenGJXzys1H5VrlC7kb/ypJKrzI+rt98C4S
	O5m1i75UPOaotmjyulZ1kkZ09HM4+RC3/H8MnnfkvusTEwu/basVPJcY/TorXI0nZQ==
X-Gm-Gg: ASbGncsa51sCnk+EWxAczKLHU15T8wH4ydDhfnqmU8HWztMHRh2EdkDa8mU0eE8/b6I
	mV5T3Gm0V8j7WN89bslJHTyy1b9zNC6s6wC/acuwnKri6iCvfFX+G8z3nN5WUOglWaXiHPusNDJ
	yfDZuprSjSV3D2f7a7nft1XKZhHOI/tBxcUWTe9WN8diNB8yS/EIN7S8WhL/4tIfJMR/VKVT90f
	/ByWuirOchMYTCf26iJxfyjeAlVDLXLoBZ5RVDB53MmS+6bZAlvYwT3RNrGgnkx1zOl5nWM1LSS
	gNW2XCwEOCW4o4OcnMNVJnTVbFHlp4DMLeF1BN0fZ73vHdzrjVYetzSGkK6xXMU0fU6F05RRJQV
	YhkqLGYBImMuwet3plLHRFzBvLufhO2Kad/Uo
X-Google-Smtp-Source: AGHT+IFyEOg5XEeQ+aTcGDmVsuLniEdzYWdJFqg7fVC3s9zi7nKYJdY+MpYwPbLSToYsK7tOebVQrA==
X-Received: by 2002:a17:902:f790:b0:234:a44c:18d with SMTP id d9443c01a7336-237d97b4515mr5569825ad.22.1750369879517;
        Thu, 19 Jun 2025 14:51:19 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d87391e5sm2605945ad.244.2025.06.19.14.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 14:51:18 -0700 (PDT)
Message-ID: <7ab95eac-47c0-437b-aa45-5b2871c31a8d@broadcom.com>
Date: Thu, 19 Jun 2025 14:51:16 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] scripts/gdb: fix parsing of MNT_* constants
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: Stephen Brennan <stephen.s.brennan@oracle.com>,
 Tony Ambardar <tony.ambardar@gmail.com>, linux-kernel@vger.kernel.org,
 linux-debuggers@vger.kernel.org
Cc: Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham
 <kbingham@kernel.org>, Christian Brauner <brauner@kernel.org>
References: <20250601055027.3661480-1-tony.ambardar@gmail.com>
 <7984ea38-20cc-49ad-ad72-c6433ad64698@oracle.com>
 <6388ccbc-3189-46ad-a146-b6b732417a09@broadcom.com>
Content-Language: en-US
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
In-Reply-To: <6388ccbc-3189-46ad-a146-b6b732417a09@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/3/25 09:17, Florian Fainelli wrote:
> On 6/2/25 21:42, Stephen Brennan wrote:
>> On 5/31/25 22:50, Tony Ambardar wrote:
>>> Recently, constants in linux/mount.h were changed from integer macros
>>> parsable by LX_VALUE() to enums which are not, thus breaking gdb python
>>> scripts:
>>>
>>>    Reading symbols from vmlinux...
>>>    Traceback (most recent call last):
>>>      File ".../linux/vmlinux-gdb.py", line 25, in <module>
>>>        import linux.constants
>>>      File ".../linux/scripts/gdb/linux/constants.py", line 19, in 
>>> <module>
>>>        LX_MNT_NOSUID = MNT_NOSUID
>>>    NameError: name 'MNT_NOSUID' is not defined
>>>
>>> Update to parse with LX_GDBPARSED(), which correctly handles enums.
>>>
>>> Fixes: 101f2bbab541 ("fs: convert mount flags to enum")
>>> Signed-off-by: Tony Ambardar <tony.ambardar@gmail.com>
>>
>> Hi Tony,
>>
>> I was totally unaware that these constants were being consumed by
>> another debugger, and having fixed them for one, I broke them for 
>> another!
>>
>> Thanks for the fix. Having read through the preprocessor magic and this
>> change, they make sense to me. In the future, I'll be sure to make an
>> extra check for GDB users when updating enums.
>>
>> Reviewed-by: Stephen Brennan <stephen.s.brennan@oracle.com>
> 
> Not targeted to anyone in particular but this is a recurring problem, 
> the GDB scripts are typically not part of any CI and it is not natural 
> to grep for constant names outside of the C/Rust code where they are 
> being used...
> 
> I suppose that QEMU it should be much easier to ensure that GDB scripts 
> are being exercised than with my current set-up using OpenOCD + real 
> hardware...

And also:

Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>

Jan, Kieran, can you please pick this up? Thanks!
-- 
Florian
