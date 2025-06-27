Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994E32BEFE5
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 11:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751025322; cv=none; b=FSBMIgg9vBrPPE+0O3lUS+eHzHR9oeu5GtGk2j3Ct7T0g+V5nYSdRYp/YK6TvG+LrkRGgQ9evpWUuU4G34kGd6KiuRQl8NX6+N9kWSmJJ8YfTINh2VyR5fz7Iqc+NapIOgy9tsiHfieaBgfxdddvg4GkiTzqEhF2RVK6dusbw1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751025322; c=relaxed/simple;
	bh=EnpwWAgYkd3KvUWnwE2G/Ewc77VnaVSOc93Vpa7m1UQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kw/S737Y+w6eM6IW2Im7IyvZVgdmSnX8Q7BljSKwc+dJjC1cPQqyyOJMnDNwlQL7/3sA4x7LIWy6ArdEx9VRZM6razP9GKEYhwP95hyP74pi+Gg6v7CB3EgJBpz1CB8Ja+2A8UsQsd5sXUDivIjpdHIVsPmH8pCCfTmk4f2AZYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XAtB9x3s; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XAtB9x3s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751025319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wcOFieBfYhagF3JtnYzgZBrQvN7+QiFqX1LLvkigDHE=;
	b=XAtB9x3sFgsMJkHxPNKgNS17QFm4J9trr3M6kb3zCW71o/24AV9LQphVmYxb6tY8D19Fo7
	MtjddQkrvQ8GiaDC+V9gofK2JbyoxPePkgbuOvCS2BvjVSQwpANH3wiC9m2h3unOISpFD+
	NVq4LxCjp9P3OJ/keiP3R07RlXo0Os8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-PtaAr4CQP-WCHBkDGHUqMA-1; Fri, 27 Jun 2025 07:55:18 -0400
X-MC-Unique: PtaAr4CQP-WCHBkDGHUqMA-1
X-Mimecast-MFC-AGG-ID: PtaAr4CQP-WCHBkDGHUqMA_1751025317
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4532514dee8so13883705e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 04:55:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751025317; x=1751630117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wcOFieBfYhagF3JtnYzgZBrQvN7+QiFqX1LLvkigDHE=;
        b=MLD0FvSLZSHOytb+gUFlu96VIhKKQhWcMzCaI3O/9Chs7IT1RobSQ3oJRipOn0/01/
         Q04QzNBYEzgMBAJshe1nJhwV5/zsRk96rUu46HZUwgV/z2QahxPB5XXaNSmg8dtrcgAK
         jy4IsVpMojdAwQxEhtiE5MLVQznpKLDzGIs/rQ9U3k9E5ePnbB2YYNDXGxgUNX04WSaB
         QL8V8bABTLLwJJL6o7VJVUn3CprIIGLSmqSSEKFysqT/3pzfScYq5j9kC9I5wtbcISt5
         rNAOep0JJ+93BXpyvv05mKTXL7oimq86KCOR9svC/zq3/KuNBpqcRr2yPLCrr7nIPXzK
         TR7g==
X-Gm-Message-State: AOJu0Yy5v7Dm4AQFBKh52eGEK/SIU/Z4voQxeHr2gOE4ebSSG2//tXyZ
	xbofWO+NItS3p313qjLES05BGRWt2uH1cHaM/IWHSMeX9/Yf0qx1cIHbK3Y6APQMa4YohKaNs6q
	13BtjXctUzPC6axt5++dqFKk9wYZjOhCI1BES1lQgSZ0zoCUDBt20KRhjIqbRSQ3L9u3PnvIpIU
	oq7i0Sto5JTp++dyPScKqGSqzXnXPPyY92OF5olivJXzMXzkfw
X-Gm-Gg: ASbGncvzBxqIGmnT+F++dzwJ5puIS/mw4XJAyESfLcP0JJePyvInMlBvw1GirhGOPfU
	UYqWqsCvx9KFcLeIAkAK0irtPqgGT/zkJOD4Ki3pjdCVtJg1EQ78fBaHlKyo7ohMIwS6Lw73+MG
	F1jG2mB59cCXUpQssr+668NERhEsOx1ZOxCwfqo2Jpft/U8NyDJ9p3Y2cuLvL/zjnX9D9HFQmGg
	mDIH+M6vA4Ur8a+Oyy6L8T9tm3bHlKg8Udm+S1TsZtNF/vfRoCeJtRqiHBEWBW3VZXAMjJSd38v
	NXrfOTpu8m/1FQY/U0W3ZK3J0e+/zwun2X8aeqGOrzGAJTlP6sSWndx1ePYn5aUsaZi2nLFmbeA
	Ye7T+qvM=
X-Received: by 2002:a05:600c:a4c:b0:43d:300f:fa1d with SMTP id 5b1f17b1804b1-4538ee61b50mr37455745e9.31.1751025316944;
        Fri, 27 Jun 2025 04:55:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxgJfDsSX5zp20qR+Gqu3ACFHA6VlqNRYklPCovpm6sCHWkL6IljTpiOqEKrLvkyyoB1vwtw==
X-Received: by 2002:a05:600c:a4c:b0:43d:300f:fa1d with SMTP id 5b1f17b1804b1-4538ee61b50mr37455035e9.31.1751025316287;
        Fri, 27 Jun 2025 04:55:16 -0700 (PDT)
Received: from localhost (p200300d82f2d5d00f1a32f3065759425.dip0.t-ipconnect.de. [2003:d8:2f2d:5d00:f1a3:2f30:6575:9425])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e6214fsm2517230f8f.98.2025.06.27.04.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 04:55:15 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Rik van Riel <riel@surriel.com>,
	Harry Yoo <harry.yoo@oracle.com>
Subject: [PATCH v1 2/4] mm: smaller folio_pte_batch() improvements
Date: Fri, 27 Jun 2025 13:55:08 +0200
Message-ID: <20250627115510.3273675-3-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627115510.3273675-1-david@redhat.com>
References: <20250627115510.3273675-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let's clean up a bit:

(1) No need for start_ptep vs. ptep anymore, we can simply use ptep

(2) Let's switch to "unsigned int" for everything

(3) We can simplify the code by leaving the pte unchanged after the
    pte_same() check.

(4) Clarify that we should never exceed a single VMA; it indicates a
    problem in the caller.

No functional change intended.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/internal.h | 37 +++++++++++++++----------------------
 1 file changed, 15 insertions(+), 22 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index 9690c75063881..ca6590c6d9eab 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -221,7 +221,7 @@ static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
  * folio_pte_batch - detect a PTE batch for a large folio
  * @folio: The large folio to detect a PTE batch for.
  * @addr: The user virtual address the first page is mapped at.
- * @start_ptep: Page table pointer for the first entry.
+ * @ptep: Page table pointer for the first entry.
  * @pte: Page table entry for the first page.
  * @max_nr: The maximum number of table entries to consider.
  * @flags: Flags to modify the PTE batch semantics.
@@ -233,24 +233,24 @@ static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
  *		  first one is dirty.
  *
  * Detect a PTE batch: consecutive (present) PTEs that map consecutive
- * pages of the same large folio.
+ * pages of the same large folio in a single VMA and a single page table.
  *
  * All PTEs inside a PTE batch have the same PTE bits set, excluding the PFN,
  * the accessed bit, writable bit, dirty bit (unless FPB_HONOR_DIRTY is set) and
  * soft-dirty bit (unless FPB_HONOR_SOFT_DIRTY is set).
  *
- * start_ptep must map any page of the folio. max_nr must be at least one and
- * must be limited by the caller so scanning cannot exceed a single page table.
+ * @ptep must map any page of the folio. max_nr must be at least one and
+ * must be limited by the caller so scanning cannot exceed a single VMA and
+ * a single page table.
  *
  * Return: the number of table entries in the batch.
  */
-static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
-		pte_t *start_ptep, pte_t pte, int max_nr, fpb_t flags,
+static inline unsigned int folio_pte_batch(struct folio *folio, unsigned long addr,
+		pte_t *ptep, pte_t pte, unsigned int max_nr, fpb_t flags,
 		bool *any_writable, bool *any_young, bool *any_dirty)
 {
-	pte_t expected_pte, *ptep;
-	bool writable, young, dirty;
-	int nr, cur_nr;
+	unsigned int nr, cur_nr;
+	pte_t expected_pte;
 
 	if (any_writable)
 		*any_writable = false;
@@ -267,29 +267,22 @@ static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
 	max_nr = min_t(unsigned long, max_nr,
 		       folio_pfn(folio) + folio_nr_pages(folio) - pte_pfn(pte));
 
-	nr = pte_batch_hint(start_ptep, pte);
+	nr = pte_batch_hint(ptep, pte);
 	expected_pte = __pte_batch_clear_ignored(pte_advance_pfn(pte, nr), flags);
-	ptep = start_ptep + nr;
+	ptep = ptep + nr;
 
 	while (nr < max_nr) {
 		pte = ptep_get(ptep);
-		if (any_writable)
-			writable = !!pte_write(pte);
-		if (any_young)
-			young = !!pte_young(pte);
-		if (any_dirty)
-			dirty = !!pte_dirty(pte);
-		pte = __pte_batch_clear_ignored(pte, flags);
 
-		if (!pte_same(pte, expected_pte))
+		if (!pte_same(__pte_batch_clear_ignored(pte, flags), expected_pte))
 			break;
 
 		if (any_writable)
-			*any_writable |= writable;
+			*any_writable |= pte_write(pte);
 		if (any_young)
-			*any_young |= young;
+			*any_young |= pte_young(pte);
 		if (any_dirty)
-			*any_dirty |= dirty;
+			*any_dirty |= pte_dirty(pte);
 
 		cur_nr = pte_batch_hint(ptep, pte);
 		expected_pte = pte_advance_pfn(expected_pte, cur_nr);
-- 
2.49.0

