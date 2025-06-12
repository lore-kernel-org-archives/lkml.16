Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EAC1A3154;
	Thu, 12 Jun 2025 18:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749752134; cv=none; b=X5RX2NUoReX5KF8kJzjlrrD60hqJcHzNMChZT4nRAaLYNGZg0hcU3yymBeXaoxG3GCVKkj7cbCdMs0QrS8LKPelNd9hu5gE+BzyupE/eCJ1S6qMGorAAohma6pnzta0Ndble8VGZLvQoQoGnW7XGSHZbaN4UOo9bk1a+/MKR+eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749752134; c=relaxed/simple;
	bh=vj2LbrYA9jkg17qAZiV25qjeVHmAcoe1KQIetmpaIQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gynzwTbXjWlt9/Sv32wjrGcei1GFBW7fnNE3wMhxW7vpWwYYqn/jv5WmkZzJwGBKNm43NNKh5Fx8rj511D+clMB8blA+jZJgxdFhLEUihh3ZUXeq8sejfeFnLe4M9m9Zfv/F+xmIhAlX+9olfkWcY7ftLH547rSUfNJmhlvWf34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSUhBZg3; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSUhBZg3"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e7b4ba530feso1115182276.1;
        Thu, 12 Jun 2025 11:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749752131; x=1750356931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJgUDGFlTqLrMXyweY6vXETHiIGKHN448RSe2G/RQd4=;
        b=GSUhBZg3FLX0/Ej/Q+swaM7fATpS2iObtFTBatP3FFwVjJAIyOF0N7GmGewzNMX4sV
         GRQsK+wqNVUAFGFDpRB+udxVRmE8kdsnr5OkHP2lQ5moaid85/FlZVL2mdZn8XD1WlQM
         H8D9ZNsNfC6JAonbhMMuKV4wi+10kwiH75kmJX0XOCBqwRbwxp0YsrXXjFp7EvKMCczb
         KsUAoaePw5Z4AGAgfwS0jJBwSvc0V2sg8UwiMktxuxqmJD1P68TD+OKPt8EJd8fEYZip
         wdLur6t5MLja3s/3PIcEhwy0n4r+UMqquXBxPmou6fcDklHcW5uq0pAxbOyr6kljCn9u
         AMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749752131; x=1750356931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yJgUDGFlTqLrMXyweY6vXETHiIGKHN448RSe2G/RQd4=;
        b=X0qs60JOOIGvkeGS4nzQLOQf3n+2L7gz8fCMYPZaVOT3fy2HOd9bHLQDACPcgOIdEv
         p7uHdyX/BygkzU2qh8cc69MLUZsp4u9OX58mK7qxPTM+01ruk8DMaa7OUzI6U6BBUeQF
         Wyngf1Q4EVVl0dK8MxzyS2doJNYMHw7utZq20ejOrfjNxNoWqj1c+hjn2Ro3xcDh8FHQ
         lRWMXGRHdB48tGq3v+U15hRxF2EM1ftyjVq5uUqjQA69USFvn0tdDI7JWWXqlZtxWLzd
         1isWMbW0VYpoYYG0fBX0cMsIJDXDjIgSCzAZyOutWraQ03DkAj76nfzWb1Sh34tSS6t2
         CPyA==
X-Forwarded-Encrypted: i=1; AJvYcCUy0BhP2k6HIQVRXvuuuzbkuzw5iJp5BRMIj5sQWP2Bn9H7U4yG6B7b/Bkv5v3VtRiMNcdVTte4zHQpANQU@vger.kernel.org, AJvYcCWAkCwXXqreix8wfvUhVojIpK4LBPm4IRTxjuWyG9Z9pHMOcFTWPZZXy2AjqsYaQm8utkjJDxhfh2M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9zpn5DdShCq45HUiDMNcvEp0NzpdD9LthSz/vrPs6Z+YlEsvE
	qIY4EydKwgcBm5jTKMoni2g8/4MaMezqxL6hAlKP1crmQOs9zHJCYeGh
X-Gm-Gg: ASbGncsNUR7CI/QKzJvmGmQT7D3b6lombwLnypqb9vS+avTNKbU+GhL63lFQdm6EPBs
	noKw8HtdEScdURtO/Zs6uu1SKKlwSZ9+jyJPSuhvpKuDJR3aY6iHetVHN88XFMIdyhSb6RskQQR
	0ftUzpMmo5g4vSAAOSZfqFEMuZXQSlwC7OpGW8fKTLF6aFHJrMl9RQqL4l+C3Z13I/bmVHypbl6
	LeY/fjtSvsZi2uzX6re8TCggR0yYaV9YdVTD5IcinqaGu52A3rw2atH4UPrqXh/MfsOnnMajz1t
	5PWhtjZiWx0w6qrW1ilY0zHquUug7aCSxeNPT3YXG94wkVkCKRvbA+G+vydfdgLiDGjPIU9Zk/g
	XGSRsmbY=
X-Google-Smtp-Source: AGHT+IGmai82U6it5jDvpRdZAOh/erEuNSBZ/HFRj2fOcXstR7G50ztztivaNFHDIHN9lND4uANkQQ==
X-Received: by 2002:a05:6902:4790:b0:e7d:d162:f15a with SMTP id 3f1490d57ef6-e820b719f47mr6337384276.40.1749752131219;
        Thu, 12 Jun 2025 11:15:31 -0700 (PDT)
Received: from bijan-laptop.attlocal.net ([2600:1700:680e:c000:dd1b:d4ae:15de:11db])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e820e312452sm592480276.40.2025.06.12.11.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 11:15:30 -0700 (PDT)
From: Bijan Tabatabai <bijan311@gmail.com>
To: damon@lists.linux.com,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: sj@kernel.org,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	david@redhat.com,
	ziy@nvidia.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	bijantabatab@micron.com,
	venkataravis@micron.com,
	emirakhur@micron.com,
	ajayjoshi@micron.com,
	vtavarespetr@micron.com
Subject: [RFC PATCH 4/4] mm/damon/vaddr: Add vaddr version of DAMOS_INTERLEAVE
Date: Thu, 12 Jun 2025 13:13:30 -0500
Message-ID: <20250612181330.31236-5-bijan311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250612181330.31236-1-bijan311@gmail.com>
References: <20250612181330.31236-1-bijan311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bijan Tabatabai <bijantabatab@micron.com>

This patch adds a vaddr implementation of the DAMOS_INTERLEAVE action.

Below is an example of its usage where pages are initially interleaved at
a 1:1 ratio and then changed to be interleaved at a 2:1 ratio. The
alloc_data program simply allocates 1GB of data then sleeps.
  $ echo 1 | sudo tee /sys/kernel/mm/mempolicy/weighted_interleave/node0
  $ echo 1 | sudo tee /sys/kernel/mm/mempolicy/weighted_interleave/node1
  $ numactl -w 0,1 ./alloc_data 1G&
  [1] 11447
  $ cat interleave_vaddr.yaml
  kdamonds:
  - state: null
    pid: null
    contexts:
    - ops: vaddr
      targets:
      - pid: 11447
        regions: []
      intervals:
        sample_us: 200 ms
        aggr_us: 5 s
        ops_update_us: 10 s
      nr_regions:
        min: 200
        max: 500
      schemes:
      - action: interleave
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

  $ sudo ./damo/damo start interleave_vaddr.yaml
  $ numastat -c -p 11447

  Per-node process memory usage (in MBs) for PID 11447 (alloc_data)
           Node 0 Node 1 Total
           ------ ------ -----
  Huge          0      0     0
  Heap          0      0     0
  Stack         0      0     0
  Private     514    514  1027
  -------  ------ ------ -----
  Total       514    514  1027
  $ echo 2 | sudo tee /sys/kernel/mm/mempolicy/weighted_interleave/node0
  $ numastat -c -p 11447

  Per-node process memory usage (in MBs) for PID 11447 (alloc_data)
           Node 0 Node 1 Total
           ------ ------ -----
  Huge          0      0     0
  Heap          0      0     0
  Stack         0      0     0
  Private     684    343  1027
  -------  ------ ------ -----
  Total       684    343  1027

Signed-off-by: Bijan Tabatabai <bijantabatab@micron.com>
---
 Documentation/mm/damon/design.rst |   2 +-
 mm/damon/ops-common.c             |  13 +++
 mm/damon/ops-common.h             |   2 +
 mm/damon/paddr.c                  |  11 +--
 mm/damon/vaddr.c                  | 135 ++++++++++++++++++++++++++++++
 5 files changed, 155 insertions(+), 8 deletions(-)

diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/design.rst
index c50d2105cea0..a79ba62f820b 100644
--- a/Documentation/mm/damon/design.rst
+++ b/Documentation/mm/damon/design.rst
@@ -456,7 +456,7 @@ that supports each action are as below.
  - ``migrate_cold``: Migrate the regions prioritizing colder regions.
    Supported by ``paddr`` operations set.
  - ``interleave``: Interleave the regions according to the weighted interleave weights.
-   Supported by ``paddr`` operations set.
+   Supported by ``vaddr``, ``fvaddr`` and ``paddr`` operations set.
  - ``stat``: Do nothing but count the statistics.
    Supported by all operations sets.
 
diff --git a/mm/damon/ops-common.c b/mm/damon/ops-common.c
index 2c4fb274b7f6..59d92404fc8f 100644
--- a/mm/damon/ops-common.c
+++ b/mm/damon/ops-common.c
@@ -261,3 +261,16 @@ unsigned long damon_migrate_pages(struct list_head *folio_list,
 
 	return nr_migrated;
 }
+
+int damon_interleave_target_nid(unsigned long addr, struct vm_area_struct *vma,
+		struct mempolicy *pol, struct folio *folio)
+{
+	pgoff_t ilx;
+	int target_nid;
+
+	ilx = vma->vm_pgoff >> folio_order(folio);
+	ilx += (addr - vma->vm_start) >> (PAGE_SHIFT + folio_order(folio));
+	policy_nodemask(0, pol, ilx, &target_nid);
+
+	return target_nid;
+}
diff --git a/mm/damon/ops-common.h b/mm/damon/ops-common.h
index 54209a7e70e6..bacb4de92dc9 100644
--- a/mm/damon/ops-common.h
+++ b/mm/damon/ops-common.h
@@ -18,3 +18,5 @@ int damon_hot_score(struct damon_ctx *c, struct damon_region *r,
 			struct damos *s);
 
 unsigned long damon_migrate_pages(struct list_head *folio_list, int target_nid);
+int damon_interleave_target_nid(unsigned long addr, struct vm_area_struct *vma,
+			struct mempolicy *pol, struct folio *folio);
diff --git a/mm/damon/paddr.c b/mm/damon/paddr.c
index 722d69f26e37..93e3c72b54c7 100644
--- a/mm/damon/paddr.c
+++ b/mm/damon/paddr.c
@@ -415,7 +415,7 @@ static unsigned long damon_pa_migrate(struct damon_region *r, struct damos *s,
 }
 
 #if defined(CONFIG_MEMCG) && defined(CONFIG_NUMA)
-struct damos_interleave_private {
+struct damos_pa_interleave_private {
 	struct list_head *folio_migration_list;
 	bool putback_lru;
 };
@@ -425,9 +425,8 @@ static bool damon_pa_interleave_rmap(struct folio *folio, struct vm_area_struct
 {
 	struct mempolicy *pol;
 	struct task_struct *task;
-	pgoff_t ilx;
 	int target_nid;
-	struct damos_interleave_private *priv = arg;
+	struct damos_pa_interleave_private *priv = arg;
 
 	task = rcu_dereference(vma->vm_mm->owner);
 	if (!task)
@@ -443,9 +442,7 @@ static bool damon_pa_interleave_rmap(struct folio *folio, struct vm_area_struct
 		return true;
 	}
 
-	ilx = vma->vm_pgoff >> folio_order(folio);
-	ilx += (addr - vma->vm_start) >> (PAGE_SHIFT + folio_order(folio));
-	policy_nodemask(0, pol, ilx, &target_nid);
+	target_nid = damon_interleave_target_nid(addr, vma, pol, folio);
 
 	if (target_nid != NUMA_NO_NODE && folio_nid(folio) != target_nid) {
 		list_add(&folio->lru, &priv->folio_migration_list[target_nid]);
@@ -459,7 +456,7 @@ static bool damon_pa_interleave_rmap(struct folio *folio, struct vm_area_struct
 static unsigned long damon_pa_interleave(struct damon_region *r, struct damos *s,
 		unsigned long *sz_filter_passed)
 {
-	struct damos_interleave_private priv;
+	struct damos_pa_interleave_private priv;
 	struct rmap_walk_control rwc;
 	unsigned long addr, applied;
 	struct folio *folio;
diff --git a/mm/damon/vaddr.c b/mm/damon/vaddr.c
index 46554e49a478..1d1170f49317 100644
--- a/mm/damon/vaddr.c
+++ b/mm/damon/vaddr.c
@@ -9,12 +9,14 @@
 
 #include <linux/highmem.h>
 #include <linux/hugetlb.h>
+#include <linux/mempolicy.h>
 #include <linux/mman.h>
 #include <linux/mmu_notifier.h>
 #include <linux/page_idle.h>
 #include <linux/pagewalk.h>
 #include <linux/sched/mm.h>
 
+#include "../internal.h"
 #include "ops-common.h"
 
 #ifdef CONFIG_DAMON_VADDR_KUNIT_TEST
@@ -653,6 +655,137 @@ static unsigned long damos_madvise(struct damon_target *target,
 }
 #endif	/* CONFIG_ADVISE_SYSCALLS */
 
+#ifdef CONFIG_NUMA
+struct damos_va_interleave_private {
+	struct list_head *folio_migration_list;
+	struct mempolicy *pol;
+};
+
+static void damos_va_interleave_folio(unsigned long addr, struct folio *folio,
+	struct vm_area_struct *vma, struct damos_va_interleave_private *priv)
+{
+	int target_nid;
+
+	if (!folio_isolate_lru(folio))
+		return;
+
+	target_nid = damon_interleave_target_nid(addr, vma, priv->pol, folio);
+
+	if (target_nid != NUMA_NO_NODE && folio_nid(folio) != target_nid)
+		list_add(&folio->lru, &priv->folio_migration_list[target_nid]);
+	else
+		folio_putback_lru(folio);
+
+}
+
+static int damos_va_interleave_pmd(pmd_t *pmd, unsigned long addr,
+		unsigned long next, struct mm_walk *walk)
+{
+	struct damos_va_interleave_private *priv = walk->private;
+	struct folio *folio;
+	spinlock_t *ptl;
+	pmd_t pmde;
+
+	ptl = pmd_lock(walk->mm, pmd);
+	pmde = pmdp_get(pmd);
+
+	if (!pmd_present(pmde) || !pmd_trans_huge(pmde))
+		goto unlock;
+
+	folio = damon_get_folio(pmd_pfn(pmde));
+	if (!folio)
+		goto unlock;
+
+	damos_va_interleave_folio(addr, folio, walk->vma, priv);
+
+	folio_put(folio);
+unlock:
+	spin_unlock(ptl);
+	return 0;
+}
+
+static int damos_va_interleave_pte(pte_t *pte, unsigned long addr,
+		unsigned long next, struct mm_walk *walk)
+{
+	struct damos_va_interleave_private *priv = walk->private;
+	struct folio *folio;
+
+	if (pte_none(*pte) || !pte_present(*pte))
+		return 0;
+
+	folio = vm_normal_folio(walk->vma, addr, *pte);
+	if (!folio)
+		return 0;
+	folio_get(folio);
+
+	damos_va_interleave_folio(addr, folio, walk->vma, priv);
+
+	folio_put(folio);
+	return 0;
+}
+
+static unsigned long damos_va_interleave(struct damon_target *target,
+		struct damon_region *r, struct damos *s)
+{
+	struct damos_va_interleave_private priv;
+	struct task_struct *task;
+	struct mm_struct *mm;
+	int ret;
+	unsigned long applied = 0;
+	struct mm_walk_ops walk_ops = {
+		.pmd_entry = damos_va_interleave_pmd,
+		.pte_entry = damos_va_interleave_pte,
+	};
+
+	task = damon_get_task_struct(target);
+	if (!task)
+		return 0;
+
+	priv.pol = get_task_policy(task);
+	if (!priv.pol)
+		goto put_task;
+
+	if (priv.pol->mode != MPOL_WEIGHTED_INTERLEAVE)
+		goto put_pol;
+
+	priv.folio_migration_list = kmalloc_array(nr_node_ids, sizeof(struct list_head),
+		GFP_KERNEL);
+	if (!priv.folio_migration_list)
+		goto put_pol;
+
+	for (int i = 0; i < nr_node_ids; i++)
+		INIT_LIST_HEAD(&priv.folio_migration_list[i]);
+
+	mm = damon_get_mm(target);
+	if (!mm)
+		goto free_folio_list;
+
+	mmap_read_lock(mm);
+	ret = walk_page_range(mm, r->ar.start, r->ar.end, &walk_ops, &priv);
+	mmap_read_unlock(mm);
+	mmput(mm);
+
+	for (int i = 0; i < nr_node_ids; i++) {
+		applied += damon_migrate_pages(&priv.folio_migration_list[i], i);
+		cond_resched();
+	}
+
+free_folio_list:
+	kfree(priv.folio_migration_list);
+put_pol:
+	mpol_cond_put(priv.pol);
+put_task:
+	put_task_struct(task);
+	return applied * PAGE_SIZE;
+}
+#else
+static unsigned long damos_va_interleave(struct damon_target *target,
+		struct damon_region *r, struct damos *s)
+{
+	return 0;
+}
+#endif /* CONFIG_NUMA */
+
 static unsigned long damon_va_apply_scheme(struct damon_ctx *ctx,
 		struct damon_target *t, struct damon_region *r,
 		struct damos *scheme, unsigned long *sz_filter_passed)
@@ -675,6 +808,8 @@ static unsigned long damon_va_apply_scheme(struct damon_ctx *ctx,
 	case DAMOS_NOHUGEPAGE:
 		madv_action = MADV_NOHUGEPAGE;
 		break;
+	case DAMOS_INTERLEAVE:
+		return damos_va_interleave(t, r, scheme);
 	case DAMOS_STAT:
 		return 0;
 	default:
-- 
2.43.5

