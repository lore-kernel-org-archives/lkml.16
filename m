Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6837619CC3A
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 14:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747060556; cv=none; b=fKfZzWB28jRi2rgEyeaPzvHUhThrvh6n826tcS2293Z1IprDdxTePaRIFB0WG2F7i0v8afZp6tTUBzLI5W5F8FfdekW45wlBB6tE5+sH0mkDWsSDPjvk63N+QywFJ4AmVkTbZD5Ysu/8S1Orvl/y8UbR/Nha8QwUDvhTSwH14ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747060556; c=relaxed/simple;
	bh=D5teLr4NrFeY88jEDPazTqBSymZLKicOkh7+ECUSmhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QbSPem/nBo29Yy+xNM00i87ZmtwA2LwhR4pzIRi0cOMv8aVLvPZ5g75F2MWnWb3iDUCt6Gm5i8eYZlnHDgd1aL/hs1WwZqT8nWigXlZGdNvT/1u4UJvawz09Qm4MNRx4z7UOWd31aTzQxlFR7eQl3ApEjrM9iVBXQpECCyXdsmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=fyMG4oQA; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="fyMG4oQA"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22fa47d6578so44953915ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 07:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1747060554; x=1747665354; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Sz6f0OJCAmrTj6lvB9GBJqDX/aKFKjudblPw81R20UM=;
        b=fyMG4oQAMwHETebbyENucQXGB4tJ7sI768EYBcgWRwHXVVArr8j7++gMyxWGnDv+KI
         lv8f9YxarVnkVLHtBxFJho60DHRDM4s1EnVawKASW3PDzikQNkfMWa1dKPnODG9HI1pN
         mGUsHmuZ1beTRvT+et7iJDxaHe4Bdvh1tCT5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747060554; x=1747665354;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sz6f0OJCAmrTj6lvB9GBJqDX/aKFKjudblPw81R20UM=;
        b=eebipdKbOhmBmvi/ulJqgTu0zbw1YdFM73oN9e9bb2rg06dBKHHpuQ3KGRJ0mJqEtb
         UZrtyYW8WvvuwBVCyKHkymm/dZZzK9ygJN+oDeiiC8vkpM5WlfMiyd/qv6O/C62VJWAO
         ONHl3VYbGfT15L3Har+7exibLDzt6zOBgv8GWJBJ7WkD9IReGJ7gx+WuxGzZ9QO0KZw3
         Q619JMt3b0slz4mrISjJAbAfnqUA+1K7N6Wyd159zyUdO9HjQUQ9YIedI8WK0L/O2tNe
         sTP5SI/xLP1F6p4kVzScKtnzlA6gNdbgjL5Awze8wx4PwApszhr/XWyQ5AlSEo2gLkrX
         l9uw==
X-Forwarded-Encrypted: i=1; AJvYcCWWjUc5rzORYtwk/bA4ypsWWHYcCNNXuJXzTiB1fxsThEDE2b0xXK5RlYpGULAfD8kFXyvAzm6e7c1L1BA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW3k+kcdvqsqwsrtUT6qSgXqZ98cpBMvWcK9I0qvr0lT3jKZT/
	llLF7hwcMlD1D7TONaXGPAxfk/M5NvXvuveXqMiuUoLToF3kb6NbbX+44uASbA==
X-Gm-Gg: ASbGnct3liKJQdMcyJZUnEjyMzOVYoqUOfdBTUHYZQhIM8CDrgRihLrdXbigEW7aqE9
	ncm/0+QthmOOt8v465jAoSZjNpXGFQ6uoKw/i0DGTuL/ASQc7JorXtKEm/P9Gt2xhatTnACutGX
	MuHSCx2LAaQudOHBe4Iv56fD9zBWyOrlhCkl/yOsGmE/XZrLcXwo2oAf2FmL4P6Htj/ZPUGECvN
	BRbn+UxbFgBzCQoEemmHszUg8Lu6AJKmeSRTFt8Yw5TllY2eF2laOxy/UwZMyLMNs+WBw2ivS1N
	0ZWEcbqr/KvRD1UxClJDTLzF1tn/UAoyKEfeL84zgkgEWKigq5VqRCQQscCZKD4yyp/7hy97poE
	RzMLJqbRo55i2Y+afgVJkuE6WAHyu+N4BiIxMF/+Orb/w23X67g///S8BQzWF
X-Google-Smtp-Source: AGHT+IHcYkwxoS1tVRqd7mVxjpUpyN0ag8i2kujtWYJnw9HVhuJgoq8Sm6RE1gq1RmZqsNalH4DR6Q==
X-Received: by 2002:a17:902:e94d:b0:223:5945:ffd5 with SMTP id d9443c01a7336-22fc9188728mr208989515ad.32.1747060554582;
        Mon, 12 May 2025 07:35:54 -0700 (PDT)
Received: from [192.168.1.24] (90-47-60-187.ftth.fr.orangecustomers.net. [90.47.60.187])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc764a536sm63980235ad.66.2025.05.12.07.35.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 07:35:53 -0700 (PDT)
Message-ID: <e9830d60-d711-4fab-a4e8-329c5a3353f5@broadcom.com>
Date: Mon, 12 May 2025 16:35:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: bcmgenet: tidy up stats, expose more stats in
 ethtool
To: zakkemble@gmail.com, Doug Berger <opendmb@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250511214037.2805-1-zakkemble@gmail.com>
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
In-Reply-To: <20250511214037.2805-1-zakkemble@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/11/2025 11:40 PM, zakkemble@gmail.com wrote:
> From: Zak Kemble <zakkemble@gmail.com>
> 
> This patch exposes more statistics counters in ethtool and tidies up the
> counters so that they are all per-queue. The netdev counters are now only
> updated synchronously in bcmgenet_get_stats instead of a mix of sync/async
> throughout the driver. Hardware discarded packets are now counted in their
> own missed stat instead of being lumped in with general errors.
> 
> Signed-off-by: Zak Kemble <zakkemble@gmail.com>

If you are making changes to the driver around statistics, I would 
rather you modernize the driver to report statistics according to how it 
should be done, that is following what bcmasp2 does. Thank you.
-- 
Florian

