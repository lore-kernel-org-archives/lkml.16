Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7CD374FF
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743166814; cv=none; b=RyRikXqQqv3+/670DP7nlYPYc6EJp9RfYT30EJ9b2yop/1lkwKR6PL8C9eJe8E6JSI/DCT2QQpCr2Ma+xQPkJ2IO8h5mXSLHJ+q/FomOQDFnJ99xuDJvP1/PYkv17YtcWV0uRsROMsKu+XnPEf3VN1aGksS0nnNInk56TDyXOwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743166814; c=relaxed/simple;
	bh=mtrhs0FWYCc+xIyO8l1PClhGbGvAQDUBWAAAWdvfHwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g6nK1UOWyKH8mwVcDK/U8GgK7yPT2BmKdpfHYe4NQLUvvY9EtSAuzzasUH5GwiWB56OYFe3ETBlu13Wg8LDFRi46QjRhlI/1/8Zvtsx0T/tLsFU56W7uKNiILT+99E19APaAF21kv2EJaqcooIew4SBKZuHk7O52OGV+h+silrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id E605E442A7;
	Fri, 28 Mar 2025 13:00:01 +0000 (UTC)
Message-ID: <26afad1a-bee0-498b-8213-aea87167dedd@ghiti.fr>
Date: Fri, 28 Mar 2025 14:00:01 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Make sure toolchain supports zba before using zba
 instructions
Content-Language: en-US
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: kernel test robot <lkp@intel.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>
References: <20250328115422.253670-1-alexghiti@rivosinc.com>
 <7352dfbf-51e0-47b0-81e2-264f30989bf1@rivosinc.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <7352dfbf-51e0-47b0-81e2-264f30989bf1@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujedufeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeejieeuudejieekveeutdeguefhkeduledugeevhefffeejudeggedufffgleeugfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeefuddrfedvrdekuddrudekjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeefuddrfedvrdekuddrudekjedphhgvlhhopegludelvddrudeikedrvddurdefudgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepjedprhgtphhtthhopegtlhgvghgvrhesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtoheprghlvgigghhhihhtihesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtoheplhhkphesihhnthgvlhdrtghomhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgp
 dhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhm
X-GND-Sasl: alex@ghiti.fr

On 28/03/2025 13:51, Clément Léger wrote:
>
> On 28/03/2025 12:54, Alexandre Ghiti wrote:
>> Old toolchain like gcc 8.5.0 does not support zba, so we must check that
>> the toolchain supports this extension before using it in the kernel.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202503281836.8pntHm6I-lkp@intel.com/
>> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>> ---
>>   arch/riscv/Kconfig                     | 8 ++++++++
>>   arch/riscv/include/asm/runtime-const.h | 5 +++--
>>   2 files changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 0d8def968a7e..ae6303f15b28 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -735,6 +735,14 @@ config TOOLCHAIN_HAS_VECTOR_CRYPTO
>>   	def_bool $(as-instr, .option arch$(comma) +v$(comma) +zvkb)
>>   	depends on AS_HAS_OPTION_ARCH
>>   
>> +config TOOLCHAIN_HAS_ZBA
>> +	bool
>> +	default y
>> +	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zba)
>> +	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zba)
>> +	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
>> +	depends on AS_HAS_OPTION_ARCH
>> +
>>   config RISCV_ISA_ZBA
> Hi Alex,
>
> Why not add a "depends on TOOLCHAIN_HAS_ZBA" here so you don't have to
> check for that config option when using CONFIG_RISCV_ISA_ZBA ? This is
> done like that for ZBB and ZBC.


Actually Conor changed that for Zbb in 
https://lore.kernel.org/lkml/20241024-aspire-rectify-9982da6943e5@spud/T/#m89d45ba3cbc6c2f953516c0e9977fecf397809b0 
which is queued for 6.15.

Zba is also used in BPF, so we should not require that the toolchain 
supports zba but instead just that the platform supports it.

Thanks,

Alex


>
> Thanks,
>
> Clément
>
>>   	bool "Zba extension support for bit manipulation instructions"
>>   	default y
>> diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
>> index ea2e49c7149c..c07d049fdd5d 100644
>> --- a/arch/riscv/include/asm/runtime-const.h
>> +++ b/arch/riscv/include/asm/runtime-const.h
>> @@ -77,7 +77,8 @@
>>   	".long 1b - .\n\t"					\
>>   	".popsection"						\
>>   
>> -#if defined(CONFIG_RISCV_ISA_ZBA) && defined(CONFIG_RISCV_ISA_ZBKB)
>> +#if defined(CONFIG_RISCV_ISA_ZBA) && defined(CONFIG_TOOLCHAIN_HAS_ZBA)	\
>> +	&& defined(CONFIG_RISCV_ISA_ZBKB)
>
>>   #define runtime_const_ptr(sym)						\
>>   ({									\
>>   	typeof(sym) __ret, __tmp;					\
>> @@ -93,7 +94,7 @@
>>   		: [__ret] "=r" (__ret), [__tmp] "=r" (__tmp));		\
>>   	__ret;								\
>>   })
>> -#elif defined(CONFIG_RISCV_ISA_ZBA)
>> +#elif defined(CONFIG_RISCV_ISA_ZBA) && defined(CONFIG_TOOLCHAIN_HAS_ZBA)
>>   #define runtime_const_ptr(sym)						\
>>   ({									\
>>   	typeof(sym) __ret, __tmp;					\
