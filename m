Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27B81F4285
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 17:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751392526; cv=none; b=Nn0cKmjZj+qwrth40W4J6fkfUxYTqD4+ZEPKQBqDplGj0wLYdnyYNIO7hptSHWpekECMsZwQsWEZvUTJRw4AhW0xolA+FbLogkfLEwdVEweFZSrQavqcS/nel6wfYMohn/2pc5hPHlrSZFSq07x6BxL41ziTSbCWsJr2zLVo5Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751392526; c=relaxed/simple;
	bh=OaJ1IZ+VxledJ85geGrj4X69S4C6L9IAWRbXpthlThw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fpXxKetS88fKkhW4qAhVYBrlZUPT2o3pcU60xczP07K3qjPFnhfFO2RRIxyDdPcZz41EYgjow88IO2d3nNUgQ09xYcIzjeIpsDs1YxynFFJjFg13XpxgPM2GWRuM8mXHB7I7sRuzV8e1byPv1QiQGJ60w3lYs99Rz1GvI+Jw9O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=df7cb.de; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=df7cb.de
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4bWrKP0FPbz9t27;
	Tue,  1 Jul 2025 19:55:21 +0200 (CEST)
Date: Tue, 1 Jul 2025 19:55:17 +0200
From: Christoph Berg <myon@debian.org>
To: Zi Yan <ziy@nvidia.com>
Cc: David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	"open list:MEMORY MANAGEMENT - MEMORY POLICY AND MIGRATION" <linux-mm@kvack.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] mm/migrate: Fix do_pages_stat in 32-bit mode
Message-ID: <aGQhBRM9DtTZ22Z_@msg.df7cb.de>
References: <aGQTtCkgH4kQTNlp@msg.df7cb.de>
 <25EB3C6C-4D6D-4946-BF0B-9B322E7DC16D@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25EB3C6C-4D6D-4946-BF0B-9B322E7DC16D@nvidia.com>
X-Rspamd-Queue-Id: 4bWrKP0FPbz9t27

Re: Zi Yan
> Fixes should be:
> 
> Fixes: 5b1b561ba73c ("mm: simplify compat_sys_move_pages")
> 
> Closes could be a link to the bug report.

Updated, thanks.

> > This seems to work, but honestly I am wondering, if copy_from_user
> > needs a special 32-bit case, doesn't copy_to_user need special casing
> > as well?

Scratch that, it works because an int[] is copied back, and that's
always the same size.

So I think the patch is good to go.

Christoph


From 426c93d558572248273cf386ca784626ae431413 Mon Sep 17 00:00:00 2001
From: Christoph Berg <myon@debian.org>
Date: Tue, 24 Jun 2025 16:44:27 +0200
Subject: [PATCH v3] mm/migrate: Fix do_pages_stat in 32-bit mode

For arrays with more than 16 entries, the old code would incorrectly
advance the pages pointer by 16 words instead of 16 compat_uptr_t.
Fix by doing the pointer arithmetic inside get_compat_pages_array where
pages32 is already a correctly-typed pointer.

Discovered while working on PostgreSQL 18's new NUMA introspection code.

Signed-off-by: Christoph Berg <myon@debian.org>
Suggested-by: David Hildenbrand <david@redhat.com>
Fixes: 5b1b561ba73c ("mm: simplify compat_sys_move_pages")
Reported-by: Bertrand Drouvot <bertranddrouvot.pg@gmail.com>
Reported-by: Tomas Vondra <tomas@vondra.me>
Closes: https://www.postgresql.org/message-id/flat/6342f601-77de-4ee0-8c2a-3deb50ceac5b%40vondra.me#86402e3d80c031788f5f55b42c459471
---
 mm/migrate.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 8cf0f9c9599d..2c88f3b33833 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2399,6 +2399,7 @@ static void do_pages_stat_array(struct mm_struct *mm, unsigned long nr_pages,
 
 static int get_compat_pages_array(const void __user *chunk_pages[],
 				  const void __user * __user *pages,
+				  unsigned long chunk_offset,
 				  unsigned long chunk_nr)
 {
 	compat_uptr_t __user *pages32 = (compat_uptr_t __user *)pages;
@@ -2406,7 +2407,7 @@ static int get_compat_pages_array(const void __user *chunk_pages[],
 	int i;
 
 	for (i = 0; i < chunk_nr; i++) {
-		if (get_user(p, pages32 + i))
+		if (get_user(p, pages32 + chunk_offset + i))
 			return -EFAULT;
 		chunk_pages[i] = compat_ptr(p);
 	}
@@ -2425,27 +2426,28 @@ static int do_pages_stat(struct mm_struct *mm, unsigned long nr_pages,
 #define DO_PAGES_STAT_CHUNK_NR 16UL
 	const void __user *chunk_pages[DO_PAGES_STAT_CHUNK_NR];
 	int chunk_status[DO_PAGES_STAT_CHUNK_NR];
+	unsigned long chunk_offset = 0;
 
 	while (nr_pages) {
 		unsigned long chunk_nr = min(nr_pages, DO_PAGES_STAT_CHUNK_NR);
 
 		if (in_compat_syscall()) {
 			if (get_compat_pages_array(chunk_pages, pages,
-						   chunk_nr))
+						   chunk_offset, chunk_nr))
 				break;
 		} else {
-			if (copy_from_user(chunk_pages, pages,
+			if (copy_from_user(chunk_pages, pages + chunk_offset,
 				      chunk_nr * sizeof(*chunk_pages)))
 				break;
 		}
 
 		do_pages_stat_array(mm, chunk_nr, chunk_pages, chunk_status);
 
-		if (copy_to_user(status, chunk_status, chunk_nr * sizeof(*status)))
+		if (copy_to_user(status + chunk_offset, chunk_status,
+				 chunk_nr * sizeof(*status)))
 			break;
 
-		pages += chunk_nr;
-		status += chunk_nr;
+		chunk_offset += chunk_nr;
 		nr_pages -= chunk_nr;
 	}
 	return nr_pages ? -EFAULT : 0;
-- 
2.47.2

