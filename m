Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9211129C35F
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 09:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750930157; cv=none; b=hPIeR5EB1aa3pbrSDDdpkUuY9S+EXrrTSiLKaFfv3u4UmBEVysL5TEr8PcwoXs7tU6TW52kOvl1l6oSBfd4VNF2EiZmXAKd5lmbXw5ZI+1OG0lGwppwChBdBjUB2jNdHRDU3emtKwZdGdXBGOc1qn1a5dxHumhhBqFhTNrHrzKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750930157; c=relaxed/simple;
	bh=kDfLWh1mGf3KaWrnD/PC2Ds9y9iJDXiahDxr7ekg2iY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V67p7cERYr5JApLfohVLn93KCyFwN3E/un0w0SAPK0WXuBpgUVBFcNSdDel6Eqt5OJP3NxyYUkW2/3HVaFTOx95jxg5ltFMEGKtjrupoZeu2IOU27NJbxsdM2oNegSSUTK6sUkgru2iQTvQZ9LbzT3l/aJT10/wjbnj9zaRl8Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UzFPB8Wm; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UzFPB8Wm"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a6cd1a6fecso703590f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 02:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750930154; x=1751534954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfPg1bPzYUgjbdKxXUbIHHPyI6o1ylxUcethQzPOy2s=;
        b=UzFPB8WmwKtbvzglFWT4ncqztO4IkXItBo+kxrDe54H0EMY4+js6HlFRMQGuZOhP98
         17RI8+5SwOjLzL4fZPj652VBHDUj80lJsqLpuYu9LrnpzGlFCIM2J38GdjXZXZ0Qmzls
         vvymSiTvPtxFmdOzAz8MBN8s8dUoJWw/VAsCL9RGuz8w3uhH2301MXVT7ntxLhNPXZPp
         UtyuFVVrbJpxlbqCTWtwNB09tYE0C9OaOE46miPcdeh1nEXle3PsJABF6fgVsbDwTcXD
         McK4gg6y4ED40sQzEuypiYtpLt9aJfzp7CvT4gWDXSLPVksPVkgJN4MPoZKn9MpgXK0S
         5oTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750930154; x=1751534954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfPg1bPzYUgjbdKxXUbIHHPyI6o1ylxUcethQzPOy2s=;
        b=o9P634EByenlD+OnT4IwtUxZS2qYjPwLeDbifzmwOWgH3qQUyGSmcLkP3TkZjgsbwD
         cRufK+6FhSOJxEXK0sUbMuC5YN6DKRfFOSta/dQMwVixB05SKQBr5BdVm5/+4QK/a8nt
         WrHTZQlC5j10k+c3fso2swwo5kzz89QRvrc1ZThxSbDeQ6rPS9urQOOwX00eIKITGEHA
         CZiUO4rBDg8ibIsNj0C6EouPGwl/SvU87uOnX9I/aFEctB/vqQ91YeNjUv8vMDTenvI7
         hzkv7FWN5SccXmY610PQdhk6Od0ciE2T3KCqvd7SxB21XYRd9CQo15vNB9zxWQkfGtfn
         /OKA==
X-Forwarded-Encrypted: i=1; AJvYcCXOTIvWv2jwmzOfq/Rpq3kqzuljABXROtCczwlH5TMLWHry7toUW8NB0A9gIbcvGoknoqSa830McsD9ToA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0I4HfWZJSd2ekDSpB4voFW47tpYJ2sl1j1O8Zp/L7x02KCieZ
	56KYCBpywZPLJhvUo6kfl5lnu7n3ltHom5R6H5jjKYonyzES6LsKr3XH
X-Gm-Gg: ASbGncutHnB/B2BGpaR6i0ESuXHvnm6dUdmrBuvI6lPPinDmMCxO8v44X0UMt0xv/hF
	NDFU44ICQequAuc6Zc1t8eVBuosn/4LWL6zJ+5YI3q3G18rsf6reIkk8b6bHWBiOxyX/JOlHues
	aRxj4BmrGghRlYJMk8JXdI82o9qYwQzmCJsY3NrEVQH7H6c6TOomIJ0+MJvxK3evLgtD7PwH3CW
	/KdKjui67CQjE3Iljst36Cen3rFAdJxzTMdfaLkgvA0S1DJbf8imm+ZYZSvcIEsDtkEoAwbjrA/
	WA6Q/eN8wHzrkXJi9prk2hsyMjNFSzm8fG3p+dHfmGGjsBA=
X-Google-Smtp-Source: AGHT+IFKXFVQqQF/e1a/uqOSmFAWHw7Suwi2bBnIU1uj7qmwG8d6IbJ3C4uZB9qONaL/NItzf1KkxQ==
X-Received: by 2002:a05:6000:4112:b0:3a5:8905:2dda with SMTP id ffacd0b85a97d-3a6ed646c23mr5123244f8f.43.1750930153481;
        Thu, 26 Jun 2025 02:29:13 -0700 (PDT)
Received: from EBJ9932692.tcent.cn ([2a09:0:1:2::3086])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e8113b00sm7002427f8f.96.2025.06.26.02.29.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Jun 2025 02:29:13 -0700 (PDT)
From: Lance Yang <ioworker0@gmail.com>
To: david@redhat.com
Cc: 21cnbao@gmail.com,
	akpm@linux-foundation.org,
	baolin.wang@linux.alibaba.com,
	chrisl@kernel.org,
	ioworker0@gmail.com,
	kasong@tencent.com,
	lance.yang@linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	lorenzo.stoakes@oracle.com,
	ryan.roberts@arm.com,
	v-songbaohua@oppo.com,
	x86@kernel.org,
	ying.huang@intel.com,
	zhengtangquan@oppo.com
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large folios during reclamation
Date: Thu, 26 Jun 2025 17:29:05 +0800
Message-ID: <20250626092905.31305-1-ioworker0@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <a5b5b0aa-21c4-4abf-b323-63af96aabcd5@redhat.com>
References: <a5b5b0aa-21c4-4abf-b323-63af96aabcd5@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Before I send out the real patch, I'd like to get some quick feedback to
ensure I've understood the discussion correctly ;)

Does this look like the right direction?

diff --git a/mm/rmap.c b/mm/rmap.c
index fb63d9256f09..5ebffe2137e4 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1845,23 +1845,37 @@ void folio_remove_rmap_pud(struct folio *folio, struct page *page,
 #endif
 }
 
-/* We support batch unmapping of PTEs for lazyfree large folios */
-static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
-			struct folio *folio, pte_t *ptep)
+static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
+			struct page_vma_mapped_walk *pvmw,
+			enum ttu_flags flags, pte_t pte)
 {
 	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
-	int max_nr = folio_nr_pages(folio);
-	pte_t pte = ptep_get(ptep);
+	unsigned long end_addr, addr = pvmw->address;
+	struct vm_area_struct *vma = pvmw->vma;
+	unsigned int max_nr;
+
+	if (flags & TTU_HWPOISON)
+		return 1;
+	if (!folio_test_large(folio))
+		return 1;
 
+	/* We may only batch within a single VMA and a single page table. */
+	end_addr = pmd_addr_end(addr, vma->vm_end);
+	max_nr = (end_addr - addr) >> PAGE_SHIFT;
+
+	/* We only support lazyfree batching for now ... */
 	if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
-		return false;
+		return 1;
 	if (pte_unused(pte))
-		return false;
-	if (pte_pfn(pte) != folio_pfn(folio))
-		return false;
+		return 1;
+
+	/* ... where we must be able to batch the whole folio. */
+	if (pte_pfn(pte) != folio_pfn(folio) || max_nr != folio_nr_pages(folio))
+		return 1;
+	max_nr = folio_pte_batch(folio, addr, pvmw->pte, pte, max_nr, fpb_flags,
+				 NULL, NULL, NULL);
 
-	return folio_pte_batch(folio, addr, ptep, pte, max_nr, fpb_flags, NULL,
-			       NULL, NULL) == max_nr;
+	return (max_nr != folio_nr_pages(folio)) ? 1 : max_nr;
 }
 
 /*
@@ -2024,9 +2038,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 			if (pte_dirty(pteval))
 				folio_mark_dirty(folio);
 		} else if (likely(pte_present(pteval))) {
-			if (folio_test_large(folio) && !(flags & TTU_HWPOISON) &&
-			    can_batch_unmap_folio_ptes(address, folio, pvmw.pte))
-				nr_pages = folio_nr_pages(folio);
+			nr_pages = folio_unmap_pte_batch(folio, &pvmw, flags, pteval);
 			end_addr = address + nr_pages * PAGE_SIZE;
 			flush_cache_range(vma, address, end_addr);
 
@@ -2206,13 +2218,16 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 			hugetlb_remove_rmap(folio);
 		} else {
 			folio_remove_rmap_ptes(folio, subpage, nr_pages, vma);
-			folio_ref_sub(folio, nr_pages - 1);
 		}
 		if (vma->vm_flags & VM_LOCKED)
 			mlock_drain_local();
-		folio_put(folio);
-		/* We have already batched the entire folio */
-		if (nr_pages > 1)
+		folio_put_refs(folio, nr_pages);
+
+		/*
+		 * If we are sure that we batched the entire folio and cleared
+		 * all PTEs, we can just optimize and stop right here.
+		 */
+		if (nr_pages == folio_nr_pages(folio))
 			goto walk_done;
 		continue;
 walk_abort:
--

Thanks,
Lance
