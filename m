Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD83421B1AB
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 21:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747690834; cv=none; b=kju5I3+3gprYQ1JjhcoxpTOT/ZqoU16qFwpmcn9Kd44FKuYlG949rCbsfGbtwkfLgYrMugFRfRmHPsJebXpNo/dm0WJ9GnXSnpvuQKFCebDwj7LrI9U8Uf/dSClt6+4+LqQdeE4A0SyxqwSQgj0DjNnUN4jfsfaZ2XCNBDvrNj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747690834; c=relaxed/simple;
	bh=oIfRgDUglH15RDFX6FUWMJCT/I7VXAZOuTRM1yN+y18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZH2lT2mTtfDlK6XyR11fxa9AovQQLLVg6tP++bYcKb60c5IPqU4guuN8Bu9KOCuyZsZWmHtozEBxzXFj2pBtejfvXSnYsOGLZbVsIhjok1AXSe5qcrb/AJjAkkfGJuGderVUrNeqmx4c9G5VhIhVpHlUO/rLOIloxFFhgQljlLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=BP5QjnK4; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="BP5QjnK4"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso4470800b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 14:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1747690832; x=1748295632; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p1ytQ3ZSF6xMpjwImDstqOwa6hZjNzIRjCw1TOvbWjM=;
        b=BP5QjnK45npqvtyzfo85V0SNudN7bhKZywmXkTIfZ9jOJgYV5i1y+K+ZuA83eOLdZo
         QuKa5snmw9pbbBnf8IpwFVOr9qbt7iIWY5Rh1WkoqRYkms46D+E2daaZsvH5jzuwsjpL
         3HrVVB0x0ziavkIh4RbrThhimjOqkxm58p8b8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747690832; x=1748295632;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1ytQ3ZSF6xMpjwImDstqOwa6hZjNzIRjCw1TOvbWjM=;
        b=JW2hAu6BDgSVQppLZMul+XiIPGCjrZXXSEayubKUoUNUnwCxJ74hA/vzv0hor8FiMe
         PblX/gJthoHwLLLe5NQFdgYUKXcLoAk+atQ4KC/KWkhGK+2mS01QMeOyTUT4QtUxgksf
         WTa+0TNPg8UTRw9DLt9wnNxlA1cE1SYqM3apk/8+yxoe6aAnCmoU7Cyy3uFsr9J6cI0I
         0/npJVTPGxwe6qY5rnOBUjTxVRnKIlOxS3pSR1Ai0V61f8FAoDwe79rJRp00Q2Bl80R2
         zcfnWvPpkfV9Lt3Yb5lzc6vpswxiktQN+yPuKqHUq1lwx+AmCExPzUNRlrIfGyRM0Ma0
         uEtA==
X-Forwarded-Encrypted: i=1; AJvYcCXHsFyGBNCwty0dt9As/TuRC26CNgIxWWnhxd94ViPzUzQix4mxUdgYnChOhzk1Wh3/W/lfeKc2NGJGL0M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk0iq6EowOLJUA+qD5MnWvlEU0tLmsX6Tj4jKSbd3DrrrA5vVm
	xI1jRW8tGRdDtf20d/ifeVdcSNekWCiIwTyp9/CpVJk++/NM31jmTsmtRq2OPzf17w==
X-Gm-Gg: ASbGnctpjwj1CBsI2yGj99PnXFF+cBJdgkZJhQCMlTXmeYHt22BRT5ZDjwL8wnE8b7M
	e3j/7xezCSp/Pw+U8bZDIq7AJDH+GB4wirmxcy+6Ugtz+8MpMXMQCScSyeJlBYlLwEK8cw0XneY
	xjUTsMOt/TDZwpcjkquPGLhHNXJxOXTxPKrsysVP7dGBgYnbh5x10t/XnVBQwAtO1fz9n2gOOx0
	Y5wSxwC3sks9V/xA5S6NcBSZJWBUxkumUgY+PVX4aPPvXYS7GyjZgDcHxqqA9GpyCBkk5gGeHmz
	nRopLE/4CYu8ZWBUOWDZJ9og6mhWEtQ5zRAlxm2EkdAVGXk9MMtsC/BhfGh4wBfL3Ypkcs9CTOm
	FwSMILDR1Lv2n+8Q=
X-Google-Smtp-Source: AGHT+IEDpQ8allIz2NzqoT6TUd9rpVbMNYS2IJErvGixXKVt64Sad0TM7dPPjfUiC8WN5bC8Qmjdfw==
X-Received: by 2002:a05:6a00:ab87:b0:73d:fefb:325 with SMTP id d2e1a72fcca58-742a9787708mr19862538b3a.5.1747690832107;
        Mon, 19 May 2025 14:40:32 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a98a3167sm6682699b3a.166.2025.05.19.14.40.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 14:40:31 -0700 (PDT)
Message-ID: <51159d75-7e13-4aac-89bf-302415e75978@broadcom.com>
Date: Mon, 19 May 2025 14:40:29 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 1/3] net: dsa: b53: do not enable EEE on bcm63xx
To: Jonas Gorski <jonas.gorski@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250519174550.1486064-1-jonas.gorski@gmail.com>
 <20250519174550.1486064-2-jonas.gorski@gmail.com>
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
In-Reply-To: <20250519174550.1486064-2-jonas.gorski@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/19/25 10:45, Jonas Gorski wrote:
> BCM63xx internal switches do not support EEE, but provide multiple RGMII
> ports where external PHYs may be connected. If one of these PHYs are EEE
> capable, we may try to enable EEE for the MACs, which then hangs the
> system on access of the (non-existent) EEE registers.
> 
> Fix this by checking if the switch actually supports EEE before
> attempting to configure it.
> 
> Fixes: 22256b0afb12 ("net: dsa: b53: Move EEE functions to b53")
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

