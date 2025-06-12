Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EA920C485
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 12:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749730171; cv=none; b=oLaPtCiSzj+vm50HwsaJfayXgKuDMBVB2jDb/8KYanWiRH/oV2E0aWYDe1Nwx/lrXAt6kawTMr5mPII/7zh32/orv2d1EuWyWqTpgfeqSF5VKKx4hQqOzc22iipmtuj5jlY6DOvEzwakuWGQqNtJ7WMlN6D0vtjfdvPwkx9tp6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749730171; c=relaxed/simple;
	bh=CQTMBqrwO1xjHlPpoOYlHzVJJtakGvEfnnp4M+O0iR0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MxeFTZ8BIEq4BnFduJT+bD65bnTAsFYUwEhukJlOUnK/VhOL5AbIZ825N5gclilgOT1NZQDhyudKVBu6tIU3He6pvh1JaQXHt4WEBnQ9yoLa5aQYFuNGRZvl1zmCnynMpi968Pe8Fx2CUBWxyWZSei4EDxEFqSWuDvEd9Q5xQUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MNEG8Gq8; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MNEG8Gq8"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-234f17910d8so8793375ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 05:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749730169; x=1750334969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qc+fJ5kUSUbKMuOdmwlhqgXfGsc4A0Ke0MUmskDWchg=;
        b=MNEG8Gq8uOZIE+OedMYVDGDTT+cgrIVG7DBuCeMIey8JcqFyv6vvnMyslgyAfTwInT
         /r1wdnZS09xyz7faPwnu3WPhMQowPivumFmkr+NXUKZ+xE1LiQo4Yovi5SXI0ikhJOkq
         nWBKxfw4Fp/SFTnp5vw6Rw5SampV0JZKh/0tvkkNkcy76rujrWG2dsysCIQOf4N4346M
         JaCk3QulNlkZktDok76flJhlDiEvXJ+a1APwgwwF+tfHi4GyA2r3RtkzkxRieEwD4DWI
         pmDCwhcWnuNMOwMqF5aCxessYGmnS4SqeyDLMrySgZnVmNdVxlbvIB3fuOxVbVJ7B6qR
         +uVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749730169; x=1750334969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qc+fJ5kUSUbKMuOdmwlhqgXfGsc4A0Ke0MUmskDWchg=;
        b=G60p9FyTcPfy8IV5hrXNcAYbSd0ZcBByDbSRFnLdymXm6nFtZpF4Qkvn/DmAf+qexe
         Flcim0zmNBp7g0hkmjFybBBA6WmQPvIwiJihNv2gYx3pPEXchlsx4rjSVmSQhGenN6DX
         s9y18uzSkZCJ+NrdvaMq+L3OGozYxuergI4MG0lI+FjKlRfA0RqlSQvTcCWRnYsBJOpC
         C58N/SK+Dd9r7lv6OmXB8/8imf8PjTXr79ekiQkdq4YjnrLGr+o+Hq+pBKYux8X5tDfH
         NpIKucudLouYG+13PAQ4fpkBko9ttn9YUrXjj41YPixu8ibIfS2m8oDfJXT9Dsr7odlN
         qO6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVhPrijO3sJTUMG85Vhi/ftl3rhjY8/gUyCLC6Qk8FvCoRA+pkK4EFkm8EhmQmHUar9dMdHrz2OLD61QOA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq6LUTRw1Mm9lAH05oaQrO9STklwucNFuBaiEKtSaqAZ4hJsUl
	MmIAZC0SbtpAqoSUZ40Vtr6j6mFvbebE2wJa/4W2o4uJPf29LjqBHt39
X-Gm-Gg: ASbGncs6igseOmw3VPQ0m/NRA907mwX+T6yN5RWJnV1FP75eFiIVZ4TwcPYHpVClQFi
	OyKxKVqEuLtQ+ZEH6Ly+rHdmL8M/tDXE2mdtUTQxS70SnShpF4qOk7PJ8J05D2ejnVYuSvgwD3a
	vtFzIjZnEwj2ubMkEro64AWnLe5LJW1QOo3vZ6yE1eQEIu40uVtUtVYgOOKu1qSYJItT1Nf9gGs
	hQ+lNVYc5ktKS+ePj4SlyuBZLS0DAsc9kdICirTqi34E7zAvseEcLzAp+NpuPe2D2EQVRGyPnth
	Dss/PIQzkexLlr/f3Yaa1Em3rptQQO18FtWRBf1Cfd1pSYQPEBFs+Wt+trPv4Elq3McMNEgCiVn
	0
X-Google-Smtp-Source: AGHT+IG8kP612PZkW6Rpi0Vr/xRiBqYfLilslNPiXK39tjv65V4A6ZdWSeLlYYC8zylzgPFdEa1c2Q==
X-Received: by 2002:a17:902:d58f:b0:235:ef79:2997 with SMTP id d9443c01a7336-2364cabaa7fmr44325705ad.47.1749730168776;
        Thu, 12 Jun 2025 05:09:28 -0700 (PDT)
Received: from localhost.localdomain ([43.225.59.120])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e717293sm12166515ad.196.2025.06.12.05.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 05:09:28 -0700 (PDT)
From: peng li <peng8420.li@gmail.com>
To: david@redhat.com
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	peng li <peng8420.li@gmail.com>
Subject: [PATCH] mm/pagewalk: Clean up folio_walk_start() by removing expose_page
Date: Thu, 12 Jun 2025 20:09:03 +0800
Message-Id: <20250612120903.2678910-1-peng8420.li@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The name expose_page is confusing to understand. From the code logic, it is
probably meant to express "belongs to the normal page and get offset from
the mapped page"?
Perhaps changing "expose_page" to "normal_mapped_page" can better express
its behavior? But perhaps its existence is meaningless, because fw->page
can be directly confirmed and obtained from the page type without the need
for a separate flag.

Key changes:
1. Remove expose_page and its conditional logic
2. Always set fw->page when a valid page is found
3. Add clarifying comments about offset calculation
4. Initialize fw->page to NULL at PMD/PTE levels

Signed-off-by: peng li <peng8420.li@gmail.com>
---
 mm/pagewalk.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/mm/pagewalk.c b/mm/pagewalk.c
index e478777c86e1..15150c27b9cf 100644
--- a/mm/pagewalk.c
+++ b/mm/pagewalk.c
@@ -831,7 +831,6 @@ struct folio *folio_walk_start(struct folio_walk *fw,
 		folio_walk_flags_t flags)
 {
 	unsigned long entry_size;
-	bool expose_page = true;
 	struct page *page;
 	pud_t *pudp, pud;
 	pmd_t *pmdp, pmd;
@@ -884,6 +883,9 @@ struct folio *folio_walk_start(struct folio_walk *fw,
 		 * support PUD mappings in VM_PFNMAP|VM_MIXEDMAP VMAs.
 		 */
 		page = pud_page(pud);
+
+		/* Note: Offset from the mapped page, not the folio start. */
+		fw->page = nth_page(page, (addr & (entry_size - 1)) >> PAGE_SHIFT);
 		goto found;
 	}
 
@@ -902,6 +904,7 @@ struct folio *folio_walk_start(struct folio_walk *fw,
 		fw->level = FW_LEVEL_PMD;
 		fw->pmdp = pmdp;
 		fw->pmd = pmd;
+		fw->page = NULL;
 
 		if (pmd_none(pmd)) {
 			spin_unlock(ptl);
@@ -912,11 +915,12 @@ struct folio *folio_walk_start(struct folio_walk *fw,
 		} else if (pmd_present(pmd)) {
 			page = vm_normal_page_pmd(vma, addr, pmd);
 			if (page) {
+				/* Note: Offset from the mapped page, not the folio start. */
+				fw->page = nth_page(page, (addr & (entry_size - 1)) >> PAGE_SHIFT);
 				goto found;
 			} else if ((flags & FW_ZEROPAGE) &&
 				    is_huge_zero_pmd(pmd)) {
 				page = pfn_to_page(pmd_pfn(pmd));
-				expose_page = false;
 				goto found;
 			}
 		} else if ((flags & FW_MIGRATION) &&
@@ -924,7 +928,6 @@ struct folio *folio_walk_start(struct folio_walk *fw,
 			swp_entry_t entry = pmd_to_swp_entry(pmd);
 
 			page = pfn_swap_entry_to_page(entry);
-			expose_page = false;
 			goto found;
 		}
 		spin_unlock(ptl);
@@ -942,15 +945,18 @@ struct folio *folio_walk_start(struct folio_walk *fw,
 	fw->level = FW_LEVEL_PTE;
 	fw->ptep = ptep;
 	fw->pte = pte;
+	fw->page = NULL;
 
 	if (pte_present(pte)) {
 		page = vm_normal_page(vma, addr, pte);
-		if (page)
+		if (page) {
+			/* Note: Offset from the mapped page, not the folio start. */
+			fw->page = nth_page(page, (addr & (entry_size - 1)) >> PAGE_SHIFT);
 			goto found;
+		}
 		if ((flags & FW_ZEROPAGE) &&
 		    is_zero_pfn(pte_pfn(pte))) {
 			page = pfn_to_page(pte_pfn(pte));
-			expose_page = false;
 			goto found;
 		}
 	} else if (!pte_none(pte)) {
@@ -959,7 +965,6 @@ struct folio *folio_walk_start(struct folio_walk *fw,
 		if ((flags & FW_MIGRATION) &&
 		    is_migration_entry(entry)) {
 			page = pfn_swap_entry_to_page(entry);
-			expose_page = false;
 			goto found;
 		}
 	}
@@ -968,11 +973,6 @@ struct folio *folio_walk_start(struct folio_walk *fw,
 	vma_pgtable_walk_end(vma);
 	return NULL;
 found:
-	if (expose_page)
-		/* Note: Offset from the mapped page, not the folio start. */
-		fw->page = nth_page(page, (addr & (entry_size - 1)) >> PAGE_SHIFT);
-	else
-		fw->page = NULL;
 	fw->ptl = ptl;
 	return page_folio(page);
 }

base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.25.1

