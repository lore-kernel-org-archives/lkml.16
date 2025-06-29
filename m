Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C67320B
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 08:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751187103; cv=none; b=IC4YEot6ROtlRGpc5WanoJe0s6fZORua8Oi6F6+2I1zBDUSezJbvdUihRp31V5YQvleLqCZ3joEa8Xp6w7f7bhssEipyzJdvN5J300CsatqpWOTb12v7+yJocJvh+cMm4lKSiWcpZR8yZrzADOmQ7zZ0PpTI1ZP1BgIzhoBG+JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751187103; c=relaxed/simple;
	bh=5uWMeX0USYqxCqcAMVfn2KWp24EahrMEUN4i/w96vwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rKR/HxPd3Ft9hci29WOkwMsMBwRV+9WDbv86aeojtxr1LAHcZFn8NqbXQ/MkNHVSJ0u3H3s0/JDXMmrztHfxPDsFX/Y8UWAIo5pIPfAkLOWfE0kiZJpUiWExRq+i4g/Mdj9dGnk1QgkQ0Zd7YnJarhjCaxpqaNrpcZT1XJl5iSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=riy/zLCX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="riy/zLCX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21915C4CEEB;
	Sun, 29 Jun 2025 08:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751187102;
	bh=5uWMeX0USYqxCqcAMVfn2KWp24EahrMEUN4i/w96vwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=riy/zLCXVDoNPul7BeSSE8xeH2ruTCgVUdvM2T4R9mP2CnW6txrvqju2EdljGucdZ
	 z1LO+ZdcyLMHqroOlvNvV30gvWNq5Q5pir+9LT/INdMf17OWA21ioxZRJ8UbCdNcMM
	 eYQBFtCHGcNPleJYGRA6+diAVol+0uMOTWIu6okEnrIaLjLNtGyzrWSzSHXkVc7YYb
	 oRsdToclzbIO74l6K11k3nOHeofMDaGmrxC+R2D9AH2pNCXUh/q5MBZw+mfR/WCNTu
	 uFHTcQlbMTrn9kl9z3Z67bDFZ+VlTV6Z2zSJTsu+xJ73xc3jfFbUla+5Q65Ie2fSd7
	 4PmHcBaeRXA/A==
Date: Sun, 29 Jun 2025 11:51:33 +0300
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
Subject: Re: [PATCH v2 2/4] mm/shmem: Support vm_uffd_ops API
Message-ID: <aGD-lZMKPcgYrtBh@kernel.org>
References: <20250627154655.2085903-1-peterx@redhat.com>
 <20250627154655.2085903-3-peterx@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627154655.2085903-3-peterx@redhat.com>

On Fri, Jun 27, 2025 at 11:46:53AM -0400, Peter Xu wrote:
> Add support for the new vm_uffd_ops API for shmem.  Note that this only
> introduces the support, the API is not yet used by core mm.
> 
> Due to the tailored uffd_copy() API, shmem is extremely easy to support it
> by reusing the existing mfill function.
> 
> It only needs a separate uffd_get_folio() definition but that's oneliner.
> 
> Cc: Hugh Dickins <hughd@google.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  mm/shmem.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 2b19965d27df..9a8b8dd4709b 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -3151,6 +3151,13 @@ static inline struct inode *shmem_get_inode(struct mnt_idmap *idmap,
>  #endif /* CONFIG_TMPFS_QUOTA */
>  
>  #ifdef CONFIG_USERFAULTFD
> +
> +static int shmem_uffd_get_folio(struct inode *inode, pgoff_t pgoff,
> +				struct folio **folio)
> +{
> +	return shmem_get_folio(inode, pgoff, 0, folio, SGP_NOALLOC);
> +}
> +
>  int shmem_mfill_atomic_pte(pmd_t *dst_pmd,
>  			   struct vm_area_struct *dst_vma,
>  			   unsigned long dst_addr,
> @@ -5194,6 +5201,19 @@ static int shmem_error_remove_folio(struct address_space *mapping,
>  	return 0;
>  }
>  
> +#ifdef CONFIG_USERFAULTFD
> +static const vm_uffd_ops shmem_uffd_ops = {
> +	.uffd_features	= 	__VM_UFFD_FLAGS,
> +	.uffd_ioctls	= 	BIT(_UFFDIO_COPY) |
> +				BIT(_UFFDIO_ZEROPAGE) |
> +				BIT(_UFFDIO_WRITEPROTECT) |
> +				BIT(_UFFDIO_CONTINUE) |
> +				BIT(_UFFDIO_POISON),
> +	.uffd_get_folio	=	shmem_uffd_get_folio,
> +	.uffd_copy	=	shmem_mfill_atomic_pte,
> +};
> +#endif
> +
>  static const struct address_space_operations shmem_aops = {
>  	.dirty_folio	= noop_dirty_folio,
>  #ifdef CONFIG_TMPFS
> @@ -5296,6 +5316,9 @@ static const struct vm_operations_struct shmem_vm_ops = {
>  	.set_policy     = shmem_set_policy,
>  	.get_policy     = shmem_get_policy,
>  #endif
> +#ifdef CONFIG_USERFAULTFD
> +	.userfaultfd_ops = &shmem_uffd_ops,
> +#endif
>  };
>  
>  static const struct vm_operations_struct shmem_anon_vm_ops = {
> @@ -5305,6 +5328,9 @@ static const struct vm_operations_struct shmem_anon_vm_ops = {
>  	.set_policy     = shmem_set_policy,
>  	.get_policy     = shmem_get_policy,
>  #endif
> +#ifdef CONFIG_USERFAULTFD
> +	.userfaultfd_ops = &shmem_uffd_ops,
> +#endif
>  };
>  
>  int shmem_init_fs_context(struct fs_context *fc)
> -- 
> 2.49.0
> 
> 

-- 
Sincerely yours,
Mike.
