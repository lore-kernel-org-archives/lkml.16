Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D03C2F7D15;
	Wed,  2 Jul 2025 20:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751487240; cv=none; b=FGQLFpBhM0kjMMKoY2Psqqd/2W6y9McO+rpql6rnXpInIuZ95hoT8EcFDJusAfpc/uGBZod2MZpmxAdZUS16F0bt9oo/xSZ4dxai8n6bWgtp68Z5cN6janR8KsIXDPw/J84eAQogMQMik0Byh9qHCO4KlMFHurh2u0U8wiw0+VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751487240; c=relaxed/simple;
	bh=5zNFvtLawYVd/U9yqbMABjFRZh76VFLpLBt3tTX9qsk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OyrOoPBqpF/60ygysCCMIUr1MH2zR+OilPEWHkgyOEsuwh0FHmPM3nbKwWPtxtJdqPyHNqch1pnnbB7sCxj4vsI9BCD44hQKdYkKf23YhX2gXL1XXVwSzlj0C7GXsycxilBObINceaGlLVFNsmZhOTUPz7WgAocMBY7+41Mzw94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ib8GCM51; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ib8GCM51"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-70e4b1acf41so40280117b3.3;
        Wed, 02 Jul 2025 13:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751487237; x=1752092037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RxoP3bPOkePIEVk1dw8oIMVvC/RCEEWHRfUsvE/bh3o=;
        b=ib8GCM51zd2EFCeUKsh+bpaN1QZCHSzKZ56yokrNepIhJjekS4wiCKuxAYKR/IQGOC
         mPHJMf/tiKHHJdyg8RSEcZpar2BWpE3eZzbTIZC26jPZpRWFCFtiYYRnkQvaqphkWNK5
         zXJItPPjUzhhN/BSm84pKZ1FGKtBTmcyBYgfrd+M8i8gfkYkeiR7mpqQAsJDN/sOhzA+
         mKV+5xYryvGtHIo4xgnRTzzOS/mA8q5tpcE0S+QNzH2vndsdldnFYeYfkFVGA5noPw28
         olAaTK0L147tfRfKPGIc4yMczEuslJkelUicJfLAFoRRglv5A6IB9Fmwy27xeptET2VH
         mTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751487237; x=1752092037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RxoP3bPOkePIEVk1dw8oIMVvC/RCEEWHRfUsvE/bh3o=;
        b=Bdy8zQMJ0xGqAZ/BFOLEl9OFOTTtyQtmHgTBvJsYQHM8P5qkoBAKW+NVYo1w1ydz0R
         YVz4CYLZhNJwKhCFH+hr1Us7LDz59gYHl2geRjj5Sv1JYLrqRSzuDRzI+mNZKnu6VaL9
         uoneSLxhvDgfzNimk759fBhrunM7mjwe7xagTgGuxG5i1iRSQCi7tVEair699etkxSZB
         5Tab07kCpfHTE2BLuwSEZzEHwm2JKffqiPPzX0q1fvAgknw0Ee/bRKeTSRm10m8Z0UF6
         MuJf1VrJQSsKtNhSikoQZOvAc8PKEND/0hM0MJvyI0XXwaVIdf0Rf5/QNHBC24SBIN3S
         UW7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVDAXmvQZb+I9Vuikb4KIIZcihX/H8HAFBJKqDNupeRmwGQSdobrO9xZaswhA1swyWl16dzPoY/b1M=@vger.kernel.org, AJvYcCWrB9MzUctYtD+t/pusDEcZQI9cn1krBQdCYawIMqpkstvMQdc5GPC4p/ty3tozSGst4lInhVNUe5zrm9YI@vger.kernel.org
X-Gm-Message-State: AOJu0YyMkG35wIsofF6qrKU8LJKk8BD7bDY85yZCIskNDxtmruaEn4bv
	31iUHLLjxrIJUDdjtYC8K9pgjZkpBKMAHcCNvHd7ixV8QWAOmbh8Q8N/
X-Gm-Gg: ASbGncsG+vXQmdFX/VPUldtLBZh/BYSCrCuav43lkNctaxOu89TpkNtcWSXby4VP932
	/s36eLqvUMnrrQUk0c9RJ+A25NhRlZvP2yJW4dTcCiuNho7pTHw8cidy0HsWWboe+y3k8W9UYpL
	7xEMuZqp0BUkpQGRftwu93NQ9QFZ1Qd7WXnfXSbIsKQ1AGEIaAKz2diQ+BPe23Lex72jDRB8zQA
	2HpImpzQ1cZmC4v92sqPl+7U8p2qm+CPgj6ICsVcUHhFppn2ub5hupzRiRc7l+ELA0ATqBRtkO9
	H6IBUtj3HroCuKcJpZWdD8Q6YUaHIWukecYAT2Pr4DYFs1H2rDFYn/RkaXzeNsN3v953REYAg69
	uYVsU7vq2pG1p4Eb9hA==
X-Google-Smtp-Source: AGHT+IFAoOyi3+KVJvySs6aPw8sYrmABKTuMz181OZ4DKCfKTi/ukqiKq1JtSXQjtnPOr+6OIMd7NQ==
X-Received: by 2002:a05:690c:720a:b0:70d:fe74:1800 with SMTP id 00721157ae682-71658ffd651mr13971417b3.15.1751487237218;
        Wed, 02 Jul 2025 13:13:57 -0700 (PDT)
Received: from bijan-laptop.attlocal.net ([2600:1700:680e:c000:873e:8f35:7cd8:3fe3])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71515cb4347sm26124157b3.83.2025.07.02.13.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 13:13:56 -0700 (PDT)
From: Bijan Tabatabai <bijan311@gmail.com>
To: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sj@kernel.org,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	joshua.hahnjy@gmail.com,
	bijantabatab@micron.com,
	venkataravis@micron.com,
	emirakhur@micron.com,
	ajayjoshi@micron.com,
	vtavarespetr@micron.com
Subject: [RFC PATCH v3 00/13] mm/damon/vaddr: Allow interleaving in migrate_{hot,cold} actions
Date: Wed,  2 Jul 2025 15:13:23 -0500
Message-ID: <20250702201337.5780-1-bijan311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bijan Tabatabai <bijantabatab@micron.com>

A recent patch set automatically sets the interleave weight for each node
according to the node's maximum bandwidth [1]. In another thread, the patch
set's author, Joshua Hahn, wondered if/how thes weights should be changed
if the bandwidth utilization of the system changes [2].

This patch set adds the mechanism for dynamically changing how application
data is interleaved across nodes while leaving the policy of what the
interleave weights should be to userspace. It does this by having the
migrate_{hot,cold} operating schemes interleave application data according
to the list of migration nodes and weights passed in via the DAMON sysfs
interface. This functionality can be used to dynamically adjust how folios
are interleaved by having a userspace process adjust those weights. If no
specific destination nodes or weights are provided, the migrate_{hot,cold}
actions will only migrate folios to damos->target_nid as before.

The algorithm used to interleave the folios is similar to the one used for
the weighted interleave mempolicy [3]. It uses the offset from which a
folio is mapped into a VMA to determine the node the folio should be placed
in. This method is convenient because for a given set of interleave
weights, a folio has only one valid node it can be placed in, limitng the
amount of unnecessary data movement. However, finding out how a folio is
mapped inside of a VMA requires a costly rmap walk when using a paddr
scheme. As such, we have decided that this functionality makes more sense
as a vaddr scheme [4]. To this end, this patch set also adds vaddr versions
of the migrate_{hot,cold}.

Motivation
==========
There have been prior discussions about how changing the interleave weights
in response to the system's bandwidth utilization can be beneficial [2].
However, currently the interleave weights only are applied when data is
allocated. Migrating already allocated pages according to the dynamically
changing weights will better help balance the bandwidth utilization across
nodes.

As a toy example, imagine some application that uses 75% of the local
bandwidth. Assuming sufficient capacity, when running alone, we want to
keep that application's data in local memory. However, if a second
instance of that application begins, using the same amount of bandwidth,
it would be best to interleave the data of both processes to alleviate the
bandwidth pressure from the local node. Likewise, when one of the processes
ends, the data should be moves back to local memory.

We imagine there would be a userspace application that would monitor system
performance characteristics, such as bandwidth utilization or memory access
latency, and uses that information to tune the interleave weights. Others
seem to have come to a similar conclusion in previous discussions [5].
We are currently working on a userspace program that does this, but it is
not quite ready to be published yet.

After the userspace application tunes the interleave weights, there must be
some mechanism that actually migrates pages to be consistent with those
weights. This patchset is what provides this mechanism.

We believe DAMON is the correct venue for the interleaving mechanism for a
few reasons. First, we noticed that we don't have to migrate all of the
application's pages to improve performance. we just need to migrate the
frequently accessed pages. DAMON's existing hotness traching is very useful
for this. Second, DAMON's quota system can be used to ensure we are not
using too much bandwidth for migrations. Finally, as Ying pointed out [6],
a complete solution must also handle when a memory node is at capacity. The
existing migrate_cold action can be used in conjunction with the
functionality added in this patch set to provide that complete solution.

Functionality Test
==================
Below is an example of this new functionality in use to confirm that these
patches behave as intended.
In this example, the user starts an application, alloc_data, which
allocates 1GB using the default memory policy (i.e. allocate to local
memory) then sleeps. Afterwards, we start DAMON to interleave the data at a
1:1 ratio. Using numastat, we show that DAMON has migrated the
application's data to match the new interleave ratio.
For this example, I modified the userspace damo tool [8] to write to the
migration_dest sysfs files. I plan to upstream these changes when these
patches are merged.
  $ # Allocate the data initially
  $ ./alloc_data 1G &
  [1] 6587
  $ numastat -c -p alloc_data

  Per-node process memory usage (in MBs) for PID 6587 (alloc_data)
           Node 0 Node 1 Total
           ------ ------ -----
  Huge          0      0     0
  Heap          0      0     0
  Stack         0      0     0
  Private    1027      0  1027
  -------  ------ ------ -----
  Total      1027      0  1027
  $ # Start DAMON to interleave data at a 1:1 ratio
  $ cat ./interleave_vaddr.yaml
  kdamonds:
  - contexts:
    - ops: vaddr
      addr_unit: null
      targets:
      - pid: 6587
        regions: []
      intervals:
        sample_us: 500 ms
        aggr_us: 5 s
        ops_update_us: 20 s
        intervals_goal:
          access_bp: 0 %
          aggrs: '0'
          min_sample_us: 0 ns
          max_sample_us: 0 ns
      nr_regions:
        min: '20'
        max: '50'
      schemes:
      - action: migrate_hot
        dests:
        - nid: 0
          weight: 1
        - nid: 1
          weight: 1
        access_pattern:
          sz_bytes:
            min: 0 B
            max: max
          nr_accesses:
            min: 0 %
            max: 100 %
          age:
            min: 0 ns
            max: max
  $ sudo ./damo/damo interleave_vaddr.yaml
  $ # Verify that DAMON has migrated data to match the 1:1 ratio
  $ numastat -c -p alloc_data

  Per-node process memory usage (in MBs) for PID 6587 (alloc_data)
           Node 0 Node 1 Total
           ------ ------ -----
  Huge          0      0     0
  Heap          0      0     0
  Stack         0      0     0
  Private     514    514  1027
  -------  ------ ------ -----
  Total       514    514  1027

Performance Test
================
Below is a simple example showing that interleaving application data using
these patches can improve application performance.
To do this, we run a bandwidth intensive embedding reduction application
[7]. This workload is useful for this test because it reports the time it
takes each iteration to run and each iteration reuses the same allocation,
allowing us to see the benefits of the migration.

We evaluate this on a 128 core/256 thread AMD CPU with 72GB/s of local DDR
bandwidth and 26 GB/s of CXL bandwidth.

Before we start the workload, the system bandwidth utilization is low, so
we start with the interleave weights of 1:0, i.e. allocating all data to
local memory. When the workload beings, it saturates the local bandwidth,
making the page placement suboptimal. To alleviate this, we modify the
interleave weights, triggering DAMON to migrate the workload's data.

We use the same interleave_vaddr.yaml file to setup DAMON, except we
configure it to begin with a 1:0 interleave ratio, and attach it to the
shell and its children processes.

  $ sudo ./damo/damo start interleave_vaddr.yaml --include_child_tasks &
  $ <path>/eval_baseline -d amazon_All -c 255 -r 100
  <clip startup output>
  Eval Phase 3: Running Baseline...
  
  REPEAT # 0 Baseline Total time : 7323.54 ms
  REPEAT # 1 Baseline Total time : 7624.56 ms
  REPEAT # 2 Baseline Total time : 7619.61 ms
  REPEAT # 3 Baseline Total time : 7617.12 ms
  REPEAT # 4 Baseline Total time : 7638.64 ms
  REPEAT # 5 Baseline Total time : 7611.27 ms
  REPEAT # 6 Baseline Total time : 7629.32 ms
  REPEAT # 7 Baseline Total time : 7695.63 ms
  # Interleave weights set to 3:1
  REPEAT # 8 Baseline Total time : 7077.5 ms
  REPEAT # 9 Baseline Total time : 5633.23 ms
  REPEAT # 10 Baseline Total time : 5644.6 ms
  REPEAT # 11 Baseline Total time : 5627.66 ms
  REPEAT # 12 Baseline Total time : 5629.76 ms
  REPEAT # 13 Baseline Total time : 5633.05 ms
  REPEAT # 14 Baseline Total time : 5641.24 ms
  REPEAT # 15 Baseline Total time : 5631.18 ms
  REPEAT # 16 Baseline Total time : 5631.33 ms

Updating the interleave weights and having DAMON migrate the workload data
according to the weights resulted in an approximarely 25% speedup.

Patches Sequence
================
Patches 1-7 extend the DAMON API to specify multiple destination nodes and
weights for the migrate_{hot,cold} actions. These patches are from SJ'S
RFC [8].
Patches 8-10 add a vaddr implementation of the migrate_{hot,cold} schemes.
Patch 11 modifies the vaddr migrate_{hot,cold} schemes to interleave data
according to the weights provided by damos->migrate_dest.
Patches 12-13 allow the vaddr migrate_{hot,cold} implementation to filter
out folios like the paddr version.

Revision History
================
Changes from v2 [9]:
- Implement interleaving using vaddr instead of paddr
- Add vaddr implementation of migrate_{hot,cold}
- Use DAMON specific interleave weights instead of mempolicy weights

Changes from v1 [10]:
- Reuse migrate_{hot,cold} actions instead of creating a new action
- Remove vaddr implementation
- Remove most of the use of mempolicy, instead duplicate the interleave
  logic and access interleave weights directly
- Write more about the use case in the cover letter
- Write about why DAMON was used for this in the cover letter
- Add correctness test to the cover letter
- Add performance test

[1] https://lore.kernel.org/linux-mm/20250520141236.2987309-1-joshua.hahnjy@gmail.com/
[2] https://lore.kernel.org/linux-mm/20250313155705.1943522-1-joshua.hahnjy@gmail.com/
[3] https://elixir.bootlin.com/linux/v6.15.4/source/mm/mempolicy.c#L2015
[4] https://lore.kernel.org/damon/20250624223310.55786-1-sj@kernel.org/
[5] https://lore.kernel.org/linux-mm/20250314151137.892379-1-joshua.hahnjy@gmail.com/
[6] https://lore.kernel.org/linux-mm/87frjfx6u4.fsf@DESKTOP-5N7EMDA/
[7] https://github.com/SNU-ARC/MERCI
[8] https://lore.kernel.org/damon/20250702051558.54138-1-sj@kernel.org/
[9] https://lore.kernel.org/damon/20250620180458.5041-1-bijan311@gmail.com/
[10] https://lore.kernel.org/linux-mm/20250612181330.31236-1-bijan311@gmail.com/

P.S., I will be out of office Thursday until next week Tuesday, so please
forgive any delayed responses.

Bijan Tabatabai (7):
  mm/damon/core: Commit damos->target_nid/migrate_dests
  mm/damon: Move migration helpers from paddr to ops-common
  mm/damon/vaddr: Add vaddr versions of migrate_{hot,cold}
  Docs/mm/damon/design: Document vaddr support for migrate_{hot,cold}
  mm/damon/vaddr: Use damos->migrate_dests in migrate_{hot,cold}
  mm/damon: Move folio filtering from paddr to ops-common
  mm/damon/vaddr: Apply filters in migrate_{hot/cold}

SeongJae Park (6):
  mm/damon: add struct damos_migrate_dests
  mm/damon/core: add damos->migrate_dests field
  mm/damon/sysfs-schemes: implement DAMOS action destinations directory
  mm/damon/sysfs-schemes: set damos->migrate_dests
  Docs/ABI/damon: document schemes dests directory
  Docs/admin-guide/mm/damon/usage: document dests directory

 .../ABI/testing/sysfs-kernel-mm-damon         |  22 ++
 Documentation/admin-guide/mm/damon/usage.rst  |  33 ++-
 Documentation/mm/damon/design.rst             |   4 +-
 include/linux/damon.h                         |  29 +-
 mm/damon/core.c                               |  44 +++
 mm/damon/ops-common.c                         | 270 +++++++++++++++++
 mm/damon/ops-common.h                         |   5 +
 mm/damon/paddr.c                              | 275 +-----------------
 mm/damon/sysfs-schemes.c                      | 253 +++++++++++++++-
 mm/damon/vaddr.c                              | 246 ++++++++++++++++
 10 files changed, 898 insertions(+), 283 deletions(-)

-- 
2.43.5

