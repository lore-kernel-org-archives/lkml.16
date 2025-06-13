Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E769328E61E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 23:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749857014; cv=none; b=bwkxwTooCO9e+tP9MIgpgqkobHU/SxhK4ahpXxF6OXNN9oIMIBu00LQpPLspdDn+vU34q7btrOfGqlDZjDm5lpc9dbGkuj8w8evtMmxtFdLcUmZnhfQZ/YAbCkuTp9Qv3/qX3HR/N40K92RYx7JLpmmjPxB52nHbvmVrxB6M250=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749857014; c=relaxed/simple;
	bh=Qy2mNvTmo5YROIGkLpJknont7n6dXoZUNUODzcohgpk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tM+Hm18klPoGSuBVfpJtuu6Erg8syG7cbrONRNzpIn/J6j9WDHBipWlOPONSVhnMXdOReC0KE+gQY95Fv52TKrBKO93fKDgpIQg2k3CSocyQXqEro2qN3uDjHwRk40A1DaQ0u5RpvX+L7W40yrkiIHDgCDc05+rAbWoddnls/ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=XPHw+Kix; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="XPHw+Kix"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-236377f00easo37059585ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 16:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749857011; x=1750461811; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wsGrhJXcxJgF9VRXxhbt01P3WngGl8j8Fa4zh6eSNp4=;
        b=XPHw+KixOaeXinaOWNiGuTX7N6G2pPM8A/yeGrvQxPaQ7lbd54rZOKVrTcNMrAyj8V
         pMVTC5EQysou0vlKkr2PWEuk2ZPTjT36Inrb28r6VKP3JMqiDPrEFUuqahnDHUM8AOlp
         HVsDvMHIJ2lchdH4iMHjwLaNwJza+jGFTswsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749857011; x=1750461811;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wsGrhJXcxJgF9VRXxhbt01P3WngGl8j8Fa4zh6eSNp4=;
        b=X8t+MA0oXNiK/An5fpSmJWBeEwpu+nIfROfUt3NjTFqBd9o0t1GYG0sGyx0qNNSRX4
         HAibHfNSR5ukFqWwWMcHGX/rnr0G74426uRYCehbLaJ8wBk52jvTt9lZ3IDQISlap1JT
         k2TvdRXjAtI36Tr+hCUfzE2z51QTG/Rj+6KIxnpgzLsNvY7YjinvFUAX105O3Wzacsn0
         M9TszTpn/nUZW/DjqQbivM6L8zEW20Ww1TZJaA5kxbBk1jqw/tus9RJ7Bx9FDegA6suN
         3iRZXAfFR11Bvm1qnDq1jEL9B70CxCDSJO9RyZljJzPKIxZbJBhTtVJM0HuFHMTmZKUc
         mnbg==
X-Forwarded-Encrypted: i=1; AJvYcCVLrkiQxP9h9/c7hT3nNB9sg2ub7mUgkypqWb8cfmWx82gjW8/jVFtpfEdCspRq8MR79/uv/aOuoQabX6w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/ZRdgS4jFhY6zW+gQwiVCLOe2vkc6x/+Jp5yEfGHevDVWqJWL
	cWt3BFP2fYovluFe5RRA4hzZLPIGjM3NGUaPEnTDsvgLzcz313VBnS05PBLthOdrTw==
X-Gm-Gg: ASbGncstXBitmL0jwxpK3RnGzZPfW0TVxVkdw4u6QpVZee1l3Jhcgx8ELMnqbSRxk72
	dv8++7FQhi6mZeORw7i8ATkjXFQ33FSw2BdxJTdf+fU0yOFcW85mWIxCNLvvoY+TvYJy0heXi8C
	f4NWVvnRz9B0RlZcoTDeYcW458lU+1CTAYrKR63xl8WA4aw45aONNU7xmUfsPFOenKLaGOLGJBR
	uBFgkyxML9hBZxyN3r9JVf1uOJjWo2uN08sxItrXdNxsae3fj2Kj41aMVkE4kEoiu/7eR5lG5Jp
	wE4jaIoFtfee8izIEULcNJkmWIZA5xlipwjFAjZfIpOuMwheAr3aZQNrsj2ZMl5cAiHee4cc8t4
	Jcx55gQaKDcdYcun1RYLQ/I4AnW7EsBlyS/O+
X-Google-Smtp-Source: AGHT+IHzddnp7KM3N56jQdvyzbz93g/Cb+xVlnLYpRToONj9z9618Uu+cO70x4fNDe4E/9ITIFSUcg==
X-Received: by 2002:a17:902:f689:b0:235:1ae7:a99c with SMTP id d9443c01a7336-2366b136380mr18330975ad.32.1749857011198;
        Fri, 13 Jun 2025 16:23:31 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deca282sm20135825ad.205.2025.06.13.16.23.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 16:23:30 -0700 (PDT)
Message-ID: <37f6825e-fba2-49c9-a802-abba1e5343a9@broadcom.com>
Date: Fri, 13 Jun 2025 16:23:28 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] PCI: brcmstb: Add a way to indicate if PCIe bridge is
 active
To: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Cyril Brulebois <kibi@debian.org>, bcm-kernel-feedback-list@broadcom.com,
 jim2101024@gmail.com
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250613220843.698227-1-james.quinlan@broadcom.com>
 <20250613220843.698227-2-james.quinlan@broadcom.com>
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
In-Reply-To: <20250613220843.698227-2-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/13/25 15:08, Jim Quinlan wrote:
> In a future commit, a new handler will be introduced that in part does
> reads and writes to some of the PCIe registers.  When this handler is
> invoked, it is paramount that it does not do these register accesses when
> the PCIe bridge is inactive, as this will cause CPU abort errors.
> 
> To solve this we keep a spinlock that guards a variable which indicates
> whether the bridge is on or off.  When the bridge is on, access of the PCIe
> HW registers may proceed.
> 
> Since there are multiple ways to reset the bridge, we introduce a general
> function to obtain the spinlock, call the specific function that is used
> for the specific SoC, sets the bridge active indicator variable, and
> releases the spinlock.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

