Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6783CBA2E;
	Wed,  5 Feb 2025 12:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738759997; cv=none; b=RSC0t7jvB/uZljy30TV51tCYCpOzXwajB2gTzae/97qV6jENtU8zI86IWjI5c6Zhf8YPQbXPxoOPajOfklWluptizgSv7j9h1Td595wy7DZqHQg+shUSdN6LuncMg/u55zsacdQMUCGXCn0Md1cEGvUc5hXbGAzzV/qRN6ElM2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738759997; c=relaxed/simple;
	bh=v7845min5jt+OXbxTpbZrRlH4aKYmJ33eG0G1Dsgmuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bAKIHqkO8gygs4Pbss46vSl1N/wLSaf43aqPtAUTWtAbHCxIQq1CSB3pPPdwrtaztlrw3lmfHjr1eJUWeuvyXhrKwpYQ3AQWAw+A5TkHSnL/Tq8RgW7NvV2jbQa87ZbnObXfQwPoj4xXNH0dnqnXsR/iXzOuLZCY49AG0t62ctk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Received: from [192.168.2.35] (unknown [98.97.25.24])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 7ADA8B4C01E1;
	Wed,  5 Feb 2025 13:53:01 +0100 (CET)
Message-ID: <981a3f30-c646-423a-a2dd-e19fef5c69e5@freeshell.de>
Date: Wed, 5 Feb 2025 04:52:59 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] riscv: dts: starfive: jh7110-common: replace
 syscrg clock assignments
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Conor Dooley <conor@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20250203013730.269558-1-e@freeshell.de>
 <20250203013730.269558-2-e@freeshell.de>
 <CAJM55Z-M9MsJAtPi-t=_tNV3oG_kdDiS6H=H3koJwTEwB8GJ-Q@mail.gmail.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <CAJM55Z-M9MsJAtPi-t=_tNV3oG_kdDiS6H=H3koJwTEwB8GJ-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/5/25 02:16, Emil Renner Berthing wrote:
> E Shattow wrote:
>> Replace syscrg assignments of clocks, clock parents, and rates with
>> default settings for compatibility with downstream boot loader SPL
>> secondary program loader.
>>
>> Signed-off-by: E Shattow <e@freeshell.de>
>> ---
>>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 11 ++++++++---
>>  1 file changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>> index 48fb5091b817..a5661b677687 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>> @@ -359,9 +359,14 @@ spi_dev0: spi@0 {
>>  };
>>
>>  &syscrg {
>> -	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>,
>> -			  <&pllclk JH7110_PLLCLK_PLL0_OUT>;
>> -	assigned-clock-rates = <500000000>, <1500000000>;
>> +	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_ROOT>,
>> +			  <&syscrg JH7110_SYSCLK_BUS_ROOT>,
>> +			  <&syscrg JH7110_SYSCLK_PERH_ROOT>,
>> +			  <&syscrg JH7110_SYSCLK_QSPI_REF>;
>> +	assigned-clock-parents = <&pllclk JH7110_PLLCLK_PLL0_OUT>,
>> +				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
>> +				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
>> +				 <&syscrg JH7110_SYSCLK_QSPI_REF_SRC>;
> 
> I think Conor asked about this too, but you still don't write why it's ok to
> drop the 500MHz and 1,5GHz assignments to the cpu-core and pll0 clocks
> respectively. You should add this to the commit message itself.
> 
> /Emil

Is this a remedy for a bug in the JH7110 CPU? I'm not clear why tweaking
the frequencies and increasing core voltage was ever needed.

This goes back to series "clk: starfive: jh7110-sys: Fix lower rate of
CPUfreq by setting PLL0 rate to 1.5GHz" [1].

Since [1] I have had problems with several passively cooled Milk-V Mars
CM Lite systems powering off due to thermal limits. My experience then
is that the specialized 1.5GHz operation is not appropriate for all
JH7110 CPU board layouts and applications.

Hal says I failed to get these assignments in Linux to work in U-Boot
because U-Boot doesn't have driver support to increase CPU voltage, and
Hal offering to add this to a driver in U-Boot... but that's the wrong
way around in my opinion, unless there's some defect in the JH7110 CPU
that it won't run reliably with hardware defaults.

1:
https://lore.kernel.org/all/20240603020607.25122-1-xingyu.wu@starfivetech.com/

What is the correct thing to do here?

-E
