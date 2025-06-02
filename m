Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FB62EB1D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 16:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748880047; cv=none; b=N7Xy1JrEW+miXL/lJEhMue8KrOU6VVLxLFp7HxD1ESOni0llo1j/YovOabfZSy7QckxYp63fo5eBIXR2Rw/NRF4nNxHr7+plhVAExhBvziUpZv2mtbb87c43pWGzGwTlWkYAntV+9om8xSWo6KZhMjy0HMo1GE8P7+tT+6fUbRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748880047; c=relaxed/simple;
	bh=t/FJOHrpCt5cISyU55l+Sr9dZP+jc2bBFIZi/Z4+SG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DsnD27cR1uP8T87erA+yFwDBPjUqB1dRz3VDrRWfUoM0Y1/GIr/mdhCtSk5KaqGEaTXKhE5/CKzSTcMjhzlZAt57xDtRsShA9+t0H9lrWmmf8mUYycmZ5Nglk9ClOZ0rPB8Bxdv6OmlrO2jJQI1rJzcVuTpXTgYR9anzj2GDkQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=TxaYb92P; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="TxaYb92P"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2350fc2591dso30133525ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 09:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1748880045; x=1749484845; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TwkADAmdeRjZshh1FaFvp5LHi77fW7YjVJHvCxoPxkk=;
        b=TxaYb92P8x35vTppJxMiameT3yFVolxD27xvZjU8ysJn9HP2TrFB67lO27xvP3eJja
         gagRd0SNTngqAz9HawCrTMvpTnj6Pf34H28Cl2qPzlSI4877FvhupwnK4S9NHRnOUUVT
         E6rBCcwgmwvC/ve1OAQWcg/aFpx6pTxIxpAmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748880045; x=1749484845;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TwkADAmdeRjZshh1FaFvp5LHi77fW7YjVJHvCxoPxkk=;
        b=DP58jmv2TzdezNCgjrvSvC/JvGlKKLDIRaB7GTUNsyiWpKdjccOq+MRurNQ59KDnP/
         kmb0kNWQ04kxSFGeNfyeTl2qiEAXbXxODXrJzurPC1gO1ifddlEk9qGSgkV27bkqX87O
         rM/Ey9d6zi3nXIEDeL4LhudpUNEbCQje2nZAlxZUQKYoy0wRZYD/stT37VSUgEPCebqw
         aGCWSsEu79c+X6UE9PQz7hb9rxrTHMTsYSSaF9swYnC8xbg3OvAQR4dpiksxKS5zYHVy
         VopZ/oBnjoKjhqRs1Llcm81hmddE0+1l8pUPSJ78oEbbqkD1WauQ1wDQ654wRvLpJY2K
         TjzA==
X-Forwarded-Encrypted: i=1; AJvYcCXm8hYz8mmlWhhD9elLjo5f7OMTGZLILg6tkiqa4a6m2ONQKT7DI+NxcqZQD6p+bfo+kajCy8///WP/o1E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4A1egIuf6KjNxttH0F8CAUiJqYcp/VW8HVWe+T4qD4geqW4q9
	W/ArziapS9KBu7HXBPSzMuhg0DXECPZ5yOA95ZDEkCLhJjHqxoSDbaDvq5acDMdk4w==
X-Gm-Gg: ASbGncsALgDMvd1JiNrw/4F1zrMZJa90BNBpejg+zSfDfdMy0Z26GPie7Axhb+Xti9g
	yhDjARXN7WkqFox70mqWXz5XEYRYXnPdwxySlm5ZNmwJmUZ8kgGvTNcE3uQl3+Z+sx7JI1Gyt6j
	zmIEMWNA/ohz91xBMPLrqBaT+/19vquZ9iFOLuKuOiiGYZW/SihVwqRGygZatXfHP2kYy2mdXBa
	j/6k+VW0cOJNrCl5agooh+MKj5HuPTxaUrqTaJQOHpedqe18AvuYiWIjD76PNOGNAVYVQxhIMAn
	/U3vXo5W31KLYwm+r78r/HNvkaCkxIC/UVUWVUnDAucb7LKMUhxLi7z5oPm0f52rIaolAJi2tnF
	dhizOkWdX9ltwOKI=
X-Google-Smtp-Source: AGHT+IHh6cT/YAwvfS4kUFuIL2MKI/IRiBEXJUzAJrsGH+bLlBAjmVm5sjfCrSK1mO5PS6muaL98rg==
X-Received: by 2002:a17:903:2f88:b0:234:3eb8:5b52 with SMTP id d9443c01a7336-234f68c5d1dmr269789625ad.12.1748880044946;
        Mon, 02 Jun 2025 09:00:44 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bc8657sm72680395ad.30.2025.06.02.09.00.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 09:00:44 -0700 (PDT)
Message-ID: <d7dd8b1d-0e36-43e7-abc1-74a477dba06d@broadcom.com>
Date: Mon, 2 Jun 2025 09:00:42 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 10/10] net: dsa: b53: ensure BCM5325 PHYs are enabled
To: =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
 jonas.gorski@gmail.com, florian.fainelli@broadcom.com, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, vivien.didelot@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, dgcbueu@gmail.com
References: <20250531101308.155757-1-noltari@gmail.com>
 <20250531101308.155757-11-noltari@gmail.com>
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
In-Reply-To: <20250531101308.155757-11-noltari@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/31/25 03:13, Álvaro Fernández Rojas wrote:
> According to the datasheet, BCM5325 uses B53_PD_MODE_CTRL_25 register to
> disable clocking to individual PHYs.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Would this be more natural and power efficient to move to 
b53_port_setup() instead?
-- 
Florian

