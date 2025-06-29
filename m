Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D82C1F866A
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 08:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751187021; cv=none; b=XZxJokOnWHHH9LfhMvK1/hWoe38yz+WXQF6YSrN6aZ87nQBoEBkI8472rHOiVxmHgBvl/3JJB5hERRxxJbxteJwEcCRWTfyaXe0EAV4Yt9KwVZSKBWB6tmjpy5ItYcuPlz0HBL60pr8FSi1S35wQ9HP3C2A0qVQAzpIHeHKRlgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751187021; c=relaxed/simple;
	bh=+uN/BMeSqdG97kTuJhCePNMiCzZqMgbQ1KWNK8YN0F0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Om5AnClqnpy6bbaOPR/xbzLobd3l1OPXv3MZLdoCMOGqjrHzD8TYFlUXDjUiBULOU36//JT2TkrojnwULEpnNiKhFYIPk4mZB7eFxaGFq5xsfbhf47WLQ1aboIShH1+UAQZXbiLM8m9m8pNKEMvZwRILRy3TcX52BlIYP2Ph0TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SHk1klkk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SHk1klkk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 165D3C4CEEB;
	Sun, 29 Jun 2025 08:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751187021;
	bh=+uN/BMeSqdG97kTuJhCePNMiCzZqMgbQ1KWNK8YN0F0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SHk1klkk1P2LS246jBVLwKnTBxe3PjnO/ZrI7VHTtDCTMQ+tIOnmGhxiTW7jIVNJK
	 ZhBnF/5EhWWopCsSki9Ndgoj2nJ2LNHMjL1ZtTOlxPn2jp6U3qslV25gtARnpSYRGu
	 VuKMCjEfAbKjxUWl7CKFktaqrsvVE1WF4iaClmYITpPahUdoAsAlTOQImOGzSH28+R
	 mdLNMqejNiuaMTUw2G5u/eZDDpxp/rDzOe8pG/KQImc0ZiDHqIZbffWUGFnNpSNq9J
	 jwKFtjpxGiWtl6l+DvFtam1ShnT7B4yLox5IRdRu1xo40fS0Oxm8yMzPJgkYiN3uV1
	 sOpFY23mRHeKA==
Date: Sun, 29 Jun 2025 11:50:11 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Peter Xu <peterx@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Muchun Song <muchun.song@linux.dev>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	James Houghton <jthoughton@google.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Nikita Kalyazin <kalyazin@amazon.com>,
	Michal Hocko <mhocko@suse.com>,
	David Hildenbrand <david@redhat.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Ujwal Kundur <ujwal.kundur@gmail.com>
Subject: Re: [PATCH v2 1/4] mm: Introduce vm_uffd_ops API
Message-ID: <aGD-QxroTEDUh1eX@kernel.org>
References: <20250627154655.2085903-1-peterx@redhat.com>
 <20250627154655.2085903-2-peterx@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627154655.2085903-2-peterx@redhat.com>

Hi Peter,

On Fri, Jun 27, 2025 at 11:46:52AM -0400, Peter Xu wrote:
> Introduce a generic userfaultfd API for vm_operations_struct, so that one
> vma, especially when as a module, can support userfaults without modifying
> the core files.  More importantly, when the module can be compiled out of
> the kernel.
> 
> So, instead of having core mm referencing modules that may not ever exist,
> we need to have modules opt-in on core mm hooks instead.
> 
> After this API applied, if a module wants to support userfaultfd, the
> module should only need to touch its own file and properly define
> vm_uffd_ops, instead of changing anything in core mm.

I liked the changelog update you proposed in v1 thread. I took liberty to
slightly update it and here's what I've got:

  Currently, most of the userfaultfd features are implemented directly in the
  core mm.  It will invoke VMA specific functions whenever necessary.  So far
  it is fine because it almost only interacts with shmem and hugetlbfs.

  Introduce a generic userfaultfd API extension for vm_operations_struct,
  so that any code that implements vm_operations_struct (including kernel
  modules that can be compiled separately from the kernel core) can support
  userfaults without modifying the core files.

  With this API applied, if a module wants to support userfaultfd, the
  module should only need to properly define vm_uffd_ops and hook it to
  vm_operations_struct, instead of changing anything in core mm.

> Note that such API will not work for anonymous. Core mm will process
> anonymous memory separately for userfault operations like before.

Maybe:

  This API will not work for anonymous memory. Handling of userfault
  operations for anonymous memory remains unchanged in core mm.
 
> This patch only introduces the API alone so that we can start to move
> existing users over but without breaking them.

Please use imperative mood, e.g.
 
  Only introduce the new API so that ...
 
> Currently the uffd_copy() API is almost designed to be the simplistic with
> minimum mm changes to move over to the API.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  include/linux/mm.h            |  9 ++++++
>  include/linux/userfaultfd_k.h | 52 +++++++++++++++++++++++++++++++++++
>  2 files changed, 61 insertions(+)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index ef40f68c1183..6a5447bd43fd 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -576,6 +576,8 @@ struct vm_fault {
>  					 */
>  };
>  
> +struct vm_uffd_ops;
> +
>  /*
>   * These are the virtual MM functions - opening of an area, closing and
>   * unmapping it (needed to keep files on disk up-to-date etc), pointer
> @@ -653,6 +655,13 @@ struct vm_operations_struct {
>  	 */
>  	struct page *(*find_special_page)(struct vm_area_struct *vma,
>  					  unsigned long addr);
> +#ifdef CONFIG_USERFAULTFD
> +	/*
> +	 * Userfaultfd related ops.  Modules need to define this to support
> +	 * userfaultfd.
> +	 */
> +	const struct vm_uffd_ops *userfaultfd_ops;
> +#endif
>  };
>  
>  #ifdef CONFIG_NUMA_BALANCING
> diff --git a/include/linux/userfaultfd_k.h b/include/linux/userfaultfd_k.h
> index df85330bcfa6..c9a093c4502b 100644
> --- a/include/linux/userfaultfd_k.h
> +++ b/include/linux/userfaultfd_k.h
> @@ -92,6 +92,58 @@ enum mfill_atomic_mode {
>  	NR_MFILL_ATOMIC_MODES,
>  };
>  
> +/* VMA userfaultfd operations */
> +struct vm_uffd_ops {
> +	/**
> +	 * @uffd_features: features supported in bitmask.
> +	 *
> +	 * When the ops is defined, the driver must set non-zero features
> +	 * to be a subset (or all) of: VM_UFFD_MISSING|WP|MINOR.
> +	 */
> +	unsigned long uffd_features;
> +	/**
> +	 * @uffd_ioctls: ioctls supported in bitmask.
> +	 *
> +	 * Userfaultfd ioctls supported by the module.  Below will always
> +	 * be supported by default whenever a module provides vm_uffd_ops:
> +	 *
> +	 *   _UFFDIO_API, _UFFDIO_REGISTER, _UFFDIO_UNREGISTER, _UFFDIO_WAKE
> +	 *
> +	 * The module needs to provide all the rest optionally supported
> +	 * ioctls.  For example, when VM_UFFD_MISSING was supported,
> +	 * _UFFDIO_COPY must be supported as ioctl, while _UFFDIO_ZEROPAGE
> +	 * is optional.
> +	 */
> +	unsigned long uffd_ioctls;
> +	/**
> +	 * uffd_get_folio: Handler to resolve UFFDIO_CONTINUE request.
> +	 *
> +	 * @inode: the inode for folio lookup
> +	 * @pgoff: the pgoff of the folio
> +	 * @folio: returned folio pointer
> +	 *
> +	 * Return: zero if succeeded, negative for errors.
> +	 */
> +	int (*uffd_get_folio)(struct inode *inode, pgoff_t pgoff,
> +			      struct folio **folio);
> +	/**
> +	 * uffd_copy: Handler to resolve UFFDIO_COPY|ZEROPAGE request.
> +	 *
> +	 * @dst_pmd: target pmd to resolve page fault
> +	 * @dst_vma: target vma
> +	 * @dst_addr: target virtual address
> +	 * @src_addr: source address to copy from
> +	 * @flags: userfaultfd request flags
> +	 * @foliop: previously allocated folio
> +	 *
> +	 * Return: zero if succeeded, negative for errors.
> +	 */
> +	int (*uffd_copy)(pmd_t *dst_pmd, struct vm_area_struct *dst_vma,
> +			 unsigned long dst_addr, unsigned long src_addr,
> +			 uffd_flags_t flags, struct folio **foliop);
> +};
> +typedef struct vm_uffd_ops vm_uffd_ops;

Either use vm_uffd_ops_t for the typedef or drop the typedef entirely. My
preference is for the second option.

> +
>  #define MFILL_ATOMIC_MODE_BITS (const_ilog2(NR_MFILL_ATOMIC_MODES - 1) + 1)
>  #define MFILL_ATOMIC_BIT(nr) BIT(MFILL_ATOMIC_MODE_BITS + (nr))
>  #define MFILL_ATOMIC_FLAG(nr) ((__force uffd_flags_t) MFILL_ATOMIC_BIT(nr))
> -- 
> 2.49.0
> 

-- 
Sincerely yours,
Mike.
