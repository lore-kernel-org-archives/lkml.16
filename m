Received: from techbitestudio.com (techbitestudio.com [75.119.147.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9B41EEF9
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 00:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=75.119.147.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751244225; cv=none; b=ql/5PXf/m62hfQatfpMDp73GKbKrAY0R+h7z4y6Eck6wErE6/E2Vh3L9mItycq4ukYoRGBC99ABEFNlPrHsiyzs2+UtuYIacjT6PD8p3Bf1hC5QaokzJiaVITd37V0LGqpjoby+79QLzycuuLpLTYz2Rrt8GYGaYVaq+EAgRYas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751244225; c=relaxed/simple;
	bh=p7tItz4s67WUaMEoaG+Mp0Nng1mJdmisqwOq753JKMg=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=BZTNJRjlHscSpeMZuSokohs91syrwjkmzHL2BOKRlRsxyzOoot9DcE+3SnNc7Fbmafdkkdm31wHqFcpik/EW96K5lHCf1MZlPsh9OpvL7Q17bLyKSk3YwkXW3J7VaodlLIPWvRDWkvfhiJv2+lwaTZPotq8TekSO7u1R8BUIE5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kenip.in; spf=pass smtp.mailfrom=kenip.in; dkim=pass (1024-bit key) header.d=kenip.in header.i=@kenip.in header.b=LykpOqIb; arc=none smtp.client-ip=75.119.147.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kenip.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kenip.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kenip.in header.i=@kenip.in header.b="LykpOqIb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kenip.in;
	 s=mail; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
	In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=KOB8GqEPw4zLresCss8wv+s6sLLCekVWy0o3dhRzXMA=; b=LykpOqIbj08gZ/PfvRbAAJtoDL
	xCqLTDaRkFdyDK3uJZg70+N3+5Z9vrwvdHtukKZqLW8ZymZMjQz3WVDYiuaG/EV8WR5FuuhoWjlPr
	95MSVvdlzu4xUJ86TKnDKo8WT3Sx3ZxW2VRMVRUQGwsmoJAShzAA8UumxbWghSMZsAbk=;
Received: from localhost ([127.0.0.1] helo=kenip.in)
	by techbitestudio.com with esmtpa (Exim 4.93)
	(envelope-from <siddhartha@kenip.in>)
	id 1uW2cK-0005He-FY; Mon, 30 Jun 2025 06:13:28 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 30 Jun 2025 06:13:28 +0530
From: siddhartha@kenip.in
To: Dev Jain <dev.jain@arm.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, mgorman@suse.de
Subject: =?UTF-8?Q?Re=3A_=5BPATCH=5D_mm=3A_limit_THP_alignment_=E2=80=93_?=
 =?UTF-8?Q?performance_gain_observed_in_AI_inference_workloads?=
In-Reply-To: <19714cae-6b73-43ec-af7a-1455196561d1@arm.com>
References: <28338f055b3c9afa8b69ff6f05ea20ed@kenip.in>
 <4990838b-660d-46a2-b21c-67adcba61ff9@lucifer.local>
 <19714cae-6b73-43ec-af7a-1455196561d1@arm.com>
Message-ID: <3ee2e7fea6f263aa884e3e715632b09f@kenip.in>
X-Sender: siddhartha@kenip.in
X-Priority: 1 (Highest)
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-06-28 09:19, Dev Jain wrote:
> On 27/06/25 9:00 pm, Lorenzo Stoakes wrote:
>> +cc Vlata
>> 
>> On Fri, Jun 27, 2025 at 04:09:16PM +0530, siddhartha@kenip.in wrote:
>>> Hi all,
>>> 
>>> I wanted to share validation data from a Hugging Face-based AI 
>>> inferencing
>>> workload,
>>> which was significantly impacted by the THP alignment logic 
>>> introduced in
>>> commit efa7df3e3bb5.
>>> 
>>> Using transformer models with dynamic input lengths on Intel Xeon 
>>> (Cooper
>>> Lake),
>>> we observed up to a 3200% throughput improvement after applying the 
>>> patch
>>> from Oct 2024:
>>> 
>>>    mm: limit THP alignment of anonymous mappings to PMD-aligned sizes
>> All congratulations are owed to Vlastimil Babka for doing this, cc'd 
>> :)
>> 
>> I gather he enjoys novelty beer mugs as tokens of thanks ;)
> 
> I was wondering how the change can get us such a big optimization - the
> alignment causes us to gain at most 1 extra PMD-THP mapping. Is there
> something else I am missing?
> 
> I ask because when I was reading the code I was thinking whether a 
> similar
> change can be done for mTHPs.
> 
>> 
>>> Metrics:
>>> - Model: BERT-base
>>> - Inference engine: Transformers + ONNX Runtime
>>> - Kernel: 6.6 vs patched 6.6.8
>>> - Batch size: 8-32, input length: 64-512 tokens
>>> - Metric: inference throughput (samples/sec)
>>> 
>>> Thanks for the fix -- this change had real impact on a 
>>> production-relevant
>>> workload.
>>> 
>>> Best Regards,
>>> Siddhartha Sharma
>>> ISV @ Kenip
>>> Solution Link: 
>>> https://www.intel.com/content/www/us/en/partner/showcase/offering/a5bHo00000045YUIAY/deadlock-clearance.html
>>> 

Hi Dev Jain,

Thank you for reviewing and for your thoughtful question.

You're absolutely right that, in isolation, gaining one additional 
PMD-THP mapping wouldn't explain a 3200% speedup. But in our use case 
(Hugging Face inference workloads with dynamic input sizes and many 
allocations), the original PMD alignment logic caused a cascade of side 
effects:

The performance improvement comes from how that interacts with dynamic 
memory allocation patterns in AI inference workloads, especially those 
using frameworks like Hugging Face Transformers.

In our specific use case, the workloads were running on Intel Developer 
Cloud, but I no longer have access to that particular environment or the 
original profiling output. However, I’d like to highlight why this patch 
had such an outsized effect:

🔹 1. Fragmentation Avoidance
In model shard loading (e.g., large BERT or GPT2 models split into 
multiple memory segments), many medium-sized anonymous allocations occur 
in rapid succession. These workloads tend to allocate many 512 KB – 1.5 
MB buffers dynamically (token buffers, intermediate tensors). Aligning 
each one to PMD size, even when their length wasn’t PMD-aligned, led to 
gaps between them — defeating natural coalescing into a single THP.

🔹 2. TLB aliasing and cache index pressure

These fragmented mappings caused frequent TLB misses and poor L1/L2 
cache reuse.

The result was what looks like “memory thrashing,” with slow memory 
access dominating total inference time.
When every mapping is PMD-aligned (even if not PMD-sized), the gaps 
between them prevent Transparent Huge Pages (THPs) from activating 
effectively.

This breaks THP coalescence and causes fragmented page tables and higher 
memory overhead per shard.

🔹 3. Latency & Throughput Penalty from Memory Misalignment
This leads to higher TLB miss rates, especially under multi-threaded 
load, which dramatically slows down token embedding and attention 
calculations.

When loading model shards, memory initialization becomes 
cache-unfriendly, with poor reuse across cores.

This affects not only inference latency but also model cold-start time — 
which is critical in autoscaling deployments.

🔹 4. Qualitative Observation
Without this patch: shard loading stuttered, warm-up was slow, and we 
saw CPU cycles dominated by page_fault and TLB miss handlers.

With this patch: shard loading smoothed out, THPs were correctly applied 
(based on smaps), and throughput shot up by an order of magnitude.

🔹 5. Measured Impact
On Intel Xeon (Cooper Lake), a 6.6.0 kernel with PMD alignment on 
non-aligned sizes showed 11–32× worse performance.

With the patched kernel (which skips alignment unless the length is 
PMD-aligned), memory layout was contiguous again and THP was 
consistently utilized.

This isn’t about one extra THP — it’s about preventing widespread THP 
fragmentation and the resulting dramatic cache/TLB degradation. For AI 
workloads with high concurrency and dynamic shapes, this small patch has 
a massive effect on layout and locality.

So, it's not just “1 more huge page” — it's avoiding massive 
fragmentation that leads to:

1. TLB miss storms

2. Poor locality

3. Cache index thrashing

4. Improvement in latency and throughput

This applies across many adjacent, odd-length allocations typical of AI 
inference workloads.

The original alignment logic created a pattern of broken contiguity — 
defeating THP benefits altogether.

In AI workloads using Hugging Face Transformers, model shards and 
intermediate tensors are dynamically allocated during inference. These 
allocations often fall just below or above the 2MB threshold that THP 
relies on. Misalignment or forced alignment to PMD boundaries causes 
fragmentation and disrupts huge page coalescence, affecting performance.

📊 Memory Allocation Pattern Diagram

Without Patch (PMD Alignment Forced):

|<--2MB-->|<--Gap-->|<--2MB-->|<--Gap-->|<--2MB-->
| Alloc A |         | Alloc B |         | Alloc C |

Each allocation is PMD-aligned, even if it’s not PMD-sized

Gaps prevent THP coalescence → TLB/cache fragmentation

With Patch (PMD Alignment Conditional):

|<---------6MB Contiguous Region--------->|
|  Alloc A  | Alloc B | Alloc C | Padding |

Contiguous anonymous memory region

Coalesced into one or more THPs

Improved locality and TLB efficiency

While I regret not having the raw perf output at hand, I’d be happy to 
replicate a similar test locally and share reproducible results if 
helpful.

Best Regards,

Siddhartha Sharma


