Received: from techbitestudio.com (techbitestudio.com [75.119.147.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E12B278E7C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 13:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=75.119.147.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751376237; cv=none; b=jnPDny+fO8PjQ3O3ZR94lug7/I6Zr6cl6WSd00usH1po6mzVzmlL8vl7aU40eCE3X5kZLs02QN8huorh9iWXIZDPjj1eg/TBQ2FwpzI73emHwZ9cgFIBjultNgUC2WiQsPv1cqEM1UchUEkzuWbt74iuZNsu4MtqPlotELsi++s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751376237; c=relaxed/simple;
	bh=wd12ttlyPVwBCCUwsL+t3gSmpMpNSA2fc9HOShtr8IQ=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=HcGm89fDAZXizEMWmoXcPv3vG5dL7KCLTdl2uI5ePLkLSoE/xabGowfnhWft5GhSfyJzG3hiSTa3UQyPzSuTbEJSuHwU5QbSu9Sr5PIyRKegvOixcNfqZ+lK4sAIF3hJoFAc5/CbjS/fJxtmc6BPbb7rRmceXNWLO9ieoQ72Dpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kenip.in; spf=pass smtp.mailfrom=kenip.in; dkim=pass (1024-bit key) header.d=kenip.in header.i=@kenip.in header.b=KaN8hsF1; arc=none smtp.client-ip=75.119.147.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kenip.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kenip.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kenip.in header.i=@kenip.in header.b="KaN8hsF1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kenip.in;
	 s=mail; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
	In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=WYc6BWDDB6pjMcrs1k9Wn+s7y4QT7W16n4fHbowUlO8=; b=KaN8hsF1Io0Buz77jFukgLk0vJ
	z+8u7x8xSAebY2Uv4qCztDZG71bezDxWmw6OVB8lizdyktcCtBEkOuGVP2eKu2dGbMthknfQaIady
	xUe3Kf39jD5GkcKBXbLSDP4fGeInKBuAHcDQs17uRWrYvDFw9BZbmXkvPosTXUyPRbQw=;
Received: from localhost ([127.0.0.1] helo=kenip.in)
	by techbitestudio.com with esmtpa (Exim 4.93)
	(envelope-from <siddhartha@kenip.in>)
	id 1uWaxf-00075f-NT; Tue, 01 Jul 2025 18:53:47 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 01 Jul 2025 18:53:47 +0530
From: siddhartha@kenip.in
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Dev Jain <dev.jain@arm.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, mgorman@suse.de
Subject: =?UTF-8?Q?Re=3A_=5BPATCH=5D_mm=3A_limit_THP_alignment_=E2=80=93_?=
 =?UTF-8?Q?performance_gain_observed_in_AI_inference_workloads?=
In-Reply-To: <5c3d307f-d303-48c3-b730-99a83d4815ec@lucifer.local>
References: <d8ffe547-5516-43e5-9f33-56b2698a0b4f@arm.com>
 <ba2c89bd-88de-48f8-abd0-b62d8b1d50b3@lucifer.local>
 <5816677a-705e-4a8f-b598-d74ff6198a02@arm.com>
 <ee92d6a9-529a-4ac5-b3d0-0ff4e9085786@lucifer.local>
 <e7152150-2f3e-4ad7-a6c5-f4b77e5c0e05@arm.com>
 <f746d3aa-17e7-4b42-9e08-97cdb2cad89b@lucifer.local>
 <80b849d4-faf3-47a9-8b8c-e8053299cfb2@arm.com>
 <2e99712b-8dac-4762-9fc5-fe3ef569b65e@lucifer.local>
 <afe95bb0-185b-4c4a-ae41-e02457422cc3@arm.com>
 <787639a1e6a27c0f3b0e3ae658e1b8e7@kenip.in>
 <5c3d307f-d303-48c3-b730-99a83d4815ec@lucifer.local>
Message-ID: <dd370f92e9100e785aeafdc4d31f8cb5@kenip.in>
X-Sender: siddhartha@kenip.in
X-Priority: 1 (Highest)
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-07-01 18:09, Lorenzo Stoakes wrote:
> On Tue, Jul 01, 2025 at 05:45:51PM +0530, siddhartha@kenip.in wrote:
>> 🧩 1. Does the patch cause VMAs to be merged eventually?
>> You're correct: VMA merging only happens at mmap() time (via
>> __mmap_region()). What the patch affects is the behavior of
>> thp_get_unmapped_area_vmflags() before the mmap is placed.
> 
> [...]
> 
>> 
>> 📐 2. Why aren’t the VMAs mergeable before the patch?
>> Great question. Even if the VMA flags are identical, gaps introduced 
>> by
>> forced alignment from get_unmapped_area() break the precondition for
>> merging:
> 
> [...]
> 
>> 💡 4. Why this patch complements Rik’s rather than contradicts it:
> 
> I'm really perplexed as to why you felt the need to (seemingly via LLM)
> reply with the explanation I've already provided here?...
> 
> There's errors in things you say here too.
> 
> With respect, please don't do this.
> 
> (I'm the co-maintainer of pretty much all the relevant code here and 
> wrote
> the VMA merge logic you're referring to.)
> 
>> 
>> 🤖 3. How does this impact AI workloads like Hugging Face Transformers?
>> Tokenization and dynamic batching create non-deterministic memory 
>> allocation
>> patterns:
>> 
>> Models like BERT and T5 dynamically allocate intermediate buffers per
>> token-length, batch size, and attention window.
>> 
>> Hugging Face + ONNX Runtime uses multiple small-ish anonymous mmap()s, 
>> often
>> 512KB–1.8MB.
>> 
>> These allocations come in bursts — but due to forced alignment, the 
>> kernel
>> was placing them with artificial gaps, defeating THP eligibility 
>> entirely.
>> 
>> By not force-aligning non-PMD-sized mappings, we avoid injecting gaps. 
>> The
>> result is that:
>> 
>> a. VMAs remain adjacent → mergeable
>> 
>> b. Physical memory is contiguous → eligible for khugepaged collapse
>> 
>> c. THP utilization increases → fewer TLB misses → lower latency → 
>> higher
>> throughput
>> 
> 
> This is very useful information and it's appreciated! Let's not drown 
> this
> out with restatements of stuff already covered.
> 
>> 
>> ⚙️ 5. mTHP note
>> Although this patch doesn’t target mTHP directly, I believe a similar 
>> logic
>> tweak could apply there too — especially with shmem-backed workloads 
>> (common
>> in model servers using shared tensor memory). I’d be happy to help 
>> test any
>> changes proposed there to derive the consequent results.
> 
> Dev - could we hold off on any effort to do something like this until 
> I've
> had a chance to refactor THP somewhat? This is already a mess and I'd 
> like
> to avoid us piling on more complexity.
> 
> We can revisit this at a later stage.
> 
>> 
>> Thanks again for the detailed discussion. Let me know if you’d like a 
>> trace
>> or VMA map from a Hugging Face benchmarked run (happy to generate one
>> locally).
>> 
> 
> Thanks! Much appreciated.
> 
> Cheers, Lorenzo

Hi Lorenzo,

Thanks for your clarification, and I appreciate your patience — 
especially given your role in maintaining and designing the VMA merge 
logic.

I understand now that my earlier phrasing may have repeated your 
explanation for VMA adjacency, and I regret unintentionally restating 
it.

I’ll make sure to be more careful and direct going forward.

As for the THP alignment condition now being `IS_ALIGNED(len, 
PMD_SIZE)`, I agree this resolves the regressions by removing alignment 
for non-aligned sizes, which was exactly what broke workloads like 
cactusBSSN or some AI inference loads.

Thanks again for the guidance — I’m learning a lot from this thread.

Best Regards,
Siddhartha Sharma

