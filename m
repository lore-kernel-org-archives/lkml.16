Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BF428FFD2
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 17:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751303214; cv=none; b=gFkpDXoEJk0mkGdOIjtBMG+x+S+7KapkrbCJ2EqiHBSRARKBJJf+5zd7qn/7VlUz767tL1VDbIYxpPP9p58VcXggglarv4D99r2funypA1uu8q7f0DYa/9LZuIoT6PbmvBuMXhLBNPoTx84gHiA0kQFQ0zKHAElT/ACqQ/eZ1SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751303214; c=relaxed/simple;
	bh=izs59r9WBrv5GyJx9Zpeq7S8DdpxMD+d6DH2ORoIOBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HmwS0zqu+PUz0EnzDYdWfgSCb3qGcOCs2uC4pXocem+BkCWNaOqlHeUBnVcr7uZRpoXYcN+2MtWbRNbLEVEtFGievIV7ncbaJXOsFT6nP5iFCBT7/GTU/3Cnd8I2k3uM6gMR/ysMTtdPBiO9QerizeOj0LpogXrNxJAWjr3OKqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Ma3bcT7N; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Ma3bcT7N"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b31e0ead80eso4156972a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1751303212; x=1751908012; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NzPjt499qxPlLKt2L3CceptuBhtAjZ1REOION1W1xmY=;
        b=Ma3bcT7NzPgIV3yZkGf88I5U/2wVqDXbWGBW8+LEgdQX98QrZZUFCX7c8VBXo8AGQ3
         XbnepMbRrWjcuuvI0z6K9NA6vfNh2wxVf90P/l0i0uNUX8UxLbvbWLk2GDnw8eT/U+tZ
         tXxhOaNrdKojeWzXqZ47KvI2UB5oPBATkD/2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751303212; x=1751908012;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NzPjt499qxPlLKt2L3CceptuBhtAjZ1REOION1W1xmY=;
        b=eXlv7ka7+cIFQb5fipFfZ0XAkDypU5tSdyhFRTHKdB7nXJN/pMq7JM3H5QCIo0boo7
         9tQb4vZ0J5zvu9ICXdwlY92ppzLQ8+3TCjUtWnTasiOeIvopboPxLLrjeVsikkpcRmDm
         1FsBeHugfx4Oq1OXeb0SsczzkFziot0KT7P6aYuRM0BE9gk0YpsNAejpMpxXgQAtIY/0
         sEYOhiSRxqaiP26K0aJPCVEGmn0ettOyxd/xndcpnFq5xLosRsLlrGvyJ02lZ2G6u6wi
         Qtcq++zP/ZiNyALAPnfMlSEauHJ8MObKx8m3o17DRqYrgmtHhRi1ujFlLhNPsEPYjOO+
         +szA==
X-Forwarded-Encrypted: i=1; AJvYcCVoNcewArtm/t9A2MJGWev3cI6NH9mLt+175leZlkpAuFSN7Q0yr3UxrSawmRGkYLWylK5Rwhlcr/lmxM0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiqFnjgnpBeMzM2XY6B2OH9CftCyHlN8M8MmSDBTzVsuSutekO
	91PfpICnCeikQBe2STIrq97tjq1sJgGNRVJtn1O4pI09c7lhCSZ0nX1AYyUXZQzjfQ==
X-Gm-Gg: ASbGnct6JUnOiwTe7PNFOCRyKzu8P6rnm4rrktjg5gqJhraPMV1C+3Tb7TWZ3pN1vi5
	yAnLXFyFNhqG58SDZBRuMrPAbmXQbAqtxpittPNnNi4plp0ET5LnTbj3SujZ2MwEf3blpuDtEqr
	snNUELiM9eROymj70I8J/ANd98sDy8NDEOkARK3/iGP/a7LM3aq0wy19ae7OT+ApJe4yV5ORn0G
	/vMD7N7ujppy5mCVzrww6Lo8Scg+Qc2HwvwPAol5ngb912LFDeiSWT5QvcT7MRyVV9nxgOL+STa
	vtzSO7byHetPpYXNm2rzPRwSbR1BXh4cQ8a5FIGGArbqgWfbQ3gelu2IcAku86BXHPlgELmtjeA
	+Zt/Ed35AUKHULuZPhH/58KlGIw==
X-Google-Smtp-Source: AGHT+IGa2iHXShPl4rP5sIP+kkEeguHbxJXpjTqQTzE38tO+uSGs6mcnvquRFlZAsEy9RRcd7GIa+Q==
X-Received: by 2002:a05:6a20:12d3:b0:215:df3d:d56 with SMTP id adf61e73a8af0-220a169c8bcmr19470047637.21.1751303211997;
        Mon, 30 Jun 2025 10:06:51 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e300994asm8534393a12.3.2025.06.30.10.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 10:06:51 -0700 (PDT)
Message-ID: <f4d6d8bb-6100-4aff-9e18-15f464d6b569@broadcom.com>
Date: Mon, 30 Jun 2025 10:06:49 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v4 3/4] net: phy: bcm5481x: MII-Lite activation
To: =?UTF-8?Q?Kamil_Hor=C3=A1k_-_2N?= <kamilh@axis.com>,
 bcm-kernel-feedback-list@broadcom.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, f.fainelli@gmail.com, robh@kernel.org,
 andrew+netdev@lunn.ch
References: <20250630135837.1173063-1-kamilh@axis.com>
 <20250630135837.1173063-4-kamilh@axis.com>
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
In-Reply-To: <20250630135837.1173063-4-kamilh@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/30/25 06:58, Kamil Horák - 2N wrote:
> Broadcom PHYs featuring the BroadR-Reach two-wire link mode are usually
> capable to operate in simplified MII mode, without TXER, RXER, CRS and
> COL signals as defined for the MII. The absence of COL signal makes
> half-duplex link modes impossible, however, the BroadR-Reach modes are
> all full-duplex only.
> Depending on the IC encapsulation, there exist MII-Lite-only PHYs such
> as bcm54811 in MLP. The PHY itself is hardware-strapped to select among
> multiple RGMII and MII-Lite modes, but the MII-Lite mode must be also
> activated by software.
> 
> Add MII-Lite activation for bcm5481x PHYs.
> 
> Fixes: 03ab6c244bb0 ("net: phy: bcm-phy-lib: Implement BroadR-Reach link modes")
> Signed-off-by: Kamil Horák - 2N <kamilh@axis.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
