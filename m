Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CD82FCE24
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 15:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751642749; cv=none; b=rxmUXQw3jSkMRSwhKKAkfSqjDGIHcxpkIoR/j4QabFlL4/9C5ALtgsu+lDEXPICDUEErFx/RAmSHn+jStQ8AgfCEMtyqikzqC/WUlQz4+M/V+9zyKNhcg8UuQQjFl++VqP3snwBdKuFAE2kxdFkUjc03UlDQxNuJI/7DCouCYTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751642749; c=relaxed/simple;
	bh=QERXImmKTFcq5MvR6flFLm9XxD1DBZ2gtpjDf6XrFRs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iX/7qdAPfHPVQ8xM5fizRumYTpaLdErTqvd3JaZNsr+gtxCi6VYYp09BxZLo2zPFcJ106tQ8/c+74XqwIkFN9WRgUff2eidWdi+WoUE/ns+tM9K3taGN6lbrxTaS1JPQwb/JeyBy4XWrfvGwkCMB1XSNI7Ys/VtGHxlz57djYiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i3Q3ccBv; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i3Q3ccBv"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-556fd896c99so774731e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 08:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751642746; x=1752247546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=arwAS3MnsbTZHt/wqS3QddqTZ/QZ8JyexXGr/bs6RJk=;
        b=i3Q3ccBv+bL0kNq3Xjo8E2+SQ4SAQ4Y/rDqB1ORZVvOm2AKmIZwOnVGcexhe6qR3dL
         pEyqLLK21DCdZuITia00r/SCAq+RoABLvnBecmxBeLzIH72uR7vY2A6MJifdh5X1giuQ
         kg8uc6iCGem2JFjVU32wqWekLc7vIuZG/B9o+CdFb/eMzOaCxMqtIzaOi5sYGbE8l8XC
         VKgSbs1p4PVMB0CS0VUVZ8dYGxctG42mwUop0czPaH3kLDD0x5eQuSa1v2WQUiW6G6gc
         T+X7gjM8mzfXEdzks5mZxPQHNm/GjuK6HguGln3QK9Nx+zBAI4hRhnIKuOK/2IfvSBib
         o/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751642746; x=1752247546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=arwAS3MnsbTZHt/wqS3QddqTZ/QZ8JyexXGr/bs6RJk=;
        b=ZqX+00ZNNIkAgBlJcPPmP4J0nB92Rws5hdv1Z8fUeuz2RQqnNwG48FIclJisHlbnma
         Eyx3Lhvq1gkRXp5neyRO22dP83q6i51dFOzPC1DujTxO5RTZwZa2W9eI8l8n6/+xsUtO
         XG0cHh+o0ZThZn3tRZMkCz7LYtA0dwtAXY518J7KGlEqSMA8ulK15SbIVEX2yuDpbuKi
         6rJk33AhIipINogNKU9QvRZgbbGgL77EFJshwarEzbk4mUvmWLJiorcXFPqqojh25p3q
         niz8yFJ0vMPSuD8tZNfvWwMnL9zjPuaLMIdObLF5hj1t9oCX+ZPmizCzm7babj4os9Nt
         0+7w==
X-Forwarded-Encrypted: i=1; AJvYcCWqELBm+Q4flPusX9tOACDcfgP+n2sJ3tWrr5OC4r7QuUlDmqG+7Ud8jUFBNJkEqBwu12ttdG7u3y8betY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1FcNm4X7Oy+qf/IAOp30bUDWgtOv423WI3FQZuxTPAzyxfzN0
	5UTou1v6UBKK1Z4hJ4QzMdmw21WYg3g982vETNONOE2DaRz8HdVyFV9B
X-Gm-Gg: ASbGncvFjbxOSUuuvzoIlky4S/a026oz4/otTnIHON3wRnxDlfUtpBEasG3XXzKzKGa
	IV6OVBk8eCHo1DuOSfwyBBWKM0llqz3gGBR32xs1UzfhxUIGOmvOuA1LsB70AaHUDZNCzem278C
	0k9BOmxX21uCNEXfVfA6hFsDEH+b2jeMhz8KpTQ3InQhgvb/3Ys0HCCeHSHn697PtTyzOqoy5e5
	B8+BSYCHXGpIGmS9EfX2Jqa7uKUiW5ywGSyLlz78hXYXh+vrKAxBCIfT9isYFBuVL5Rft1VCdJP
	w3AP8cHY7biqhFULYryHSOFvmAkOkiP/6D/gYTqYhfq0MwTUIx6BhNEvEQ==
X-Google-Smtp-Source: AGHT+IEYL7tRLeQ9FHsJy0cpiiGVHfquXjv3sMFZffM/DIKO7uvCOChW4gRxbWFFqxpfUSQWnHPTig==
X-Received: by 2002:a05:6512:e99:b0:553:37a7:b217 with SMTP id 2adb3069b0e04-557aa292c14mr873459e87.35.1751642745406;
        Fri, 04 Jul 2025 08:25:45 -0700 (PDT)
Received: from pc638.lan ([2001:9b1:d5a0:a500:2d8:61ff:fec9:d743])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383bb113sm281028e87.11.2025.07.04.08.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:25:44 -0700 (PDT)
From: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Baoquan He <bhe@redhat.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC 6/7] mm/vmalloc: Support non-blocking GFP flags in __vmalloc_area_node()
Date: Fri,  4 Jul 2025 17:25:36 +0200
Message-Id: <20250704152537.55724-7-urezki@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704152537.55724-1-urezki@gmail.com>
References: <20250704152537.55724-1-urezki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch makes __vmalloc_area_node() to correctly handle non-blocking
allocation requests, such as GFP_ATOMIC and GFP_NOWAIT. Main changes:

- nested_gfp flag follows the same non-blocking constraints
  as the primary gfp_mask, ensuring consistency and avoiding
  sleeping allocations in atomic contexts.

- if blocking is not allowed, __GFP_NOFAIL is forcibly cleared
  and warning is issued if it was set, since __GFP_NOFAIL is
  incompatible with non-blocking contexts;

- Add a __GFP_HIGHMEM to gfp_mask only for blocking requests
  if there are no DMA constraints.

- in non-blocking mode we use memalloc_noreclaim_save/restore()
  to prevent reclaim related operations that may sleep while
  setting up page tables or mapping pages.

This is particularly important for page table allocations that
internally use GFP_PGTABLE_KERNEL, which may sleep unless such
scope restrictions are applied. For example:

<snip>
    #define GFP_PGTABLE_KERNEL (GFP_KERNEL | __GFP_ZERO)

    __pte_alloc_kernel()
        pte_alloc_one_kernel(&init_mm);
            pagetable_alloc_noprof(GFP_PGTABLE_KERNEL & ~__GFP_HIGHMEM, 0);
<snip>

Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 mm/vmalloc.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 2eaff0575a9e..fe1699e01e02 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3711,7 +3711,7 @@ static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
 				 pgprot_t prot, unsigned int page_shift,
 				 int node)
 {
-	const gfp_t nested_gfp = (gfp_mask & GFP_RECLAIM_MASK) | __GFP_ZERO;
+	gfp_t nested_gfp = (gfp_mask & GFP_RECLAIM_MASK) | __GFP_ZERO;
 	bool nofail = gfp_mask & __GFP_NOFAIL;
 	unsigned long addr = (unsigned long)area->addr;
 	unsigned long size = get_vm_area_size(area);
@@ -3719,12 +3719,28 @@ static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
 	unsigned int nr_small_pages = size >> PAGE_SHIFT;
 	unsigned int page_order;
 	unsigned int flags;
+	bool noblock;
 	int ret;
 
 	array_size = (unsigned long)nr_small_pages * sizeof(struct page *);
+	noblock = !gfpflags_allow_blocking(gfp_mask);
 
-	if (!(gfp_mask & (GFP_DMA | GFP_DMA32)))
-		gfp_mask |= __GFP_HIGHMEM;
+	if (noblock) {
+		/* __GFP_NOFAIL is incompatible with non-blocking contexts. */
+		WARN_ON_ONCE(gfp_mask & __GFP_NOFAIL);
+		gfp_mask &= ~__GFP_NOFAIL;
+
+		/*
+		 * In non-sleeping contexts, ensure nested allocations follow
+		 * same non-blocking rules.
+		 */
+		nested_gfp = gfp_mask | __GFP_ZERO;
+		nofail = false;
+	} else {
+		/* Allow highmem allocations if there are no DMA constraints. */
+		if (!(gfp_mask & (GFP_DMA | GFP_DMA32)))
+			gfp_mask |= __GFP_HIGHMEM;
+	}
 
 	/* Please note that the recursion is strictly bounded. */
 	if (array_size > PAGE_SIZE) {
@@ -3788,7 +3804,9 @@ static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
 	 * page tables allocations ignore external gfp mask, enforce it
 	 * by the scope API
 	 */
-	if ((gfp_mask & (__GFP_FS | __GFP_IO)) == __GFP_IO)
+	if (noblock)
+		flags = memalloc_noreclaim_save();
+	else if ((gfp_mask & (__GFP_FS | __GFP_IO)) == __GFP_IO)
 		flags = memalloc_nofs_save();
 	else if ((gfp_mask & (__GFP_FS | __GFP_IO)) == 0)
 		flags = memalloc_noio_save();
@@ -3800,7 +3818,9 @@ static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
 			schedule_timeout_uninterruptible(1);
 	} while (nofail && (ret < 0));
 
-	if ((gfp_mask & (__GFP_FS | __GFP_IO)) == __GFP_IO)
+	if (noblock)
+		memalloc_noreclaim_restore(flags);
+	else if ((gfp_mask & (__GFP_FS | __GFP_IO)) == __GFP_IO)
 		memalloc_nofs_restore(flags);
 	else if ((gfp_mask & (__GFP_FS | __GFP_IO)) == 0)
 		memalloc_noio_restore(flags);
-- 
2.39.5

