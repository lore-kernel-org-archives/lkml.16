Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436D118A959
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739208355; cv=none; b=LXUeTubfsI2FV4yMZmEUcFk6wgsNvTrAkkvJn5KI49OkQL8Mg0xN+IQTPLM8OOuoiE3LZYD/DRfBsgkkpxMADl1ZzORpDwnuVCssYevhm9ReRnvIuXm3hE8DAAKZqPQzILJgZkio4fww1qyn2Wqwe/Izx+kAjFawz1YzMTCo9o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739208355; c=relaxed/simple;
	bh=aN2EmS2Wv8dmB2jBkzZWYudZLHQwtAZEJXyPO7h3nWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QHZQrfdYqf7VwZHzs+gLYCiwmKvTm8jElYhO35pEOXHw3elGHhJhUPf5uz2JPRU+lBLHQTgCzuKeIqJw3wWOZStRYpp+oqnqZofvJk8sErlW/YokVqzqGGtV1F2yJRIqBF84arTr8I/FRBx5HEjHwhFGtGjquiGzcvgZHJIQObo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=HWm/Gck5; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="HWm/Gck5"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2b86cf023b9so504457fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 09:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1739208352; x=1739813152; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Gp8qkq7qBewVEkouEYW8313k1UZv/AD2lu2jM5fMUlA=;
        b=HWm/Gck5Xc53xEqZSDEUazR9VeaAsMeLX7xBS+TdzQDUTlvZ5kkamkGiiDipvfwYeC
         BFvbGCw6TByJKPkdZsV8fNjETfZcdlSytY8jiX4CPk5oQo3zIntFtjnyeVy+nz2K2nhq
         XtNXHutnYtCpLXA13a5DiNCemdD5BFAM4gX/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739208352; x=1739813152;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gp8qkq7qBewVEkouEYW8313k1UZv/AD2lu2jM5fMUlA=;
        b=nnzeXknVtmNfR4loo4+9Zrd7H1qK5BJwR+Oe7d/CwvYTqHtoxkLN/XvjhtmZsLcB+r
         R8V2x77g45HSZVlWmK7VezCo7CKksJPt9L0OeiEW1TWCC9nw1JFZVKXVRYZ34knrhUfd
         pWI6A+dG0W7IO1vyhcdmPuJZUvFWvljOnqEKXPkHjxy/P2A3Pm9rMGY9vZbP6apRI39U
         ecGnETZB7/oKvXsbjBUpDDazrgdOXO1xTjV/gEJJMtmYWF/qBH0zrmlFWMHTG81jcxFp
         eqY75gdziM07WhGvHsan8pEFai4S23qKk6DT7pb5KPl2+nDHtfJtkMgNXD4NBrl8tmO/
         wJ7g==
X-Forwarded-Encrypted: i=1; AJvYcCUh9ZHmjoR1pJOYtZgLVgwX+DrmQqvUKWSbNIDneHL4gAiKVEdgMpEwjt81p4AJQMdOb8Vfq3HUW3lSOXM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBPqs1fGHfI3rbqEqoupLlN5h+MjDHR3AlL6imaTPxW7XL/2uX
	TfCGK0VkwZbA3J33OVVSpbadQJT73FzeykL4EAe3ISKU0CR6Jfjt8IrbGv/jJQ==
X-Gm-Gg: ASbGncsEQhcn1GsZcX2JP9WyAaywet7IK9/YdPV47riEEjKXXEeWPlMLGCQqk0n9NRe
	q98ePDJjIrjDKJMfOKyD1oJAsRPNu9DBirUAqDMr9l5LLP6DPr8n4jlS3i28ZVwJAJhO3pBIAQk
	U0si5KZKhM6/F/ZPV4Y+YiD6qglLRfjI6wvmSs41xfQ9sUzo0F+WkuQAV7/AsgpPoCXg7Mq5aNs
	mSBiLHG3+egTCy1wFIpeTbhYsEnoClZS8gdSTSj2iNUVWDSEHiBFUOHZlgF/hzCzqrpS6kzCrz1
	orQpX7ArK3Z1zMHEdO2MkgVZIsAbVYpiuM8m9NEeaSTIvxuNl5MRuTk=
X-Google-Smtp-Source: AGHT+IHWiUmUykCGTk7iPKGcK4ZASar6+MZpVfbfNwPNMqHcf/PFjCu08mjK8u5+SpKITS4yuvQcsA==
X-Received: by 2002:a05:6870:6110:b0:278:1f2:a23f with SMTP id 586e51a60fabf-2b83ec5f203mr8337621fac.13.1739208352229;
        Mon, 10 Feb 2025 09:25:52 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b89b6dee3asm617338fac.47.2025.02.10.09.25.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 09:25:51 -0800 (PST)
Message-ID: <580cf379-40fa-416d-9823-d8b1fc8c96dd@broadcom.com>
Date: Mon, 10 Feb 2025 09:25:49 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] net: dsa: b53: Enable internal GPHY on BCM63268
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>
Cc: Kyle Hendry <kylehendrydev@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250206043055.177004-1-kylehendrydev@gmail.com>
 <1317d50b-8302-4936-b56c-7a9f5b3970b9@broadcom.com>
 <9bd9c1e4-2401-46bd-937f-996e97d750c5@lunn.ch>
 <a804e0a4-2275-41c3-be3b-7dd79c2418cd@gmail.com>
 <318e8b95-4ef8-43ca-a19d-129372a9dc48@gmail.com>
 <aa8fefa0-c5ba-4bb0-9e45-6b0ac4cfbacc@lunn.ch>
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
In-Reply-To: <aa8fefa0-c5ba-4bb0-9e45-6b0ac4cfbacc@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/9/25 15:30, Andrew Lunn wrote:
> On Fri, Feb 07, 2025 at 08:44:31AM -0800, Florian Fainelli wrote:
>> On 2/6/25 17:41, Kyle Hendry wrote:
>>>
>>> On 2025-02-06 12:17, Andrew Lunn wrote:
>>>> On Thu, Feb 06, 2025 at 10:15:50AM -0800, Florian Fainelli wrote:
>>>>> Hi Kyle,
>>>>>
>>>>> On 2/5/25 20:30, Kyle Hendry wrote:
>>>>>> Some BCM63268 bootloaders do not enable the internal PHYs by default.
>>>>>> This patch series adds functionality for the switch driver to
>>>>>> configure the gigabit ethernet PHY.
>>>>>>
>>>>>> Signed-off-by: Kyle Hendry <kylehendrydev@gmail.com>
>>>>> So the register address you are manipulating logically belongs
>>>>> in the GPIO
>>>>> block (GPIO_GPHY_CTRL) which has become quite a bit of a sundry here. I
>>>>> don't have a strong objection about the approach picked up here
>>>>> but we will
>>>>> need a Device Tree binding update describing the second (and optional)
>>>>> register range.
>>>> Despite this being internal, is this actually a GPIO? Should it be
>>>> modelled as a GPIO line connected to a reset input on the PHY? It
>>>> would then nicely fit in the existing phylib handling of a PHY with a
>>>> GPIO reset line?
>>>>
>>>>      Andrew
>>> The main reason I took this approach is because a SF2 register has
>>> similar bits and I wanted to be consistent with that driver. If it
>>> makes more sense to treat these bits as GPIOs/clocks/resets then it
>>> would make the implementation simpler.
>>
>> I don't think there is a need to go that far, and I don't think any of those
>> abstractions work really well in the sense that they are neither clocks, nor
>> resets, nor GPIOs, they are just enable bits for the power gating logic of
>> the PHY, power domains would be the closest to what this is, but this is a
>> very heavy handed approach with little benefit IMHO.
> 
> O.K. The naming is not particularly helpful. It is in the GPIO block,
> and named GPIO_GPHY_CTRL so it kind of sounds like a GPIO. If the
> existing GPIO driver could expose it as a GPIO it would of been a lot
> simpler.

You are no stranger to what HW designers like to do: use whatever 
existing hardware block already exists to add random enable and status 
bits to control whatever they fancy that was not exposed before. This 
happens whenever SW/FW people don't push back and ask for proper 
compartmentalization and abstractions to be used. Sometimes layout and 
schedule also play a role, but more often than not, it's "just software" 
so you can update to to account for the fact that bit is there, and not 
here, right?

This one is exactly what happened: there was spare room in the decoding 
address space of the register block, so it was natural from there to add 
a 32-bit word that would hold the enable bits for the internal Gigabit 
PHY... Those bits are not GPIOs, they are just simple enable/control 
bits feeding an internal signal.

> 
> If the SF2 has similar bits, could the SF2 code be shared?

The SF2 single GPHY control register is different and more standardized 
in many ways, so I don't see much value in sharing that code. The 
SWITCH_REG register block in that case does follow a consistent layout 
across different product lines.
-- 
Florian
