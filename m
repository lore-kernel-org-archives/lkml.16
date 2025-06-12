Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E76214A7C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 20:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749760251; cv=none; b=ZcepRaST6Gx3xFzNgwvBV/zjcOI7SWv1XR2Grg05i5fkwzIBIhwEjOJrwCQt4vTWTdJr9XMA/0i4hrh+/vEVxxOvzxmAZCYVNkl4BQwxpVGZHpm7Qq3ZW3rl+OElK9BpA0fsnPJYHANtrAM1JGM3S/5GCV6mgmuK66CYLKfVfYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749760251; c=relaxed/simple;
	bh=8U/Xvwpqyu2zIqJ+cd/W68aNh2NJo7ghEbSN8TMP4xA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bCPkoPqDetYAlYiF643RtXb7dhZrEz1d0L3wt+Xa5aTzrU6gTlH4j7ola8G3WSkGCh0tPqRQ7MJTD2TGGNqQ7Ml44VNP+4wqoF3dUErykc3zPxyFmnPdyb2q5vu8IIv6GZASZThDxqP/5oM4GtJOIH+2ZJAr09RcuB8UfaUs+0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=FzbpUD2i; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="FzbpUD2i"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7406c6dd2b1so2424345b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749760249; x=1750365049; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IfZew4MeawBql1hqYTJN9IQ7af5WvBIf0sZQmVb9XHw=;
        b=FzbpUD2iueaf8gcjhxSJprZxMiLgUH2EZldoYNluHpLPuhh9a5SEmt9zOzYv9SEeD1
         QItHrCaUgSt+Wfa8+3YbPFTl1ADy+0fMr3hKc3Bm0DFu9q+tYDfTpl1OfhVIUjAjZPCQ
         17NTeFnzMCKjgkSRXRsNQKpssDXVTKNfRagL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749760250; x=1750365050;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IfZew4MeawBql1hqYTJN9IQ7af5WvBIf0sZQmVb9XHw=;
        b=KA8PvmPzkUSg83HOXuxAq1s/99O1FvmubQFAk1gKWYr6iz9ODqoGo954L5MEbmqWFt
         4kbJxl5ZpzMQkn3349240J8dfpP6k5z1bfbEZDqr9GPHKsxJ27+oZcFQ39m5/shuQc2S
         a6wliaX62uPpnnwttYC6Magg7DLEgkkx9PSP56KhyZ5yFQ/2cBpnueTj5TjTgXwVDctU
         k3aAlS7kOKyw3tKOI+iLYnPMZnRTLLL/TEql57CTwYvCJQ+IF1dVZiluEASMRxxoffYF
         oCNeN0tQaY4uCAeUU9M6KF28u08PaN7sGE/yowYNl8wrfJmyNe+YoEghIqNDUZfMtqQO
         OHRg==
X-Forwarded-Encrypted: i=1; AJvYcCXytYQPNNhQckB+HeV3p7NHtNTE3qM6KdMMvpFKvh1QsWQmWujVli/qBRwFOZ4yxEyNPCo4w7seizNZr0s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzL3sBRU7nF6z4wkjI3xHftlg5e0Z5H/zY9kRPXvqDDN2VuaVPG
	W9EX3Wt6CgP/ePrkrrsHifkcbfIgfkDorXm4RG4XY8nV3sn2C4QbJUo5OVTzhCcBig==
X-Gm-Gg: ASbGncsb6p0UgrwSkLLOIWJg8PuF/wi/4Vfyeg2kk1LeKz2oBCjOj7nAkUR4dxSnur0
	dRQeTB/wFfTEaTqvvPDLTK/+MhnqtjFdZIn8EWZNv1N2XmCv42cPCR4hs+sZDu1R+S9g965Bu2X
	szfGO2UjuPrnsNVbTg4O1AHuloJ1LTbkswCEyjMmrGx9uEu+hfTyvwgv1dudyFa/SnU/DmHgVm+
	HF3/piVGCG5U33Ts0mj/7L0HdnkEfoBLCY0un8iZI/kH6Vt/pmbUvS+CclRi4CHX/FXmJeteLQc
	VS2/SVBWDAfVble5oB7buJuvLLFcaFfB9zON0rlVo4GHXVxOBPBeqcm0IGdHTTMW7RJltJwINDl
	/b6rxzsWGX91FWTihcqZvgjuktg==
X-Google-Smtp-Source: AGHT+IFcjJiEu2e9q3ebMJIMXfi9C6Xh5hl4cjro+1dnZbewk4L1FhqpOQcD+Rh/HOVC1b1UTLkfXw==
X-Received: by 2002:a05:6a21:a49:b0:1f3:1ba1:266a with SMTP id adf61e73a8af0-21fac105c27mr549999637.0.1749760249598;
        Thu, 12 Jun 2025 13:30:49 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffecfa4sm161704b3a.28.2025.06.12.13.30.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 13:30:48 -0700 (PDT)
Message-ID: <c7afbe7c-f753-4330-9298-974e66dc483c@broadcom.com>
Date: Thu, 12 Jun 2025 13:30:47 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 13/14] net: dsa: b53: fix b53_imp_vlan_setup
 for BCM5325
To: =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
 jonas.gorski@gmail.com, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, vivien.didelot@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, dgcbueu@gmail.com
References: <20250612083747.26531-1-noltari@gmail.com>
 <20250612083747.26531-14-noltari@gmail.com>
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
In-Reply-To: <20250612083747.26531-14-noltari@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/12/25 01:37, Álvaro Fernández Rojas wrote:
> CPU port should be B53_CPU_PORT instead of B53_CPU_PORT_25 for
> B53_PVLAN_PORT_MASK register.
> 
> Fixes: ff39c2d68679 ("net: dsa: b53: Add bridge support")
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
