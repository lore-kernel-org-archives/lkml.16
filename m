Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E94C2E11AE
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 18:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749838190; cv=none; b=md3n5G9Io0ezHsxAxb8Phc1kwsgdJZ8leoHYM6eEXe4gPqQ2tuiPvf8cAL6ZX/v6Z6OIrsIpLnUyUO9Z8srPR77m36RO2Uq2uuwbMdC0JFIx8i7cgZU8D2AZnhvzicIrHsG7xS2SvBaLTIxKTrbBpOeYZLTu6i7ATo8htbenhc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749838190; c=relaxed/simple;
	bh=/bZSIVVZJykaqbguGPxnLpZYxAUiql/y/pGMGcs8kQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tm5+mpI24m6VC1xa6Q1r8FzuFeSjM5GslaY6cmdR6Y+UpdnvdTx0JlVLa4CazQ/d5UwA4UyqPmNR4NdCT/6b7vD7IJQBBJWrg0PLdCOd/DCEsW83z23IPLV3JgIvUpQVtPIoTyBQNTxA6fPyX8mQ8hwdMbmw0br3rkEG9PiXIKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DaG7HVkK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DaG7HVkK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749838187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xXcFgixY4ZARJd9iDzBe662fiHU31V0lsCiirwehN0A=;
	b=DaG7HVkKs1W6k6ZuCB+fEChkmhZQoJBHfanfEDYNpX6+sibjVtFdKaxlIVL5l0IPXfjKiq
	inP3XnEpKVmTPpUbX/TsGW7sM90xzoIlzE5ntiwETd+ktbh6q4qvBVUtB3OXctY4RbpVbw
	MYI1+xRjoeX5EK4w/w/kRu8ZiE0KSPY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-216-CZtKDC76OF2nNQVoGXi7Xw-1; Fri, 13 Jun 2025 14:09:45 -0400
X-MC-Unique: CZtKDC76OF2nNQVoGXi7Xw-1
X-Mimecast-MFC-AGG-ID: CZtKDC76OF2nNQVoGXi7Xw_1749838185
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a5232c6ae8so1110921f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 11:09:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749838184; x=1750442984;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xXcFgixY4ZARJd9iDzBe662fiHU31V0lsCiirwehN0A=;
        b=pb6IR9YYVar+yb6Z9FXctm5EAo27+HqU/TuH0Hq6Fiioyt+JlgMtHAHZi+FdvWfkAP
         OyTljVgim4EcvozPbSIvdaxcL+sdKnA7CJrblA+1ej4MYHZSiPlEUDYxCa4nXGgUyNKm
         ZQBnNfrddW307GS9XISpnrGRBitNmCIWdT/VmI8N5ykzUTRZNjxJdTBGa4zMAG1jdlIZ
         4Uu1O+5k5fyvhX7DuFOCXAsUfNwRUnh679i+CayjuexFZyxJ6UscMx+OWAZgU6JQxNPO
         wQCx9JaaoClcVX0gnH7TWI6/xS/dLS3ysHYQcyialTky55rXG/H/J6zVwOXm8mpMGNJe
         PuwA==
X-Forwarded-Encrypted: i=1; AJvYcCVO8tlFFx+uZ8xiaNzKX4EklJG1nu41vLETZRF6gwpYzZD6B543Ayz3jlsTPfey+C/Yrse1M2ZtTcQJA3E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx07qhJyj7OPG2fNONJkCe3mCV6TNL6rX76ArFAiqXL97zlFnl5
	N3SiekppBj3S+h2k0nR9qCkGjNEEduQGpisRIpoyPo9xn/bldTYFAoHAK6wIBp2RklmsW196yPY
	+KoFwbo810HG5yt3nK04TqXMOFE5VtbQqiVnFGtQEMn91GU5VCL/y/xLYXJTKcmqLhw==
X-Gm-Gg: ASbGncsYOPqmKlkepfBueoyc90CjUBBvmdoUAft6YzBxCs+bzcuRRV5+yujXZnPAIW8
	uMSvsTb/PxzpJRN2/miGVQgCHpeUEygxHDGiBUY57O3Yr/J0ntVaUWtIzQkOXWdVHeyFd1+COxG
	8p6ZdOsHbMR3UY+Mzyf9MGvY+M42HYDf1CY0W0CT7Pn9Dhl642VLTDm+7WSw4iyX8pgx3k7Wk6N
	ciBhOcxs3H+Rg5mlwN6hdv72By6GfwyEGowK5UHEsjrag2iIzOKbmuy/ybEdFXijEpRABLmVZ5A
	hOFH0IteZ4axd0FxRv2yNFi3RF9i2UIsCJZtksTSjHM/jWeXxtV131/OxY+46bVm1Oe4hRC2GFG
	9K33sBsQ3qDhoD8MkB6FnPtw7+CX8l8pKmByXnm4JtxXEu8rufg==
X-Received: by 2002:a05:6000:2486:b0:3a4:ef30:a4c8 with SMTP id ffacd0b85a97d-3a572399103mr813372f8f.10.1749838184495;
        Fri, 13 Jun 2025 11:09:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzERlz95am9fonq/srpc4ADnlYUlo09Tj6R4QtVRm3hJDLhOgIqByYURXlt/BU6Q/uO4KIjw==
X-Received: by 2002:a05:6000:2486:b0:3a4:ef30:a4c8 with SMTP id ffacd0b85a97d-3a572399103mr813343f8f.10.1749838184028;
        Fri, 13 Jun 2025 11:09:44 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1a:3700:2982:b5f7:a04e:4cb4? (p200300d82f1a37002982b5f7a04e4cb4.dip0.t-ipconnect.de. [2003:d8:2f1a:3700:2982:b5f7:a04e:4cb4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e256b95sm60924015e9.30.2025.06.13.11.09.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 11:09:43 -0700 (PDT)
Message-ID: <d6fbee39-a38f-4f94-bffb-938f7be73681@redhat.com>
Date: Fri, 13 Jun 2025 20:09:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] vfio-pci: Best-effort huge pfnmaps with !MAP_FIXED
 mappings
To: Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, kvm@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Alex Williamson <alex.williamson@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro <amastro@fb.com>,
 Nico Pache <npache@redhat.com>
References: <20250613134111.469884-1-peterx@redhat.com>
 <20250613134111.469884-6-peterx@redhat.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250613134111.469884-6-peterx@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13.06.25 15:41, Peter Xu wrote:
> This patch enables best-effort mmap() for vfio-pci bars even without
> MAP_FIXED, so as to utilize huge pfnmaps as much as possible.  It should
> also avoid userspace changes (switching to MAP_FIXED with pre-aligned VA
> addresses) to start enabling huge pfnmaps on VFIO bars.
> 
> Here the trick is making sure the MMIO PFNs will be aligned with the VAs
> allocated from mmap() when !MAP_FIXED, so that whatever returned from
> mmap(!MAP_FIXED) of vfio-pci MMIO regions will be automatically suitable
> for huge pfnmaps as much as possible.
> 
> To achieve that, a custom vfio_device's get_unmapped_area() for vfio-pci
> devices is needed.
> 
> Note that MMIO physical addresses should normally be guaranteed to be
> always bar-size aligned, hence the bar offset can logically be directly
> used to do the calculation.  However to make it strict and clear (rather
> than relying on spec details), we still try to fetch the bar's physical
> addresses from pci_dev.resource[].
> 
> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>

There is likely a

Co-developed-by: Alex Williamson <alex.williamson@redhat.com>

missing?

> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>   drivers/vfio/pci/vfio_pci.c      |  3 ++
>   drivers/vfio/pci/vfio_pci_core.c | 65 ++++++++++++++++++++++++++++++++
>   include/linux/vfio_pci_core.h    |  6 +++
>   3 files changed, 74 insertions(+)
> 
> diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
> index 5ba39f7623bb..d9ae6cdbea28 100644
> --- a/drivers/vfio/pci/vfio_pci.c
> +++ b/drivers/vfio/pci/vfio_pci.c
> @@ -144,6 +144,9 @@ static const struct vfio_device_ops vfio_pci_ops = {
>   	.detach_ioas	= vfio_iommufd_physical_detach_ioas,
>   	.pasid_attach_ioas	= vfio_iommufd_physical_pasid_attach_ioas,
>   	.pasid_detach_ioas	= vfio_iommufd_physical_pasid_detach_ioas,
> +#ifdef CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP
> +	.get_unmapped_area	= vfio_pci_core_get_unmapped_area,
> +#endif
>   };
>   
>   static int vfio_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index 6328c3a05bcd..835bc168f8b7 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -1641,6 +1641,71 @@ static unsigned long vma_to_pfn(struct vm_area_struct *vma)
>   	return (pci_resource_start(vdev->pdev, index) >> PAGE_SHIFT) + pgoff;
>   }
>   
> +#ifdef CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP
> +/*
> + * Hint function to provide mmap() virtual address candidate so as to be
> + * able to map huge pfnmaps as much as possible.  It is done by aligning
> + * the VA to the PFN to be mapped in the specific bar.
> + *
> + * Note that this function does the minimum check on mmap() parameters to
> + * make the PFN calculation valid only. The majority of mmap() sanity check
> + * will be done later in mmap().
> + */
> +unsigned long vfio_pci_core_get_unmapped_area(struct vfio_device *device,
> +					      struct file *file,
> +					      unsigned long addr,
> +					      unsigned long len,
> +					      unsigned long pgoff,
> +					      unsigned long flags)

A very suboptimal way to indent this many parameters; just use two tabs 
at the beginning.

> +{
> +	struct vfio_pci_core_device *vdev =
> +		container_of(device, struct vfio_pci_core_device, vdev);
> +	struct pci_dev *pdev = vdev->pdev;
> +	unsigned long ret, phys_len, req_start, phys_addr;
> +	unsigned int index;
> +
> +	index = pgoff >> (VFIO_PCI_OFFSET_SHIFT - PAGE_SHIFT);

Could do

unsigned int index =  pgoff >> (VFIO_PCI_OFFSET_SHIFT - PAGE_SHIFT);

at the very top.

> +
> +	/* Currently, only bars 0-5 supports huge pfnmap */
> +	if (index >= VFIO_PCI_ROM_REGION_INDEX)
> +		goto fallback;
> +
> +	/* Bar offset */
> +	req_start = (pgoff << PAGE_SHIFT) & ((1UL << VFIO_PCI_OFFSET_SHIFT) - 1);
> +	phys_len = PAGE_ALIGN(pci_resource_len(pdev, index));
> +
> +	/*
> +	 * Make sure we at least can get a valid physical address to do the
> +	 * math.  If this happens, it will probably fail mmap() later..
> +	 */
> +	if (req_start >= phys_len)
> +		goto fallback;
> +
> +	phys_len = MIN(phys_len, len);
> +	/* Calculate the start of physical address to be mapped */
> +	phys_addr = pci_resource_start(pdev, index) + req_start;
> +
> +	/* Choose the alignment */
> +	if (IS_ENABLED(CONFIG_ARCH_SUPPORTS_PUD_PFNMAP) && phys_len >= PUD_SIZE) {
> +		ret = mm_get_unmapped_area_aligned(file, addr, len, phys_addr,
> +						   flags, PUD_SIZE, 0);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (phys_len >= PMD_SIZE) {
> +		ret = mm_get_unmapped_area_aligned(file, addr, len, phys_addr,
> +						   flags, PMD_SIZE, 0);
> +		if (ret)
> +			return ret;

Similar to Jason, I wonder if that logic should reside in the core, and 
we only indicate the maximum page table level we support.

			   unsigned int order)
>   {
> diff --git a/include/linux/vfio_pci_core.h b/include/linux/vfio_pci_core.h
> index fbb472dd99b3..e59699e01901 100644
> --- a/include/linux/vfio_pci_core.h
> +++ b/include/linux/vfio_pci_core.h
> @@ -119,6 +119,12 @@ ssize_t vfio_pci_core_read(struct vfio_device *core_vdev, char __user *buf,
>   		size_t count, loff_t *ppos);
>   ssize_t vfio_pci_core_write(struct vfio_device *core_vdev, const char __user *buf,
>   		size_t count, loff_t *ppos);
> +unsigned long vfio_pci_core_get_unmapped_area(struct vfio_device *device,
> +					      struct file *file,
> +					      unsigned long addr,
> +					      unsigned long len,
> +					      unsigned long pgoff,
> +					      unsigned long flags);

Dito.

-- 
Cheers,

David / dhildenb

