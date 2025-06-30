Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372AE293B61
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 17:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751303201; cv=none; b=mJVsg4h403fCPIh40FoPIzvWk8e1tEO1OMRnaB5fkv2SKeWiQYctRguCG/smEgh2gk+nu5lefYM6arwRzPZRGsb4yDAmPDB08/hmjrcCt2JnxGDQL6vSCdRUlTgDrvmZ6ieY6lgbITByq1mn/ikbq4qa7UmEmoW4bGKicdt4kBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751303201; c=relaxed/simple;
	bh=Rc4d7uA3KTPb0dBTant2cJkdRo112Z9ZMNCYt/L16FI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NpuqzUvR27Bdqv3DnOClt/OkQAPrhqlIczGxeNIwZyLe2B9U7/M50Cpb7XOAlEdEqh/PxPy8aI0AmvKzrbXRj10W23H/usD3IrNHxRn3sqqU4GvoElRdYV3FAOEvXR9jXjN0x2mGs+j06QA+7iVS+hWvTq0+SxFv1JM8VMSJcDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Hm0Qr4MJ; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Hm0Qr4MJ"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b170c99aa49so3839101a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1751303199; x=1751907999; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4pe2m6OO+aD5Db2RKVohczYrYxmhZoW19EPa28ikR2o=;
        b=Hm0Qr4MJpLleVennQIGqtr8daQa6NusrX0L9w86eP8NT9s+x1CGnUPogP7QV6utJbU
         jctXTtc9kV+n2GWSkNaSA6i8iwBJAovmnE8lxA2rUqMfa5EnCYNJSoWpiDyXZNA9Sq+Q
         v+dooAGi0whVsvOEeBeiw6zE9O+EjvjCABVCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751303199; x=1751907999;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4pe2m6OO+aD5Db2RKVohczYrYxmhZoW19EPa28ikR2o=;
        b=YkviNbS+lXM9d261fTTWnvwjitnsVsKLI9/ZLJB0KlmZuz/lGXABHzcTPHQbRq8ApK
         Uz3/txvMgDNd4mNWNThZN1WMzZBjbEATW3JUUnV3IzVh8XtEkZiTPSPHFP+enNhYENyn
         iwHpE4w8juNWXTbyaKH6w5Dp2fYgJ3QL4tTRo++iuAkMoZNkBeFP18igAzQPjuyfIdet
         NMcdyrkhARoit7QkEIOixGWHBPQ3VYzP5GRKNFliZ6/xGf+IgAO6k8RTQ4xaEV2rmqxI
         ozR49AYvCGmV3X5UzqG1kaaNUty1/z6WkqCKxLli0Y4zqWVcxHMS2jhNuHlRyNQaBOE/
         7utA==
X-Forwarded-Encrypted: i=1; AJvYcCUQualraIGjRW4AMRp8ZVMX9MALTO7rkDIMXmTav7wuau8w05LotO8s2UBLhfcdVMctfEhARIM9aZk+eqo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT32bSvU3Ju3PDv50/kiiAoAWZGMkUhrB62MF4b4ilihz/9A5x
	Ju5zHJDIEZGRaFgipKxfIkBcm1VEgAImuua8XGNZ7cmF3CXpRAmOjtDvPllCcj4jjQ==
X-Gm-Gg: ASbGncsjnY/XrT2r7NtG1wLDs1CTVVPmXtNhx3AJ22AH2fao4JOcVyNDYULx8iXeyix
	PiTAV1WeWGU60ORzneVvXYJgyesnq/p6qEBHhJyMHQR7yUS4U8S/JaaAzpEW1AS/IfHy3e+r1c9
	H84FLQjoog+wdab2ghUoPO9cG9ZZOVrNCJwDc1wzzw0xaCAgRqItQcUsEBrj8ocZqE2rFs+vVE7
	fiz2so4b4xvg23Ig2Wg8FsuOfei1mjRpvMqGqW4CHe98RWCgnAM+qh/uGpVdpI8NnoLG0oDBSeX
	BLpZ5DwuZDPZpi0f15TfQhFLLYmcQCLOjBOQTzWOejvQWem6IvT3loj8bCzD6o8pmxppY6sm8T3
	/OljDCP7uKPj10Vz7vw35EH37EQ==
X-Google-Smtp-Source: AGHT+IEKg9TUOzSxppsmjj2yfzPJiqt0cGVRpjZz8q0wTCde0PRYfqv5J+NKU001pB8mLSvZjg6Bkw==
X-Received: by 2002:a17:90b:2f8f:b0:311:a54d:8492 with SMTP id 98e67ed59e1d1-318c910de41mr20420929a91.6.1751303199555;
        Mon, 30 Jun 2025 10:06:39 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f5426bf0sm14325650a91.23.2025.06.30.10.06.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 10:06:38 -0700 (PDT)
Message-ID: <10c14d8b-f3e8-47a9-85fa-8780c412b900@broadcom.com>
Date: Mon, 30 Jun 2025 10:06:37 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v4 2/4] dt-bindings: ethernet-phy: add MII-Lite phy
 interface type
To: =?UTF-8?Q?Kamil_Hor=C3=A1k_-_2N?= <kamilh@axis.com>,
 bcm-kernel-feedback-list@broadcom.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, f.fainelli@gmail.com, robh@kernel.org,
 andrew+netdev@lunn.ch, Maxime Chevallier <maxime.chevallier@bootlin.com>
References: <20250630135837.1173063-1-kamilh@axis.com>
 <20250630135837.1173063-3-kamilh@axis.com>
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
In-Reply-To: <20250630135837.1173063-3-kamilh@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/30/25 06:58, Kamil Horák - 2N wrote:
> Some Broadcom PHYs are capable to operate in simplified MII mode,
> without TXER, RXER, CRS and COL signals as defined for the MII.
> The MII-Lite mode can be used on most Ethernet controllers with full
> MII interface by just leaving the input signals (RXER, CRS, COL)
> inactive. The absence of COL signal makes half-duplex link modes
> impossible but does not interfere with BroadR-Reach link modes on
> Broadcom PHYs, because they are all full-duplex only.
> 
> Add new interface type "mii-lite" to phy-connection-type enum.
> 
> Signed-off-by: Kamil Horák - 2N <kamilh@axis.com>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
