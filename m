Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA8D221547
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 15:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745939861; cv=none; b=Ajk1wuocc3vPi1YzVWEeyc4EGDV5A+olA1TjqbGxN6BAUGRIhzGUh1NpgkLwBn/U6pQBr950UrWb6cr90RRTluOUQahfuiJ4lETsHoc7xmjljyRpUwSYP+chr7ZCMMNbNQxf21OVJdvyJ0v0JlPOMopKryzhziOf+RMPsaRrcoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745939861; c=relaxed/simple;
	bh=DiuiAYICLRUl59C/aRhELeH+HvVB1l5QG0k9BnluZU0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CHasq2TFQ+NZmQIOv8Qsu1M0YpASRY13NX+YmwQKSG7tHSytVBcmOSKEzasP9UpSYTK8oir9Gf8T/3GhkKvc+R0iN4iF0OD4y+vZ7Ab1GP1q7ESie52pjENAm3P59cB9bpXKg3+mKOMBEYOHaAtl5Z9YQxalr5mf1gzh42fbOrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JG/GEdSE; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JG/GEdSE"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43f106a3591so6737495e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745939857; x=1746544657; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BokEIJpAcKb2binz16NzuPQ4I7I+6I7p32b1cJZhi5A=;
        b=JG/GEdSEzowm/utyuQKTVnh2bkuwnA11HZ6huhLCmo+/28A4eRvuH6PK4ltDi6TQmz
         85KrxQiY6fmptXO6X46jiYxoEJdTFuB2ckfvnqYk/bwPDwCyMh/rVXvyAgBxeAKeBc5A
         XZZTYwW38l2Ai3ta+atXIssj+XVhKalGv8rHCQ0pnbzUaiAZWPMiBkddHhhroJ+Taf4O
         QGfp92dzIuKoDqlv1xCaKIkKPC8w5IGb/xlkwGl8+JloAUXtZ1i8IKCO0v7pdJvw453s
         Hat7xN2cRrjMi8RHurrJlZgVpsoCMQx9TYsDmvuHIGPRjQ+0INmwmVTnscnpq/sZjUFz
         RaSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745939857; x=1746544657;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BokEIJpAcKb2binz16NzuPQ4I7I+6I7p32b1cJZhi5A=;
        b=XI74fsPmTpEt3l0O0/f2ej5TjoWxNOIvP4NXkVzDoLHPwB9g0U+fxxyVyST3haMuiZ
         kb4/Z6XVHXCsBpwmQAd2m4I8Z/z8fm5LByAHOd4coqvAtiUTkbYS5LLfwX+XGYI67mbi
         iDJyUGVHd4bYocbCoNltk7nWQreiedTflQ3sYXqHPoTSK6jLi/DKHj3BHJ6nK+7qSgnT
         tGJql4aAExqErv8THJbrTX/4euOmNN5K3/l8lsJbpFGsfSM1L6fbVvsYXRnBjq9kafPk
         cAOTDwVhTWv2YzXH2J4L7RAFzLTPVdIrM4z6Qf9AHp13Fflf3hFbTeyFmo4urrC3Ajxq
         yi8g==
X-Forwarded-Encrypted: i=1; AJvYcCVOvVLGKqf3avUlwHcLtix0MpK2VjMrOUCUmxCC8VdOGY8hHbnBbyMax38fm5YlbFLpTw8h72h+xgcE4dY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFF8WswKQu/fqwMLFUFXB28uifMzYMoUaoY5IAleQ69EiyNd84
	3IxsHYWVhTwqvOoxx3qzhbmLfOnrBv2RYXWCdgldKhViCMfC/NEKxsD3MbmYjh8=
X-Gm-Gg: ASbGncsxK6KIOlNUThs5Y9p6NFCyl18K8pE1BhQF2bRqSMuu4Hlv9rZ3sxlvf6y67m/
	wnJiEPn3GV5ovWLK90Tds7vSe15n0cmwxk2aH2s/yoE4nDb/XvhtVgw4vFOF7OP80+nbGcyE9F2
	Hi98ZZRMZzpBDw7FMKOy9KUoqdE6MwAUQx5rjMQAy+B6prBRgZzHiNXZZ55CcBgaAIRJSOaq0wV
	gclEpeu+JOLRvAdlK/i+ATZXqc3vY16PZweaNi7L98L6vXdJYlXnDyWuIUBckW5qtRXlw7vkCat
	L+sWGBMa+kTqIRGNfX5M/9M6d7sMmuVWUgaelvvD4YvVajAYQG8N9IQs/uM=
X-Google-Smtp-Source: AGHT+IHwONa+JhNx4dio96T0pi5jX7gQn7L+kUedgzrY/88DyPg1TeMpxysV+irX79Ls6/3y0GlTjA==
X-Received: by 2002:a05:600c:ccc:b0:439:a1ce:5669 with SMTP id 5b1f17b1804b1-441ac890828mr11476225e9.5.1745939857335;
        Tue, 29 Apr 2025 08:17:37 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f8909sm167238875e9.2.2025.04.29.08.17.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 08:17:35 -0700 (PDT)
Message-ID: <c2d8374b-b623-447d-a695-3f2ead068265@linaro.org>
Date: Tue, 29 Apr 2025 17:17:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] arm64: dts: imx: Move Ethernet aliases out of SoC
 DTSI
To: Lucas Stach <l.stach@pengutronix.de>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, Francesco Dolcini <francesco@dolcini.it>,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
References: <20250425-dts-imx-aliases-ethernet-v1-0-15b9d5cca611@linaro.org>
 <e97d3388a5b4272d70d7379b020843a47874a104.camel@pengutronix.de>
 <c5538590-efe4-4b90-b291-6c429d8fa3fe@kernel.org>
 <06efb082c24176e6401265b4349b677468850f7d.camel@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <06efb082c24176e6401265b4349b677468850f7d.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/04/2025 17:13, Lucas Stach wrote:
> Am Dienstag, dem 29.04.2025 um 16:30 +0200 schrieb Krzysztof Kozlowski:
>> On 29/04/2025 11:39, Lucas Stach wrote:
>>> Hi Krzysztof,
>>>
>>> Am Freitag, dem 25.04.2025 um 21:48 +0200 schrieb Krzysztof Kozlowski:
>>>> Not tested on hardware.
>>>>
>>>> Ethernet interface, like other exposed interfaces, aliases depend on
>>>> actual board configuration, e.g. its labeling, thus aliases should be
>>>> defined per each board or each SoM.
>>>>
>>>> Some boards (e.g. Gateworks) follow this convention but many do not.
>>>>
>>>> This is continuation of my comments from:
>>>> https://lore.kernel.org/r/16a98816-f43c-4f4d-940e-9da30cb1f73f@kernel.org
>>>>
>>> The i.MX boards have traditionally listed aliases for many hardware
>>> peripherals with the same numbering that's used in the SoC reference
>>
>> ... which is not correct. Aliases should represent how boards are really
>> labeled, not how reference manual labels them.
>>
> While that is the commonly agreed interpretation today, I do not see
> any language in the DT spec itself or kernel Documentation/devicetree
> that would mandate aliases to be used in this way.
> 
> In fact there are examples to the contrary like
> Documentation/devicetree/bindings/serial/samsung_uart.yaml which says:
> "Each Samsung UART should have an alias [...] as specified by User's
> Manual of respective SoC."

And that is an ABI. Did I affect ABI here?

> 
> So I would argue that there is no hard line between correct/incorrect
> for the historical usage of the alias nodes on the i.MX platform.

There is. ABI is documented. There are things which turn out ABI, even
though they are not documented, like node names. Was there a problem
with refactoring these in NXP?

No.


> 
>>> manual. Boards always have the option to override those aliases if they
>>> have a good reason to do so, e.g. labeling on the physical device.
>>>
>>> Other users besides Linux rely on fixed numbering provided by the
>>> aliases. Both barebox and U-Boot number their ethernet interfaces
>>> according to the alias.
>>
>> And?
>>
> Some usecases depend on the aliases being the same between kernel and
> bootloader. Historically that has been guaranteed on the i.MX platform
> by the aliases in the SoC DTSI, when the board didn't have a need to

I know.

> change them. With this series applied some other users may now end up
> with missing aliases if the only include the DTSI.

Bring actual case, what is broken by this changeset.

> 
>>>
>>> While you seem to add back aliases for in-tree boards, this breaks the
>>> majority of boards that include the kernel DTSI from an out-of-tree
>>> board. I can understand that we can't always accommodate these users,
>>
>> This is not ABI, so every out of tree user is on their own.
> 
> I am not too sympathetic about out-of-tree users myself, but I don't
> think we should make their life harder deliberately.

We are making our life easier by maintaining and improving source code:
e.g. not creating fake aliases for devices which do not exist on given
board.


Best regards,
Krzysztof
