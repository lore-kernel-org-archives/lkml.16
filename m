Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874EE1DDA31
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865756; cv=none; b=WGQGqfPJIvMkrko+QVbcS+kJMJRJy2sxnspUAY6LjSIkKkJ7M8iSo/Qw5xr+nqvkx2XUwNTBgUlh812obYB3vmBXE8uvHMK7PndYYhuHQTCr3q3JAm4PmIenFUg912w5yFq6QJzsPX1ur40WJzroRxwPIJNXwdmEeQb6P6n9iuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865756; c=relaxed/simple;
	bh=Nis/b+J0SYgvYxZLZB6eP4P2aFM4J5YLZiAl49pRWwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S4pAB0spgFrCIBVATkfw1aJDuXKxDLuA2uUz1JIXc0rJdoDJNaqaAM7vtOWbNieoREvOAtgzqLXE2HH8HFQm/2+6EygD900cDtpmroefHXmkQb5bWHwL+ghl0adfv5O3VbwECFaeAPZsSSzKEf+uYVFG69YMxjm0G7ByGCkj99I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=JU/EQGz2; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="JU/EQGz2"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-71e1d7130a5so648132a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738865753; x=1739470553; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rNbgEviF+CZn15hW+HgAJQKpAxd8bo6rNEtjiUZJmnE=;
        b=JU/EQGz25DYK+hC5SIP5mFh4Uk0Juj+kD/QI3iEbWiG25q9guotkYqQFckqfVaKpoy
         XIsEXGxxjyAXug9v1MLbetiqM7uI7Ku1bP68RrGHLPiD0JuqAbvg8+Z6F6FRMs0zljxp
         cRLYvCgcU54urajPejsX3NrNrpnGu7zJNqc68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738865753; x=1739470553;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNbgEviF+CZn15hW+HgAJQKpAxd8bo6rNEtjiUZJmnE=;
        b=MAqDttyISrn0EhnIIIA1QrOoLLejwdYYIUBSzDxsCUG6lPD0wI6SodVE8Kk/tz0Lgr
         +v1Y2GJQd25CHhxt6fDztlX9XUYlf2sydQOiaKMLl/X6PemiQXY4fGSIdb8CnGU76ovj
         RGDu+w4B4wYNkK1T5+s9cOcAXrlfwGsUzBZif1fxavzWJoHlGycHqf4h0K/XLqOvjFp/
         pimKfbYKMFJmDCXYVpysfvdk7R/3Uy3g98k06KZBJTEt1UDCOrXeoztY3ISBHMoD5/Nq
         +VCJoKaL7Hcmr7p8nhZorG2DgmgFGq0RSKOdpVB4Falnhq7SboAe9h4aVAfJK0xEBR5w
         N4og==
X-Forwarded-Encrypted: i=1; AJvYcCU3H2dlFny4HIDCb+js8FPiGzRuLK4n0eaUCnZzzsPjO7bp2j2Kp2iRu0OtWgl2eN5dwk2zAXdiojSOchY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1iyldrkx6hL1dSUwXwCyoD8HJxq3nzuUoHj90fYC3Sg/ImZHa
	j0x1n1b/PqpM6pBg2SLcXKmXTFp4TCMMP9eKqPZLDQETvrIvfkZFJT+nm7kteg==
X-Gm-Gg: ASbGncvEgmFAV+l2WIjPhBzWtkQ+BQsOzkuiO2DnezT11TX/+shfK510uFfe15tu3FF
	d4OBekKdgwiPbIKThqCPHqI9CCpyTEbc/9ChmjhMeT4+1BQtTzmOo3scJp7Vgc+SAdXgDclj16h
	RNLz07xkBTYx6K+jNIw0f8F9vBhaBNJPWUZPLvN0ODDAbiSFqTBmqZTj97cu2TQOuOum8bk0eRb
	ITi9Gl55PEoLv2YX/C6bjwulGJGrXK9dWlMGHxz0DUqYSyjprh+OtasOW58h9RmC23291X3mATS
	4TSy/d8zkDMpfNrQtWXh8ZYzAm3stDJICwnlJYs8xtZMYWo3FL7w91I=
X-Google-Smtp-Source: AGHT+IGPmOIqm0XZjK4ZCqGGZFGR0fmlbWx54bBI0aPyoz+SJBkRnz/TRUo3WVBJUQrW3KZddWyV/w==
X-Received: by 2002:a05:6830:2107:b0:71f:b4e0:fa with SMTP id 46e09a7af769-726b8880229mr65717a34.18.1738865753589;
        Thu, 06 Feb 2025 10:15:53 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726afa4d2b7sm400158a34.63.2025.02.06.10.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 10:15:52 -0800 (PST)
Message-ID: <1317d50b-8302-4936-b56c-7a9f5b3970b9@broadcom.com>
Date: Thu, 6 Feb 2025 10:15:50 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] net: dsa: b53: Enable internal GPHY on BCM63268
To: Kyle Hendry <kylehendrydev@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250206043055.177004-1-kylehendrydev@gmail.com>
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
In-Reply-To: <20250206043055.177004-1-kylehendrydev@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Kyle,

On 2/5/25 20:30, Kyle Hendry wrote:
> Some BCM63268 bootloaders do not enable the internal PHYs by default.
> This patch series adds functionality for the switch driver to
> configure the gigabit ethernet PHY.
> 
> Signed-off-by: Kyle Hendry <kylehendrydev@gmail.com>

So the register address you are manipulating logically belongs in the 
GPIO block (GPIO_GPHY_CTRL) which has become quite a bit of a sundry 
here. I don't have a strong objection about the approach picked up here 
but we will need a Device Tree binding update describing the second (and 
optional) register range.

Thanks
-- 
Florian
