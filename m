Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58D71FC3;
	Wed,  5 Feb 2025 13:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738761682; cv=none; b=YvfslDLBOOhXhKpSsfGyMBCBB6LbgAqHmO9J4YIl8kLqOiHub/JyIR5j+DGt9yTvXt+WNP3UM4lb/UmsOxvx394nnp4cVOXffTZ7YMvBp/he8JR6ry4HSz5JpuslItHTfG4Tq5BgGqLXzwsVBFqidcQvCKwdoQoeeuBau3wAOMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738761682; c=relaxed/simple;
	bh=rKa2UHCvQ4bQfN0OJ0WErKQrq8jIIM1C07ItlR6oL3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bL3dnqoXfvA7X++2JcvHtECCX0umppS2bax2um23zEQa65BCuKaPMynzKIfGsFDJXEliHSL+wdYpf1WFj7rAQV+E5PPo2/DxFt0aUcXIuQwVqO8XyBqKN+N6sgMC/JJIaeEJp25U6I/kRLn5Imxav5Ud0DDGsDezea6Q+rdMyrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Received: from [192.168.2.35] (unknown [98.97.25.24])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id E28DBB4C025C;
	Wed,  5 Feb 2025 14:21:12 +0100 (CET)
Message-ID: <33b971dc-1266-4d13-b9b7-620c58e5a804@freeshell.de>
Date: Wed, 5 Feb 2025 05:21:11 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] riscv: dts: starfive: jh7110-common: qspi flash
 setting read-delay 2 cycles max 100MHz
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Hal Feng <hal.feng@starfivetech.com>
References: <20250203013730.269558-1-e@freeshell.de>
 <20250203013730.269558-3-e@freeshell.de>
 <CAJM55Z9s4FMCmGaGPGBdcJWxoTNO1gupMLAq2a1fExiho5W1jw@mail.gmail.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <CAJM55Z9s4FMCmGaGPGBdcJWxoTNO1gupMLAq2a1fExiho5W1jw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Emil,

On 2/5/25 02:18, Emil Renner Berthing wrote:
> E Shattow wrote:
>> Sync qspi flash setting to read-delay=2 and spi-max-frequency 100MHz for
>> better compatibility with operating system and downstream boot loader SPL
>> secondary program loader.
> 
> Here you should be explaining why these values better describe the hardware. To
> me this just reads as "u-boot does this, so let's do the same" whith doesn't
> really explain anything.
> 
> /Emil
> 
>>
>> Signed-off-by: E Shattow <e@freeshell.de>
>> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
>> ---
>>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>> index a5661b677687..8a59c3001339 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>> @@ -317,8 +317,8 @@ &qspi {
>>  	nor_flash: flash@0 {
>>  		compatible = "jedec,spi-nor";
>>  		reg = <0>;
>> -		cdns,read-delay = <5>;
>> -		spi-max-frequency = <12000000>;
>> +		cdns,read-delay = <2>;
>> +		spi-max-frequency = <100000000>;
>>  		cdns,tshsl-ns = <1>;
>>  		cdns,tsd2d-ns = <1>;
>>  		cdns,tchsh-ns = <1>;
>> --
>> 2.47.2
>>

That is true, there's not much to explain. It works at delay 2 and
100MHz max. I tried many delay values with the pre-existing 12MHz max,
they did not work. I don't have more information than that except what I
wrote about on the U-Boot mailing list [1]

[1]
https://lore.kernel.org/u-boot/ZQ2PR01MB13072E932737DD9D65E3A250E637A@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn/

The parameter training code in U-Boot when given max 100MHz has this at
somewhere between delay 2 and delay 3, where delay 3 almost appears to
work but there's data corruption, and delay 1 is totally non-functional.
With all testing so far the delay 2 and max frequency 100MHz is reliable
and also is a common occurrence in the Linux code base for similar qspi
access.

My testing methodology was pretty extensive and I wrote about the result
on the U-Boot mailing list, however here we're taking the success of
that in U-Boot and literally just applying it to Linux where it also
happens to align with some common similar assignments for other boards
in the devicetree code base. It works and there's no deeper insight here.

Welcome to hear from anyone that might actually understand this hardware?

-E
