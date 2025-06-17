Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26392ED17E
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 16:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750176563; cv=none; b=ScDY5T3iK0dUrfVVsi8e5vo7a6cfdnYYaxY9bPnEYpVmDOdow48GjSaWeZ3/F8TvYrKAbzrB5InFhIr1wYKQAxaydo0a/4kEOAWCkBh5fJFUa+TVjWvdpOqz9C6zhI8Yin0i0dvwo0I881r0NzVnEaI+9PtGwsXhwyKgBUV7+/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750176563; c=relaxed/simple;
	bh=yNNwuhBClP5z/1+NDl67kTkq3+gkSbITN399WhypWYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cyG3TDlGVUnbQRqqYBX+vD3joahKg5v9Q2xyeBCaZh14TFAqKr8YbJKfe6/My+S9YY8N7sfQlcaKOnkuOJKcARbIFKAoOW97jcOA+NqijqoewHxvzjFwvJzAJypA+97RY3B32CVv2ez3fJ74pJwu4nKMkhUI0zED43lq6zowYco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=UI4DXF7s; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="UI4DXF7s"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso5248668b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1750176561; x=1750781361; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fyyMIJii405rQ4iebf+m35Q50yR3cAO18FgE3Q5hqxA=;
        b=UI4DXF7sotFtMzrB9gQxiKp6wxEhekzPpydBKh74Zns6GzvaNirzeGik/HEzwq9N7Q
         ge29wSS1E8qJfUpZimJEmidmuyQB6GjzMMDvZCliQ+xPfkcTPMPWn0QeSYUjQ1nsp/vT
         qPGm9BWdQkvO+2Tp4vGuhvYyBPjWeOZM/XqSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750176561; x=1750781361;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fyyMIJii405rQ4iebf+m35Q50yR3cAO18FgE3Q5hqxA=;
        b=g18ZmpAO3iXndN5tgzIn4jY/FNh2YdDhA38ZDSOXpceg9LlO4z6pGZnbkJUW3YU5WY
         smgP0wbmG04E8h0RJnILYjfLRqpigyTgrTwsWYy6Ir2BvOjB3w+dScwkI3454rHSaEJ6
         YqiucmEmYNzzCvpeHIal178PPjxajX6hvTjZJQN8QCE2V2ZxSMXvF9jBeF0+PD3rwvLI
         NG6ob3QTLJb1WJTvJWtElC3Ns/07oBKaNtUSoxyLo26J/LQDkEMwC6b4kM/iGyjJWRN7
         lz0DdfTDIPZ5frxys4O/I5/wrDk3qk5NNGBAjuLu4x9+7V0fbfUMKzAy5f+IR0AbFpdN
         /ECA==
X-Forwarded-Encrypted: i=1; AJvYcCUw/q3NHLUn1QJswff9GXfbZQrY3xfN0hZjhE3AkR5E43jmxWCvSEb5F+od7CnRtedeY+0WnAGXMAIaroI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm64ML+z1gqeM/dg4fRljHmzVEAirFQq6TjI9/9UiC4UcfsbTY
	NfFH6MfeaThims+0uFminrVMpDt6+VgCtkZ4Z0/42I9QoxkK+Aa+hWOwZZj0QAy9Sg==
X-Gm-Gg: ASbGncuTbeoE7JEDkeqbTftGcoKijYYk+0ZLpZFEVy0NyUXFmwOFz8Mre1uIOPrMmbu
	vJcIbPkhHdaSkMa6u7icPQT6b5VgPy1feFYP5996J1oCippuq76dSUkTc3b9ofy0XAspKy/YBtW
	UPjC+ZZesQE+dNaQKpeRICOwFvPn7YN9sbofAajzLdJdxJUcQyiU3YjiRK10A1DFLaY8Ckh3eFk
	AjIpiFykV9Yh4bwmKirlro6gUoJkl8GRqLcaMIEnKSDWx47AmE8bgKBxY51hY16GZHaoTu4fAtY
	rcEToc6XkQqUvUnT3m0mnECSe/mJcS/evLUbqpvoQEhJsdHZoliVoqL3/s4gAbPvA38kx6FAygB
	74t62cyMIMqfy1IMEUnwml4f/HQ==
X-Google-Smtp-Source: AGHT+IGK36MVdq/1ZPKqGXvtTv8iePTsxYQ/bzj7zk5gGVG5JWm5l1CPgsgiHsN16nUfSm11AR9EUg==
X-Received: by 2002:a05:6a00:3e17:b0:742:da7c:3f28 with SMTP id d2e1a72fcca58-7489d0559d7mr19621560b3a.21.1750176561106;
        Tue, 17 Jun 2025 09:09:21 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7489000749csm9379380b3a.68.2025.06.17.09.09.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 09:09:20 -0700 (PDT)
Message-ID: <11b9e3d8-4845-48bd-a217-46f9046f73f2@broadcom.com>
Date: Tue, 17 Jun 2025 09:09:18 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 02/14] net: dsa: tag_brcm: add support for
 legacy FCS tags
To: =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
 jonas.gorski@gmail.com, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, vivien.didelot@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, dgcbueu@gmail.com
References: <20250614080000.1884236-1-noltari@gmail.com>
 <20250614080000.1884236-3-noltari@gmail.com>
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
In-Reply-To: <20250614080000.1884236-3-noltari@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/14/25 00:59, Álvaro Fernández Rojas wrote:
> Add support for legacy Broadcom FCS tags, which are similar to
> DSA_TAG_PROTO_BRCM_LEGACY.
> BCM5325 and BCM5365 switches require including the original FCS value and
> length, as opposed to BCM63xx switches.
> Adding the original FCS value and length to DSA_TAG_PROTO_BRCM_LEGACY would
> impact performance of BCM63xx switches, so it's better to create a new tag.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
