Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A25478F43
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 14:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747060696; cv=none; b=FfRT+OQuPK/IC/lZDceM7B+CvKTGo8Kfe+4//5FsW9QgQyUw00Tu79C1TIH0q5Q5DuXTF3j40+JfLDfCAK05k09Yk5Uoe9Jp/4njc6Q6nG4xCBB7h1+JI+2ZpuNI9E56+l31v6uEAxPZQSoEVHuJelUgvPVFewHfR1gNzEL8TKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747060696; c=relaxed/simple;
	bh=Sy6EpNC/Y+5ukgFoCzt3VwoEYi0RJAdFAr3piAD6kAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Q5/IzgZfabjW6PkDS6MJW+EthiL0X0xIaEYan9ub2l3XyxnFEmpcbqf9ln8+oBg78oajHGGbmld7icJ3KpMqu14zFQMq2+lNnom4lPCOg8JBTcV2g2Y7ayWbNPlU0SaBdO0D9Y8KkGSQZvwoPOIMIuhI2VmWaXdAcmgs6i44a34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=RohOeaqH; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="RohOeaqH"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a1f5d2d91eso2452898f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 07:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1747060693; x=1747665493; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7EiJ3KDheimK0eEoXvhBi6uLkJp2hVXs5X1KRMU6bsI=;
        b=RohOeaqHel04FTVUovN4SgGvodNZvR9HuGBM/H1JqSqBd924n9tMu4NHbmpiYEZq6C
         +ZDo6RX2/CAZjpc5z9eAPIESfk5Gv1jyobeK8Egi6REEXSQ7baRpqYcHTJzPlFyc07po
         zJR7qXCY+zT+gl4rZi/hBn7gIzvEX6Db0Dwmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747060693; x=1747665493;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7EiJ3KDheimK0eEoXvhBi6uLkJp2hVXs5X1KRMU6bsI=;
        b=IyWzsrXQ1U74PC5nILgMW3uW8t0Gpj8pUU5xql6Gzl++9HzvZtGwLTk8Py4gDE+S4z
         JQdVVLff+6UVJ7b0e18v4C6qMPCgoyngjq80C0cbMT5a+9A5Vt7YVGBJN6NDPQL6TjpM
         yIH+xlb85f6ObG4tk7ryiekXX//nvT3n8DZCFwMKqV5528TCQ8BHnwPF29PM8btzr3iA
         QPnaZUcoVrylH6qZgzwtELNJMazoG5M8ih0W8I4w0JNVgSsHXsKi0x18BNgo9SEPFT/7
         +HWH3Ze5LoSzLbv7drp6Kr+Kpke/kVAJVremjeKakRCfh1JYk7S7mKwjkpHpT/HVDaV9
         dr2g==
X-Forwarded-Encrypted: i=1; AJvYcCWvZqkmIGwWenNNi6cH3HH3nqtimFoZ8tJeVgp/61H0Z3GiuheVZr9pHfRw9YUecETd1mhD5oAn7A4yMmI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSHyD2swQBDOsDoEg1rvYwEMcPZ8XJSo0ZbLjv4mOxLpQV4s7u
	hQAyeN0gYxZlYpqcuOcTeEagc2n+KzeE7qszpKgaDVR4JX+fxNgIejidaPl9sA==
X-Gm-Gg: ASbGnct7/M6KTt4+R5Ge3wZ76qXmC09JFEwh2eCLam51WisNP1JxYIwmi7N1JCULwr7
	J/Na79FXi/0fslTZi6rKnUCOJpAWFxW4pZGQTaOwW2RyHw8EfUo9edi1jggzEnfqLYgYV7nRdD7
	GzfHPWInZUCONqVaPFqywzM6Rwyr8ItkFqYyy8TzJ9E2CaIAPFf8Kr44p0+/4xectQZzOprLP1W
	Z793AY9N2/R9GMbj/GaHzeOhCLVuQnyD0Jggn0ybWzYP2BWBXgc/+pQwkwfYTkI/9I33WpZ2Z6z
	WpMsF6c1bswzqE4zQbWKJAPRn8epN9VNki573T9/vaPLU3pTGq/0LS4stFrY1eAl/A2knXYQqQf
	U6eL8Ez+U6alWhMikHw==
X-Google-Smtp-Source: AGHT+IHtVKtNckwkGS0Cg04t40M2HE//ia/rcwOCx7LnM+yXL6cnr1sfbIg2b6C1vkYs0SueWv+2Ww==
X-Received: by 2002:a5d:59ac:0:b0:397:5de8:6937 with SMTP id ffacd0b85a97d-3a1f64a4b57mr10113915f8f.41.1747060693115;
        Mon, 12 May 2025 07:38:13 -0700 (PDT)
Received: from [10.229.41.21] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67df574sm126777665e9.11.2025.05.12.07.38.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 07:38:12 -0700 (PDT)
Message-ID: <c19fcd0b-2004-4c99-8733-937fcfa0769a@broadcom.com>
Date: Mon, 12 May 2025 16:38:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mtd: rawnand: brcmnand: exec_op patch broke < v5.0 controllers
To: =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
 dregan@broadcom.com, Miquel Raynal <miquel.raynal@bootlin.com>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Brian Norris <computersforpeace@gmail.com>, dan.beygelman@broadcom.com,
 William Zhang <william.zhang@broadcom.com>, frieder.schrempf@kontron.de,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vignesh R <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 bbrezillon@kernel.org, Kamal Dasu <kdasu.kdev@gmail.com>,
 liao jaime <jaimeliao.tw@gmail.com>, kilobyte@angband.pl,
 Jonas Gorski <jonas.gorski@gmail.com>, dgcbueu <dgcbueu@gmail.com>
References: <CAKR-sGezB_SEb7UfPV6o6T2yibkAzNSqK9Hry1kNM46BMsH2_g@mail.gmail.com>
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
In-Reply-To: <CAKR-sGezB_SEb7UfPV6o6T2yibkAzNSqK9Hry1kNM46BMsH2_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 5/11/2025 11:42 AM, Álvaro Fernández Rojas wrote:
> Hi David,
> 
> I've just realized that your exec_op implementation patch broke
> support of v2.1, v2.2 and v4.0 controllers.
> https://github.com/torvalds/linux/commit/3c8260ce76634291aed877032a41e373884d69e4
> https://patchwork.ozlabs.org/project/linux-mtd/patch/20231125012438.15191-4-dregan@broadcom.com/
> I know it's an old patch from 6.8 but I just discovered this while
> trying to add 6.12 support for bmips on OpenWrt (from 6.6):
> https://github.com/openwrt/openwrt/pull/18746
> 
> The issue is that low level ops always return 0 on v4.0 controllers
> and v2.1/v2.2 controllers don't even have the low level registers
> defined:
> https://github.com/torvalds/linux/blob/3ce9925823c7d6bb0e6eb951bf2db0e9e182582d/drivers/mtd/nand/raw/brcmnand/brcmnand.c#L357
> https://github.com/torvalds/linux/blob/3ce9925823c7d6bb0e6eb951bf2db0e9e182582d/drivers/mtd/nand/raw/brcmnand/brcmnand.c#L371
> 
> I guess that restoring the legacy functions isn't going to happen, but
> is it possible to restore < v5.0 compatibility on the new exec_op
> implementation?

Unfortunately, I don't think we have any other choice unless we want to 
have a functional NAND driver for these older chips. Would you be 
willing to do that? Thanks
-- 
Florian

