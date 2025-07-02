Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70308315538;
	Wed,  2 Jul 2025 20:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751487306; cv=none; b=K/QpoMCGmP+LT+TwoySk2drAEp7g+UiF8q3/LDJxpxjKxb8ZxPv//JwZ8fOSKQ1gBlZAVpsVw7n1LLYdIqiy7j+MUSbofcPbU/8y7L3C9J0UyfkKCMhI2m+QzPFsBeZRItoGEuOpmE3Wz0A93p7NdWRoQ4Gg6kjv4ZaEP9UkpE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751487306; c=relaxed/simple;
	bh=grkq1k7ZCl4I+T+IgPaviet0IWCAb1IC3dO4Q0rvbR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZcvNWd27RYdWOCxy0etCeIsigffXLxH+jckTL8FhaFw0s3adbZNLkUoK+W3mc5vJ8Y3ohDanqPr5M3yJqp/j9QUADHt40ukul2q3nUNhecHAuCo6i5wRX/io2ZaA0uwKya4vvrEyTm6KtymATY6dVwBYQ9AZZjdCs+dpQAIkJsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CbtTzssE; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CbtTzssE"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e740a09eb00so3830484276.0;
        Wed, 02 Jul 2025 13:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751487303; x=1752092103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oiZANFhzMVZOSV0URi2HW3PqK+ggIehph8dgAXp+7Gc=;
        b=CbtTzssEYWiqMD5dTsNxA14g31hYKki8FjrSKoQdU2vmiNsUsmP/RZb+iuUJIaTqIR
         J5Y8lFEFV7yolc4O0DMUjm9ApdrJwy7kouXS8qmAcfNWVkzXV8eQrCU9vNzgsQpVq2nF
         UHAyTZrDK/GZI32j7E2qh92zu8RjSNhLM1FKuN5keN/RMpSaYVY3QHFmjq3nAgjodCAV
         1OueF106e25YP4RCvOco53EkIQ+LTZfCuUyh8STvWO3a8LsPtBhYFIAWEkXejRLZa27e
         yNBa9RSyLDu2UjXByG4h8LNmVqS51artu6SvoeQcvLhwLVC4/yPdRbIcdijhf08Oro4y
         TDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751487303; x=1752092103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oiZANFhzMVZOSV0URi2HW3PqK+ggIehph8dgAXp+7Gc=;
        b=IcHIYfFMU10HFIHQMnB3urS/j5/zjGmL7IHi+rSY90ONecN8HmAvEud55mX3LXgASH
         HQzZJyL2RMWcziYYVrPjz1yZCJidDKfgVvveCERIE2qVgpN0pL+gbDOC8eRT8KNCCiLv
         RPLCaaMp83WquEZRd+FNQtHUEEyO/TpYK1r8XpSG/FNNKBNEkbTuMwcQIo28dH81yhx5
         IrFZRABeBHsGuvvqzFeGJ7fwLiVSQkKGYdWHZcNzaykBjzHgev5pSIGKHrStNyxQ1a8l
         idhgX697clX/JZqj4u3c/HSCB50Ks0b/k9gIloYNNwdbLCjs8NZwao3ggW+zGh1OeyC1
         qw3A==
X-Forwarded-Encrypted: i=1; AJvYcCU59xGilYaFPl07N1CQ1b8gGHgqOpg/AGzLuxhyR2px4IPluU1EZbqn9AGcWE15gsbcdMTQr6duNvI=@vger.kernel.org, AJvYcCXflTnQjM9X3jNWg1sWfpKosMqd/O7ttvfLcdef75cEqDZM9aBBJ2Iq4cd/3wezDU9BAxxgSvR4sZFhbIYo@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4RREZ79NGUm21029/h3dXegMHQb1cYB0lTPx+wKYhe0T/FGoN
	y0XeQfVbIn8KQynXcIenx5jHf+A8M8ya2QEoa/1g0jsPxR6Aeuh2P0dSyRcbsxVYwZU=
X-Gm-Gg: ASbGncvA8HqzSa4UFCE/v8LKNCEy/BqaYzkGPw5cIJ4X6rh3OpBNH4btWQxH4SjWmjZ
	IjBigAesGGLTCAwl8nX7OYvhoIUHJXEw6DzDU2/2kmmWsnp9VNUucnvoI7lMHNZA7tdVkimwyaV
	TIgeWOs9xa0EkkVR+lGSvMFL7yPBMeMW5KMEROd9a6Dc5z/y4512Y1if4iMj+rZvTAG5o1isoMv
	Evc/rQMs3TunXL+IQcjFBq4C+eu1nifRJb4z5GtQYVeF8qrNZ9fllhDkOUc7icF+vKfv8zSLRx5
	9B9NydsswtyMxnrpw6PrEQ2kNEZF34MXnykF5FIMJhr/yqwCoK58JjjnjkFv1BBCoyBrlpgNw8o
	3dnHEUwo=
X-Google-Smtp-Source: AGHT+IGXljG5fdV2UV7d/ojq16hPZdWQ6hJouShkJiIdv6pbB0txRRUWvUoz7wZX8friaN7DEPp3vw==
X-Received: by 2002:a05:690c:11:b0:712:d473:b802 with SMTP id 00721157ae682-7164d40a305mr64256017b3.18.1751487303270;
        Wed, 02 Jul 2025 13:15:03 -0700 (PDT)
Received: from bijan-laptop.attlocal.net ([2600:1700:680e:c000:873e:8f35:7cd8:3fe3])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71515cb4347sm26124157b3.83.2025.07.02.13.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 13:15:02 -0700 (PDT)
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
	vtavarespetr@micron.com,
	Ravi Shankar Jonnalagadda <ravis.opensrc@micron.com>
Subject: [RFC PATCH v3 12/13] mm/damon: Move folio filtering from paddr to ops-common
Date: Wed,  2 Jul 2025 15:13:35 -0500
Message-ID: <20250702201337.5780-13-bijan311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702201337.5780-1-bijan311@gmail.com>
References: <20250702201337.5780-1-bijan311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bijan Tabatabai <bijantabatab@micron.com>

This patch moves damos_pa_filter_match and the functions it calls to
ops-common, renaming it to damos_folio_filter_match. Doing so allows us
to share the filtering logic for the vaddr version of the
migrate_{hot,cold} schemes.

Co-developed-by: Ravi Shankar Jonnalagadda <ravis.opensrc@micron.com>
Signed-off-by: Ravi Shankar Jonnalagadda <ravis.opensrc@micron.com>
Signed-off-by: Bijan Tabatabai <bijantabatab@micron.com>
---
 mm/damon/ops-common.c | 150 +++++++++++++++++++++++++++++++++++++++++
 mm/damon/ops-common.h |   3 +
 mm/damon/paddr.c      | 153 +-----------------------------------------
 3 files changed, 154 insertions(+), 152 deletions(-)

diff --git a/mm/damon/ops-common.c b/mm/damon/ops-common.c
index 918158ef3d99..6a9797d1d7ff 100644
--- a/mm/damon/ops-common.c
+++ b/mm/damon/ops-common.c
@@ -141,6 +141,156 @@ int damon_cold_score(struct damon_ctx *c, struct damon_region *r,
 	return DAMOS_MAX_SCORE - hotness;
 }
 
+static bool damon_folio_mkold_one(struct folio *folio,
+		struct vm_area_struct *vma, unsigned long addr, void *arg)
+{
+	DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, addr, 0);
+
+	while (page_vma_mapped_walk(&pvmw)) {
+		addr = pvmw.address;
+		if (pvmw.pte)
+			damon_ptep_mkold(pvmw.pte, vma, addr);
+		else
+			damon_pmdp_mkold(pvmw.pmd, vma, addr);
+	}
+	return true;
+}
+
+void damon_folio_mkold(struct folio *folio)
+{
+	struct rmap_walk_control rwc = {
+		.rmap_one = damon_folio_mkold_one,
+		.anon_lock = folio_lock_anon_vma_read,
+	};
+	bool need_lock;
+
+	if (!folio_mapped(folio) || !folio_raw_mapping(folio)) {
+		folio_set_idle(folio);
+		return;
+	}
+
+	need_lock = !folio_test_anon(folio) || folio_test_ksm(folio);
+	if (need_lock && !folio_trylock(folio))
+		return;
+
+	rmap_walk(folio, &rwc);
+
+	if (need_lock)
+		folio_unlock(folio);
+
+}
+
+static bool damon_folio_young_one(struct folio *folio,
+		struct vm_area_struct *vma, unsigned long addr, void *arg)
+{
+	bool *accessed = arg;
+	DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, addr, 0);
+	pte_t pte;
+
+	*accessed = false;
+	while (page_vma_mapped_walk(&pvmw)) {
+		addr = pvmw.address;
+		if (pvmw.pte) {
+			pte = ptep_get(pvmw.pte);
+
+			/*
+			 * PFN swap PTEs, such as device-exclusive ones, that
+			 * actually map pages are "old" from a CPU perspective.
+			 * The MMU notifier takes care of any device aspects.
+			 */
+			*accessed = (pte_present(pte) && pte_young(pte)) ||
+				!folio_test_idle(folio) ||
+				mmu_notifier_test_young(vma->vm_mm, addr);
+		} else {
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+			*accessed = pmd_young(pmdp_get(pvmw.pmd)) ||
+				!folio_test_idle(folio) ||
+				mmu_notifier_test_young(vma->vm_mm, addr);
+#else
+			WARN_ON_ONCE(1);
+#endif	/* CONFIG_TRANSPARENT_HUGEPAGE */
+		}
+		if (*accessed) {
+			page_vma_mapped_walk_done(&pvmw);
+			break;
+		}
+	}
+
+	/* If accessed, stop walking */
+	return *accessed == false;
+}
+
+bool damon_folio_young(struct folio *folio)
+{
+	bool accessed = false;
+	struct rmap_walk_control rwc = {
+		.arg = &accessed,
+		.rmap_one = damon_folio_young_one,
+		.anon_lock = folio_lock_anon_vma_read,
+	};
+	bool need_lock;
+
+	if (!folio_mapped(folio) || !folio_raw_mapping(folio)) {
+		if (folio_test_idle(folio))
+			return false;
+		else
+			return true;
+	}
+
+	need_lock = !folio_test_anon(folio) || folio_test_ksm(folio);
+	if (need_lock && !folio_trylock(folio))
+		return false;
+
+	rmap_walk(folio, &rwc);
+
+	if (need_lock)
+		folio_unlock(folio);
+
+	return accessed;
+}
+
+bool damos_folio_filter_match(struct damos_filter *filter, struct folio *folio)
+{
+	bool matched = false;
+	struct mem_cgroup *memcg;
+	size_t folio_sz;
+
+	switch (filter->type) {
+	case DAMOS_FILTER_TYPE_ANON:
+		matched = folio_test_anon(folio);
+		break;
+	case DAMOS_FILTER_TYPE_ACTIVE:
+		matched = folio_test_active(folio);
+		break;
+	case DAMOS_FILTER_TYPE_MEMCG:
+		rcu_read_lock();
+		memcg = folio_memcg_check(folio);
+		if (!memcg)
+			matched = false;
+		else
+			matched = filter->memcg_id == mem_cgroup_id(memcg);
+		rcu_read_unlock();
+		break;
+	case DAMOS_FILTER_TYPE_YOUNG:
+		matched = damon_folio_young(folio);
+		if (matched)
+			damon_folio_mkold(folio);
+		break;
+	case DAMOS_FILTER_TYPE_HUGEPAGE_SIZE:
+		folio_sz = folio_size(folio);
+		matched = filter->sz_range.min <= folio_sz &&
+			  folio_sz <= filter->sz_range.max;
+		break;
+	case DAMOS_FILTER_TYPE_UNMAPPED:
+		matched = !folio_mapped(folio) || !folio_raw_mapping(folio);
+		break;
+	default:
+		break;
+	}
+
+	return matched == filter->matching;
+}
+
 static unsigned int __damon_migrate_folio_list(
 		struct list_head *migrate_folios, struct pglist_data *pgdat,
 		int target_nid)
diff --git a/mm/damon/ops-common.h b/mm/damon/ops-common.h
index 54209a7e70e6..61ad54aaf256 100644
--- a/mm/damon/ops-common.h
+++ b/mm/damon/ops-common.h
@@ -11,10 +11,13 @@ struct folio *damon_get_folio(unsigned long pfn);
 
 void damon_ptep_mkold(pte_t *pte, struct vm_area_struct *vma, unsigned long addr);
 void damon_pmdp_mkold(pmd_t *pmd, struct vm_area_struct *vma, unsigned long addr);
+void damon_folio_mkold(struct folio *folio);
+bool damon_folio_young(struct folio *folio);
 
 int damon_cold_score(struct damon_ctx *c, struct damon_region *r,
 			struct damos *s);
 int damon_hot_score(struct damon_ctx *c, struct damon_region *r,
 			struct damos *s);
 
+bool damos_folio_filter_match(struct damos_filter *filter, struct folio *folio);
 unsigned long damon_migrate_pages(struct list_head *folio_list, int target_nid);
diff --git a/mm/damon/paddr.c b/mm/damon/paddr.c
index 48e3e6fed636..53a55c5114fb 100644
--- a/mm/damon/paddr.c
+++ b/mm/damon/paddr.c
@@ -18,45 +18,6 @@
 #include "../internal.h"
 #include "ops-common.h"
 
-static bool damon_folio_mkold_one(struct folio *folio,
-		struct vm_area_struct *vma, unsigned long addr, void *arg)
-{
-	DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, addr, 0);
-
-	while (page_vma_mapped_walk(&pvmw)) {
-		addr = pvmw.address;
-		if (pvmw.pte)
-			damon_ptep_mkold(pvmw.pte, vma, addr);
-		else
-			damon_pmdp_mkold(pvmw.pmd, vma, addr);
-	}
-	return true;
-}
-
-static void damon_folio_mkold(struct folio *folio)
-{
-	struct rmap_walk_control rwc = {
-		.rmap_one = damon_folio_mkold_one,
-		.anon_lock = folio_lock_anon_vma_read,
-	};
-	bool need_lock;
-
-	if (!folio_mapped(folio) || !folio_raw_mapping(folio)) {
-		folio_set_idle(folio);
-		return;
-	}
-
-	need_lock = !folio_test_anon(folio) || folio_test_ksm(folio);
-	if (need_lock && !folio_trylock(folio))
-		return;
-
-	rmap_walk(folio, &rwc);
-
-	if (need_lock)
-		folio_unlock(folio);
-
-}
-
 static void damon_pa_mkold(unsigned long paddr)
 {
 	struct folio *folio = damon_get_folio(PHYS_PFN(paddr));
@@ -86,75 +47,6 @@ static void damon_pa_prepare_access_checks(struct damon_ctx *ctx)
 	}
 }
 
-static bool damon_folio_young_one(struct folio *folio,
-		struct vm_area_struct *vma, unsigned long addr, void *arg)
-{
-	bool *accessed = arg;
-	DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, addr, 0);
-	pte_t pte;
-
-	*accessed = false;
-	while (page_vma_mapped_walk(&pvmw)) {
-		addr = pvmw.address;
-		if (pvmw.pte) {
-			pte = ptep_get(pvmw.pte);
-
-			/*
-			 * PFN swap PTEs, such as device-exclusive ones, that
-			 * actually map pages are "old" from a CPU perspective.
-			 * The MMU notifier takes care of any device aspects.
-			 */
-			*accessed = (pte_present(pte) && pte_young(pte)) ||
-				!folio_test_idle(folio) ||
-				mmu_notifier_test_young(vma->vm_mm, addr);
-		} else {
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
-			*accessed = pmd_young(pmdp_get(pvmw.pmd)) ||
-				!folio_test_idle(folio) ||
-				mmu_notifier_test_young(vma->vm_mm, addr);
-#else
-			WARN_ON_ONCE(1);
-#endif	/* CONFIG_TRANSPARENT_HUGEPAGE */
-		}
-		if (*accessed) {
-			page_vma_mapped_walk_done(&pvmw);
-			break;
-		}
-	}
-
-	/* If accessed, stop walking */
-	return *accessed == false;
-}
-
-static bool damon_folio_young(struct folio *folio)
-{
-	bool accessed = false;
-	struct rmap_walk_control rwc = {
-		.arg = &accessed,
-		.rmap_one = damon_folio_young_one,
-		.anon_lock = folio_lock_anon_vma_read,
-	};
-	bool need_lock;
-
-	if (!folio_mapped(folio) || !folio_raw_mapping(folio)) {
-		if (folio_test_idle(folio))
-			return false;
-		else
-			return true;
-	}
-
-	need_lock = !folio_test_anon(folio) || folio_test_ksm(folio);
-	if (need_lock && !folio_trylock(folio))
-		return false;
-
-	rmap_walk(folio, &rwc);
-
-	if (need_lock)
-		folio_unlock(folio);
-
-	return accessed;
-}
-
 static bool damon_pa_young(unsigned long paddr, unsigned long *folio_sz)
 {
 	struct folio *folio = damon_get_folio(PHYS_PFN(paddr));
@@ -205,49 +97,6 @@ static unsigned int damon_pa_check_accesses(struct damon_ctx *ctx)
 	return max_nr_accesses;
 }
 
-static bool damos_pa_filter_match(struct damos_filter *filter,
-		struct folio *folio)
-{
-	bool matched = false;
-	struct mem_cgroup *memcg;
-	size_t folio_sz;
-
-	switch (filter->type) {
-	case DAMOS_FILTER_TYPE_ANON:
-		matched = folio_test_anon(folio);
-		break;
-	case DAMOS_FILTER_TYPE_ACTIVE:
-		matched = folio_test_active(folio);
-		break;
-	case DAMOS_FILTER_TYPE_MEMCG:
-		rcu_read_lock();
-		memcg = folio_memcg_check(folio);
-		if (!memcg)
-			matched = false;
-		else
-			matched = filter->memcg_id == mem_cgroup_id(memcg);
-		rcu_read_unlock();
-		break;
-	case DAMOS_FILTER_TYPE_YOUNG:
-		matched = damon_folio_young(folio);
-		if (matched)
-			damon_folio_mkold(folio);
-		break;
-	case DAMOS_FILTER_TYPE_HUGEPAGE_SIZE:
-		folio_sz = folio_size(folio);
-		matched = filter->sz_range.min <= folio_sz &&
-			  folio_sz <= filter->sz_range.max;
-		break;
-	case DAMOS_FILTER_TYPE_UNMAPPED:
-		matched = !folio_mapped(folio) || !folio_raw_mapping(folio);
-		break;
-	default:
-		break;
-	}
-
-	return matched == filter->matching;
-}
-
 /*
  * damos_pa_filter_out - Return true if the page should be filtered out.
  */
@@ -259,7 +108,7 @@ static bool damos_pa_filter_out(struct damos *scheme, struct folio *folio)
 		return false;
 
 	damos_for_each_ops_filter(filter, scheme) {
-		if (damos_pa_filter_match(filter, folio))
+		if (damos_folio_filter_match(filter, folio))
 			return !filter->allow;
 	}
 	return scheme->ops_filters_default_reject;
-- 
2.43.5

