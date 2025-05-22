Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3B426AE4
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 02:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747882021; cv=none; b=RIQ7b9YZRSeNkskrHwaiuygY5urFGHy29a4UKB6KjmbAzmMA/TXc34yB2YncxVnGwq6ppehxAINmedxfwVNmE4OsQoVeG2fKpkoD76PcDLtLuLwPyhCLMbHq9aIC4TYiEmhsNI80/+useWV1UvNwgZeDKM2LVREacFHsEXwlhfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747882021; c=relaxed/simple;
	bh=Esruv2OeTnd3Nxix6gik9nFQkkarp07zuvi8nFzZOJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fJ7FqF3ek8e53Uwx0AyuoW0F8vn246Bc/SeeBZtIOFLPej9WEIM/C62E25+TWI2TZVwpb3MASwovaXV0n0Y3GRJ5pNTmJQZJm8oITjUlJbCV0lnLUYfCOyQ801yb8CHkMSQcL/s/par8kL+BRYeHarofdcMG0EwN0HHYK3OJUc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=OKAaqHdj; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="OKAaqHdj"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-47ae894e9b7so131795211cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 19:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1747882018; x=1748486818; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1JpsZ+qldooFJDhxkdbsldDGrerBYCZG19R5vu/HjNk=;
        b=OKAaqHdjMo7Uu/4YN/GpaTaPtK6mYFJ8enCQfLj35KmoF0x6GmN8jrMk3trhr/pCdL
         VYX0d219N9INaRXEvlqKU1/2rpZvs7rFHKzvc4brOx/sHPJwQ7m7Wx+/YyHJKVoNDJ2+
         NfGY0DT4VhrVFjizCkutREMtGJSMuDTSM6zQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747882018; x=1748486818;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1JpsZ+qldooFJDhxkdbsldDGrerBYCZG19R5vu/HjNk=;
        b=L2uQu7dYiBRT63Fz0cOdIpgaszLQK7tEOpoZWGq8lQoEdpGfdVwR/k//MyVZJCKdrd
         yLuzSv4k7VD/QQxQtzp4yPzBNlQSoLPjJokGjoWJ65hwfmds4/eAZCPG1+DHm6MnQmJb
         U2nTp5m4ELx6kL03pG2G5puCuiIBsyTfcnWVlK5aM3U0Mpn922eyAU07c49ke/Z+Ikwt
         VCvmPRBgI44+RF0lzQHmxBqwC492Z0tSigJ/xIptS/0gitEAFVY0/lZqZagv4/m1Qddu
         zvGaKjrjukKKH6W4Lu66mm7ReqFjLRGWdWIN2txsFwkxLT5rN3eFN6OALs6QmbfZ+idT
         cUjg==
X-Forwarded-Encrypted: i=1; AJvYcCWJcW8gUO48Ktx2Oin+Yk87TUBsD1tcnV1it82Iv6h10S36f7foa13xpShwlNkFS9843EfbvPYPw2JjGPc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMLBHAPEpoVadjUIQAamFkifJTF916zOok9u4IaU4Mdzc+pdEw
	j+bZuQejh0uVuV+p9MHfOUWo5kvUDf4aBpj/Lm3/YbtPLchfRN9ObelsCiugvk3xYuvUv2Efb7v
	DE+zqdQ==
X-Gm-Gg: ASbGncv8bVl2g/gjrfCOYbL8aHhewIz9WJIbRnsH7MjPXLjTKK2/6jz9Q/spKHjZYg/
	G8YmN1D1VKUkSJnUCbGX7CYl/eczq3UbhCck8CmGcOrkVgCBVeQ4q0oWSbU8Y06axBEinmYChe+
	Cxd/e8jfx/Q12f8ckIplf79EHXXzkLTMPa+rmEe7M+47EodsxsPvBz1smnGCZ/GLlzu9YKsioGx
	NsPUK0pKnwjFp79RmOdUmQRXTy9DcjdW6X58YSSKm7jWOXpTF34gHGHVwLs86PoER01BXJnz410
	EVuD+wEdyTN3fujULLXMJv6IEP8JZKyuaf7reLtb76CtJ/u3FEjtyl7SUhodkXaHKVQeumLyVpA
	bGdNZYblSIQ==
X-Google-Smtp-Source: AGHT+IEfApD3o9CKoZ8xxqbMVxCD6qTofN4+UBpwkmS5om6reaI+9s0pKT9F5RiyspZmLBLFt2yZPQ==
X-Received: by 2002:a05:622a:4a13:b0:480:9ba4:3022 with SMTP id d75a77b69052e-494b078d909mr352874831cf.17.1747882007920;
        Wed, 21 May 2025 19:46:47 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id d75a77b69052e-494ae3d6d84sm92828951cf.16.2025.05.21.19.46.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 19:46:47 -0700 (PDT)
Message-ID: <65cc6196-7ebe-453f-8148-ecb93e5b69fd@ieee.org>
Date: Wed, 21 May 2025 21:46:45 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC net-next 00/15] Add support for Silicon Labs CPC
To: =?UTF-8?Q?Damien_Ri=C3=A9gel?= <damien.riegel@silabs.com>,
 Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Silicon Labs Kernel Team <linux-devel@silabs.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, greybus-dev@lists.linaro.org
References: <20250512012748.79749-1-damien.riegel@silabs.com>
 <6fea7d17-8e08-42c7-a297-d4f5a3377661@lunn.ch>
 <D9VCEGBQWBW8.3MJCYYXOZHZNX@silabs.com>
 <f1a4ab5a-f2ce-4c94-91eb-ab81aea5b413@lunn.ch>
 <D9W93CSVNNM0.F14YDBPZP64O@silabs.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <D9W93CSVNNM0.F14YDBPZP64O@silabs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/14/25 5:52 PM, Damien Riégel wrote:
> On Tue May 13, 2025 at 5:53 PM EDT, Andrew Lunn wrote:
>> On Tue, May 13, 2025 at 05:15:20PM -0400, Damien Riégel wrote:
>>> On Mon May 12, 2025 at 1:07 PM EDT, Andrew Lunn wrote:
>>>> On Sun, May 11, 2025 at 09:27:33PM -0400, Damien Riégel wrote:
>>>>> Hi,
>>>>>
>>>>>
>>>>> This patchset brings initial support for Silicon Labs CPC protocol,
>>>>> standing for Co-Processor Communication. This protocol is used by the
>>>>> EFR32 Series [1]. These devices offer a variety for radio protocols,
>>>>> such as Bluetooth, Z-Wave, Zigbee [2].
>>>>
>>>> Before we get too deep into the details of the patches, please could
>>>> you do a compare/contrast to Greybus.
>>>
>>> Thank you for the prompt feedback on the RFC. We took a look at Greybus
>>> in the past and it didn't seem to fit our needs. One of the main use
>>> case that drove the development of CPC was to support WiFi (in
>>> coexistence with other radio stacks) over SDIO, and get the maximum
>>> throughput possible. We concluded that to achieve this we would need
>>> packet aggregation, as sending one frame at a time over SDIO is
>>> wasteful, and managing Radio Co-Processor available buffers, as sending
>>> frames that the RCP is not able to process would degrade performance.
>>>
>>> Greybus don't seem to offer these capabilities. It seems to be more
>>> geared towards implementing RPC, where the host would send a command,
>>> and then wait for the device to execute it and to respond. For Greybus'
>>> protocols that implement some "streaming" features like audio or video
>>> capture, the data streams go to an I2S or CSI interface, but it doesn't
>>> seem to go through a CPort. So it seems to act as a backbone to connect
>>> CPorts together, but high-throughput transfers happen on other types of
>>> links. CPC is more about moving data over a physical link, guaranteeing
>>> ordered delivery and avoiding unnecessary transmissions if remote
>>> doesn't have the resources, it's much lower level than Greybus.
>>
>> As is said, i don't know Greybus too well. I hope its Maintainers can
>> comment on this.
>>
>>>> Also, this patch adds Bluetooth, you talk about Z-Wave and Zigbee. But
>>>> the EFR32 is a general purpose SoC, with I2C, SPI, PWM, UART. Greybus
>>>> has support for these, although the code is current in staging. But
>>>> for staging code, it is actually pretty good.
>>>
>>> I agree with you that the EFR32 is a general purpose SoC and exposing
>>> all available peripherals would be great, but most customers buy it as
>>> an RCP module with one or more radio stacks enabled, and that's the
>>> situation we're trying to address. Maybe I introduced a framework with
>>> custom bus, drivers and endpoints where it was unnecessary, the goal is
>>> not to be super generic but only to support coexistence of our radio
>>> stacks.
>>
>> This leads to my next problem.
>>
>> https://www.nordicsemi.com/-/media/Software-and-other-downloads/Product-Briefs/nRF5340-SoC-PB.pdf
>> Nordic Semiconductor has what appears to be a similar device.
>>
>> https://www.microchip.com/en-us/products/wireless-connectivity/bluetooth-low-energy/microcontrollers
>> Microchip has a similar device as well.
>>
>> https://www.ti.com/product/CC2674R10
>> TI has a similar device.
>>
>> And maybe there are others?
>>
>> Are we going to get a Silabs CPC, a Nordic CPC, a Microchip CPC, a TI
>> CPC, and an ACME CPC?
>>
>> How do we end up with one implementation?
>>
>> Maybe Greybus does not currently support your streaming use case too
>> well, but it is at least vendor neutral. Can it be extended for
>> streaming?
> 
> I get the sentiment that we don't want every single vendor to push their
> own protocols that are ever so slightly different. To be honest, I don't
> know if Greybus can be extended for that use case, or if it's something
> they are interested in supporting. I've subscribed to greybus-dev so
> hopefully my email will get through this time (previous one is pending
> approval).

Greybus was designed for a particular platform, but the intention
was to make it extensible.  It can be extended with new protocols,
and I don't think anyone is opposed to that.

> Unfortunately, we're deep down the CPC road, especially on the firmware
> side. Blame on me for not sending the RFC sooner and getting feedback
> earlier, but if we have to massively change our course of action we need
> some degree of confidence that this is a viable alternative for
> achieving high-throughput for WiFi over SDIO. I would really value any
> input from the Greybus folks on this.

I kind of assumed this.  I'm sure Andrew's message was not that
welcome for that reason, but he's right about trying to agree on
something in common if possible.  If Greybus can solve all your
problems, the maintainers will support the code being modified
to support what's needed.

(To be clear, I don't assume Greybus will solve all your problems.
For example, UniPro provides a reliable transport, so that's what
Greybus currently expects.)

I have no input on your throughput question at the moment.

					-Alex

>> And maybe a dumb question... How do transfers get out of order over
>> SPI and SDIO? If you look at the Open Alliance TC6 specification for
>> Ethernet over SPI, it does not have any issues with ordering.
> 
> Sorry I wasn't very clear about that. Of course packets are sent in
> order but several packets can be sent at once before being acknowledged
> and we might detect CRC errors on one of these packets. CPC takes care
> of only delivering valid packets, and packets that come after the one
> with CRC error won't be delivered to upper layer until the faulty one is
> retransmitted.
> 
> I took a look at the specification you mentioned and they completely
> delegate that to upper layers:
> 
>      When transmit or receive frame bit errors are detected on the SPI,
>      the retry of frames is performed by higher protocol layers that are
>      beyond the scope of this specification. [1]
> 
> Our goal was to be agnostic of stacks on top of CPC and reliably
> transmit frames. To give a bit of context, CPC was originally derived
> from HDLC, which features detecting sequence gaps and retransmission. On
> top of that, we've now added the mechanism I mentioned in previous
> emails that throttle the host when the RCP is not ready to receive and
> process frames on an endpoint.
> 
> [1] https://opensig.org/wp-content/uploads/2023/12/OPEN_Alliance_10BASET1x_MAC-PHY_Serial_Interface_V1.1.pdf (Section 7.3.1)

