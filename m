Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20CA17BB6
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 21:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748900306; cv=none; b=tONZCOVbod/B7/7U1rFQUiDdn6R+97alVF2IeavXBLAzRylkRRBRU8Hc8YxHn5G4JHoxXQ8DOVUgKm919oNjJ+Ga7tHxwJVVPSsXUHlVb1yiMYur6x35enPN8wxEF2dZkGoR4c9pL56JjabCWuU2RHiVGUVDdRAA6d9DGuIiqhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748900306; c=relaxed/simple;
	bh=Ui4uYFqve41fxber8UjVsihCB3aUnN1o1Z3IFxnIydI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mDx5zKVbNT3TmxFYDRiIFAbPp3ptm3qYmSU11ou3W4SYzWqiqM8Vzi2OUoYOwUoUjIFib75QVzo82Zpf61Ey5UhX8AwWyiGRmOPN6Lp/X6Jbc8aqWu+nFn7tIKiVNXz7t4hPNBxb+m100tZMWc+AKufb2i0/pnRwgeJ7U9wx/KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ZkFkHRht; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ZkFkHRht"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-742c9907967so4988514b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 14:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1748900303; x=1749505103; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2ZjqpYvzOu/E1QRY9S6tRLsm2usimRLkMEz/exGkrf8=;
        b=ZkFkHRht8z7OWldVAFaPAn6rSTBj9NfxAl0jVTYzDEadHRF3HfdZAuejuv2+SLWpnT
         7msYWZyEBXTPxoLb+uolTdx0uYbeaRAPKihHN1hocdse1ERBLVPWSV2EH4JaLDyIToaW
         XdKTGuHcomVZufkJUBQI+6q30RlAS6KA33hTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748900303; x=1749505103;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ZjqpYvzOu/E1QRY9S6tRLsm2usimRLkMEz/exGkrf8=;
        b=uEjxh1NlIxr/m2OOZd0xvrtHl8CT+l9jhyZk4S6cgt9aipwNLBB5U9kjRawtl81M6Y
         7LrejLBfYS9+3SUznu3BgXIr5mqha1VcYxd/52R+pOpjlrwW53JTwrbiuM75IbOd7F9/
         Oz+96qmILGYB6dGE7AAaE9WRG1pZrLiMlQAX8S+5SpYKRspejc7W2iID8YyRXl5BtpUA
         XTPnpRw6PnWAUVGjH/U63EYt536/BbxTuT0MrIo4xeukyeWd5e/1T1p6W9bYem2NmBFq
         q3/550wNqvgL79Lw66HLYsTJbFC/3B80Y+VVTn9E8JQy6MPp9Q1Obmq2eVmtg1QJxw5B
         8B0A==
X-Forwarded-Encrypted: i=1; AJvYcCUVCb+l8qFVbLtB9gc3fGWo70L63RJAcY4z+/KvnRiYq1W1nM76Ac5s2J0FdtlQG0tX8/pXRtCl9vyjYi8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjvr1YqC1C0rRJuHkuKL69LNdJ9wPUhBUtv++JgaJm4yJfyELF
	ECJeiQ5fWpAX/xBe4J4klor1jBaOa5BBC9+q/fZ1+PS3ahKDdLhcq69EIg4lrOipRA==
X-Gm-Gg: ASbGnctaFp+rD1K1Mhq7tx2D6hxLTshG7wqEGisKNQpKqk5az4j4BxxUGOyvc+yrFN2
	I+LfcHWZSZ3ijH+5qm9SHfKatpMDYJnL6BosEVyY16fYNyTCg82dM0L7piiW7TVHtQGhYNcwpfu
	mwut0Fx03VaQO2YYZuwqLexIw/rUzh/Aj0KMnWJfzHVYSdRVkwZG/oqeZYX8mSO2OpODA43h/9K
	zyXMTpcYb42sAmUYPTt67mwtf0nWjFswtrG8W/J0g8m0aw42NTW0A+3HtYmZyzgWsbeESgpW05M
	f4yq5lFwklcIIl9f2xLLv8QYGHo8sGzMPCRQBMik04VKjiqdE1IkdjFRpxWg2BJ2sljXj31L7Re
	99R/dlJtcmX74N+M=
X-Google-Smtp-Source: AGHT+IF8yRfd4dylOpz6L2d6nuH49Z0C6wyEZooEBgDMRlhm8qDJz7+P6+f2ww3sHrXlF3COu0JvGQ==
X-Received: by 2002:a05:6a00:2301:b0:736:35d4:f03f with SMTP id d2e1a72fcca58-747d1835b73mr11858723b3a.6.1748900302946;
        Mon, 02 Jun 2025 14:38:22 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afff71eesm8075400b3a.159.2025.06.02.14.38.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 14:38:21 -0700 (PDT)
Message-ID: <bb955bad-d9f4-430c-9df9-beb66dd60d7c@broadcom.com>
Date: Mon, 2 Jun 2025 14:38:20 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 2/5] net: dsa: b53: do not enable RGMII delay on
 bcm63xx
To: Jonas Gorski <jonas.gorski@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250602193953.1010487-1-jonas.gorski@gmail.com>
 <20250602193953.1010487-3-jonas.gorski@gmail.com>
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
In-Reply-To: <20250602193953.1010487-3-jonas.gorski@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/2/25 12:39, Jonas Gorski wrote:
> bcm63xx's RGMII ports are always in MAC mode, never in PHY mode, so we
> shouldn't enable any delays and let the PHY handle any delays as
> necessary.
> 
> This fixes using RGMII ports with normal PHYs like BCM54612E, which will
> handle the delay in the PHY.
> 
> Fixes: ce3bf94871f7 ("net: dsa: b53: add support for BCM63xx RGMIIs")
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

