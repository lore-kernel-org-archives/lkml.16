Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C590333991
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 21:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750886274; cv=none; b=c+A9CC6U4CZOU4ibevdErgUYoxkapWqZlNPUjNQdf32bv8hV5vYATvWUCR+8OnJrmzrrUFnCUHdgFMSFFMqNS4njgRgHsasp7zHCnb+IvHJ8YuR5wGvFq+EmO+0KVE4L9tgdK379lylIhnflCuw39dioK3xO4yjh5izUrqJP900=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750886274; c=relaxed/simple;
	bh=qDGZT8OE98rpD9MwP0jxqulQY3A1Axb9bv/Yqc2Kuy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d3LkhiZP28jxdai9NvzoCqMFEcOBuxAZKnDZNEIIM/5fKobagdTM00hcSEjT5uO2XnplgKhLAlCn9xX8dviuwNNk3QRTrD/RGsgt9zABj0aRI9p6tXBCfHMrT7icCdY9sMCFd5kOKif7ozaH31AS6eOlOM7AiJcts8UkASQevsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=M7yhNSTM; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="M7yhNSTM"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b31d578e774so1391346a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1750886272; x=1751491072; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WFVPpf8gZvRIGpJAETmCkjLw4nhAyHhpJxBWsqFkq9M=;
        b=M7yhNSTM9Mg728Ce9OebXDJeUHfWljK0UPABB4IJO7v0HC0FjWr9yaDW9r1Do+4TSo
         KSz8i5pNBU7HWzyPN6jYFbg9Bu5KtGxrmFcvnBkcGRrUvxXk9TMZQcAOVmwC/Yy/QHQY
         G2mxqX9JkV0X7P8wFfbW0Tj6YTHkqypcZyQFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750886272; x=1751491072;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFVPpf8gZvRIGpJAETmCkjLw4nhAyHhpJxBWsqFkq9M=;
        b=tft7Xc4Fk7AAhxU3v7iNlByDuIM261uyNVjBGS6tAggfsT7PZM4SmLiEtBz4P3wq/C
         s3ZmjhqalO5CuTH+3+v8Yc2Pputziwy+Ys19IntsatQsE9vLuk9VxbJW2ZJVPRWHCUdy
         bszvqca6nRL7IEsh+XfVG1O2ysoDeITSZNnethZaKuDHXyGCKpJLXz1fhrUeWvJl6Avv
         W1vMIFtOTf9ByYICeAvzoBXDUKztCe8jMeMHOlGoYqUHP5mOuV1dx+Mdmtj7dBqGPAX1
         VDBfyO/B5oacX5W32TQClHoGDmxBoWuwbWGJ7n6uIdh6f5PmbX2ZUiZBGUtXYvOftZhq
         Jq+g==
X-Gm-Message-State: AOJu0YygFBMLrAP7QNVBkGiwo5pIqQNe+l4jxR9ZHvfyfc6q653dK+SV
	5fGnYIlvFuzjgxMtubErMrEvt7QSKL4g10PNpsMBZnPBXywudvmD907pdlPPLp48WA==
X-Gm-Gg: ASbGncsDNTErIv+b2AUdoqY7XWhyJwG+vWlLQShfxQR6OnM7bIGWOkpVndOVTDSSU24
	kwOcnku5lQC1ffhggAF8n1IuuCsJ4c/rQ8aMlr2wJZ2v13IisGpuIiWNk+Ho3A2j2JRR+d2p17R
	KsZQdKv8/XfrDf6QQ1T+TzK7Usl2kKZ+yyrhw2Sz3TxHLsUNmnHmBXT9oeh6mqGgNv/hkSjfBmk
	fXLGSSLgaqOP/wn1zIky5b6bdn7jGzsrxYFSKt9woDixCnmOSElSC44RG0c0xI69UQ7Htt4x0JA
	FLP8wb8ZxdMzvXgGBL0x52/adHBhttz/bO0sQrC2qxm3+YgQBliPet6+FRsH8L3/sjaB9rVYrl1
	IHwDIBX26BLw/Nk1w8FAxmSxo5g==
X-Google-Smtp-Source: AGHT+IEUJ6VKtxv7GxdI7KHAcgPDMchGAki0h3lw03YkzYKk7dn/ulhQJ1QxVi7yAcqXag7QtQtTkA==
X-Received: by 2002:a17:90b:53c3:b0:314:2cd2:595d with SMTP id 98e67ed59e1d1-316d69d00damr1657436a91.8.1750886272038;
        Wed, 25 Jun 2025 14:17:52 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f5386edbsm2775251a91.6.2025.06.25.14.17.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 14:17:51 -0700 (PDT)
Message-ID: <1efcc990-957f-4b33-9fe8-59cb2c36fed4@broadcom.com>
Date: Wed, 25 Jun 2025 14:17:50 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Associate GDB scripts with their subsystems
To: Andrew Morton <akpm@linux-foundation.org>,
 Jan Kiszka <jan.kiszka@siemens.com>
Cc: linux-kernel@vger.kernel.org, kbingham@kernel.org
References: <20250625175239.1099848-1-florian.fainelli@broadcom.com>
 <f9ac32eb-f052-417b-859d-1c8ede2d8daf@siemens.com>
 <20250625132228.b072618317afd2fbaaa3aaef@linux-foundation.org>
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
In-Reply-To: <20250625132228.b072618317afd2fbaaa3aaef@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/25/25 13:22, Andrew Morton wrote:
> On Wed, 25 Jun 2025 21:38:20 +0200 Jan Kiszka <jan.kiszka@siemens.com> wrote:
> 
>> On 25.06.25 19:52, Florian Fainelli wrote:
>>> The GDB scripts under scripts/gdb/linux are very useful for inspecting
>>> kernel data structures however they depend upon the internal APIs and
>>> data structures which are updated without much consideration for those
>>> scripts. This results in a near constant catching up with fixing the
>>> scripts so they continue to work.
>>>
>>> Associate the GDB scripts with their subsystems in the hope that they
>>> get more love and attention.
>>>
>>
>> ...
>>
>> I will surely support any proposal that helps connecting the scripts
>> with subsystems they address. However, you should likely break up this
>> one here into per-subsystem patches and address each affected
>> maintainer. They should have a chance to accept or reject this potential
>> extension of their responsibility.
> 
> I agree - this proposal doesn't seem very practical, really.

Yes, that's a good point it should be on a per-subsystem basis to decide 
whether they are willing to take on the maintenance, if nothing else the 
reporting.

> 
> It might actually be harmful - if someone has an issue with a gdb script
> they'll report that to the subsystem maintainer rather than to the GDB
> script maintainers who are better equipped to address the issue.

If they run scripts/get_maintainer.pl they will get both subsystems to 
be listed as recipients to reach out to, so that should help cross 
pollinate and ease the pain of fixing.

> 
> And I'm not sure there's really a problem to fix here.  I'm seeing 13
> commits to scripts/gdb this year and afaict only one (e0349c46cb4f
> ("scripts/gdb/linux/symbols.py: address changes to module_sect_attrs"))
> looks like it is fixing up such a problem.

There are a few more that result from breakage that could have been avoided:

https://lore.kernel.org/all/20250601055027.3661480-1-tony.ambardar@gmail.com/

https://lore.kernel.org/all/20250619225105.320729-1-florian.fainelli@broadcom.com/

and the recent ones for interrupts.py.
-- 
Florian
