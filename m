Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEEA28C5BF
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 17:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751306353; cv=none; b=MlPY6W7hM80f/xp066M+oSQxUavPeqNXTdt1EwN7/ycLL4D1Kc1Nba41lf9tMo0dvEaOh3yUHREHfoag0ZaQxPK5pchUZjAUEmGv377eWdzXvuMFVRESuaHvay5utvpH56w3YGA83JssjMlfV/KenmxUky3FKAkqn6fn5cxcggk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751306353; c=relaxed/simple;
	bh=LjWR2FdU2hNjNCKTOODh+C1lb4hztRc/pVQSdU9SeUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=j8u1Lw2gCPxZ6V6n1xb+f1bHCBGVXe6L3YCzzDW305fzKCO6df/XZW2m/vimwbXDQH8nrX8ToDp91deNVqpWE0UyVteYIk8emWsciKlMqV7q8mIXfD90ceaRDHm2atzDd1Uz1sDiddxHjIWTALYIUr1jUFyjn/Vun6xwBp6jaSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=WHhwwcWu; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="WHhwwcWu"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2363497cc4dso39180685ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1751306352; x=1751911152; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RpOSE4kB1sENRURbjvd5Xh8Lf4pz424aBZWlizdWVWs=;
        b=WHhwwcWutiuJRJHI1RG8BmH/SThTr1N8/XM+9IGBMB8aXrfXSelgEnITpvscfJmqNz
         sxX7Bk7fbDflZlst2K93vDCwBUWKcDQQHCjyOgj3hdBP5tcVqbQrZzyq9oVdzPil3L6x
         s8GGw4agFJi3RD6j4Im3rqRaET5awIeP/yY5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751306352; x=1751911152;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RpOSE4kB1sENRURbjvd5Xh8Lf4pz424aBZWlizdWVWs=;
        b=lM8KNkOKkQw3ItLvx+LQ6kGoetndkSFpCTDMZ6X4XBDP4qTiiESc7ZtZYipiLT5D74
         pcs0UZ2ZqZTxJ/kbVmZY6ukb5wgX9plHfXxCpc83x1xJCf2A/iNmqXgii4jBJ39C8XYU
         Aqk6Lbx7zFfGyMU9vbAVVkxmKFL7J9//4gwqh8QGN7wsQj58D9i0AIqLcXLbdrVnvElv
         VvjtvLgDJqifmKKD2quxIkUTkAKW8Yp/NNpq/wQFSdMLMNHO9kyc1/jSmWyKdR27UhwZ
         CY6dclP83ZwZW//X+kHLDfJFHFvnirxWdE1mCh1ta5X+CSVEPMcwKy+1HFRSU+i4a4EV
         T3kw==
X-Forwarded-Encrypted: i=1; AJvYcCWNVAGrRYsLygDHHZY506xh+tQIPCsuKNsSZaHzcAVF7hHMNO1QdQAI8U+lghTse237pEgZMHEUbT+Oj6o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu9Cb3SeHoVUr60O+B8oWAx6b4TkuZUMOG0NbmMkOlm0sN/Jnf
	rbxM7ZqCf1xR+AYCh08e2IzdF6gfL3jPyh8expw0jGVA45GXz3+udBKYpqx+d3TsntBSXNuqyoe
	j6VMSFQ==
X-Gm-Gg: ASbGncuWyk3HKA3r48pbzwLSuGQa0v9Y4+fQr5610KMhEstVuazRElOoe9b+KubwGJz
	nCv+jlSHt7LgPEc6t4bkFx07rzu4yOlo56fwRjFSQTUhewb1dXt5Imry+vtUxgMNxfKtuV9J02C
	46SbH/VFDezg02o0+oqW6izOBjaq9HK3jARJ789W2KEZh4QQkGCW8zyGrda1hVQZLZfrOdKaP+H
	e9e1OUlXchZXMfmk1rCpUhMo1qD5w1zU1vRRJvc1zVPPG2Uaw7L6uReyVa33V9Rc/O0JL2mWQ6A
	F5zYoDyXz2nKPSIQxVVPK+pfHzwKmwBXIydV76tYoGAf32OlRbTSA8g7kGEzP0E3mwBtNHaS6ph
	/JMcSLxZnI526L9HrarFcO7EgPQ==
X-Google-Smtp-Source: AGHT+IEAWW9cp+baxuELib6A5bK8F62YruygOkYtIO43IOUH3tTYFCOAulrrAwyDL1QMmE+7FBHe7w==
X-Received: by 2002:a17:903:3c50:b0:234:914b:3841 with SMTP id d9443c01a7336-23ac460837dmr199260995ad.39.1751306351692;
        Mon, 30 Jun 2025 10:59:11 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3b7abdsm89809105ad.169.2025.06.30.10.59.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 10:59:11 -0700 (PDT)
Message-ID: <ae71c808-92b1-4388-9d94-8f4663a9d01f@broadcom.com>
Date: Mon, 30 Jun 2025 10:59:09 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] reset: brcmstb: Enable reset drivers for ARCH_BCM2835
To: Peter Robinson <pbrobinson@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org
References: <20250630175301.846082-1-pbrobinson@gmail.com>
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
In-Reply-To: <20250630175301.846082-1-pbrobinson@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/30/25 10:52, Peter Robinson wrote:
> The BRCMSTB and BRCMSTB_RESCAL reset drivers are also
> used in the BCM2712, AKA the RPi5. The RPi platforms
> have typically used the ARCH_BCM2835, and the PCIe
> support for this SoC can use this config which depends
> on these drivers so enable building them when just that
> arch option is enabled to ensure the platform works as
> expected.
> 
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>

Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

