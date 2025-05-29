Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FC422A811
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 21:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748555180; cv=none; b=ZlK11M382gLSv5CjW+jaLz/io746cPNkeO1zVcOFxbpMldr1xYokSfWs2Jdsfx3bllLZioPYOf3qRzQXGdWFmH/c3dDMQeqAdKhT9B/pQbTr2LjZS6gVW2hjtWbP6K3tXYjTaVFaOy5z/m+bU3cppJHy9+4KSscfDZEC1Lyv2Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748555180; c=relaxed/simple;
	bh=3FbM/5b/f6R7ql+h6I/ET3q5rvjJXKdSarztikH9TWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KSBN4BwP0U/ZRttCfXMVkyWa1hAsgm5Gm/jRw0MeVjhGX/HLrSQ7IimKv6c9a9RToD8iC9S0926ggZH0zu3Ypgo0Aq3xcEuLCvyQD84OqK7r8G1NRYQpCk1Acy0AHN/gggwXDS5c29L267tTTSPQXB1PR4SSnhg6aNN+vT+2jN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=FaOFK8hN; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="FaOFK8hN"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2345c60507bso9983895ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 14:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1748555178; x=1749159978; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EnXkwa2sU7C5+9WFcS6JOR66fh1+6TmCOrRHRKwjJuE=;
        b=FaOFK8hNB6E/wUdoqjwn2q9DKSqGqxNBfPe/XAGF4OhKwL47ulGajzhiWBX4uCl+BB
         kTteH2tHQqmHD5crb+bwmTFcedo8x/jnxehe+kqqW18ejo7TvRCtVf06++bS+U51CVc/
         XI9yup5ycHL8fpGaUU7VKZ+jMG2DrOyModbIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748555178; x=1749159978;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EnXkwa2sU7C5+9WFcS6JOR66fh1+6TmCOrRHRKwjJuE=;
        b=rOZHa2MxxIfLDEa3CmqJjiAUUARTiJFJCf0E23O0zWAzSU0Cu98xY1+k7bQu5Cd+tK
         c/pOvqK7/2xjClFb8Ue3nRqWDq6DC6pFCiq5cYlJmNrk+6ISS1SbyhRWazyLppGWWf0s
         QdPCXiEBOr4IKCVBrX66AapTbS9CrabNdhXbbEVuG7yCcIHWrkbo5s4fR52rvtfjZywW
         Sy13fBbWssTERky8CzK0KV7UfExHLcz9uySz1bFPtFFUFn4AFbc5X9wMv0miOmUdAGe3
         nDyey4QfGi7TAf4E2xnCSza53R1CPVKdfRt4VuUW0mnEZzZojthJJoqegtw/h7b5ReHj
         Nw8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWRqMaaQE9LFi5CcQS/wLLIJS6ps/eOBw5ArKqt2DxYg8loNibMXQsJiuPAOnI7aO+/ihhsMIl++yTqzEs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwokUy+sW6OhjtrF3YikmSvPp6sxwli/DwYyeAN29ab7i93S1Hl
	xC6P+pA0bGJvbgFrpepKUWehhx8nPNKWEy3UXK7E8OVeMOMFl8criuh/p+OqoMv/8w==
X-Gm-Gg: ASbGncv9KjyiW7ugkM+lecVRchw4bAoGi7Y9X8gx8huEPrb035+YxVrnKQSiGQ6oval
	TAQ1Nn8IyhiRhv7NkHSnLd9TKiQ3mX3ezzpolh+xDtZODv2nvLMYchbWrLxIZbreUVtiIV2FPgY
	7AZTVnyAGapPDSeibx03p7/+mC8l3RJkTODKv2J7vMBDSxEZwQlv4ruZrLODK1Xos03ByrkFnDA
	MvIMo7GFRSegXxVyMbgWCSI7oM7lIfkks7zhsW2GOCOMYSRoWC3MIir8CcNDca08VTnDz0isfKM
	K3mC9dnAe4TPOgPpDhwfMoDa7CGHqi3+el213nTpjg8lGM4237gJlwpMsvmcfOLbp5XUJsVpIT9
	8nY4ECg==
X-Google-Smtp-Source: AGHT+IFH4yiLjc7+rYpcNKeGFb0X58Lt8uVD7icqkiOq9jNa+l2IJnQL44ftXB+axaOdZQB+DLu65g==
X-Received: by 2002:a17:902:f788:b0:234:bc9f:82f2 with SMTP id d9443c01a7336-2352a089905mr14711675ad.46.1748555178460;
        Thu, 29 May 2025 14:46:18 -0700 (PDT)
Received: from [10.69.40.38] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb28c98sm446643a12.19.2025.05.29.14.46.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 14:46:17 -0700 (PDT)
Message-ID: <90e91a4f-56de-421d-8e4d-1e641a2ad430@broadcom.com>
Date: Thu, 29 May 2025 14:46:16 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: dsa: tag_brcm: legacy: fix pskb_may_pull length
To: =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
 florian.fainelli@broadcom.com, jonas.gorski@gmail.com, dgcbueu@gmail.com,
 andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250529124406.2513779-1-noltari@gmail.com>
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
In-Reply-To: <20250529124406.2513779-1-noltari@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 5/29/2025 5:44 AM, Álvaro Fernández Rojas wrote:
> BRCM_LEG_PORT_ID was incorrectly used for pskb_may_pull length.
> The correct check is BRCM_LEG_TAG_LEN + VLAN_HLEN, or 10 bytes.
> 
> Fixes: 964dbf186eaa ("net: dsa: tag_brcm: add support for legacy tags")
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

