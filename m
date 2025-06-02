Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A9A2C3253
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 21:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748898229; cv=none; b=EjNJLA+kBx2QHdV2gU5y6k7RDc51P566u1s9Hgt3JPUsj3yUNoLHTvt+jKkZ9zxeVSBy9PGntsFdjOwwWq6Izhue86Yl3jsplf33hchYR5Sry9Yw7Gzya7WaY9XCjaD4HT45eZcMiudvnC8cV+DzDTSF/N6EwfF7RAjAoJ6i/lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748898229; c=relaxed/simple;
	bh=lMzIy6JgRqWTf5ywNi1jWF4mob0uYr3ZD5ot0qMehQk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nvOni57O2GAZF4wkDaJVOlmvhx1/H+LEjijBN/xFd+MqOrSy8z06hgcFfuJWnVR5GRPGtlHetOzTLsnwVDDFXJAWEioKDxFHs3gbGH+UH7pG9xl2UAUcPpACXUONjafcJri2ksfo5/ZEBdubSU/x/6+jGuV7qCZt+jAzTSSJmvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 968E7C4CEEB;
	Mon,  2 Jun 2025 21:03:48 +0000 (UTC)
Date: Mon, 2 Jun 2025 17:05:00 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org
Cc: Hugh Dickins <hughd@google.com>, Andrew Morton
 <akpm@linux-foundation.org>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH] mm: Fix compile error when CONFIG_SHMEM is not set
Message-ID: <20250602170500.48713a2b@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

From: Steven Rostedt <rostedt@goodmis.org>

When CONFIG_SHMEM is not set, the following compiler error occurs:

ld: vmlinux.o: in function `ttm_backup_backup_page':
(.text+0x10363bc): undefined reference to `shmem_writeout'
make[3]: *** [/work/build/trace/nobackup/linux-test.git/scripts/Makefile.vmlinux:91: vmlinux.unstripped] Error 1
make[2]: *** [/work/build/trace/nobackup/linux-test.git/Makefile:1241: vmlinux] Error 2
make[1]: *** [/work/build/trace/nobackup/linux-test.git/Makefile:248: __sub-make] Error 2
make[1]: Leaving directory '/work/build/nobackup/tracetest'
make: *** [Makefile:248: __sub-make] Error 2

This is due to the replacement of writepage and calling swap_writepage()
and shmem_writepage() directly. The issue is that when CONFIG_SHMEM is not
defined, shmem_writepage() is also not defined. Add it as a stub, and it
should also never be called when CONFIG_SHMEM is undefined.

Fixes: 84798514db50 ("mm: Remove swap_writepage() and shmem_writepage()")
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 mm/shmem.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/mm/shmem.c b/mm/shmem.c
index 858cee02ca49..dec85388030a 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -5760,6 +5760,11 @@ void shmem_unlock_mapping(struct address_space *mapping)
 {
 }
 
+int shmem_writeout(struct folio *folio, struct writeback_control *wbc)
+{
+	return 0;
+}
+
 #ifdef CONFIG_MMU
 unsigned long shmem_get_unmapped_area(struct file *file,
 				      unsigned long addr, unsigned long len,
-- 
2.47.2

