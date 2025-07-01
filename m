Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 748C21F2BBB
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 04:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751345598; cv=none; b=iP8UCHteZviSZ06pDlnLd6aL15vikG8jkWhx40x4UG5ah1qFUng4k8vJEgg2dhYYHEx4l9U4ZFSzENCpkOkMhpprwGA6YanreRa3z4wv21F5LIZVPROToARgBQcQsc40SGQFIfGXcEePL2tmRcXn0VM8jiw5rQrbxI5FZ2WlB9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751345598; c=relaxed/simple;
	bh=3xXPvgrFB5sdTWcZ4PNdiS/pIOFD7lQCFXKg+2eevmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IinkjJ3tvvhgwioIkzlNeSamgMQ3Oakt8oUw4genQfP3FL1uUmHiA8jbUU7seKikXBtKNfIxwb2Z4hCD8dxkh+JgITZ8SU8tcDxkC2mhD5zZeojSTuOyPLX/YQzpS4zOjct4p5qZLycxrv1zAEsMdyyBxxqZSpKwwNj4hlpLi+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4911A15A1;
	Mon, 30 Jun 2025 21:53:00 -0700 (PDT)
Received: from [10.164.146.16] (J09HK2D2RT.blr.arm.com [10.164.146.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C882A3F6A8;
	Mon, 30 Jun 2025 21:53:11 -0700 (PDT)
Message-ID: <965ab1cd-c606-4724-a8f0-b352f4a3d443@arm.com>
Date: Tue, 1 Jul 2025 10:23:08 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: Deduplicate mm_get_unmapped_area()
To: Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Jason Gunthorpe <jgg@nvidia.com>,
 Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>,
 David Hildenbrand <david@redhat.com>
References: <20250627160739.2124768-1-peterx@redhat.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250627160739.2124768-1-peterx@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/06/25 9:37 PM, Peter Xu wrote:
> Essentially it sets vm_flags==0 for mm_get_unmapped_area_vmflags().  Use
> the helper instead to dedup the lines.
> 
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Jann Horn <jannh@google.com>
> Cc: Pedro Falcato <pfalcato@suse.de>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Oscar Salvador <osalvador@suse.de>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Reviewed-by: Pedro Falcato <pfalcato@suse.de>
> Acked-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  mm/mmap.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/mmap.c b/mm/mmap.c
> index 8f92cf10b656..74072369e8fd 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -871,9 +871,8 @@ mm_get_unmapped_area(struct mm_struct *mm, struct file *file,
>  		     unsigned long addr, unsigned long len,
>  		     unsigned long pgoff, unsigned long flags)
>  {
> -	if (test_bit(MMF_TOPDOWN, &mm->flags))
> -		return arch_get_unmapped_area_topdown(file, addr, len, pgoff, flags, 0);
> -	return arch_get_unmapped_area(file, addr, len, pgoff, flags, 0);
> +	return mm_get_unmapped_area_vmflags(mm, file, addr, len,
> +					    pgoff, flags, 0);
>  }
>  EXPORT_SYMBOL(mm_get_unmapped_area);
>  

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
