Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562C51D86FF
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743408849; cv=none; b=Lp+Ue6KQ53KRAfqEfoSU8pHTrLulJZi5EmFyznscCuql1TJQrEhz1VywP7rCaezq1ZGRLYMzRVyqW8+XrorD2zGJ8oV9FdnP4U6rtO0cOucHEp3KwxutB4pmNXrMdjqj2+BmTIjA4ylTn4vkDIeBjWIMo+pMntjNDTkMorasbAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743408849; c=relaxed/simple;
	bh=KudWMVHRlgaYmmxW7ze9gtxkeRaW2ruu2MZ2Lcgfx10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=Zzs9VcXBTr8AsmdAwMDBgEXuZRpda5k7vDKiCJEwVWcJf+tC6M3vyJeCIZkef5lfUgkRweOcRnmXVfIDk/lmmeny5ZaWu2y3Kw9zyLtT9EiktHAJ7I/B8riH92Mag1K0o1XXs0S9mPE6FJV2WJkUFHt4rE8gAq0dy2MuJO67Wjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PyuLshPz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PyuLshPz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743408847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OLa+87RL1ZqH7qyvR+sAYoFO3JtN0cQjwozLl9C4JYM=;
	b=PyuLshPzsB3w6edsyIIijX1ybNgTL26gjv0qp/ywQgiDXXd0s1W97srMnM0HtK8L0f3vtk
	egVUjJakNK4oFlsRf7/AVW0H0SnJEbkFRJxN8x6qJhd7xRMiazrG7s/EElYW0hWmdzSFma
	iTWMxxlw/+JGb4tBh750GONPPQr0qvY=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-516-21WSEHhDPMuuTzpdv--LEg-1; Mon,
 31 Mar 2025 04:14:05 -0400
X-MC-Unique: 21WSEHhDPMuuTzpdv--LEg-1
X-Mimecast-MFC-AGG-ID: 21WSEHhDPMuuTzpdv--LEg_1743408844
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ADC0D1800260;
	Mon, 31 Mar 2025 08:14:04 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.9])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A6EF81955BF1;
	Mon, 31 Mar 2025 08:14:01 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	yanjun.zhu@linux.dev,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH v2 7/7] mm/pgtable: remove unneeded pgd_devmap()
Date: Mon, 31 Mar 2025 16:13:27 +0800
Message-ID: <20250331081327.256412-8-bhe@redhat.com>
In-Reply-To: <20250331081327.256412-1-bhe@redhat.com>
References: <20250331081327.256412-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

There's no user of pgd_devmap() now, remove it from all ARCH-es
and linux/pgtable.h.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 arch/arm64/include/asm/pgtable.h             | 5 -----
 arch/loongarch/include/asm/pgtable.h         | 1 -
 arch/powerpc/include/asm/book3s/64/pgtable.h | 5 -----
 arch/riscv/include/asm/pgtable-64.h          | 5 -----
 arch/x86/include/asm/pgtable.h               | 5 -----
 include/linux/pgtable.h                      | 4 ----
 6 files changed, 25 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 84f05f781a70..e0cab581edc9 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1230,11 +1230,6 @@ static inline int pud_devmap(pud_t pud)
 {
 	return 0;
 }
-
-static inline int pgd_devmap(pgd_t pgd)
-{
-	return 0;
-}
 #endif
 
 #ifdef CONFIG_PAGE_TABLE_CHECK
diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index da346733a1da..d9b04296d9f5 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -615,7 +615,6 @@ static inline long pmd_protnone(pmd_t pmd)
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 #define pud_devmap(pud)		(0)
-#define pgd_devmap(pgd)		(0)
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
 /*
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 6d98e6f08d4d..0da1c8d7f778 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1405,11 +1405,6 @@ static inline int pud_devmap(pud_t pud)
 {
 	return pte_devmap(pud_pte(pud));
 }
-
-static inline int pgd_devmap(pgd_t pgd)
-{
-	return 0;
-}
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
 #define __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION
diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index 0897dd99ab8d..c6da4c8354a3 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -411,11 +411,6 @@ static inline int pud_devmap(pud_t pud)
 {
 	return 0;
 }
-
-static inline int pgd_devmap(pgd_t pgd)
-{
-	return 0;
-}
 #endif
 
 #endif /* _ASM_RISCV_PGTABLE_64_H */
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 5ddba366d3b4..3d6e78af525a 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -361,11 +361,6 @@ static inline pud_t pud_mkspecial(pud_t pud)
 	return pud_set_flags(pud, _PAGE_SPECIAL);
 }
 #endif	/* CONFIG_ARCH_SUPPORTS_PUD_PFNMAP */
-
-static inline int pgd_devmap(pgd_t pgd)
-{
-	return 0;
-}
 #endif
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 94d267d02372..9d2dd5f71443 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1615,10 +1615,6 @@ static inline int pud_devmap(pud_t pud)
 {
 	return 0;
 }
-static inline int pgd_devmap(pgd_t pgd)
-{
-	return 0;
-}
 #endif
 
 #if !defined(CONFIG_TRANSPARENT_HUGEPAGE) || \
-- 
2.41.0

