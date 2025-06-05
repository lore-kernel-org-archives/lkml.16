Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CA819DF8D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 18:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749146482; cv=none; b=H2sNqtq1Jh15z5LT8dx8E45FYAwne560cPndT9VcFW397Bn0MRRUBAMakDDcN/6vlSR2SDTFD2DroaSC5C5j8U2LI51PIL+EOAmCFeD5Ibo+ijMUDemQdyrm4AIPF75eQcbFupU2+RN9tMqSdgH5HoIwUFxH47Vu1fQlLKqKX8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749146482; c=relaxed/simple;
	bh=00ADutK96bxwGfyS5M6hx9WvTZ3iqeBpVVTLdaTzNk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hf5gv/4HO+N/Bis39rlcki0RUEle8ay917zK1hglz0xE0jrQxoy69zVHGxRHX05CPJp4RkMnrQoSMCucmGmjnz4lheAQJq10S2lbE4pkOqx0zu04RHyqz0lOJCQiaf8KVxZG74/gb/8sid9H1wir3Ai5Ss1eL83G6P+o7DK26Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=BQ6JcbUm; arc=none smtp.client-ip=209.85.215.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="BQ6JcbUm"
Received: by mail-pg1-f196.google.com with SMTP id 41be03b00d2f7-b26f01c638fso1252014a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 11:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749146480; x=1749751280; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rpB5wasguuImgeTGFD/cWO3i5SppuKFq1SGO0AIvXOw=;
        b=BQ6JcbUmyzd+MHYOOHhlzWjftcqQ9Ysy7DsISDMrYrX+3948DIQeLcfH0Bvb+aSWqM
         Of0y6uH1MiKNN1vakby+5PSKTm1HJidW7LMuV1TWPVt1ngkpYEDzyUkSWTj/G7rE/rln
         d3N5FkmE42pa79dmFueFEx5TLbdG7YRXtQ7Io=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749146480; x=1749751280;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rpB5wasguuImgeTGFD/cWO3i5SppuKFq1SGO0AIvXOw=;
        b=C86J2KY0E5tWT1TRuXZNSqxEJtcSj0CtPMJyxh9wgVmM2jHnOum4q8WF1TFzs71vp2
         1YICCYzORywnQV9QaMP+JAQkqGk8HKT25v++sDpYCnH6a+lGiS7hDU7bmD0/0sq+CoIC
         9DHAxFx+iYKAjb9aO4sbCcgjHqoqNJfIqLv4Sqq6Z7Evvt/EXMI1+dTXQQZTemLxtson
         esXt0cP8S//XI8gV6fN6bswHM5MhoRJXdLWQy9fH6TofXdjKeEG4oYpLkSk3Tsck2oA/
         kbJVHJ1LwThGEMbt2B1DgtbwUEA1r5Sf+gAl254UTncc1mX+P4edMdrGXt63V6B/+IKf
         wJew==
X-Forwarded-Encrypted: i=1; AJvYcCW8+ZbiMneWzIowvmzO2aqdjDtQCeOTJAsNv149aF2+XrFu34D/YdxNL+rKcTVDljPjJaww5SX+iIc5Qd8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvzEeQn6iY7PauziZNfg112pceE82f0RStJ7EwSVOoT4YlFdms
	wzT8WRoKMrZSV1LWmO1yUEhKEzhbsdlnV+Bsm0bVbV/PD7xba24nm/RZp0iyQaa/NA==
X-Gm-Gg: ASbGncuL/c0IDQv/WeUdzCUILhEEI9xBH/dXV1P5KB/t1KWWSHdTKoY/DpAFL+Lwsb3
	zmFs7OHosNWVi12au5QPSp1Lv8hKlbAqfT368XIRFMTywXwSoFmfqiYBEXFo/+SugLnNL05MK+T
	73hf9osT4SSy1MuxDG3pVcGgNtx5VAkNG7CcNJUcqdqCumWJxrpCfgs7KVJzCa1vsXf0smiIknq
	jkXeJRuLEYg6GK6b7LmZGw+XWVUztUolb85uhzrN562KVK1S7hw3IW1GnA0DH5gyGRoGj7pimc5
	Yv6TLTsn9aYtczhOFJ+2ALspsExTj3OCHGY8udBARSQmPeyrTV64IOVjcACG8VnsUnwoO8ErpMA
	WVWZxRYDE+x1ezf8/7lxcn9Vtbg==
X-Google-Smtp-Source: AGHT+IGcKK2A7Yyzcw1LOkqlne560xOZZn/gjPOwEp7xVZDfd0tdLtjD0lawGCLixJ2JfDEY1S5YZw==
X-Received: by 2002:a17:90b:540f:b0:312:e731:5a66 with SMTP id 98e67ed59e1d1-313472d087amr855437a91.3.1749146479798;
        Thu, 05 Jun 2025 11:01:19 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349fdf5adsm31864a91.34.2025.06.05.11.01.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 11:01:18 -0700 (PDT)
Message-ID: <ae51482c-1bd3-4e2e-a02f-d5ddda55f0d2@broadcom.com>
Date: Thu, 5 Jun 2025 11:01:17 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 5/5] net: dsa: b53: do not touch DLL_IQQD on
 bcm53115
To: Paolo Abeni <pabeni@redhat.com>, Jonas Gorski <jonas.gorski@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Vivien Didelot <vivien.didelot@gmail.com>,
 =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250602193953.1010487-1-jonas.gorski@gmail.com>
 <20250602193953.1010487-6-jonas.gorski@gmail.com>
 <c1c3b951-19b8-462a-9dee-a1b893251d6f@broadcom.com>
 <CAOiHx=n6Mc+nM2QOa8okQbFcj9UHgfMbKKcNXG6D-VJjELHrsw@mail.gmail.com>
 <ead87a84-5a44-4c21-91bb-9086ba1fbcc3@redhat.com>
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
In-Reply-To: <ead87a84-5a44-4c21-91bb-9086ba1fbcc3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/5/25 02:06, Paolo Abeni wrote:
> On 6/3/25 8:15 AM, Jonas Gorski wrote:
>> On Mon, Jun 2, 2025 at 11:40 PM Florian Fainelli
>> <florian.fainelli@broadcom.com> wrote:
>>> On 6/2/25 12:39, Jonas Gorski wrote:
>>>> According to OpenMDK, bit 2 of the RGMII register has a different
>>>> meaning for BCM53115 [1]:
>>>>
>>>> "DLL_IQQD         1: In the IDDQ mode, power is down0: Normal function
>>>>                     mode"
>>>>
>>>> Configuring RGMII delay works without setting this bit, so let's keep it
>>>> at the default. For other chips, we always set it, so not clearing it
>>>> is not an issue.
>>>>
>>>> One would assume BCM53118 works the same, but OpenMDK is not quite sure
>>>> what this bit actually means [2]:
>>>>
>>>> "BYPASS_IMP_2NS_DEL #1: In the IDDQ mode, power is down#0: Normal
>>>>                       function mode1: Bypass dll65_2ns_del IP0: Use
>>>>                       dll65_2ns_del IP"
>>>>
>>>> So lets keep setting it for now.
>>>>
>>>> [1] https://github.com/Broadcom-Network-Switching-Software/OpenMDK/blob/master/cdk/PKG/chip/bcm53115/bcm53115_a0_defs.h#L19871
>>>> [2] https://github.com/Broadcom-Network-Switching-Software/OpenMDK/blob/master/cdk/PKG/chip/bcm53118/bcm53118_a0_defs.h#L14392
>>>>
>>>> Fixes: 967dd82ffc52 ("net: dsa: b53: Add support for Broadcom RoboSwitch")
>>>> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
>>>> ---
>>>> v1 -> v2:
>>>> * new patch
>>>>
>>>>    drivers/net/dsa/b53/b53_common.c | 8 +++++---
>>>>    1 file changed, 5 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
>>>> index be4493b769f4..862bdccb7439 100644
>>>> --- a/drivers/net/dsa/b53/b53_common.c
>>>> +++ b/drivers/net/dsa/b53/b53_common.c
>>>> @@ -1354,8 +1354,7 @@ static void b53_adjust_531x5_rgmii(struct dsa_switch *ds, int port,
>>>>         * tx_clk aligned timing (restoring to reset defaults)
>>>>         */
>>>>        b53_read8(dev, B53_CTRL_PAGE, off, &rgmii_ctrl);
>>>> -     rgmii_ctrl &= ~(RGMII_CTRL_DLL_RXC | RGMII_CTRL_DLL_TXC |
>>>> -                     RGMII_CTRL_TIMING_SEL);
>>>> +     rgmii_ctrl &= ~(RGMII_CTRL_DLL_RXC | RGMII_CTRL_DLL_TXC);
>>>
>>> Are not we missing a:
>>>
>>> if (dev->chip_id != BCM53115_DEVICE_ID)
>>>          rgmii_ctrl &= ~RGMII_CTRL_TIMING_SEL;
>>>
>>> here to be strictly identical before/after?
>>
>> We could add it for symmetry, but it would be purely decorational. We
>> unconditionally set this bit again later, so clearing it before has no
>> actual effect, which is why I didn't add it.
> 
> Makes sense, and the code in this patch is IMHO more readable.

Agreed, thanks for taking those patches.
-- 
Florian

