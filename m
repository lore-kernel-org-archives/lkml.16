Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08818227B9A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 18:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748887417; cv=none; b=FTq0KvzH45xnXRAYDY451vxUD43WznVgiP7AP5PQKTDhOgAVOtmigAyvGqGOWZm5TN67T+65AbIDU6qJsZ91kjAX5qTv7uKATUvpbaEzibW0WjWjahgsw4A5x9HPNMR3o+ExsRZaeDbN/A/BLQ1UNtrmzWmkfq4plET1v0Pd064=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748887417; c=relaxed/simple;
	bh=z8x4JgvktHGwXrQ3fRm6E8XiajVvg1rGJVxof9WSMSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=sHar5engWqMgulhJKwC3cyWDzQdNs9vP3+DRgadYcCWoViYyRgeZsORUt4CkeO2r3lsqd1iCAGsvOYmFrzhmwfj8L1gPqmkxK00Zoqeb2ac7GTv+ZYqS4BrnrMrDIqiLtL20vB4lZsQPw9RVj/SFCWKEnUQuc+MuJqZnVOl+yl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=hQ//0j1j; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="hQ//0j1j"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso4556167a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 11:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1748887415; x=1749492215; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RhJjw3HuyyrbBRBRmEXvvT/dVETZndgSlX0wKV3SUSY=;
        b=hQ//0j1jZbeoS0fN6bCbmzc8m0xvmneEZ2bpS0A6EHhUgI4dZQMtWJ7xmUrKeI1lAs
         dVl8HogOnIpQaoimyBvZfoFAGbZ6K2lEXrO52T4ZknvYLo2/8XrhqCsRZQA7FKwX/OKk
         R6JXkzi9BUjCPyLRqpAyHM/sNMk6aJsYPTXYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748887415; x=1749492215;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RhJjw3HuyyrbBRBRmEXvvT/dVETZndgSlX0wKV3SUSY=;
        b=ZR6ZjAauJbe4wpz8XCMH35QEhnAzWasBnfY7AihpJw067U06zwF3/QuBbCNkX99pgB
         WNydSKwa/7p3VIwQNMX2a7e4ehTx4oZNi2qcP1p/q3nWrObP/FemUKn8KuWG1l6+5axq
         ugxypq4Mb3HxTkZw4x2t0CZQx6lZIBU7bjLyzRASfcMuqAGrORvf+RNNbVxTJLm06IkI
         /LxxwI7fclbIjgLUmheXDO00GuJhCBQX9RDCwoZx7efkeWXVFqbpAZ4gj4y0k1sifLqk
         gYUBqVjJt313Bfcd7tzDiTrXlMkBDDgMEU5OWll49kZfeIP9BscBxRM6UudEcw5QBHja
         UkTA==
X-Forwarded-Encrypted: i=1; AJvYcCXbDzhVQ1kuYHKR4GfvSCXt+aBX8QvaGNK76BTYyJqAvvsYAPYDEI/XkEK4FDEwKYvpbC9YKhKKn+SNKVo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcFhYNYMyY9NHSaMuZmQ0Al6/xg+wYnbgYM7wDvYISpfqviXZx
	/kwy62cWtCDZ/Bok4qAhJXRvkwHDjxLRv+qL8P9yXWtSYQxt8NtBLJe0emPrL4BvWg==
X-Gm-Gg: ASbGncuRJPraS6fYC3T3ENxBcp9GUWlJw8lxUuD0Q1FUTbUZCukzYtc85+sR5CANRm/
	YWze6k0pIU1V07lYX+nx2aXzmtT2TdDlHAiA0Ud8O66ibI6QoTEs2ZokTbZVKTZ9O8OXRTP4LQn
	U8b1DyXtlypYhhES+AqyH4TX7BTobMHCS/HjCTr6vrA9n2WA8E9sMkd7gAroRyUqLEqsnS25VeC
	2JMh9pE5patOUOEJJpdEJ7EPT6jSF2GtEiuDGn+hErgIhxBRVuaSvYmZlsvV7TUgCr8AsAxHXRc
	2c2/Rjt8iYy/dvZTuatQuda0aLlXpCFF6iFiNnIvFnpUXfOr4pRqnKs6SCyaee51eefir9XH3Ei
	NEFfQXs+JI+EFZZc=
X-Google-Smtp-Source: AGHT+IEXPlfP/dgQZZojyGs2STt8sBSE5RG/QeQORDcsSnpPLdl5XYeSkD2KtLFUQ5R4Vyf7U3++7A==
X-Received: by 2002:a17:903:28c:b0:234:b743:c7a4 with SMTP id d9443c01a7336-2353963c1a6mr192182275ad.38.1748887415263;
        Mon, 02 Jun 2025 11:03:35 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bca106sm73317845ad.32.2025.06.02.11.03.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 11:03:34 -0700 (PDT)
Message-ID: <6a363ea8-e4ce-4251-8c37-711c60b9db38@broadcom.com>
Date: Mon, 2 Jun 2025 11:03:32 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 03/10] net: dsa: b53: prevent SWITCH_CTRL access on
 BCM5325
To: =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
 jonas.gorski@gmail.com, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, vivien.didelot@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dgcbueu@gmail.com
References: <20250531101308.155757-1-noltari@gmail.com>
 <20250531101308.155757-4-noltari@gmail.com>
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
In-Reply-To: <20250531101308.155757-4-noltari@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/31/25 03:13, Álvaro Fernández Rojas wrote:
> BCM5325 doesn't implement SWITCH_CTRL register so we should avoid reading
> or writing it.
> 
> Fixes: a424f0de6163 ("net: dsa: b53: Include IMP/CPU port in dumb forwarding mode")
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
