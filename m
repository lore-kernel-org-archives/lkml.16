Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2370F213253
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748381216; cv=none; b=pxOcE+2ZmZsR+T1c6AeGje8/shZ0c6++cNKkelvRQlkLMC4X0WxgMwTjEv6TP9eN51K2alYOursV0eONTfCv5m7YH+Z1oo3Y4bYVRT91tcejRbBQjmJ4/l/g0VesFu3xiPl1+LDipDUiuizohr0VKQX8YUWiTdqMxCTxbre8J78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748381216; c=relaxed/simple;
	bh=iYHew5Y9Rcgk1H526GrtGt4u5ZKs15YdHQwVaPhq3fw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RmxKpK87decN+Vn2zzRXYoqT9wB1SG1aSKNRdlTBU+8u7+0vapPp9GE3sWT0NeVGubXeC8ZLW9wTo75MtU1+CEtgItt8gLUxiFy7HEyO/VzmNnnEITiqQu6XvV+SSW9wk7cNoEfPZWgvsXKLIpF8v/W2yr9Pro6AM+BlBVepf7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=OoK4zsvH; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="OoK4zsvH"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-742c46611b6so4318247b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 14:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1748381214; x=1748986014; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0Fz2IwiKLgIvS2GyTyNEhioSLhVlP1wKyrLN1LJ9DDs=;
        b=OoK4zsvHSE3WGCUajzPeiYi4I9U0XcRgxPYRdHjuJZULFR5J7Y5iUjz6wPxobn92cg
         VDdcdI7+8lOFekUZo8p5j8maBeEHJBozqPAvOuzqkB3Yg2zi1K2e45zP4xMJ57lBe2bU
         ipm2A49lUl8vDgCUpsaxhhESxe65Gddk2OTeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748381214; x=1748986014;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Fz2IwiKLgIvS2GyTyNEhioSLhVlP1wKyrLN1LJ9DDs=;
        b=bhU2HJwgaDj4/0tMFIwGDk+yL4v7PXdlmZecwLddNX3o1+c3wFt8CTKpCMPmpzAjlq
         13ihl0MOoQaw+j6btMpI400qa8vY4tSodVrerflEbf3t0JNyNsItkxkqzH+0XgoItF9f
         ZSdl+jaDi6H5Zg4PK+sGniBIyWNOeZxBvoCltt7cp+1vUJva11HGlo0xKg5j1ZwvL0Pz
         yucbVbYbu4w7m8U+fULZ0CzYkOnOEG348cQq3OdNR5BUOshgWdIPxB3sqoZNwpSsF7du
         mDrTCzLQ9rPaaPo6alUx3YP3guj4cVkIPQwO2tn4/9HtvUI7fkdnmnUUOgaFsvXwfFvT
         ERPg==
X-Forwarded-Encrypted: i=1; AJvYcCVUg8N102qfJM8wjQnd/ZaH02FG/CjsAs7ZXZpbRyKwj6wWJKG5h2Ei+vwNDEJ4L/knCUghjsoawj2glcQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqfQjRjvOo2y6aybREVkz6RbOG+5vbDUqxpeuR+4x2THD14/95
	5wX2MHwaCYmKk/PNN12DpGmN0T9tZHOISKbEJF3Ancmu8NjP/FAflfJdUji1xfSVAw==
X-Gm-Gg: ASbGncsIWYpQTbK3mZY3uXK9d/efc8db5iys1cTJKNISViaz3WqMMWoKeRCstfGChcS
	AUFWVnhtOKJbU7IzndT1g6qijORJFuZ/ZNslu63V5VsNIW2sG0d047K1S5DGZ5A7gPKOmZpb61+
	/7T5aC/doMO3wFvV9Omnr60n0kxEa7TTNhIge4H4MI5roBnTniOrbXyfGzpj1QotMuMOzkZnYVi
	Cey2a8aTtYGuP8WIeRSyqDSu+b3xsY/5ibsZnyFUxfKmVAn85Rs8xTAmCr9YIGSnmxulmxhd+uT
	t6mr5m7zeeeTGp+YcJSRKBOFNjrPnpKkwIcEf/lZvjTd+PsM+r5FhfhWn8GE90P+TheUa+WwvP5
	RZiy2rrg2JXEHMI4=
X-Google-Smtp-Source: AGHT+IGbB4of3bVeCDZcaBDyBXB0MhYsMAeAxaUp2tSHxEQHByHVKBDEHHtoMZZUmLbInzOiyCiNOQ==
X-Received: by 2002:a05:6a21:483:b0:1f5:7280:1cdb with SMTP id adf61e73a8af0-2188c245222mr23547171637.16.1748381214325;
        Tue, 27 May 2025 14:26:54 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-746682ee04dsm36539b3a.126.2025.05.27.14.26.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 14:26:53 -0700 (PDT)
Message-ID: <c291e9ee-7ad6-43a2-a686-a518b56eb8c1@broadcom.com>
Date: Tue, 27 May 2025 14:26:46 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 -next 08/12] arm64: dts: bcm2712: Add external clock
 for RP1 chipset on Rpi5
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Matthias Brugger <mbrugger@suse.com>,
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, kernel-list@raspberrypi.com
References: <cover.1745347417.git.andrea.porta@suse.com>
 <38514415df9c174be49e72b88410d56c8de586c5.1745347417.git.andrea.porta@suse.com>
 <aBp1wye0L7swfe1H@apocalypse>
 <96272e42-855c-4acc-ac18-1ae9c5d4617f@broadcom.com>
 <CAO50JKVF6x_=MUuzjhdK0QotcdUgHysMb9v1g0UvWjaJF2fjDA@mail.gmail.com>
 <48AFA657-5683-42A4-888E-3E98A515F3B1@broadcom.com>
 <aCIk40642nXZ3arz@apocalypse> <3899c82c-d6a7-4daf-889b-b4d7f3185909@suse.com>
 <6953caf0-0fef-4bd6-898c-4f86ee738f30@broadcom.com>
 <aDYthG54Wz3khQ88@apocalypse>
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
In-Reply-To: <aDYthG54Wz3khQ88@apocalypse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/27/25 14:24, Andrea della Porta wrote:
> Hi Florian,
> 
> On 09:18 Tue 27 May     , Florian Fainelli wrote:
>> On 5/26/25 07:06, Matthias Brugger wrote:
>>>
>>>
>>> On 12/05/2025 18:42, Andrea della Porta wrote:
>>>> Hi Florian,
>>>>
>>>> On 15:02 Mon 12 May     , Florian Fainelli wrote:
>>>>> On May 7, 2025 5:01:05 PM GMT+02:00, Andrea della Porta
>>>>> <andrea.porta@suse.com> wrote:
>>>>>> Hi Florian, to accept the patches, what would work best for you?
>>>>>>
>>>>>> 1) Send only the relevant updated patches (maybe as an entirely new
>>>>>> patchset with
>>>>>>     only those specific patches)
>>>>>
>>>>> Only the updated patches work for me. I don't think there is
>>>>> that much coupling between the DT changes and the non-DT changes
>>>>> (other than without DT entries nothing is activated)
>>>>
>>>> It's a little bit more involved than that:
>>>>
>>>> - Patch 7 (misc driver) depends on 6 (RP1 common dts) which in turn
>>>>     depends on 1 (clock binding header). Should be taken by Greg.
>>>
>>> Greg gave an Acked-by so I think Florian is good to take that patch.
>>> Which leaves us to the clock patches (driver + dt-bindings).
>>>
>>>>
>>>> - Patch 9 and 10 (board dts) depends on 6 (RP1 common dts) which again
>>>>     depends on 1 (clock binding header). Should be taken by Florian.
>>>>
>>>> - Patch 4 (clock driver) depends on 1 (clock binding header) and
>>>>     should be taken by Stephen.
>>>>
>>>
>>> Steven reviewed the patches (driver + dt-binding) so he is waiting for a
>>> new version which addresses the review. He offered to either take them
>>> and provide a branch that Florian can merge into his branch or provide a
>>> Acked-by tag.
>>>
>>> @Florian what would you prefer?
>>
>> I am fine either way, it's definitively simpler if I can take all of the
>> patches in the respective Broadcom ARM SoC branches, but pulling a branch
>> from another maintainer's tree works just as well.
>>
>> Andrea, sorry to ask you this, can you post a v10 and we aim to get that
>> version applied?
> 
> No problem, just to avoid any confusion I'll summarize what-goes-where with
> respect to branches in your repo broadcom/stblinux, so I can adapt each patch
> to the relevant branch:
> 
> - dt-binding/DTS (patch 1,2,3,6,8,9,10) -> devicetree/next

Ack

> - defconfig (patch 11,12) -> defconfig/next

Ack

> - drivers (patch 4,5,7) -> drivers/next or soc/next?

I will take them in drivers/next.

> 
> Also, should I split any patches that have MAINTAINERS changes so you can apply
> them to your maintainers/next branch? Those are patches 4,5,6,7.

Not sure there is much value in splitting the MAINTAINERS file apart, 
maybe one initial commit covering all of the entries you are right about 
to add would do, up to you.
-- 
Florian
