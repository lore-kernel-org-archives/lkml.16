Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7DCA55;
	Sun, 27 Apr 2025 19:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745780555; cv=none; b=PI2i7Azxhb44WTuczaZq/RfjG+W6m6NCbkz7bxgXEpJ4yqPL7jzWQKHPDb4U7YsMk6KtgVxV13AV0U8neZcjkrUNwy2fZPk1oOUfgnW50La4ZQ07QAG1t6tPacfXYjuetKWjTMRtLmtzMrzsc28rRXyU3N4pl3l2EzutSrAe+a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745780555; c=relaxed/simple;
	bh=R8tOTglTl8ZwDIpzs55Bm4A/NsGF97weBUTxT59Zeao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wcjy3IFjWlLf2mWpF7AdEUG6Ds2hQ2+a3ErQBkI/e2lFo+Jj09PZLEUCGXJCcnOf0XiI0FNwxkf4dihxjBSWOcfHUej1bKATC0bXb8qcpd4igY2Xz3w29hTUd2CL8ylU8FL+nmxe97+/NCyxveUbOkENNmKDlCIKpfzyY1TZ0l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KLf+t2h3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KLf+t2h3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D722C4CEE3;
	Sun, 27 Apr 2025 19:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745780554;
	bh=R8tOTglTl8ZwDIpzs55Bm4A/NsGF97weBUTxT59Zeao=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KLf+t2h3Wf9Etv4/OzPqw3E0joZD0wt9h9wHqV0EWwlPAJIih0n0Jg5gWuYJk3Z6q
	 JYBaH6PPtNmFYG3LvFsFfi3/2Nofz0otGv6nwQHkz8Isx2ZhE7I3mOain9faTW3B5L
	 GIJaxywty4yY894+hq1+2IVHe7GEaP+b+bWcMLqmRcJFlmHls/4iSCvmrDgDGtiUPG
	 I/E/FV6zJdBv5HxKoriByZ3w2ke/YbL9Tow8xF3Pn+0ljIzW02U/QBBnc1C73+6pso
	 7i0H9CflQY6y9kxidrPJN3SXkgnPLux3jQ06E5CV68eimo7WxHwIuCcKGaLu8D4ZCM
	 XdAPGU31k9+tg==
Message-ID: <364cb2a9-af29-4952-acca-59b9c2d73267@kernel.org>
Date: Sun, 27 Apr 2025 21:02:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: nuvoton: Add EDAC controller
To: William Kennington <william@wkennington.com>
Cc: Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250416001350.2066008-1-william@wkennington.com>
 <9dc96af3-239f-4cb6-b095-875b862be493@kernel.org>
 <CAD_4BXhMs4sopska1=czqWDM8nY6gswXv3LBeUGNzFWn1+7V8g@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <CAD_4BXhMs4sopska1=czqWDM8nY6gswXv3LBeUGNzFWn1+7V8g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/04/2025 23:23, William Kennington wrote:
> On Tue, Apr 15, 2025 at 11:53 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 16/04/2025 02:13, William A. Kennington III wrote:
>>> We have the driver support but need a common node for all the 8xx
>>> platforms that contain this device.
>>>
>>> Signed-off-by: William A. Kennington III <william@wkennington.com>
>>> ---
>>
>> You just sent it, so this is v2? If so, then use v2 in subject (see
>> other patches) and provide changelog under ---.
>>
>>>  arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
>>> index 4da62308b274..ccebcb11c05e 100644
>>> --- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
>>> +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
>>> @@ -56,6 +56,13 @@ clk: rstc: reset-controller@f0801000 {
>>>                       #clock-cells = <1>;
>>>               };
>>>
>>> +             mc: memory-controller@f0824000 {
>>> +                     compatible = "nuvoton,npcm845-memory-controller";
>>> +                     reg = <0x0 0xf0824000 0x0 0x2000>;
>>> +                     interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
>>> +                     status = "disabled";
>>
>> Why is this disabled? What resources are missing?
>>
> 
> I was avoiding enabling anything would not be used in the most minimal
> kernel configuration (Kdump). Anyone actually using the EDAC data from
> the memory controller could enable it. The np]cm7xx common dts also
> has this node disabled, so it would be consistent with that SoC.
DTS is nowwhere relatd to your kernel configuration, so that's wrong
assumption and wrong goals. DTSI should have disabled only devices which
need board-level resources. It seems not the case here, so drop it.

Best regards,
Krzysztof
