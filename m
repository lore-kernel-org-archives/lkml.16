Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A49F2EE610
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 18:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750961845; cv=none; b=EqzJfq60PWHA7Sr4n6nHC4rjWhiPwWoBPmMnFfuBektmzXEyP2kGjs5MmqynNDsb50zZ+zZBuKb/fCJ6dzbPktTsyIDo9YaVayHNXUdqKbUTSHXM7tMro6WBeR2WcpvzSr/vtirB5l5KzUmhDlXQv8f8nkW9tHOfDLmjgKuTM8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750961845; c=relaxed/simple;
	bh=6oGoKMyXjxgzqrisONTm1WSrJ7oucpkiGgq39C3HYBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N9PAIWLUok0tu4TbGN6dUNjqErL4C9ZQ3O8Jonmv88UfLtwuAz6wP+TydI9VU7oWBfbL1xrc/2TZFM8X8d0cGUzsKqCLDOz+KzSmKa9exh3CsVPdXJpqLs8hEXkJO8ZBlTsy4ycV7wvp6HmceTZ4fNqMIATe9Wt5eNyWtAYwt3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PiQgVJUk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PiQgVJUk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750961843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8FvEh9KPwU2FPVYiAUQ819UI09czGQfx0V/ZDJLQtEw=;
	b=PiQgVJUkp7nwjPtLx6DyxF+5PsabVOheG37VeG+HJRIOeHBECwhU2l370s0BBIXVlGOi8h
	OFNOzUQA6K01QUZGUyT7dCMEDbRjWFIXPCgHwTksw2N2yRc1c5wLq9gtBrNtNaIi46BKF5
	1DK2BA3p4z80BjLZGnyE611SnBUXkMQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-513-7UNU5ohPMiy7mflE6UnpEg-1; Thu,
 26 Jun 2025 14:17:19 -0400
X-MC-Unique: 7UNU5ohPMiy7mflE6UnpEg-1
X-Mimecast-MFC-AGG-ID: 7UNU5ohPMiy7mflE6UnpEg_1750961838
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A1DEE180028A;
	Thu, 26 Jun 2025 18:17:18 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.64.64])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4C6B718003FC;
	Thu, 26 Jun 2025 18:17:17 +0000 (UTC)
From: Luiz Capitulino <luizcap@redhat.com>
To: david@redhat.com,
	willy@infradead.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lcapitulino@gmail.com,
	shivankg@amd.com
Subject: [PATCH 3/3] fs: stable_page_flags(): use snapshot_page()
Date: Thu, 26 Jun 2025 14:16:53 -0400
Message-ID: <ede227784078c4c619582c2c69aee1d8450edf12.1750961812.git.luizcap@redhat.com>
In-Reply-To: <cover.1750961812.git.luizcap@redhat.com>
References: <cover.1750961812.git.luizcap@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

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

