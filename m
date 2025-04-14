Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45BAF17A305
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 12:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744632268; cv=none; b=s4ufVF4M44ZvlNaq8+JXeqtFEneTTZTfNgS+hb9xzgEpeBKccv5dM8aZhxOaEnmXRma9bCLm0Oenru7osJnj9Al3uxaKWt5bqf1Q3OUs+17d+wAitaIfysVAwGeajimXGBpvc2AfpygEdh3A9wcE6P+vLAJi53qeA3BZK3FaFkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744632268; c=relaxed/simple;
	bh=aJSUPFgJZb9v32QkKrzYp073A4IGJ59Ia6HNTYi5RKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XzHbl9jJv7ypzaAvtO2sklUhewjQ2y6aw5itpIXVGh//BOfKQBAYRft0hZPAsBF5cugqMaGNgrhxuzfwAj80HQJRRLwMeOvuuYU8WbyW6kTGTIrvNy4lWJm4tEhPrNpR+z04ykWfcnD6/eVKgmphG8itVYGHs/fm3/xB6L5yWGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7E891007;
	Mon, 14 Apr 2025 05:04:22 -0700 (PDT)
Received: from [10.57.86.225] (unknown [10.57.86.225])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 19C753F694;
	Mon, 14 Apr 2025 05:04:22 -0700 (PDT)
Message-ID: <16602b97-2f49-4612-9e9a-d6d0ed964fd3@arm.com>
Date: Mon, 14 Apr 2025 13:04:21 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: Re-organise setting up FEAT_S1PIE registers
 PIRE0_EL1 and PIR_EL1
Content-Language: en-GB
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
References: <20250410074024.1545768-1-anshuman.khandual@arm.com>
 <6e6305fd-3b93-43ec-8114-e81b2926adfc@arm.com>
 <CAMj1kXG5R1jVWLQ-XEcqF9U365T18pTW8u3DgC7OY4N53hchOA@mail.gmail.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <CAMj1kXG5R1jVWLQ-XEcqF9U365T18pTW8u3DgC7OY4N53hchOA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/04/2025 10:41, Ard Biesheuvel wrote:
> On Mon, 14 Apr 2025 at 09:52, Ryan Roberts <ryan.roberts@arm.com> wrote:
>>
>> On 10/04/2025 08:40, Anshuman Khandual wrote:
>>> mov_q cannot really move PIE_E[0|1] macros into a general purpose register
>>> as expected if those macro constants contain some 128 bit layout elements,
>>> required for D128 page tables. Fix this problem via first loading up these
>>> macro constants into a given memory location and then subsequently setting
>>> up registers PIRE0_EL1 and PIR_EL1 by retrieving the memory stored values.
>>
>> From memory, the primary issue is that for D128, PIE_E[0|1] are defined in terms
>> of 128-bit types with shifting and masking, which the assembler can't do? It
>> would be good to spell this out.
>>
>>>
>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>> Cc: Will Deacon <will@kernel.org>
>>> Cc: Mark Rutland <mark.rutland@arm.com>
>>> Cc: Ard Biesheuvel <ardb@kernel.org>
>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> Cc: linux-kernel@vger.kernel.org
>>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>>> ---
>>> This patch applies on v6.15-rc1
>>>
>>>  arch/arm64/kernel/head.S         | 3 +++
>>>  arch/arm64/kernel/pi/map_range.c | 6 ++++++
>>>  arch/arm64/kernel/pi/pi.h        | 1 +
>>>  arch/arm64/mm/mmu.c              | 1 +
>>>  arch/arm64/mm/proc.S             | 5 +++--
>>>  5 files changed, 14 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
>>> index 2ce73525de2c..4950d9cc638a 100644
>>> --- a/arch/arm64/kernel/head.S
>>> +++ b/arch/arm64/kernel/head.S
>>> @@ -126,6 +126,9 @@ SYM_CODE_START(primary_entry)
>>>        * On return, the CPU will be ready for the MMU to be turned on and
>>>        * the TCR will have been set.
>>>        */
>>> +     adr_l   x0, pir_data
>>> +     bl      __pi_load_pir_data
>>
>> Using C code to pre-calculate the values into global variables that the assembly
>> code then loads and stuffs into the PIR registers feels hacky. I wonder if we
>> can instead pre-calculate into asm-offsets.h? e.g. add the following to
>> asm-offsets.c:
>>
>> DEFINE(PIE_E0_ASM, PIE_E0);
>> DEFINE(PIE_E1_ASM, PIE_E1);
>>
>> Which will generate the asm-offsets.h header with PIE_E[0|1]_ASM with the
>> pre-calculated values that you can then use in proc.S?
>>
> 
> There is another issue, which is that mov_q tries to be smart, and
> emit fewer than 4 MOVZ/MOVK instructions if possible. So the .if
> directive evaluates the argument, which does not work with symbolic
> constants.

I'm not quite understanding the detail here; what do you mean by "symbolic
constants"? asm-offsets.h will provide something like:

#define PIE_E0_ASM 1234567890

The current code is using a hash-define and that's working fine:

mov_q	x0, PIE_E0


Won't the C preprocessor just substitute and everything will work out?

Thanks,
Ryan

> 
> I wouldn't mind just dropping that, i.e.,
> 
> --- a/arch/arm64/include/asm/assembler.h
> +++ b/arch/arm64/include/asm/assembler.h
> @@ -545,17 +545,9 @@ alternative_endif
>          *         magnitude and sign of the operand)
>          */
>         .macro  mov_q, reg, val
> -       .if (((\val) >> 31) == 0 || ((\val) >> 31) == 0x1ffffffff)
> -       movz    \reg, :abs_g1_s:\val
> -       .else
> -       .if (((\val) >> 47) == 0 || ((\val) >> 47) == 0x1ffff)
> -       movz    \reg, :abs_g2_s:\val
> -       .else
>         movz    \reg, :abs_g3:\val
>         movk    \reg, :abs_g2_nc:\val
> -       .endif
>         movk    \reg, :abs_g1_nc:\val
> -       .endif
>         movk    \reg, :abs_g0_nc:\val
>         .endm
> 
> Then, we can apply Ryan's trick to move these constants into
> asm-offsets.c, but you'll need to tweak the PTE_MAYBE macros as well:
> 
> --- a/arch/arm64/kernel/asm-offsets.c
> +++ b/arch/arm64/kernel/asm-offsets.c
> @@ -182,5 +182,22 @@ int main(void)
>  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
>    DEFINE(FTRACE_OPS_DIRECT_CALL,       offsetof(struct ftrace_ops,
> direct_call));
>  #endif
> +#undef PTE_MAYBE_NG
> +#define PTE_MAYBE_NG           0
> +
> +#undef PTE_MAYBE_SHARED
> +#define PTE_MAYBE_SHARED       0
> +
> +  DEFINE(PIE_E0_ASM, PIE_E0);
> +  DEFINE(PIE_E1_ASM, PIE_E1);
>    return 0;
>  }
> 
> (We should also move the comment from proc.S to asm-offsets.c but I
> omitted that here for brevity.)
> 
> Then you should be able to use PIE_En_ASM in mov_q instructions without issue.
> 
> Alternatively, if changing the implementation of mov_q creates any
> problems, we can just add a variant of that macro that lacks the
> conditional directives and always emits MOVZ/MOVK/MOVK/MOVK

