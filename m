Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90B62472AC
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 14:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744639393; cv=none; b=Smct9oaI5lTIgvQLQ0/OgmBS/1hsVlZRiOyzcjo5WhIEbktz1ZMuVz9wBXGkuKEayLn6GzRaFTySHe3TBPL57iaZy8eMdf1gr+xnz0LfCyc4i6xbHW6ofu/mGe+ypgq2DUAIWIhdZYH28iLlhjB2TWG7VoiTEzdUiAJDiUwnoGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744639393; c=relaxed/simple;
	bh=Z1otz9cSp4ena0kJ+MGGzF+jGF5EYazLvaOGTBa/c10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CvVNhCQQci/4MHTdYxCCXhRiVDhORIqCfnTSMenu0aZ2ZiN/uq5zVXv9qjwernm6xXq4VxkhRLl120fdNM6uEWNVnh7dexFMKr3hapcO0RL5SIteiNx+KLIcWlBTi4dF+PsSs/RWlAiRsPo8cax6d+J7YLvBlEbiEOe40bkRgnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8EB0B43B11;
	Mon, 14 Apr 2025 14:03:04 +0000 (UTC)
Message-ID: <109bdc38-b510-48bd-8c18-2a858bd9d168@ghiti.fr>
Date: Mon, 14 Apr 2025 16:03:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] riscv: mm: fix boot hang when the kernel is loaded
 into a non-canonical address
Content-Language: en-US
To: Ignacio Encinas <ignacio@iencinas.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
 Palmer Dabbelt <palmer@rivosinc.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Nick Kossifidis <mick@ics.forth.gr>
References: <20250411-riscv-dont-hang-on-noncanonical-paddr-v1-1-dc665a46246d@iencinas.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250411-riscv-dont-hang-on-noncanonical-paddr-v1-1-dc665a46246d@iencinas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddtjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeejieeuudejieekveeutdeguefhkeduledugeevhefffeejudeggedufffgleeugfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemhegvfhgsmeeiieeikeemkeefiegsmegufhgrleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemhegvfhgsmeeiieeikeemkeefiegsmegufhgrledphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemhegvfhgsmeeiieeikeemkeefiegsmegufhgrlegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepledprhgtphhtthhopehighhnrggtihhosehivghntghinhgrshdrtghomhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhop
 ehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhdqmhgvnhhtvggvsheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehskhhhrghnsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepphgrlhhmvghrsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: alex@ghiti.fr

Hi Ignacio,

On 11/04/2025 22:15, Ignacio Encinas wrote:
> Virtual memory systems usually impose restrictions on the virtual
> addresses that can be translated. For RISC-V, this is specified in
> the Subsection "Addressing and Memory protection" of "The RISC-V
> Instruction Set Manual: Volume II: Privileged Architecture" associated
> with each SV{39,48,59} mode.
>
> Addresses that can be translated are also known as "canonical
> addresses". Using SV39 as an example and quoting the ISA Manual:
>
> 	Instruction fetch addresses and load and store effective
> 	addresses, which are 64 bits, must have bits 63–39 all equal to
> 	bit 38, or else a page-fault exception will occur.
>
> Given that RISC-V systems don't advertise which SV modes are supported,
> this has to be detected at boot time (this is currently done by
> set_satp_mode). In order to do so, a temporary 1:1 mapping is set. If
> the set_satp_mode function is loaded into a "non-canonical" physical
> address, this 1:1 mapping will make the boot hang.
>
> Fix the issue by avoiding SV modes that would trigger the aforementioned
> bug.
>
> Fixes: e8a62cc26ddf ("riscv: Implement sv48 support")
> Reported-by: Nick Kossifidis <mick@ics.forth.gr>
> Closes: https://lore.kernel.org/all/ff85cdc4-b1e3-06a3-19fc-a7e1acf99d40@ics.forth.gr/
> Signed-off-by: Ignacio Encinas <ignacio@iencinas.com>
> ---
> This isn't bulletproof because we might skip the *only* level supported
> by a CPU (AFAIK implementations are only required to support 1 SV mode).


Implementations have to support all the lower sv modes (sv57 implies 
sv48 which implies sv39).


>
> SV48 might be the only supported mode and the kernel might be loaded
> into a "non-canonical" address for SV48. The kernel will assume SV39
> is supported and try to boot it. However, this is a strict improvement
> over what is already there.
>
> This issue would go away if we could do the SATP probing in Machine
> mode, as that wouldn't turn virtual memory on. Perhaps this "SV mode
> supported" discovery should be offered by SBI?
>
> This was pointed out in the original patch review [1]. This issue seems
> to be of no practical relevance (nobody has complained)
>
> [1] https://lore.kernel.org/all/ff85cdc4-b1e3-06a3-19fc-a7e1acf99d40@ics.forth.gr/
>
> In order to reproduce the issue it suffices to tweak qemu
>
> --- START DIFF ---
>   diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>   index 45a8c4f8190d..16c5a63176c5 100644
>   --- a/hw/riscv/virt.c
>   +++ b/hw/riscv/virt.c
>   @@ -88,7 +88,7 @@ static const MemMapEntry virt_memmap[] = {
>        [VIRT_IMSIC_S] =      { 0x28000000, VIRT_IMSIC_MAX_SIZE },
>        [VIRT_PCIE_ECAM] =    { 0x30000000,    0x10000000 },
>        [VIRT_PCIE_MMIO] =    { 0x40000000,    0x40000000 },
>   -    [VIRT_DRAM] =         { 0x80000000,           0x0 },
>   +    [VIRT_DRAM] =         { 0x800000000000,           0x0 },
>    };
>
>    /* PCIe high mmio is fixed for RV32 */
> --- END DIFF ---
>
> qemu-system-riscv64 -nographic -machine virt -kernel Image -initrd initramfs -append "no5lvl"
>
> should work but
>
> patched-qemu-system-riscv64 -nographic -machine virt -kernel Image -initrd initramfs -append "no5lvl"
>
> will not boot.
>
> (*) I use SV48 to trigger the issue (no5lvl) because doing this with
> SV57 triggers a warning regarding PMP and I don't know if that might
> affect something else. The SV mode doesn't really matter here.
>
> A couple of things I'm not sure about:
> 	1. canonical_vaddr won't be called outside CONFIG_64BIT. I
> 	   figured the #ifdef doesn't hurt all that much despite being
> 	   useless
> 	2. Is panicking ok? I don't quite like it but I can't think of
> 	   anything else
> ---
>   arch/riscv/mm/init.c | 43 +++++++++++++++++++++++++++++++++++++++----
>   1 file changed, 39 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index ab475ec6ca42..6cd5abc0e26a 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -7,6 +7,7 @@
>    */
>   
>   #include <linux/init.h>
> +#include <linux/bits.h>
>   #include <linux/mm.h>
>   #include <linux/memblock.h>
>   #include <linux/initrd.h>
> @@ -844,6 +845,37 @@ static void __init set_mmap_rnd_bits_max(void)
>   	mmap_rnd_bits_max = MMAP_VA_BITS - PAGE_SHIFT - 3;
>   }
>   
> +static int __init canonical_vaddr(unsigned long vaddr)
> +{
> +#ifdef CONFIG_64BIT
> +	unsigned long sv_mode_mask;
> +	unsigned long masked_vaddr;
> +	unsigned long mask_begin;
> +
> +	switch (satp_mode) {
> +	case SATP_MODE_57:
> +		mask_begin = 56;
> +		break;
> +	case SATP_MODE_48:
> +		mask_begin = 47;
> +		break;
> +	case SATP_MODE_39:
> +		mask_begin = 38;
> +		break;
> +	default:
> +		panic("Unknown Virtual Memory mode!");
> +	}
> +
> +	sv_mode_mask = GENMASK(63, mask_begin);
> +	masked_vaddr = vaddr & sv_mode_mask;
> +
> +	// For SV<X> bits [63, X-1] must be all ones or zeros
> +	return masked_vaddr == 0 || masked_vaddr == sv_mode_mask;
> +#else
> +	return true;
> +#endif
> +}
> +
>   /*
>    * There is a simple way to determine if 4-level is supported by the
>    * underlying hardware: establish 1:1 mapping in 4-level page table mode
> @@ -887,12 +919,15 @@ static __init void set_satp_mode(uintptr_t dtb_pa)
>   				(uintptr_t)early_p4d : (uintptr_t)early_pud,
>   			   PGDIR_SIZE, PAGE_TABLE);
>   
> +	hw_satp = 0ULL;
>   	identity_satp = PFN_DOWN((uintptr_t)&early_pg_dir) | satp_mode;
>   
> -	local_flush_tlb_all();
> -	csr_write(CSR_SATP, identity_satp);
> -	hw_satp = csr_swap(CSR_SATP, 0ULL);
> -	local_flush_tlb_all();
> +	if (canonical_vaddr((uint64_t)set_satp_mode_pmd)) {


set_satp_mode() starts by checking sv57, then falls back to sv48 and 
finally boots using sv39.

The thing is if the address where the kernel is loaded is not canonical 
for sv57, it won't be for lower modes so no need to continue, the only 
valid fallback would then be sv39.

So we indeed prevent booting in a higher mode just because we use this 
1:1 mapping...

Maybe the right solution is to use the mode defined in the device tree 
if there's one?

Thanks,

Alex


> +		local_flush_tlb_all();
> +		csr_write(CSR_SATP, identity_satp);
> +		hw_satp = csr_swap(CSR_SATP, 0ULL);
> +		local_flush_tlb_all();
> +	}
>   
>   	if (hw_satp != identity_satp) {
>   		if (pgtable_l5_enabled) {
>
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250407-riscv-dont-hang-on-noncanonical-paddr-9d288f10df8a
>
> Best regards,
