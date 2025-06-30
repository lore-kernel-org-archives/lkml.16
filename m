Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3AA15E5C2
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 17:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751302924; cv=none; b=k9USzJpb2knCdG2kXhVS/J7Rj/AdwkhY/97IAqSIO8PgI+22sga3TtsErMt4SlGy7mzezAYjOsoai1f8G2I7Uox+hDVe/tzIa9TEIxdzhcL2sXoE+f/XhAYOh4HFb2ZfQAks87lWEJwbnoHcD3zHVukfauCNcvDsl5GfUvhs6QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751302924; c=relaxed/simple;
	bh=XIaiGYmHe2NRn2/KmwJ+md6aC4uroEqSqTR00vKs8dM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AGSjjln0vPXf3jJdIR0WSs1HP4Jm05xTzzYpegPrXewa05Vh1XUvDwYYvtSGzI1+1JTtsnSLufIGP3B4ayrz8sbkuZqQyENScG8vTMvtF2JlSROuOSqVVKq7K0Xbt+CCPt0UeXrl279RP7MiGMrJg/VVwdFbGYs3xoi47E53Fxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=YY0nAa2r; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="YY0nAa2r"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso2867035b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1751302922; x=1751907722; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5tvKhhGGLes2Wu9RgmXQOR/vIa8GM3NeAvuNhlGHzPU=;
        b=YY0nAa2rygpklfxnAuGV2i38zelcdZmAPMwufI2kpw46iap0Sdsn6gROmZSHSwg8CH
         Y4+bPku4f7jf6WEDbRkt6+apuBmO0Ie2Eq6Fx/5/toGnUqNZkv4Tv8Q1ORlqLl7sjPFP
         8GyejEnKHDXiMtsjmOKz6LPQxHbM+bA/Cudw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751302922; x=1751907722;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5tvKhhGGLes2Wu9RgmXQOR/vIa8GM3NeAvuNhlGHzPU=;
        b=aV6slh0G+ceiqlOwQzE3rNTtJAmsrBAO1GpvzV2W8mXIYjsbWkkwc9YIpKF3DgNeCJ
         9m7iW54HaiOw6KiU8AiJV/ExLA9cL7GzsmpR45ORdGKdMB3Ejgn/zlG+YGuvq8ilCSIt
         nx9+btw7xZXi1rehAZCWXWUl9BMbYtq6jIgZSbbrLqb9+muSpRQsfgnYvsmdwBH1AZT7
         bWILBueLV9OOzE4bf/Fm+TPiwzOt3/I+fBKDtMbbLhw0UkINyntLul+KkReFKgF6NoYr
         T4tB/mupSSb/OFjGZiQnqoB13WTKrdzTQ+8HJGH8ooq1QuGLdOwaqCDBI63qb5yXbHw/
         84kg==
X-Forwarded-Encrypted: i=1; AJvYcCWch/PzgguypNLJTml3Z/qGKeBVlUMXPWs8VGTBzsDKZ9YLLXEk+hMXeYYFsQJPuyzrbRvnYfD4pJYa+z4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yybja1jBosa1veCI5al46oY+m7HinVczvsry1LMwlNemVZC/OkF
	mstnigdBQ/qSZoL04lA1sYWctZe846OFgAje7+kR/rwH3PA+fJUXBc1kfQwBPtk6tw==
X-Gm-Gg: ASbGncvLy4T7nE5WJX8wQGY6EMgKlstOlPuiiYJvu1IYaWru/oZkpg+ydn/+N94vAM+
	cEA/nBHtmBV4EGV/DreSq+R+odkYONEBZNwvar4Rk10HrITsuv9vqHA0Jbb2OH8y+EBq8wjqUFY
	1G5tnEoTMW5ryIIJp0bjZaO5wmmA0RkWxmoNnGhaGCv1nX8jtPBw5XUHos2qPzoYQ3D+mo+4Ojp
	E81WkyJZVnXPyHLGCm2x54uxGC3Je1woCvLOPtrf6be5oeMXDBwBsbwhlIcodfa4su8veiMWmxg
	na9LYCaMIp5Y5FYYIV67RESIxPKVziKZmsb7A+mxmq5ddA0SNAp0nnr0TXO2phJPQz0f+u3go3J
	vnObVX+u0vbkKeKIusZE76FGNVA==
X-Google-Smtp-Source: AGHT+IHmMSLppTtEPOkg+Yn4EpR3ADtecUSf1EaRz/DaI2FyPaqq70d4dtL4kgwOenmatfwOt2DFyw==
X-Received: by 2002:a05:6a20:439f:b0:220:3870:c61e with SMTP id adf61e73a8af0-220a113c574mr22353030637.4.1751302921981;
        Mon, 30 Jun 2025 10:02:01 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e32000e5sm8504925a12.67.2025.06.30.10.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 10:02:01 -0700 (PDT)
Message-ID: <c148dd73-e84c-42ba-ab85-5de4aaebab99@broadcom.com>
Date: Mon, 30 Jun 2025 10:01:59 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 1/4] net: phy: MII-Lite PHY interface mode
To: =?UTF-8?Q?Kamil_Hor=C3=A1k_-_2N?= <kamilh@axis.com>,
 bcm-kernel-feedback-list@broadcom.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, f.fainelli@gmail.com, robh@kernel.org,
 andrew+netdev@lunn.ch
References: <20250630113033.978455-1-kamilh@axis.com>
 <20250630113033.978455-2-kamilh@axis.com>
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
In-Reply-To: <20250630113033.978455-2-kamilh@axis.com>
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
> Add MII-Lite interface mode, especially for Broadcom two-wire PHYs.
> 
> Signed-off-by: Kamil Horák - 2N <kamilh@axis.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
