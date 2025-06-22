Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B1D13B58C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 07:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750577293; cv=none; b=MalMVOIRN+XDZK3W+g0AMSbEHKww4sjwX2+PKnWGqYpJxe3jMNeE4pmS/mkaOHCS4u350jUvxmfSaidy+EunVClc3LfYOkkgCKu/F+bDPIIy8EXocUX6hLnGQBuEZ65vlDz2FFohHb73yTvObEwkkSptElhs1dLVs4i/+bXdmus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750577293; c=relaxed/simple;
	bh=ZZ2XvIKaZc+qHuHN/cwtEjIrE44seOhCx+4+J1dO8A0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QnlpT98jxCGCyB7mdyqfrAemdbGJQ9EBRE78WncQXjxO37D9TNrwjuS6g+u8qPqzPM05cg0zP6a14wcbs/QH+pL1zzRTyIskm6QKhzbCqcOHGYxPXHRu+BlhRfjpWgaTLeCDuRWF4PTNf7E726ejZCi5AWkxR1HQr7xfhm2qOnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dDIcZ4SF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dDIcZ4SF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A27CC4CEE3;
	Sun, 22 Jun 2025 07:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750577293;
	bh=ZZ2XvIKaZc+qHuHN/cwtEjIrE44seOhCx+4+J1dO8A0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dDIcZ4SFurenyXdrjh4EbhutJVTqpVHg32N3U4WBEIc0CaHcRtNS7tEN80nD8nUM+
	 iwfLM7W9KJX09tue4HZdoUJyaPjLM29CulNmr9zeRxt8884jD7z8TdVaooA95KDJum
	 VXxKHHYVjyP7TXFHYQcV3kDkMUH7HoZtbvUtQn7U4p59CCCcGuqomgO6O32id7LDOV
	 Rc27LHD+iAt4jI7SpDyRC1MZfj5fvdn8zaD0kJZNyV9kzfN2EBER2zMjFjf/5RmSwF
	 5qSsj8EnuQtbY0TDwFpBavMZpy6Jb7a/v4LVCjoMqM7GdS/VtzJ9kQ6X04aipb4HkJ
	 l2zMK4nDPAwpw==
Date: Sun, 22 Jun 2025 10:28:04 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Peter Xu <peterx@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Nikita Kalyazin <kalyazin@amazon.com>,
	Hugh Dickins <hughd@google.com>, Oscar Salvador <osalvador@suse.de>,
	Michal Hocko <mhocko@suse.com>,
	David Hildenbrand <david@redhat.com>,
	Muchun Song <muchun.song@linux.dev>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Ujwal Kundur <ujwal.kundur@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	James Houghton <jthoughton@google.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Axel Rasmussen <axelrasmussen@google.com>
Subject: Re: [PATCH 1/4] mm: Introduce vm_uffd_ops API
Message-ID: <aFewhN5AF2d7vJFq@kernel.org>
References: <20250620190342.1780170-1-peterx@redhat.com>
 <20250620190342.1780170-2-peterx@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620190342.1780170-2-peterx@redhat.com>

Hi Peter,

On Fri, Jun 20, 2025 at 03:03:39PM -0400, Peter Xu wrote:
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
> 
> Note that such API will not work for anonymous. Core mm will process
> anonymous memory separately for userfault operations like before.
> 
> This patch only introduces the API alone so that we can start to move
> existing users over but without breaking them.
> 
> Currently the uffd_copy() API is almost designed to be the simplistic with
> minimum mm changes to move over to the API.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  include/linux/mm.h            | 71 +++++++++++++++++++++++++++++++++++
>  include/linux/userfaultfd_k.h | 12 ------
>  2 files changed, 71 insertions(+), 12 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 98a606908307..8dfd83f01d3d 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -576,6 +576,70 @@ struct vm_fault {
>  					 */
>  };
>  
> +#ifdef CONFIG_USERFAULTFD
> +/* A combined operation mode + behavior flags. */
> +typedef unsigned int __bitwise uffd_flags_t;
> +
> +enum mfill_atomic_mode {
> +	MFILL_ATOMIC_COPY,
> +	MFILL_ATOMIC_ZEROPAGE,
> +	MFILL_ATOMIC_CONTINUE,
> +	MFILL_ATOMIC_POISON,
> +	NR_MFILL_ATOMIC_MODES,
> +};
> +
> +/* VMA userfaultfd operations */
> +typedef struct {
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
> +} vm_uffd_ops;
> +#endif

Can't we define vm_uffd_ops in userfaultfd_k.h?

A forward declaration in mm.h should suffice and modules that want to use
uffd can include userfaultfd_k.h.

> +
>  /*
>   * These are the virtual MM functions - opening of an area, closing and
>   * unmapping it (needed to keep files on disk up-to-date etc), pointer
> @@ -653,6 +717,13 @@ struct vm_operations_struct {
>  	 */
>  	struct page *(*find_special_page)(struct vm_area_struct *vma,
>  					  unsigned long addr);
> +#ifdef CONFIG_USERFAULTFD
> +	/*
> +	 * Userfaultfd related ops.  Modules need to define this to support
> +	 * userfaultfd.
> +	 */
> +	const vm_uffd_ops *userfaultfd_ops;
> +#endif
>  };
>  
>  #ifdef CONFIG_NUMA_BALANCING
> diff --git a/include/linux/userfaultfd_k.h b/include/linux/userfaultfd_k.h
> index ccad58602846..e79c724b3b95 100644
> --- a/include/linux/userfaultfd_k.h
> +++ b/include/linux/userfaultfd_k.h
> @@ -80,18 +80,6 @@ struct userfaultfd_ctx {
>  
>  extern vm_fault_t handle_userfault(struct vm_fault *vmf, unsigned long reason);
>  
> -/* A combined operation mode + behavior flags. */
> -typedef unsigned int __bitwise uffd_flags_t;
> -
> -/* Mutually exclusive modes of operation. */
> -enum mfill_atomic_mode {
> -	MFILL_ATOMIC_COPY,
> -	MFILL_ATOMIC_ZEROPAGE,
> -	MFILL_ATOMIC_CONTINUE,
> -	MFILL_ATOMIC_POISON,
> -	NR_MFILL_ATOMIC_MODES,
> -};
> -
>  #define MFILL_ATOMIC_MODE_BITS (const_ilog2(NR_MFILL_ATOMIC_MODES - 1) + 1)
>  #define MFILL_ATOMIC_BIT(nr) BIT(MFILL_ATOMIC_MODE_BITS + (nr))
>  #define MFILL_ATOMIC_FLAG(nr) ((__force uffd_flags_t) MFILL_ATOMIC_BIT(nr))
> -- 
> 2.49.0
> 

-- 
Sincerely yours,
Mike.
