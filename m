Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB6C8460
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 16:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751302034; cv=none; b=uc5PHJD6xmwUCdRJNCIHsIfzVI7bC1lf19FEmaDoa1i3hPlxEW3ZGJBfsYogZ4HDEOc4lim5G9MiDhIudmjGsJ6Tg5N3F4xFPaRv0sXuZ2c4mFr5gvxwgYtCVTYPqUArlbfDlFTMMIZonuMwVvZg5XbyjYJGhPsW/+Jg77obwYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751302034; c=relaxed/simple;
	bh=3r3PGnaL912Nk+uO8fMqW8TAYiDVtxNs1x3CwGxtPoY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=LwExeLXxovliEwkzgzCN3FpXHp8FB1a7o9hkMu7aSizWGITzR3Sr4D22DK7ORnaMLrw35xxnqiHvjes1ImlisC8WczaAN11V1IgZMJ3WRThoSlG7o130w5w/dk/J9bk+jRAUyqAkVtFBTHRHd62v2O75CzirE7KF6ZXKTZFzkg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Cf7GHJ07; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Cf7GHJ07"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22c33677183so38844665ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1751302032; x=1751906832; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JcgYKXtTJMODWWKRmOEbNPdVlu0A72bZmiOgTq10E0U=;
        b=Cf7GHJ077Gxe9+t6G/KXAkD9ui6rVzMfUdzZ0c4THLzF7C+kKsQUwVm22wss44xSNR
         D2Nk+zCT+v51vr6XlEmmcAyM/Zc9HlRjI7Wegv8Cw3W99jw9jSuEVBTAAGI9eG7Qhxpd
         GcKNeKxdjC57YX3A9O1ZmxwerIy6Hhf27oFF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751302032; x=1751906832;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JcgYKXtTJMODWWKRmOEbNPdVlu0A72bZmiOgTq10E0U=;
        b=TR19AwdTDMQTHWb55h6RfV9kTBLvT/Qp0zKJGtfEag9tg1ts+GlJ+29pnfF7guUiTN
         +Fr/+xNXRIjUpVaEm+PuBVn/tfcqRpMBjk7AodXQcUUWsPApE5H89QupFTIV1C9MZ1zh
         X/SFsSu3hHvpy7r+vGqyqa7YIr6jr4FLqK/W1rpS6PZdD4iZJiWFM6hDmXq5Y7QQwLcb
         TLYVwcEx/VGoABEOGUvt+r/ULjxlckAwCe41Ui/l6iPcUYzVUBs10wfQKEjt/vdJk2Dc
         7PiuyUuhiL15WHUPH0i9q5ctdCBdCap5Z97gUADPEXFBZzvovhgY9ZKNycps8KI9lVc7
         oHtA==
X-Forwarded-Encrypted: i=1; AJvYcCWUWkmmU8XS0z8Aao/v7cOLJL+nRzbG1CIWtcAnXqdp5lEGmKnriq7Il5m6JISRkP3f0CdCEuUiCCvk1Mw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsehZtq3oo1fj4uMmSMzbcbAJ8/IQdTkV265G3h2+8Zk0/utMi
	JH1GTBYaprcDSAewTDTFB9wlTe2bCId9udMt/e3ax0dDSHQ3P1k/YHvk1ieU7J6NBQ==
X-Gm-Gg: ASbGnctvsAC9QMmWVatQiXNm4/4Fi5ByV2/eGP++tjKiLpJFa6Esf3O6FNiQT/6KErq
	eoarObKiFeG57Z6fNkpHLVdwTeon0Tki9lgEXNUpqnXCtpUgrBkIT2W09zQ9urYNRj/pE1zpL2B
	0zI2RvWTFtW77+3I4PnYUuY7vWpVtDCYR6AHLxUiFOcAg47PoTkRAXUcoJ6lnPV/bWXZXAObXex
	hsgqFw+2dhzR9Oy4qPeeiB6DzxY3rfKPayB8CXFf1PPV4qW6xbRaae0mOIbSFClxCZGN4uZEi7o
	736Uu/M04nJfYiVrueC8CDE+z9IzxFZLbyAfkj0TijGmM79BEu5O8jZPHUBFJBI73ZlKn3jTFQR
	I4A/fg6/F3zUyv55JSQUX8cMdNQ==
X-Google-Smtp-Source: AGHT+IGiuNQvKhXtdt6Ok5Fr1YoMyXqYXB7NB4fc/w62CH9AcVgfoYg4At+1zRX7yiy5rot9P4MTZA==
X-Received: by 2002:a17:902:d2c4:b0:234:c22:c612 with SMTP id d9443c01a7336-23ac48b49acmr234387375ad.43.1751302031953;
        Mon, 30 Jun 2025 09:47:11 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39bfdcsm87682315ad.105.2025.06.30.09.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 09:47:10 -0700 (PDT)
Message-ID: <8ddc17b1-fd20-4cf7-b9c3-d002dd1aac8f@broadcom.com>
Date: Mon, 30 Jun 2025 09:47:09 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] reset: brcmstb: Enable reset drivers for ARCH_BCM2835
To: Peter Robinson <pbrobinson@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org
References: <20250630164503.399835-1-pbrobinson@gmail.com>
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
In-Reply-To: <20250630164503.399835-1-pbrobinson@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/30/25 09:45, Peter Robinson wrote:
> The BRCMSTB and BRCMSTB_RESCAL reset drivers are also
> used in the BCM2712, AKA the RPi5. The RPi platforms
> have typically used the ARCH_BCM2835, and the PCIe
> support for this SoC can use this config which depends
> on these drivers so enable building them when just that
> arch option is enabled to ensure the platform works as
> expected.
> 
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>

That makes sense, I would also update the default to expand to 
ARCH_BRCMSTB || ARCH_BCM2835
-- 
Florian

