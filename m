Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93BBE2749C9
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 10:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749637912; cv=none; b=V6wM41Rcq5mJwpds4z//fEdK6A5wXHdyJkn/+qfzTQ2mK93dmsiGzu2Ip8KGaye58PBRWjgib/vx40Dl7C0khTpkD02qnkzNJpIHKE8DZ+DRPgs9keqAG2h8hIhjWa/VHapvl3nhdV9IO6ETInZi5cEdEJ1R7nGgNZOe427tvg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749637912; c=relaxed/simple;
	bh=NurDmQcFY2qdtvA6zliu4v+3Zwrf1QLQZtUjK022rR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NNji0nGn37N2J3JObLkv8xRAHpUmeh+2VMwI37UFX8NteZqlHvOobT7ytQPbqmFgcZTt6CalxANk9F2EBApv+tCj5zRCvAf7AUQMzIPD9CskzCBjp+7AJLVnboJJvtNNtYpKeumMcJySCC/G4sZuWWCE1vnk7vcqTtYVTUbaKBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68EBF1BC0;
	Wed, 11 Jun 2025 03:31:30 -0700 (PDT)
Received: from [10.164.146.17] (J09HK2D2RT.blr.arm.com [10.164.146.17])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EBD423F673;
	Wed, 11 Jun 2025 03:31:47 -0700 (PDT)
Message-ID: <aa2fa283-528c-4658-9bd3-7092eac7a442@arm.com>
Date: Wed, 11 Jun 2025 16:01:44 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/2] arm64/debug: Drop redundant DBG_MDSCR_* macros
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ada Couprie Diaz <ada.coupriediaz@arm.com>, linux-kernel@vger.kernel.org
References: <20250610053128.4118784-1-anshuman.khandual@arm.com>
 <20250610053128.4118784-2-anshuman.khandual@arm.com>
 <aEhnzsXHfilVhJ1s@J2N7QTR9R3> <68d762d4-a755-4ede-976b-0616bf3aab28@arm.com>
 <aElRi0Usn8dH6O4m@J2N7QTR9R3>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <aElRi0Usn8dH6O4m@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/06/25 3:25 PM, Mark Rutland wrote:
> On Wed, Jun 11, 2025 at 09:10:45AM +0530, Anshuman Khandual wrote:
>>
>>
>> On 10/06/25 10:43 PM, Mark Rutland wrote:
>>> On Tue, Jun 10, 2025 at 11:01:27AM +0530, Anshuman Khandual wrote:
>>>> MDSCR_EL1 has already been defined in tools sysreg format and hence can be
>>>> used in all debug monitor related call paths. Subsequently all DBG_MDSCR_*
>>>> macros become redundant and hence can be dropped off completely. While here
>>>> convert all variables handling MDSCR_EL1 register as u64 which reflects its
>>>> true width as well.
>>>
>>> I think that for now it'd be best to *only* change over to the
>>> generated MDSCR_EL1_* defintions, and leave the register sizes as-is.
>>
>> I had tried doing that originally but without changing mdscr register size,
>> there is a build warning because MDSCR_EL1_MDE is defined as GENMASK(15, 15)
>> which is represented as 'long unsigned int'.
>>
>> #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
>>
>> arch/arm64/kernel/debug-monitors.c: In function ‘disable_debug_monitors’:
>> arch/arm64/kernel/debug-monitors.c:108:13: warning: conversion from ‘long unsigned int’ to ‘u32’ {aka ‘unsigned int’} changes value from ‘18446744073709518847’ to ‘4294934527’ [-Woverflow]
>>   108 |   disable = ~MDSCR_EL1_MDE;
>>       |             ^
> 
> Please mention that in the commit message. As-is, the commit message has
> no rationale for changing to u64.

Sure, agreed. I had missed that, it was my bad.> 
> More generally, if you need to make a change to avoid a compiler
> warning, please describe that as part of the rationale.
Makes sense, will do.

> 
>> MDSCR_EL1 is a 64 bit system register as per ARM DDI 0487 L.A (D24.3.20).
>> Representing it as u32 does not seem right irrespective of whether the
>> extended break point support is enabled or not. Besides even arm64 kvm
>> uses u64 for mdscr register.
> 
> Sure, but that wasn't my complaint.
> 
> My complaint was that it was a logically unrelated change, because you
> had provided no rationale as for why it was necessary to change to u64
> as a conseqeunce of changing to the generated MDSCR_EL1_* definitions.
> 
> Please also note that *almost all* system registers have the
> "${REGISTER} is a 64-bit register wording", including things like DAIF,
> SPSel, etc. It's necessary to consider the context of use.

Understood.

I will add a rationale in the commit message for the u64 changes along
with changes related to the generated MDSCR_EL1_* definitions and then
re-spin the series. Thanks for your review.

> 
> Mark.


