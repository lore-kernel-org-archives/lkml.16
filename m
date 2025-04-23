Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DADB244670;
	Wed, 23 Apr 2025 20:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745439916; cv=none; b=E6yN+BiGglU76hgn84ysOqoXVs1U3s4Hc/UC0rdpunax03gxKYuSO/mJ6sAO43jaMkO2BDqbZWb0DF9k1LVLkw6sS8YtOpVJNDw/HR/MM7iPV0X86tX5z/dk7zqd6U4Pry2B8tEIkvxOHwgv0CXMbk69rsjDOBjwdrcJVZ4SNyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745439916; c=relaxed/simple;
	bh=L9c8Wbib4Le+3TFbPIViZCMxCLCeZwmVDh80pjYJCwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uKvGa8Sp8ziqyqRaU9l6bcemZNYdlHf/TKGYZXHir6s44tt3tIVJgKmp3Nj8Tq1n9wc7TPZUljaHZLaq1MU6E/5iBxb7ebcsasiKxpwk8kGnzvhIRfsLC5T9x+dd+g5g6Tkcx/ikXgObvZxTY/eLJn4nZgD9VAO8hlMeHuA1QVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Received: from [192.168.2.35] (unknown [98.97.25.173])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id EEF91B4C0D36;
	Wed, 23 Apr 2025 22:18:07 +0200 (CEST)
Message-ID: <1044b038-1e29-4058-9cb5-155551cd62ae@freeshell.de>
Date: Wed, 23 Apr 2025 13:18:06 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] riscv: dts: starfive: jh7110-common: assign 24MHz
 clock-frequency to uart0
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Conor Dooley <conor@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20250203013730.269558-1-e@freeshell.de>
 <20250203013730.269558-4-e@freeshell.de>
 <CAJM55Z95pwTZmw-WPcUaB1BGpVoNgaRYYjUnqSFcLTNyVmZahg@mail.gmail.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <CAJM55Z95pwTZmw-WPcUaB1BGpVoNgaRYYjUnqSFcLTNyVmZahg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/5/25 02:29, Emil Renner Berthing wrote:
> E Shattow wrote:
>> Set uart0 clock-frequency for better compatibility with operating system
>> and downstream boot loader SPL secondary program loader.
>>
>> Signed-off-by: E Shattow <e@freeshell.de>
>> ---
>>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>> index 8a59c3001339..6bb13af82147 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>> @@ -635,6 +635,7 @@ GPOEN_DISABLE,
>>  };
>>
>>  &uart0 {
>> +	clock-frequency = <24000000>;
>>  	pinctrl-names = "default";
>>  	pinctrl-0 = <&uart0_pins>;
>>  	status = "okay";
> 
> The uart0 node already has a reference to the uart0_core clock, so it shouldn't
> need this property.
> 
> /Emil

Okay. I'll drop this patch from next version of the series, and asking
on U-Boot mailing list what to do about it there [1]. Thanks for reviewing!

-E

1:
https://lore.kernel.org/u-boot/c0023d23-4614-40c5-b612-9c0cb5b4d8b1@freeshell.de/
