Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C571C1F3B98
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 16:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751389123; cv=none; b=pNUmjxTtWZM3M7Ws3EU2CKurJsTQFFnm5RXnJUE5R8QhDNIn3EAWFFdx9E6ciOUHmDVdTtPWq06+7rB5laoHvOUIdc0fjYLAJlTSzE4x0GPYgYWp50+0Rp7g5twBWTlhXvNCbT1cTd9e1O/fUhumFiK7wiQ52pKY4tCiDlcxXCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751389123; c=relaxed/simple;
	bh=siBLe9gz6RUe359Fx/TSWWC2MOEWurtX3C+0q9hk098=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=rVYtnREx+6qusEqj4SqgJhVuGPQW9P9YEWxPNySNCJI7wsRb+lFompaflfhSLWA3oqsl1L5C8SVzSzwyWCcJSlofR1RQdAFA+OiCS5mslJni8QEZtzQ5T1wxiNM4qNTwh0tzwVwT531pK5c2TivG95pvzOaJu3w6MdL/aDwxwJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=df7cb.de; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=df7cb.de
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bWq3r1njDz9sqc;
	Tue,  1 Jul 2025 18:58:32 +0200 (CEST)
Date: Tue, 1 Jul 2025 18:58:28 +0200
From: Christoph Berg <myon@debian.org>
To: David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	"open list:MEMORY MANAGEMENT - MEMORY POLICY AND MIGRATION" <linux-mm@kvack.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] mm/migrate: Fix do_pages_stat in 32-bit mode
Message-ID: <aGQTtCkgH4kQTNlp@msg.df7cb.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625133909.1a054c24d933cd97afd0027d@linux-foundation.org>
 <bff12005-4957-417a-a54f-2a5a327720f2@redhat.com>
X-Rspamd-Queue-Id: 4bWq3r1njDz9sqc

Re: David Hildenbrand
> Subject should start with "mm/migrate:"
> Likely we want a
> Fixes:
> and then this is probably "Reported-by:" paired with a "Closes:" link
> to any such report.

I included these now, except for "Closes:" which I have to idea what
to put in.

> But I'm wondering how long this has already been like that. :)

The now-offending "pages += chunk_nr" line is from 2010, but I think
the bug is rather from 5b1b561ba73c8ab9c98e5dfd14dc7ee47efb6530 (2021)
which reshuffled the array-vs-32-bit handling.

> Something a bit more elegant might be:

Thanks, I used your patch draft with some minor changes.

>  static int get_compat_pages_array(const void __user *chunk_pages[],
>                                   const void __user * __user *pages,
> +                                 unsigned long chunk_offs,

I replaced chunk_offs with "chunk_offset" since "offs" looked too much
like plural (list of offsets) to me.

>                 if (in_compat_syscall()) {
>                         if (get_compat_pages_array(chunk_pages, pages,
> -                                                  chunk_nr))
> +                                                  chunk_offs, chunk_nr))
>                                 break;
>                 } else {
>                         if (copy_from_user(chunk_pages, pages,

The else branch here needs tweaking as well:

                } else {
-                       if (copy_from_user(chunk_pages, pages,
+                       if (copy_from_user(chunk_pages, pages + chunk_offset,
                                      chunk_nr * sizeof(*chunk_pages)))


> @@ -2440,11 +2442,11 @@ static int do_pages_stat(struct mm_struct *mm, unsigned long nr_pages,
>                 do_pages_stat_array(mm, chunk_nr, chunk_pages, chunk_status);
> -               if (copy_to_user(status, chunk_status, chunk_nr * sizeof(*status)))
> +               if (copy_to_user(status + chunk_offs, chunk_status,
> +                                chunk_nr * sizeof(*status)))

This seems to work, but honestly I am wondering, if copy_from_user
needs a special 32-bit case, doesn't copy_to_user need special casing
as well?

> (untested, of course)

The attached patch makes PG18's new numa test pass on amd64 kernels
both in amd64 and i386 userlands.

(In the meantime, PG git head got a workaround that limits the chunk
size to the same 16 as used in do_pages_stat; I tested with the
version before that.)

Christoph


From fdbcbc88825bc2e857dfeeebc91d62864e0774dd Mon Sep 17 00:00:00 2001
From: Christoph Berg <myon@debian.org>
Date: Tue, 24 Jun 2025 16:44:27 +0200
Subject: [PATCH v2] mm/migrate: Fix do_pages_stat in 32-bit mode

For arrays with more than 16 entries, the old code would incorrectly
advance the pages pointer by 16 words instead of 16 compat_uptr_t.
Fix by doing the pointer arithmetic inside get_compat_pages_array where
pages32 is already a correctly-typed pointer.

Discovered while working on PostgreSQL 18's new NUMA introspection code.

Signed-off-by: Christoph Berg <myon@debian.org>
Reported-by: Bertrand Drouvot <bertranddrouvot.pg@gmail.com>
Reported-by: Tomas Vondra <tomas@vondra.me>
Suggested-by: David Hildenbrand <david@redhat.com>
Fixes: 5b1b561ba73c8ab9c98e5dfd14dc7ee47efb6530
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

