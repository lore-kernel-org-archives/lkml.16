Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363863074BD
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750816906; cv=none; b=RWm29ylmmax0Os2ixL6XWdgcdAn2JXJyU62QYuJmCpUmKQHqv0weA7Uif+Fbu78p094/DKd0iXz5g64k027VmRUvZs/xrWwY0DymeONgznUMQqBxOZMCTURGoLnnVsq1JG/gRtuBOYxAE2CHPjRyFDvF6FOBY518hhcTgBCF7BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750816906; c=relaxed/simple;
	bh=0lcxKrsthp+zmul/lcrh8D9EmtsNWzHRP0j1JAVfc7A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PBqaW1Fg3bue27luTa9TV+cDuAOH6K/c073EG4QYCFkC8IIy+eI4s65Jad7XC0eRDjouE0BjHrwD7L0LB9T0Y8zpUYaNV3JSlL12z5rgURHTEhV2si9k2hcE2ZmDzWrn3+lqHbNKdHY01PFmBgz/OwqSMWMILAC7Gkg+z6F0ddw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=KJ9XH040; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="KJ9XH040"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-af6a315b491so5320947a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1750816904; x=1751421704; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yTuS9wGfxBhv+F7YWQ45ECcT+IUpvHY7G7RB7jvcKms=;
        b=KJ9XH040gXtRLiniTSguRWK4bG3ovxXUVgwcb6Cyb/2mQfPBiUrzPdynF+WGFawFON
         cIvUrL6Lg/mu9eU3FLDyd7SJ38pAMPgDT1dF1HAwniMREJB74ndA4c4jyrWFBxaHXzzs
         tlLR1lMB6zB1qpJRjV7D/hU2+i9TZaodcLAqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750816904; x=1751421704;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTuS9wGfxBhv+F7YWQ45ECcT+IUpvHY7G7RB7jvcKms=;
        b=or9MqoYU7zf3Fq9CWqe2LppzNh2pXYBNAGFHRdsZFKlVd8E0amuvRQYcrBjuNVtH4F
         sh08z3TZS32neq9qtV8mZtovaPdKqBHdjV6euZclVb+cNU33oe2bJo9aKz99dwvVRuwj
         8EB/UR4tiq5tY72EUcXo+w4a9E2bvQMa8TZqSZu+o078fCET2znDY5DcnFELLiBnOnem
         rULQ+b1ra4Xi7vPz6uSh7Bj2+fVsSIiQPsmRUpLDDDLFP01NsOuW2Notgjl9mUg/kLPx
         muOH4+aFRj5t8ju3lDQeKwEYTwkBd+OpuqI4eZ8F2FWJcwWHsC3goNeVgQs7QjBZSg2P
         EoTA==
X-Gm-Message-State: AOJu0YzkzkeZ8GVSEhLEYeCwY8i0Ttn19CbZ/w6HrAtwGQgHSsA7CPWr
	pRYuUmtz6mDAOf0Nxt3bPMq9mfx8GOE8wHoxuSwovzbhDKKn0HCpTA2OXYL7hrb7Tw==
X-Gm-Gg: ASbGncuGi/RvXzYLOFI2wwKV94wmSC/NJSPMzGltkuff1k8r6POrLuPR1EaO9WsutXv
	MfJPDHitx3hoO1nBLjU1Nz+andq16LVeeXYB8oGAJS9J611+4B8KU1Qpyplx6FOXBAv96N6b6Rk
	apumMqnQ9UR2fkkyJCFSbbwKX/OWlkmkkuY0ebn3YSFttqVgQq+aimz52vyxN90mmGTlsBw5Ygj
	hSs2Dr++MqeemooAuD/gvbs7/Rgk983hsGVG7pOdCIgbmvIzIbtgJRctR/c0hAqLJwP4oyYp9et
	F9MFMKhXBvoGDPM4DO+NP2BmqOWVnQ/N1Ftk7PsbDw9+oV2hIWWH6cPbeM0aCyWYviuE/IqbCO4
	43azZu29V+YLQu4rgIQ==
X-Google-Smtp-Source: AGHT+IEHYcDaY2a1+zp0ymIh+2AkxL1xSpmk0Ub08Hm9wNUWOvuECeHluh9kQgQNmwW4Bp+vF4nYnA==
X-Received: by 2002:a17:903:4b27:b0:234:d679:72e9 with SMTP id d9443c01a7336-23823fcc7b9mr27649335ad.12.1750816904394;
        Tue, 24 Jun 2025 19:01:44 -0700 (PDT)
Received: from [10.230.3.249] ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86f701csm118659285ad.217.2025.06.24.19.01.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 19:01:43 -0700 (PDT)
Message-ID: <b58954c7-cbc0-4971-81c8-8c40c1bb1f53@broadcom.com>
Date: Tue, 24 Jun 2025 19:01:42 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] scripts/gdb: Fix interrupts.py after maple tree
 conversion
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Jan Kiszka <jan.kiszka@siemens.com>,
 Kieran Bingham <kbingham@kernel.org>, Tony Ambardar
 <tony.ambardar@gmail.com>, Stephen Brennan <stephen.s.brennan@oracle.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>,
 Thomas Gleixner <tglx@linutronix.de>
References: <20250624032751.1094840-1-florian.fainelli@broadcom.com>
 <20250624165000.ecf2a00a55fd267befa6fdb4@linux-foundation.org>
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
In-Reply-To: <20250624165000.ecf2a00a55fd267befa6fdb4@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/24/2025 4:50 PM, Andrew Morton wrote:
> On Mon, 23 Jun 2025 20:27:45 -0700 Florian Fainelli <florian.fainelli@broadcom.com> wrote:
> 
>> In commit 721255b9826b ("genirq: Use a maple tree for interrupt
>> descriptor management"), the irq_desc_tree was replaced with a
>> sparse_irqs tree using a maple tree structure.
>>
>> A new module (mapletree.py) is added whose mtree_load() implementation
>> is largely copied after the C version and uses the same variable and
>> intermediate function names wherever possible to ensure that both the C
>> and Python version be updated in the future.
> 
> butbutbut.  What is actually being "fixed" here?  The above contains no
> description of any problem.

OK, I also thought this was clear enough that the script stopped working 
and printed nothing, but does not hurt to state that clearly. v3 coming 
up shortly, thanks!
-- 
Florian

