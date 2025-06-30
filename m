Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7D7CA4E
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 17:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751303105; cv=none; b=aPVuR3hIPcM1ZlmKmAuWMHsnONxwTy+YK71b5okDQ0wxAX7jBYqQeW382X7P4YMNcYSqvg5xuB+83how9ezoPI+rs4BmkkKRIrpTGjEfCJ276hcb3e8jofTsbP1w64tCVhBYt/mp0IIeQhwF+2BhpcfI9b4whHUdK2ZQXXMFF2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751303105; c=relaxed/simple;
	bh=rvv6J/BIkEP6/ay8GOQZEJF0j0bE6TOnQy9zYPOFx0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KF9EtKq28NZu1mZARbiB5RyIR0j+K3Y8q21FgfdZP+5I9U685PAsf8jfiHjqQ+hyl091iXVL2TT+ElCONOiEe2onAxj56L8HwbB36NZQPlHw2RJvvmrE4C+bHeB/edXGPawikFJjPNXxFmW7X34Q1aj4atFPKFUl1WM6wzM94kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=PqdqdrJZ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="PqdqdrJZ"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-235a3dd4f0dso28904835ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1751303103; x=1751907903; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AuF+Tf32RiiB1hUR5Jnn42UkSExoFc4ZL0ns2zrDuik=;
        b=PqdqdrJZ5YIY1a8ZAPKVKoLdsBYqEXxQZpoEejIJNPDRn5ocLgJ4aYR+yjrqs5totF
         sfeIe5njgasY3YrzJsTgA6y1HLyFbNdYWd8iUazNPPiVRxKslb2b3Unkt09/Z0XW5DTA
         wWdPa5ujs2JiYHEcpezpuDNLjOuCSSe4TUNtk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751303103; x=1751907903;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AuF+Tf32RiiB1hUR5Jnn42UkSExoFc4ZL0ns2zrDuik=;
        b=arW0fg5aWo07nJZuGh/OrXQFFlJwgpHB6f2Q9ta6ZK1Ft8IwYT39BYMV9kD9kFpb6/
         kj9uvppeJoEV9pbiG1asqvlAFIp5+qoZA3CEJkdqtxYdQlcayab9jRvOJeehZBj+H9vN
         qEhU848tD6lKjzPnO9CrWmX+hv56MnQnhHWkfwmTJAia8yzgKjifr37sk3QpD4Zj3aMu
         cHVS5z8UlL/oxaTQ6IvyGMcYak2zsIAd2HZdEFWFEo1+t3ZSeFmfE2J13Xyw5X5+l8WU
         K9h5nkNC0AoYe7uTVnIVPk5QcMNt20pkBKomiB4sMgZPrBnq+hGLiLQNM8k2NWxfAI8s
         lR5w==
X-Forwarded-Encrypted: i=1; AJvYcCWkxbIy+jEamr33PDrEJXfFQkox1x8U3+lCQh29bjmUjd2S87lR4ZmXJ+h02MbchOIwR/QeMmza10G+W9I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsrNy4AkYEr0cE8oDn4nH/sVtmuv5noQ2Jc1YC/pqBrOrULVfm
	gd21tVGXQ4I8B//7zhtL0O3d7xFmh73qkO3QDhyN7rCt8MM+85+Epl/mMYfITVcs7w==
X-Gm-Gg: ASbGncvcT9UQ5hSmKGB+59eflYACBTA35/3FNZzzFE4DKDfqF0DkZvlLE3ocTCuJxJx
	b7hmUqDNm9pYsbsLMc2fgiBIuIGhd43aX8oP+pRoNIWj4geBKGsLmME1a9mWlH/1dQpSPGLED2U
	MX9wLPLvdq2icRP21HU+oKMZS0NdKimyE+fWJqs8kJ5fycHaI2adVP4K1r+Kv/mhISVGf//ElSD
	T7t6rVb/HESxCq/MN5nC051q5Y0O8EWeBbQLm+UHxEDkNS5UXjE9Y87HhvyHFolwmdLb2trS5fz
	2EvrpDCJ/F3bSyp0TqqLUdhg83WxX1KRXRo8tXrKWYEoUy6XSW+vAZuiuolWodaMyBSxRYdGkLV
	wawCVMBZ/qu0aalMSR9cV10cE/w==
X-Google-Smtp-Source: AGHT+IGVeUe1SAO1JJZ5SmstKB/oo+QpKNLeCnJ+PrGWNq1oZZFU2gt8bkbf391m7J8uGzN0NPEuEQ==
X-Received: by 2002:a17:902:cecf:b0:22e:421b:49b1 with SMTP id d9443c01a7336-23ac487c9f8mr217892555ad.48.1751303102805;
        Mon, 30 Jun 2025 10:05:02 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acc9efffbsm85782995ad.42.2025.06.30.10.05.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 10:05:02 -0700 (PDT)
Message-ID: <7436b0ce-80e7-42a4-a61c-50811126d790@broadcom.com>
Date: Mon, 30 Jun 2025 10:05:00 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 3/4] net: phy: bcm5481x: MII-Lite activation
To: =?UTF-8?Q?Kamil_Hor=C3=A1k_-_2N?= <kamilh@axis.com>,
 bcm-kernel-feedback-list@broadcom.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, f.fainelli@gmail.com, robh@kernel.org,
 andrew+netdev@lunn.ch
References: <20250630113033.978455-1-kamilh@axis.com>
 <20250630113033.978455-4-kamilh@axis.com>
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
In-Reply-To: <20250630113033.978455-4-kamilh@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/30/25 04:30, Kamil Horák - 2N wrote:
> Broadcom PHYs featuring the BroadR-Reach two-wire link mode are usually
> capable to operate in simplified MII mode, without TXER, RXER, CRS and
> COL signals as defined for the MII. The absence of COL signal makes
> half-duplex link modes impossible, however, the BroadR-Reach modes are
> all full-duplex only.
> Depending on the IC encapsulation, there exist MII-Lite-only PHYs such
> as bcm54811 in MLP. The PHY itself is hardware-strapped to select among
> multiple RGMII and MII-Lite modes, but the MII-Lite mode must be also
> activated by software.
> 
> Add MII-Lite activation for bcm5481x PHYs.
> 
> Signed-off-by: Kamil Horák - 2N <kamilh@axis.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
