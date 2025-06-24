Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9496A299943
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750769685; cv=none; b=gFcHhMNxfnai+HPnfLNCo21odQ7YHU10/rbjS4n16bmtNq6PTBRSnxg0Q22UpSjTHdQh5gnep2ErTf6mZYa8Y6mXONHBl7Pbftq8DLATZSyJg1QGlGa/Fs1GgPqoHsbnGl/0Gpu+Uy7LRgqed0TGjCFNa2Rj9/vPQtEcfm7uvHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750769685; c=relaxed/simple;
	bh=pJj1WebWYhn7Q88my90Fh2I0LvO/TjQPmlvD7ZxQF2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dhdP/u2a1P5ezxBQ78Tnj/aMefR6xx+c4fh31a3M0oc23vP2giaXurdJhnFnxDFnydg3+kC1qsJciFSIFm5Hw2fAV3I/H/E9DbMkZzUxx9abx7tpzxb81Dy5IJZx1aVeFRijgsNKMnZ6ppHdr9GKYHZq64xIRTAzovIkxii1T7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id F163141CFD;
	Tue, 24 Jun 2025 12:54:32 +0000 (UTC)
Message-ID: <a89f5970-5ea9-4d92-8952-6c26a22ac153@ghiti.fr>
Date: Tue, 24 Jun 2025 14:54:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Prevent early kernel panic in instrumented
 apply_early_boot_alternatives
To: Changbin Du <changbin.du@huawei.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250624113042.2123140-1-changbin.du@huawei.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250624113042.2123140-1-changbin.du@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduleelgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnheptdfhleefjeegheevgeeljeellefgvefhkeeiffekueejteefvdevhfelvdeggeeinecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemfegrsgdtmedujegvtdemhegshegsmeefiedtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemfegrsgdtmedujegvtdemhegshegsmeefiedtiedphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemfegrsgdtmedujegvtdemhegshegsmeefiedtiegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepiedprhgtphhtthhopegthhgrnhhgsghinhdrughusehhuhgrfigvihdrtghomhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghom
 hdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr

Hi Changbin,

On 6/24/25 13:30, Changbin Du wrote:
> Under FTRACE=y, DYNAMIC_FTRACE=n, and RISCV_ALTERNATIVE_EARLY=n, the kernel


Your above config works fine for me, I guess you meant FUNCTION_TRACER 
&& !DYNAMIC_FTRACE (which fails).

We were just talking with Andy about this configuration (FUNCTION_TRACER 
&& !DYNAMIC_FTRACE): do we really want to support static ftrace? Andy 
should send a patch soon to remove this possibility as IMO we don't want 
to support it. Let's wait for this patch and the discussion that will 
follow before merging your fix. I'll keep it in my list for 6.16 just in 
case someone comes up with a good argument to keep it.

Thanks,

Alex


> panics upon returning from _mcount() in the early boot path. This occurs
> during _start_kernel() -> setup_vm() -> apply_early_boot_alternatives().
>
> The CC_FLAGS_FTRACE is only removed from alternative.c when
> CONFIG_RISCV_ALTERNATIVE_EARLY=y. Therefore, no function calls should be
> made to alternative.c during early boot in this configuration.
>
> Fixes: a35707c3d850 ("riscv: add memory-type errata for T-Head")
> Signed-off-by: Changbin Du <changbin.du@huawei.com>
> ---
>   arch/riscv/include/asm/alternative.h | 6 ++++++
>   arch/riscv/kernel/alternative.c      | 4 ++--
>   2 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
> index 3c2b59b25017..c670b0cc55f4 100644
> --- a/arch/riscv/include/asm/alternative.h
> +++ b/arch/riscv/include/asm/alternative.h
> @@ -31,7 +31,13 @@
>   #define ALT_ALT_PTR(a)			__ALT_PTR(a, alt_offset)
>   
>   void __init apply_boot_alternatives(void);
> +
> +# ifdef CONFIG_RISCV_ALTERNATIVE_EARLY
>   void __init apply_early_boot_alternatives(void);
> +# else
> +static inline void apply_early_boot_alternatives(void) { }
> +# endif
> +
>   void apply_module_alternatives(void *start, size_t length);
>   
>   void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
> diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
> index 7eb3cb1215c6..5406c3301627 100644
> --- a/arch/riscv/kernel/alternative.c
> +++ b/arch/riscv/kernel/alternative.c
> @@ -205,6 +205,7 @@ void __init apply_boot_alternatives(void)
>   	apply_vdso_alternatives();
>   }
>   
> +#ifdef CONFIG_RISCV_ALTERNATIVE_EARLY
>   /*
>    * apply_early_boot_alternatives() is called from setup_vm() with MMU-off.
>    *
> @@ -219,12 +220,11 @@ void __init apply_boot_alternatives(void)
>    */
>   void __init apply_early_boot_alternatives(void)
>   {
> -#ifdef CONFIG_RISCV_ALTERNATIVE_EARLY
>   	_apply_alternatives((struct alt_entry *)__alt_start,
>   			    (struct alt_entry *)__alt_end,
>   			    RISCV_ALTERNATIVES_EARLY_BOOT);
> -#endif
>   }
> +#endif
>   
>   #ifdef CONFIG_MODULES
>   void apply_module_alternatives(void *start, size_t length)
