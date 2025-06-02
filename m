Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1362017B402
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 18:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748887645; cv=none; b=ePhEDKkgf8idhGGhEhAf98aZN/7QAQFu9c/YnYcOaNlu0j/kE27M9qOM2DGOxLPVSuL9sbMwNgV4Ll0c362OWifDZC7SfRxE+/RuLUVudQhJLZ9lgN+/K3RfJpotu6wZo5DbJ464CbPm3Cnd2pADLdImoKb/8z4HK8aYKEuq4yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748887645; c=relaxed/simple;
	bh=B1IT92nzoDwlJgHyhF/M8EqdbkoWldClYQt+fdBC7O8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SGQo2vx2XE2Kp/uY00Gl+Li4STOTQ9LIVGslf12QMYVJMX4d0Xk+ky9KPfWHg04ITJPDKprIBGSS7lQqFKMPWGy+Xw/LocFfuzx4NzDZjz6D4/2rXan/MBF0H2USimBMxlUI/knYP0ePfJLm7JTrpaVVyt+wByMwn7eZDE2yyKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=LtRnSrFM; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="LtRnSrFM"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-747abb3cd0bso3527918b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 11:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1748887643; x=1749492443; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f75Fmd2HmTOxmb3ydCTXDBO0VW57Rha9LIEst3+i6PQ=;
        b=LtRnSrFMIAfdFf8vnbe73IBT+DMTAY1UA5AxZ0JatLJGWRh4aKat8/gVYz8LFGRbM4
         XA6caG9u4+BDYTItgDWd9lF24OVRaLksgvVUIxXhcbbthHMsL78VYF5x4YkOapbZIDHo
         jAN0aEvWOdcybdUimk3SJ+MFDHpT57BP9m7sw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748887643; x=1749492443;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f75Fmd2HmTOxmb3ydCTXDBO0VW57Rha9LIEst3+i6PQ=;
        b=nh39UMAlldSm478wMV4MO4OJv+QWSdQbv2OZ73pf2bUc5j7vVcXurnPSsD1GcXpDAg
         P9cCndpy6/BV5wIa7wIVdT4S1hL3TgzzaqljFqUau1Rpt7CljNQF4CX/El01NQIbpjoE
         tyjMbgxGV0/knhE7McheZUYXIeD8AGcBxX/og/gpniH9ypzZo8JbVKsozeGMBxQCCEAG
         8KxB5ECzccGn8P71B5xC1ys3QOgbZAJdsIQvb+ZKxbHTEkWM0Wl/1syG3geZCenYjAqP
         iMKvDpFzdMM2op7Ce9xFyg06ZAwW1Mzppi6s++Ba+N/JyRFMcZ2gt31uSJsuI3zgCw4a
         eMJA==
X-Forwarded-Encrypted: i=1; AJvYcCU6zHW3fRsaFoSdQIJleEIL1KOd4uwJFXhiLmV0TfFIigz9Fex4ph/n3wyFIhWTkhtBndMG0m0h+zE4X4I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSnlG+rizvPbb/YGSRmKFqMMlp8f5Pbmf9MsokYWJjaAGrnU1N
	k7pATiRbH4Y+nVb1EOI4H20deNR5rUq+0sJhO55aUzE4YoyFlUc63NlYRr15zQpD1LvszigrBzv
	kD3Eoki9+
X-Gm-Gg: ASbGnctmIs1jTrDTP75vH5/8oX2l7FNNqGEyAMCjhhVvkyyb9CmA5McXh7X3MKSZDWA
	72zE0Y9Sca6ZUAQDDrbBFI1YFtfXfpkITYz0PA3M1Zg3IhXxTb4knV6szzI/2W5pObDrLfZcOsF
	zmIKERf/Smn/UCPKiDjmfrVJPdIyGhJdQCsgu8QtIpo/de39rLpmBByXp5Tt8HEbl70VCtMKR47
	0r7q5JLdeBstVqQWL0JaJ5OiUOVPDf3a2/KD6lAgrMQYFNBS+KOKVKU6d1TSXOxQTQqTBRr5w3+
	dRhrqGeH5NS7sJwWbOsfPQHM5HpB6hqH7dekrTYh5h2Q3pxcXPp9rFM4Z9rBN2obRmSDsD8kWJI
	isuP5j/y8D1oc3N0=
X-Google-Smtp-Source: AGHT+IFW1A8jX6Iq5Uxnn5p/4m0wDsnzCLGnjep/xHiKvfLONgy5Zls2kW93VR4nae5axXvqgzGsiw==
X-Received: by 2002:a05:6a20:748c:b0:218:d024:11f5 with SMTP id adf61e73a8af0-21d0a014e05mr656981637.3.1748887643322;
        Mon, 02 Jun 2025 11:07:23 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb368d5sm5862201a12.39.2025.06.02.11.07.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 11:07:22 -0700 (PDT)
Message-ID: <0f26cda5-8269-484c-b5d0-2b627e92776c@broadcom.com>
Date: Mon, 2 Jun 2025 11:07:20 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/10] net: dsa: b53: prevent BRCM_HDR access on
 BCM5325
To: =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
 jonas.gorski@gmail.com, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, vivien.didelot@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dgcbueu@gmail.com
References: <20250531101308.155757-1-noltari@gmail.com>
 <20250531101308.155757-7-noltari@gmail.com>
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
In-Reply-To: <20250531101308.155757-7-noltari@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/31/25 03:13, Álvaro Fernández Rojas wrote:
> BCM5325 doesn't implement BRCM_HDR register so we should avoid reading or
> writing it.
> 
> Fixes: b409a9efa183 ("net: dsa: b53: Move Broadcom header setup to b53")
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
