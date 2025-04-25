Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C289F23BD09
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745575695; cv=none; b=sMGqsiaJpehFg6GRH56Wpd8zIzfvWyZR9WRcjTHLjqnprnJ3mWuPRwwnl66LcFXyPLdLPQF+47rSXZfWQvHdIh8zD9hIglCpQolig4s4YUFVkHGwVeTW+l2nCj/lJ9fKeSp5SK1zZHTyvH9GkcARqWXX8evl4KoAWSeaFVLWuLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745575695; c=relaxed/simple;
	bh=8W6PDJRTnPXYvMLSNBG6flWYTbiSLNvRa3oqH8q/3YE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JWjHEaR4qJJ5lH9u3N+mI1UFdDTWFWTnYWCdscEo5AbVHbmb2Uj9Yg5tvM0AIZsZpy63vPBiXSFh4F7ElgsScdYKlTSchV8XbX7cb0Bvt0BJGhrz3rP5MOD6iHan6KNKg+9y72nOzwGfoTfO59delvoy8e854Hrp06wMv/+qIpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=fh+Rcq4J; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="fh+Rcq4J"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-227d6b530d8so22239715ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 03:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1745575693; x=1746180493; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5njHyJvz30qiVz7OEO7ktfy/1HyqmXVebkk5L4HQaNE=;
        b=fh+Rcq4JmW5i5WWJGrDjuzs0Flq4KXcmgvEwcuk1iqrxDB2mdGspBQvf2XxXNidf8K
         6UX5rBwlIHmzVDLhsE7/mhkCwlZXn9tPBMrZWG9iQ14240YDsl45HZwDkWQELKm9RnbT
         STytZ08x9l1Dg13e+sLNEFy5Qdw0Gv/2XcjNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745575693; x=1746180493;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5njHyJvz30qiVz7OEO7ktfy/1HyqmXVebkk5L4HQaNE=;
        b=PmDzYaoNHNi0uS2IGYqrF3IxhOKSFUMiBZg7VxloYYQezJymf7c+kTClU92jTsja2X
         VarP9UMKoJcnMOwU0Mk9nK+SMA3RyPtYlRMkafQRDNz08IPvMGF9o+J8EfXYkaLTPzOx
         K6LESOG15duKwyYwHUcFCi9Z3rCXZfuSpeh9n/rxqGlTOftT28cGfI5ERGKqqCvHrAsG
         jlJjJ3OrdRopRvsnks3xyEMuwd/EQ0Gff0IIKvQerwrsGFpzsytaxIAdd8zEJc6rpGLg
         h8fY9YKy8y7H/BJR3HmSLUfPYNCvP4M0RhPHMGkdUVmczE5cReM5GQDsyMAnJpvk3xkT
         3c3g==
X-Forwarded-Encrypted: i=1; AJvYcCUlf1aVcwnLLIQQv7x8J63Gg/268HdXk3Qgrh1mWxyXv1MB4PQedXbWas6paFb7eheGNhMoo08C+VDdrDA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnzqdZ15VZYVUoLeIUSRXoyPqFbKgFHwUAmjbOro256hm2W8o7
	sBjZdR30Zv6DXkZT8l4by/WLw7XESRReqQGMlOzt5T9I3fLKE616/I2cku3ocQ==
X-Gm-Gg: ASbGncuTfHthwvRpOC0oli4k7Jx3v6/jGNHJzz6C7dN5rinQP6BZvX4HYmnZWkBr6sw
	plK/klBBYC+MWOchLHWy3vGBsVrz919nNmg+6iLJyMzf+hwV4swQwQSribxmJJjyJSTlpacI97J
	nKmCxzS9lwWk2eh8LYHKleK2Z6tReefHhyiwGNYHL7yIzvWpAQ0z5KSRIv0Qmgnl51h5swCF5k4
	mk3/AB5REKLRIFp781OJjCGqzYLah+8dsTVXF6A97mO0uriJ9OA5F7gMtXQuDFkkCAXY2VhtY/S
	a+TWkppzObC60yeRt4cgwFtt5lKVj7MmSgZUV8kCx7KPpj4DV5mLC+x12jXffKAnrfkSSq2v6Jy
	88ATqqMwaiLfQdA1zjgkkZ1P7zkk/k8whFw==
X-Google-Smtp-Source: AGHT+IEiRvydw+zpgaMow96w2Xm30w4pgcn8Jd4sCNL+n0Zk30vooImhsYXcKB8Md13tN2KuPsGqvg==
X-Received: by 2002:a17:903:1947:b0:223:26da:4b8e with SMTP id d9443c01a7336-22dbf5d9eeemr28512845ad.4.1745575693162;
        Fri, 25 Apr 2025 03:08:13 -0700 (PDT)
Received: from [192.168.1.105] (88-187-52-200.subs.proxad.net. [88.187.52.200])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15faee2d59sm2546400a12.70.2025.04.25.03.08.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 03:08:12 -0700 (PDT)
Message-ID: <49011014-8ad7-4392-b2be-736ecd25cf22@broadcom.com>
Date: Fri, 25 Apr 2025 12:08:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 -next 10/12] arm64: dts: broadcom: Add overlay for RP1
 device
To: Andrea della Porta <andrea.porta@suse.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof Wilczynski <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Linus Walleij
 <linus.walleij@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic
 <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 Stefan Wahren <wahrenst@gmx.net>, Herve Codina <herve.codina@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn
 <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 kernel-list@raspberrypi.com, Matthias Brugger <mbrugger@suse.com>
References: <cover.1745347417.git.andrea.porta@suse.com>
 <4bd8dbb374f15a01e3b3ea27f9e802cd702c1bab.1745347417.git.andrea.porta@suse.com>
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
In-Reply-To: <4bd8dbb374f15a01e3b3ea27f9e802cd702c1bab.1745347417.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/22/2025 8:53 PM, Andrea della Porta wrote:
> Define the RP1 node in an overlay. The inclusion tree is
> as follow (the arrow points to the includer):
> 
>                        rp1.dtso
>                            ^
>                            |
> rp1-common.dtsi ----> rp1-nexus.dtsi
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

