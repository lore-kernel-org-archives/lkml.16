Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC162E11DB
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823757; cv=none; b=FSkGOlEBgFud4AebMa7SMa2+gpgykGKjojo9pqDb4mAu4MYexfqIg52aunA/bG7bbHIFfLM/gyfn73yNd+YHvFGUoz/UA/nvDwQiQY/tVk7souNXMHW9tm/DPflLzyXjpJTo7awAyUuE5CtqUmuH6mcc8sMPKRYJpwD6SP9YdHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823757; c=relaxed/simple;
	bh=gFVg7w4IGD1wQTmHuNAfMPTqDIviAKSZcSYkcJBYn1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OnNB8QJmDCpzWdCZY/TPhGt6+mSUaPum7HWSXAwWrEt1TzTE2kBqbLfuQuvnJ9k+UcWWBJlJZ5eISivVQbNadNHB1u8IHC0v6+npUp0ma7i1vn1gswBIYcRjgG7Ro/mRsjev7oSQuGF9K+xEb+flOsBcbAGYHDaeJco6YGKZp8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id C49C043980;
	Fri, 13 Jun 2025 14:09:09 +0000 (UTC)
Message-ID: <d97aed60-fae0-45bc-8e37-2752f1920a4f@ghiti.fr>
Date: Fri, 13 Jun 2025 16:09:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v7 1/3] riscv: Add RISC-V Svrsw60t59b extension
 support
To: Chunyan Zhang <zhang.lyra@gmail.com>, Deepak Gupta <debug@rivosinc.com>
Cc: Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Morton <akpm@linux-foundation.org>, Ved Shanbhogue
 <ved@rivosinc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250409095320.224100-1-zhangchunyan@iscas.ac.cn>
 <20250409095320.224100-2-zhangchunyan@iscas.ac.cn>
 <aEMeKIBDKUTUI3B1@debug.ba.rivosinc.com>
 <CAAfSe-tUNxzHq-GeN6AhX=46mu5iMYV4OZPNRU1pKf_2xAfGVQ@mail.gmail.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CAAfSe-tUNxzHq-GeN6AhX=46mu5iMYV4OZPNRU1pKf_2xAfGVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepgeduleffheeggeeugeffgfejieeludffgeegudefgfevueeiveejleetleeuteffnecuffhomhgrihhnpehsohhurhgtvgifrghrvgdrohhrghdpihhnfhhrrgguvggrugdrohhrghenucfkphepvdgrtdegmegtvggttdemudduudgvmegsgeegleemkehfudgrmegtfhhfudemrgefkedtmegufeduvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtgeemtggvtgdtmeduudduvgemsgeggeelmeekfhdurgemtghffhdumegrfeektdemugefudgvpdhhvghloheplgfkrfggieemvdgrtdegmegtvggttdemudduudgvmegsgeegleemkehfudgrmegtfhhfudemrgefkedtmegufeduvggnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepiihhrghnghdrlhihrhgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggvsghughesrhhivhhos
 hhinhgtrdgtohhmpdhrtghpthhtohepiihhrghnghgthhhunhihrghnsehishgtrghsrdgrtgdrtghnpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepvhgvugesrhhivhhoshhinhgtrdgtohhm
X-GND-Sasl: alex@ghiti.fr

Hi Chunyan,

On 6/12/25 08:48, Chunyan Zhang wrote:
> Hi Deepak,
>
> On Sat, 7 Jun 2025 at 00:58, Deepak Gupta <debug@rivosinc.com> wrote:
>> On Wed, Apr 09, 2025 at 05:53:18PM +0800, Chunyan Zhang wrote:
>>> The Svrsw60t59b extension allows to free the PTE reserved bits 60
>>> and 59 for software to use.
>>>
>>> Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
>>> ---
>>> arch/riscv/Kconfig             | 13 +++++++++++++
>>> arch/riscv/include/asm/hwcap.h |  1 +
>>> arch/riscv/kernel/cpufeature.c |  1 +
>>> 3 files changed, 15 insertions(+)
>>>
>>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>>> index bbec87b79309..332fc00243ad 100644
>>> --- a/arch/riscv/Kconfig
>>> +++ b/arch/riscv/Kconfig
>>> @@ -842,6 +842,19 @@ config RISCV_ISA_ZICBOZ
>>>
>>>           If you don't know what to do here, say Y.
>>>
>>> +config RISCV_ISA_SVRSW60T59B
>>> +      bool "Svrsw60t59b extension support for using PTE bits 60 and 59"
>>> +      depends on RISCV_ALTERNATIVE
>> depends on MMU && 64BIT as well.
> Ok, I will address in the next version.
>
> Thanks for the review,
> Chunyan
>
>>> +      default y
>>> +      help
>>> +        Adds support to dynamically detect the presence of the SVRSW60T59B


s/SVRSW60T59B/Svrsw60t59b

You can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alexandre Ghiti


>>> +        extension and enable its usage.
>>> +
>>> +        The Svrsw60t59b extension allows to free the PTE reserved bits 60
>>> +        and 59 for software to use.
>>> +
>>> +        If you don't know what to do here, say Y.
>>> +
>>> config TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
>>>        def_bool y
>>>        # https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=aed44286efa8ae8717a77d94b51ac3614e2ca6dc
>>> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
>>> index e3cbf203cdde..985f6dfc80ed 100644
>>> --- a/arch/riscv/include/asm/hwcap.h
>>> +++ b/arch/riscv/include/asm/hwcap.h
>>> @@ -105,6 +105,7 @@
>>> #define RISCV_ISA_EXT_ZVFBFWMA                96
>>> #define RISCV_ISA_EXT_ZAAMO           97
>>> #define RISCV_ISA_EXT_ZALRSC          98
>>> +#define RISCV_ISA_EXT_SVRSW60T59B     99
>>>
>>> #define RISCV_ISA_EXT_XLINUXENVCFG    127
>>>
>>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>>> index 2054f6c4b0ae..0f0f3027d400 100644
>>> --- a/arch/riscv/kernel/cpufeature.c
>>> +++ b/arch/riscv/kernel/cpufeature.c
>>> @@ -523,6 +523,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>>>        __RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
>>>        __RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
>>>        __RISCV_ISA_EXT_DATA(svvptc, RISCV_ISA_EXT_SVVPTC),
>>> +      __RISCV_ISA_EXT_DATA(svrsw60t59b, RISCV_ISA_EXT_SVRSW60T59B),
>>> };
>>>
>>> const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
>>> --
>>> 2.34.1
>>>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
