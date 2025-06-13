Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAAC28F92E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 23:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749857310; cv=none; b=G3cjLqJCuieXi1WfWoAKS4QqvCxMvSUi37PfPFg+M3B/QdFeFrMFIaEJjBsHFT9mIf7BBy26RVFIuSAaUZb52jXqrp9GKKsANvgOhLj+zg3jd95wJIAQqcypNLxedW0j+pEtDo3GBclbYZfGHNEaTfsC1zbEldH3+LTDuPzJiLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749857310; c=relaxed/simple;
	bh=2Mqj1erFnz6eSrH6OrYi/A52QDuDNTJKYtEZmzU2yFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gXe9M19sFGGMJf2sj0o3Q7eACoDcQXTQwiXB8YIKCQD52JOVP3TBwuRfUKSU+iQXgR27Ahh/Yt6qOehtuPE1iil+TGLjV2/nvjgsnr0xjrf+KStZgoMv/n16K+Kf46Zg2Y1A4/+2FKE0d5tBSJTf62V36tJIH++xAjvCGzFPlV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=iKF1+zMd; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="iKF1+zMd"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-234b9dfb842so27523525ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 16:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749857309; x=1750462109; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tVIgyEp369YGSVHAgR24zVsOgiLYMbHVkjFj8orXwT0=;
        b=iKF1+zMduC7foWTxBH0wHi+rI2pWqqgb5zRu38wBo75Hl+3ScSzHJmEiHoWM8n4QMi
         338Cus5pyywdK8dU3XONx/uQn2JBQLhO9Q3n6FRWtmHQi8zkpVB75LMkirekZN/vMk4m
         CzDkMQDJWve08SJw6MwySepiC8USf/6Egwi4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749857309; x=1750462109;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tVIgyEp369YGSVHAgR24zVsOgiLYMbHVkjFj8orXwT0=;
        b=wpIQyYhCndEPC4PiCMibKBC7SV8Mu1BIAr2qgTPDyp2Fnuk9rS/1FiaIgGgHgynAzi
         unSOUDzZBsndXu92YP8Bi3ccudwst5NPCgpM2iLEFmY7rkR1KWbP7w/hsB1UFCQNv5UH
         THED40gTaB2zjicEaNG1dVDUvEUSh19D4HthtEE4MC+q8ItCs5vjAj6vg9krzMp/NdGU
         sj+IbXjVuzJwj25Eda0TycMl3bkvxCXwlZaAMVLfrLgK04LIpq/uYUiKm9X3KX8OZNYm
         9lpJv3rrYbhOdimosep0iOtXPtV+JXeEuUit0yQXwiVSDG2tvwDSGJi9D6LL0PUttNWg
         Q0Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVG6xgFbEQT7yuNIVe7QzMS1qD3GsTaymXRprPGom+GfMHM09fv3USHTtNri/JhVcrZhu3upHZQRLrQzaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwusJ4H2uPBfnH09QJCYX6a+1dqbtIF6k5/CMifm+m/G6M4Bl+X
	ijqaS6O2r0p0VNdxRjZEGuuD67qK9JImGblj1G8pogxot3Mrg77+Z6K6GbB2M6xxnQ==
X-Gm-Gg: ASbGncuZAeAuj0FywkvOCtBjhl7ZUUbkqKfDSeDJDo1aQI/6lwYpNCh8eEMPAKD27Qk
	1XwHudSjlgleNGYpdq2Q8IdBo/fd6ikPfofiP6DBIDoSfOgxtZNoZezv/ljIqWByrvFfX73eoSC
	N+LzeTrAVlBx8Ibm81txJQoFOudaNlO09O2IPgLuVK/16VcfXp+PiwLTWy8J2FveK/OLI+uoe61
	ndcoZdH5Fjb4/pd6LjhDuSL9UQTb0kewlCXgX1rf9/54QShg5ZAPtz95t07M3LzhwNysXxbTQSh
	1iHQCbgKQZDgIyyLFBxe4zO4OKHJzuXZkluJzYYpbARMUWPZRTTCvliRdZhxXuhKValYzXB3TF5
	B+Zc2KMF/VVKrz7PXYjfjPbkRag==
X-Google-Smtp-Source: AGHT+IFRMv4pLDDHZkU3igLGyfy5y+yaEPSSBvXVtQJ9pTX4uJU4gfxC9bWCYgV8MTIXuT7DWuR7ng==
X-Received: by 2002:a17:902:d543:b0:234:db06:ad1 with SMTP id d9443c01a7336-2366b16cd2dmr19148195ad.0.1749857308692;
        Fri, 13 Jun 2025 16:28:28 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deaaa15sm20255465ad.173.2025.06.13.16.28.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 16:28:27 -0700 (PDT)
Message-ID: <eab9cfc5-9751-4415-ab9b-527a3af40a62@broadcom.com>
Date: Fri, 13 Jun 2025 16:28:26 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] PCI: brcmstb: Add panic/die handler to driver
To: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Cyril Brulebois <kibi@debian.org>, bcm-kernel-feedback-list@broadcom.com,
 jim2101024@gmail.com
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250613220843.698227-1-james.quinlan@broadcom.com>
 <20250613220843.698227-3-james.quinlan@broadcom.com>
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
In-Reply-To: <20250613220843.698227-3-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/13/25 15:08, Jim Quinlan wrote:
> Whereas most PCIe HW returns 0xffffffff on illegal accesses and the like,
> by default Broadcom's STB PCIe controller effects an abort.  Some SoCs --
> 7216 and its descendants -- have new HW that identifies error details.
> 
> This simple handler determines if the PCIe controller was the cause of the
> abort and if so, prints out diagnostic info.  Unfortunately, an abort still
> occurs.
> 
> Care is taken to read the error registers only when the PCIe bridge is
> active and the PCIe registers are acceptable.  Otherwise, a "die" event
> caused by something other than the PCIe could cause an abort if the PCIe
> "die" handler tried to access registers when the bridge is off.
> 
> Example error output:
>    brcm-pcie 8b20000.pcie: Error: Mem Acc: 32bit, Read, @0x38000000
>    brcm-pcie 8b20000.pcie:  Type: TO=0 Abt=0 UnspReq=1 AccDsble=0 BadAddr=0
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
