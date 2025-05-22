Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCA0D241693
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747900292; cv=none; b=cXk3KPh5r7kW+M19teXKUhSbF7Pi5DMG4sjYWrrNgjlPmmo+37erCTdJthCeG8SrtpSbJgxNEfcavQV6OJ/3uQAa8CUa2bcXhYm0rPjuS5HLxr3avLCIZOyH5fPTlPWdpNXzD8cCGmHHiL4lZBDd7d2Wqq/LMOz6poH6HR5ivJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747900292; c=relaxed/simple;
	bh=5Er2Se0J/OYgKRlrGNVO3MlntzBG01vQWKegNQrLvfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gcjfu4Y5s4rl70eQEcP9Pp2L64Oo3JWGSs/v8EpBOEjQMZOKwVMxbswUkjHD4FdTdbQBhr5jGouyLN5ec+EoFSD6tgDhyimVbpMcw7DjBZQG/UEPIQLE/MKMwoupC5hfln3EKwpVVk2xG263KdI9OhDuouVAznPzpBLbGzsyEDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78BDE1A2D;
	Thu, 22 May 2025 00:51:15 -0700 (PDT)
Received: from [10.57.94.227] (unknown [10.57.94.227])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE2BD3F673;
	Thu, 22 May 2025 00:51:25 -0700 (PDT)
Message-ID: <1ab00224-cca4-4442-a346-eb8a6797e09e@arm.com>
Date: Thu, 22 May 2025 08:51:24 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] mm: Add batched versions of
 ptep_modify_prot_start/commit
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: david@redhat.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, anshuman.khandual@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, ioworker0@gmail.com, baohua@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250519074824.42909-1-dev.jain@arm.com>
 <20250519074824.42909-3-dev.jain@arm.com>
 <59242559-5e90-4422-82f7-179a44eb968a@arm.com>
 <7a1ae902-d97c-41ae-a3e7-5b6258ced1c5@arm.com>
 <fc219152-f771-41b0-8857-42de5e6dd35e@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <fc219152-f771-41b0-8857-42de5e6dd35e@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/05/2025 07:33, Dev Jain wrote:
> 
> On 21/05/25 5:15 pm, Ryan Roberts wrote:
>> On 21/05/2025 12:16, Ryan Roberts wrote:
>>> On 19/05/2025 08:48, Dev Jain wrote:
>>>> Batch ptep_modify_prot_start/commit in preparation for optimizing mprotect.
>>>> Architecture can override these helpers; in case not, they are implemented
>>>> as a simple loop over the corresponding single pte helpers.
>>>>
>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> [...]
>>
>>> I have some general concerns about the correctness of batching these functions.
>>> The support was originally added by Commit 1ea0704e0da6 ("mm: add a
>>> ptep_modify_prot transaction abstraction"), and the intent was to make it easier
>>> to defer the pte updates for XEN on x86.
>>>
>>> Your default implementations of the batched versions will match the number of
>>> ptep_modify_prot_start() calls with the same number of ptep_modify_prot_commit()
>>> calls, even if modify_prot_commit_ptes() is called incrementally for sub-batches
>>> of the batch used for modify_prot_start_ptes(). That's a requirement and you've
>>> met it. But in the batched case, there are 2 differences;
>>>
>>>    - You can now have multiple PTEs within a start-commit block at one time. I
>>> hope none of the specialized implementations care about that (i.e. XEN).
>> I had a look; this isn't a problem.
>>
>>>    - when calling ptep_modify_prot_commit(), old_pte may not be exactly what
>>> ptep_modify_prot_start() returned for that pte. You have collected the A/D bits,
>>> and according to your docs "PTE bits in the PTE range besides the PFN can
>>> differ" when calling modify_prot_start_ptes() so R/W and other things could
>>> differ here.
>> It looks like powerpc will break if you provide old_pte which has different
>> permissions to the "real" old_pte, see radix__ptep_modify_prot_commit(). So I
>> think you need to at least spec modify_prot_start_ptes() to require that all
>> bits of the PTE except the PFN, access and dirty are identical. And perhaps you
>> can VM_WARN if found to be otherwise? And perhaps modify
>> ptep_modify_prot_commit()'s documentation to explcitly allow old_pte's
>> access/dirty to be "upgraded" from what was actually read in
>> ptep_modify_prot_start()?
> 
> 
> Got it, so we just need to document that, the permissions for all ptes must be
> identical

Not just permissions; all bits (inc SW bits) except PFN and A/D.

> 
> when using modify_prot_start_ptes(). And that we may be smearing extra a/d bits in
> 
> modify_prot_commit_ptes().
> 
> 
>>
>> XEN/x86 and arm64 don't care about old_pte.
>>
>> Thanks,
>> Ryan
>>
>>> I'm not sure if these are problems in practice; they probably are not. But have
>>> you checked the XEN implementation (and any other specialized implementations)
>>> are definitely compatible with your batched semantics?
>>>

