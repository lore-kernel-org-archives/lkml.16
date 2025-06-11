Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F1CD529
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 00:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749600806; cv=none; b=BndObiMIOwO1+jizoInsCBR/Gut0540FF+zHOhWtTEVNXDlEUDyEe4Zg6jqoxpqeQi5J8CeXa4sK39i70flLnsol+QUrbZ2ARl9U+4YBoH77NApKoc5ZrlYAEbh8JevD17pYoj8agexp+FwpUNNM57RffeH3uzatpXzclyOms74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749600806; c=relaxed/simple;
	bh=SNItmd5R2WhZINe253nyh/MHq5OLywdOxcZlfMkpENg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mS8P0ZrQiDSZ7hAMrBQjNH76d1k6Op9N1HVtzVISHzvOP0DtLYGZSNjM2AVjIs42xu6rNLm/LJRfwrAC0luoHijIjP91G2OfHBM+SKY0oe4kya0tytaT4gOcV4pC3YgOrXza25mo5QbC0xCZ/b7+xEXu0OTtobcYCGvQc4uiNp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WBdT+VhN; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBdT+VhN"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-311d27eb8bdso3778619a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 17:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749600804; x=1750205604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwNzgrxrzZm1rRDLFM6hWfUfWXH1JJ/RfVhLHdqYs2A=;
        b=WBdT+VhNGUbLRt9PDl/n5Pa1GtdphSnQ/mzJflALEoQuJLkYokzbupkBWTJ46lvcrf
         p46A4HV03CGBnW9op3dfzJ/PyFBh2mYuYD4MwDkKBECRD5RM6suDm0W21JJz5/Vt3fc9
         TqC9N/AolpmxqhuFipIgNOZFLNcyBADdsxxrAXEOYNnO50o3zfPLxpo97mY+Qaem+uRL
         7H7UQI/jz8+j+iywpxhtxnb09gerbh/UiTf+BsYhzD5px3q32+LBBy5kQ63pRDF+ek5p
         59+BOgti42hzcs7Nmc9Zrd5eY67mQtMazQJT3P3P9dlQeSSd8F+TZzKFroqxTC3wNvCP
         cSWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749600804; x=1750205604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gwNzgrxrzZm1rRDLFM6hWfUfWXH1JJ/RfVhLHdqYs2A=;
        b=a91vtamx9h48dfpyg7+z3g1eQ2+VOLdntdWspN5LdWed2d0+p4bstuOyNVrYw24YlJ
         sFaI8MfeOhBDrIF3Jo8c/suLWnzezRRgkcG8y/LDCV6TJE6yWYwfk71lxf9HGZNwCwEZ
         glFTZWLo7tgeIMSV8x4zv7WwEPCa162/eWp1HTphlRuhOtsH39GhOVQZ01/kMNK7COps
         0APw2Zt1nLeeZRDCVrZB9IYsfvmw6FpOk9c7m+MQL3O+jbI3t2uOmYNTWAVcepP70PXT
         oiXRlt7AJi/vZJJhoYvM70DgC2L+KsRs7vxqsZg7utP/vrHUjF4opQndPpOw0ci3BzEX
         k2Wg==
X-Forwarded-Encrypted: i=1; AJvYcCX8+1X3dr3ItXrHfRHNQJiP/w2sTQzZjV+QJ/ZUoO2uYGXYK8JGnjnJmoyLOOt7smV+YMBrCApWyLUQLOI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj1B27zrDtdlbwmO6mtr1vdGm1GznFwrM/dTYScfPbmp0HUn9v
	4kZkw04JND/pX/ih4KD0+59/0aGMh8jIJwwkqJmaMG8MUnwwzoaN+icT
X-Gm-Gg: ASbGncte+gq7AxPqvNvelbZ6EofScA2Hp/gFY3CoQlv/q+J3dUZPJv/pkulWbVNlr5K
	foRv8y8qWK8yNWAP7zQOga1e8+zKq07ahQMSynfD2pbDprg3f1gwYZFT496wAHPSGVOEt/zGvkH
	widdnIFGOqTn6DKPXodVzOP4QLkdo6Hm85lqMWSpxNya9s2yKTto+NgaUA5EPkU74WT9Li5uoxp
	orkrd3khAx+pYDDEoF7SDRMALHxzz+Zq0TJDIqdYrD50YuDW2CHVPhhrrTRZa5oGWKMdd+GbgXo
	9nTsZfqqNpG4AcQuB7NWE5DHS6sLGDvIsSLOa2ePz4he6JxyaX4BXMoYfm1D7pnWfHmoE1dtepB
	qdLTYK3xeXH4Ui2JHpzzs
X-Google-Smtp-Source: AGHT+IEnVIJq8re2nkxKhrVozBJlMxoUvTXEOoZn3mbH4xRKhEQUjhgYJTFjn9s27Mup4N+t/eXxRA==
X-Received: by 2002:a17:90b:274a:b0:312:e1ec:de44 with SMTP id 98e67ed59e1d1-313af1f4a63mr1816899a91.27.1749600804133;
        Tue, 10 Jun 2025 17:13:24 -0700 (PDT)
Received: from fedora.. (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-313b2137b77sm161367a91.34.2025.06.10.17.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 17:13:23 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH 1/4] m68k: mm: Convert get_pointer_table() to use ptdescs
Date: Tue, 10 Jun 2025 17:12:52 -0700
Message-ID: <20250611001255.527952-2-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611001255.527952-1-vishal.moola@gmail.com>
References: <20250611001255.527952-1-vishal.moola@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Motorola uses get_pointer_table() for page tables, so it should be using
struct ptdesc, not struct page.

This helps us prepare to allocate ptdescs as their own memory
descriptor, and prepares to remove a user of page->lru.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/m68k/mm/motorola.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
index 745bd575dcfa..35c3571ffbef 100644
--- a/arch/m68k/mm/motorola.c
+++ b/arch/m68k/mm/motorola.c
@@ -148,16 +148,18 @@ void *get_pointer_table(struct mm_struct *mm, int type)
 
 	/*
 	 * For a pointer table for a user process address space, a
-	 * table is taken from a page allocated for the purpose.  Each
-	 * page can hold 8 pointer tables.  The page is remapped in
+	 * table is taken from a ptdesc allocated for the purpose.  Each
+	 * ptdesc can hold 8 pointer tables.  The ptdesc is remapped in
 	 * virtual address space to be noncacheable.
 	 */
 	if (mask == 0) {
-		void *page;
+		struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL | __GFP_ZERO, 0);
+		void *pt_addr;
 		ptable_desc *new;
 
-		if (!(page = (void *)get_zeroed_page(GFP_KERNEL)))
+		if (!ptdesc)
 			return NULL;
+		pt_addr = ptdesc_address(ptdesc);
 
 		switch (type) {
 		case TABLE_PTE:
@@ -165,23 +167,23 @@ void *get_pointer_table(struct mm_struct *mm, int type)
 			 * m68k doesn't have SPLIT_PTE_PTLOCKS for not having
 			 * SMP.
 			 */
-			pagetable_pte_ctor(mm, virt_to_ptdesc(page));
+			pagetable_pte_ctor(mm, ptdesc);
 			break;
 		case TABLE_PMD:
-			pagetable_pmd_ctor(mm, virt_to_ptdesc(page));
+			pagetable_pmd_ctor(mm, ptdesc);
 			break;
 		case TABLE_PGD:
-			pagetable_pgd_ctor(virt_to_ptdesc(page));
+			pagetable_pgd_ctor(ptdesc);
 			break;
 		}
 
-		mmu_page_ctor(page);
+		mmu_page_ctor(pt_addr);
 
-		new = PD_PTABLE(page);
+		new = PD_PTABLE(pt_addr);
 		PD_MARKBITS(new) = ptable_mask(type) - 1;
 		list_add_tail(new, dp);
 
-		return (pmd_t *)page;
+		return (pmd_t *)pt_addr;
 	}
 
 	for (tmp = 1, off = 0; (mask & tmp) == 0; tmp <<= 1, off += ptable_size(type))
@@ -191,7 +193,7 @@ void *get_pointer_table(struct mm_struct *mm, int type)
 		/* move to end of list */
 		list_move_tail(dp, &ptable_list[type]);
 	}
-	return page_address(PD_PAGE(dp)) + off;
+	return ptdesc_address(PD_PTDESC(dp)) + off;
 }
 
 int free_pointer_table(void *table, int type)
-- 
2.49.0

