Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1495B1D63F7
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743408843; cv=none; b=nVVVWa/bNSCCJZe/oDa6iEbnKJ+EeINQ5O+Ubeh2sV1Aewp5aC80KpY2MvEaZqcZyojL4EVpm5VHHdR7e1FOVDPVjBAZDC8yl/q1N2ZyQHFW33zJ0XBP7Z3h2+mQH5GR77A+8t0otusjjU8SlmVzlZ+JZhG4c6d5iVOiACe0k/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743408843; c=relaxed/simple;
	bh=g2SbD8X/3yf+SsDE2CMtlxBeS8dGV0trfwTYRAGeDO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=epdtjrn05pduPOuwIoW7ChY1qJIWxqqb34Hp5GP244mQ1b//RUOu71fl49sQ8+nCFoko3J8foI1cBDV+8EMlGyYMW64EBkwpjILn14hLVmNeVD62dWhwXOAQXbv9JcEBP1Y5XF2rwGUCvxy3h8bzxrjH6jXIJfDfboeTBcv8gXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BBYPf9+t; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BBYPf9+t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743408841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o7TFDmuhd1kibEufM0EW11EDmCZ8boAIcxccfqu0TA0=;
	b=BBYPf9+tvgtuguJOYaICf4nJhtbrjd7LPC2QkNujW6M7Jydww36eLYvZjufBqUc03QwqYS
	jc02SI0XsyFDtOO1LBKrp3m2gVky1VJtiSuSxmIv9TdqbUaJLElEgx30JayBKEIZZ6os8M
	+g8roolNP9EtHjmG1IJKQ2UtP6rVANk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-646-BaTzCZBMPDWfogDH-E7-JQ-1; Mon,
 31 Mar 2025 04:13:57 -0400
X-MC-Unique: BaTzCZBMPDWfogDH-E7-JQ-1
X-Mimecast-MFC-AGG-ID: BaTzCZBMPDWfogDH-E7-JQ_1743408836
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7379319560B8;
	Mon, 31 Mar 2025 08:13:51 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.9])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 49E231955BEF;
	Mon, 31 Mar 2025 08:13:47 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	yanjun.zhu@linux.dev,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH v2 4/7] mm/gup: remove gup_fast_pgd_leaf() and clean up the relevant codes
Date: Mon, 31 Mar 2025 16:13:24 +0800
Message-ID: <20250331081327.256412-5-bhe@redhat.com>
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

In the current kernel, only pud huge page is supported in some
architectures. P4d and pgd huge pages haven't been supported yet.
And in mm/gup.c, there's no pgd huge page handling in the
follow_page_mask() code path. Hence it doesn't make sense to have
gup_fast_pgd_leaf() in gup_fast code path.

Here remove gup_fast_pgd_leaf() and clean up the relevant codes.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 mm/gup.c | 49 +++----------------------------------------------
 1 file changed, 3 insertions(+), 46 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index a15317cf6641..58cdc5605a4a 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -3168,46 +3168,6 @@ static int gup_fast_pud_leaf(pud_t orig, pud_t *pudp, unsigned long addr,
 	return 1;
 }
 
-static int gup_fast_pgd_leaf(pgd_t orig, pgd_t *pgdp, unsigned long addr,
-		unsigned long end, unsigned int flags, struct page **pages,
-		int *nr)
-{
-	int refs;
-	struct page *page;
-	struct folio *folio;
-
-	if (!pgd_access_permitted(orig, flags & FOLL_WRITE))
-		return 0;
-
-	BUILD_BUG_ON(pgd_devmap(orig));
-
-	page = pgd_page(orig);
-	refs = record_subpages(page, PGDIR_SIZE, addr, end, pages + *nr);
-
-	folio = try_grab_folio_fast(page, refs, flags);
-	if (!folio)
-		return 0;
-
-	if (unlikely(pgd_val(orig) != pgd_val(*pgdp))) {
-		gup_put_folio(folio, refs, flags);
-		return 0;
-	}
-
-	if (!pgd_write(orig) && gup_must_unshare(NULL, flags, &folio->page)) {
-		gup_put_folio(folio, refs, flags);
-		return 0;
-	}
-
-	if (!gup_fast_folio_allowed(folio, flags)) {
-		gup_put_folio(folio, refs, flags);
-		return 0;
-	}
-
-	*nr += refs;
-	folio_set_referenced(folio);
-	return 1;
-}
-
 static int gup_fast_pmd_range(pud_t *pudp, pud_t pud, unsigned long addr,
 		unsigned long end, unsigned int flags, struct page **pages,
 		int *nr)
@@ -3302,12 +3262,9 @@ static void gup_fast_pgd_range(unsigned long addr, unsigned long end,
 		next = pgd_addr_end(addr, end);
 		if (pgd_none(pgd))
 			return;
-		if (unlikely(pgd_leaf(pgd))) {
-			if (!gup_fast_pgd_leaf(pgd, pgdp, addr, next, flags,
-					       pages, nr))
-				return;
-		} else if (!gup_fast_p4d_range(pgdp, pgd, addr, next, flags,
-					       pages, nr))
+		BUILD_BUG_ON(pgd_leaf(pgd));
+		if (!gup_fast_p4d_range(pgdp, pgd, addr, next, flags,
+					pages, nr))
 			return;
 	} while (pgdp++, addr = next, addr != end);
 }
-- 
2.41.0

