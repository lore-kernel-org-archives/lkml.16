Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55361204840
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 10:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744367318; cv=none; b=piPPn4eBpDf8EShWqumYteTBiVk2lmJp58ekDTBglmtYa/1N7y0/Qvpzpx+EBe+00Ym4rTZEpkevGe1ahSjrBOczJCc+yKtD1F/SH/c/JPI1ZaMLnICnMceVJuvC/y8bhENBZUlDZQ4gWhOsSm5UEd5qEATf1YZy+PCWib/0lEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744367318; c=relaxed/simple;
	bh=rtNvKOHo+CDWwX6v8e8oLDBWT5FTySvzXMltZLlA9ME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nk1m6xZTPZzQ45xqI875b5FAMMPSmsBGbKUFH1l4YyNuwazm04Lgut9jRD25SEFEOcPtJGRmtwP+UoUsPbWhMnHUvTR1qGXdb229Qc6uydS3NCTFoWJZwJF6LKVFoLFLBPcfJGtck3NYL7n+dkLWUgK9lWDZAuveOuO1lJAgZ18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A86844195;
	Fri, 11 Apr 2025 10:28:32 +0000 (UTC)
Message-ID: <bbdfe17e-a58a-4a14-9e74-8794b08fdda6@ghiti.fr>
Date: Fri, 11 Apr 2025 12:28:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH fixes] riscv: Properly export reserved regions in
 /proc/iomem
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>,
 linux-riscv@lists.infradead.org
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 linux-kernel@vger.kernel.org
References: <20250409182129.634415-1-bjorn@kernel.org>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250409182129.634415-1-bjorn@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvudduheejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedtgeeuhffhveeujeetveevieekleekvdffudefleevgefgieekkefggefhtddtveenucfkphepudelfedrfeefrdehjedrudelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduleefrdeffedrheejrdduleelpdhhvghloheplgduledvrdduieekrddvuddrvdehngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeejpdhrtghpthhtohepsghjohhrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtohepmhhitghksehitghsrdhfohhrthhhrdhgrhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepsghjohhrnhesrhhivhhoshhin
 hgtrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alex@ghiti.fr

Hi Bjorn,

On 09/04/2025 20:21, Björn Töpel wrote:
> From: Björn Töpel <bjorn@rivosinc.com>
>
> The /proc/iomem represents the kernel's memory map. Regions marked
> with "Reserved" tells the user that the range should not be tampered
> with. Kexec-tools, when using the older kexec_load syscall relies on
> the "Reserved" regions to build the memory segments, that will be the
> target of the new kexec'd kernel.
>
> The RISC-V port tries to expose all reserved regions to userland, but
> some regions were not properly exposed: Regions that resided in both
> the "regular" and reserved memory block, e.g. the EFI Memory Map. A
> missing entry could result in reserved memory being overwritten.
>
> It turns out, that arm64, and loongarch had a similar issue a while
> back:
>
>    commit d91680e687f4 ("arm64: Fix /proc/iomem for reserved but not memory regions")
>    commit 50d7ba36b916 ("arm64: export memblock_reserve()d regions via /proc/iomem")
>
> Similar to the other ports, resolve the issue by splitting the regions
> in an arch initcall, since we need a working allocator.
>
> Fixes: ffe0e5261268 ("RISC-V: Improve init_resources()")
> Signed-off-by: Björn Töpel <bjorn@rivosinc.com>
> ---
>   arch/riscv/kernel/setup.c | 36 +++++++++++++++++++++++++++++++++++-
>   1 file changed, 35 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index c174544eefc8..f7c9a1caa83e 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -66,6 +66,9 @@ static struct resource bss_res = { .name = "Kernel bss", };
>   static struct resource elfcorehdr_res = { .name = "ELF Core hdr", };
>   #endif
>   
> +static int num_standard_resources;
> +static struct resource *standard_resources;
> +
>   static int __init add_resource(struct resource *parent,
>   				struct resource *res)
>   {
> @@ -139,7 +142,7 @@ static void __init init_resources(void)
>   	struct resource *res = NULL;
>   	struct resource *mem_res = NULL;
>   	size_t mem_res_sz = 0;
> -	int num_resources = 0, res_idx = 0;
> +	int num_resources = 0, res_idx = 0, non_resv_res = 0;
>   	int ret = 0;
>   
>   	/* + 1 as memblock_alloc() might increase memblock.reserved.cnt */
> @@ -193,6 +196,7 @@ static void __init init_resources(void)
>   	/* Add /memory regions to the resource tree */
>   	for_each_mem_region(region) {
>   		res = &mem_res[res_idx--];
> +		non_resv_res++;
>   
>   		if (unlikely(memblock_is_nomap(region))) {
>   			res->name = "Reserved";
> @@ -210,6 +214,9 @@ static void __init init_resources(void)
>   			goto error;
>   	}
>   
> +	num_standard_resources = non_resv_res;
> +	standard_resources = &mem_res[res_idx + 1];
> +
>   	/* Clean-up any unused pre-allocated resources */
>   	if (res_idx >= 0)
>   		memblock_free(mem_res, (res_idx + 1) * sizeof(*mem_res));
> @@ -221,6 +228,33 @@ static void __init init_resources(void)
>   	memblock_free(mem_res, mem_res_sz);
>   }
>   
> +static int __init reserve_memblock_reserved_regions(void)
> +{
> +	u64 i, j;
> +
> +	for (i = 0; i < num_standard_resources; i++) {
> +		struct resource *mem = &standard_resources[i];
> +		phys_addr_t r_start, r_end, mem_size = resource_size(mem);
> +
> +		if (!memblock_is_region_reserved(mem->start, mem_size))
> +			continue;
> +
> +		for_each_reserved_mem_range(j, &r_start, &r_end) {
> +			resource_size_t start, end;
> +
> +			start = max(PFN_PHYS(PFN_DOWN(r_start)), mem->start);
> +			end = min(PFN_PHYS(PFN_UP(r_end)) - 1, mem->end);
> +
> +			if (start > mem->end || end < mem->start)
> +				continue;
> +
> +			reserve_region_with_split(mem, start, end, "Reserved");
> +		}
> +	}
> +
> +	return 0;
> +}
> +arch_initcall(reserve_memblock_reserved_regions);
>   
>   static void __init parse_dtb(void)
>   {
>
> base-commit: a24588245776dafc227243a01bfbeb8a59bafba9


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

It will be merged with other fixes in the next rc-ish!

Thanks,

Alex

