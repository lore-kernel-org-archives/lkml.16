Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8262329A327;
	Thu, 12 Jun 2025 18:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749752116; cv=none; b=UGaWES3ZbdxOb198ujEfUCPtwT1VOUT9GcK7LOzUm9zxtjTWcKmm4WXeU6+kfX/KHllIjxrlboJfoCWe2L61ihwe8q7EKHAvpKYdUU6SNiNeics+IAeafK+QzFZLZResFHayEvwyigTa9yX/L18vNwpAdgTv0ZuFre1V/cSZfr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749752116; c=relaxed/simple;
	bh=LuA5TzrXw8UwY+IQG/F7IxJh4SrAKbIGWRkyONKmnbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QGtsB54wuOAxfRfWJA0R1LUt/LmpAApVIU2gZinfN18YVRMPnPj9kbsPPPuDJ2XfG27INURJTPEWKvRqlKgcl2iSwXrpnr9Zj1uSl87DwFr8xlHm5y9g0vUBYPQDA3ZK4TGSe9gJUDE7nHt7NLChnuvjsjHi7BDK+jxk8qdaFMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f0oAbB6C; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f0oAbB6C"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e733e25bfc7so1121147276.3;
        Thu, 12 Jun 2025 11:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749752113; x=1750356913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rI4RhBSsXuuVnpj1aLVVp/cqvhqfeHIgQ1Bp+6ronfs=;
        b=f0oAbB6CQQRakReSJh9DwPxzPgCuwJ+KLRi1L26MYJ/3MDb5pfHb9XOTUnD/TegTBa
         58rF759xHJwN7lNWpI+FVkbxleKirP71ahb9smxRbooTkxiQfDX6woI3WG1A/7i+Zlf2
         Rn4ziizcrnrzmKsmimV/tNAbmzZudul4NlJnf3opO4lGog3R7bKVgHwkrIrDMhMmko7T
         sfB5yxam3A5tePSLSihlQ28F6QJznzDGvHQUm2usu6/fzDs8kfTYq3ke912BFiTBCYoR
         rcyfbApaqHAByXCoUPEPLnh5oKuLFlP2NyLARGDhYo73zFUOvOxKvsWAu7hjRDTyWApd
         VzFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749752113; x=1750356913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rI4RhBSsXuuVnpj1aLVVp/cqvhqfeHIgQ1Bp+6ronfs=;
        b=cElNiYzaGOEjzCX3pGRzS1TtzYUdi4MfDoDqG5VTSK4lf1TNmPoG2q9IN1GSN7r0X+
         q7LuSTgqcpU8S1Cw6BtaSXo6BO9l+F9i5D/Qpw+LUcZb3I6V4mPmE/71WDi4ntgvO/ed
         fSFvNDSZH4kouD4czCkS4XVrHmjVhyewW528hIcmNBFnN//ej8xAddyZbwP+/Idt1fKQ
         gESB9PBo7sW8Fp9nhCaXIiis0cQPvXxYk3DF7QKDrlNlp+eL6l3q4EZohIWIDntuYl86
         cKKOlGAjSlqUyck6uxbC1L5cN5lg/nLLVH1AoVVhxXHptyCKtN6SNrWkyZN2y92S43+u
         rDTw==
X-Forwarded-Encrypted: i=1; AJvYcCV+yd2owgJiyFwsMVjalNAeuXYDs9cbX6PBbJ+80Zi3RQybDhvaJ5PyaV2mz6SK9xN3bwEF/rvr5mo=@vger.kernel.org, AJvYcCWAoIuy2z6i2l6FBUMextUnYwQleW2pseNTierkm+j5MN/cKSnB+Zf7XeZMqWBHPFm7wESrbz7c5I1ea3MH@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9s2+5RBcTm9DmcbaZlYDTVUQr8KJUTYclz/L/mUUe7XrCvIxA
	0G49szeIqzk3NvCpA71xw/w4PDiqRdwobLTZp/PmHqqpbqkmrzmoASP4
X-Gm-Gg: ASbGncs+I3u84oG6Sz/r5cX3vfPViw/IXx7JBq5+xTfzI9DWLnzCf98Mq3cL5OVexDO
	upyZi7/G3OiJIUXypcU41TVKCWGZXrsEH7lVPypqdDptq1fzD5arCH5xRxgyUrTXGEQrsrBzuTb
	T6ZoN8nH9Q6ydwHZcMS1VlSJ9csFFobdXtXOIgbGi88JJa/1iDg7MtniHwmLSYzSiuwhgB6DqVL
	ama/vK9ycgPMLz6IiRMwgOvBF4cyOSguQbLf2JSSr2vfY4KkEtYIrLucuiQ6v47w874lJ9eBsg1
	N7yv1f3sK+QQgy7OWquLmElZwzhffYQ/XsEeCM1C8gI1NLYyx8Cc337M02/ddmqJqu1LF55HJpd
	jHedN5GIfOFBbaOLHfQ==
X-Google-Smtp-Source: AGHT+IFRULeRqZvjiyXhrkg+34BsFqcLiAM8WQUjj7GW8kCxanbKyVwN1t/1QqcXNLvmk8wOV/g/ow==
X-Received: by 2002:a05:6902:220c:b0:e81:d976:ce25 with SMTP id 3f1490d57ef6-e820b64c93cmr6416416276.3.1749752113416;
        Thu, 12 Jun 2025 11:15:13 -0700 (PDT)
Received: from bijan-laptop.attlocal.net ([2600:1700:680e:c000:dd1b:d4ae:15de:11db])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e820e312452sm592480276.40.2025.06.12.11.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 11:15:13 -0700 (PDT)
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
Subject: [RFC PATCH 2/4] mm/damon/paddr: Add DAMOS_INTERLEAVE action
Date: Thu, 12 Jun 2025 13:13:28 -0500
Message-ID: <20250612181330.31236-3-bijan311@gmail.com>
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

This patch adds the DAMOS_INTERLEAVE action.
It interleaves pages inside of a given region according to the weights
in the iw_table. To reuse existing interleaving code, the target nid for
a folio is determined by calling policy_nodemask, therefore only folios
belonging to processes using the MPOL_WEIGHTED_INTERLEAVE policy will
have their pages migrated.

Below is an example of its usage where pages are initially interleaved at
a 1:1 ratio and then changed to be interleaved at a 2:1 ratio. The
alloc_data program simply allocates 1GB of data then sleeps.
  $ cd /sys/kernel/mm/damon/admin/kdamonds/0
  $ sudo cat ./contexts/0/schemes/0/action
  interleave
  $ echo 1 | sudo tee /sys/kernel/mm/mempolicy/weighted_interleave/node0
  $ echo 1 | sudo tee /sys/kernel/mm/mempolicy/weighted_interleave/node1
  $ numactl -w 0,1 ~/alloc_data 1G &
  $ numastat -c -p alloc_data

  Per-node process memory usage (in MBs) for PID 18473 (alloc_data)
           Node 0 Node 1 Total
           ------ ------ -----
  Huge          0      0     0
  Heap          0      0     0
  Stack         0      0     0
  Private     514    514  1027
  -------  ------ ------ -----
  Total       514    514  1028
  $ echo 2 | sudo tee /sys/kernel/mm/mempolicy/weighted_interleave/node0
  $ numastat -c -p alloc_data

  Per-node process memory usage (in MBs) for PID 18473 (alloc_data)
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
 Documentation/mm/damon/design.rst |   2 +
 include/linux/damon.h             |   2 +
 mm/damon/paddr.c                  | 112 ++++++++++++++++++++++++++++++
 mm/damon/sysfs-schemes.c          |   1 +
 4 files changed, 117 insertions(+)

diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/design.rst
index ddc50db3afa4..c50d2105cea0 100644
--- a/Documentation/mm/damon/design.rst
+++ b/Documentation/mm/damon/design.rst
@@ -455,6 +455,8 @@ that supports each action are as below.
    Supported by ``paddr`` operations set.
  - ``migrate_cold``: Migrate the regions prioritizing colder regions.
    Supported by ``paddr`` operations set.
+ - ``interleave``: Interleave the regions according to the weighted interleave weights.
+   Supported by ``paddr`` operations set.
  - ``stat``: Do nothing but count the statistics.
    Supported by all operations sets.
 
diff --git a/include/linux/damon.h b/include/linux/damon.h
index a4011726cb3b..81d26a203337 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -117,6 +117,7 @@ struct damon_target {
  * @DAMOS_LRU_DEPRIO:	Deprioritize the region on its LRU lists.
  * @DAMOS_MIGRATE_HOT:  Migrate the regions prioritizing warmer regions.
  * @DAMOS_MIGRATE_COLD:	Migrate the regions prioritizing colder regions.
+ * @DAMOS_INTERLEAVE: Interleave the regions by the weighted interleave ratio
  * @DAMOS_STAT:		Do nothing but count the stat.
  * @NR_DAMOS_ACTIONS:	Total number of DAMOS actions
  *
@@ -136,6 +137,7 @@ enum damos_action {
 	DAMOS_LRU_DEPRIO,
 	DAMOS_MIGRATE_HOT,
 	DAMOS_MIGRATE_COLD,
+	DAMOS_INTERLEAVE,
 	DAMOS_STAT,		/* Do nothing but only record the stat */
 	NR_DAMOS_ACTIONS,
 };
diff --git a/mm/damon/paddr.c b/mm/damon/paddr.c
index 4102a8c5f992..e989464635cd 100644
--- a/mm/damon/paddr.c
+++ b/mm/damon/paddr.c
@@ -535,6 +535,114 @@ static unsigned long damon_pa_migrate(struct damon_region *r, struct damos *s,
 	return applied * PAGE_SIZE;
 }
 
+#if defined(CONFIG_MEMCG) && defined(CONFIG_NUMA)
+struct damos_interleave_private {
+	struct list_head *folio_migration_list;
+	bool putback_lru;
+};
+
+static bool damon_pa_interleave_rmap(struct folio *folio, struct vm_area_struct *vma,
+		unsigned long addr, void *arg)
+{
+	struct mempolicy *pol;
+	struct task_struct *task;
+	pgoff_t ilx;
+	int target_nid;
+	struct damos_interleave_private *priv = arg;
+
+	task = rcu_dereference(vma->vm_mm->owner);
+	if (!task)
+		return true;
+
+	pol = get_task_policy(task);
+	if (!pol)
+		return true;
+
+	/* Getting the interleave weights only makes sense with MPOL_WEIGHTED_INTERLEAVE */
+	if (pol->mode != MPOL_WEIGHTED_INTERLEAVE) {
+		mpol_cond_put(pol);
+		return true;
+	}
+
+	ilx = vma->vm_pgoff >> folio_order(folio);
+	ilx += (addr - vma->vm_start) >> (PAGE_SHIFT + folio_order(folio));
+	policy_nodemask(0, pol, ilx, &target_nid);
+
+	if (target_nid != NUMA_NO_NODE && folio_nid(folio) != target_nid) {
+		list_add(&folio->lru, &priv->folio_migration_list[target_nid]);
+		priv->putback_lru = false;
+	}
+
+	mpol_cond_put(pol);
+	return false;
+}
+
+static unsigned long damon_pa_interleave(struct damon_region *r, struct damos *s,
+		unsigned long *sz_filter_passed)
+{
+	struct damos_interleave_private priv;
+	struct rmap_walk_control rwc;
+	unsigned long addr, applied;
+	struct folio *folio;
+
+	priv.folio_migration_list = kmalloc_array(nr_node_ids, sizeof(struct list_head),
+		GFP_KERNEL);
+	if (!priv.folio_migration_list)
+		return 0;
+
+	for (int i = 0; i < nr_node_ids; i++)
+		INIT_LIST_HEAD(&priv.folio_migration_list[i]);
+
+	memset(&rwc, 0, sizeof(struct rmap_walk_control));
+	rwc.rmap_one = damon_pa_interleave_rmap;
+	rwc.arg = &priv;
+
+	addr = r->ar.start;
+	while (addr < r->ar.end) {
+		folio = damon_get_folio(PHYS_PFN(addr));
+
+		if (damon_pa_invalid_damos_folio(folio, s)) {
+			addr += PAGE_SIZE;
+			continue;
+		}
+
+		if (damos_pa_filter_out(s, folio))
+			goto put_folio;
+		else
+			*sz_filter_passed += folio_size(folio);
+
+		if (!folio_isolate_lru(folio))
+			goto put_folio;
+
+		priv.putback_lru = true;
+		rmap_walk(folio, &rwc);
+
+		if (priv.putback_lru)
+			folio_putback_lru(folio);
+
+put_folio:
+		addr += folio_size(folio);
+		folio_put(folio);
+	}
+
+	applied = 0;
+	for (int i = 0; i < nr_node_ids; i++) {
+		applied += damon_pa_migrate_pages(&priv.folio_migration_list[i], i);
+		cond_resched();
+	}
+
+	kfree(priv.folio_migration_list);
+	s->last_applied = folio;
+	return applied * PAGE_SIZE;
+}
+#else
+static unsigned long damon_pa_interleave(struct damon_region *r, struct damos *s,
+		unsigned long *sz_filter_passed)
+{
+	return 0;
+}
+#endif /* defined(CONFIG_MEMCG) && defined(CONFIG_NUMA) */
+
 static bool damon_pa_scheme_has_filter(struct damos *s)
 {
 	struct damos_filter *f;
@@ -584,6 +692,8 @@ static unsigned long damon_pa_apply_scheme(struct damon_ctx *ctx,
 	case DAMOS_MIGRATE_HOT:
 	case DAMOS_MIGRATE_COLD:
 		return damon_pa_migrate(r, scheme, sz_filter_passed);
+	case DAMOS_INTERLEAVE:
+		return damon_pa_interleave(r, scheme, sz_filter_passed);
 	case DAMOS_STAT:
 		return damon_pa_stat(r, scheme, sz_filter_passed);
 	default:
@@ -608,6 +718,8 @@ static int damon_pa_scheme_score(struct damon_ctx *context,
 		return damon_hot_score(context, r, scheme);
 	case DAMOS_MIGRATE_COLD:
 		return damon_cold_score(context, r, scheme);
+	case DAMOS_INTERLEAVE:
+		return damon_hot_score(context, r, scheme);
 	default:
 		break;
 	}
diff --git a/mm/damon/sysfs-schemes.c b/mm/damon/sysfs-schemes.c
index 0f6c9e1fec0b..12a32e066d06 100644
--- a/mm/damon/sysfs-schemes.c
+++ b/mm/damon/sysfs-schemes.c
@@ -1597,6 +1597,7 @@ static const char * const damon_sysfs_damos_action_strs[] = {
 	"lru_deprio",
 	"migrate_hot",
 	"migrate_cold",
+	"interleave",
 	"stat",
 };
 
-- 
2.43.5

