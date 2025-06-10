Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72401EBA09
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 17:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749574892; cv=none; b=sliwlLRCDUBxJRnfLfhaBJMTVGL4Veeao5Va+jATwOsBAg+afYd18zHMtAJENqAkQXUKItjycaaFOBqrDEHRWYzgJY044GuYbGif6xih5lWMh20y1wjPKVwGPSwdAIb+TV7FTYEJxSiQdSGC1zDyLVjWj7Xm/bllP7QqXPJ+2Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749574892; c=relaxed/simple;
	bh=ahXm0c4rtJ92rxuI7mSW9/ZW29+20fL7IwSWH1turAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e1rH+4pi9OerCk26s3sSBb2vgmbq9yLLaRBB9ew+SPsFQLbY8oUH7T151Nmi9eC1aCaWWjye9tsxH6Pn8DnPb1i6YF7VHGxiCNueeTUYgD9MNHiORPksny1fyvEhXa8Rq7gaqV2D4THjCQ9vKdnJ9dDdGz7b9QC5x8oMo2ElyrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=bVG20vhx; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="bVG20vhx"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-234bfe37cccso70201545ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749574891; x=1750179691; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GEfizgcdloDSHEfL4nwI4ypLmP1PdRkcy++iUoXBHOc=;
        b=bVG20vhxWFQxGqPNh89PpFGHOmFF751kMt+1023Cii2iCBYhUS1X+1W2FCfi3Z3GFr
         i0HnjgDZesRwvUHtstuviUNNPbKgmUkpVb1AHXM/uHdMabbn/MI0HD7G3GdNskzFcA1z
         5dhC1x/czaLEMYCtwxf+Q2/SLXE7Y5o7R2Vow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749574891; x=1750179691;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GEfizgcdloDSHEfL4nwI4ypLmP1PdRkcy++iUoXBHOc=;
        b=wHIcYVt4XMlL/crHt50TTLIta9IeFPnPVVwNcO8D/yFr/kaAV8AS8fxug6GjRxggCL
         qAPmL0+yVZLYi7k/wQjENGL1w6tboOLbUdI2phCu4ToVFT7Fvj5g6ZKf8RXUX8IGGUGg
         sMq4lXzB5oj05eOA4MXzGTNUYP0cFvpPnJftzj7L//p/ml9FlinYuzE7JwMgrZki3Gij
         VcL7HUXkyJw8TKogAEFpws3V3NaxtGio//dXnbu6asP+qTu3ax4meakgYOb+NI3pKnc2
         G5Xr+wzysKwJkxZWkGTwgdeTo86HWgYKie/3IDgJj3fNPd6N2pivzh0mm7mCJGuPWBmc
         drQw==
X-Forwarded-Encrypted: i=1; AJvYcCWBoH5bEoYk8b/AnWrYe8negJo1zdgPcTWgO7cWP82Ail5gpox8jciNPuF6FGwL/0M+1fK3RhAiVZIGfeU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFNhhtm8WsuHAy4nAOH1ji9pmOQy5e3iDd5rWgVT+w3sE6KEuG
	kdeaoYrUkQ09nxobdiR0ntJLsp8P7gEnIl/ulbRPFyJhxQT8D1SsW8ksexSivDqGGw==
X-Gm-Gg: ASbGncvFF3TAP7+9ndbsp+cgyFfRqwCt+RUUXBeSf6cNVYhiJlB9MCN8p52dd5jd04S
	y7vhGI61yrae6LtNUjsC66xvmGAjNk/eFfe4LJ7UKJguU+Cu+hM1oQ8aXZGgFer5hMrkGZBgO1Q
	ylTQKzYPWA7THoI/oYEPJHGEbeZp0Ij4SQhLedE1rBDkDPUNrVGbyyCppwEfzHhyCjCTaF/euNz
	8JNs5mYVx+DjOJv+tUuf0Rro+CqbkoVk13kH30Whz6+1XqkgHXp5kOWxlgrQRIc9mZpifgpO+89
	k9n7c2sW8vj7g6a+sZyXVWlb9aIw00Zdru2xecDI1Bm+LQLh4uChaSfyNu0u2avYgpD3dgfmA62
	3/rL7kISFDLc1ty4sNCbaKipB2YZaN9o/5r0y
X-Google-Smtp-Source: AGHT+IEDsXiBlVA7FVMENTeGgQdvLlZXNAQiUGUTlJkIvmv4c11p25UNxrdKTp1DzYF1z74E2FJZ3g==
X-Received: by 2002:a17:903:32c8:b0:235:e1d6:4e45 with SMTP id d9443c01a7336-23641b1a245mr413505ad.25.1749574889444;
        Tue, 10 Jun 2025 10:01:29 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236037ae33dsm73023625ad.206.2025.06.10.10.01.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 10:01:27 -0700 (PDT)
Message-ID: <4c580225-a1d5-48cb-80dd-14759134baba@broadcom.com>
Date: Tue, 10 Jun 2025 10:01:26 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] mailbox: Add support for bcm74110
To: Justin Chen <justin.chen@broadcom.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: conor+dt@kernel.org, bcm-kernel-feedback-list@broadcom.com,
 krzk+dt@kernel.org, robh@kernel.org, jassisinghbrar@gmail.com
References: <20250602222311.2940850-1-justin.chen@broadcom.com>
 <20250602222311.2940850-3-justin.chen@broadcom.com>
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
In-Reply-To: <20250602222311.2940850-3-justin.chen@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/2/25 15:23, Justin Chen wrote:
> The bcm74110 mailbox driver is used to communicate with
> a co-processor for various power management and firmware
> related tasks.
> 
> Signed-off-by: Justin Chen <justin.chen@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
