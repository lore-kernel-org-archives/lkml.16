Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6260E79D2
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 19:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751310389; cv=none; b=iSEyqo3Nkuclr7dwIP1DptRAmaiLCHpuwKEo8/+yBeR9XUASL9zyaZRAu8WEtJ5avx5jonsZs76oZchk/w0zV7yZ4Y7Y1g6YnajOwgOEgdNNSSbFemDEHHTU8VBoDTK/Fi+J2Lq+cqwXD8osHjVczhOQT3GseERH6IZRb3kkCvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751310389; c=relaxed/simple;
	bh=/CB611I8QUzospzLZMcGKKZNDa9b4jsHw04tVNUsc/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BvtFB5Jje5nIdw0vaMn/N1iCnW5vK0Gx4uqEEVVvywUTePds/r7Sw93eUVK/IYVQxPjl9af23lyxJXZ4jqW5COkkBHxc2jsCOw8nPhEnDAa84xtmocoNpq69Va3bFuwihnrWLZ2KVWOF27giyuJ7byf1JKEadJ8hFW8L7sbfefg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=AzqMndmt; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="AzqMndmt"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-235ea292956so21433915ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1751310388; x=1751915188; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1ifqxTBeQ+hR1fKmYKfMtsbKbYA3naoBciBfh4zZv5Y=;
        b=AzqMndmtPxP3aWaiRD1Rv6Sx1O/p7d31daK2yjKaN33AeCkPgMG96IVTkI5562RWOX
         ebxqi0Z3agQadBfejGdM3gVbFh0fG7FUwbQYlXjB+keUhF8BRimpiym5p4aMDSX3ez//
         G7mSjSqgT2fGm1TbIpKPo4euXPthOIms/qKwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751310388; x=1751915188;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ifqxTBeQ+hR1fKmYKfMtsbKbYA3naoBciBfh4zZv5Y=;
        b=i4NNMIcTaFeN7oTE2NighZh80lPnCFiZPhI3BJ7RhcZ5AJGhEH3XnoNDjU82FAMMOX
         d+H/4CXJhiYGN8QVuIccyozbW0Pvrve5g0CxsciCR8cwdufInlJn9ir99SXw5U7PtllK
         ewjJ5dauAbEwbMoZA7gr5Bp0SjXgTPAljq/x/EsNSLkLCJyqCI4yAO6XqxwXGpU2MZMm
         KJoO7EFt/ugjMy6oS6W/9NIeN/hXCYMcbmxM5Qmwak/YHMrY1AaucNkDN2PEnIz1Ikb2
         FIkc/6pkqpc+IGBhiZFCXLIDAh+n82Tsu35JbQloKmWl5EqNBmSZeslTp9KfqvMVAhkq
         0wZw==
X-Forwarded-Encrypted: i=1; AJvYcCXj/IkrRK/vzCdk7g+MoaI1WOdkKcAKqnKTGaw8sxAvIw6eexgmZwTDDyz0SsQfd3tN8tMZXroAO8M5elo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr4lXvtmsVI73SQL2ryooKEMVbO35fElcYX2Wx41IcYPMbIP+N
	bkfx6SV1jPmmdI8D8s9dWi5iAFu1jl/Zw9ZbLyiP0bwV2yp1SgWAyOoeB0PPOc6LCg==
X-Gm-Gg: ASbGncufyElNJTe3fL0XD8tEZw01qNbYONfmBIG36SCfC+DVA1TsEOFzfObXgLLdO7b
	qYq8K5rOSb9rRMcvNTe7M6BAP/T2Wscxrjuml/1gtoV2s7iNgE1SMCydDIUe1/qICbmhG9uzQ2p
	p91IdhY4o17dq+eqpsvs5+fp8IyP3235mpxIGfQH/jg95OC3GEmhHUZGvnjzJhmOTRsLRwT1aD6
	liK4Bh8W7kgXYYDsM4rGD5zAA9DJXMYw1RSuAF05MKeHrnuNWSEl3cNCpdMrfSyWCC7ppHHe2LP
	InW4SrxBmBO8aTHdn7usP+p4Bcu+cY7357FMYVX3Mv9fwwPsi9oqWnMiqLYUaCh35s9LzEYdXA7
	XtoGD1Z7n+PddiuYhMr8VxxzonQ==
X-Google-Smtp-Source: AGHT+IGrr+s2yHRofWEifQmJDsOPRoZeaxvkG2kjOYNFEpJTQ0qMZgmXnhWfnA7mYAH2pHmMqgczjw==
X-Received: by 2002:a17:902:f606:b0:237:cc75:77b0 with SMTP id d9443c01a7336-23ac4633f4cmr184335375ad.30.1751310387627;
        Mon, 30 Jun 2025 12:06:27 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3ba530sm85783255ad.200.2025.06.30.12.06.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 12:06:26 -0700 (PDT)
Message-ID: <5a374bbf-8f2e-49fb-9e9f-a55a8362e134@broadcom.com>
Date: Mon, 30 Jun 2025 12:06:25 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: phy: Convert brcm,sr-usb-combo-phy to DT
 schema
To: "Rob Herring (Arm)" <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250627220126.214577-1-robh@kernel.org>
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
In-Reply-To: <20250627220126.214577-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/27/25 15:01, 'Rob Herring (Arm)' via BCM-KERNEL-FEEDBACK-LIST,PDL 
wrote:
> Convert the Broadcom Stingray USB PHY binding to DT schema format. It's
> a straight forward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
