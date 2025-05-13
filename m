Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757CF2576
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 08:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747125914; cv=none; b=rQvYc/AkyL3QmhPczNvQPZMFD+nl8AGPjoIgbQfy4kO4UIJ4dclhA5ye9Ko+jp4sqsuIdj34Pj0n8oB2cdj/4wNFT51MQtN52T/5G+bjl5NNLc6Y8nxbk+LvDNDl4RAm4HhH60HUT5YmsLPf3d4ZfCRkDp5vStsY/aasMCO0WaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747125914; c=relaxed/simple;
	bh=vpoQitMfAL/hfaSGmGDXYFUyU5ltUrGJnI0OuEL35lw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=oZwUuSGE3XWg4HHy2jtB0clvvN/d1RHCdIeoTX1tf0kU+KF/aZjYU/fYEhz484ds22bNQqlxIjyyEa+GIbhJyQdYNXmFNpG5tRYpbfsG6qK9eDL9s29rfel0igEtJ5VIss8lb5sgHxyNnOMhtjF44joZy5f9mCC3Rxu8j1AYyqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=B5ypiNST; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="B5ypiNST"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso57069475e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 01:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1747125911; x=1747730711; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hCvGZyLstKI0aTUegSOBAG24suthQJiUvCnzzicNsSE=;
        b=B5ypiNST7Q9s4Bx1AX6qw9ECeIMuRFu9JwewRkg3SnSugkL6jlF5sLmuKklCrOr7ps
         tBRhc5zvhBX/aeKewiYykF2sdF5daH+Vkjn10fdnp2TYp0hQdZbvJFNd2OrHqDAelgrz
         8DdvIY0dEjdPNJkOaovgVsy3H8lgeGdjy7ho8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747125911; x=1747730711;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hCvGZyLstKI0aTUegSOBAG24suthQJiUvCnzzicNsSE=;
        b=lVe3wo1S7hBWbyxTsEB+Q7MGJExyDuELDGyVXWmmvXXmW3JPL+4Md737HV84HjE+Ln
         GoH7NE2vrsH7Gp33FSzEBQHXghFCE7vw75N+B13ebQSRTNykNj42YuXp7LY33iq4tfvL
         h5XI+tIb2l01EmDxAw0/Pt/5O50AA0yfnCidORsmT1ltYSJlC2VFXDm/T0mn0cUBiUEa
         vXKlrwCYNKYfjO0xXLDSr0yttoqkV7fFWybU60Ss82z7wpo2c+SG2HiD5DO1M3p4pJ1c
         M8/ANTgMA8V+gOspM5MYezyfiVFD8qD5TRadaNdzZpxiZ2WgaiqdPXiVY/+BrRA8czd7
         z09w==
X-Forwarded-Encrypted: i=1; AJvYcCXwzgfh+YLYq0Drb+H84JITazQUbRCyy1UnYNMIwzxhHjkk8BMQ6Bf3Jbz0D0PJFTm9eyYLvCRJ597HcSE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuwQ3pQVJnc5oYCvGajYuYao4t6yJauIkZqlwaHyv0sXs9L18A
	8WByq2c8PdTN+VKlke508T8Ti97j+10RWHiu2gKHxn+MEj5yu4/GPL2P2eKNpA==
X-Gm-Gg: ASbGncsYER1c2MUb+lMl3Utp44vSa9S0ADL7OTykpJnSl/iJ1nJpzYTvJlNAo6jtGxR
	30vWNf/M/l1vZOCSD0oYYbsHff/eVgeUWWrnRDVgHJ7NEEa0J1pNFbGy3YL1uRTt8C+Cxd4ZnmN
	vEcvTbE/fp2Msp0dwAOzWLa6iXzur0hNUCWM4MzNWWFPOA/5P+DH0M2yWV4HOESTmvB3zXVzaqG
	gO/tKYkl92CdlKJPKJdJLOahI8P5HzbT3DA1n4gMTQmcKX56NyR95ayz+TEAgUvQcMTPxqFCZj8
	Axei515zrRN5KGksIhsaxVZhhSNI5Pcs9hQeLgXMdBMAldsjuC0tXCxzYMRKZKSm1a+AUmy7NAY
	I1hIlBEKz
X-Google-Smtp-Source: AGHT+IEwdZLZham7tCxHAfy6+RE0zKPKlxC1rlZdRDhmdgO4tQMzTMoCShAbJEX6bIpz/LBo8oIxKA==
X-Received: by 2002:adf:fe41:0:b0:3a0:b6c3:9bab with SMTP id ffacd0b85a97d-3a1f649b357mr10490206f8f.41.1747125910783;
        Tue, 13 May 2025 01:45:10 -0700 (PDT)
Received: from [10.229.41.178] ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f2b29sm15580950f8f.53.2025.05.13.01.45.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 01:45:09 -0700 (PDT)
Message-ID: <0369e781-3ea7-4d02-896b-ab3654e6140b@broadcom.com>
Date: Tue, 13 May 2025 10:45:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: rawnand: brcmnand: remove unused parameters
To: =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
 dregan@broadcom.com, computersforpeace@gmail.com, kamal.dasu@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, jonas.gorski@gmail.com, dgcbueu@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250513061052.547392-1-noltari@gmail.com>
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
In-Reply-To: <20250513061052.547392-1-noltari@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 5/13/2025 8:10 AM, Álvaro Fernández Rojas wrote:
> last_cmd and last_byte are now unused brcmnand_host members.
> last_addr is only written and never read so we can remove it too.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

