Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F69027055E
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 17:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751302940; cv=none; b=urfQxxSbaprlm1MJEHANdmLVTenN3EyJBYOnQg26ZcqRxUDqFZh8nTav48HcedUakPSdWjcmboyTpOMT1R0nVDj08YZJk0FE5BKL7a8pM9yczJZbmgys//FCzRjJJ/X9UdU14EVVGqVlbD5CXeOeW5gVqitbpqjhSGMgjbhgNcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751302940; c=relaxed/simple;
	bh=YwUyQUX233C0MSZgMJu9g4XZRqJb3WbMkyCsiXVUvAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AI+3ouxYtuHfZcaMLqEkoqX9SA8PGr63uA7ckTORMtIO7GpX37i8PaBxII28xFkimM0rUVVqZyYa2cOweGjWhTa+of4ZIPAgIgLwXHue4EaAbx6SS6r/9Aoz5kRp9KpAQV9tnTc+3P+kH9vuPh+mc5Octd1t3swP7aX+1ZCzz6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=WWX0/vqg; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="WWX0/vqg"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso2271102b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1751302938; x=1751907738; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kKECFJl+VHzbkCr8ANm5LnmBY8BtCcv862mIrleW9YA=;
        b=WWX0/vqgtAO00c+cT3iBpaC3QrsjnX8ETsl1ae1FmxhmrmFnkwL7Tap/3F7QRfIMgD
         UiPDzQsvGUHT9ukaFA/6Q/BzXqGaOcvo4fcEmRVWzQsJo9x6p2oD7BZ6YN9oscKbCPcT
         apXnvelkU6uQZRQ9We/GH1JdHxvZknRa79Z1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751302938; x=1751907738;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kKECFJl+VHzbkCr8ANm5LnmBY8BtCcv862mIrleW9YA=;
        b=VPLoG56GYap4bMEDF0tpeaYq164N2zOybnj6d3lf7YQSVd1roJTk7N4x8Dwed6jmFl
         JsEG6WZbzShNvstrc/XfV0sR4tRhWnB7jpYugAZpcPD68cA70UmZboaUaCoigywzBzU4
         0G0GSjKstz0hXr4+rvlkSWIo2E5jvCDZIwt8aD8vgv7gsr/rwbado/lPmda2VYCgm3VW
         KLQiIkM1+5Bb3a6RiFMN1Wpppw7/Tdsk1o8tmpKUZX8v0yAY2fxdsEaWcfxMmAdhdq5T
         Won3NFZRSegG8nGMxWIq1CQQNOTRUOcmSirjqo5hsZ8yAjZlD3cIeoWm9Va1bVJLuZGU
         nVQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNCVd7xab9GFKpzjGM+DPnzB7IIkjdziin91qqWCAesYjeJp+ifQcezAMLczFQIkhaBiFyfT4VRU9fND8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeVsPOEVLHAbNPMPFveEge0ghDJwuEJ+cGotwswa2NVzLQHo5w
	04A/gHcvn8ONuuAPlKjvDi09CNQuMvrDQwFUonAwwLRvr242wcTD7g1pEP1IN5LOyw==
X-Gm-Gg: ASbGnctTJLAG483kyqGECHOe0BPZ8fugp8J8cMMj5wCJZG0kmkIsMktqW32T6ug48Ky
	+p7Bjw67XIUhY87ESlSje3m04EtLlw2PnTBW7fNcVVvc67/ghYEiWMdDZdDW9O3RtF7WAjbviPn
	bI2H47QjTcaUhijF5eGvIrvweVOOyIeW12hcvTGSLfNHziVu25+uaz06goS4daQFjKtFrpcCpSF
	uo+DeknJAP+hP4xC8w8SUuzJK3GQtpAIL9spIaJIxuN2TlgZpRBVk7MZI9vb7Tv+uvCSLlpdvJ+
	Z0iOTrlsv61rmXpMjFb8WFGMs0/PvKTl2bBBX14ko5T/LkX4+3zlwc2sMAcH5Mr+g8h6NYBAxz7
	rkVR+GJntmscr7o9F72H7fnhe1A==
X-Google-Smtp-Source: AGHT+IEzHv0xdel7++1V4VTijbgsg5oXWHHZtPaGf787RJjgBuHV2XdvPwfXA4Ck8RWScE4XJq2usA==
X-Received: by 2002:aa7:88c7:0:b0:742:ae7e:7da8 with SMTP id d2e1a72fcca58-74af6ee4838mr20264390b3a.8.1751302937490;
        Mon, 30 Jun 2025 10:02:17 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e301f704sm8457216a12.18.2025.06.30.10.02.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 10:02:16 -0700 (PDT)
Message-ID: <bdce5d76-2987-4b8a-9177-3e3de8491a56@broadcom.com>
Date: Mon, 30 Jun 2025 10:02:14 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 2/4] dt-bindings: ethernet-phy: add MII-Lite phy
 interface type
To: =?UTF-8?Q?Kamil_Hor=C3=A1k_-_2N?= <kamilh@axis.com>,
 bcm-kernel-feedback-list@broadcom.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, f.fainelli@gmail.com, robh@kernel.org,
 andrew+netdev@lunn.ch
References: <20250630113033.978455-1-kamilh@axis.com>
 <20250630113033.978455-3-kamilh@axis.com>
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
In-Reply-To: <20250630113033.978455-3-kamilh@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/30/25 04:30, Kamil Horák - 2N wrote:
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

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
