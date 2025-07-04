Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7491547C9
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 22:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751667540; cv=none; b=YMbB2bi5WqLWCYMaHgGxJygXaIEMdqq3Ua/RZAa8IionU/FK6GhWoYiJwfN8O9XSsPbGHUaWCnPo78U8gzPRKRfm9xznt1dY4p+j88U0N88Y9EG7cnxViCDguOnu1+25MffmX/EdED4c/Ngkp47ZcvdoEInFE7eCQB6NBRano0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751667540; c=relaxed/simple;
	bh=FMf4yoXOBgzhcwgHrVEBf0biqD0n/qMzJWPz1SWijcM=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=cyPq+55A6EN3QN2w0oaHqUae1lLWw7GxteSgRSuglGS3BI1pZF89aIkFjj7ouCiB0L2oGi/E5Egw8U0vXd8QVnq4SOxyo12r7UMXXKwByodd4yZYDXR2xTb6wqudoijXA2tBkMc4rmbqWunmfxrqkFA1zdFpmGv0gJ+yzz7CgSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=XrI+4HPR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="XrI+4HPR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2857C4CEE3;
	Fri,  4 Jul 2025 22:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1751667539;
	bh=FMf4yoXOBgzhcwgHrVEBf0biqD0n/qMzJWPz1SWijcM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XrI+4HPRJ+623pMTvyGIRoDkX71TJvvxw94bykMcExYog7ze9ggr/OLSpIWVmOVC/
	 83ZVmDRZHZam9gt62/LjxrT1fZbSdxylewDmDLQkqfgP7FeIYcbuFve0H6ojzuIBfB
	 /Bax2u4lKcyPwqxhqwg6N1ZmV2nOIzPf1JFoduCU=
Date: Fri, 4 Jul 2025 15:18:58 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: hughd@google.com, david@redhat.com, ziy@nvidia.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm: fault in complete folios instead of individual
 pages for tmpfs
Message-Id: <20250704151858.73d35a24b4c2f53bdb0c1b85@linux-foundation.org>
In-Reply-To: <440940e78aeb7430c5cc8b6d2088ae98265b9809.1751599072.git.baolin.wang@linux.alibaba.com>
References: <440940e78aeb7430c5cc8b6d2088ae98265b9809.1751599072.git.baolin.wang@linux.alibaba.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  4 Jul 2025 11:19:26 +0800 Baolin Wang <baolin.wang@linux.alibaba.com> wrote:

> After commit acd7ccb284b8 ("mm: shmem: add large folio support for tmpfs"),
> tmpfs can also support large folio allocation (not just PMD-sized large
> folios).
> 
> However, when accessing tmpfs via mmap(), although tmpfs supports large folios,
> we still establish mappings at the base page granularity, which is unreasonable.
> 
> We can map multiple consecutive pages of a tmpfs folios at once according to
> the size of the large folio. On one hand, this can reduce the overhead of page
> faults; on the other hand, it can leverage hardware architecture optimizations
> to reduce TLB misses, such as contiguous PTEs on the ARM architecture.
> 
> Moreover, tmpfs mount will use the 'huge=' option to control large folio
> allocation explicitly. So it can be understood that the process's RSS statistics
> might increase, and I think this will not cause any obvious effects for users.
> 
> Performance test:
> I created a 1G tmpfs file, populated with 64K large folios, and write-accessed it
> sequentially via mmap(). I observed a significant performance improvement:

That doesn't sound like a crazy thing to do.

> Before the patch:
> real	0m0.158s
> user	0m0.008s
> sys	0m0.150s
> 
> After the patch:
> real	0m0.021s
> user	0m0.004s
> sys	0m0.017s

And look at that.

> diff --git a/mm/memory.c b/mm/memory.c
> index 0f9b32a20e5b..9944380e947d 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -5383,10 +5383,10 @@ vm_fault_t finish_fault(struct vm_fault *vmf)
>  
>  	/*
>  	 * Using per-page fault to maintain the uffd semantics, and same
> -	 * approach also applies to non-anonymous-shmem faults to avoid
> +	 * approach also applies to non shmem/tmpfs faults to avoid
>  	 * inflating the RSS of the process.
>  	 */
> -	if (!vma_is_anon_shmem(vma) || unlikely(userfaultfd_armed(vma)) ||
> +	if (!vma_is_shmem(vma) || unlikely(userfaultfd_armed(vma)) ||
>  	    unlikely(needs_fallback)) {
>  		nr_pages = 1;
>  	} else if (nr_pages > 1) {

and that's it?

I'm itching to get this into -stable, really.  What LTS user wouldn't
want this?  Could it be viewed as correcting an oversight in
acd7ccb284b8?

