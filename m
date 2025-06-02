Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925FC222591
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 18:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748887690; cv=none; b=mxOhsh8cQRhatlnG8/XQjT/A+dU7W1i3Iwxcvw8vKWjaHmqDSF4Ls28bHJXoYPvXdrEBKPkJ1s5S1lzyOdud64fGzyhTzGy5L32VJEiYaFAihsY/ZrAL5rf6nsi7buqhwg6G5RsK6G6ji26mczVzjCbJf1RaAOitDV0rJgkfzvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748887690; c=relaxed/simple;
	bh=sag0Pz5b9uIlnG/OAcVXW09SmLIrkQxbFKofb/Q5dKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qt6mnmZd2eVvuykUlv2BWN/SChM0r6QBTAXpBN5xuPwwoC6L+GRXZKUTUGfJPENyOWk+8j6aSmEuR4LSJwyKVGA7inzInilu6/GR2XYpjhbRzxXNSlWHdZwcYZ9D5+T+sOhnKUmk28R3mzY7q81hl5L0mITw9BEwDeMburQGV8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=YPsPaRGp; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="YPsPaRGp"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-742b614581dso4636411b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 11:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1748887688; x=1749492488; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6j//nTIE6oBGFOtNKeUJ1wnwRaCxrlyjsMAQErFdOAo=;
        b=YPsPaRGphBO8YRnSVLS1BxruXDBPqhX6Zf5D55Z0rd72wubRWCk4KpHsE55ghOZhZd
         Ehw/+J+jikLZblTy4h3W+DYTNFXOb4S0LoeWlYGm2h8SKvxV4Qlyb7kK1gN/pGh2uidF
         Kkp4Q5ocWOoNXFkUjY3bejUDLKZ3+OMuZHslk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748887688; x=1749492488;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6j//nTIE6oBGFOtNKeUJ1wnwRaCxrlyjsMAQErFdOAo=;
        b=PfaOy4FfXPXAatyns46nDz1sAI+AG/fX4ClpeCSbM9NklIE7sxv+EZfOmRVw7jC9Tc
         5QTfWlFoxpBfULqbHt4PiAWQx0xku/wOYzdTXtzoQiQrpYPhkbC5eMSAojPub3qlebOS
         sDLo2izhTzzEJ1vKez32z9DI644373dccafnDP7Wz0/xIIwpSpPvSF+Qe1OgWPNtXREF
         spBL5r3KwGE6ESAtGhQHboLLrUU9omG9s0sQQTFnaELuHYRKjpq3xu0WMqvAh4CZu31z
         ww6YjKkTsXCSJv+2+WQEnXFfIX1wyGsx8gjfBfPR732SDa2jKp/eT7Q+Z6u+90Ce+ATI
         o4zA==
X-Forwarded-Encrypted: i=1; AJvYcCXrK6/nWNCZZLR+Fc/TY8c/Y+NjE56tHuJ+u07NjDsp4ND1036A7VaFmEim+x/tiQHsQM3b5N5l2aYeg6Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6x4Wf2XYXeF8W9hRCcgqDiNGGC2GQ88J451J9QVtzO1wQVAMR
	I++wDyH9VJzMl82rRekTU7HSLlGSET7kvnXPybqc2izarlsQSmglRstWO5QfuE1jvg==
X-Gm-Gg: ASbGncsAqu2HwbsrUto63oHSUSmgV4P0991EEUAHwTh9wUB2lmpGAgq1KBuYhPQhNv3
	ZWrXZCJJlZYp21fWyi1tJbxZZAc3ObhzLB88VOIu2AzjJu5ek/qsUi+Z1sCSX2ItCTthpNkQpFn
	vuRRL7lYzzqQ+LRAoiX1neO6/uaYLbeksEgJJ3e+q/vObsNB77GnLw4oAdggQeYJczw+JTBs+KO
	xH0ksoTVQSZs0K/5+thX6KL8rx/LC0ZXlgrUI0E/Lneqnoz6uE4uhJTeQ5VsrA0I2N+407sb0LD
	Q1fN/CiTFWfzxkTLUS7cbQheCmp/wkPaTY3cajvZvnQH58jIQ2UhcL+P6biZ2bYPYDixOKAKwbP
	HgcW0yy6CAq+7kWjOEOP3yy7G6w==
X-Google-Smtp-Source: AGHT+IF25K+SIXjruT4+IjW1C6zlESy2QIyIegg50t6gfNgh19APed5KCZExic1Ax9HpY1Oyspesrw==
X-Received: by 2002:a05:6a00:1790:b0:746:3200:620 with SMTP id d2e1a72fcca58-747c1a7b7abmr18972635b3a.9.1748887687744;
        Mon, 02 Jun 2025 11:08:07 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afe96468sm7931791b3a.27.2025.06.02.11.08.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 11:08:07 -0700 (PDT)
Message-ID: <b178ea8d-4f7a-446b-87c1-81e13432458a@broadcom.com>
Date: Mon, 2 Jun 2025 11:08:05 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 07/10] net: dsa: b53: prevent GMII_PORT_OVERRIDE_CTRL
 access on BCM5325
To: =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
 jonas.gorski@gmail.com, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, vivien.didelot@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dgcbueu@gmail.com
References: <20250531101308.155757-1-noltari@gmail.com>
 <20250531101308.155757-8-noltari@gmail.com>
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
In-Reply-To: <20250531101308.155757-8-noltari@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/31/25 03:13, Álvaro Fernández Rojas wrote:
> BCM5325 doesn't implement GMII_PORT_OVERRIDE_CTRL register so we should
> avoid reading or writing it.
> PORT_OVERRIDE_RX_FLOW and PORT_OVERRIDE_TX_FLOW aren't defined on BCM5325
> and we should use PORT_OVERRIDE_LP_FLOW_25 instead.
> 
> Fixes: 5e004460f874 ("net: dsa: b53: Add helper to set link parameters")
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
