Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B7D3280A47
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 13:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746537317; cv=none; b=PH3/7gTD5K2ZJLb9Avlsjb6fs4pF/JKu/HQFI3sYCXPBRXAPx+vucSk3qA6OL4hG6U0PwMhcIwQGCcRTPhcClRht3qkoKhGjHI+6xBz/Bhbli05xVz8uxFQIsqAKQqoljdnvaKTJATMFv9jsbDnvTJfCaNmltKg0kPZyLiS3eDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746537317; c=relaxed/simple;
	bh=UMo6RY8HNHw1pbMNydqNCVM/sSb3xqcPS2PR6p09QcM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fxfU8ptc60uqQmBMLcGwnRJa22+KA2sVfWyfoIlEnKlVwTZt82hnp8+BvFvz1vrFrkyg5NJ9QukGJgsJSMf2JJ4QyNr3umduIm587V4539RtzUM7FUZB1TBy6xrQ4MJqmBNDnYP2g7Ef1nNY0rJFG7z2EEXy+OVk4cSZnNti1u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E31BE113E;
	Tue,  6 May 2025 06:15:03 -0700 (PDT)
Received: from [10.1.39.190] (e137867.arm.com [10.1.39.190])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09FFF3F5A1;
	Tue,  6 May 2025 06:15:11 -0700 (PDT)
Message-ID: <566f9bba-6cc9-490c-aacc-9edd0ae441a0@arm.com>
Date: Tue, 6 May 2025 14:15:10 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/debug: Drop redundant DBG_MDSCR_* macros
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Ada Couprie Diaz <ada.coupriediaz@arm.com>
References: <20250417105253.3188976-1-anshuman.khandual@arm.com>
 <0be8e3be-a029-4eea-a79c-310b8e0a05c3@arm.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <0be8e3be-a029-4eea-a79c-310b8e0a05c3@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

+ linux-arm-kernel@lists.infradead.org

I forgot to fix the typo for the linux-arm-kernel mailing list while 
replying-all to the original patch, adding it back.

Apologies.

On 06/05/2025 14:10, Ada Couprie Diaz wrote:
> Hi Anshuman,
>
> On 17/04/2025 11:52, Anshuman Khandual wrote:
>> MDSCR_EL1 has already been defined in tools sysreg format and hence 
>> can be
>> used in all debug monitor related call paths. Subsequently all 
>> DBG_MDSCR_*
>> macros become redundant and hence can be dropped off completely. 
>> While here
>> convert all variables handling MDSCR_EL1 register as u64 which 
>> reflects its
>> true width as well.
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>
> I think the changes make sense, even more so given that `kvm/debug.c` 
> already uses the sysreg format definition for MDSCR_EL1.
>
> It looks good to me, but I think there is a missing conversion to 64 
> bits below.
> Would it make sense to convert the two instances of MDSCR_EL1 used in 
> `tools/testing/selftests/kvm/arm64/debug-exceptions.c`, in 
> `enable_monitor_debug_exceptions()` and `install_ss()` , to 64 bits as 
> well ? (They don't rely on `DBG_MDSCR_*`, the test defines its own 
> macros)
>
>> diff --git a/arch/arm64/kernel/entry-common.c 
>> b/arch/arm64/kernel/entry-common.c
>> index b260ddc4d3e9..6dbfc1008007 100644
>> --- a/arch/arm64/kernel/entry-common.c
>> +++ b/arch/arm64/kernel/entry-common.c
>> @@ -354,7 +354,7 @@ static void 
>> cortex_a76_erratum_1463225_svc_handler(void)
>>         __this_cpu_write(__in_cortex_a76_erratum_1463225_wa, 1);
>>       reg = read_sysreg(mdscr_el1);
>> -    val = reg | DBG_MDSCR_SS | DBG_MDSCR_KDE;
>> +    val = reg | MDSCR_EL1_SS | MDSCR_EL1_KDE;
>>       write_sysreg(val, mdscr_el1);
>>       asm volatile("msr daifclr, #8");
>>       isb();
>
> Given the change of width to 64 bits elsewhere, shouldn't we change 
> val and reg to u64 here as well ?
>
> diff --git a/arch/arm64/kernel/entry-common.c 
> b/arch/arm64/kernel/entry-common.c
> index 73cf6a5f41d8..d61a5ddf53d6 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -344,7 +344,7 @@ static DEFINE_PER_CPU(int, 
> __in_cortex_a76_erratum_1463225_wa);
>
>  static void cortex_a76_erratum_1463225_svc_handler(void)
>  {
> -    u32 reg, val;
> +    u64 reg, val;
>
>      if (!unlikely(test_thread_flag(TIF_SINGLESTEP)))
>          return;
>
> Thanks,
> Ada
>
