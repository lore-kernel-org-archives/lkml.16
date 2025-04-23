Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9C61FDD;
	Wed, 23 Apr 2025 04:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745384342; cv=none; b=YeA6wq0gaL6pRAozV+xf5Ry79AfdskPIlnZQbk0fUwFxfsCwFUQBYz4epnvvIPxGr6wnF0wkGU07a6blSF49vNKwuil2aDHZzf9OVMPaJWwtJchHUuZ2vsFHt/ORZvBVVyREMqMS8u9f4veH6paZWg2+PLN2pXTbP9mGBL9TeWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745384342; c=relaxed/simple;
	bh=EY9ujoNfwKQ8qWkmSV56odIIKrNXJB79dFPjRW5I/X4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UDzmDUjgyMl7u9c366JlmDXxiV4hnd5NfKfHJXf4LccNi7iB4eSfL/San46gDtwIrFMp+r7y5IFDXfeUEgrATsDynpbYKv9TFIVCxJAFTHuYXagB4rsL3chwIRShvyQZ5n7607oCUod8nx4fh6NY37GN6BgUewZYSe5t3QhSHxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cO70q150; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cO70q150"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso5238796b3a.2;
        Tue, 22 Apr 2025 21:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745384340; x=1745989140; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xyg383WQs++mdg+KNHFWZy7e9+DE/XMzzSgB2As2m/o=;
        b=cO70q1507Lx3Xeesb8YUpREXfYoYEfxrxt4F4q9+KHpOqz3byJvkA9n8mnSj2zJmgo
         c36mS0iF38z/Dlbct2dY4Cb2hZwfL5EZIvV/CfPOWLjtffusGUD5TXQXRW9XCKpJVHN9
         +HOptXRvgZYe/o5WcorSZtjiv54Sj3YY5lkogPc5qVsU8ZatxPH/kPTTWXa68OLoFEtI
         yvl5J0zTonJ+TMVxdBF1iEwpvFOYTfaLXRbRJYd3c/l/6C08ru2gHJIO/fFhwcUk551B
         6k6tWzQLv/Y1zircs396uKwFqtLfH5yY69d1QJAbSGkHRfgsqgLh83S0PWEYkUsKh3qJ
         wzbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745384340; x=1745989140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xyg383WQs++mdg+KNHFWZy7e9+DE/XMzzSgB2As2m/o=;
        b=nzkGXAMAn03hf4CSK75gYca4FUzhfiLsjhBcfD2vuSgBK4zWvWWhQ2eQDP8h9Mlo/2
         DDnPMzyRcCYDuGaNZ8myxRCpPHgo+J8Fg+Mr7Bkp0gA3tEEVXXpIs+s8ZALq9knnmu5A
         HoFtcCQfJVmtMyZqJvJuIVLH6EFLRHjZJw5JLeqcCaSTG0I238hiM5V2wTAcu627nfzr
         FH6DL5g3Ccx/gfnK/hjcuE7vb8v8n/ejg8R1PStIT2DUR2vLiHq6hnSLopXXuUOJXPOw
         ptFuz2eWbVMlw5MnuMEqiX/E2cjZV/EK0CJYVSol8WJ0y19h/zMzHhmPDWEMu5HC8LkZ
         4uzw==
X-Forwarded-Encrypted: i=1; AJvYcCW02up6sYqCAPy8fT/QT+S57tPRdhIDzHpYZ2b+QlY5xrY3c2xN3zVvsUdVwGvzp+arNYRL1u7uvMHj@vger.kernel.org, AJvYcCWD2ibeiv2aFQKE0HWfoFRAFgUyxcLYh0/SlBXTm5R2VkDNInJt4tVLpKPTwUVLNcF338vphwFqEpBEsaDe@vger.kernel.org
X-Gm-Message-State: AOJu0YzYeUnhwqY9t9mN8ntjaSXCR+c3STUyB95usVwARJH2DmNOi29t
	TiavUxvZQCyi5EWYS7iLWcQLHc+IksJ6dwgl5sFjMgB2CVAzwfCv
X-Gm-Gg: ASbGnctw1cOOp7kJqbFLhcLTaBFG8tvAAS3PQMe2ZmYZ3kJg16uzIDZiSFhivJylPV7
	wcfahWdK7ZtbyPFscaAmv53+G8dC8AlKXfHilnLkQySpy185F0UsJImuQcApfd6cTWrJlUvYyse
	giH4/jVRUL5yjNIhV37YI8hW6ir+Ii463FTMZ3Tr6Xos/TSui+33KfcfexfucptPjgfDhj1jsH+
	xlSUjF8QytlkEtIZE8JrwO9x4QMphTbmN3o6Y2u8l3T65ByUGjGYgMof8CWTMP2Z4jEXdji/T+M
	GoUvrcHLd0L3FTtmMtOZOZNN01UuKXcDdpfokC4VyqtgUsuJ/iBNC6+YizUpJJaXj0bJRU0=
X-Google-Smtp-Source: AGHT+IGTIS5Xlm9+VhCnh58WLvEtwL4pxJkbeifvZpi31EsCMwvpE4ldGQssGqpK2dlu5H9jrh6Pxg==
X-Received: by 2002:a05:6a21:7108:b0:1ee:d06c:cddc with SMTP id adf61e73a8af0-203cbd207b4mr30512585637.30.1745384340420;
        Tue, 22 Apr 2025 21:59:00 -0700 (PDT)
Received: from [10.89.236.32] (wf126-032.ust.hk. [175.159.126.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309d5d61f7asm2606442a91.0.2025.04.22.21.58.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 21:59:00 -0700 (PDT)
Message-ID: <e4159c2b-4081-4a4b-9a53-d6d559a3196c@gmail.com>
Date: Wed, 23 Apr 2025 12:58:55 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: spmi: Add generic SPMI NVMEM
To: Sasha Finkelstein <fnkl.kernel@gmail.com>, Rob Herring <robh@kernel.org>
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250417-spmi-nvmem-v2-0-b88851e34afb@gmail.com>
 <20250417-spmi-nvmem-v2-1-b88851e34afb@gmail.com>
 <20250422133619.GA1095169-robh@kernel.org>
 <CAMT+MTTwY=z1-_94ws+Oi+wvE2PA_s57dPmpMABC26q=MPw1Mg@mail.gmail.com>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <CAMT+MTTwY=z1-_94ws+Oi+wvE2PA_s57dPmpMABC26q=MPw1Mg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Sasha Finkelstein 於 2025/4/22 夜晚9:44 寫道:
> On Tue, 22 Apr 2025 at 15:36, Rob Herring <robh@kernel.org> wrote:
>>> +title: Generic SPMI NVMEM
>> What makes this generic?
>>
>> A generic driver is great, but "generic" or "simple" bindings are
>> generally a mistake.
> There is nothing apple-specific in that driver, just re-exporting
> several registers as cells. If you think that it is a mistake, I can
> rename it to apple-pmic, or something similar.
>
>>> +      - const: spmi-nvmem
>> What happens when there's some other feature of the PMIC exposed that's
>> not nvmem?
> If you have a PMIC that needs more features exposed, then you'd have to
> use a different driver. Or am i not understanding the question correctly?
I think the problem is what happens if more functionalities needed to be exposed from the M1 SoC's
PMIC. (right now I do not believe anything else is needed from it)

It would be multiple drivers. A simple-mfd-spmi driver (like drivers/mfd/simple-mfd-i2c.c
but SPMI) that exports a regmap and a generic driver that reexports regmap (any regmap,
not necessarily SPMI) as nvmem cells, plus extra drivers that uses the regmap exposed by
the mfd driver for extra functionalities.

To make this submission more generic and extensible, what would be submitted should be a
simple-mfd-spmi driver and a generic regmap nvmem driver. For specific examples, see below:

The PMICs from dialog semiconductor on older Apple SoCs definitely needs such functionalities.

On Apple A11 SoC there is a RTC clock device on the PMIC and the SMC on there does not have
RTC functionalities. To make the RTC clock work there a driver would read a counter that could
count a maximum of 194 days from the SPMI PMIC, and then access the PMIC nvmem cells that
held the rest of the time. In this case these drivers are needed:

(1) simple-mfd-spmi (2) rtc driver (3) generic regmap nvmem driver.

On Apple A7-A10X SoC a similar PMIC also exist, but is over I2C instead of SPMI, those devices do not
have a SMC. To make the rtc clock work there three drivers are needed:

(1) simple-mfd-i2c (already exists) (2) rtc driver (same one as above) (3) generic regmap nvmem driver

The PMICs on A7-A10X SoCs are also known to have WLED output for backlight, shutdown controls and
some sort of pinctrl needed for things like bluetooth.

In both cases a combination of (1) and (3) is more generic and applies to more than one bus types, and
allow extra functionalities other than nvmem to be added.
>
Nick Chan
