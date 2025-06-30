Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3136292B42
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 17:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751303193; cv=none; b=K3h7kmWbUxbp21abYHAndWIgfZgmmptl9utZz9/PQBNPzTtEb5jdDROq8GuHsvFJE7FLV65GkmzA9HSYSU3bmpa0voYBRg0ISLy4cpSu4F1Shkbjqg52CHgIoodL/canFXmCelk99ZYS9y4gVrT0oKhkXO9T61b3OiS5P8gAIAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751303193; c=relaxed/simple;
	bh=ZnYtzWcx/Tg23Gzi2XKx9ZSum6oIA5UDT2WfAcCNqKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LBecY00OvGSnbiQLKLt7cvOfPygzAr8/1RwxxPSy9r9rLDOaFTkLNZQN74My9sIOT1dV+qLB3UJZM49bQRNWc0HhWO5iPj8SPWFbl17PM6eWMMVm+FJ9bNw0uwvwiMdLp29lKfyDBqk9/OBQ8DtU4aqCCDbCTjef/IyQm8IBapo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=eCUJ0XYq; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="eCUJ0XYq"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22c33677183so39030675ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1751303191; x=1751907991; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OfFLkp6D/PrPbLIpjJK9Xbh9yfQ9lKQhUZxAN4gT9kI=;
        b=eCUJ0XYqvNUzCbWDFFeecxBAGON6QuWd1seOwGnxfHMXte4LRZT3xCgqgflyK8ImB/
         WzYNpAyg6F3/LzZa4q2RMOUp2mkW5zoG5RJZFuniDbmWO4/plnhWIuxRlR6+mkzuF0WO
         eM3xrAR5dhbqK65YLDJwxOsQ7YRIstho1hTFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751303191; x=1751907991;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OfFLkp6D/PrPbLIpjJK9Xbh9yfQ9lKQhUZxAN4gT9kI=;
        b=Bt6A42A75ZEMuyX0E4xGBKxWXCcofE5X0WELLe+NfPDW7CRAHzWI6DxOnoR3TpTwoO
         Seq3t5Uvd+aV2cg1Odw09tM1hf4PfPcoBm+eKS89sC6trXyae4e3REG21Zyp2vzZnpIg
         q92g89KHAdkpa49DVz0ACGP2Se4ufoqJ4QCOtLksImhJDxl+dKmeoFv18dK7vhh98WNW
         kqWPFsmuaSFi1GTdyOfVEoQFLY8KsAjh8I/mz4Baxxj3MF4ZFlk3l+gkH3q801rrcdGj
         qoguCmv1YxrDzjUzSkvvac3IBWd5ee++daDWodXeMKPtqZ3OXI8LnefiNHl9aH1QiAyH
         UjBA==
X-Forwarded-Encrypted: i=1; AJvYcCXJt/K/MOK+yyRRB9yF7f6iPxfAdtcjok1O/I5zPN2w/HE2+MNW3MxFCP/dIoXzdnaGhRkCrlBShZX1FV4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/MiiTshHk67sLnGtqzdmIqJvExs8/hdFS8JXPLPlz/4Ckcpoe
	vLyGaEuhrTu2up0bhSDhA99qk3qwlRuG6UFeNf708GxJXlahuQX5Kmvo2gaZQJgGvg==
X-Gm-Gg: ASbGncvDQOJC8bZcqgCbiMB/UKjO06uX/x4ZvOS1+KJkC4PTookqYYAAdsGcCtcZyMR
	hTFReO30Eiv/lbZ46fPPMhwLrvwyUcGw+sGIBCvPyyTDJQQ3Ex2xloYvcWQ4VKFSyf9aSgfdw3L
	CgePX5eMX5YyUpqmCdjTJmT3AN2E+NMSF8yW8ZVpNgtCPODTrEF2P75hUialqo2Q/3sLrSwXIms
	8PxzqyqBX9FAM/CopN3QJt9add8URHBRriZ4pJfGwiMZBKFV3PIyyEIrVXXefGeIvb8vGymANe+
	cfgBu3F/JMkCLlrlkvSsz97Pk8aQdnndBj7GBGiUh6mKm6V/XLiJXmXoyfzLfbTkRgo3sPfVceP
	hwDAa8Cm7WyonhYRYAqS+vTsirJN+oAVX0saK
X-Google-Smtp-Source: AGHT+IHtvYSI29lpa4uFyCVr6ttvK9QCW1VFi1ij5rUNCrPku4aMJmZxgqVYzcd5UyvL558jdNu1Uw==
X-Received: by 2002:a17:902:f545:b0:234:8ec1:4af1 with SMTP id d9443c01a7336-23ac19ab87cmr236389445ad.0.1751303190891;
        Mon, 30 Jun 2025 10:06:30 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2e1bfasm89539885ad.20.2025.06.30.10.06.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 10:06:30 -0700 (PDT)
Message-ID: <034736ec-4449-42c4-9b42-69a0cdb364de@broadcom.com>
Date: Mon, 30 Jun 2025 10:06:28 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v4 1/4] net: phy: MII-Lite PHY interface mode
To: =?UTF-8?Q?Kamil_Hor=C3=A1k_-_2N?= <kamilh@axis.com>,
 bcm-kernel-feedback-list@broadcom.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, f.fainelli@gmail.com, robh@kernel.org,
 andrew+netdev@lunn.ch, Maxime Chevallier <maxime.chevallier@bootlin.com>
References: <20250630135837.1173063-1-kamilh@axis.com>
 <20250630135837.1173063-2-kamilh@axis.com>
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
In-Reply-To: <20250630135837.1173063-2-kamilh@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/30/25 06:58, Kamil Horák - 2N wrote:
> Some Broadcom PHYs are capable to operate in simplified MII mode,
> without TXER, RXER, CRS and COL signals as defined for the MII.
> The MII-Lite mode can be used on most Ethernet controllers with full
> MII interface by just leaving the input signals (RXER, CRS, COL)
> inactive. The absence of COL signal makes half-duplex link modes
> impossible but does not interfere with BroadR-Reach link modes on
> Broadcom PHYs, because they are all full-duplex only.
> 
> Add MII-Lite interface mode, especially for Broadcom two-wire PHYs.
> 
> Signed-off-by: Kamil Horák - 2N <kamilh@axis.com>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
