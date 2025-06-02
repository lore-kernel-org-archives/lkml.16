Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C341221297
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 21:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748898827; cv=none; b=D6+yZMW/BPqvLyg49Jx6AiyeQyX1+THTzXn1in+ZFLiHDSBGEq841/VCn+iuQUc1GaKg9QfjPgUmYPr2eguqdovJqa11+A34x+zqhWrnBlyxdelv/xn8oboJgHuZdGtBM4QF4uEIQbyHaRpH8JAvZPzR+ESUkfS/3oyd6TsI+3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748898827; c=relaxed/simple;
	bh=o9DpXCA0aRGtLlwK7hg83J1m+0koDQhVrg2oPYRgLj0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZEmvnv09KvDGZe9lBMwKM6Js1uq0g0PBplt1Hgxyr5EaJQhKlekxibscyujpZBKEHJdJrFb2Td6t+HEiE1gxTzqqCmEg2fGiFpWduagooN5a2YFRaSyslA+66SbFT9TKJdoANZU2+hittF8FP3Pg/k5Rghhr6wBbj5ApxGTdFqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C506C4CEEE;
	Mon,  2 Jun 2025 21:13:46 +0000 (UTC)
Date: Mon, 2 Jun 2025 17:14:58 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org
Cc: Hugh Dickins <hughd@google.com>, Andrew Morton
 <akpm@linux-foundation.org>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] mm: Fix compile error when CONFIG_SHMEM is not set
Message-ID: <20250602171458.7ceabb1c@gandalf.local.home>
In-Reply-To: <20250602170500.48713a2b@gandalf.local.home>
References: <20250602170500.48713a2b@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 2 Jun 2025 17:05:00 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> From: Steven Rostedt <rostedt@goodmis.org>
> 
> When CONFIG_SHMEM is not set, the following compiler error occurs:
> 
> ld: vmlinux.o: in function `ttm_backup_backup_page':

Actually, I was looking at the wrong location and not at ttm_backup_backup_page().

Which commit fe75adffac33e ("ttm: Call shmem_writeout() from
ttm_backup_backup_page()") updates as:

diff --git a/drivers/gpu/drm/ttm/ttm_backup.c b/drivers/gpu/drm/ttm/ttm_backup.c
index 93c007f18855..0d5718466ffc 100644
--- a/drivers/gpu/drm/ttm/ttm_backup.c
+++ b/drivers/gpu/drm/ttm/ttm_backup.c
@@ -136,13 +136,13 @@ ttm_backup_backup_page(struct ttm_backup *backup, struct page *page,
                        .for_reclaim = 1,
                };
                folio_set_reclaim(to_folio);
-               ret = mapping->a_ops->writepage(folio_file_page(to_folio, idx), &wbc);
+               ret = shmem_writeout(to_folio, &wbc);
                if (!folio_test_writeback(to_folio))
                        folio_clear_reclaim(to_folio);
                /*
-                * If writepage succeeds, it unlocks the folio.
-                * writepage() errors are otherwise dropped, since writepage()
-                * is only best effort here.
+                * If writeout succeeds, it unlocks the folio.  errors
+                * are otherwise dropped, since writeout is only best
+                * effort here.
                 */
                if (ret)
                        folio_unlock(to_folio);

I'm not sure this is the right fix or not.


> (.text+0x10363bc): undefined reference to `shmem_writeout'
> make[3]: *** [/work/build/trace/nobackup/linux-test.git/scripts/Makefile.vmlinux:91: vmlinux.unstripped] Error 1
> make[2]: *** [/work/build/trace/nobackup/linux-test.git/Makefile:1241: vmlinux] Error 2
> make[1]: *** [/work/build/trace/nobackup/linux-test.git/Makefile:248: __sub-make] Error 2
> make[1]: Leaving directory '/work/build/nobackup/tracetest'
> make: *** [Makefile:248: __sub-make] Error 2
> 
> This is due to the replacement of writepage and calling swap_writepage()
> and shmem_writepage() directly. The issue is that when CONFIG_SHMEM is not
> defined, shmem_writepage() is also not defined. Add it as a stub, and it
> should also never be called when CONFIG_SHMEM is undefined.
> 
> Fixes: 84798514db50 ("mm: Remove swap_writepage() and shmem_writepage()")
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> ---
>  mm/shmem.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 858cee02ca49..dec85388030a 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -5760,6 +5760,11 @@ void shmem_unlock_mapping(struct address_space *mapping)
>  {
>  }
>  
> +int shmem_writeout(struct folio *folio, struct writeback_control *wbc)
> +{
> +	return 0;

Perhaps this should return:

	return swap_writeout(folio, wbc);

?

-- Steve

> +}
> +
>  #ifdef CONFIG_MMU
>  unsigned long shmem_get_unmapped_area(struct file *file,
>  				      unsigned long addr, unsigned long len,

