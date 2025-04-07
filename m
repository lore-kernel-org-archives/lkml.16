Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7DF2135C1
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 03:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743995035; cv=none; b=i3Bjh5waXUzHnbU+/9s/DNdj20Yc8qDu6yKZKZyiUD5cyTrw95t6zSr/cBfM/cnP9+3LNwS/p8oSbvEXhxUpLvRRkNOdgALKCvrOYGzhCRSuQHs/CMwjW2xxYHVSiCyu8tWhVdNc7vXxc6X3hBTC/45fTWxQWqeMXPN3AfhqmAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743995035; c=relaxed/simple;
	bh=W4d6eMuOsoigxHaayWrDjD0luwkLz5SkUS2Jq1yPQek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=Sy//cY2ySX84mpeWUjZhnJjsk6ZUOqXuLcqr4WFcp1RUtbh1t81CN0sDM8n+4uD9E74w45c37haVYdwJ7XYghBieQ4kY25sl+GOVPCDE/mhEbCJPV4691Y279pGrGFWZqsi8axCo5MjVRnoOr4FlitxAEtFne/dXQQv7mV282qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A/tnNizp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A/tnNizp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743995032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AQ/UrRbnj3b02IVX/znAR8Dzkmamadv/LnZeVQ24gFU=;
	b=A/tnNizpVacWzJ78IOw/HUXUO1yR16CY9VhExiRgprRgZrNVSaQeETnVJr1n97YPmbS/2P
	K9P+8y+EPbGDX9Vzm1nm+OZrjxaHqgouPMTO+NSwPrxNesrzp0rjCO+4JD0L1B6FvaFwXb
	b/g03lgtfVuoUnQKEVUd4PEj7Vi4hZc=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-402-_D5q2rZONMCapjucfqhvkg-1; Sun,
 06 Apr 2025 23:03:49 -0400
X-MC-Unique: _D5q2rZONMCapjucfqhvkg-1
X-Mimecast-MFC-AGG-ID: _D5q2rZONMCapjucfqhvkg_1743995028
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1AA4B1800361;
	Mon,  7 Apr 2025 03:03:48 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.15])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CB5CC1801A6D;
	Mon,  7 Apr 2025 03:03:42 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	osalvador@suse.de,
	david@redhat.com,
	mingo@kernel.org,
	yanjun.zhu@linux.dev,
	linux-kernel@vger.kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH v3 3/3] mm/gup: remove gup_fast_pgd_leaf() and clean up the relevant codes
Date: Mon,  7 Apr 2025 11:03:06 +0800
Message-ID: <20250407030306.411977-4-bhe@redhat.com>
In-Reply-To: <20250407030306.411977-1-bhe@redhat.com>
References: <20250407030306.411977-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

In the current kernel, only pud huge page is supported in some
architectures. P4d and pgd huge pages haven't been supported yet.
And in mm/gup.c, there's no pgd huge page handling in the
follow_page_mask() code path. Hence it doesn't make sense to only
have gup_fast_pgd_leaf() in gup_fast code path.

Here remove gup_fast_pgd_leaf() and clean up the relevant codes.

Signed-off-by: Baoquan He <bhe@redhat.com>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Acked-by: David Hildenbrand <david@redhat.com>
---
 mm/gup.c | 49 +++----------------------------------------------
 1 file changed, 3 insertions(+), 46 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 5b3ac5a867a3..c9237db3cdb3 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -3172,46 +3172,6 @@ static int gup_fast_pud_leaf(pud_t orig, pud_t *pudp, unsigned long addr,
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
@@ -3306,12 +3266,9 @@ static void gup_fast_pgd_range(unsigned long addr, unsigned long end,
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

