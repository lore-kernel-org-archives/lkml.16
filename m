Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDFC1DE3DB
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 18:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749061215; cv=none; b=oET35RvcKjzPf4bP+rIdij6YteM/TZTEEU73TQ7HeFPDgt/8yRAm1b+LZY3k6tQfHgd400Cb7Wkar40azs7HEQ9pyETod1vpY7smoJCRuU//lApMMdD+uQMAxQwJ4/1s9Hc6tI2pZR9obm0nmrnpBJ+oH0uCLoZH8zmcGnpXY60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749061215; c=relaxed/simple;
	bh=CDVil5MS07Lcc+Sn1S+8nAcQJnHdbdTCvZQ0EqFJRqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PElEhtfLn2E0Dl4y7z65yr1/Q0ueyGU8rATnko2Lu7RxKUPz/A+gz7UtwonFTiEVLJtxbbWrnxY1jgbpLUZszOt+FrXEH02ZE1zufXDewZU14O2u8xlRazqRnID3QluAo/ZzJhYtLMFsx+bx5E6tTMNRk271hw/wfyiHuffAQY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=gRKAEzAw; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="gRKAEzAw"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-231e98e46c0so1622145ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 11:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749061213; x=1749666013; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HrJOVyM/imOmIyNVSX1+3ly//LHI/VDAP8Q3M/dAr8A=;
        b=gRKAEzAwdruGiQ+Kh+80Ftj8AcGz587Q7+dZdepIp/c3NPnEtX6IDFOOABrr6daHx/
         V7gGi7ha1F7whpTj3KTWm0dWwuczNM83qoZkz9LQHxsdQrkyA5FvWrUx2WD9mT/10FTM
         +fhXO32wKmH0Ksprlv+KnLYfu/wta6ad8Wre8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749061213; x=1749666013;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HrJOVyM/imOmIyNVSX1+3ly//LHI/VDAP8Q3M/dAr8A=;
        b=Afu8QS6Ck873qqURCVfw7kSmULArtDnKFMgJ6GzjDJTS7HpLReu7gracgVuNoeiHyl
         E40QA1p3KLmhiVCFgKAlpLjl33OW1Yc+SHkNuO7KyP40RdCPuxdp+/JMn22dMemuopTG
         47OterDgtqZEeRAbhyKdw64OAUfBxhd1Exg6SLAYDMDM6cfd32rKxV+XKedGk1CtTTwC
         RtA9XgX7vCDvq3X/KlpSOyMH+8Cq2tAnVxpeL3Yqpj7MObtayx2HdvoLHKv09+7CgXAx
         ByWvrgvEioqhOI6KkNAwHwFQWQ9vsiiSJGLCvoN/jEkyqhiWW5tGe8W/NrXNcu8JiQqD
         RfFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuLQ2lo4FG5gUxsBaBtO/MzCPhj94ttDhnVKLc8M7SRQntfDQ3LdUBh/xrwKkCMcEPI76ome8wRVvhlw4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKl776z9oCPrpbuV8xxpKzz3IbPtE14zGop9SRYMqChd1IUEQ6
	OT8KDedXhkDc2ZW/EEVIaTpguECpG8+d+PdE0RlECTituU0dkWzWaC0/w10kaYw9VQ==
X-Gm-Gg: ASbGncuQxxuqxQHRiN/q97xcvxcY2x6cyXUGsK2xRWp9VRQgfGcf3ZmrEIhRXWsywC3
	CCWKNHJYslFuZBLEKS3CnE8WsuwFCj6T9JP6QzeNayCVaEASm6yImd36gNLlbBeQuAw27srCo9q
	1OumoE38R15XKn9+6pR52YQqFuIS+ifErXVV7by2jjC+FHMVLzSqk4JezjJ7IbBDfvqLFVSuYNH
	fAt7Ucc8ihvXtzXsrLZnTvwXf7OKdEaoUI9iwTdm93ePXjV9FgEhVs5iEqSyKvv2d1NKZFh4mOH
	oVquA+bCDSWeuqWore9UGs0YEYX+s0KMRsTl/FI8RlnccHUmstMJ8B7qVbMHNQua/iprdGBp+iL
	MOHTfq96SAYYXgTA=
X-Google-Smtp-Source: AGHT+IGgzAgFSflk69D2KfxPzE1XCMxjKzx3LreR5/jjTXRTr6hTEPIg8jpaAiNhqWDFViQYC7xF3w==
X-Received: by 2002:a17:902:e74c:b0:235:225d:3098 with SMTP id d9443c01a7336-235e11fef9amr54061395ad.46.1749061212874;
        Wed, 04 Jun 2025 11:20:12 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bc8537sm106993965ad.26.2025.06.04.11.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 11:20:11 -0700 (PDT)
Message-ID: <007c994f-8a3d-4563-8f88-0f34712f7fb3@broadcom.com>
Date: Wed, 4 Jun 2025 11:20:10 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH net-next v2 10/10] net: dsa: b53: ensure BCM5325 PHYs
 are enabled
To: =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
 jonas.gorski@gmail.com, florian.fainelli@broadcom.com, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, vivien.didelot@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, dgcbueu@gmail.com
References: <20250603204858.72402-1-noltari@gmail.com>
 <20250603204858.72402-11-noltari@gmail.com>
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
In-Reply-To: <20250603204858.72402-11-noltari@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/3/25 13:48, Álvaro Fernández Rojas wrote:
> According to the datasheet, BCM5325 uses B53_PD_MODE_CTRL_25 register to
> disable clocking to individual PHYs.
> Only ports 1-4 can be enabled or disabled and the datasheet is explicit
> about not toggling BIT(0) since it disables the PLL power and the switch.
 > > Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>   drivers/net/dsa/b53/b53_common.c | 13 +++++++++++++
>   drivers/net/dsa/b53/b53_regs.h   |  2 ++
>   2 files changed, 15 insertions(+)
> 
>   v2: add changes requested by Florian:
>    - Move B53_PD_MODE_CTRL_25 to b53_setup_port().
> 
> diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
> index a9b19451ffb30..38c08f6278d27 100644
> --- a/drivers/net/dsa/b53/b53_common.c
> +++ b/drivers/net/dsa/b53/b53_common.c
> @@ -659,6 +659,19 @@ int b53_setup_port(struct dsa_switch *ds, int port)
>   	if (dsa_is_user_port(ds, port))
>   		b53_set_eap_mode(dev, port, EAP_MODE_SIMPLIFIED);
>   
> +	if (is5325(dev) &&
> +	    (port >= B53_PD_MODE_PORT_MIN) &&
> +	    (port <= B53_PD_MODE_PORT_MAX)) {

This would be a candidate for the in_range() helper?
-- 
Florian

