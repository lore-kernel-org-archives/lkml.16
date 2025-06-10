Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1038BF8
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 16:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749574040; cv=none; b=YsBQV2g6w/13pNIOEFXTcDbbLhaD7lUbIiHDIQXOHAgH5NRjJc/89J/TNhDil87+BwAhLDRwGxRXxO+G5Y8h2iSwHcHw4E5Vr8DYRCCxLahrr4oxANjMFlaHaYDZz+fMlaKuJbjMabxCY8q8huu4RTrguA/ScU+zSJAoUGcA1c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749574040; c=relaxed/simple;
	bh=bBcUTHJF6PR9xuWqw813mckHIy1k/DN49iBrDUkdcwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=amT6dHXtjgm1DTRzHqpYo2wbnnVFuQa79ts7op6CfSGS14edyVLu/tTii3/Bf2mMfO2QM9OrCbUhhg308j6pH1no3oa0JwsiZofLuXjuH43gNdmFsDFFcVSM51S8YYPVS7HXahf6/d06rxljrQFNiImlAuVpzsOLizgiXA5Sqfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=YqXm9zSp; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="YqXm9zSp"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-742c73f82dfso4659689b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749574038; x=1750178838; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Xo41l9gtLqleyuJ7MudXZArqBzMi9FF89zeN2MbARr8=;
        b=YqXm9zSprynAp8W79yKISnp7IVBTDWdTqesCicrWKKHusVlQv6BXj5l5hOAULH/mDJ
         VzIYsRonkO3ioT6nlwEq1289H7dQhwCG03rK+dqGhhifgYp872NtER63ZnGFTbGULwwg
         rpynU8DynGWbAVtWsBYbf7oXN1zV5HMvufjoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749574038; x=1750178838;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xo41l9gtLqleyuJ7MudXZArqBzMi9FF89zeN2MbARr8=;
        b=X1DCvOIw/6zVrbKX/yFKXRuhB0jiIAbXz40cDxZIWpQLnPubebpy8XsmI5auOYu4vP
         GVhfh+fexjce7cXn3rk0j59L3E4AWE1PNmdR7gia9BhupMo1dsx6fqUtIJrEavOsSdw1
         RolceZdhTdrX7h8jrmQQY0VWHNBHg2ne95KliaJ0sH7AiXz1BSTZlp6bQOzJJFDqQIL8
         wRsr1uaiYGgJQhsFni/Ihg1YXWU/smYYdcEb0Y8MFKWHUshK13OzWBoLNLDp5XOHg5aL
         +VFO4JqIAN77tc40RsLzbTT3I1B8JChgNiOqQMUxseg6G20y3xq2dKv52IT9iYQsrg6T
         v6dw==
X-Forwarded-Encrypted: i=1; AJvYcCUQXrElAuZBEHr/c4K7YUvoXgD8FX6VKPIYUyFFFj3pvBmfrPWd5xDaMCABn4K27146Qt49Y0YQEoPo6Iw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSz5xwSlJj/n0G4l/Sk2GLLLu9kgYl9yt59aAdnD49g9bARGt8
	Z6RcykgXYuA436uuR5aUTfjflMT2vKC7ggrWk2S5U1QPYhsTVg7p7c8MwhMfS+uoyg==
X-Gm-Gg: ASbGncudqVxCiuLJF4KOIm9JGiG4AbkAbWSIkbFBeSmC10F+c90af5Bc9vO3/qOuKmv
	UgAh2kWEQS+Ww/ZzbUJ2HGNyNfBu+h6Oa15nWJWw7yohK2CG64b4Ynr7PtRQzHepetfdbs0u5l0
	3ThFpr5+r0eII3o3LqUOsCZBnSPrYnRPIDpzZbwpoPvNsws8lR3DcUNNbT0xtaud/a1siM/oVkN
	KmmyhpoaNXTiXXNTtdIC/L4JYEhthEeYOZC99bFIIiYxnLjgQ6sgu/3UFRY1qNB1P4WtTo9bbkJ
	UD0pltKknh8Y0MKSwL6R6dnI2KipW873Y0JL+UpCk3iW4im//9XjDvEXmJErCh3sQ5kqLEVOQA0
	XIhdzPp3jrKqO3kwnvpusy+LP5LBnb28MPMNj
X-Google-Smtp-Source: AGHT+IFCQ7YePBptZNqDTPiaIVvtQLGbgfyz+p904xf4BmVvk+kKMXCg7T9CD2HhJzF1goP7RnUNPA==
X-Received: by 2002:a05:6a21:3943:b0:215:dfd0:fd21 with SMTP id adf61e73a8af0-21f8672f2a9mr444904637.34.1749574038381;
        Tue, 10 Jun 2025 09:47:18 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af7abebsm7648972b3a.47.2025.06.10.09.47.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 09:47:17 -0700 (PDT)
Message-ID: <b7442edc-691e-48a3-8583-db542ea0431b@broadcom.com>
Date: Tue, 10 Jun 2025 09:47:16 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: mailbox: Add support for bcm74110
To: Justin Chen <justin.chen@broadcom.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: conor+dt@kernel.org, bcm-kernel-feedback-list@broadcom.com,
 krzk+dt@kernel.org, robh@kernel.org, jassisinghbrar@gmail.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250602222311.2940850-1-justin.chen@broadcom.com>
 <20250602222311.2940850-2-justin.chen@broadcom.com>
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
In-Reply-To: <20250602222311.2940850-2-justin.chen@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/2/25 15:23, Justin Chen wrote:
> Add devicetree YAML binding for brcmstb bcm74110 mailbox used
> for communicating with a co-processor.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Justin Chen <justin.chen@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
