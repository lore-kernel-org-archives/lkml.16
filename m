Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D46F2367BC
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 08:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744448344; cv=none; b=rdk++huKGvxCtFq6e8Briegrmd62XMfZHyBXVff/p71tqKqnc/AFVxUOjKNYKg+qnUSd/+7PskhjZ0OePG8DDgAKSh10i5CocEbLoCYPxuz+tkH8U2U1Y9B5kJ75YN3qDWv9omChZ49rrdkoJwUyIVz00m5Ss+SnblrmvyEWyLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744448344; c=relaxed/simple;
	bh=xMz+K0j5jPENUhgbcvG74Rje4/SdNoCjVn7RdOJT3cQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=pAa2Kc6064yIwWbvioPhooq3+ticsVx0aU+nzcdOUBCQeA17t+mLfelbBTSyvKE4wtyyF8A+Dc1kO5m1uWEAeYRZdRlBMAYdZhmZdc62hrAJfxB5PlbTXx16C10aCKgg/ad8HLM5iCxkd3gZB0PPhid5709BaMxMOyjvQZ4zUiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T6b+Fyfg; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T6b+Fyfg"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-225df540edcso39248905ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 01:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744448342; x=1745053142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rYfYOXgEMh5O4Q2aA7Im1EXD1nxKMabdz4qOFBh1C0U=;
        b=T6b+Fyfg0xcyU/lAA7bRz2DGn0yzGJhJM7dinKHypXonH9IKeNLZz7gcOxlv3Jk3rf
         /xoTIgZ6xjbYCe8+DXbmozzSLanK7ctitc0rwFMDw8/RwyBdqZMnVufuTBgfmd4XSg38
         RSU+WVSOhaaquMZNgvA7JZba/yElqame1ZNcZwo12xA7hWU1+CpuyNj8gxnwG6WkXbz1
         bzQI+a5u1G+BolHf6GJAnP+SeSVIw/dbvyrEBIH1g+hkDJywfTEfIOm7zvAJns0n2mIY
         ODjZlqmTFR6hHcgykcQGaSVjHV6zz9JGaveoCXLNEDshWX+qK5PmyDaT/149Fn1O0Am3
         JJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744448342; x=1745053142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rYfYOXgEMh5O4Q2aA7Im1EXD1nxKMabdz4qOFBh1C0U=;
        b=o8cSHmANm9pMilagMz2BAb4Z1JGbOhEpAR2GEVHGUo0n2a+ia34T152VsmYJKQwboP
         t5Eqt1FMO40aU23/xJvr9Tuxkfg/0/j/aC2tKh99zXrX6H5t6WoiVpvz3FeiEixrQ38w
         bNznD6Tukl/MTeeu5x/MOWQSKuAMdt/vcZ1F+DAdxOgefHz8Dokz2fPxwk8jSk0Sqma+
         OcqVm8hojOq/0TVC1S7IqpXPg9t9OAkROe4w9U7tIWX8SBxTS/EsoriR/NlkhqbJtjhH
         tWi23FhWi36JYPSgMgIx7qQgKjXkGRexBpTw+SOuAiK7eFaEjFIdfClJrGLg6CDUInVh
         8+tQ==
X-Gm-Message-State: AOJu0YzhwpDqCiDfb2JOvxaB7urNE402i56Fsikt87AVJ+CH+BT5y63Y
	SkvDMZO+ZgNR65+CafRLzizX/UTAbhQLRvHNv2bK5G0cWbxWejt3
X-Gm-Gg: ASbGnctfNRMNMEUbYs9LjHS/DgVEbTtFlBgLWRL8fNVuJkmXMa0T3SrVv5AbrdzM26e
	p1CtSTXe5xDKTZD2ebxpzdF5QAA8mVezN5lqjvU1OtbUO6r9jTLSRynB1woDD8w/zyroqN/EJn7
	QqJvZGDGN6dcb/QtTlfCEvQ0CBjBfwFMl7OHdbaocXozdiji3SFjAQNbeI6/2u6cuYS2eX42qNI
	yOlkphoaNjSyoyjJQmnSL8ofocHfGqFF1HSR0B+WG2blq2H8ugUwHvtoHqlNn6JJMVPuEv5rWww
	NzqWogQnwlgDntQNLfOBhOSzPhkdzVx7/unvJu8zG1cTEq3tfqwAsyX2
X-Google-Smtp-Source: AGHT+IEkJ36Jz8n9hG3SinEp7XwOwkMmD9nPB2lCOsXijxusIByHPImYx/umctXng2q1f4Wv7nFt7w==
X-Received: by 2002:a17:903:19c3:b0:215:6c5f:d142 with SMTP id d9443c01a7336-22bea0a9bb2mr82218175ad.20.1744448341500;
        Sat, 12 Apr 2025 01:59:01 -0700 (PDT)
Received: from Barrys-MBP.hub ([118.93.49.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb5047sm63202675ad.170.2025.04.12.01.58.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Apr 2025 01:59:00 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Barry Song <v-songbaohua@oppo.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Matthew Wilcox <willy@infradead.org>,
	Oscar Salvador <osalvador@suse.de>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Zi Yan <ziy@nvidia.com>
Subject: [RFC PATCH] mm: don't promote exclusive file folios of dying processes
Date: Sat, 12 Apr 2025 20:58:52 +1200
Message-Id: <20250412085852.48524-1-21cnbao@gmail.com>
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

Promoting exclusive file folios of a dying process is unnecessary and
harmful. For example, while Firefox is killed and LibreOffice is
launched, activating Firefox's young file-backed folios makes it
harder to reclaim memory that LibreOffice doesn't use at all.

An exiting process is unlikely to be restarted right away—it's
either terminated by the user or killed by the OOM handler.

Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Zi Yan <ziy@nvidia.com>
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 mm/huge_memory.c |  4 ++--
 mm/internal.h    | 19 +++++++++++++++++++
 mm/memory.c      |  9 ++++++++-
 3 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index e97a97586478..05b83d2fcbb6 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2264,8 +2264,8 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 			 * Use flush_needed to indicate whether the PMD entry
 			 * is present, instead of checking pmd_present() again.
 			 */
-			if (flush_needed && pmd_young(orig_pmd) &&
-			    likely(vma_has_recency(vma)))
+			if (!exclusive_folio_of_dying_process(folio, vma) && flush_needed &&
+			    pmd_young(orig_pmd) && likely(vma_has_recency(vma)))
 				folio_mark_accessed(folio);
 		}
 
diff --git a/mm/internal.h b/mm/internal.h
index 4e0ea83aaf1c..666de96a293d 100644
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
@@ -130,6 +131,24 @@ static inline int folio_nr_pages_mapped(const struct folio *folio)
 	return atomic_read(&folio->_nr_pages_mapped) & FOLIO_PAGES_MAPPED;
 }
 
+/*
+ * Return true if a folio is exclusive and belongs to an exiting or
+ * oom-reaped process; otherwise, return false.
+ */
+static inline bool exclusive_folio_of_dying_process(struct folio *folio,
+		struct vm_area_struct *vma)
+{
+	if (folio_maybe_mapped_shared(folio))
+		return false;
+
+	if (!atomic_read(&vma->vm_mm->mm_users))
+		return true;
+	if (check_stable_address_space(vma->vm_mm))
+		return true;
+
+	return false;
+}
+
 /*
  * Retrieve the first entry of a folio based on a provided entry within the
  * folio. We cannot rely on folio->swap as there is no guarantee that it has
diff --git a/mm/memory.c b/mm/memory.c
index b9e8443aaa86..cab69275e473 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1515,7 +1515,14 @@ static __always_inline void zap_present_folio_ptes(struct mmu_gather *tlb,
 				*force_flush = true;
 			}
 		}
-		if (pte_young(ptent) && likely(vma_has_recency(vma)))
+
+		/*
+		 * Skip marking exclusive file folios as accessed for processes that are
+		 * exiting or have been reaped due to OOM. This prevents unnecessary
+		 * promotion of folios that won't benefit the new process being launched.
+		 */
+		if (!exclusive_folio_of_dying_process(folio, vma) && pte_young(ptent) &&
+				likely(vma_has_recency(vma)))
 			folio_mark_accessed(folio);
 		rss[mm_counter(folio)] -= nr;
 	} else {
-- 
2.39.3 (Apple Git-146)

