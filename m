Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8331A155333
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 12:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743337070; cv=none; b=M0mO1MUVMGtOhltRnKg0bjH6HcNJRGVXCx77KaVw7Rh9X2D79G0Ouv5cvrNgJRuF5HBS53EN0jH/1ypjJu+WzFuLQwtTvT/dlcbUsVusdtoM64AawL/U/WpleCYGPKu6jJ4wMfwrlAW40Cx0QlQ8pyYI8J+nrCccMDIqFaxxXN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743337070; c=relaxed/simple;
	bh=sNo71/UwJJrOsGQDRP85vpICwpdHE7BULlIn/TDNp10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=AswiccR63tuMTVYtm53Vs8i64QSJW+SJpF5xNXijkFAIVqSJLVjYlOUqk4zO3xsrCcflOaF6lgoJ7pXk+2pWBs9qEdvcSCjwAU/Favih3+DTCQswzk6gKYj5tSjiF+9cRASNALHpvdYCbGcm3dfHXquixrNGYaHnRpG5A0U6SQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SBWCTnW1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SBWCTnW1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743337067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hxqDMoJetNer7F1DwMLPFhLQrU8sSqdg39HX8cZyX4Y=;
	b=SBWCTnW1iM2ul+g6V3EgV3mt54ZfoUrAWkRxsrSzR+8ccObDxQYqyvY5Vj3g74ohwxMtlH
	oE630Qc5BoOYGkhZeb2NArnAWkrusfaW0/zA23FnqPjY0EGIy/oZxBrbSgtIEpBo7NHJWs
	aED3mP56knpo4BYQvMZzJyF3laWVkuo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-371-Zv7FARzWNZOEPs16cB8FOQ-1; Sun,
 30 Mar 2025 08:17:43 -0400
X-MC-Unique: Zv7FARzWNZOEPs16cB8FOQ-1
X-Mimecast-MFC-AGG-ID: Zv7FARzWNZOEPs16cB8FOQ_1743337062
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 200B31800266;
	Sun, 30 Mar 2025 12:17:42 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.17])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 630CE180094A;
	Sun, 30 Mar 2025 12:17:38 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH 4/7] mm/gup: remove gup_fast_pgd_leaf() and clean up the relevant codes
Date: Sun, 30 Mar 2025 20:17:14 +0800
Message-ID: <20250330121718.175815-5-bhe@redhat.com>
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
index 3345a065c2cb..3d2c57f59b4d 100644
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

