Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A10521CC48
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 21:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747690854; cv=none; b=YsLKQRFZcbRaDbJFcNYEUsbj2P//1xn5Cj3Pmtqou2kU63kSY4uu2gOAKiJqwGEeTbGHS5RFXC84w04oG8v7c9w/e+VLRFNKcmbVDHDQUoV0MPlUoyHM5cN0UEslDmOtG/vtbz0cD3nsJmlJvGhZ/LQPq8UqoU1zDJytDHm1wqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747690854; c=relaxed/simple;
	bh=/uFHROyI0Kx6jitpThXLN1Ib1Uivr9ksyUKL4WmI29o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IE6XZHxr3Z7lj61b9zi0/J2F+2lJjMtmIpkRock82RRVAAAlLS2V72mPuSrPVcfJ0q5/6K/oeSEd0hjwiut16xX4sU91kprGR5qmQ9VJTMFqfpXtaQQtLd+erFerEPKvM7DuVRDuPAh9jwhbdXaCFl1J9DVyFfBRn6gJVpQUnQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=FUk12U+4; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="FUk12U+4"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso5722675b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 14:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1747690852; x=1748295652; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yYGjiC5UDvQshFcMR9QcQxV0wJO+Bk3yzbRWhuFNt90=;
        b=FUk12U+4MHwGpNgTckWCde8Xjcr7g7kL+QKe+MpPJEqbcYisVHTQ8+hD3d/djmtnd8
         392x9McBRDrMOdrCNK5e24QmcLqBYpPhEw8snQHjSvA8rPVWI+C7YIINEwcljfIw2Mg3
         5akCyAsVoGKTBlCiDECfOPIqrDIbdioPv+UJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747690852; x=1748295652;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yYGjiC5UDvQshFcMR9QcQxV0wJO+Bk3yzbRWhuFNt90=;
        b=G6EzGJYcB77lMo1OyONj1/TtMtKYVE5l2LqgakRgdkNAuO6FUhA36YOzfZe3O0TxzB
         kHuBS8qAablDqrNXVgpsDxAo/MizywaxuaKBy3hcy3cqSUQknPORgUvvSNkxzXkH5iWM
         TFK+OgdZWRu2Ui8RDzMJKj5YH4xGYdY3An1auSrXy2TafOX1WseFMYAV+2R1RMt/XmdY
         z0WGrGbTO/N9CxhA9s4apHIdRHfG9Zr46++xhLcExce9syfnMQzxxkYLyMrDxgx2adDl
         ivxQlkUmDEUGni+9ZMH+ueaY9qhwERZF2FuHICrB8/QfTirc+E+FqgrukQXtxBr3jRkW
         tWew==
X-Forwarded-Encrypted: i=1; AJvYcCWGpU8zMiwe9ES6+1u8iiJSd83idqJQ/bzOiMx1e8jA28mNaYdnhXa8IzVEu3hvSL0lBGeJc7AvZ1s3dOc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwKnF5f9Pr41u58qxAl6hL879VhtBQcPCfczWOLfNnBFUTWmtF
	Yf6gepCuOhy+Dd59v2lk+MRh8tcqldtppYwn0Jfpgbr3cRKTxKzATpiG6ELjxabkJA==
X-Gm-Gg: ASbGncvN76FWuwrZsiyDcXTeql04Yy6ICoceVzLcroWZwy5vi1+CfsrzEhxA/8HdQgy
	NL6fUanLSSml53XVFEkvsakmS42OzCWB90YtgeZoUFJTPXPCWZYyxT6SjpiuJUQOi7JMO6PMmLe
	JXgExqwuN2eklMwIYknqkMMR9fBFv6pyAPwhh4ODnXc4fw83zYHV8TSUJgYK+9JKyluzkm7PyMM
	DTAImZ7iUSmALWPGJ2Fhk6MzaGJNQ5cLISIRnO4h4RAJKDbZ9cDddj/lYtxYYZWYfLmf5J7NkQz
	6zeHQGl/DOsXgVvja70RqZtA4iNDweZvKzdrrTbzP6skEc76/cyJl+4DsHiaaHgo3ZC0Aco/I9Y
	wYNVaXslmS2BjgYaN8bjU4VCJbQ==
X-Google-Smtp-Source: AGHT+IFFPdD3VsDwmbZYP05GQeqcTUN56P0IxA5walt+qDMfQ9wiMUpStXp4V+29gYmyjZ8WCx/tnQ==
X-Received: by 2002:a05:6a00:a06:b0:72d:9cbc:730d with SMTP id d2e1a72fcca58-742a97d4650mr18312464b3a.11.1747690852374;
        Mon, 19 May 2025 14:40:52 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96dfa9dsm6931394b3a.10.2025.05.19.14.40.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 14:40:51 -0700 (PDT)
Message-ID: <dc9c76cf-64bf-434b-9f7b-af050822bfe5@broadcom.com>
Date: Mon, 19 May 2025 14:40:50 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 3/3] net: dsa: b53: allow RGMII for bcm63xx RGMII
 ports
To: Jonas Gorski <jonas.gorski@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250519174550.1486064-1-jonas.gorski@gmail.com>
 <20250519174550.1486064-4-jonas.gorski@gmail.com>
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
In-Reply-To: <20250519174550.1486064-4-jonas.gorski@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/19/25 10:45, Jonas Gorski wrote:
> Add RGMII to supported interfaces for BCM63xx RGMII ports so they can be
> actually used in RGMII mode.
> 
> Without this, phylink will fail to configure them:
> 
> [    3.580000] b53-switch 10700000.switch GbE3 (uninitialized): validation of rgmii with support 0000000,00000000,00000000,000062ff and advertisement 0000000,00000000,00000000,000062ff failed: -EINVAL
> [    3.600000] b53-switch 10700000.switch GbE3 (uninitialized): failed to connect to PHY: -EINVAL
> [    3.610000] b53-switch 10700000.switch GbE3 (uninitialized): error -22 setting up PHY for tree 0, switch 0, port 4
> 
> Fixes: ce3bf94871f7 ("net: dsa: b53: add support for BCM63xx RGMIIs")
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

