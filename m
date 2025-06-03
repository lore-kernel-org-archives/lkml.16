Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB845227E80
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 16:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748967452; cv=none; b=Ubgy+19oD1aB9PQzHIFDJs4lBkGaOWiqXknyY50Eg7enhq2LAnnzRFThPJiJ48YhjZLJ2OsdkadzlX7QzsLAGRbqUpEnzUngejNfiTSsBBmJLex2mqq2AhePkGL2mSTpmjckd7zXUswYXYAyHWiZALCgJfzQlF2paiDGwEmz3SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748967452; c=relaxed/simple;
	bh=BAvgnkzHtB2c8vpthRgNAdZhR+GYSvFqOvjqehlkatk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HP8sD6og0NMerIKRNa2qqTrpdse9GQ3SHzJIIxEqLq1rdTQyR2KPFJO5SmP8EeREuw6/W1qk+WQBVnZBUGvckHk6m2xs8PXgdftK7TIkcjwekqCuV800CeUEpz6iNZ0BeUVT2rHCy3BSVUpsst/U5nrfLaaIvqq8ltXwcd8oG/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=FJdL06Ir; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="FJdL06Ir"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b1ff9b276c2so3379061a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 09:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1748967450; x=1749572250; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1EG07NZgPsq4emiv3q3VxU5auIKs0kGPVFq8cw7gpCQ=;
        b=FJdL06IrEqaP5MhAo6FnJ/2BvQM5XovNpjkx7mFvhl0rSvhoftO2xpafhbl93zqXjk
         tUdueR2TmWaKfsWzsi3BuZuUW2YZfulmdfxfvkhlDuGd7PhTIoMwgrcmmdWOjo4JZa52
         /PZBqORK1jukbAJE15HXgc9fvWwwihzgq8QHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748967450; x=1749572250;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1EG07NZgPsq4emiv3q3VxU5auIKs0kGPVFq8cw7gpCQ=;
        b=gmiORmBFYx9yVsQQ+DgUIS+aCxjO1J1LIAjH0L+QKGQ4cVeK/Ce6/9HfMig8cvZ3pm
         +dP7bUv+cKdlSOg2FoAdqilJsHmyUbbf1fRoQzLcsfMYfX2L6TortGXjWae2Yn5d9urv
         B9JEg9dKNTDLG8oTItOAWnd5TuTCq4vtmzYNqvbJvuvaspiPGOpB0WHkTT6GG5o+EGIA
         xlOwLn/fz02V6kgTRaMZIgMCKM6svhZuvKw5b5rHyHLyv3EXRC+07/0zOZe5gOGxNd+L
         PQ4jkkVUl5/dYbW98mF2LKmNTfp7nXE2OOLDoc9xveZegj2Tm/dAIqEmsbrk5hAcqg9j
         MicQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWr4NYWZ6iKPsokya0M9hwc8lorb8SmtVwQ7F9bHHIkS4CxERJrsbH5AHZ2zP1UFjWjOuuHyB5+WkcYbE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFkPXOYtnafkCATaadAyKGSLxYhP5NSq6KiJqVFHhJzpHeIhrd
	vzQvfCVUg1r9sxHW8OMgV56aLKLnjKibEmLzdJ3y+z8ZGxC3AvMuta4TYKtsAkSeDA==
X-Gm-Gg: ASbGncvWHvNVBHr+k5oXlNpWgGUZoXDMfLsbv9iLSFR3ZiFtEly93lHcqbzHFacbCAn
	uB2FTPPCUp1dghkemtY8Z8GxlgLN7SYFkR1PRMobQa7ulaAEuUPbDfz4/eqbUYTShfIfA4B3B1t
	dNaTxupht0dsWL8BGitpm11VVwKF07ADZxfF1ZH6QWZYvPfwLRjVA/capln8+s+C+z0Na5aEEBm
	nDFfM/p092kChjkDPdvzAm8RTGbcNFLfrrKezzmnewDp8i1KdTs9NZxqFbNXops9gel44JLz3tP
	EiY3QRuc+7BKULFIz+sn2yvdUbr4AivHSgkQ92EIGWtrH839gVdfuwkHmKnBw/c8RPz89mULdjg
	raPf+EtsG+iVxDa4=
X-Google-Smtp-Source: AGHT+IHL3+MWhy3ET4amnre8H+2NPPBpTDeLRE7vqidqrMaPDjBHMQrShQau5GY/Q7/2M4T+2vCvbg==
X-Received: by 2002:a17:90b:538d:b0:312:26d9:d5b4 with SMTP id 98e67ed59e1d1-3127c718575mr22034168a91.17.1748967450061;
        Tue, 03 Jun 2025 09:17:30 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-312e72ec43asm1623165a91.0.2025.06.03.09.17.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 09:17:29 -0700 (PDT)
Message-ID: <6388ccbc-3189-46ad-a146-b6b732417a09@broadcom.com>
Date: Tue, 3 Jun 2025 09:17:27 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] scripts/gdb: fix parsing of MNT_* constants
To: Stephen Brennan <stephen.s.brennan@oracle.com>,
 Tony Ambardar <tony.ambardar@gmail.com>, linux-kernel@vger.kernel.org,
 linux-debuggers@vger.kernel.org
Cc: Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham
 <kbingham@kernel.org>, Christian Brauner <brauner@kernel.org>
References: <20250601055027.3661480-1-tony.ambardar@gmail.com>
 <7984ea38-20cc-49ad-ad72-c6433ad64698@oracle.com>
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
In-Reply-To: <7984ea38-20cc-49ad-ad72-c6433ad64698@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/2/25 21:42, Stephen Brennan wrote:
> On 5/31/25 22:50, Tony Ambardar wrote:
>> Recently, constants in linux/mount.h were changed from integer macros
>> parsable by LX_VALUE() to enums which are not, thus breaking gdb python
>> scripts:
>>
>>    Reading symbols from vmlinux...
>>    Traceback (most recent call last):
>>      File ".../linux/vmlinux-gdb.py", line 25, in <module>
>>        import linux.constants
>>      File ".../linux/scripts/gdb/linux/constants.py", line 19, in <module>
>>        LX_MNT_NOSUID = MNT_NOSUID
>>    NameError: name 'MNT_NOSUID' is not defined
>>
>> Update to parse with LX_GDBPARSED(), which correctly handles enums.
>>
>> Fixes: 101f2bbab541 ("fs: convert mount flags to enum")
>> Signed-off-by: Tony Ambardar <tony.ambardar@gmail.com>
> 
> Hi Tony,
> 
> I was totally unaware that these constants were being consumed by
> another debugger, and having fixed them for one, I broke them for another!
> 
> Thanks for the fix. Having read through the preprocessor magic and this
> change, they make sense to me. In the future, I'll be sure to make an
> extra check for GDB users when updating enums.
> 
> Reviewed-by: Stephen Brennan <stephen.s.brennan@oracle.com>

Not targeted to anyone in particular but this is a recurring problem, 
the GDB scripts are typically not part of any CI and it is not natural 
to grep for constant names outside of the C/Rust code where they are 
being used...

I suppose that QEMU it should be much easier to ensure that GDB scripts 
are being exercised than with my current set-up using OpenOCD + real 
hardware...

Thanks
-- 
Florian

