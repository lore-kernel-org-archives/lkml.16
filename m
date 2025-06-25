Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991722652AF
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750865065; cv=none; b=DhpReoTg3b+1AX/OE5Wx3v454jEmGxadEm6KhAPTrcyv+0+P83H2yR6/TO1rZhapgZGLZLllJaT5hEnWZqz1L50oySJph2BzAWxDUd1vT7dy/Jdu7BjS8preO7oQD5ihheRRNWx7tqMp33QmoYgNceemuUpCIHCcH1WixzUHDy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750865065; c=relaxed/simple;
	bh=RieOHerA30zX9NjFi3on8Zd6Jptai2wCUHJtpQFdF78=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jG60/2tGcdTf6YSjb2UKgCF5fKXCGDcboVBzocyQcHOZYqLKZjxAKnSww6pCKNdZJVoipTewpmvfSVAtDHMPDYho7YYP3NLaW4ubBRVSxXD96obC4Auxq8jSEkZGgeFn4/KKEgXlUvE46J5ZwyPXJ61nt/qEVhWFdGP+NFEOmhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=df7cb.de; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=df7cb.de
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bS5Fv3GSHz9v0M;
	Wed, 25 Jun 2025 17:24:19 +0200 (CEST)
Date: Wed, 25 Jun 2025 17:24:14 +0200
From: Christoph Berg <myon@debian.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	"open list:MEMORY MANAGEMENT - MEMORY POLICY AND MIGRATION" <linux-mm@kvack.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: [PATCH] Fix do_pages_stat to use compat_uptr_t
Message-ID: <aFwUnu7ObizycCZ8@msg.df7cb.de>
References: <aFrBhyHQFffJ4xgX@msg.df7cb.de>
 <d42cc185-b774-4d5e-9a51-0581dd5f3962@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d42cc185-b774-4d5e-9a51-0581dd5f3962@arm.com>
X-Rspamd-Queue-Id: 4bS5Fv3GSHz9v0M

For arrays with more than 16 entries, the old code would incorrectly
advance the pages pointer by 16 words instead of 16 compat_uptr_t.

Signed-off-by: Christoph Berg <myon@debian.org>
Suggested-by: Bertrand Drouvot <bertranddrouvot.pg@gmail.com>
---
 mm/migrate.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 8cf0f9c9599..542c81ec3ed 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2444,7 +2444,13 @@ static int do_pages_stat(struct mm_struct *mm, unsigned long nr_pages,
 		if (copy_to_user(status, chunk_status, chunk_nr * sizeof(*status)))
 			break;
 
-		pages += chunk_nr;
+		if (in_compat_syscall()) {
+			compat_uptr_t __user *pages32 = (compat_uptr_t __user *)pages;
+
+			pages32 += chunk_nr;
+			pages = (const void __user * __user *) pages32;
+		} else
+			pages += chunk_nr;
 		status += chunk_nr;
 		nr_pages -= chunk_nr;
 	}
-- 
2.47.2

