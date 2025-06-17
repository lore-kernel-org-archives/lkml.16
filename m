Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C072264A5
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 16:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750176621; cv=none; b=c7a7OaaJKNCo9pRbKDOaC/YBqCl8jq8qU1DJsQTmB+yt5GixXomjYvrFb+15QD3Xq0+iEtMw7hkTcq9iv6UzcnVVpSk9bNLjvrXE+9imQt0rRsnbeV6/BjKiZe4bJLJWkw+JlS1o7Ucd1rhAEY+zhplFblDaLn1qdnmrOqPb7dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750176621; c=relaxed/simple;
	bh=pVyvF3eYxxjO246g5QZE97s8sjAFnfNwoI4mCPK0V5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=p3wRddMWbFGz4zfz1klHwy7vGLQCeQSbHnE02lXkohCcMA2vVlQfNJLIGTFkRkNRTTrYLWrA7cMIbIS3QMy3vTCqGlEePxvXesJdlR1mmQZ510yxLfDuLPZLyGxPUwjv6n5nFYhakZ0Zp6VWNg5D7CrAr5mesrzob4ipxKRn2uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=O44xcvWe; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="O44xcvWe"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-234d366e5f2so78438715ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1750176620; x=1750781420; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XadhcNtxF1ej4n+cxZcsL+dzrWJT+s0macaGyzV2RaU=;
        b=O44xcvWeHiiNzcKBlWJaq80BWLy0GAOoeP8i9KeGRtW5zjYsenh1gI0xsuivv5KBc6
         RqmYVixTM/IEeje+P/vDo9PhBem9XfPVVGOgyvbRtxfUJqzecDCLv3tTEM3MbfBcMc9n
         Ecv5I8eg0Y8ymJHFlEAgxpKXoW4+P5RJ8Rzys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750176620; x=1750781420;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XadhcNtxF1ej4n+cxZcsL+dzrWJT+s0macaGyzV2RaU=;
        b=eD7VfZN1TlqNate3FnSKjXTU02WNoVQwyn1Ee5Ifyb6/RV9q/MhnRUrZSk0TMUI1HR
         nBGRMkoVZkHk91QKWmI3N4/Q4javcvzJTiZqM60eJAUVllzCZFHWX6foKYm59EEO89Ng
         DbIrlpOaSyoi7XvpEQAR9+F3/shOb7MNUhBn+sulPwrqN9L+wjZoL6eWobt6T8AalxhS
         W0Bp4vQd/EAX2aMHOYPf73BpyzuVUSp0F4J6WEkDtEvS8IGBom7Cmqf7/194imOG71n4
         tfkLsfuFau6oEPPRrHHJg7DeopJuJkATzACQVPds/tO3QQD1WuALHoCj7u76Jcv+F6Au
         s7+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXQemU5Ui6NNm64II69XrgG+zq9fr7PTP53QMLZZFK1jpgT9SvSCaqxyVkPav3ek5VYDK+t98j/1ptJyPI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd512+nXzest3pIlOhNPKIhES6NIm+QeqS8rID45ZXLw6hl5f3
	71mi6O5X34gUWAmSE14VAGyLU54JeG0CF3kX5n2p+9DVrc3yUd2Ein2W9RyjWR0MhA==
X-Gm-Gg: ASbGncsJCJbkAVSVwffMIECHqg3+HhS8f+GWX/WS4XcoDDW/3SsttdQyZAwE12SWUqR
	m66bOJiBsrXePHEUduqEB1W3bAyYi5aanmvex1sriNu82GU6cje5KKuIAQzQvLpUcy5ndbbXXHN
	ExPkEJFvcvvqiFnFIEaY1eNY4NvETmaIUtsmTRx637qCeW9xvGrEvaw/iVY5oQN1fh8xJ/k54PX
	p+B1qfq/PDPVa2rwlUlgm5JaJPoDzR4YmOEOIxfkWz7bssxk61bCe4+HU6cZTXZyveP0lHV1zZx
	vpnqZXZCR4N5pTLLZeSCs81tteDTG1pLZaUv7Rpo4WHjF7HpVMMASZWwZee2nhlT32Po2Xax8fU
	SU+01jz/MP/MvZUBFGjuy72Sc3uxlmXZsRLRz
X-Google-Smtp-Source: AGHT+IFrnm/6g2DdRD4ThsyOlmM9n95VHHRp9LotSb21QFKqc3Hyfe+DmATQ1RwzBN8km8ELJ/9BcA==
X-Received: by 2002:a17:903:22cd:b0:235:efbb:953c with SMTP id d9443c01a7336-2366b329f4amr187483075ad.13.1750176619593;
        Tue, 17 Jun 2025 09:10:19 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d88d921sm82016405ad.40.2025.06.17.09.10.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 09:10:18 -0700 (PDT)
Message-ID: <3b0d8a90-7312-41af-9ac6-9128aef2cce9@broadcom.com>
Date: Tue, 17 Jun 2025 09:10:17 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 04/14] net: dsa: b53: detect BCM5325 variants
To: =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
 jonas.gorski@gmail.com, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, vivien.didelot@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, dgcbueu@gmail.com
References: <20250614080000.1884236-1-noltari@gmail.com>
 <20250614080000.1884236-5-noltari@gmail.com>
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
In-Reply-To: <20250614080000.1884236-5-noltari@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/14/25 00:59, Álvaro Fernández Rojas wrote:
> We need to be able to differentiate the BCM5325 variants because:
> - BCM5325M switches lack the ARLIO_PAGE->VLAN_ID_IDX register.
> - BCM5325E have less 512 ARL buckets instead of 1024.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
