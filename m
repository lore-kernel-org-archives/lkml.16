Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485CC1CD205
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 12:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743337077; cv=none; b=KjRvL1wygC9P0YH4J9ARvg9vwylAvC+/Zz8CzBeT0iDRND6VBP/k3zLJAJFscEEoHKrAhpk+Cnq7GCSDUjEGiSqzfac+CyLcft69+w2Mv84PMhZKflqU31zu66J4ygURLA0uP1o1dOW4DFvIVW48YdnrEV8RblI0wnFLiUVwl28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743337077; c=relaxed/simple;
	bh=3UJpBvSAOxjGq+V44DiEHigwXSZSvkEPXsPGL93HZoY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=rF1n/tODhYBFh0o8tk07kVPkCEHcvsgjfFxr5sRT+PzOht//jNawCC6p9KvxCjeWvQWEdM0EUudCeHx1zRGPaSALAt7bUzBsZREWVDOGV5X1jQWy1/K3zF16tEY3MTICJ7xsXzEb1LHtOlcG4MX7hXZt12h2r6LZ2pKWBNSSjUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WRDPzXZk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WRDPzXZk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743337075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SMo4jBzg968VcT1tEVh1MekL7DuKyZ/p1dzOuEaPw7g=;
	b=WRDPzXZkkldwBggMATh31iIK0vyxvEdvkgf3EYgI4GVRUr42isXBUFQ9q6TTndjYx/IUMX
	1Q4FnYELw+2ryXEAi+NuM5ePzLk1pi5UxGNvQsP54RhfoCDo8IUKTahFCAEYQbBshSnWnQ
	WomElTUAV7xCYYt0eEI4Bc1AY5H7Rjs=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-170-q4F2WwCWPOek5DYDs2vaGQ-1; Sun,
 30 Mar 2025 08:17:51 -0400
X-MC-Unique: q4F2WwCWPOek5DYDs2vaGQ-1
X-Mimecast-MFC-AGG-ID: q4F2WwCWPOek5DYDs2vaGQ_1743337070
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 21841196D2D2;
	Sun, 30 Mar 2025 12:17:50 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.17])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B2190180094A;
	Sun, 30 Mar 2025 12:17:46 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH 6/7] x86/mm: remove p4d_leaf definition
Date: Sun, 30 Mar 2025 20:17:16 +0800
Message-ID: <20250330121718.175815-7-bhe@redhat.com>
In-Reply-To: <20250330121718.175815-1-bhe@redhat.com>
References: <20250330121718.175815-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

There's no p4d huge page support yet, let's use the generic definition.

And also update the BUILD_BUG_ON() in pti_user_pagetable_walk_pmd()
because p4d_leaf() returns boolean value.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 arch/x86/include/asm/pgtable.h | 7 -------
 arch/x86/mm/pti.c              | 2 +-
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 5f4fcc0eea17..5ddba366d3b4 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -292,13 +292,6 @@ static inline unsigned long pgd_pfn(pgd_t pgd)
 	return (pgd_val(pgd) & PTE_PFN_MASK) >> PAGE_SHIFT;
 }
 
-#define p4d_leaf p4d_leaf
-static inline bool p4d_leaf(p4d_t p4d)
-{
-	/* No 512 GiB pages yet */
-	return 0;
-}
-
 #define pte_page(pte)	pfn_to_page(pte_pfn(pte))
 
 #define pmd_leaf pmd_leaf
diff --git a/arch/x86/mm/pti.c b/arch/x86/mm/pti.c
index c2e1de40136f..190299834011 100644
--- a/arch/x86/mm/pti.c
+++ b/arch/x86/mm/pti.c
@@ -206,7 +206,7 @@ static pmd_t *pti_user_pagetable_walk_pmd(unsigned long address)
 	if (!p4d)
 		return NULL;
 
-	BUILD_BUG_ON(p4d_leaf(*p4d) != 0);
+	BUILD_BUG_ON(p4d_leaf(*p4d));
 	if (p4d_none(*p4d)) {
 		unsigned long new_pud_page = __get_free_page(gfp);
 		if (WARN_ON_ONCE(!new_pud_page))
-- 
2.41.0

