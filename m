Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE95F280327;
	Tue,  6 May 2025 13:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746538452; cv=none; b=ghejN/Eh/+1wTADzio5PuYLgg8Vg7D6WNB9+CVojkbtChCBM3hepIPf/YLRW03X5yjsvGXNKtXHJReFUPCxVw7cmwnoga9TiNSXTGuYzSqI8mWtCdlRiZJijeGFpXgxeuLME74Cfsx8wG6TNAjxRTbwTo+C09DvmbzkgbTaaOQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746538452; c=relaxed/simple;
	bh=8UyH5kKUBxEMOm4LPDEmDz6QR/KnRy9FLct88j76kTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dxsaiMMQyGbs/JhNspoa6udMLw1kUX5eZISe1FQySXLdJZYThB9DunZR5fuQwqHGT64IXs1TT8J0oQFSf75qGL2W7rGuK8fO9M5Rat8iEaeDz71RMc0o4JjHdQOOAYXql1+4QNUOR2NFFdgu70fgIv6xI/VT0xx//H4741qOE7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HcB3EycQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HcB3EycQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 024B4C4CEE4;
	Tue,  6 May 2025 13:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746538452;
	bh=8UyH5kKUBxEMOm4LPDEmDz6QR/KnRy9FLct88j76kTM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HcB3EycQiKMmNSpEZm8qX4wOZ5UPyNbFk93mGEGb5EbSs3TOHufV77AphIFwu4Nku
	 Og6uTbIW2gAihFZptBDqH8hY51O/VLpC3n3idSzEyUuUeg7OmMTfgEoPPESjKGYWuQ
	 VFsXJstuqNQmZswUdqhE0/Cj5t6bFkBYMyTYLZGnd07S4Vujza9pDe0gKwHezwZLpt
	 stUZpOcBxfE4Px4f34aSjqHnAuYoLu2+JfTlDDYdol0fE1Jl7SYvWU4nb0ffPq48/U
	 k/yLkLcIzVbC52A+xBbMmLGJd6H7tWZjUSSITn+hHzunJazbHxCWZEbeBDMTeczPqz
	 lBg13qbofSA4g==
Message-ID: <4146d497-9440-4a3e-9348-1394a610a93e@kernel.org>
Date: Tue, 6 May 2025 15:34:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/3] memory: Add STM32 Octo Memory Manager driver
To: Patrice CHOTARD <patrice.chotard@foss.st.com>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: christophe.kerello@foss.st.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250506-upstream_ospi_v6-v12-0-e3bb5a0d78fb@foss.st.com>
 <20250506-upstream_ospi_v6-v12-2-e3bb5a0d78fb@foss.st.com>
 <88b463b2-6cd3-4b92-acc5-447bbfadabde@kernel.org>
 <ad80e3b8-4f62-4c58-8dbd-762f0b268713@foss.st.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <ad80e3b8-4f62-4c58-8dbd-762f0b268713@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/05/2025 13:16, Patrice CHOTARD wrote:
> 
> 
> On 5/6/25 10:02, Krzysztof Kozlowski wrote:
>> On 06/05/2025 09:52, Patrice Chotard wrote:
>>> Octo Memory Manager driver (OMM) manages:
>>>   - the muxing between 2 OSPI busses and 2 output ports.
>>>     There are 4 possible muxing configurations:
>>>       - direct mode (no multiplexing): OSPI1 output is on port 1 and OSPI2
>>>         output is on port 2
>>>       - OSPI1 and OSPI2 are multiplexed over the same output port 1
>>>       - swapped mode (no multiplexing), OSPI1 output is on port 2,
>>>         OSPI2 output is on port 1
>>>       - OSPI1 and OSPI2 are multiplexed over the same output port 2
>>>   - the split of the memory area shared between the 2 OSPI instances.
>>>   - chip select selection override.
>>>   - the time between 2 transactions in multiplexed mode.
>>>   - check firewall access.
>>>
>>> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
>>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>>> ---
>>>  drivers/memory/Kconfig     |  18 ++
>>>  drivers/memory/Makefile    |   1 +
>>>  drivers/memory/stm32_omm.c | 476 +++++++++++++++++++++++++++++++++++++++++++++
>>>  3 files changed, 495 insertions(+)
>>>
>>> diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
>>> index c82d8d8a16eaf154c247c0dbb9aff428b7c81402..bc7ab46bd8b98a89f0d9173e884a99b778cdc9c4 100644
>>> --- a/drivers/memory/Kconfig
>>> +++ b/drivers/memory/Kconfig
>>> @@ -225,6 +225,24 @@ config STM32_FMC2_EBI
>>>  	  devices (like SRAM, ethernet adapters, FPGAs, LCD displays, ...) on
>>>  	  SOCs containing the FMC2 External Bus Interface.
>>>  
>>> +config STM32_OMM
>>> +	tristate "STM32 Octo Memory Manager"
>>> +	depends on ARCH_STM32 || COMPILE_TEST
>>> +	depends on SPI_STM32_OSPI
>>
>> I don't think you tested for the reported issue. I reported that
>> firewall symbols are missing and you add dependency on ospi. How is that
>> related? How does this solve any problem?
> 
> Hi Krzysztof
> 
> The dependency with SPI_STM32_OSPI was already present since the beginning.
> I just added dependency on ARCH_STM32 on this current version to avoid issue on x86_64 arch.

Ah, I missed that in the diff.

Anyway this does not solve the case - you still won't get your
bus/firewall code.

> 
> On my side i tested compilation on arm, arm64 and x86_64 without any issue.

Oh man... do you understand that this is compile test? Enable STM32_OMM
on x86_64 and immediately you will see the error.


> 
> I tried to reproduce your build process:
> 
> 
> 
> make -j16 defconfig
>   HOSTCC  scripts/basic/fixdep
>   HOSTCC  scripts/kconfig/conf.o
>   HOSTCC  scripts/kconfig/confdata.o
>   HOSTCC  scripts/kconfig/expr.o
>   LEX     scripts/kconfig/lexer.lex.c
>   YACC    scripts/kconfig/parser.tab.[ch]
>   HOSTCC  scripts/kconfig/menu.o
>   HOSTCC  scripts/kconfig/preprocess.o
>   HOSTCC  scripts/kconfig/symbol.o
>   HOSTCC  scripts/kconfig/util.o
>   HOSTCC  scripts/kconfig/lexer.lex.o
>   HOSTCC  scripts/kconfig/parser.tab.o
>   HOSTLD  scripts/kconfig/conf
> *** Default configuration is based on 'x86_64_defconfig'
> #
> # configuration written to .config
> #
> 
> scripts/config --file .config -e COMPILE_TEST -e OF -e SRAM -e MEMORY -e PM_DEVFREQ -e FPGA -e FPGA_DFL
> 
> scripts/config --file .config -e SAMSUNG_MC
> scripts/config --file .config -e EXYNOS5422_DMC
> scripts/config --file .config -e EXYNOS_SROM
> scripts/config --file .config -e TEGRA_MC
> scripts/config --file .config -e TEGRA20_EMC
> scripts/config --file .config -e TEGRA30_EMC
> scripts/config --file .config -e TEGRA124_EMC
> scripts/config --file .config -e TEGRA210_EMC_TABLE
> scripts/config --file .config -e TEGRA210_EMC
> scripts/config --file .config -e MEMORY
> scripts/config --file .config -e DDR
> scripts/config --file .config -e ARM_PL172_MPMC
> scripts/config --file .config -e ATMEL_EBI
> scripts/config --file .config -e BRCMSTB_DPFE
> scripts/config --file .config -e BRCMSTB_MEMC
> scripts/config --file .config -e BT1_L2_CTL
> scripts/config --file .config -e TI_AEMIF
> scripts/config --file .config -e TI_EMIF
> scripts/config --file .config -e OMAP_GPMC
> scripts/config --file .config -e OMAP_GPMC_DEBUG
> scripts/config --file .config -e TI_EMIF_SRAM
> scripts/config --file .config -e FPGA_DFL_EMIF
> scripts/config --file .config -e MVEBU_DEVBUS
> scripts/config --file .config -e FSL_CORENET_CF
> scripts/config --file .config -e FSL_IFC
> scripts/config --file .config -e JZ4780_NEMC
> scripts/config --file .config -e MTK_SMI
> scripts/config --file .config -e DA8XX_DDRCTL
> scripts/config --file .config -e PL353_SMC
> scripts/config --file .config -e RENESAS_RPCIF
> scripts/config --file .config -e STM32_FMC2_EBI
> scripts/config --file .config -e STM32_OMM

That's the code from previous version, which would lead you to the bug.
Once you understand the bug, you should understand that SPI_STM32_OSPI
is not selected here, thus STM32_OMM is not there.

You did not fix the bug, you just masked it for one given configuration,
but still having the bug for other.

Answer to yourself: where are firewall functions? Then, answer: is this
thing with firewall selected (or expressed as dependency) when you
select this driver?

If not, do you have stubs for the firewall?
If yes, do you have stubs for module case (one is a module, other is not)?

This all will lead you to missing dependency for the firewall kconfig.
Now the dependency must be also tested for module & non-module cases
(see longer explanation in docs kconfig syntax).

Best regards,
Krzysztof
