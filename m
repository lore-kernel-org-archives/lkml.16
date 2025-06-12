Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4722D3231
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 20:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749760174; cv=none; b=UD/oUr0syPu4I+41Yjs3X8AAQt+l6drIkvJ0PjyVTar0pwUp90+kwtacfXL2QOALfFNsmUXAE0mTKVqq8Wql+aNb3VGOoQzEPMw8Ms/H7tmlUl0PCYT6/XIknS3FQKBC1TsD8N3cPzvyEYXYFyXSQsAzANXEUIKOWxH5dXEZiOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749760174; c=relaxed/simple;
	bh=FKMoZJECdM0Y1gdOA2xCgCEZ65tmCjn6qGx9caRpRXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=b9WmMOpzvltiRwP42IfTt1Axg6rMzgL3RVgFMpgugR95pxPdlZuxHNM/WZm4gAc7UjWcdhjPesSKCIXSz2XP6EGjiSrYHXux2MzJunlOqsK1HK4UpaFmfgvgDfaKiIMPCHjuToUTt8q3pftQMtqJyhCq6Xbrp9zW1AOikvx6bgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=h5oNK+We; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="h5oNK+We"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso1344121b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749760172; x=1750364972; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3MI2pcC0X8n95TeRsQHH9r4MVxCi1Go30tv8Z8JI5jU=;
        b=h5oNK+WeckVdnKJnAOkwl+WC7RNEuDuP5pEuOcBjUVUYofTYsuhubaXbdZifsjpFBa
         cXcbqvHNzCZ9jK4ss4ox851G4DLEth4X/jaj7tOYdOx5ADRtzjKl+jYqzSD0BOtm+Vl/
         cIap4eNLeTZbZgeXQoqpO1LEgrQszaU+Qjnz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749760172; x=1750364972;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3MI2pcC0X8n95TeRsQHH9r4MVxCi1Go30tv8Z8JI5jU=;
        b=Qz89RXLONxeIygpJmaDcX54UoDGruJgYZADTh8wD/Un6qIYdOdOdRT09SOIIvhSJRu
         XLOPm7njCDNeEppog5qZo1XNQH0PCN4z/kYxhKr+hNwhYphq6p8c5v9H3DyqGNelWzbg
         /aTGqGsq4g0W2zSQjYeLJ2Ad9Cha1Mc4MfKlyJe6GDGSvow20nyHTDQnFaIsXIN8NFM8
         2UJ41IJMdo9qS85WkCkLdVPyKj9/k+KAgs1FpGoRBdLnepnjEeL3cNfxRqq9rSucdrud
         0l+nNjARJ4rBIBjhQvKTncVWPSp3rWERBeokRhtHT3a5/V+d9QhZDRqb7y/T8KCpse2c
         ipdA==
X-Forwarded-Encrypted: i=1; AJvYcCUHdXtVm5nBJqrzgn2hN6Wka0KLbNoxa2MWdD0xQPolzjVmPQcVvDEa3if44EOuxNowNh5BLa0mxKouoQE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPZLTzFJkIT3Obt5K4ejZ2XoFDeIZM4R8NLegXGzg0fO70e20g
	J6NAoA9D6+QyqVJtwnITo/o7x2l3QltLsT1SoQrn6d67wjn9l7Ch6NQHSHFPilIDMA==
X-Gm-Gg: ASbGncux5kpnSpXUagWDU02+Oi/b20HlVWSQ5RsxzQkTq2B/MvdlsNXIwoOXL3ORw9o
	YUEWALGOSl9NUPP/e4QlCiOS40PoXVdpKcNVkRo3lwc3nL2gLWsEGGeAv1JuZ9HBlpgcT6DOUUw
	cBmAlfFEclcClsg9baAtCfIvhEAYdGRePZrZ4jZLf4UfBs/DMgW0f7PIRTjlvAcb1gyCRSxs1v4
	iZFxuEjTymdj4KhtTFjHxaK1x3U5Wj+QkFn6kRokMGqs0HXuTuXb+k1/4l5ggHi1IjRD6IzYGEw
	61X9BpkkOs4f/mNBr4/B/hqRQDcD1iEWFSO5aqslbU671RnN9PXVQvIlihCDf11rbOZ22nz75SI
	YfPE00/Hs51fLZHqHWOIQAMN7/lm/E/VsWRec
X-Google-Smtp-Source: AGHT+IF5selXWddL9qk2dRvPSKlCXwJgSPy5ahHww4/tE+LiEmsDigxLYlPWNz+Az+F/jRpPfuKpmQ==
X-Received: by 2002:a05:6a00:92a9:b0:742:a5f2:9c51 with SMTP id d2e1a72fcca58-7488f7dee54mr777278b3a.16.1749760172615;
        Thu, 12 Jun 2025 13:29:32 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74890083c0fsm150721b3a.72.2025.06.12.13.29.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 13:29:31 -0700 (PDT)
Message-ID: <35ee652e-77c3-442a-afae-c491298bcdae@broadcom.com>
Date: Thu, 12 Jun 2025 13:29:30 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 08/14] net: dsa: b53: fix IP_MULTICAST_CTRL on
 BCM5325
To: =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
 jonas.gorski@gmail.com, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, vivien.didelot@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, dgcbueu@gmail.com
References: <20250612083747.26531-1-noltari@gmail.com>
 <20250612083747.26531-9-noltari@gmail.com>
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
In-Reply-To: <20250612083747.26531-9-noltari@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/12/25 01:37, Álvaro Fernández Rojas wrote:
> BCM5325 doesn't implement B53_UC_FWD_EN, B53_MC_FWD_EN or B53_IPMC_FWD_EN.
> 
> Fixes: 53568438e381 ("net: dsa: b53: Add support for port_egress_floods callback")
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
