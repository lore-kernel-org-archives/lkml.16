Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E44EA1C8634
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744710412; cv=none; b=oBS9CSHOlUOGq3Znyg/ZzV85RxtOXMps4ixNUu1V8SXP3DDlDyta2M8Oo3+UHBP+VXIQutSM1TO9zPajRSyqT4riPKa0861vPAK5bUzlCVwXP1lXkxP0UpZiqNCNE9ccwWViskAtZ0DdnLq8FLFYQJ1mIjorCHX1Iqworimv9Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744710412; c=relaxed/simple;
	bh=rqh/DaUKRnw5gv/qg0/Wan5Kp7ybiw4Zrvl6VIv/tqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cAy83YQKaCNUUN3qOUWAwiYLktyV8AtQNIdqR6XFDhxCX/xVvHLVTdJVIfuam56PyjsGDwoqcjLasbs3Wi15gOvwJHd4Ba8zOSdU9EaBme9oTpsR/Lsf3LkPWw64e58f8WKlyDHjSEYeFsG4QEXGNeNEu+3nPwOzi+rBj/5zyjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 349521595;
	Tue, 15 Apr 2025 02:46:47 -0700 (PDT)
Received: from [10.163.49.226] (unknown [10.163.49.226])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 07CD93F66E;
	Tue, 15 Apr 2025 02:46:46 -0700 (PDT)
Message-ID: <fb411be7-b8e8-493f-ae79-90adb8bb79fd@arm.com>
Date: Tue, 15 Apr 2025 15:16:44 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: Re-organise setting up FEAT_S1PIE registers
 PIRE0_EL1 and PIR_EL1
To: Ryan Roberts <ryan.roberts@arm.com>, Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
References: <20250410074024.1545768-1-anshuman.khandual@arm.com>
 <6e6305fd-3b93-43ec-8114-e81b2926adfc@arm.com>
 <CAMj1kXG5R1jVWLQ-XEcqF9U365T18pTW8u3DgC7OY4N53hchOA@mail.gmail.com>
 <16602b97-2f49-4612-9e9a-d6d0ed964fd3@arm.com>
 <CAMj1kXEnmpu3Dc5zZz1aQJGVwEFwx=JdYisSFkDNjUJ44FjX9Q@mail.gmail.com>
 <5d975762-7678-419f-8e2f-40547c079276@arm.com>
 <0eabad93-26ef-4452-bd89-17c153f483f3@arm.com>
 <7b26c6e4-5483-4ac3-a084-bb0769768006@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <7b26c6e4-5483-4ac3-a084-bb0769768006@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/15/25 13:23, Ryan Roberts wrote:
> On 15/04/2025 07:27, Anshuman Khandual wrote:
>>
>>
>> On 4/14/25 18:01, Ryan Roberts wrote:
>>> On 14/04/2025 13:28, Ard Biesheuvel wrote:
>>>> On Mon, 14 Apr 2025 at 14:04, Ryan Roberts <ryan.roberts@arm.com> wrote:
>>>>>
>>>>> On 14/04/2025 10:41, Ard Biesheuvel wrote:
>>>>>> On Mon, 14 Apr 2025 at 09:52, Ryan Roberts <ryan.roberts@arm.com> wrote:
>>>>>>>
>>>>>>> On 10/04/2025 08:40, Anshuman Khandual wrote:
>>>>>>>> mov_q cannot really move PIE_E[0|1] macros into a general purpose register
>>>>>>>> as expected if those macro constants contain some 128 bit layout elements,
>>>>>>>> required for D128 page tables. Fix this problem via first loading up these
>>>>>>>> macro constants into a given memory location and then subsequently setting
>>>>>>>> up registers PIRE0_EL1 and PIR_EL1 by retrieving the memory stored values.
>>>>>>>
>>>>>>> From memory, the primary issue is that for D128, PIE_E[0|1] are defined in terms
>>>>>>> of 128-bit types with shifting and masking, which the assembler can't do? It
>>>>>>> would be good to spell this out.
>>>>>>>
>>>>>>>>
>>>>>>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>>>>>>> Cc: Will Deacon <will@kernel.org>
>>>>>>>> Cc: Mark Rutland <mark.rutland@arm.com>
>>>>>>>> Cc: Ard Biesheuvel <ardb@kernel.org>
>>>>>>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>>>>>>> Cc: linux-arm-kernel@lists.infradead.org
>>>>>>>> Cc: linux-kernel@vger.kernel.org
>>>>>>>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>>>>>>>> ---
>>>>>>>> This patch applies on v6.15-rc1
>>>>>>>>
>>>>>>>>  arch/arm64/kernel/head.S         | 3 +++
>>>>>>>>  arch/arm64/kernel/pi/map_range.c | 6 ++++++
>>>>>>>>  arch/arm64/kernel/pi/pi.h        | 1 +
>>>>>>>>  arch/arm64/mm/mmu.c              | 1 +
>>>>>>>>  arch/arm64/mm/proc.S             | 5 +++--
>>>>>>>>  5 files changed, 14 insertions(+), 2 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
>>>>>>>> index 2ce73525de2c..4950d9cc638a 100644
>>>>>>>> --- a/arch/arm64/kernel/head.S
>>>>>>>> +++ b/arch/arm64/kernel/head.S
>>>>>>>> @@ -126,6 +126,9 @@ SYM_CODE_START(primary_entry)
>>>>>>>>        * On return, the CPU will be ready for the MMU to be turned on and
>>>>>>>>        * the TCR will have been set.
>>>>>>>>        */
>>>>>>>> +     adr_l   x0, pir_data
>>>>>>>> +     bl      __pi_load_pir_data
>>>>>>>
>>>>>>> Using C code to pre-calculate the values into global variables that the assembly
>>>>>>> code then loads and stuffs into the PIR registers feels hacky. I wonder if we
>>>>>>> can instead pre-calculate into asm-offsets.h? e.g. add the following to
>>>>>>> asm-offsets.c:
>>>>>>>
>>>>>>> DEFINE(PIE_E0_ASM, PIE_E0);
>>>>>>> DEFINE(PIE_E1_ASM, PIE_E1);
>>>>>>>
>>>>>>> Which will generate the asm-offsets.h header with PIE_E[0|1]_ASM with the
>>>>>>> pre-calculated values that you can then use in proc.S?
>>>>>>>
>>>>>>
>>>>>> There is another issue, which is that mov_q tries to be smart, and
>>>>>> emit fewer than 4 MOVZ/MOVK instructions if possible. So the .if
>>>>>> directive evaluates the argument, which does not work with symbolic
>>>>>> constants.
>>>>>
>>>>> I'm not quite understanding the detail here; what do you mean by "symbolic
>>>>> constants"? asm-offsets.h will provide something like:
>>>>>
>>>>> #define PIE_E0_ASM 1234567890
>>>>>
>>>>> The current code is using a hash-define and that's working fine:
>>>>>
>>>>> mov_q   x0, PIE_E0
>>>>>
>>>>>
>>>>> Won't the C preprocessor just substitute and everything will work out?
>>>>>
>>>>
>>>> Yeah, you're right. I was experimenting with something like
>>>>
>>>> .set .Lpie_e0, PIE_E0_ASM
>>>> mov_q xN, .Lpie_e0
>>>>
>>>> where this problem does exist, but we can just use PIE_E0_ASM directly
>>>> and things should work as expected.
>>>
>>> Ahh great, sounds like this should be pretty simple then!
>>
>> Following change works both on current and with D128 page tables.
>>
>> --- a/arch/arm64/kernel/asm-offsets.c
>> +++ b/arch/arm64/kernel/asm-offsets.c
>> @@ -182,5 +182,7 @@ int main(void)
>>  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
>>    DEFINE(FTRACE_OPS_DIRECT_CALL,       offsetof(struct ftrace_ops, direct_call));
>>  #endif
>> +  DEFINE(PIE_E0_ASM, PIE_E0);
>> +  DEFINE(PIE_E1_ASM, PIE_E1);
>>    return 0;
>>  }
>> diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
>> index 737c99d79833..f45494425d09 100644
>> --- a/arch/arm64/mm/proc.S
>> +++ b/arch/arm64/mm/proc.S
>> @@ -536,9 +536,9 @@ alternative_else_nop_endif
>>  #define PTE_MAYBE_NG           0
>>  #define PTE_MAYBE_SHARED       0
> 
> I think at minimum, you can remove this PTE_MAYBE_* hack from proc.S. But as Ard
> says, you may need to add it to asm-offsets.c? I'm surprised asm-offsets.c even

Moving PTE_MAYBE_* inside asm-offsets.c works as well in both cases
but still wondering why this is even required ? What am I missing ?

> compiles without this hack since surely it doesn't have arm64_use_ng_mappings or
> is_realm_world() available?
Did not face any problem with defconfig for the mainline kernel and
both these symbols were visible in the built code.

> 
> Thanks,
> Ryan
> 
>>  
>> -       mov_q   x0, PIE_E0
>> +       mov_q   x0, PIE_E0_ASM
>>         msr     REG_PIRE0_EL1, x0
>> -       mov_q   x0, PIE_E1
>> +       mov_q   x0, PIE_E1_ASM
>>         msr     REG_PIR_EL1, x0
>>  
>>  #undef PTE_MAYBE_NG
>>
> 
