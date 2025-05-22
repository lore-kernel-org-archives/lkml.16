Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE45221FA5
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 20:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747945300; cv=none; b=DoaG7Id3ZuazB/VU2q9e4iYGSVnWUVxo6fKHWph6lBd/7haiZtOL/QBR/4nr9f3exRSzk4x7m7s2Q6X6NF8udSponaJhzDLUcqVz+swDSx3cFn3SLUPKi3qI8kJRDFHXSHiBGezOQIsrLsF5aGXiFOFMJ/EB5DDp8WyDtbi0vCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747945300; c=relaxed/simple;
	bh=C+HddV3dWrxO+zZIzKiR0mbeSaPT4T/kAf+7rTEziO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=TIAgQ6N6XbbjxL3MnPSiDapEjkLEFYTY7RgexzPQFuH0w3vJBB4l0aYovEO5XnNX59P6QrsRnl5PL4l/EDkU57pvPmS4UeXqaS+Y2uYQXcHPM/MovVFsPYJ7em+zRj2M3lHka0yW4DufC00HZzFbXTPcDYBd5g7ECXOlPE8ZodY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=byxaRnv8; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="byxaRnv8"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-74019695377so6197658b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 13:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1747945298; x=1748550098; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Tm4k4ovRqOoI0MDP4KWD2K4fuBBJ8zeOAXfHx9a9JHw=;
        b=byxaRnv8YpMoIITws7k7q7QrPfTO+CICmJqe8CVpEEn0wfuqPksnCFrEIkvwzomS56
         fTEuvJTYy7EYQbvevnC/PvHXPcjzImNDcfNCBLK+ipJSPGZRuiEDW/CGUflzRYDT8viZ
         3The3+4R2Tnt17Giffr0geHA8/++B5bVqJAqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747945298; x=1748550098;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tm4k4ovRqOoI0MDP4KWD2K4fuBBJ8zeOAXfHx9a9JHw=;
        b=XX4phT+1/lc7QrFIxRPXahf2a8xwtrShXIOHvGERgAkuOYQYZotGNrJHdcAXMmMjfR
         XEu3g0z75IQ1GJifjM1R7NJrcdQ5zNcdl0aULn85992mG/5qmoZEr1GJhAnYdKGHkoH+
         MNZkSXeBn2+7cn0MPCsAW+B145LAKIS0/PtrEBErrkFp7cAI0kBNeAMOG3l4BTMaZzhY
         D1P5r09pCc8HPs2MrhNlETdaAnKi6zsHFmEjCpzzSXoT+5YQJh0MWhBInmhxes3xvUN0
         ld/6TVgbuHoSKrn57eCprGIOdShfTbT0wbQlJqJGBhGF+mwDEL/Yez1GkisdrPrbwNWb
         7tww==
X-Forwarded-Encrypted: i=1; AJvYcCVTUrHfeVYMVVG9ncBe9JbPuamiiUCP2Z+/Vqg2quIOxx4PcNqrC7oy/u7e1yIeKWtFhtj5Y4GRwpHbwBU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo5HfYElZL47St2ADGraUEPicMenpoYlI8UqMBGUOFpo/bRJBG
	FmEeyBv2jtbT9BnmIptq7jSgHxEXZMfsXfsJevK+4yG2esC8jEn0PbsPdOCuVi93gw==
X-Gm-Gg: ASbGncsRQvezaRO1ExCGXcV5blJ5udqgZkLEoAsZK8jVUtjJkTn+5xc1g7gjj3sW2x4
	+kuDLmmXfNa68w+cjjlmmaqhE/IRKY7Fr9qSwYMvti8sYmcL8WX/NJ25KqN5w1Zw5y4r9//Chr3
	3UkX2HnxAbIKLXciZT9GRrMyl81oxfbPytzHxQvp+0/uDcE0EAH6Ds8sshW6XFCJPvGVvc1HVci
	Fp3DpSjPS17qzK7qz7b1KpykIg9De7lMWI6s4+8IxbRksQq/wcT7dW11U3D/N3DYns7T9fNu1oY
	Hd5tUHe6mc8lO15cs5cjoLIHJFHuSKPjGlnhCwJr3bXMMjLS4Vgljymhv5r23fYUB1hsXhMGXlT
	xTm6aZMX+Eq51nL4=
X-Google-Smtp-Source: AGHT+IEaTiXQ8DcjsheamxqoCiITTgF5Qwn9UxSlMyPIr8D4XZpnBsIW9NefScg8Yg/LjcEtiK6AUA==
X-Received: by 2002:a05:6a00:2e9a:b0:740:9abe:4d94 with SMTP id d2e1a72fcca58-745ed905b34mr653721b3a.21.1747945297901;
        Thu, 22 May 2025 13:21:37 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96def68sm11661081b3a.30.2025.05.22.13.21.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 13:21:36 -0700 (PDT)
Message-ID: <551fae31-05c7-4555-85cb-eaee2cc67691@broadcom.com>
Date: Thu, 22 May 2025 13:21:34 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] mtd: rawnand: brcmnand: legacy exec_op implementation
To: =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
 linux-mtd@lists.infradead.org, dregan@broadcom.com,
 miquel.raynal@bootlin.com, bcm-kernel-feedback-list@broadcom.com,
 florian.fainelli@broadcom.com, rafal@milecki.pl,
 computersforpeace@gmail.com, kamal.dasu@broadcom.com,
 dan.beygelman@broadcom.com, william.zhang@broadcom.com,
 frieder.schrempf@kontron.de, linux-kernel@vger.kernel.org, vigneshr@ti.com,
 richard@nod.at, bbrezillon@kernel.org, kdasu.kdev@gmail.com,
 jaimeliao.tw@gmail.com, kilobyte@angband.pl, jonas.gorski@gmail.com,
 dgcbueu@gmail.com
References: <20250521080325.581366-1-noltari@gmail.com>
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
In-Reply-To: <20250521080325.581366-1-noltari@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/21/25 01:03, Álvaro Fernández Rojas wrote:
> Commit 3c8260ce7663 ("mtd: rawnand: brcmnand: exec_op implementation")
> removed legacy interface functions, breaking < v5.0 controllers support.
> In order to fix older controllers we need to add an alternative exec_op
> implementation which doesn't rely on low level registers.
> 
> Fixes: 3c8260ce7663 ("mtd: rawnand: brcmnand: exec_op implementation")
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> Reviewed-by: David Regan <dregan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

