Received: from techbitestudio.com (techbitestudio.com [75.119.147.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44DE27FD4E
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=75.119.147.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751284093; cv=none; b=GQ3O161zds0rAHKiFGwda3s15O9Diku+dju7KbTNMFTaWJ9dz2Qk5LPboGW96FNqEe2Mf5rGImZoxCq7MJdfMNez5W5s9DfuH29oqZ+h5c7zKQ3BVuonbCbCluneE9c4MiBfsIx4kp1B3FD1NQSaTOKTRQ720DRdEvR5/eVy+Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751284093; c=relaxed/simple;
	bh=oWlv8+xHiZeDHI02Mhfb7losKROKExZfegea9sxkZVs=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=DGNnp5HayX6HfnaMXc3XJSdiC+DFpsE8NxBoOyel2smMyQmrbJoqoMWy2v9sNUAg/+vllNydgTHUwyVsr9HxI83ckQmwUCCxLszSMDxa3rFYUmM9tu4ZcaXWh1bGJiwg2uyrFSz4gAm/Eu/PM9WgMLMJl3vB7bisjMbShEievSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kenip.in; spf=pass smtp.mailfrom=kenip.in; dkim=pass (1024-bit key) header.d=kenip.in header.i=@kenip.in header.b=lDH+be8k; arc=none smtp.client-ip=75.119.147.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kenip.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kenip.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kenip.in header.i=@kenip.in header.b="lDH+be8k"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kenip.in;
	 s=mail; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
	In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=OSWJYTVlCnXdQQsB1ImV3/XiHEQb6cpDYP+MEyTQhY0=; b=lDH+be8kx1p0FQFteLHIqR7HUf
	+Pww22Huaurj7WuCMk7S/yjPTCsQXRY29jk2KSCL2E80+dHl+IePh9UYPZ7pzQrkhjj9p8HtjHwUs
	GjplaubOO/lyDGhGKViiOr+FuC+1Q/L0jguj6Yvj9LTX6pOAuF0SJ4bA2jVt/HBk08qc=;
Received: from localhost ([127.0.0.1] helo=kenip.in)
	by techbitestudio.com with esmtpa (Exim 4.93)
	(envelope-from <siddhartha@kenip.in>)
	id 1uWCzS-0003ha-3K; Mon, 30 Jun 2025 17:18:02 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 30 Jun 2025 17:18:02 +0530
From: siddhartha@kenip.in
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Dev Jain <dev.jain@arm.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, mgorman@suse.de
Subject: =?UTF-8?Q?Re=3A_=5BPATCH=5D_mm=3A_limit_THP_alignment_=E2=80=93_?=
 =?UTF-8?Q?performance_gain_observed_in_AI_inference_workloads?=
In-Reply-To: <ba2c89bd-88de-48f8-abd0-b62d8b1d50b3@lucifer.local>
References: <28338f055b3c9afa8b69ff6f05ea20ed@kenip.in>
 <4990838b-660d-46a2-b21c-67adcba61ff9@lucifer.local>
 <19714cae-6b73-43ec-af7a-1455196561d1@arm.com>
 <3ee2e7fea6f263aa884e3e715632b09f@kenip.in>
 <d8ffe547-5516-43e5-9f33-56b2698a0b4f@arm.com>
 <ba2c89bd-88de-48f8-abd0-b62d8b1d50b3@lucifer.local>
Message-ID: <8128c0338e5df5476ec9fd6eb3079964@kenip.in>
X-Sender: siddhartha@kenip.in
X-Priority: 1 (Highest)
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-06-30 16:24, Lorenzo Stoakes wrote:
> +cc Vlastimil, please keep him cc'd on discussions here as the author 
> of this
> fix in the conversation.
> 
> On Mon, Jun 30, 2025 at 10:55:52AM +0530, Dev Jain wrote:
>> 
>> 
>> For this workload, do you enable mTHPs on your system? My plan is to 
>> make a
>> similar patch for
>> 
>> the mTHP case and I'd be grateful if you can get me some results : )
> 
> I'd urge caution here.
> 
> The reason there was a big perf improvement is that, for certain 
> workloads, the
> original patch by Rik caused issues with VMA fragmentation. So rather 
> than
> getting adjacent VMAs that might later be khugepage'd, you'd get a 
> bunch of VMAs
> that were auto-aligned and thus fragmented from one another.
> 
> So while you got speed ups on some workloads, you got really bad perf 
> impact on
> some that were subject to this.
> 
> The observed speed up was on a very specific benchmark also. While it's 
> a great
> improvement, it's important to understand the context (see the original 
> patch
> for details [0]).
> 
> I do think it's worth considering changing 
> thp_get_unmapped_area_vmflags() for
> mTHP, as it's currently very limited (just PMD alignment) and it'd 
> possibly be
> sensible to change this to checking against allowed THP alignments, but 
> I'd not
> assume this is going to get some crazy speed up as observed here.
> 
> Note that any such change would probably require some refactoring in 
> THP first
> to make it not quite so awful.
> 
> I also think for Siddharta's usecase mTHP isn't really relevant is it, 
> as intel
> do not support mTHP currently do they?
> 
> Regards, Lorenzo
> 
> [0]: 
> https://lore.kernel.org/all/20241024151228.101841-2-vbabka@suse.cz/T/#u

Hi Lorenzo, Dev, All,

Thank you for the thoughtful responses and for engaging with the 
performance implications of the patch.

You're absolutely right that the observed speedup came from a specific 
class of workloads — in this case, token-length-variable AI inference 
pipelines based on Hugging Face Transformers and ONNX Runtime. These 
workloads trigger highly dynamic, anonymous memory allocation patterns, 
often in bursts aligned with model shard loading and attention map 
resizing. In such cases, VMA fragmentation due to PMD-aligned, 
non-PMD-sized mappings led to near-complete loss of THP utilization.

Once the alignment restriction was lifted (via Rik’s patch), we observed 
substantial restoration of THP behavior, which is where the performance 
gains came from. That said, I completely agree that:

Not all workloads benefit from this

Some may even regress if the underlying VMAs aren't THP-coalescible for 
other reasons

Still, for high-throughput inference workloads on modern Intel CPUs, 
this behavior isn’t a corner case. The shift toward multi-model 
concurrent serving (e.g., LLM-as-a-Service) means this dynamic 
allocation pattern is becoming common, especially in 
edge/latency-sensitive deployments.

🧠 On mTHP: Intel Does Support It
Regarding mTHP — yes, Intel platforms (especially server-grade Xeon 
processors from Cascade Lake onward) do support mapped transparent huge 
pages, including via:

tmpfs-backed files

madvise(MADV_HUGEPAGE) on file mappings

shmem usage with shmem_enabled in the kernel

So I’d say mTHP is certainly relevant for workloads where model weights 
or tensors are pre-cached or memory-mapped — a pattern we’re also seeing 
as Hugging Face, ONNX, and PyTorch ecosystems move toward zero-copy 
tensor sharing.

Given that, I'd absolutely be interested in testing any mTHP-targeted 
patch — and I’d be happy to help validate it, especially if it avoids 
the VMA fragmentation pitfall you rightly pointed out.

Thanks again for the detailed feedback, and I’ll try to replicate and 
share further traces (from my local testbed) since I currently don’t 
have access to the original Intel Developer Cloud logs.

Best regards,
Siddhartha Sharma
