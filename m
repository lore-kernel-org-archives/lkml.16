Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A119542AA3
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 04:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746591443; cv=none; b=L8vwgPTJB8DPjKa//0TIou8BoV1EVHhBp3nJs4e7VqNkoQ13ro3fV5QfBjwx9wbRnwLTzsftxXai4YKakGD8Rcn3bavso6n9o+gzB7CVdOCZYXLWpSDxX5hdyOmRKtAmlpWow6QXP7gdaOdoWBu5j7/MQ6Nd1KM55zChtt4uOM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746591443; c=relaxed/simple;
	bh=mBOUIX3npKUWoyFIC+dxW15Egv6+lPmsSnbkonkZouc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q/9mg5pldQbjZlzo2yqu2DRsoo4HllNdOWBgiijVHF4ZKRj17YR+O8DMoeKkp7LPO0tTeaF6Zp77cSCFcueGeLoLXZeuB6qNQ1lcNbNlGGyUHyuA/8/i/j8McqmRUFN4DQUgR5cfiMDh8x+fCjgg0ALcYtNyY+E8YEJaz8qkKow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 906CD2F;
	Tue,  6 May 2025 21:17:04 -0700 (PDT)
Received: from [192.168.0.12] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8501A3F5A1;
	Tue,  6 May 2025 21:17:12 -0700 (PDT)
Message-ID: <d08adb1c-6db5-45d1-9eb7-dce19bc7158e@arm.com>
Date: Wed, 7 May 2025 09:47:09 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/debug: Drop redundant DBG_MDSCR_* macros
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250417105253.3188976-1-anshuman.khandual@arm.com>
 <0be8e3be-a029-4eea-a79c-310b8e0a05c3@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <0be8e3be-a029-4eea-a79c-310b8e0a05c3@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/6/25 18:40, Ada Couprie Diaz wrote:
> Hi Anshuman,
> 
> On 17/04/2025 11:52, Anshuman Khandual wrote:
>> MDSCR_EL1 has already been defined in tools sysreg format and hence can be
>> used in all debug monitor related call paths. Subsequently all DBG_MDSCR_*
>> macros become redundant and hence can be dropped off completely. While here
>> convert all variables handling MDSCR_EL1 register as u64 which reflects its
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
> I think the changes make sense, even more so given that `kvm/debug.c` already uses the sysreg format definition for MDSCR_EL1.

> 
> It looks good to me, but I think there is a missing conversion to 64 bits below.
> Would it make sense to convert the two instances of MDSCR_EL1 used in `tools/testing/selftests/kvm/arm64/debug-exceptions.c`, in `enable_monitor_debug_exceptions()` and `install_ss()` , to 64 bits as well ? (They don't rely on `DBG_MDSCR_*`, the test defines its own macros)

Sure, will do the necessary changes.

> 
>> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
>> index b260ddc4d3e9..6dbfc1008007 100644
>> --- a/arch/arm64/kernel/entry-common.c
>> +++ b/arch/arm64/kernel/entry-common.c
>> @@ -354,7 +354,7 @@ static void cortex_a76_erratum_1463225_svc_handler(void)
>>         __this_cpu_write(__in_cortex_a76_erratum_1463225_wa, 1);
>>       reg = read_sysreg(mdscr_el1);
>> -    val = reg | DBG_MDSCR_SS | DBG_MDSCR_KDE;
>> +    val = reg | MDSCR_EL1_SS | MDSCR_EL1_KDE;
>>       write_sysreg(val, mdscr_el1);
>>       asm volatile("msr daifclr, #8");
>>       isb();
> 
> Given the change of width to 64 bits elsewhere, shouldn't we change val and reg to u64 here as well ?

Sure, will fold this in as well.
> 
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index 73cf6a5f41d8..d61a5ddf53d6 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -344,7 +344,7 @@ static DEFINE_PER_CPU(int, __in_cortex_a76_erratum_1463225_wa);
>  
>  static void cortex_a76_erratum_1463225_svc_handler(void)
>  {
> -    u32 reg, val;
> +    u64 reg, val;
>  
>      if (!unlikely(test_thread_flag(TIF_SINGLESTEP)))
>          return;

Thanks for your review.
