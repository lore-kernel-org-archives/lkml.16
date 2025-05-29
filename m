Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB74218AB3
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 21:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748555332; cv=none; b=nfMEAPasfcqcljniDdRxlj5XmOyBRjUcfD7DR4ssADCbc2m3F/7HYd1WHPcSERVkuY+aQArMZey8ZKdCMlWfGorjvd+G8HLMdE9PZMdi4S7cs4UPog0Tt23l1nFBVLyDc5ay0jZG2Hcw4TrwmE0ymsel6MGlVuE2yJyRdvlVgaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748555332; c=relaxed/simple;
	bh=dJOYjPMUXFyM/9ihamvsM91Mu+OZMNo9b2u4FSLpFgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MetTQdY3J+XBkbP082bR9GJm1aGr9QnMEBv1Sh5qTgTO5xqaI49uLIjbmxuYgEbUJXJypiExVO+Z4ulqtBI9UlfeBAmuXrIbIF8/lfWp33VEc3v3vPe3NzNTNZOkasG8fYWgYMDJ2UZvpVUHdUNVsDsT9iIHw6lCeg3iNy/0ju0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=g/ub5XcA; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="g/ub5XcA"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso975833b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 14:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1748555330; x=1749160130; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X0dZteGZJJIJ9Qm1S27Qbb5Af2ayRJsCBBhcuN4pSnY=;
        b=g/ub5XcAKwW107IpP6u20lENpTTnGpZ4c+t0nNgkkDa+u1OBAub4EkXWhK3HnCtZ+a
         b6Y8u3yuJ36GYrsOF/1YIf60qit/y5ZcAFiAggUbc9XTeTo+igHz1Dj+7O2w5x5dGTB4
         49jp+gJf3GPWAmZTpGESHsbcYzhdru3a2Hebs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748555330; x=1749160130;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X0dZteGZJJIJ9Qm1S27Qbb5Af2ayRJsCBBhcuN4pSnY=;
        b=pm7kSPI4YFXxdBjgobUfZV88PpPHu+7lfawolEck1Jt3CAo6qoun+5SGBNQG/jxzgc
         ePLAwFg4LyO7ReCmvPCPvvsSf6NBioqdcgJ/QUzULUByBS2SunZjkJ2Q1CQ0rEVMG4MV
         OPQ3H9MhcsKDfj+ktOd2hecTdv4M42epH3oJHnBNMJjZwowqQYZ48H0OGjs+BcHWiCTg
         7o7p+RIkDc+eHNmu5Z3p0Ma91sNyEluLTEYwRnTv9nMpb0dCJxqNIqH4jsOrXaLESTW2
         aziJyBfUDvlySwqp5a3yFM+W+Am6Yy6aMOswaur+gw7SiySB41FQnjRM9j3e4sgi9oE+
         lW/Q==
X-Forwarded-Encrypted: i=1; AJvYcCX3aZPtqjbdSbxf9OyMgQBL5joYz/68EEfdZ6apmz+ZUP75oev8+QMKN07YEsnZhQabcjfPsc4l69Kbnqk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxbzbXhnsFImTxZ8QHIwhjIm9c4eQbN5BHsYV1vqzFu3hCHrwW
	VXyiFmBQ5DSArX4lhC/dRWrGIICndC/Dgo0ryROTfhYQDSpkKonM5KQnhqj7jZ/Rsw==
X-Gm-Gg: ASbGnctG4cpseKiqqZlZ1ggW8rBf1ibT+AVYQi0dd/Z6ln9xaAdARR89l918V76jjBJ
	89jDrr+AHZeqhZSOlumIq1GecYU3N8QwXpO1VkuUFxzKVjk/bRfbBZQ77oaAwfc4bzcfXzpGoM/
	9Z2/39VZkt7zcFe7lAYVg80KDQ4A0PLCuwN9qGwm8mqMCY4oVsgbnJsqW7qdx4UzEr9BPqaEFWC
	+U0A8mdyFA9hcVlq4u1spzJ2WsdqGPjwnfVlymwdHFlMMjZEEr7IkxSvhIDnOhtnqyjpkz+eshv
	btKkKtFJnJRHBRebPMdeKYY2RbsaPEWgxH241bHc6sofV22wuSW8fW0gPMfj/4OBRluA0s+5mIL
	I5FKQvQ6blBKPof4=
X-Google-Smtp-Source: AGHT+IECQIFuFJQIQo7spxow/4rGedbVwpZnB5OC15Us4YjxIv3h8MLW6G8nfxsK55TvvCyuYzkq7A==
X-Received: by 2002:a05:6a00:b43:b0:742:a4e0:6476 with SMTP id d2e1a72fcca58-747bd954bd2mr1371245b3a.4.1748555329862;
        Thu, 29 May 2025 14:48:49 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afff70b5sm1786617b3a.160.2025.05.29.14.48.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 14:48:48 -0700 (PDT)
Message-ID: <31ffaaed-b52a-4756-a53c-103b09241582@broadcom.com>
Date: Thu, 29 May 2025 14:48:45 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: bcm63xx-spi: fix shared reset
To: =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
 dgcbueu@gmail.com, william.zhang@broadcom.com, kursad.oney@broadcom.com,
 jonas.gorski@gmail.com, bcm-kernel-feedback-list@broadcom.com,
 broonie@kernel.org, p.zabel@pengutronix.de, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250529130915.2519590-1-noltari@gmail.com>
 <20250529130915.2519590-2-noltari@gmail.com>
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
In-Reply-To: <20250529130915.2519590-2-noltari@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/29/25 06:09, Álvaro Fernández Rojas wrote:
> Some bmips SoCs (bcm6362, bcm63268) share the same SPI reset for both SPI
> and HSSPI controllers, so reset shouldn't be exclusive.
> 
> Fixes: 38807adeaf1e ("spi: bcm63xx-spi: add reset support")
> Reported-by: Jonas Gorski <jonas.gorski@gmail.com>
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
