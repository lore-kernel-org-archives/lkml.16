Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E95315512;
	Wed,  2 Jul 2025 20:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751487289; cv=none; b=AxG5K8umkuDxprsXtAMJaGEfBdSPGlA7WwOR5xjjk7KxGzWjvsMjDwU9ZFmUK67AhiXF+M2IcOoK/66j9u9Ctdh9S/XmVOUR8jmXlX9uhDyeZn2c3/jCGp8Ef1N4/1hxjObRu8WvKe1enFE6JqMTFZVPX9OCqGuqRVDJ8mEL9C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751487289; c=relaxed/simple;
	bh=7RP+GRfK/ULjv/KYbouJDYllocI5iwEuWCFqA5tp+To=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NwDOZ2fIDF/Gr70AzUfj4yKlW9tn8hgGte5nMJR0JpeBS4RO5p1TJWQzlaeelIN6SZcjmWtyS1O0685+Nh52bkHHIp1fxZJQMtN+9fHijnwPx0DwJvyDi2PYNed5vkkT62MFaZlMJPdhZ6L00WrWO3GRmKIRE80uYiS3/Nr37oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PnM23zPL; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PnM23zPL"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e812c817de0so4175698276.0;
        Wed, 02 Jul 2025 13:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751487287; x=1752092087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=05WnykoPBN9POS7hBQ+YMPJeI35+H/yepYgR/cq36tw=;
        b=PnM23zPL/KEdHazzHS8CAM7CpNdNKkaELX6NpHYaC6wO7hH40spMuKPrKMzkdR+bGv
         7Bflt+QjyY4xpNHwXuL4WirLNRnnhg7zMSRPnZxhM510cgV9Qs/zs/w7Juw7J3rGNji9
         /mVD4zL+Q9YEQJDaSoI1ACv3ovIUu0nD6hGSe8WktP9fa1FcxkXjRwTNlrOvmHIh3TGW
         RBQHmEx1ft0757PW7uzdy+V5X3Jkk0izRQSfENnCoJZs6qdnrzX9pNUUOlB5xURHuyqg
         GTI8FXJbh8Ji6eJiBOrnCOeAb2Bbh42yktiOiyNZkPFBXrC2WPYvqUOBkt0OIkuvlGib
         n2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751487287; x=1752092087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=05WnykoPBN9POS7hBQ+YMPJeI35+H/yepYgR/cq36tw=;
        b=HIH/CMC+EBvxGcpJQruKBTc1mySRgSNX12rtes/+LyJhvUom7gY+QmanUuK4OsQopX
         Y8/9Uda5BchNCnvJGwpz+K0xNAp1bUF2Q46a/3ExgvcDXvtHKugMCptTgdE5KJm1f6Sq
         cKyKwxy9jwzc8o3aDu1ElEsGzcfcw94ZRTx4HtShsTLeVXVrhh0GgHN153TKJPClEtg1
         pLQ8IZLI5iGttKxfRHNqZKEqFGTwHDxJ+Sd/RQ3v8Nuovs7G/y952/+NnsS3FxRRjH9a
         3AhMmy9cBEHebOc3cuimJQxl9YyPInucFvrCW5ZLlJnDayvor66dD1Q9BqvCGw+lLiMh
         KAUw==
X-Forwarded-Encrypted: i=1; AJvYcCU2042HSQSTC2LEiVdmoW4+PrjPd+/wh+yuo5sVIgLAQd+1ivbJxZXnzj+LwwdGjKStWazQmU6dHvI=@vger.kernel.org, AJvYcCVYswwJs67zXJAV8uwI1Cv5gTjpTOLSViVjAeZg1SLKhB74dr3+kcT11LLtQM0OzDCdH9G6acG3vyGctKi7@vger.kernel.org
X-Gm-Message-State: AOJu0YwKDPDMiZIcwFthcDBzez80wVJcXG6RLtiHql/Oo+VMpXrVbfLe
	hFaFXX67PkWJEUsl5eZevSegyp3zcw8ltzLdaBM3Y+yuJTuR2U/IIAw8iufbJ74C35o=
X-Gm-Gg: ASbGnctoRLh+OQMIemp6ioW9z1otgBBGEZyDVsxFXEvkNGH6dtzsxWb/jEdrI1tQxhO
	tXMJU2X8jqKno3YlqtTvvj+w+ySNGLk1wxSq3mqNs/Cca6Jj6pD6Rshco8y/BpgABv06Mwh38na
	fz8Vdwin6OoUSQ7bO1MMOytJ2Gd3jPmkxi8bHuYmZ34LqG1SuHrm8rP6LiTUmnUcflR+OGfY0Iu
	lJGeM7LQKmGOicjT8Wmf3ZydYVVb53RxyzE8/0sCmjB1CeMGYlJtZeZS7ejKHkffqzJGHFDYbCn
	xDzezBm8fcXaDgs0GTfzTvJmPUMHT9pPVb5EyXgjq2WHfFKxHrdPrzREC6bHRnluX0bGGc3pWf6
	1hyYJ90Q=
X-Google-Smtp-Source: AGHT+IGdUwsGEEhQL1PLrzo57URE3hxXYFvkR0VxlwJ8twSki7T8dKU9zV2AQYAft/rTiox2laS56w==
X-Received: by 2002:a05:690c:64c7:b0:70d:ed5d:b4b2 with SMTP id 00721157ae682-7164d2c98demr64954917b3.13.1751487286638;
        Wed, 02 Jul 2025 13:14:46 -0700 (PDT)
Received: from bijan-laptop.attlocal.net ([2600:1700:680e:c000:873e:8f35:7cd8:3fe3])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71515cb4347sm26124157b3.83.2025.07.02.13.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 13:14:46 -0700 (PDT)
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
Subject: [RFC PATCH v3 09/13] mm/damon/vaddr: Add vaddr versions of migrate_{hot,cold}
Date: Wed,  2 Jul 2025 15:13:32 -0500
Message-ID: <20250702201337.5780-10-bijan311@gmail.com>
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

migrate_{hot,cold} are paddr schemes that are used to migrate hot/cold
data to a specified node. However, these schemes are only available when
doing physical address monitoring. This patch adds an implementation for
them virtual address monitoring as well.

Co-developed-by: Ravi Shankar Jonnalagadda <ravis.opensrc@micron.com>
Signed-off-by: Ravi Shankar Jonnalagadda <ravis.opensrc@micron.com>
Signed-off-by: Bijan Tabatabai <bijantabatab@micron.com>
---
 mm/damon/vaddr.c | 102 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/mm/damon/vaddr.c b/mm/damon/vaddr.c
index 46554e49a478..5cdfdc47c5ff 100644
--- a/mm/damon/vaddr.c
+++ b/mm/damon/vaddr.c
@@ -15,6 +15,7 @@
 #include <linux/pagewalk.h>
 #include <linux/sched/mm.h>
 
+#include "../internal.h"
 #include "ops-common.h"
 
 #ifdef CONFIG_DAMON_VADDR_KUNIT_TEST
@@ -610,6 +611,65 @@ static unsigned int damon_va_check_accesses(struct damon_ctx *ctx)
 	return max_nr_accesses;
 }
 
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+static int damos_va_migrate_pmd_entry(pmd_t *pmd, unsigned long addr,
+		unsigned long next, struct mm_walk *walk)
+{
+	struct list_head *migration_list = walk->private;
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
+	if (!folio_isolate_lru(folio))
+		goto put_folio;
+
+	list_add(&folio->lru, migration_list);
+
+put_folio:
+	folio_put(folio);
+unlock:
+	spin_unlock(ptl);
+	return 0;
+}
+#else
+#define damos_va_migrate_pmd_entry NULL
+#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
+
+static int damos_va_migrate_pte_entry(pte_t *pte, unsigned long addr,
+		unsigned long enxt, struct mm_walk *walk)
+{
+	struct list_head *migration_list = walk->private;
+	struct folio *folio;
+	pte_t ptent;
+
+	ptent = ptep_get(pte);
+	if (pte_none(*pte) || !pte_present(*pte))
+		return 0;
+
+	folio = damon_get_folio(pte_pfn(ptent));
+	if (!folio)
+		return 0;
+
+	if (!folio_isolate_lru(folio))
+		goto out;
+
+	list_add(&folio->lru, migration_list);
+
+out:
+	folio_put(folio);
+	return 0;
+}
+
 /*
  * Functions for the target validity check and cleanup
  */
@@ -653,6 +713,41 @@ static unsigned long damos_madvise(struct damon_target *target,
 }
 #endif	/* CONFIG_ADVISE_SYSCALLS */
 
+static unsigned long damos_va_migrate(struct damon_target *target,
+		struct damon_region *r, struct damos *s,
+		unsigned long *sz_filter_passed)
+{
+	LIST_HEAD(folio_list);
+	struct task_struct *task;
+	struct mm_struct *mm;
+	unsigned long applied = 0;
+	struct mm_walk_ops walk_ops = {
+		.pmd_entry = damos_va_migrate_pmd_entry,
+		.pte_entry = damos_va_migrate_pte_entry,
+		.walk_lock = PGWALK_RDLOCK,
+	};
+
+	task = damon_get_task_struct(target);
+	if (!task)
+		return 0;
+
+	mm = damon_get_mm(target);
+	if (!mm)
+		goto put_task;
+
+	mmap_read_lock(mm);
+	walk_page_range(mm, r->ar.start, r->ar.end, &walk_ops, &folio_list);
+	mmap_read_unlock(mm);
+	mmput(mm);
+
+	applied = damon_migrate_pages(&folio_list, s->target_nid);
+	cond_resched();
+
+put_task:
+	put_task_struct(task);
+	return applied * PAGE_SIZE;
+}
+
 static unsigned long damon_va_apply_scheme(struct damon_ctx *ctx,
 		struct damon_target *t, struct damon_region *r,
 		struct damos *scheme, unsigned long *sz_filter_passed)
@@ -675,6 +770,9 @@ static unsigned long damon_va_apply_scheme(struct damon_ctx *ctx,
 	case DAMOS_NOHUGEPAGE:
 		madv_action = MADV_NOHUGEPAGE;
 		break;
+	case DAMOS_MIGRATE_HOT:
+	case DAMOS_MIGRATE_COLD:
+		return damos_va_migrate(t, r, scheme, sz_filter_passed);
 	case DAMOS_STAT:
 		return 0;
 	default:
@@ -695,6 +793,10 @@ static int damon_va_scheme_score(struct damon_ctx *context,
 	switch (scheme->action) {
 	case DAMOS_PAGEOUT:
 		return damon_cold_score(context, r, scheme);
+	case DAMOS_MIGRATE_HOT:
+		return damon_hot_score(context, r, scheme);
+	case DAMOS_MIGRATE_COLD:
+		return damon_cold_score(context, r, scheme);
 	default:
 		break;
 	}
-- 
2.43.5

