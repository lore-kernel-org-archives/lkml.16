Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCBCEAF6
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 09:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746695266; cv=none; b=C005LT9pt5BksG237sAe+DrOIh3qk6ByHVuI2gofoyDjLZIO8ndSBaG8o2UVRE0oKnnWFg1gBDVRMm/6UhTt6/r+uWMkySb27gTKdPDlQSCRbUdYIE+YBZmFYNZR1NU+1+NBX2oQ0O6/fCtTDQ0byN+TmcSIcjABKyZ1UyFLNJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746695266; c=relaxed/simple;
	bh=TKwi/y4TtFwBOzXvq/iVApkONSwqtwirmTxVv59GJ04=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=WFZzkRwEWxA72kZVpbjU6r2QJ+qI4xNMM0O2sataIECp9zm0jeLsFflbl+fwaso/oikjuDOKklODUcgetxNctXPz7p8b49YNWKdOUEjDydoMzk2BOZwcAjBju06L6CzMUPjVLX4K2p3xH+GfivsDW9I5ckO8rp7Tk0YLNR80jH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LmSqX1iY; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LmSqX1iY"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-30a8c9906e5so959622a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 02:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746695264; x=1747300064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G59wmYTEp5CZVNWd3zANz7fLvnvyW6wlXmFfNSZ4Nas=;
        b=LmSqX1iYBJJDHn7JKveZL0YK2MTJUM79oqQJMKVm1UXkdtTC01L+2sGVi6E+LurzW2
         Gz7uqNxoYxr1XKOc2Tun1ffR2M50xqtSO0AyDtQnWOAuwkWahdPUYkFk7OxBdXKnaIS7
         vfj6EivzH0L0yul88TBgEF1OBPh/QwvatOUhQ0sxmABMB0URFsEnvGJ3jxWyrp00x47a
         wDRliYnvbBjeA03mKjwXkGsBedUbtLYLj1EbWeGa3KrAz0EdY7chjVP3hlRYr2lmOhvN
         b2vgyd6XaU6uCN+vBBaj4dU6m2aVThBd08dy0XO4Z7XD9jgq7vuR7FERu9m+QiXRn/CP
         ZgvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746695264; x=1747300064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G59wmYTEp5CZVNWd3zANz7fLvnvyW6wlXmFfNSZ4Nas=;
        b=Jt//FyQ5px5huYGwZUM1KPCkw9D69e1to4LdDovsjeisTokH2d1ln5i0WLmz0fxsci
         zaCeg0BjU7DZBWXKxBiZ5MpN8GKFE2oGXk/UChu3TXJaE/wnk5sf5OaQJ0rJS4+V3DJ2
         FO5P5p1W8ZRQbk1mK0S2OXOuUxWvOJNq+eMqVbvkUB2BGBOPmUyWiNheuLiqhmB20YKA
         mIfl+tWcL04xndad7xvb6rHwoTAs0rNwuodpbiyWES+08mjvEo2Dy3DuW8NMiB0XvVh5
         8+q9CAVafnOvkzU16FHdskmTysHWHOsBNh0m6RYGrBBXJFapXhT58oPyxoSIoOanvOwU
         gerw==
X-Gm-Message-State: AOJu0YxWpnLSddApHkv81aCXByxLPJpMGMZmzmtVzSF43fWSG9PmdCH0
	ca0WZLd06DkVRe624hGmkVyUI18YdBmkTU75dbxhOa34/8z3CEVd
X-Gm-Gg: ASbGnctVn2wwAulPjc+h2sfiMfrveZViF4zcgjq6SjOTD2FX5KbXHEDK1LRapBQ46JK
	M7d47GtBeYXbr7lSkIxTzaaDHRxIWZBhgwhAjQPrKSrqK5J8bOBOiT6KU1OeZlR32bq/VrMNjlV
	gFWn/e2ZET6tVaJIxm9LDpcZzA7tTjYnyScCnB2+cDvMDXSJqJSZMOX8K9eGmIXiQEZEC5pLn7h
	+CRhbYVc0YisNkflJjMggFqDMk5DpwcwKLcsTdjgSa16sg6mLRB8WY1bspDv2f8xWI28MtXBFYS
	lMCQtxz6Hi1oC8EYPLQ+Jyv00fOe9bIlc4eSSn6H5/fkMWY8gLfdAw8tHQ==
X-Google-Smtp-Source: AGHT+IGiE8488YJK1sIW3qbGbcFmbvSB7DRXNdU/o8vJJjPjJcjqo8+MYtY0hX9blpGRgL6LSyZMwQ==
X-Received: by 2002:a17:90b:38c2:b0:2ff:592d:23bc with SMTP id 98e67ed59e1d1-30b28cdc729mr3619651a91.4.1746695263949;
        Thu, 08 May 2025 02:07:43 -0700 (PDT)
Received: from Barrys-MBP.hub ([118.92.10.104])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4d54ff6sm1696043a91.25.2025.05.08.02.07.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 May 2025 02:07:43 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Barry Song <v-songbaohua@oppo.com>,
	David Hildenbrand <david@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Lokesh Gidra <lokeshgidra@google.com>
Subject: [PATCH RFC] mm: userfaultfd: correct dirty flags set for both present and swap pte
Date: Thu,  8 May 2025 21:07:35 +1200
Message-Id: <20250508090735.39756-1-21cnbao@gmail.com>
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

As David pointed out, what truly matters for mremap and userfaultfd
move operations is the soft dirty bit. The current comment and
implementation—which always sets the dirty bit for present PTEs
and fails to set the soft dirty bit for swap PTEs—are incorrect.
This patch updates the behavior to correctly set the soft dirty bit
for both present and swap PTEs in accordance with mremap.

Reported-by: David Hildenbrand <david@redhat.com>
Closes: https://lore.kernel.org/linux-mm/02f14ee1-923f-47e3-a994-4950afb9afcc@redhat.com/
Cc: Peter Xu <peterx@redhat.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Lokesh Gidra <lokeshgidra@google.com>
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 mm/userfaultfd.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index e8ce92dc105f..bc473ad21202 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -1064,8 +1064,13 @@ static int move_present_pte(struct mm_struct *mm,
 	src_folio->index = linear_page_index(dst_vma, dst_addr);
 
 	orig_dst_pte = folio_mk_pte(src_folio, dst_vma->vm_page_prot);
-	/* Follow mremap() behavior and treat the entry dirty after the move */
-	orig_dst_pte = pte_mkwrite(pte_mkdirty(orig_dst_pte), dst_vma);
+	/* Set soft dirty bit so userspace can notice the pte was moved */
+#ifdef CONFIG_MEM_SOFT_DIRTY
+	orig_dst_pte = pte_mksoft_dirty(orig_dst_pte);
+#endif
+	if (pte_dirty(orig_src_pte))
+		orig_dst_pte = pte_mkdirty(orig_dst_pte);
+	orig_dst_pte = pte_mkwrite(orig_dst_pte, dst_vma);
 
 	set_pte_at(mm, dst_addr, dst_pte, orig_dst_pte);
 out:
@@ -1100,6 +1105,9 @@ static int move_swap_pte(struct mm_struct *mm, struct vm_area_struct *dst_vma,
 	}
 
 	orig_src_pte = ptep_get_and_clear(mm, src_addr, src_pte);
+#ifdef CONFIG_MEM_SOFT_DIRTY
+	orig_src_pte = pte_swp_mksoft_dirty(orig_src_pte);
+#endif
 	set_pte_at(mm, dst_addr, dst_pte, orig_src_pte);
 	double_pt_unlock(dst_ptl, src_ptl);
 
-- 
2.39.3 (Apple Git-146)

