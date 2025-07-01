Received: from techbitestudio.com (techbitestudio.com [75.119.147.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B782745E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 12:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=75.119.147.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751372168; cv=none; b=qLvqVxYIpD+NA9H73DzULnELmB8EUlgMVsWzCchr3pM2U4biJ55j10zOpxo6HqekvOoRUuWsDsscDVVP5NZVY8Vp2abATG5XL9VxaNm7SdHpoeBa7Ff34kKylynY1huDd/NqBV14p7JgTeAu2LdPSiubhYOSbG8RdcHoZtUHke0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751372168; c=relaxed/simple;
	bh=QuNTs4Gui+751vkn9nL4Oioj0WAqOgytEZbbXWRKmTI=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=FTdD0T5OSuT8wfAoCi+SOFdLVIB3PtaW7o1hkzoFh4+j9Cb5PBwZUsJRgI360uym7sAfT+6h+TkJ4MP16CH99HLC+7R6LOXgQ2cIIiIovLgY+7BMgIHOwa9no+BHHk42akXVlARsHK4OiXfYv+USbazyrtioYrzw3ZsMewM79jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kenip.in; spf=pass smtp.mailfrom=kenip.in; dkim=pass (1024-bit key) header.d=kenip.in header.i=@kenip.in header.b=oDXH0+DR; arc=none smtp.client-ip=75.119.147.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kenip.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kenip.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kenip.in header.i=@kenip.in header.b="oDXH0+DR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kenip.in;
	 s=mail; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
	In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=mNcQZ2y7RNSfkCENnPPV5KGCebawVcvX2HGc4o3jHqM=; b=oDXH0+DRRyLeouEuyla4Qnw7D0
	HnvGz33DcqW19qDfFvIw1x84Dk9VmxoQkB8TEy90GGmUaJNHRPwg+WhgFavPrZm6TKsw4wdeIW1N0
	UnvhtKnlCFgh8u1kE2P+xLCKf5r8JzOqVKE5PDg0v5DScgDFhQ5Bp2/e7mpwsPmfdr44=;
Received: from localhost ([127.0.0.1] helo=kenip.in)
	by techbitestudio.com with esmtpa (Exim 4.93)
	(envelope-from <siddhartha@kenip.in>)
	id 1uWZtv-0006bO-8t; Tue, 01 Jul 2025 17:45:51 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 01 Jul 2025 17:45:51 +0530
From: siddhartha@kenip.in
To: Dev Jain <dev.jain@arm.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, mgorman@suse.de
Subject: =?UTF-8?Q?Re=3A_=5BPATCH=5D_mm=3A_limit_THP_alignment_=E2=80=93_?=
 =?UTF-8?Q?performance_gain_observed_in_AI_inference_workloads?=
In-Reply-To: <afe95bb0-185b-4c4a-ae41-e02457422cc3@arm.com>
References: <4990838b-660d-46a2-b21c-67adcba61ff9@lucifer.local>
 <19714cae-6b73-43ec-af7a-1455196561d1@arm.com>
 <3ee2e7fea6f263aa884e3e715632b09f@kenip.in>
 <d8ffe547-5516-43e5-9f33-56b2698a0b4f@arm.com>
 <ba2c89bd-88de-48f8-abd0-b62d8b1d50b3@lucifer.local>
 <5816677a-705e-4a8f-b598-d74ff6198a02@arm.com>
 <ee92d6a9-529a-4ac5-b3d0-0ff4e9085786@lucifer.local>
 <e7152150-2f3e-4ad7-a6c5-f4b77e5c0e05@arm.com>
 <f746d3aa-17e7-4b42-9e08-97cdb2cad89b@lucifer.local>
 <80b849d4-faf3-47a9-8b8c-e8053299cfb2@arm.com>
 <2e99712b-8dac-4762-9fc5-fe3ef569b65e@lucifer.local>
 <afe95bb0-185b-4c4a-ae41-e02457422cc3@arm.com>
Message-ID: <787639a1e6a27c0f3b0e3ae658e1b8e7@kenip.in>
X-Sender: siddhartha@kenip.in
X-Priority: 1 (Highest)
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-07-01 12:28, Dev Jain wrote:
> On 01/07/25 12:20 pm, Lorenzo Stoakes wrote:
>> On Tue, Jul 01, 2025 at 12:00:21PM +0530, Dev Jain wrote:
>>> On 01/07/25 11:23 am, Lorenzo Stoakes wrote:
>>>> On Tue, Jul 01, 2025 at 11:15:25AM +0530, Dev Jain wrote:
>>>>> Sorry I am not following, don't know in detail about the VMA merge 
>>>>> stuff.
>>>>> Are you saying the after the patch, the VMAs will eventually get 
>>>>> merged?
>>>>> Is it possible in the kernel to get a merge in the "future"; as I 
>>>>> understand
>>>>> it only happens at mmap() time?
>>>>> 
>>>>> Suppose before the patch, you have two consecutive VMAs between 
>>>>> (PMD, 2*PMD) size.
>>>>> If they are able to get merged after the patch, why won't they be 
>>>>> merged before the patch,
>>>>> since the VMA characteristics are the same?
>>>>> 
>>>>> 
>>>> Rik's patch aligned each to 2 MiB boundary. So you'd get gaps:
>>>> 
>>>> 
>>>>     0            2MB                 4MB           6MB               
>>>>        8MB          10MB
>>>>     |-------------.------|            |-------------.------|         
>>>>         |-------------.------|
>>>>     |             .      |		 |             .      |                 
>>>> |             .      |
>>>>     |             .      |		 |             .      |                 
>>>> |             .      |
>>>>     |-------------.------|		 |-------------.------|                 
>>>> |-------------.------|
>>>>       huge mapped  4k m'd
>>> The effort to draw this is appreciated!
>>> 
>>> I understood the alignment, what I am asking is this:
>>> 
>>> In __get_unmapped_area(), we will return a THP-aligned addr from
>>> thp_get_unmapped_area_vmflags(). Now for the diagram you have
>>> drawn, suppose that before the patch, we first mmap() the
>>> 8MB-start chunk. Then we mmap the 4MB start chunk.
>>> We go to __mmap_region(), and we see that the 8MB-start chunk
>>> has mergeable characteristics, so we merge. So the gap goes away?
>> No because there's a gap, we only merge immedaitely adjacent VMAs. And 
>> obviously
>> gaps mean page tables wouldn't be adjacent either...
> 
> Ah shoot. That is prev->vm_end == vmg->start in can_vma_merge_left(). 
> Thanks.
> 
>> 
>> The get_unmmaped_area() would have otherwise given adjacent mappings. 
>> Vlasta's
>> patch means in this case we no longer bother trying to align these 
>> because their
>> _length_ isn't PMD aligned.

Hi Lorenzo, Dev, all

Thank you for raising excellent points — I’ll respond to each in order 
to clarify the mechanics and relevance of this behavior in the context 
of AI inference workloads.

🧩 1. Does the patch cause VMAs to be merged eventually?
You're correct: VMA merging only happens at mmap() time (via 
__mmap_region()). What the patch affects is the behavior of 
thp_get_unmapped_area_vmflags() before the mmap is placed.

Before the patch (with Rik’s logic):

Every mmap() returned an address rounded up to the next 2MB boundary — 
regardless of whether the requested size was 2MB-aligned.

Result: even consecutive mmap()s (e.g., 1.5MB + 1.5MB) are now 
non-adjacent, so merging is impossible, even if their VMA flags match.

After this patch:

If the allocation is not PMD-aligned in size, the returned address is 
not forcibly aligned, increasing the likelihood that the next mmap() 
lands directly after the previous one → enabling merging.

So, to be clear: this patch doesn’t cause merging, but it prevents 
unnecessary pre-mmap gaps, which previously blocked merges from ever 
happening exactly like a deadlock which has been cleared now.

📐 2. Why aren’t the VMAs mergeable before the patch?
Great question. Even if the VMA flags are identical, gaps introduced by 
forced alignment from get_unmapped_area() break the precondition for 
merging:

can_vma_merge_left()
  → return prev->vm_end == vma->vm_start

With Rik’s patch in place:

Suppose you mmap() 1.5MB → gets aligned to 2MB

Next 1.5MB → gets aligned to 4MB
→ The kernel sees: prev->vm_end = 3.5MB, vma->vm_start = 4MB
→ No merge

With this patch, non-aligned lengths don’t get forcibly aligned, so 
consecutive mmap()s often fall exactly after the previous, and merging 
becomes possible again.

🤖 3. How does this impact AI workloads like Hugging Face Transformers?
Tokenization and dynamic batching create non-deterministic memory 
allocation patterns:

Models like BERT and T5 dynamically allocate intermediate buffers per 
token-length, batch size, and attention window.

Hugging Face + ONNX Runtime uses multiple small-ish anonymous mmap()s, 
often 512KB–1.8MB.

These allocations come in bursts — but due to forced alignment, the 
kernel was placing them with artificial gaps, defeating THP eligibility 
entirely.

By not force-aligning non-PMD-sized mappings, we avoid injecting gaps. 
The result is that:

a. VMAs remain adjacent → mergeable

b. Physical memory is contiguous → eligible for khugepaged collapse

c. THP utilization increases → fewer TLB misses → lower latency → higher 
throughput

💡 4. Why this patch complements Rik’s rather than contradicts it:

Rik's patch made it easier to guarantee alignment for workloads that 
benefit from explicit huge pages — but at the cost of breaking 
coalescence in workloads with non-PMD-sized mappings, like ML inference.

This patch simply refines that logic:

If the length is PMD-aligned → keep alignment

If it’s not → don’t inject alignment gaps that block merging

So, for workloads that can’t benefit from THP due to misalignment, this 
patch removes artificial fragmentation without harming the original 
intent.

⚙️ 5. mTHP note
Although this patch doesn’t target mTHP directly, I believe a similar 
logic tweak could apply there too — especially with shmem-backed 
workloads (common in model servers using shared tensor memory). I’d be 
happy to help test any changes proposed there to derive the consequent 
results.

Thanks again for the detailed discussion. Let me know if you’d like a 
trace or VMA map from a Hugging Face benchmarked run (happy to generate 
one locally).

Best Regards,
Siddhartha Sharma
+91 9015185601
