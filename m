Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B621EDA2F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 21:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749762450; cv=none; b=aKKs7JETUcFMvhxcnIlE0eGcVsIxQu2h7Kh6J7zx9P4VJpN6yxcOvW0x70eut6WUQX5BY293FaE0wrALiycKQoYDPSUJWdjkxBEtkXstjkKY7dAtB8bchI5+gn6ImOxwwjDncgmGHNKV5i7OSUDxnjIXvfhDs6EPYLOW/Tr0uBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749762450; c=relaxed/simple;
	bh=rWNXl3IHYGgAKJoFC57+PCqBLoJHH95yKw7d6MugvOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T5aSwiltVf19yybm90jfNuPMf90ytUiiGvWuDBGbJxg+HCUE5yTXJORm2Wv7OsY3n8cJstT913xImzoJEsxvJgW6uaGI3ptUTw46gSz21w4CUcip6a+kQ6MpEzJ/Mi1aYae9Er6ohPPxjj5Rz0MTK0G3p2ynujPrydhxsNmZF2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=L9WU9Bcm; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="L9WU9Bcm"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b1ff9b276c2so909623a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749762448; x=1750367248; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=W0lmTDRLI8YSa8DbojHI/Oe82rrwXlBELS4DXEx61Sg=;
        b=L9WU9Bcm63OdGNiG0uIGBt6ax+83gc3i4jobkn8YpiHwKmoSqsGTyLNNlM+dnc/L5l
         BDc5KCysSg+f+LRmg0x2O7DT6+kyr0cg8XjXDCh+dMdvnKWXbdl9kgXxrxbpeBltVx3z
         EOKI9UDvCSmhicn30d8CmL63vMCEEd+xRJa+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749762448; x=1750367248;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W0lmTDRLI8YSa8DbojHI/Oe82rrwXlBELS4DXEx61Sg=;
        b=KQmDsrf8K69AgJzUe4/U3SP+XF3H0nF+wCgSi/RgqMvpeyMHzicdnDc27C1uwSor/N
         id2Jxa4SIzou8ByvvZiGXwBEi8hIBJTpIGdv9BgUkGYgqq8kW03xgAgbWkuHtfZuLdeJ
         0NAuZApLJgVkHLgJ68zqa158S/JRiDgou2+RVwmM0bzi5sl4nLCnCK7niqrkKb2qtzq4
         4Qx4PMBtl2s/eq/YedvQxaHthRYgQB/wWBFZdcwretkXx6avPROwoimbuaZCaF/RMXD1
         jkrKDN3a+vbKapBvM7CtiO6bRIFs6mxyvkr5DtU/Jw6P0bC292i20hSTftE7PSHfsNKx
         ff9A==
X-Forwarded-Encrypted: i=1; AJvYcCXO29aprrMrEqjNEkoaas+wnur6gFEf1QokLq8xTyheI+BeUueBBmFJnt0tu+8PxRfa6HFePjoy/xmUl7o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7NedbGTtv+Qd0727P1BiE5DPax4aSGFZNZyeGDmey0ZONqaxz
	Nyf5f6RVhmqgM+j0Z5o18HPah7fcsxvPsheisAwdDphMC0AWHYqNoqVEfGT0ipff2g==
X-Gm-Gg: ASbGncvdiReDb7RIZjAD0AYLUgtdPZAX1So0zmw5qi7Pc+TgfM1/UF6t/N0z0d0qQ0d
	D9sCywvwAKVucSxs6/GS0z+1ko5MMJDLhAR8sBg9Vj7oPqc1WY0Opwj3G6OrNv/eOH8rycZ8RgU
	ZaZ0chsmzsFQgiMx6ajOvzgv4dKhzZizQqj8aCqlOd2pod3v2q+nVW1wl43lj/L+OV9knblxLLj
	2cbE/UXAtUUxNgYQlLXD5dpjfgYTK71qUEhRJslq6OgHBkVnJNv+iNPdhGTFe00fEMz5CUmaTIk
	dcRR9gtIVq7gsBywuEp+3JrFbTAmO/zTPVomC8cmOheOqW2M8VJubAop9SZxV7rCLf1PCbXiR3j
	CrLC5CX9fRwkYViaIptQQkAbu+g==
X-Google-Smtp-Source: AGHT+IGy7J4LJG17HdElik0K093jD34OhbWPPCxmFo7Z86v66BCqauWUA4RS6qBdFMUY+CPjPLLCDg==
X-Received: by 2002:a17:90b:4cca:b0:312:1d2d:18e1 with SMTP id 98e67ed59e1d1-313d9eaec5cmr710513a91.22.1749762448153;
        Thu, 12 Jun 2025 14:07:28 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b5129asm1985544a91.28.2025.06.12.14.07.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 14:07:27 -0700 (PDT)
Message-ID: <3859859a-c86a-4878-a825-2dc7261b93ad@broadcom.com>
Date: Thu, 12 Jun 2025 14:07:25 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: bcmgenet: update PHY power down
To: Florian Fainelli <florian.fainelli@broadcom.com>, netdev@vger.kernel.org
Cc: Doug Berger <opemdmb@gmail.com>, Doug Berger <opendmb@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, open list <linux-kernel@vger.kernel.org>
References: <20250612210449.3686273-1-florian.fainelli@broadcom.com>
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
In-Reply-To: <20250612210449.3686273-1-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/25 14:04, Florian Fainelli wrote:
> From: Doug Berger <opemdmb@gmail.com>
> 
> The disable sequence in bcmgenet_phy_power_set() is updated to
> match the inverse sequence and timing (and spacing) of the
> enable sequence. This ensures that LEDs driven by the GENET IP
> are disabled when the GPHY is powered down.
> 
> Signed-off-by: Doug Berger <opendmb@gmail.com>
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

Sorry, my script incorrectly rewrote the address while applying this:

pw-bot: cr

will post again tomorrow.
-- 
Florian

