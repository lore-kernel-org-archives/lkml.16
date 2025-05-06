Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E943D994
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 23:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746574807; cv=none; b=hNRoGHnnNgb5K6OvjI/IoiY4kRkkhSBw8FtfnL9lI6/+Fl/7+PgTaYZmjyZFwn26D9G9joFzKdoYol3QkcSAd4CrPB3qNAI91FzTXf0uVgE8le9GyyAdVXoEkpbRU0GirsDdvke0QXpTMNjhRCEyDYJedS9pSwclPXVEyNJhb0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746574807; c=relaxed/simple;
	bh=Xxric35oJErFAQpz6t4hQ96lWMVwwl/sYBcBTCyvxCM=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=u3GEj2p7/Mk8H/SXcDiYHZuZqQq+JIsTxIw9V1ZCQmiJ3/TAdFGKvshFBCYcxkfRJGCTDIpRo/JcdC/JnJbTQ5iRS80TPGQcHnX6cxIurKONKp9wjkmaUJf8NE3eG+ipA4iHjoiC+vA8ud9dau/cmri0xMgEBvHY8XMsM7EY4E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=OuVJJGsN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="OuVJJGsN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B11EC4CEEE;
	Tue,  6 May 2025 23:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746574805;
	bh=Xxric35oJErFAQpz6t4hQ96lWMVwwl/sYBcBTCyvxCM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OuVJJGsNMi0VR4SwQ7TQYjw484+8aNWMvb5FJXL3dCUEDsXgonyBQ0he2+lpFunn1
	 aaXwy+LLraDq3IO0BoQwZaEsP8HfCmaDK2MSSszyIYP28+5SiOMPboxtM/k5aLq5Gj
	 OxSIOr+//4xJpfUMPjuKlkrbmUsF9i0izUeOpWMA=
Date: Tue, 6 May 2025 16:40:04 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Ignacio.MorenoGonzalez@kuka.com
Cc: Ignacio Moreno Gonzalez via B4 Relay
 <devnull+Ignacio.MorenoGonzalez.kuka.com@kernel.org>,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 yang@os.amperecomputing.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v2 2/2] mm: madvise: no-op for MADV_NOHUGEPAGE if THP is
 disabled
Message-Id: <20250506164004.e80e635a28dabb89b7257820@linux-foundation.org>
In-Reply-To: <20250506-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v2-2-f11f0c794872@kuka.com>
References: <20250506-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v2-0-f11f0c794872@kuka.com>
	<20250506-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v2-2-f11f0c794872@kuka.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 06 May 2025 15:44:33 +0200 Ignacio Moreno Gonzalez via B4 Relay <devnull+Ignacio.MorenoGonzalez.kuka.com@kernel.org> wrote:

> From: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
> 
> VM_NOHUGEPAGE is a no-op in a kernel without THP. So it makes no sense
> to return an error when calling madvise() with MADV_NOHUGEPAGE.

The patch looks rather odd.

> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -7,6 +7,10 @@
>  #include <linux/fs.h> /* only for vma_is_dax() */
>  #include <linux/kobject.h>
>  
> +#ifndef CONFIG_TRANSPARENT_HUGEPAGE
> +#include <uapi/asm-generic/mman-common.h>
> +#endif

Why is the #ifndef here?

This is the only file under include/linux which directly includes
something from uapi/asm-generic.  Indicates that we're doing something
wrong.

If this hunk is truly the correct approach then I think we need a
comment here fully explaining what is going on.   Because it looks odd!

>  vm_fault_t do_huge_pmd_anonymous_page(struct vm_fault *vmf);
>  int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
>  		  pmd_t *dst_pmd, pmd_t *src_pmd, unsigned long addr,
> @@ -598,6 +602,8 @@ static inline bool unmap_huge_pmd_locked(struct vm_area_struct *vma,
>  static inline int hugepage_madvise(struct vm_area_struct *vma,
>  				   unsigned long *vm_flags, int advice)
>  {
> +	if (advice == MADV_NOHUGEPAGE)
> +		return 0;

Also a comment here which explains why we're doing this?

>  	return -EINVAL;
>  }
>  
> 
> -- 
> 2.39.5
> 
