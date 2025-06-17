Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4172237162
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 16:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750176689; cv=none; b=T/+6ZRlITL5iWIXE0qx1Wak6Wi3LOrXy7ct1jrA4znMGtEXQoTb1JnMBm4I63nNxAsKv4ah95bdPFCPy1kx+0lE7P1GWyQLNhTmckT6NX+YoginOwclJCwqYap0M+L4vxS/lC5ddk74eCTxxpGsDruI6Vbtbj1Ds4WsLECiHOLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750176689; c=relaxed/simple;
	bh=OC9vIJisTHYQPwuKN43tUkgM5DyhMcufbbVGOYHKqSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mznmLa8DVuqfYbtZ7mX2rlOfqkrg6Sef6YAQRjRFZws3F5t+znXMSBuTpRzbDL3xXLMmvd0UBfAvZJUGwdeldbOHAKhQvpogmcZPtNWQmzIwkh0CmLPD2Fx19CnG6Jf0omobI9Ev6hx2A2ERWrCsQ3kwOwgs+VURqMaYRlm5VgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=EPAIyukk; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="EPAIyukk"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2349f096605so78903445ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1750176686; x=1750781486; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pLW7r7HuYcGyR7rLZ3NHXY+eg0CZ2RMHf0gILHhKaYs=;
        b=EPAIyukkEyYSIaXNc0u04ZJB8sJoMGUhJ0gKg6xOS3EtAa4j5KRfzXKyRqxisSi34S
         iKquasV/0r5dqEhKPRgKbPhLA5j+a5NoF4UjKtmExFtvkPrV1+hJxJ2TmgUqC1t69Q8u
         Ti0xW5roNRaMAhEZPnLpI7nb4EnGx7a54u/IM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750176686; x=1750781486;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pLW7r7HuYcGyR7rLZ3NHXY+eg0CZ2RMHf0gILHhKaYs=;
        b=V0AcY/5BIzKMyi1E56tM+Ql8c92sinwDVIFl8mbz+7BwuRqbZVWYuDpucGxUuaDCjR
         Y6bNOCHTsns4HY7XAn52zItjTO/Wz0JVSZnLz3fxlRTj0PcV6mxH3jJZIuvc42B+QSyW
         WStKUK6HV9rqpQY7OgR7xL+N66z4TEAl91Kz4tQW3/qyi5U7LfkGx0dne9fS2r8F4ULo
         VUzbV0q22hgKw9xn/Y5k0Lgpawj6wZkaXimnmIdT8LiL/gvYuKQi8VoZtBVhMlc96zY+
         igq7Orb6PJF9Km26fk7iwtXELKVEZPkzvxCuR9SK2y5Etm0r738q1fLX7Ib+Ve3hvEGm
         xHqg==
X-Forwarded-Encrypted: i=1; AJvYcCXDqS3kHv7Gai/iPYsIaeAFfeYhv9C0sjRRIgv/T1pmUmHivnmWlI7XiF1p7Jx580hHZ0n1keGGaczgNqU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtBChbm6ny4oQuImdruyGtAXhSRo9rtj5AxHlfjGcIE87KhTei
	7WWLvg+ZRRg3XxqG+LABvYgmdhaKWVBGF9iLmobbqoKiTnaoin4DdKdsK0juNo/ggQ==
X-Gm-Gg: ASbGnctDqBzx5mOOUBie1dHnN/XyhOr5oE0Tzqexe2oCpXzAY7wPZ2cChmdzi4Cdb+y
	xNQQcouL0Z+n4JuJPeHx3A7kGd+5VgZ8FKr7GaVFetpNKdz8tLZI4211c83BZsucb6F764RAYbj
	7ugfHJp8T7WBfV8jC8CgJw9iHOrL9RiiZBNpMbCOsNRx3Y9bxl+oGE34c+/gfnUGqCbhs5YCsH6
	jiK1HkJAgxEiPtqOFhTpYZdrJoQV0sWl/U1UJNfn0hPjkRlIX78Xkn3U/68DochCYuPvrkR51fi
	oE8ArM5lHvbbjm1u8ix7JrO1v8ZRzG5OHQwEJcX255S+nUQM8fl54jtN+atlbnGWhr4thUEcBpn
	P1Rvtj7mpJfj8kEfUK1f2GLeE2p1U6yLWm8t9
X-Google-Smtp-Source: AGHT+IEQKmeU9Bz4bli+f2koEvgctbXY/o26ffiLON6VsMQzQ7u7NsjgIKe+pJ3R8VpocXxpXL8oig==
X-Received: by 2002:a17:902:eccc:b0:235:f18f:2924 with SMTP id d9443c01a7336-2366b32a043mr227376315ad.15.1750176686223;
        Tue, 17 Jun 2025 09:11:26 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2369e7be838sm3279455ad.125.2025.06.17.09.11.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 09:11:25 -0700 (PDT)
Message-ID: <499e7609-9000-4f49-9654-90b141f72394@broadcom.com>
Date: Tue, 17 Jun 2025 09:11:23 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 14/14] net: dsa: b53: ensure BCM5325 PHYs are
 enabled
To: =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
 jonas.gorski@gmail.com, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, vivien.didelot@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, dgcbueu@gmail.com
References: <20250614080000.1884236-1-noltari@gmail.com>
 <20250614080000.1884236-15-noltari@gmail.com>
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
In-Reply-To: <20250614080000.1884236-15-noltari@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/14/25 01:00, Álvaro Fernández Rojas wrote:
> According to the datasheet, BCM5325 uses B53_PD_MODE_CTRL_25 register to
> disable clocking to individual PHYs.
> Only ports 1-4 can be enabled or disabled and the datasheet is explicit
> about not toggling BIT(0) since it disables the PLL power and the switch.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
