Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB242EF659
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750170462; cv=none; b=IudAhrK8AyPsIABkVYnzyOJ+jI5atpqmbiK8/toon9xLsb9jhg9aH4RAf9qozrXXIbbsp7JETxV8eYhLGc7bi4FCtl59LY96SMPOJOvqnrdvmYLCYTM/MjPf6Ntbau6Bn20M2zO2ZxrLvHa/PqgkpuDNMypgecJELNXg8UO2z8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750170462; c=relaxed/simple;
	bh=6oGoKMyXjxgzqrisONTm1WSrJ7oucpkiGgq39C3HYBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n8lCP8baiNAMaKYPfO5nCLAmcFg9vv3x6q2PBeTSPEbxI84MfBiWBEYjx/QSrNk4FicTFO8fJqyVI+NZ924b3kLRQjirNBsvaBoUtdSGbTKeAkv9z71a40HWhWxHKuYKdqApJVYIl+q4+wo9KsO5pdn+RBoZtYESEgmfZJbmqSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ULcnNXNm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ULcnNXNm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750170459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8FvEh9KPwU2FPVYiAUQ819UI09czGQfx0V/ZDJLQtEw=;
	b=ULcnNXNmQWrXCgRGU+Pij7yJxsQa4iBG1ZWSXlVeShHmPzi/TE0BxLWi/dN0U2vWsO94+i
	2BSszfG1/CFtx6s9u7wOd34nKFy48EXTlfHc/+tCOcdouSVnRy9AExpj0Hed1XuroBxRRj
	uuPcjJQztrGBaMFAdAVHr/gg2xb0yVU=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-501-s-a2m7MRNAqc8lFm2AZQyw-1; Tue,
 17 Jun 2025 10:27:38 -0400
X-MC-Unique: s-a2m7MRNAqc8lFm2AZQyw-1
X-Mimecast-MFC-AGG-ID: s-a2m7MRNAqc8lFm2AZQyw_1750170457
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A7AC21800284;
	Tue, 17 Jun 2025 14:27:36 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.80.174])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4BB2219560B2;
	Tue, 17 Jun 2025 14:27:35 +0000 (UTC)
From: Luiz Capitulino <luizcap@redhat.com>
To: david@redhat.com,
	willy@infradead.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lcapitulino@gmail.com,
	shivankg@amd.com
Subject: [RFC 3/3] fs: stable_page_flags(): use snapshot_page()
Date: Tue, 17 Jun 2025 10:27:10 -0400
Message-ID: <eaa45a82f0392aaa1879529458a07c3743e75359.1750170418.git.luizcap@redhat.com>
In-Reply-To: <cover.1750170418.git.luizcap@redhat.com>
References: <cover.1750170418.git.luizcap@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

A race condition is possible in stable_page_flags() where user-space is
reading /proc/kpageflags concurrently to a folio split. This may lead to
oopses or BUG_ON()s being triggered.

To fix this, this commit uses snapshot_page() in stable_page_flags() so
that stable_page_flags() works with a stable page and folio snapshots
instead.

Note that stable_page_flags() makes use of some functions that require
the original page or folio pointer to work properly (eg.
is_free_budy_page() and folio_test_idle()). Since those functions can't
be used on the page snapshot, we replace their usage with flags that
were set by snapshot_page() for this purpose.

Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
---
 fs/proc/page.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/fs/proc/page.c b/fs/proc/page.c
index 936f8bbe5a6f..a2ee95f727f0 100644
--- a/fs/proc/page.c
+++ b/fs/proc/page.c
@@ -147,6 +147,7 @@ static inline u64 kpf_copy_bit(u64 kflags, int ubit, int kbit)
 u64 stable_page_flags(const struct page *page)
 {
 	const struct folio *folio;
+	struct page_snapshot ps;
 	unsigned long k;
 	unsigned long mapping;
 	bool is_anon;
@@ -158,7 +159,9 @@ u64 stable_page_flags(const struct page *page)
 	 */
 	if (!page)
 		return 1 << KPF_NOPAGE;
-	folio = page_folio(page);
+
+	snapshot_page(&ps, page);
+	folio = &ps.folio_snapshot;
 
 	k = folio->flags;
 	mapping = (unsigned long)folio->mapping;
@@ -167,7 +170,7 @@ u64 stable_page_flags(const struct page *page)
 	/*
 	 * pseudo flags for the well known (anonymous) memory mapped pages
 	 */
-	if (page_mapped(page))
+	if (folio_mapped(folio))
 		u |= 1 << KPF_MMAP;
 	if (is_anon) {
 		u |= 1 << KPF_ANON;
@@ -179,7 +182,7 @@ u64 stable_page_flags(const struct page *page)
 	 * compound pages: export both head/tail info
 	 * they together define a compound page's start/end pos and order
 	 */
-	if (page == &folio->page)
+	if (ps.idx == 0)
 		u |= kpf_copy_bit(k, KPF_COMPOUND_HEAD, PG_head);
 	else
 		u |= 1 << KPF_COMPOUND_TAIL;
@@ -189,10 +192,10 @@ u64 stable_page_flags(const struct page *page)
 	         folio_test_large_rmappable(folio)) {
 		/* Note: we indicate any THPs here, not just PMD-sized ones */
 		u |= 1 << KPF_THP;
-	} else if (is_huge_zero_folio(folio)) {
+	} else if (ps.flags & PAGE_SNAPSHOT_PG_HUGE_ZERO) {
 		u |= 1 << KPF_ZERO_PAGE;
 		u |= 1 << KPF_THP;
-	} else if (is_zero_folio(folio)) {
+	} else if (is_zero_pfn(ps.pfn)) {
 		u |= 1 << KPF_ZERO_PAGE;
 	}
 
@@ -200,14 +203,14 @@ u64 stable_page_flags(const struct page *page)
 	 * Caveats on high order pages: PG_buddy and PG_slab will only be set
 	 * on the head page.
 	 */
-	if (PageBuddy(page))
+	if (PageBuddy(&ps.page_snapshot))
 		u |= 1 << KPF_BUDDY;
-	else if (page_count(page) == 0 && is_free_buddy_page(page))
+	else if (ps.flags & PAGE_SNAPSHOT_PG_FREE)
 		u |= 1 << KPF_BUDDY;
 
-	if (PageOffline(page))
+	if (folio_test_offline(folio))
 		u |= 1 << KPF_OFFLINE;
-	if (PageTable(page))
+	if (folio_test_pgtable(folio))
 		u |= 1 << KPF_PGTABLE;
 	if (folio_test_slab(folio))
 		u |= 1 << KPF_SLAB;
@@ -215,7 +218,7 @@ u64 stable_page_flags(const struct page *page)
 #if defined(CONFIG_PAGE_IDLE_FLAG) && defined(CONFIG_64BIT)
 	u |= kpf_copy_bit(k, KPF_IDLE,          PG_idle);
 #else
-	if (folio_test_idle(folio))
+	if (ps.flags & PAGE_SNAPSHOT_PG_IDLE)
 		u |= 1 << KPF_IDLE;
 #endif
 
@@ -241,7 +244,7 @@ u64 stable_page_flags(const struct page *page)
 	if (u & (1 << KPF_HUGE))
 		u |= kpf_copy_bit(k, KPF_HWPOISON,	PG_hwpoison);
 	else
-		u |= kpf_copy_bit(page->flags, KPF_HWPOISON,	PG_hwpoison);
+		u |= kpf_copy_bit(ps.page_snapshot.flags, KPF_HWPOISON, PG_hwpoison);
 #endif
 
 	u |= kpf_copy_bit(k, KPF_RESERVED,	PG_reserved);
-- 
2.49.0

