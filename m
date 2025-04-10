Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45CE3232
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 00:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744243244; cv=none; b=oK+Ws5iEQx4a470IZI8Rx/Dshbi2CM2C8Dw7b7EW9iDR8jNvxzzrxQHAz5TvN9iM3roJNiKKddGj+pkn5jZk6Osqln6TA7i+hHG65xtuRgQwfpGXbB0BMKVjT/GcgvdjIpY2E9+ipyJsqdT7fY+165aJJ4dPuPB1dmismS6zM+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744243244; c=relaxed/simple;
	bh=jxcfPCWpTiqrTRsXRsgF8FFdy459/Dh6OTyboPnYG4U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sy546K72h8hTK63VmhMJiUL9zx88HOSLNTnIezd78R5i4Q/68qH6DoGRekl33XR5k/Ie+o50VQeTIlPNuG6as/DzxMKyfqzx0SJ/ptx7oyUJZue6knCmSTnkS/UkVpBdAKR4GA/qLSx1ixEwpexgHjklsUZJ/caE8/s1dm6JZ/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uxsM42S2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uxsM42S2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16AEBC4CEE2;
	Thu, 10 Apr 2025 00:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744243243;
	bh=jxcfPCWpTiqrTRsXRsgF8FFdy459/Dh6OTyboPnYG4U=;
	h=From:To:Cc:Subject:Date:From;
	b=uxsM42S2RWRsFCP0yJnNnP5qlp14BTSYNPHM15+IQxpprzjEXISeWvClUcNoq79M0
	 48qaZ6TPv58tVq9X0mm67p/ylPDRN23Aa7WTB2QmBejBTlg6af5idroPM3v4u6pg50
	 oc7M5svHI3YU8t6oiOdCqXIVEjvn8U+QqUOjUQV2eGPmd5KFG4IvO3NQVzPz/HDMJo
	 U/b4GgBPRApYB/hAs5eU/7t7Vdh8t3HEFQpoXC0TFTfX79teuu1TtTNhTA8oeEVo/i
	 8JL7vFdKgQgosWP31RPQMyMsS42FrlR3SWzkkJaGFzHZGRoO/oWvg1aToqcpAicxMb
	 UDFEi8StpR8Kg==
From: SeongJae Park <sj@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: SeongJae Park <sj@kernel.org>,
	"Liam R.Howlett" <howlett@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Rik van Riel <riel@surriel.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>,
	kernel-team@meta.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v3 0/4] mm/madvise: batch tlb flushes for MADV_DONTNEED and MADV_FREE
Date: Wed,  9 Apr 2025 17:00:18 -0700
Message-Id: <20250410000022.1901-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When process_madvise() is called to do MADV_DONTNEED[_LOCKED] or
MADV_FREE with multiple address ranges, tlb flushes happen for each of
the given address ranges.  Because such tlb flushes are for the same
process, doing those in a batch is more efficient while still being
safe.  Modify process_madvise() entry level code path to do such batched
tlb flushes, while the internal unmap logic do only gathering of the tlb
entries to flush.

In more detail, modify the entry functions to initialize an mmu_gather
object and pass it to the internal logic.  And make the internal logic
do only gathering of the tlb entries to flush into the received
mmu_gather object.  After all internal function calls are done, the
entry functions flush the gathered tlb entries at once.

Because process_madvise() and madvise() share the internal unmap logic,
make same change to madvise() entry code together, to make code
consistent and cleaner.  It is only for keeping the code clean, and
shouldn't degrade madvise().  It could rather provide a potential tlb
flushes reduction benefit for a case that there are multiple vmas for
the given address range.  It is only a side effect from an effort to
keep code clean, so we don't measure it separately.

Similar optimizations might be applicable to other madvise behavior such
as MADV_COLD and MADV_PAGEOUT.  Those are simply out of the scope of
this patch series, though.

Patches Sequence
================

The first patch defines a new data structure for managing information
that is required for batched tlb flushes (mmu_gather and behavior), and
update code paths for MADV_DONTNEED[_LOCKED] and MADV_FREE handling
internal logic to receive it.

The second patch batches tlb flushes for MADV_FREE handling for both
madvise() and process_madvise().

Remaining two patches are for MADV_DONTNEED[_LOCKED] tlb flushes
batching.  The third patch splits zap_page_range_single() for batching
of MADV_DONTNEED[_LOCKED] handling.  The fourth patch batches tlb
flushes for the hint using the sub-logic that the third patch split out,
and the helpers for batched tlb flushes that introduced for the
MADV_FREE case, by the second patch.

Test Results
============

I measured the latency to apply MADV_DONTNEED advice to 256 MiB memory
using multiple process_madvise() calls.  I apply the advice in 4 KiB
sized regions granularity, but with varying batch size per
process_madvise() call (vlen) from 1 to 1024.  The source code for the
measurement is available at GitHub[1].  To reduce measurement errors, I
did the measurement five times.

The measurement results are as below.  'sz_batch' column shows the batch
size of process_madvise() calls.  'Before' and 'After' columns show the
average of latencies in nanoseconds that measured five times on kernels
that built without and with the tlb flushes batching of this series
(patches 3 and 4), respectively.  For the baseline, mm-new tree of
2025-04-09[2] has been used, after reverting the second version of this
patch series and adding a temporal fix for !CONFIG_DEBUG_VM build
failure[3].  'B-stdev' and 'A-stdev' columns show ratios of latency
measurements standard deviation to average in percent for 'Before' and
'After', respectively.  'Latency_reduction' shows the reduction of the
latency that the 'After' has achieved compared to 'Before', in percent.
Higher 'Latency_reduction' values mean more efficiency improvements.

    sz_batch  Before      B-stdev  After        A-stdev  Latency_reduction
    1         146386348   2.78     111327360.6  3.13     23.95
    2         108222130   1.54     72131173.6   2.39     33.35
    4         93617846.8  2.76     51859294.4   2.50     44.61
    8         80555150.4  2.38     44328790     1.58     44.97
    16        77272777    1.62     37489433.2   1.16     51.48
    32        76478465.2  2.75     33570506     3.48     56.10
    64        75810266.6  1.15     27037652.6   1.61     64.34
    128       73222748    3.86     25517629.4   3.30     65.15
    256       72534970.8  2.31     25002180.4   0.94     65.53
    512       71809392    5.12     24152285.4   2.41     66.37
    1024      73281170.2  4.53     24183615     2.09     67.00

Unexpectedly the latency has reduced (improved) even with batch size
one.  I think some of compiler optimizations have affected that, like
also observed with the first version of this patch series.

So, please focus on the proportion between the improvement and the batch
size.  As expected, tlb flushes batching provides latency reduction that
proportional to the batch size.  The efficiency gain ranges from about
33 percent with batch size 2, and up to 67 percent with batch size
1,024.

Please note that this is a very simple microbenchmark, so real
efficiency gain on real workload could be very different.

Chagelong
=========

Changes from v2
(https://lore.kernel.org/20250404210700.2156-1-sj@kernel.org)
- Fix typos on cover letter
- Rename madvise_behavior pointers to madv_behavior
- Rename notify_unmap_single_vma() to zap_page_range_single_batched()
- Add a sanity check of tlb parameter to zap_page_range_single_batched()
- Add missed full stop of a comment
- Add details to MADV_DONTNEED tlb flush batching commit message
- Collect Reviewed-by: from Lorenzo for the second patch

Changes from v1
(https://lore.kernel.org/20250310172318.653630-1-sj@kernel.org)
- Split code cleanup part out
- Keep the order between tlb flushes and hugetlb_zap_end()
- Put mm/memory change just before its real usage
- Add VM_WARN_ON_ONCE() for invlaid tlb argument to unmap_vma_single()
- Cleanups following nice reviewers suggestions

Changes from RFC
(https://lore.kernel.org/20250305181611.54484-1-sj@kernel.org)
- Clarify motivation of the change on the cover letter
- Add average and stdev of evaluation results
- Show latency reduction on evaluation results
- Fix !CONFIG_MEMORY_FAILURE build error
- Rename is_memory_populate() to is_madvise_populate()
- Squash patches 5-8
- Add kerneldoc for unmap_vm_area_struct()
- Squash patches 10 and 11
- Squash patches 12-14
- Squash patches 15 and 16

References
==========

[1] https://github.com/sjp38/eval_proc_madvise
[2] commit 3923d30a2d51 ("mm-mempolicy-support-memory-hotplug-in-weighted-interleave-checkpatch-fixes") # mm-new
[3] https://lore.kernel.org/20250409165452.305371-1-sj@kernel.org

SeongJae Park (4):
  mm/madvise: define and use madvise_behavior struct for
    madvise_do_behavior()
  mm/madvise: batch tlb flushes for MADV_FREE
  mm/memory: split non-tlb flushing part from zap_page_range_single()
  mm/madvise: batch tlb flushes for MADV_DONTNEED[_LOCKED]

 mm/internal.h |   3 ++
 mm/madvise.c  | 101 ++++++++++++++++++++++++++++++++++++++------------
 mm/memory.c   |  47 ++++++++++++++++++-----
 3 files changed, 118 insertions(+), 33 deletions(-)


base-commit: 5d1eb3ed3b3aee67f6d1bda64ef710bfcf52f342
-- 
2.39.5
