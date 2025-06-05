Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A891EEE6
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 03:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749092793; cv=none; b=E3VMJfXDwUo1d+Esux96HsP1f8yOIXGATvT6AiyoIsYDYciMD9pPxG1fT4FDUs/kVYHgd9YvRqSnD4feZ5wbEYeGrHNUYzV7nRzXHK6rr67hU8XxmYC99Toaztsd/sRHoAnjUnA7kExmeBGu3LhrpJ5eCk0WFUUtDytZ415yWZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749092793; c=relaxed/simple;
	bh=6xLpQ1uPabtcvEaePNBumHI9UNO8HDT0/WVmswtOEYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PyLBUAwtXcSg6XciteSv6BM1v6Xmh1LEaPdXsgsIl4MjK3smNCnwQ/r7TlqC2zylH+OZnAq3lB42zQ9h4NUjqLP1QQRIb3YLCBNUCdvbdNYcFOMXnjPlDm05KYVPw2cNPnbS8z7BtkWceYKjkfJzWqw3LZFU6k8XrnIQnFs1ixM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=DgH77atg; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="DgH77atg"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso511329b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 20:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749092791; x=1749697591; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RNIb5B5OWKY6J+fGD7YOdqSlG5iyfCDJMt1mUybY76E=;
        b=DgH77atgE+IS8xA8R8w0M4pOt76ySydwzwV+mQZix9dS3721L00B0tM5JvQFh/kgCE
         ddLiAxGYhjbmsEFYiu2yVhCnUiffn/cCuxKAZcxMe7++45Kkh8kdBVo5wW0t+DaVCsaI
         m31udxzSrIHmY93tnwoohNS6vONoLRXfhIE7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749092791; x=1749697591;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RNIb5B5OWKY6J+fGD7YOdqSlG5iyfCDJMt1mUybY76E=;
        b=IZRkJmsuaTBk78pHCYqcyYrTKhTCC/nfxxC9OOx9ee03+GHhE0zBzU7mICH8neoTf3
         Y/vg32or/3kSK2g/aa+WCdgWY48dLgloQBdJUJFdrXaW11djCLpQKJO8PYytel6PqMyB
         kudp08pASvyxgI+1GDV8o0ZY1CCdgj/aHCOetj0vpfVVc/OUoSzVCLZ/fTAie0maHoaq
         k3kb6YwJL/65Udu1XG0n6lzGo6jtkoCWynzQaAxVMIkVmCTqkb52ivuMwkQZT3cikhVw
         AQd9JcpjGP1mhMNwRXm12ml1WWzPbDqaO2tehf08XagofaSNCYA1xXJNHVgap9Xt822P
         kbaw==
X-Gm-Message-State: AOJu0YzjHcpIWfBLTlPaIuIrXZ98ArDunt+NhqsD1nWmN6qj/I4rTNg2
	ZL3FALYJQpPiA+PzGUQ3SckU5J2Ji4d8H4pI0I55UN3gu3+tkATuaKDvBtqLT3NOWQ==
X-Gm-Gg: ASbGncvK84uLpFO07j0poZ9x1u6u6MGtn5d5sNMTJyetq9ac11c/BWd62LCyN6Yh9vu
	ROr8XPlxt/j0gleGre4AW0vz+VLg0ggMn3OuXYeeNcDn12jHAFxiaebqfiktZd6yzyUoijV5SXH
	Y9v7t5YNCd8pAwjMhGwDmg/2jfR6P4FX5Y7XHa6JZs3qlmiNDmf2d8jbb/Yl5y90KWhZs10iVy0
	dTgL+5dQP2ZjXxyFg62XwglLxnC65lbuqOxlglNK5wJdPJAP2dRevJo9Rrj5kTUaJYLodKIyA5i
	4FIqY5gfdBn00hrAra8D8JFUVkTLGhpbS6KPkTPyKI2ktDo86uGyvHwZU+uGzs0maldu8gDVmhQ
	B8DE+GZow/N7J7acOqLu4vrhDC7G7uTrOOHaHNUI=
X-Google-Smtp-Source: AGHT+IGMnX4zws8gKZFPO4rQT0n1uYIntjxU2j13B0jQsCtm8WDYGUxXPGMhai8kKRNGMey0Qi1mpg==
X-Received: by 2002:a05:6a00:4fd0:b0:736:3979:369e with SMTP id d2e1a72fcca58-7480b23acbcmr6964052b3a.9.1749092791100;
        Wed, 04 Jun 2025 20:06:31 -0700 (PDT)
Received: from [10.230.4.135] ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affafa42sm12225633b3a.92.2025.06.04.20.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 20:06:30 -0700 (PDT)
Message-ID: <6e88587d-f426-4841-b370-b46917822212@broadcom.com>
Date: Wed, 4 Jun 2025 20:06:28 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Jun 3 (clk/clk-rp1.c)
To: Randy Dunlap <rdunlap@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrea della Porta <andrea.porta@suse.com>, linux-clk@vger.kernel.org
References: <20250603170058.5e1e1058@canb.auug.org.au>
 <cee929b0-8b09-4e6b-95c1-c4067a8c389d@infradead.org>
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
In-Reply-To: <cee929b0-8b09-4e6b-95c1-c4067a8c389d@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/3/2025 10:01 AM, Randy Dunlap wrote:
> 
> 
> On 6/3/25 12:00 AM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Please do not add any material destined for v6.17 to you rlinux-next
>> included branches until after v6.16-rc1 has been released.
>>
>> Changes since 20250530:
>>
> 
> on i386:
> 
> ld: drivers/clk/clk-rp1.o: in function `rp1_pll_divider_set_rate':
> clk-rp1.c:(.text+0xba1): undefined reference to `__udivdi3'
> 
> caused by
> 	/* must sleep 10 pll vco cycles */
> 	ndelay(10ULL * div * NSEC_PER_SEC / parent_rate);
> 
> 

Andrea, do you mind fixing this build error for a 32-bit kernel? Thanks!
-- 
Florian

