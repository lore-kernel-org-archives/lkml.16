Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14024B1E58
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 20:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746562357; cv=none; b=BfYyxAXcehbKXjVt4cDTSsktDRQcdEaHcVTJ3TysbGhalnxH0/P/uwz/Xxa1w18yV39BnR5gkKdQ2cFxaxBLzt9LKIeOGUzaOh7732a4UCBcIB8ayDisL5a5PgShlVhsQ0e4v4747pgXM0LEIndDuOsMD2q0yV+P+rIz92H0uYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746562357; c=relaxed/simple;
	bh=LYEJl+eYUpmTRCpsYGZDOEgiUCSxsf5QIuyINK/GMAE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=paOYhcsQ2ij2xtvYZYRwWtjekvW0i/9nqB9pZ8F5lZPMY5DWx2xM3fl9EPd3CqYIKRoUeVPWQG7hFHuSFxFdEY157wslPOAXVTtrYkREer1dVSOcrkXcNOXaHJY60ObC8FHILdGV+Ya2lDixnpSA8hYwp24Fy2e7Yq6YP+gH+Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KRFOGEDw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KRFOGEDw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746562354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6OeWb7vihmTpzLUB+AGhUaTYkPYqbMEgGJsN2qWU3xk=;
	b=KRFOGEDw/0T6LOQR1vvDtwK/XimK0BXvABJ+8ajQGB0AhINyP/0Ap5/t1xLfMVr6t8s/xS
	hFOQToRASj3V63Rf6ud/6zN4XTm1FN/SJinafynctn0cG7cSTzgAKLCMdTIEnspPpd+M4p
	sJqQoMIgcbpw0ASetxk82MGa4KFaWpI=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519-lE70NsmwMHm0zcx328AG_w-1; Tue, 06 May 2025 16:12:33 -0400
X-MC-Unique: lE70NsmwMHm0zcx328AG_w-1
X-Mimecast-MFC-AGG-ID: lE70NsmwMHm0zcx328AG_w_1746562353
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d461b7aa58so9661415ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 13:12:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746562352; x=1747167152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6OeWb7vihmTpzLUB+AGhUaTYkPYqbMEgGJsN2qWU3xk=;
        b=YKA2DGMNCWnhkoKn4CLFfE6sCQWvXQAkxuQgHYPJpItC9ZslcRi83BzhwUyiJXi9El
         LKg0g42bk4QWzf0LLcnyvg/ONBMGAyLrTUYycYy5drJAyRymDquQbam6TBcwRwyRaT+C
         Fy7PmIRVLz6znCIn5cRun+o4H33wQdkTj6mmQmNfgxnV3/W5ey1L4pT2UVe29I66B5W7
         xBzWH7JXgneh8Z3PGFrpvKBqjTPoYdp1uuK/pfD5iqf5XlkUpgxkEMuCojtdByjEdmb1
         R0rXQf1+Ios0edDKYuSQWao8+0bQFFgh6p/e+17x8jg4O/cYBVnOQDkMGdFKZRMSwNSR
         SWGg==
X-Forwarded-Encrypted: i=1; AJvYcCXkZc6X+dGinzckWwcWCwYj8eBFnXgfoQCf8bmVekXFq9RJ/i69A30oMXw6Y02oUAZ9qmkvqfYhu2lAE3w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKf8y+s95DCfa0IJmdZv1EFGiymEuR/Bvyk/f4A+bboLr3t4Jr
	haEHqgwaKhHcnrQ6QWsh5rckd5xaSoOOtlpvML2V3o6nRNlXihdpyZsHfhbc1EPH6qAP3FyMaoy
	705nCDp1DDAdD2l/8/qpydNqVlNY7mapxp1opvLaVMfPKXryzWd6jKScnOAqRJg==
X-Gm-Gg: ASbGncvZEsDWct4lsZE9wWn/KrM3lrCDtcOgA/WPd1ObEnCc4XL8JOmSLuMMr2eZZhG
	waV1t8rMV//IwU4+CjYU+Rrk/BrZnepdJRU8J3lnW+323+QNlgwUSC7D4B6htx9x5jO7iiujsV0
	AVWSjuGp4yL+AFcSxUn42lDLdmURO/lrVHp/Crw5io3m51z1gKsz9+BfVRanosTpuSZtP2ikzWy
	Ytw9qAFDO1l07cRzS9vuJFV0Xh8duLQmzRIKgI2sJouFyvFSj9/4kapo7nI0L3x8rTweC8mGHjT
	SsDWKk0vod53uwE=
X-Received: by 2002:a05:6e02:1529:b0:3d9:4351:835 with SMTP id e9e14a558f8ab-3da738ee196mr1606615ab.2.1746562352683;
        Tue, 06 May 2025 13:12:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlR56swiWjxyIPd0BY//7vLXfu+WAj3Tx8jfGlO9u3SFBkhujBWi5NmgFxUf7KdAL57JORjg==
X-Received: by 2002:a05:6e02:1529:b0:3d9:4351:835 with SMTP id e9e14a558f8ab-3da738ee196mr1606505ab.2.1746562352330;
        Tue, 06 May 2025 13:12:32 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88a940fedsm2286920173.66.2025.05.06.13.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 13:12:31 -0700 (PDT)
Date: Tue, 6 May 2025 14:12:29 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: alex.williamson@redhat.com, peterx@redhat.com
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, Adolfo
 <adolfotregosa@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH] vfio/pci: Align huge faults to order
Message-ID: <20250506141229.363a7462.alex.williamson@redhat.com>
In-Reply-To: <20250502224035.3183451-1-alex.williamson@redhat.com>
References: <20250502224035.3183451-1-alex.williamson@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  2 May 2025 16:40:31 -0600
Alex Williamson <alex.williamson@redhat.com> wrote:

> The vfio-pci huge_fault handler doesn't make any attempt to insert a
> mapping containing the faulting address, it only inserts mappings if the
> faulting address and resulting pfn are aligned.  This works in a lot of
> cases, particularly in conjunction with QEMU where DMA mappings linearly
> fault the mmap.  However, there are configurations where we don't get
> that linear faulting and pages are faulted on-demand.
> 
> The scenario reported in the bug below is such a case, where the physical
> address width of the CPU is greater than that of the IOMMU, resulting in a
> VM where guest firmware has mapped device MMIO beyond the address width of
> the IOMMU.  In this configuration, the MMIO is faulted on demand and
> tracing indicates that occasionally the faults generate a VM_FAULT_OOM.
> Given the use case, this results in a "error: kvm run failed Bad address",
> killing the VM.
> 
> The host is not under memory pressure in this test, therefore it's
> suspected that VM_FAULT_OOM is actually the result of a NULL return from
> __pte_offset_map_lock() in the get_locked_pte() path from insert_pfn().
> This suggests a potential race inserting a pte concurrent to a pmd, and
> maybe indicates some deficiency in the mm layer properly handling such a
> case.
> 
> Nevertheless, Peter noted the inconsistency of vfio-pci's huge_fault
> handler where our mapping granularity depends on the alignment of the
> faulting address relative to the order rather than aligning the faulting
> address to the order to more consistently insert huge mappings.  This
> change not only uses the page tables more consistently and efficiently, but
> as any fault to an aligned page results in the same mapping, the race
> condition suspected in the VM_FAULT_OOM is avoided.
> 
> Reported-by: Adolfo <adolfotregosa@gmail.com>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=220057
> Fixes: 09dfc8a5f2ce ("vfio/pci: Fallback huge faults for unaligned pfn")
> Cc: stable@vger.kernel.org
> Tested-by: Adolfo <adolfotregosa@gmail.com>
> Co-developed-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> ---
>  drivers/vfio/pci/vfio_pci_core.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index 35f9046af315..6328c3a05bcd 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -1646,14 +1646,14 @@ static vm_fault_t vfio_pci_mmap_huge_fault(struct vm_fault *vmf,
>  {
>  	struct vm_area_struct *vma = vmf->vma;
>  	struct vfio_pci_core_device *vdev = vma->vm_private_data;
> -	unsigned long pfn, pgoff = vmf->pgoff - vma->vm_pgoff;
> +	unsigned long addr = vmf->address & ~((PAGE_SIZE << order) - 1);
> +	unsigned long pgoff = (addr - vma->vm_start) >> PAGE_SHIFT;
> +	unsigned long pfn = vma_to_pfn(vma) + pgoff;
>  	vm_fault_t ret = VM_FAULT_SIGBUS;
>  
> -	pfn = vma_to_pfn(vma) + pgoff;
> -
> -	if (order && (pfn & ((1 << order) - 1) ||
> -		      vmf->address & ((PAGE_SIZE << order) - 1) ||
> -		      vmf->address + (PAGE_SIZE << order) > vma->vm_end)) {
> +	if (order && (addr < vma->vm_start ||
> +		      addr + (PAGE_SIZE << order) > vma->vm_end ||
> +		      pfn & ((1 << order) - 1))) {
>  		ret = VM_FAULT_FALLBACK;
>  		goto out;
>  	}

Applied to vfio for-linus branch for v6.15.  Added Peter as a Sign-off
to be compatible with the Co-developed tag, in agreement with Peter.
Modified the bz Link: to Closes: for checkpatch.  Thanks,

Alex

