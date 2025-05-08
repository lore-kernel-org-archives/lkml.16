Received: from out203-205-221-221.mail.qq.com (out203-205-221-221.mail.qq.com [203.205.221.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E718F77
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 02:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746756893; cv=none; b=qqQd/sEh6w80pebcQeO66ZIs8FOYbtWLRBm+BR0QYRK50mJbwnmGMr0k7xa5MA7Oe4eTIodeixWLNruia0qzgavl7fDKZ16AV4erizP/T3WffwHmy2pOBq0HHysm36ayP/NTkvMFWWQxsS6j1kaXR8eOHN8iC0VEHAhfKWo4n0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746756893; c=relaxed/simple;
	bh=OiURoFFs9rTnjIw5kVIYCMyHlhDEDRxk1RK+YtbaD6A=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=Tt0oqaeqO45EBY2vsfd6mBzs1nM76qInBPkQE46Gvg7UfMcuoEn8W9TqLp5aJKnCgPCCb/xA/8LoAAppwm4uLnhQQT054DlApiFZPtBQoTtWkdEVIXtbhLbYBMhuRjdPzw/zHe1/wwG/dHChZiLs59FjlGlQZtiJSZFSu50O73U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=uipV/5X4; arc=none smtp.client-ip=203.205.221.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="uipV/5X4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1746756881; bh=50EMK0zUDIARn/oLsuMIxQe8WwQiSOJm3GVLZmYJKOE=;
	h=From:To:Cc:Subject:Date;
	b=uipV/5X4bPPcYcd5uKhb5dW71Dua44aIu6mzCY4khntPq7EWu48sS3TqkUbpgt0sA
	 mhsjcnEsiHYSDEt1P4Gj71UHgmrltjf8YSFdUpkBnNwOCEAhGTF3bXFfCpNFJNwK5K
	 W92TQPgJA19evf3KH1A1FMprOf5v+HvYrhJUVwwk=
Received: from localhost.localdomain ([36.111.64.84])
	by newxmesmtplogicsvrszb21-0.qq.com (NewEsmtp) with SMTP
	id D7528072; Fri, 09 May 2025 09:53:53 +0800
X-QQ-mid: xmsmtpt1746755633tdwraare5
Message-ID: <tencent_0B227ECF6D12D91A3070FE8D41568AD10206@qq.com>
X-QQ-XMAILINFO: Mi+38GKm5OhV9t8a0/uAavUtGEFxnOCpFpjWvoQBodd8QTqNiNcLLecILIzfeJ
	 fL/YK7/m5IJc9LajBltU7nJBtO+FSt+rU6Ob4dYsJ4QedqPVkvCc0V5voAGaQb6XpuvqkABt6P1i
	 lveBujYXJlDUoMehTLg62+b5NScTxRnPxTwQZkZNxtcVduK4y+D0Tu4F/5j9pheONmVp0XAwbXYK
	 gthCgo1JgsD9FtzOwKpGR2znh04ZLJRG+PQj4PPNZrhmjX2MfkDXnxN2dGGeHfzm7ceUA6yee2WI
	 qeboUzwSvFWWiGzRthsbHjPsmj0G4JKlQ/6RuaJdAOSwkMvofuQrGJPIgaiPJ5fF90F577E5jfkQ
	 7WtzWpi1+gRL0Oh0af9skDolvjTA4XPJjL1rNupIiK2rroTnyLNNAnhMk4Bf9UdQyPTeVfa+Tucl
	 Pa56oTt2kzTEMVwgEdwqYvl9C6t0OntACZ254gWQt4xONa0Aj/DjEiegv8w6N2cDmJd+tSPKwrBk
	 zOBg617RjaTuC6Ik8Oa7Up2WHBgECrmrfjKpklHXs1v6s66OK2DS4AjylZVTjDSFVNf0ZpHYb0F7
	 YjxgIzwE67tGraOa5sxc1Rl8HWpBGxhDRi3AuXTHz6i4E+Lg5w3ZtaL52O++kGF6pW8YdONBheub
	 1LhAcmPDqkTw5XJqf2g0HeyKb3Urs0NpuGJDpZr/Ybkdqu0agnqG8M6ZWhOuHeW/SkGfLdFnCTIy
	 kqf2hGIUIOEAj6aEaK2VKwXxbI/M1exZV85A/MtKoEeMUejzSk7loc7w5B2thjxc5n7sTZwTFcbB
	 Lh6xdSyMpVc9QxJFJonbYHFpBeX+3nOzYjXiSD4PZpSUcXpdA3PTKB5EHRvepao5UakNHPdvUk8A
	 /8Oi0D0sCNcoaADQNZI0CJO21qH3kdMz3ek8EUx8de14RaUjEaIFjrZQhxZGl/FryWugbehmKj4p
	 xQO/b9UbaX+8mpb9hvbEv4Rzu+NPOFdvNJujbMmD4=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: Feng Lee <379943137@qq.com>
To: david@redhat.com,
	baohua@kernel.org,
	21cnbao@gmail.com,
	akpm@linux-foundation.org,
	mingo@kernel.org,
	jgg@ziepe.ca,
	jhubbard@nvidia.com,
	peterx@redhat.com
Cc: maobibo@loongson.cn,
	trivial@kernel.org,
	linux-kernel@vger.kernel.org,
	lance.yang@linux.dev,
	anshuman.khandual@arm.com,
	Feng Lee <379943137@qq.com>
Subject: [PATCH v2] mm: clean up redundant code
Date: Thu,  8 May 2025 22:01:15 +0800
X-OQ-MSGID: <20250508140115.2669-1-379943137@qq.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove pgd_offset_gate() completely and simply make the single
caller use pgd_offset()

It appears that the gate area resides in the kernel-mapped segment
exclusively on IA64. Therefore, removing pgd_offset_k is safe since
IA64 is now obsolete.

Signed-off-by: Feng Lee <379943137@qq.com>

---
Changes in v2:
  - remove pgd_offset_gate completely
  - remove pgd_offset_k from the get_gate_page function completely
---
 include/linux/pgtable.h | 4 ----
 mm/gup.c                | 5 +----
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index b50447ef1c92..f1e890b60460 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1164,10 +1164,6 @@ static inline void arch_swap_restore(swp_entry_t entry, struct folio *folio)
 }
 #endif
 
-#ifndef __HAVE_ARCH_PGD_OFFSET_GATE
-#define pgd_offset_gate(mm, addr)	pgd_offset(mm, addr)
-#endif
-
 #ifndef __HAVE_ARCH_MOVE_PTE
 #define move_pte(pte, old_addr, new_addr)	(pte)
 #endif
diff --git a/mm/gup.c b/mm/gup.c
index f32168339390..0685403fe510 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1101,10 +1101,7 @@ static int get_gate_page(struct mm_struct *mm, unsigned long address,
 	/* user gate pages are read-only */
 	if (gup_flags & FOLL_WRITE)
 		return -EFAULT;
-	if (address > TASK_SIZE)
-		pgd = pgd_offset_k(address);
-	else
-		pgd = pgd_offset_gate(mm, address);
+	pgd = pgd_offset(mm, address);
 	if (pgd_none(*pgd))
 		return -EFAULT;
 	p4d = p4d_offset(pgd, address);
-- 
2.49.0

