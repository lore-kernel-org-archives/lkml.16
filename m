Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305BB1E5B79
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 07:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747206515; cv=none; b=fEg2KDB7AKz4UNpkxu1YvvAi/emEW6hi5tk9Vgv//Kwxu1gC25bvjXKiWkgI6UOur1lXtrBpKXP3TY2hDz+5PsVv9sXebS3pQrBgjxWZF3HigcX2M2wFgL9lgF4tYdi9xStfZH6p6wQfYEn+lWttpfsJgkMmNbJgx/yrMlm7g6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747206515; c=relaxed/simple;
	bh=PEHGLGsbm5xR+hztW6cvsOVLWGwzVvgJIGxk8mLDs+o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=dX9oOwEaxPclVn3GHXIaLPiKX5MYrBC549oBpz+J0Cd6HY8MtoD4ziH1483YJSgJk41NyoOqOcUyUD8SmXhbRuT1a+gsrnyjB4BRn0Y/U6fHLNHb3lkOoMZNI3zr8duhwOCODuExWc0zMZGE7Cf03cw1sLsaC6RjXJ/5BRjQRbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mtHqVTE2; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mtHqVTE2"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-30a93d80a80so5138402a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 00:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747206512; x=1747811312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oMr4aF1l/qw57+l4Bi/2yJ5W0FLN7beti6Elj9tOF5g=;
        b=mtHqVTE2wuPVgLKYjFRs2c4UrKwCnjbTzqB5cu9P9+FpmgpXDCnD0a3hXBSNzsdMBC
         DfZfoboE2FrWx2zHYcbs9y5mCdWutsvE1xEZ6RYw80lruveuOlmdtf8V7M5m7zXvQcmV
         du9p+zasuJw/jYv2FYPgr6n0Oe+4M5FMrpCjW2xwSUv17KUI3h0K4VV0rEOZ81a+6O1c
         WTUnfD/b28OzKvHuTCJWEjspFoi1WRew8VOdBUr+W9sNQxTSXMPU3dDdAFfZE2uF3tVf
         51mvRVfzrY4y44blUpGa8e0F5979flB0ElLYizMKzDvpgYCr4Ag7O5hk+ikXPMgLX38I
         o1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747206512; x=1747811312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oMr4aF1l/qw57+l4Bi/2yJ5W0FLN7beti6Elj9tOF5g=;
        b=gy+ucE27YTjP4U5tygk9l+6uP1vv5z0ezijef+GgN1CgRa2gWxTD0fzmkX5J3qu0qa
         I/Zh+TF20rz6WwjQiShU6XwyA44iaqQVs+GCrV0GVMCtoVEcWg039b+oaCof+h8BthEs
         8/027aMWEDXfEd+cS+TLjjt3QXZ3uOLj5/+6y67MWqnvYO8KjofPNVylWMSU5WXX24as
         avILZ2wkrLTNJwEiLh4OBG5yxx6TxXZg2Suk6kpAFlmYV3XUU+42OGBKWsDjz4xEK10X
         M/ipQMaX9AYZYzwG0j9tIapBqnqtl+dLUUzHJtdBUuaHt9y6Xb6AD6X0hgQZaVTnMoc8
         LcPg==
X-Gm-Message-State: AOJu0Yw9uBsHH0VkzFWSL3FtlXjJlzqqyl7qXrxSAP70W9P9iCeXzNc6
	lDyWShkhpunuv7a94nZtCG35eEkrrRn+Ank7ecsTfg1GGVHKxqD9tqghJg==
X-Gm-Gg: ASbGncvFZCFuUDuiiZVePm/UUPhyqMGi51F4I0kCLq3+g0d3djFjwWbfGVtWKtloWFy
	lkym3moslQx0Q93BkR50NCXoMoUmjnIlOwrrbhq9wfynRKe+ExxktjI1pSePBqr0dutJ3UZUX00
	b0TP67vkHVRO1uxXZP8sOMkPe5QPeyX0QfslaXGD339aeYp6KDuO751SI5oJEQxXJsFH+kdfN5e
	Cj47hsHDHZMFrllyFTVRs1fCQrAifs4PbktZIgnYvykeCFDuchQiJ1SH9kPKVGucmF+6b+sQl1D
	w43VQ6BtOBquclUkcGp/itPglCQBnzuoDi9zLgpvnK8lLsh8khzwQ8HaJu505AKxuiDS4l3vZg=
	=
X-Google-Smtp-Source: AGHT+IEHI5kdVGTjYtz9myo26Efk7NSbVRSeMuqcNXIlr0n2lLwtByYRxpM6B5P0cqoY8Dw+lBKqsQ==
X-Received: by 2002:a17:90b:2dc2:b0:2fe:994d:613b with SMTP id 98e67ed59e1d1-30e2e687a8emr3712405a91.35.1747206512096;
        Wed, 14 May 2025 00:08:32 -0700 (PDT)
Received: from Barrys-MBP.hub ([118.92.10.104])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33401768sm852285a91.3.2025.05.14.00.08.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 May 2025 00:08:31 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	zhengtangquan@oppo.com,
	Barry Song <v-songbaohua@oppo.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Matthew Wilcox <willy@infradead.org>,
	Oscar Salvador <osalvador@suse.de>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Zi Yan <ziy@nvidia.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>
Subject: [PATCH RFC v2] mm: add support for dropping LRU recency on process exit
Date: Wed, 14 May 2025 19:08:20 +1200
Message-Id: <20250514070820.51793-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Barry Song <v-songbaohua@oppo.com>

Currently, both zap_pmd and zap_pte always promote young file folios,
regardless of whether the processes are dying.
However, in systems where the process recency fades upon dying, we may
want to reverse this behavior. The goal is to reclaim the folios from
the dying process as quickly as possible, allowing new processes to
acquire memory ASAP.
For example, while Firefox is killed and LibreOffice is launched,
activating Firefox's young file-backed folios makes it harder to
reclaim memory that LibreOffice doesn't use at all.

On systems like Android, processes are either explicitly stopped by
user action or reaped due to OOM after being inactive for a long time.
These processes are unlikely to restart in the near future. Rather than
promoting their folios, we skip promoting and demote their exclusive
folios so that memory can be reclaimed and made available for new
user-facing processes.

Users possibly do not care about the recency of a dying process.
However, we still need an explicit user indication to take this action.
Thus, we introduced a prctl to provide that necessary user-level hint
as suggested by Johannes and David.

We observed noticeable improvements in refaults, swap-ins, and swap-outs
on a hooked Android kernel. More data for this specific version will
follow.

Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Michal Hocko <mhocko@suse.com>
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 -v2:
 * add prctl as suggested by Johannes and David
 * demote exclusive file folios if drop_recency can apply
 -v1:
 https://lore.kernel.org/linux-mm/20250412085852.48524-1-21cnbao@gmail.com/

 include/linux/mm_types.h   |  1 +
 include/uapi/linux/prctl.h |  3 +++
 kernel/sys.c               | 16 ++++++++++++++++
 mm/huge_memory.c           | 12 ++++++++++--
 mm/internal.h              | 14 ++++++++++++++
 mm/memory.c                | 12 +++++++++++-
 6 files changed, 55 insertions(+), 3 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 15808cad2bc1..84ab113c54a2 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1733,6 +1733,7 @@ enum {
  * on NFS restore
  */
 //#define MMF_EXE_FILE_CHANGED	18	/* see prctl_set_mm_exe_file() */
+#define MMF_FADE_ON_DEATH	18	/* Recency is discarded on process exit */
 
 #define MMF_HAS_UPROBES		19	/* has uprobes */
 #define MMF_RECALC_UPROBES	20	/* MMF_HAS_UPROBES can be wrong */
diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index 15c18ef4eb11..22d861157552 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -364,4 +364,7 @@ struct prctl_mm_map {
 # define PR_TIMER_CREATE_RESTORE_IDS_ON		1
 # define PR_TIMER_CREATE_RESTORE_IDS_GET	2
 
+#define PR_SET_FADE_ON_DEATH			78
+#define PR_GET_FADE_ON_DEATH			79
+
 #endif /* _LINUX_PRCTL_H */
diff --git a/kernel/sys.c b/kernel/sys.c
index c434968e9f5d..cabe1bbb35a4 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2658,6 +2658,22 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 			clear_bit(MMF_DISABLE_THP, &me->mm->flags);
 		mmap_write_unlock(me->mm);
 		break;
+	case PR_GET_FADE_ON_DEATH:
+		if (arg2 || arg3 || arg4 || arg5)
+			return -EINVAL;
+		error = !!test_bit(MMF_FADE_ON_DEATH, &me->mm->flags);
+		break;
+	case PR_SET_FADE_ON_DEATH:
+		if (arg3 || arg4 || arg5)
+			return -EINVAL;
+		if (mmap_write_lock_killable(me->mm))
+			return -EINTR;
+		if (arg2)
+			set_bit(MMF_FADE_ON_DEATH, &me->mm->flags);
+		else
+			clear_bit(MMF_FADE_ON_DEATH, &me->mm->flags);
+		mmap_write_unlock(me->mm);
+		break;
 	case PR_MPX_ENABLE_MANAGEMENT:
 	case PR_MPX_DISABLE_MANAGEMENT:
 		/* No longer implemented: */
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 2780a12b25f0..c99894611d4a 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2204,6 +2204,7 @@ static inline void zap_deposited_table(struct mm_struct *mm, pmd_t *pmd)
 int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 		 pmd_t *pmd, unsigned long addr)
 {
+	bool drop_recency = false;
 	pmd_t orig_pmd;
 	spinlock_t *ptl;
 
@@ -2260,13 +2261,20 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 			add_mm_counter(tlb->mm, mm_counter_file(folio),
 				       -HPAGE_PMD_NR);
 
+			drop_recency = zap_need_to_drop_recency(tlb->mm);
 			/*
 			 * Use flush_needed to indicate whether the PMD entry
 			 * is present, instead of checking pmd_present() again.
 			 */
-			if (flush_needed && pmd_young(orig_pmd) &&
-			    likely(vma_has_recency(vma)))
+			if (flush_needed && pmd_young(orig_pmd) && !drop_recency &&
+					likely(vma_has_recency(vma)))
 				folio_mark_accessed(folio);
+			/*
+			 * Userspace explicitly marks recency to fade when the process
+			 * dies; demote exclusive file folios to aid reclamation.
+			 */
+			if (drop_recency && !folio_maybe_mapped_shared(folio))
+				deactivate_file_folio(folio);
 		}
 
 		spin_unlock(ptl);
diff --git a/mm/internal.h b/mm/internal.h
index 6b8ed2017743..af9649b3e84a 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -11,6 +11,7 @@
 #include <linux/khugepaged.h>
 #include <linux/mm.h>
 #include <linux/mm_inline.h>
+#include <linux/oom.h>
 #include <linux/pagemap.h>
 #include <linux/pagewalk.h>
 #include <linux/rmap.h>
@@ -130,6 +131,19 @@ static inline int folio_nr_pages_mapped(const struct folio *folio)
 	return atomic_read(&folio->_nr_pages_mapped) & FOLIO_PAGES_MAPPED;
 }
 
+/*
+ * Returns true if the process attached to the mm is dying or undergoing
+ * OOM reaping, and its recency—explicitly marked by userspace—will also
+ * fade; otherwise, returns false.
+ */
+static inline bool zap_need_to_drop_recency(struct mm_struct *mm)
+{
+	if (!atomic_read(&mm->mm_users) || check_stable_address_space(mm))
+		return !!test_bit(MMF_FADE_ON_DEATH, &mm->flags);
+
+	return false;
+}
+
 /*
  * Retrieve the first entry of a folio based on a provided entry within the
  * folio. We cannot rely on folio->swap as there is no guarantee that it has
diff --git a/mm/memory.c b/mm/memory.c
index 5a7e4c0e89c7..6dd01a7736a8 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1505,6 +1505,7 @@ static __always_inline void zap_present_folio_ptes(struct mmu_gather *tlb,
 		bool *force_flush, bool *force_break, bool *any_skipped)
 {
 	struct mm_struct *mm = tlb->mm;
+	bool drop_recency = false;
 	bool delay_rmap = false;
 
 	if (!folio_test_anon(folio)) {
@@ -1516,9 +1517,18 @@ static __always_inline void zap_present_folio_ptes(struct mmu_gather *tlb,
 				*force_flush = true;
 			}
 		}
-		if (pte_young(ptent) && likely(vma_has_recency(vma)))
+
+		drop_recency = zap_need_to_drop_recency(mm);
+		if (pte_young(ptent) && !drop_recency &&
+				likely(vma_has_recency(vma)))
 			folio_mark_accessed(folio);
 		rss[mm_counter(folio)] -= nr;
+		/*
+		 * Userspace explicitly marks recency to fade when the process dies;
+		 * demote exclusive file folios to aid reclamation.
+		 */
+		if (drop_recency && !folio_maybe_mapped_shared(folio))
+			deactivate_file_folio(folio);
 	} else {
 		/* We don't need up-to-date accessed/dirty bits. */
 		clear_full_ptes(mm, addr, pte, nr, tlb->fullmm);
-- 
2.39.3 (Apple Git-146)

