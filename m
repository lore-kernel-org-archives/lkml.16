Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DBF2594
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 02:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751596712; cv=none; b=XPf+YgfTnTdPMx8eAdoaG/6bKsh/0vs3j0btUfq0DtoCkpObTNsSM8xJlsx/pgl9LTjJgnPe9r5Gybjj2bgI0recPoW2w1gN46fYy4o8700F1KFy5sw5UItsYH1J6gr24ll+vOdIUyYs7FJpPC/uZ3VyBEfPfWZJsPYdbaghLig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751596712; c=relaxed/simple;
	bh=Vab/LD5zzpsdPtSzyL3f5bz48Sj6WuCxzyj08MvJ1ew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KaUIT6NUex4AWwgMu3KX35K15cLXE/XqZ9Kzu/inRZFGhHa0nwMiK7FhcHDh1K512Eg0WV7FVyic++TBOctKtwDluS4xAsizxrbgvV8S4kadpJrKlvXhzVMAaJAOYTJdEcmxkCMmnThhTHpaGhnxPQF87J1qwA7l9TrynkGxzjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=UP0WgrQ4; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="UP0WgrQ4"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3190fbe8536so505502a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 19:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1751596710; x=1752201510; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5q4W9N7qK+Wuy6yg62v5/iQ4NUV7tbbrVCXiTiMRs7Q=;
        b=UP0WgrQ4AkNMjMl2PGh+TwaPD/8y8PA8LOjJMCfCBFeyiex0ojKps91cTgmB8V5WeU
         THcmjG0AwYmX9PK5deDu9jey72Tr76OHuRSnpDuMJPPla5JCfw0C987RKkmU8S7ccBj+
         opwc075DphAC1/nWKJPjVsLmRIckiSHkTgnA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751596710; x=1752201510;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5q4W9N7qK+Wuy6yg62v5/iQ4NUV7tbbrVCXiTiMRs7Q=;
        b=a7REPs4Gt5YQI8dCIhDj35kUcYL3o4sJqk853mucYPFTRfKFeyjrkP8sbwh1JK2ihe
         kLxO9amR4/ybSwkX0uGSwqsWrdqSCndJE9o714HUynfb8kskxnprecZDbGVGB+j3Zc2F
         k9wVKXcUTx8CGWoz3KYWwbUSL5xyALcYlQ/5lUGjG1WwU+tHRiS1KH/NnyPxRaDuLS8m
         OHEfm4KPCeLPw+U0mzDn6DvqlWvlFFYSERmEZCPyMTonZ2xY5fa38i4gxeY6WyYlJuS/
         TWva98FTcFuU1N3IdZgbWwnu+V78q+S5JtWGFzUJqAzH8qvv2blRBXY/mK1ipMB9EZNo
         M7yQ==
X-Forwarded-Encrypted: i=1; AJvYcCV82QNLwQFDsvMD8cHvFrAlmg59t8XidTbli2LaCDFjadojwUGL9pUbkWs6bSaMS8w8jx8XkM6WbrynmPw=@vger.kernel.org
X-Gm-Message-State: AOJu0YybwTlWPsZ4a1ac6UaFTFTGqXGmpwWRKQ+RqRdzDZhvqjPBNqa9
	Qacc0j0pjhQltnUQr2VnYLwnr8fpj+EL68qhAGHmp6f1t2GqkhzAiLygOlzqZr9r3Q==
X-Gm-Gg: ASbGncv2ZTWdlfs53Sf65ATHGAXyt/vR84E7ADifW587bOIOvBiUIZvUNDzRIirSMTn
	cfIXlv5nnbJiU1OIZ+Ry1RpCLN5wXrT3jRlTtSilUSQdMtobT3vCWx6hAuqF2MxFKzoXavtiqoK
	9cpsMVccoshEwpDDtsb/ASq0D9XmdtUZjwUeh50IdN1WQKVnbvZh9I076osrNP8k9DREyzcUMwu
	0wKmNn6+xGRHPSATXx46/HmFfem0GMC+QocI3Bb/0+ZWEHJv4+co2wf9h3+IDvfSmR4j3jtY8S9
	xGp5PZNWMFk6i5+GmSAQIzZ2SWVQamXgIy6DehYtmuInoTh7XxAeO0ZAe2YmHQxLGhcVaawduGv
	zOLts/ypjyDVGQkA336GX4o3BAVL8F0qVr+Ewo42Q
X-Google-Smtp-Source: AGHT+IFP2Imb1D5Oqqdh7ad00SyRc+ove3xbG3fR465FpmV+kHbhkPwjj7ne8HRgVGhPkEwVcQd/Wg==
X-Received: by 2002:a17:90b:3b90:b0:311:ea13:2e63 with SMTP id 98e67ed59e1d1-31aadd27f55mr601908a91.13.1751596710304;
        Thu, 03 Jul 2025 19:38:30 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8431e2c5sm8054455ad.39.2025.07.03.19.38.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 19:38:29 -0700 (PDT)
Message-ID: <215c9cf4-9062-4546-8237-8d02fcb5b6f9@broadcom.com>
Date: Thu, 3 Jul 2025 19:38:27 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: PCI: brcm,stb-pcie: Add 74110 SoC
To: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Cyril Brulebois <kibi@debian.org>, bcm-kernel-feedback-list@broadcom.com,
 jim2101024@gmail.com
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20250703215314.3971473-1-james.quinlan@broadcom.com>
 <20250703215314.3971473-2-james.quinlan@broadcom.com>
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
In-Reply-To: <20250703215314.3971473-2-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/3/2025 2:53 PM, Jim Quinlan wrote:
> Adds BCM74110, a Broadcom SetTop box ARM64 based SoC.  Its
> inbound window may be set to any size, unlike previous STB
> SoCs whose inbound window size must be a power of two.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

