Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF0C191F92
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 17:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751303053; cv=none; b=K0zUkSsNugab+OL5Y+IZnnTU6BuFgCBRIX/Gw14GyB68eWOy4uApGhMrREjp+Nj4TLzKVupy8+KzWIaDs+eeaN2uyUF0u2b9YJP2xUc7SpcuDhT5WmucSs4i8XSPVmzbjJMKovzkt+eNyjDWmD8/tEoTvNERM2Fk6fVPYDvRnn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751303053; c=relaxed/simple;
	bh=bMSrfEbzshUwKl0DMN3ILKLxONAaba+f7YSvI1MF/mA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FExZ4XbrWfBTlqwQj0jFVG3GJHRCGyzpoW0tfUTpuAB+hdPuErkEs/7uG6cTzLzAy7zOkB/6XochftOxswp5iQS+JYN3pUuEWeXgyePhHemBqJ2+Q08yeK9UsziDlMRSgIhpBZmsN+uecI5iDP7s22L/7JePHebPI/R1y6ikV3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=E8JYDHZH; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="E8JYDHZH"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso2160954b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1751303051; x=1751907851; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zcjGdijCc9GaQbRF5oMFB34NBYTSfScMxsZw7GjZKq4=;
        b=E8JYDHZHcBHjiuDvlHTSEYtluArsC8+j68+Pm8C+F/D7shr2KWueMaf1f8zYXZeN6C
         wbpXZyMFU/CX0DertkeLJ+oC7whAJHO96P88FwiV7lxgGXpsg11eHjEREubt9z3nKuPe
         E6nBuEmDWXjtmZOiNy+gUqaMHdAtMO4ORcbO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751303051; x=1751907851;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zcjGdijCc9GaQbRF5oMFB34NBYTSfScMxsZw7GjZKq4=;
        b=Ki72eDSkX+oGUgOhrkdNtioq40jz2LrqkDaD2Myy5B30NlmnLHqzrssLhaH9ScnxcO
         cCQmW0lw1AjRnVLY5ayfDjjM2Spx1UhKQSEel8HJzzbst8LfdDpJeqUqkdaE8vLZZIGk
         QEoncyTa9nCHY5WFFQMnnDctUeP0EFYLypwhIOeFQz33zRmhdZQzXxtze9Q4xrR/ShtT
         ga7Zi7xQpGN/hLg8Ovn+md+4BSdMibHj9Hb3gt39jzLjlDjdS82hM3RBI6dJH90H9pH+
         1Eq1Jf/2uWNA6AKazGoew/YxkKWCJrLqfxyK5jR04hqbrSu+5vefQVBMgYRM/elLvCvr
         xD+A==
X-Forwarded-Encrypted: i=1; AJvYcCVsNSvPLIWDiRLQZlQVhgoplZ0m3nZKK9v6CfetA7f9U1F+ayxCQQX3gJF7FoQiFQiuUM5nAZo3myxw39s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJT6It6GiFHQz4CVv+5NuRsVgAhD1EyECaKNW9HlEEqrb8Q6kw
	lnkda7K3OhbAy9vOMlt/3bZWJ2E3RL2H2FU1zaLdG8ieHMhNktjEXpKiI59vKFHfIg==
X-Gm-Gg: ASbGncu5H1pHB30dkU4QbztA74gbQKpGnn4PjKcdPDHiv0kL6aHlQ4Ge+9xKpoBDE1X
	VpiUeziT5eDnH6r6RrsaNuGdQ9OT9aowgz+Tj5z6+ANPRTbxqjp5fLtA8xYNZ16rb8C2/jmQ55D
	z9pXRDYYXwj1I/szSS16U8PfFLzbTetNCos0LlVPJhrCJO2WmF/XthHBANLlgFa95WQOHaoJBPf
	D1DvEUhbLeLgGMswFepSj/srnaXU/z4M1GShZYX2+BLAwGEilMgCfEhOpZzbvL7Oeu5qmJziwWp
	+m62Ch70kJEbadytjp5kSV7BI7pyBqjss974wNgszWSQMqEJ0OtwIvQad5alMzaOJtbDw710WXG
	tBf/XYPQfOLRBTfv4hhSdp8Rcww==
X-Google-Smtp-Source: AGHT+IFr4xxd4Fmrt8X0Mg9Broz58djINFulFwW5k59ZgLBYqG195gvQtlxtbb/njLtyf+jo4Dpnug==
X-Received: by 2002:a05:6a20:c906:b0:216:5f67:98f7 with SMTP id adf61e73a8af0-220a16e4776mr22818360637.33.1751303051249;
        Mon, 30 Jun 2025 10:04:11 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57f0e62sm9123040b3a.162.2025.06.30.10.04.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 10:04:08 -0700 (PDT)
Message-ID: <55108ad4-c210-4c55-beec-8114fe40c51a@broadcom.com>
Date: Mon, 30 Jun 2025 10:04:06 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 4/4] net: phy: bcm54811: Fix the PHY initialization
To: =?UTF-8?Q?Kamil_Hor=C3=A1k_-_2N?= <kamilh@axis.com>,
 bcm-kernel-feedback-list@broadcom.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, f.fainelli@gmail.com, robh@kernel.org,
 andrew+netdev@lunn.ch
References: <20250630113033.978455-1-kamilh@axis.com>
 <20250630113033.978455-5-kamilh@axis.com>
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
In-Reply-To: <20250630113033.978455-5-kamilh@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/30/25 04:30, Kamil Horák - 2N wrote:
> Reset the bit 12 in PHY's LRE Control register upon initialization.
> According to the datasheet, this bit must be written to zero after
> every device reset.
> 
> Signed-off-by: Kamil Horák - 2N <kamilh@axis.com>
> ---

[snip]

> diff --git a/include/linux/brcmphy.h b/include/linux/brcmphy.h
> index 15c35655f482..115a964f3006 100644
> --- a/include/linux/brcmphy.h
> +++ b/include/linux/brcmphy.h
> @@ -137,6 +137,7 @@
>   
>   #define MII_BCM54XX_AUXCTL_SHDWSEL_MISC			0x07
>   #define MII_BCM54XX_AUXCTL_SHDWSEL_MISC_WIRESPEED_EN	0x0010
> +#define MII_BCM54XX_AUXCTL_SHDWSEL_MISC_RSVD		0x0060

This hunk does not belong in this patch but the previous one. With that 
addressed:

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
