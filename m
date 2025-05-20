Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4469C242913
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747750050; cv=none; b=Tkwu5/AhO89BkwerFhOXsYK/psRTZ2oHqUgszH6J8fnH0NNZ3lx7V59Af/JWVPeXvLPTmP24pWQ2zKVDEfUQhDVYsPiC95gEHhY0Zvw2BOwPSrxPXRn7cTVwjTx3OhKKvGYOXvRxljQguWwEMBsCfuSoGM68cMpqSfqudn+Yhx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747750050; c=relaxed/simple;
	bh=3VbsCn/8BDdGAoKRiw85VsmQkWPZarb8OY05EU0n5Xs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VTDWpkoMK1tv3Gb+I+TQEss9pNyxdLCwGTgDrgdtaE/52sF6ScpGXspmUL24j7EzjHRfDuUqnlbB5kxaxgR9PHbIwScp2jQwIDUyxu1e0/DgKl+O95jk7/c2XD1TQ2N2nEoXo03SjEZB4HoOA8DE2NL6px4dn+J/9x06gt3gFJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R+3QNYYU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R+3QNYYU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747750046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a8m2BRyEw6zS+4OVzo3rpgvhXlNDh0vPuD8aVrI5HC4=;
	b=R+3QNYYUpZcWHJZJuiYMD0I7wdSUG2bRc0jW5Yg498nMGtakaHHokHa8MvxXh84pMfNt8e
	D3nppBV4/hThGQoaqtoN5oOwBzZjzULWOiUhFFlXz5Y8eNYTGqfl8ZLcs5S+4juM7HWTRr
	KAoa5yuG9sx3MYQe4ZInzPVqDMDr1Vk=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-JYrfPwcdMSajOxcacW-igQ-1; Tue, 20 May 2025 10:07:25 -0400
X-MC-Unique: JYrfPwcdMSajOxcacW-igQ-1
X-Mimecast-MFC-AGG-ID: JYrfPwcdMSajOxcacW-igQ_1747750044
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3dc30ae41b9so2484375ab.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 07:07:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747750044; x=1748354844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a8m2BRyEw6zS+4OVzo3rpgvhXlNDh0vPuD8aVrI5HC4=;
        b=IkeNKKZxpVDviG6Ns0940GVumb8lnn4IalzErwKwUFKNBg6vLfs++BjjvvWJ9/M4QH
         1B6KNipX/iIuYJAai+5cp2WMor1xEfayhy+bN2qQ1N+Ciz9dvwchkl3WN/WqxT9uo52Q
         ErKxsZsYnrAMh1eCAoH8+UkMTf/xg827THk/HqiSpiq2ooKly/IFxcv5odu34wpWSBWH
         iQIgcO34W9t/F97b410wLbH8YwlO9RjFKPO9jya02qci4hFsoobZxxhgyM2yLyoPsshX
         CV9y2MoenNhNpKUiPegAdmsWNx7qbEr7si5nTSXN1C5GQo0rFTrWapcXfLWgLa0JcKFw
         a+LA==
X-Forwarded-Encrypted: i=1; AJvYcCVLFWs/uXBraBU9Beb5NxW+ssPiwfdhNRMjiPy6o5i9W4dEAN18CZiFwep+HgWV1KWAMpcGXZNp5yhO8OQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKrTYNftybs3jDe62wB2BU8RvszSPCkoL9SPvzn0OtR+md5M1j
	whuj9dOU4SjwhFZcQtbOpCJkCAkJEoF8dBZDXsV8gM1C/88rnDTixsI8uP0Y2cnmsRW623WcVHk
	IyoeqwjTjiJ2eyt/tvM9hb5IUf7FU7C3YIoIrNj5OweWRR4YyY64RLQrEEObmaW8+oA==
X-Gm-Gg: ASbGncvfu4HPQuDRhOgffEGFc5fmH3xHTFLiwbEMQWxejVBxYiXVh/txvjMNB5C3RRX
	8G8NOIyBJtE2fIS0ckUjSQrUhNCKUVNMc/puolQSasZC0wgCnPnJ6Hlc6K/zawzW4mdlvW3QUSM
	IFREhn4g7vAkSFA/yyrh0b4KwXwr8PC2KFoKqdUaGQCmG8l4FMLZno02xIq2CQq9gMWihs3ueEr
	9gPQk4gTdrWj5QGwLTKYOE6jcnvvbHjuSANTT6J00wALHY3nHS2Ulz8uSkZXiQqb4RPYIDPM4y0
	XIq33VVcC0jDx1w=
X-Received: by 2002:a05:6e02:220d:b0:3d9:6632:d558 with SMTP id e9e14a558f8ab-3db841c9d47mr56884795ab.0.1747750043545;
        Tue, 20 May 2025 07:07:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2PheKAWR/qCxqwxl2c6DXf4ZDTX/8QqZVzjT+uS1z0BmW9qLjCavouKiqO/6yEvKnuOnhMw==
X-Received: by 2002:a05:6e02:220d:b0:3d9:6632:d558 with SMTP id e9e14a558f8ab-3db841c9d47mr56884655ab.0.1747750042989;
        Tue, 20 May 2025 07:07:22 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc4e9147sm2214645173.133.2025.05.20.07.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 07:07:21 -0700 (PDT)
Date: Tue, 20 May 2025 08:07:19 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: lizhe.67@bytedance.com
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 muchun.song@linux.dev, Peter Xu <peterx@redhat.com>, David Hildenbrand
 <david@redhat.com>
Subject: Re: [PATCH v3] vfio/type1: optimize vfio_pin_pages_remote() for
 huge folio
Message-ID: <20250520080719.2862017e.alex.williamson@redhat.com>
In-Reply-To: <20250520070020.6181-1-lizhe.67@bytedance.com>
References: <20250520070020.6181-1-lizhe.67@bytedance.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 20 May 2025 15:00:20 +0800
lizhe.67@bytedance.com wrote:

> From: Li Zhe <lizhe.67@bytedance.com>
> 
> When vfio_pin_pages_remote() is called with a range of addresses that
> includes huge folios, the function currently performs individual
> statistics counting operations for each page. This can lead to significant
> performance overheads, especially when dealing with large ranges of pages.
> 
> This patch optimize this process by batching the statistics counting
> operations.
> 
> The performance test results for completing the 8G VFIO IOMMU DMA mapping,
> obtained through trace-cmd, are as follows. In this case, the 8G virtual
> address space has been mapped to physical memory using hugetlbfs with
> pagesize=2M.
> 
> Before this patch:
> funcgraph_entry:      # 33813.703 us |  vfio_pin_map_dma();
> 
> After this patch:
> funcgraph_entry:      # 15635.055 us |  vfio_pin_map_dma();

It looks like we're using the same numbers since the initial
implementation, have these results changed?

> 
> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>

Appreciate the credit, this should probably be Co-developed-by: though.
In general a sign-off is something that needs to be explicitly given.

> ---
> Changelogs:
> 
> v2->v3:
> - Code simplification.
> - Fix some issues in comments.
> 
> v1->v2:
> - Fix some issues in comments and formatting.
> - Consolidate vfio_find_vpfn_range() and vfio_find_vpfn().
> - Move the processing logic for huge folio into the while(true) loop
>   and use a variable with a default value of 1 to indicate the number
>   of consecutive pages.
> 
> v2 patch: https://lore.kernel.org/all/20250519070419.25827-1-lizhe.67@bytedance.com/
> v1 patch: https://lore.kernel.org/all/20250513035730.96387-1-lizhe.67@bytedance.com/
> 
>  drivers/vfio/vfio_iommu_type1.c | 48 +++++++++++++++++++++++++--------
>  1 file changed, 37 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index 0ac56072af9f..48f06ce0e290 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -319,15 +319,22 @@ static void vfio_dma_bitmap_free_all(struct vfio_iommu *iommu)
>  /*
>   * Helper Functions for host iova-pfn list
>   */
> -static struct vfio_pfn *vfio_find_vpfn(struct vfio_dma *dma, dma_addr_t iova)
> +
> +/*
> + * Find the first vfio_pfn that overlapping the range
> + * [iova, iova + PAGE_SIZE * npage) in rb tree.
> + */
> +static struct vfio_pfn *vfio_find_vpfn_range(struct vfio_dma *dma,
> +		dma_addr_t iova, unsigned long npage)
>  {
>  	struct vfio_pfn *vpfn;
>  	struct rb_node *node = dma->pfn_list.rb_node;
> +	dma_addr_t end_iova = iova + PAGE_SIZE * npage;
>  
>  	while (node) {
>  		vpfn = rb_entry(node, struct vfio_pfn, node);
>  
> -		if (iova < vpfn->iova)
> +		if (end_iova <= vpfn->iova)
>  			node = node->rb_left;
>  		else if (iova > vpfn->iova)
>  			node = node->rb_right;
> @@ -337,6 +344,11 @@ static struct vfio_pfn *vfio_find_vpfn(struct vfio_dma *dma, dma_addr_t iova)
>  	return NULL;
>  }
>  
> +static inline struct vfio_pfn *vfio_find_vpfn(struct vfio_dma *dma, dma_addr_t iova)
> +{
> +	return vfio_find_vpfn_range(dma, iova, 1);
> +}
> +
>  static void vfio_link_pfn(struct vfio_dma *dma,
>  			  struct vfio_pfn *new)
>  {
> @@ -681,32 +693,46 @@ static long vfio_pin_pages_remote(struct vfio_dma *dma, unsigned long vaddr,
>  		 * and rsvd here, and therefore continues to use the batch.
>  		 */
>  		while (true) {
> +			struct folio *folio = page_folio(batch->pages[batch->offset]);
> +			long nr_pages;
> +
>  			if (pfn != *pfn_base + pinned ||
>  			    rsvd != is_invalid_reserved_pfn(pfn))
>  				goto out;
>  
> +			/*
> +			 * Note: The current nr_pages does not achieve the optimal
> +			 * performance in scenarios where folio_nr_pages() exceeds
> +			 * batch->capacity. It is anticipated that future enhancements
> +			 * will address this limitation.
> +			 */
> +			nr_pages = min((long)batch->size, folio_nr_pages(folio) -
> +						folio_page_idx(folio, batch->pages[batch->offset]));

We should use min_t() here, otherwise it looks good to me.

Peter, David, if you wouldn't mind double checking the folio usage
here, I'd appreciate it.  The underlying assumption used here is that
folios always have physically contiguous pages, so we can increment at
the remainder of the folio_nr_pages() rather than iterate each page.
Thanks,

Alex

> +			if (nr_pages > 1 && vfio_find_vpfn_range(dma, iova, nr_pages))
> +				nr_pages = 1;
> +
>  			/*
>  			 * Reserved pages aren't counted against the user,
>  			 * externally pinned pages are already counted against
>  			 * the user.
>  			 */
> -			if (!rsvd && !vfio_find_vpfn(dma, iova)) {
> +			if (!rsvd && (nr_pages > 1 || !vfio_find_vpfn(dma, iova))) {
>  				if (!dma->lock_cap &&
> -				    mm->locked_vm + lock_acct + 1 > limit) {
> +				    mm->locked_vm + lock_acct + nr_pages > limit) {
>  					pr_warn("%s: RLIMIT_MEMLOCK (%ld) exceeded\n",
>  						__func__, limit << PAGE_SHIFT);
>  					ret = -ENOMEM;
>  					goto unpin_out;
>  				}
> -				lock_acct++;
> +				lock_acct += nr_pages;
>  			}
>  
> -			pinned++;
> -			npage--;
> -			vaddr += PAGE_SIZE;
> -			iova += PAGE_SIZE;
> -			batch->offset++;
> -			batch->size--;
> +			pinned += nr_pages;
> +			npage -= nr_pages;
> +			vaddr += PAGE_SIZE * nr_pages;
> +			iova += PAGE_SIZE * nr_pages;
> +			batch->offset += nr_pages;
> +			batch->size -= nr_pages;
>  
>  			if (!batch->size)
>  				break;

