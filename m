Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E88433C8
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 12:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747140190; cv=none; b=YuI0DuiTz3lGL0pzvk/Og4Fo3ZvdTrP/C91MoBKche4R0xprb9KmB0fv8TwOD3CrgyFftVF4M8McJdJsT87Ok8EcTeL//ypOIYYCzeUQjVZ/1NatF6W+qcoCxOZhIwwj7jLN6FbydNxWRq0CiCyvWp1X7G/BoS7Pn2Gde1jAMrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747140190; c=relaxed/simple;
	bh=58B0X4sQJeMTZJQOhg7jKyJRL0NMhLwiEK+nhYByqAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dNlETrxdIqRnFq5t+SqaMcX8U5wJzVAEHp100F+X6U9LJg6Idnpk/D0dREKPfwCK59iH51DByvb/vAbAFGeyWYyV0KxPdiDvXscFA5Qur9/7xGI8fcQZQxKb4SuJqJOqgpXCEfnLvMnyA2QFPfGSpdz+3Y0WpqWAdY4L3dYlJsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=AR0CBqAQ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="AR0CBqAQ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-442ea95f738so7725965e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 05:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1747140187; x=1747744987; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=m4sK+++DOZZp+Wy5wVTVgYEMmYTYuhm5DQACBZBP2bQ=;
        b=AR0CBqAQ7toQg4Bj7QJA1O/k/iOTSEIGNkQ1MGTKs/JTyfjY8c2tJ6FUJ9EzoLNZO5
         8AN29razkWf0ucmnu5SKXZyiPZ+lKu5c6Hmdz3UPUZ+LVsx6fedWJYxRNMtV042S/bb0
         hEkDoBd+32wwzq7WBo+OXkKPv9Zg1C7b4kVng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747140187; x=1747744987;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m4sK+++DOZZp+Wy5wVTVgYEMmYTYuhm5DQACBZBP2bQ=;
        b=W58X8e9QIIAuULYFrFEqD3xX0Y4bsBxOLz8V3h2KZxtahcGGY3GKocpTh6ba/KlFvT
         Q4H+9/1qjsyz+fwYU4C8DvIQ2Fp7UCjPQEn9zcaPZlBjjwMkmTbN3d9dKrbJ13um0pcF
         ZhNm6JrJR/dsvKCXkv6DJaglEVjHcrpeJe6fdH9OfOZNthybSjdxU6+bY8Zufw9B7R8o
         ZBdr0T+hK5mtXO8whA2WLB4muj4oGvdxEBFSR9rGoG59r1tt3VMr7ZSqy4V370J5VTMP
         xc+gTuIfrtTe0sYqur82M8MLvRUaHb1chRsOji74p+8S+KtRnAkYOpSwxFUcHJnGvMen
         iWYQ==
X-Forwarded-Encrypted: i=1; AJvYcCW07aquX1KDyfn0oB35apuxiIYuFnrXFnK7zwSIGrsf/Xg7iMJ4W3ta4Fu/S72lMYEtRMegDdNmmM9239g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcR3QNXDt8iTqporVy0Q5+VVO/wkJNQV4V6tCsoDQ7mGkdRSrL
	OO0Ws6vqYbsTx2X21bFDVd4/thzpNPp3H/KucEoTX9Voc3uY/6e5nJfhYSWkmw==
X-Gm-Gg: ASbGncur/PfGKXABrpOlYXbCpt0ZFfG8ldzcmHJLkMV9nrCrkbRGNOys6XnQds3j0Vl
	MUBWkgPL62EnaHOG0mKlTnIfbC9R5OXFH3fHAmo91XOqkpQAtMYMzU73VO5XTayO7hVyTVNWeph
	zR7r67yxQolEUR2bSSwXBEC/pilq5B3eAT1fBiFR7AZGfFJkQjaGAldqs1NexYNiQPGGyDSiz1Q
	yOQ2a3tYfpCTWsFGwuFGf4S0nXayX7h1QI479CpdszmXtR2MNJgQjLedpMTLWvuggyFen5x77Qm
	zm6h6KVwPi+C72gQEo4CE5wAMHglTN6F9Uso6fd92qf2NcJMcO2qVgpijCGFzlnsjHEiyqH3Y4U
	WBHFxQKBl
X-Google-Smtp-Source: AGHT+IGG5VspgVeMqtjmk9Ms4epOQhBE8NHd1Fn/B5H8qmLLiSTcfhFtj7uXh5GcNXWjtrc/AswLbw==
X-Received: by 2002:a05:600c:6612:b0:43d:36c:f24 with SMTP id 5b1f17b1804b1-442d6d44830mr156697915e9.13.1747140187018;
        Tue, 13 May 2025 05:43:07 -0700 (PDT)
Received: from [10.229.41.178] ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ebe00sm16370502f8f.38.2025.05.13.05.43.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 05:43:06 -0700 (PDT)
Message-ID: <8bf0d3c9-5084-40ff-a338-15f4e0f9d8a0@broadcom.com>
Date: Tue, 13 May 2025 14:43:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: dsa: b53: prevent standalone from trying to
 forward to other ports
To: Jonas Gorski <jonas.gorski@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250508091424.26870-1-jonas.gorski@gmail.com>
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
In-Reply-To: <20250508091424.26870-1-jonas.gorski@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/8/2025 11:14 AM, Jonas Gorski wrote:
> When bridged ports and standalone ports share a VLAN, e.g. via VLAN
> uppers, or untagged traffic with a vlan unaware bridge, the ASIC will
> still try to forward traffic to known FDB entries on standalone ports.
> But since the port VLAN masks prevent forwarding to bridged ports, this
> traffic will be dropped.
> 
> This e.g. can be observed in the bridge_vlan_unaware ping tests, where
> this breaks pinging with learning on.
> 
> Work around this by enabling the simplified EAP mode on switches
> supporting it for standalone ports, which causes the ASIC to redirect
> traffic of unknown source MAC addresses to the CPU port.
> 
> Since standalone ports do not learn, there are no known source MAC
> addresses, so effectively this redirects all incoming traffic to the CPU
> port.
> 
> Fixes: ff39c2d68679 ("net: dsa: b53: Add bridge support")
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

