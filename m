Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 591D526B975
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 09:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751363598; cv=none; b=KjIIDU1IKnTB7MR+IOyDe3tFgVeEr/psnpnOMfLxZA/Q2WcGbnIDqTQN41HC/WwBc6394rMUArHUOilAufn4zq8pFNyQmpYE10Lw0uIco6Bg+RzKXotPdbfiiCmsOolaQKdDKeE0Zjg/lkgVsg18LYwlNX3XT1D0gacUXcaoKrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751363598; c=relaxed/simple;
	bh=2K/cmFR3SGCU8aPPRRpn7/taz9pWkTlPQf2T0cuoK0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WuzdUSl13kJDQ8gJsix0e0qpJ+sNHRWeF3eatJZo5rA8jPTLtJ+MDK+UnfJ4TrfpLhPsSlsMPURT+bRdz6Eyfa3tdoem11DuZtPOWwUSV8/0wjFsHb82XvwZEuFHn5E7IYKjVAEVPqHpKTU0VBMvgUzmcsppuULENY27pUINOH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D15D91595;
	Tue,  1 Jul 2025 02:52:58 -0700 (PDT)
Received: from [10.1.33.214] (XHFQ2J9959.cambridge.arm.com [10.1.33.214])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A49A3F58B;
	Tue,  1 Jul 2025 02:53:10 -0700 (PDT)
Message-ID: <a2165422-0d78-4549-bc34-a8bbcdb6513f@arm.com>
Date: Tue, 1 Jul 2025 10:53:08 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] mm: Optimize mprotect() by PTE-batching
Content-Language: en-GB
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, david@redhat.com,
 willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
 vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
 peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
 baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250628113435.46678-1-dev.jain@arm.com>
 <20250628113435.46678-4-dev.jain@arm.com>
 <0315c016-d707-42b9-8038-7a2d5e4387f6@lucifer.local>
 <ec2c3f60-43e9-47d9-9058-49d608845200@arm.com>
 <5900e978-6349-4a3d-a384-758889b678a0@lucifer.local>
 <3776ac82-4cd5-41e7-9b96-137a1ae6f473@arm.com>
 <64c2ec85-87ed-4793-b0e9-a68eac1a8020@lucifer.local>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <64c2ec85-87ed-4793-b0e9-a68eac1a8020@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/07/2025 09:51, Lorenzo Stoakes wrote:
> On Tue, Jul 01, 2025 at 09:30:51AM +0100, Ryan Roberts wrote:
>>>> In an ideal world we would flatten and just have mprotect_folio_pte_batch()
>>>> return the batch size considering all the relevant PTE bits AND the
>>>> AnonExclusive bit on the pages. IIRC one of Dev's earlier versions modified the
>>>> core folio_pte_batch() function to also look at the AnonExclusive bit, but I
>>>> really disliked changing that core function (I think others did too?).
>>>
>>> Yeah let's not change the core function.
>>>
>>> My suggestion is to have mprotect_folio_pte_batch() do this.
>>>
>>>>
>>>> So barring that approach, we are really only left with the batch and sub-batch
>>>> approach - although, yes, it could be abstracted more. We could maintain a
>>>> context struct that persists across all calls to mprotect_folio_pte_batch() and
>>>> it can use that to keep it's state to remember if we are in the middle of a
>>>> sub-batch and decide either to call folio_pte_batch() to get a new batch, or
>>>> call anon_exclusive_batch() to get the next sub-batch within the current batch.
>>>> But that started to feel overly abstracted to me.
>>>
>>> Having this nested batch/sub-batch loop really feels worse. You just get lost in
>>> the complexity here very easily.
>>>
>>> But i"m also not sure we need to maintain _that_ much state?
>>>
>>> We're already looping over all of the PTEs here, so abstracting _the entire
>>> loop_ and all the sub-batch stuff to another function, that is
>>> mprotect_folio_pte_batch() I think sensibly, so it handles this for you makes a
>>> ton of sense.
>>
>> So effectively turn mprotect_folio_pte_batch() into an iterator; have a struct
>> and a funtion to init the struct for the the number of ptes we want to iterate
>> over, then a per iteration function that progressively returns batches?
> 
> Is that really necessary though?
> 
> Idea is that mprotect_folio_pte_batch() returns the nr_ptes _taking into account
> the PAE stuff_.

The issue is the efficiency. Assuming we want to keep the PTE scan contained
within the core folio_pte_batch() function and we _don't_ want to add PAE
awareness to that function, then we have 2 separate, independent loops; one for
PTE scanning and the other for PAE scanning. If the first loop scans through ans
returns 512, but then the PAE scan returns 1, we return 1. If we don't remember
for the next time that we already determined we have a PTE batch of 512 (now
511) then we will rescan the 511 PTEs and potentially return 1 again due to PAE.
Then 510, then 509...

That feels inefficient to me. So I'd much rather just remember that we have a
batch of 512, then split into sub batches as needed for PAE compliance. Then we
only scan each PTE once and each struct page once.

But to achieve this, we either need to merge the 2 loops or we need to carry
state across function calls (i.e. like an iterator).

> 
> Would this break anything?

It's not about breaking anything, it's about scanning efficiently. Perhaps you
don't think it's worth worrying about in practice?

> 
> We might need to pass a flag to say 'don't account for this' for prot numa case.

Yep, another bool ;-)

> 
>>
>> Then we just have a simple loop here that gets the next batch and processes it?

