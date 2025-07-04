Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750DC2594
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 02:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751596768; cv=none; b=DydSTutN6u3mqRikAZkfzYf6dn8rN8+WHBM838WLGdQcDsM4DlMvGTqXOWm01kFH/2v5SoioPGiVBmRh26dISMpPk5xoIwsj8biM5v+CQL1+BcuLdyASCIhb5fSPGiGMSUkoFwSNO1lDKBr4/fssxdVguBsbWt8lEqLMQCLPZhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751596768; c=relaxed/simple;
	bh=gwrjCpTJbxI7EwuCkv0Rlq5eohFaL6Rb2eJhehoRSxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sl9zecaE8/SL1Ublo+exe70Iswa0WOD1keRGMNK7nlmqs5j4mR0lBAgkeYnODhWdQwfcB9+pSYKdXNl9SO+V/iVfH/QENOmCEvMW9DUYcbtbeKdGJBYlRUyGmWBepEyodEY89jZ01jsr0ymvxkqeRJxFhARgO/ZJ76d/ENWNyr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Ymt0ynKS; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Ymt0ynKS"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-236377f00a1so5424235ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 19:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1751596767; x=1752201567; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WjsYeltoq6ttH3cwmNsrMyTVKdEhqYm4Z5XYz4FQdLU=;
        b=Ymt0ynKSNaD42CzGL4XG+a8Ez8qXI+eWsn4/BfbAwS8DObQY+bIVEowz5XussjghMx
         Gp+8H7zbLmsYpTm/4FiMRvBOvZaY9ecn32zMhFeghDfY5su3SDpDR1rOGSbQV6R3ZmQr
         vK94JKn1W/N6Wjx/sKVQoQGo27wYJVLd23BRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751596767; x=1752201567;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WjsYeltoq6ttH3cwmNsrMyTVKdEhqYm4Z5XYz4FQdLU=;
        b=UpA2LtGqdV7Y8XW0Wm3KSFXUz2N8IesZNJhq5yZUvUqwljfMTe5iHRazB8XQvr0uSX
         I2+C//LmGZeOb8bycrnTuHDsDCQTEAINxyP6A9wAwjQy9N1UPL+5LSitqaeO6eBBSu0X
         7wvOfRiIRM4gy8z5kTpoHHrq03ifUCQXMk6oEk1ISrTUot5RAjcgWaLIC+tiGTa1Adb4
         YMLV1Duiaur2sM9/BzPxadrKx1ZUfqLmj7mAi2PyPNPSF6bf4e8vmvI8Z8U87bhTdqGs
         GCkQFZ9AJBPIUoCKykjQPGEtic6rpOvDRYseELW3Dq36TeoMniVCEjh2nd6mQoyFjAk5
         jLZg==
X-Forwarded-Encrypted: i=1; AJvYcCU2FV3+5uv1MhH4zD1pZUiT1BrpLEHr7/x6j3bAG4Cf0ArCBTuUXbts0PSUuXXayNmeqpDcalDaxoHw4JM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjYll0IfVNKqhkS4I3iKBVwnJXWYENzC5eDSsCUQpTKqaG0lol
	yAjlpBGta+maPd5B6R5yzIIUfad+f1BSgBWgBQkb+tf1vVqLBWJxEYebm/OzxvoRHw==
X-Gm-Gg: ASbGncv9bN4CQlz35/DeVfgW35Sj5ZPqiJRVpdnP8TXJUTBIb/pmkZsYWGlEndQuPpE
	72/nOup3O2tTYwzDa4oiSbABCAf8EebnEWvq1tXmDJy7x9kKxBL+5NpnexqvcIA1rgvbtgCvOkW
	GuXpF0/rPWMfBpyjOhs2rKdXFiX5bdvCRAVTwWDysxOkxM6YNT8Ysud6ECsgZrun8QnuFG96AKF
	MsXZjVrfyns1d8gvHf3RXKs23eXpQMJ8MR9MokJZRZisuB7ckdUbYPLHpIDQE2Co3swmGDykeMD
	qnkcFvQGpIcp+6hSZPRgnzMLtnW4sAHjWxzieBDhnm33yc4AwpBN7vXvxN/a67/EQ1DVeRrqvcV
	QdDThAyRtFbqzg9mPbvnQ3yzDREYAkFGJsGAIq6Hy
X-Google-Smtp-Source: AGHT+IGZi1m1NI9Byy1yHxIFLZRuzt75eXMvVLKpGTFbwlrlqzm3bvj+yjH+ivXGZkxE5IzAgnm9Zg==
X-Received: by 2002:a17:902:cccf:b0:235:e1d6:4e22 with SMTP id d9443c01a7336-23c8607681bmr13001825ad.18.1751596766775;
        Thu, 03 Jul 2025 19:39:26 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8455d09esm7617715ad.90.2025.07.03.19.39.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 19:39:25 -0700 (PDT)
Message-ID: <cf125ff4-e124-4f1f-a761-ce82ab5bd7d9@broadcom.com>
Date: Thu, 3 Jul 2025 19:39:25 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] PCI: brcmstb: Acommodate newer SOCs with next-gen
 PCIe inbound mapping
To: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Cyril Brulebois <kibi@debian.org>, bcm-kernel-feedback-list@broadcom.com,
 jim2101024@gmail.com
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250703215314.3971473-1-james.quinlan@broadcom.com>
 <20250703215314.3971473-3-james.quinlan@broadcom.com>
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
In-Reply-To: <20250703215314.3971473-3-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/3/2025 2:53 PM, Jim Quinlan wrote:
> New SoCs are coming that are not encumbered with a baroque internal memory
> mapping scheme or power-of-two restrictions on the sizes of inbound
> regsions.  Enable the driver to use these SoCs.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

