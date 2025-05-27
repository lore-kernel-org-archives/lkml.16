Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCFC27A916
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 16:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748362721; cv=none; b=jiVpG0Y+QwSfLgMHAXS5gSgtFVDKNJI1iqP/a3SMdnGuP+ybfA6zisp1nhT8mBafHXIdvTj8VeCUzjqTRrS5XphIq6GnF8YYwEznegX5kZLuIHzbhRyNk9TVYUIXLXvw2Wy3XiBjpg/MYiomTlmbK4GHxH9eDZ2UKE7R89u6a6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748362721; c=relaxed/simple;
	bh=XhTt676vUTRZQa7c0XDUeYryAQMXPv7GVIuaao63lI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ftCZSdmpda8RKlWh7KGgiGJIMBDH8odrX+liDiUKj88tnFlWjShMIdS5FKQO87piC1F4ZiKBaDDr69Atmt/XpAt7R+ZzrRwhXvd0HfiZpogIG/WRPfzHIvp9TaB692EXbUWTqVXNnUbK0qEzET6LnRlQjYy8q2Z0p7Gey6t4tn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=AS8wEHlA; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="AS8wEHlA"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7376e311086so3355029b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 09:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1748362719; x=1748967519; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L5cxpY74SeyEYMsHNu2Rje055exgHwznrIMIxOx3xXw=;
        b=AS8wEHlAMn1L+2yEQy4nlZcRUKvtBmJK7t0FVW46GYJPo6QnSK/yqs+iOM2BLNpRhN
         xavN6HHpgCeliuV6+kwRAtPBVqea6UC6WBenGEkZbTyyQGfAAq+E0gutaISxwYktd9HZ
         qValqmX5DsPwTv3fx0oztSwrsuBbpsnnZ3S6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748362719; x=1748967519;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5cxpY74SeyEYMsHNu2Rje055exgHwznrIMIxOx3xXw=;
        b=CBK+eTS6BYjQEIKfGYAAqoPOkdaC4yjtFoSfpBlzh37a9aYBkRWgH9HnTGSXVtUGkz
         SqeDv78HhiaGGOKX0H18oRNkVy9X8XRHKWtxRpR2C7I0MuEwuc/9GNuPtLDc18RS2g2B
         kf1e3q7Y4rVSxsd9RsmladD2SlV9UHm9ZK6MWkYvNCwa97Hqwwta6ltEDm0r2YhF5caD
         xWcqpSD9mBIvTEe18X5zHIu+SQwuKfXJnooo1dp/gtXAz+q//y+v2+YdqlFIZwOfG5c+
         RyGWDg+KN1eDPSOGPthKVb571L2P4WdihJR+oOP3FkCFjGC9GLsBz4dYwfDt7n9G+gko
         mWPA==
X-Forwarded-Encrypted: i=1; AJvYcCVjdHcG1inJRhZ7k5loVzMP6KMjb0Pqhey71OIjc8ONci78rTGdL/2SLL1Ajh7uYNHuaEtCQeDcGI6bAuQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YytbfJQVmXnjXWGQBbwH+toAtwMYOghvH5p1wp8YZl7i4QXIAbC
	KAES27oSn27nhGgh3dBcy8RFYHJ8MJIak1jVS7IcbhvPI962umAHpffV/LbkbwShHQ==
X-Gm-Gg: ASbGncv8xKQ31caMLpFJz1z1KE+yySUkMT00ceRbGMC7xQfEpoA+dU4s3Tr/Q2bUp+i
	BYLXHNFeyU6SG2Wd6FxvW1UkCvOgnirk1xtdnkOOo9fQEUgmafXW94lyYjwJuBK/zEbptLIUNY6
	Li4Dt2XqnFkAqJ9GAm0f/9YZMSS/qktSLa6Fx0MawyyHAG9/MEt7Dm0uC8nqw/Q4y88U+XY2L8f
	xiyVebCbhMeYbwz9/mGSrFKAijgT7BUpfB51cix354PVS6Gtc/3Ne0B8ZiEnJCI7hxI8T7lKvm9
	FV3yvc6L5OZzEclwkmu5UJwemRgFpxDRC7TlXjtxC7DzMawtpy/lMPHlJvpx71Ujze+MfPv/gzN
	iw0KunN2b6DsoGoDmPC5/AgAu+g==
X-Google-Smtp-Source: AGHT+IEom8QL6Y/Pg1q5xaK7iGO193QLG6Lm8YsAgtzmZjeb230ToJsSh7hjy+S2iDqt2W7r0HW6dA==
X-Received: by 2002:a05:6a21:1084:b0:1f5:7d57:830f with SMTP id adf61e73a8af0-2188c37d5a0mr20596185637.33.1748362719553;
        Tue, 27 May 2025 09:18:39 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6fd3bsm18838307a12.23.2025.05.27.09.18.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 09:18:38 -0700 (PDT)
Message-ID: <6953caf0-0fef-4bd6-898c-4f86ee738f30@broadcom.com>
Date: Tue, 27 May 2025 09:18:34 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 -next 08/12] arm64: dts: bcm2712: Add external clock
 for RP1 chipset on Rpi5
To: Matthias Brugger <mbrugger@suse.com>,
 Andrea della Porta <andrea.porta@suse.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, kernel-list@raspberrypi.com
References: <cover.1745347417.git.andrea.porta@suse.com>
 <38514415df9c174be49e72b88410d56c8de586c5.1745347417.git.andrea.porta@suse.com>
 <aBp1wye0L7swfe1H@apocalypse>
 <96272e42-855c-4acc-ac18-1ae9c5d4617f@broadcom.com>
 <CAO50JKVF6x_=MUuzjhdK0QotcdUgHysMb9v1g0UvWjaJF2fjDA@mail.gmail.com>
 <48AFA657-5683-42A4-888E-3E98A515F3B1@broadcom.com>
 <aCIk40642nXZ3arz@apocalypse> <3899c82c-d6a7-4daf-889b-b4d7f3185909@suse.com>
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
In-Reply-To: <3899c82c-d6a7-4daf-889b-b4d7f3185909@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/26/25 07:06, Matthias Brugger wrote:
> 
> 
> On 12/05/2025 18:42, Andrea della Porta wrote:
>> Hi Florian,
>>
>> On 15:02 Mon 12 May     , Florian Fainelli wrote:
>>> On May 7, 2025 5:01:05 PM GMT+02:00, Andrea della Porta 
>>> <andrea.porta@suse.com> wrote:
>>>> Hi Florian, to accept the patches, what would work best for you?
>>>>
>>>> 1) Send only the relevant updated patches (maybe as an entirely new
>>>> patchset with
>>>>    only those specific patches)
>>>
>>> Only the updated patches work for me. I don't think there is that 
>>> much coupling between the DT changes and the non-DT changes (other 
>>> than without DT entries nothing is activated)
>>
>> It's a little bit more involved than that:
>>
>> - Patch 7 (misc driver) depends on 6 (RP1 common dts) which in turn
>>    depends on 1 (clock binding header). Should be taken by Greg.
> 
> Greg gave an Acked-by so I think Florian is good to take that patch. 
> Which leaves us to the clock patches (driver + dt-bindings).
> 
>>
>> - Patch 9 and 10 (board dts) depends on 6 (RP1 common dts) which again
>>    depends on 1 (clock binding header). Should be taken by Florian.
>>
>> - Patch 4 (clock driver) depends on 1 (clock binding header) and
>>    should be taken by Stephen.
>>
> 
> Steven reviewed the patches (driver + dt-binding) so he is waiting for a 
> new version which addresses the review. He offered to either take them 
> and provide a branch that Florian can merge into his branch or provide a 
> Acked-by tag.
> 
> @Florian what would you prefer?

I am fine either way, it's definitively simpler if I can take all of the 
patches in the respective Broadcom ARM SoC branches, but pulling a 
branch from another maintainer's tree works just as well.

Andrea, sorry to ask you this, can you post a v10 and we aim to get that 
version applied?

Thanks!
-- 
Florian
