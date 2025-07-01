Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EA025D1E6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 07:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751356212; cv=none; b=bYVMZoAFxIcrw+eV+WbiavWsw6dTAfeQCF18hHl+Y+IQujp9uqIDZyG2Vg0qJIEiUrcsHgkkJcDFbBswWh/86Qe5JtYFWyKg3ShzJetUIWAKRQOTELyadpGRyJ7oY41877UtGJ50MDXhvngYDCcKAMXwYbuDfmKd+eT7c2TIQzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751356212; c=relaxed/simple;
	bh=40HJ61IlZ4oeOAOWTEBZB/uoEVqaZ3mQ7wDobABmmsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dkEiMTdQV/C28kg8jbqAVqi23wWwZFaiP1A/6Y3enlC4+5UeUfCyDutsoxHeVJ5JZju5fovUF08B/omWcF8rCG9wH27fbT9uJmKlI9ngP+xaAHM6jhD3QPL+I48IDK2myGw8MF9gB5G+TjkffH7I1Ksy8nFUQHN5qcI2OYQapSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NqPdv6ci; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NqPdv6ci"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751356208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UrfeDL2USMWBF7Hfk0LG3gqMbltvMY7Jsuk0qzV7YpU=;
	b=NqPdv6ciNUh3s2l4whvTx5eL0w7IGpzMjy9EYWDIhjvJCMJhwhY5DNLHukip5n0ip8v7jb
	H4OHu3+9Yzt2MwxTl1B2MN8WET+/zY1E9zDec429lf+Rcwsh6x7ThsHMSwkm2RHE38mfLq
	rDg0XKyLRkCdpvUF5rj6HSmBnBMjJRM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-Sv-BbXjcNi-MkhkGT0XlBQ-1; Tue, 01 Jul 2025 03:50:07 -0400
X-MC-Unique: Sv-BbXjcNi-MkhkGT0XlBQ-1
X-Mimecast-MFC-AGG-ID: Sv-BbXjcNi-MkhkGT0XlBQ_1751356206
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-453018b4ddeso30344425e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 00:50:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751356206; x=1751961006;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UrfeDL2USMWBF7Hfk0LG3gqMbltvMY7Jsuk0qzV7YpU=;
        b=VE3v0DgOEjIogQ6xHFBtmI2a7yX5zFZT/wT/fqdrjxwLzrtGtca7S+lE5FLcZe3MTB
         GPi2uk0kXHCn0tZPqNIfdMSW/QXLn4c2lzSeSNVe5jm9Ec5aSbFWJa6tNbf08sk+6BKs
         t+oDA2fmloQO/4k+GT2FfNl6IpclpCANYY6H6Sj1EATBlzucxcGpokgFCqoresW5k5/S
         TxHLhfnaiYH1hb8/uB+bx5rWEfhrF+zws6ALqUtoVtnaTGzQ0AH0XLn0dyfvL+/adw09
         N7ijmIP1ceOvhAtn8EpMlTg7drDNJsylE374R23+27XJX0dk+wUPNB7ggsQUTYxDddpP
         Tw4Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5ipNM2qOUzpJMbvJj3c0bub0YOiWgR2njYpyF87WU6TFLXDGLVDoIQsZ3GDTFDZheRwCsXeL/CQfgRuo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9Bmt44tazPVjc2/oo0irGbYWVuzMXHzbi0NnO9TULyz1ep73Q
	/SPNrL3+FzkjWWCAI1DrRsfNq5uMOcfWxbi5cEaxwdk7LoT/woUBiDb0EtF9BRBZSY9RpGob/HS
	59to4SJweTgGoll4Dw5sGRDGB+OTQ4ukcuWZj8riNKCWib7m7r573hMLyc/HUJRmmQw==
X-Gm-Gg: ASbGncsHrKkIZ5OdKhWtiSLuYkWEeFxrXd6KvTwuqiv1apzU/slIDGlEhn0XUntgE+6
	roIny+/MPuErhg1orNl9QAeE0rrPMAOkjkwuSCrw0mz93cvhKmSDTI/uWXPGFf6RQLiAmuotB9E
	NZyW+/CLfNLvUfkeq1cd9wplKZOFguREykcU8ySBxhTXYBqeF3/2+6hso/46FTrbGGhOoFUKSLA
	OwccU08Ccb2tcieGDsyLIa+7nBCUXygX1f/oesxFRzkSO67vC0bFZApZLY1XX9RUanNE6t0joA/
	WR6V3EgytRmtany6
X-Received: by 2002:a05:600c:1e0d:b0:43c:e478:889 with SMTP id 5b1f17b1804b1-4538edeb1e3mr186231995e9.0.1751356205992;
        Tue, 01 Jul 2025 00:50:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNEap5hfehObObyasCyQhPEbo2n4At1g+WsLQ4hkN8qo9UeYJIf1N5Pojy/Kj0YHenVGSRhg==
X-Received: by 2002:a05:600c:1e0d:b0:43c:e478:889 with SMTP id 5b1f17b1804b1-4538edeb1e3mr186231595e9.0.1751356205538;
        Tue, 01 Jul 2025 00:50:05 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152e:1400:856d:9957:3ec3:1ddc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538234be76sm187329465e9.15.2025.07.01.00.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 00:50:05 -0700 (PDT)
Date: Tue, 1 Jul 2025 03:50:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: xuanzhuo@linux.alibaba.com, eperezma@redhat.com,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
	hch@infradead.org, xieyongji@bytedance.com
Subject: Re: [PATCH 9/9] vduse: switch to use virtio map API instead of DMA
 API
Message-ID: <20250701034754-mutt-send-email-mst@kernel.org>
References: <20250701011401.74851-1-jasowang@redhat.com>
 <20250701011401.74851-10-jasowang@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701011401.74851-10-jasowang@redhat.com>

On Tue, Jul 01, 2025 at 09:14:01AM +0800, Jason Wang wrote:
> Lacking the support of device specific mapping supported in virtio,
> VDUSE must trick the DMA API in order to make virtio-vdpa transport
> work. This is done by advertising vDPA device as dma device with a
> VDUSE specific dma_ops even if it doesn't do DMA at all.
> 
> This will be fixed by this patch. Thanks to the new mapping operations
> support by virtio and vDPA. VDUSE can simply switch to advertise its
> specific mappings operations to virtio via virtio-vdpa then DMA API is
> not needed for VDUSE any more.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>

so what exactly is the issue fixed by all this pile of code?
I just don't really see it. yes the existing thing is a hack
but at least it is isolated within vduse which let's be
frank is not it's only issue.


> ---
>  drivers/vdpa/vdpa_user/iova_domain.c |  2 +-
>  drivers/vdpa/vdpa_user/iova_domain.h |  2 +-
>  drivers/vdpa/vdpa_user/vduse_dev.c   | 31 ++++++++++++++++------------
>  3 files changed, 20 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/vdpa/vdpa_user/iova_domain.c b/drivers/vdpa/vdpa_user/iova_domain.c
> index 019f3305c0ac..8ea311692545 100644
> --- a/drivers/vdpa/vdpa_user/iova_domain.c
> +++ b/drivers/vdpa/vdpa_user/iova_domain.c
> @@ -447,7 +447,7 @@ void vduse_domain_unmap_page(struct vduse_iova_domain *domain,
>  
>  void *vduse_domain_alloc_coherent(struct vduse_iova_domain *domain,
>  				  size_t size, dma_addr_t *dma_addr,
> -				  gfp_t flag, unsigned long attrs)
> +				  gfp_t flag)
>  {
>  	struct iova_domain *iovad = &domain->consistent_iovad;
>  	unsigned long limit = domain->iova_limit;
> diff --git a/drivers/vdpa/vdpa_user/iova_domain.h b/drivers/vdpa/vdpa_user/iova_domain.h
> index 846572b95c23..a2316571671f 100644
> --- a/drivers/vdpa/vdpa_user/iova_domain.h
> +++ b/drivers/vdpa/vdpa_user/iova_domain.h
> @@ -64,7 +64,7 @@ void vduse_domain_unmap_page(struct vduse_iova_domain *domain,
>  
>  void *vduse_domain_alloc_coherent(struct vduse_iova_domain *domain,
>  				  size_t size, dma_addr_t *dma_addr,
> -				  gfp_t flag, unsigned long attrs);
> +				  gfp_t flag);
>  
>  void vduse_domain_free_coherent(struct vduse_iova_domain *domain, size_t size,
>  				void *vaddr, dma_addr_t dma_addr,
> diff --git a/drivers/vdpa/vdpa_user/vduse_dev.c b/drivers/vdpa/vdpa_user/vduse_dev.c
> index 64bc39722007..f86d7111e103 100644
> --- a/drivers/vdpa/vdpa_user/vduse_dev.c
> +++ b/drivers/vdpa/vdpa_user/vduse_dev.c
> @@ -814,51 +814,55 @@ static const struct vdpa_config_ops vduse_vdpa_config_ops = {
>  	.free			= vduse_vdpa_free,
>  };
>  
> -static void vduse_dev_sync_single_for_device(struct device *dev,
> +static void vduse_dev_sync_single_for_device(void *token,
>  					     dma_addr_t dma_addr, size_t size,
>  					     enum dma_data_direction dir)
>  {
> +	struct device *dev = token;
>  	struct vduse_dev *vdev = dev_to_vduse(dev);
>  	struct vduse_iova_domain *domain = vdev->domain;
>  
>  	vduse_domain_sync_single_for_device(domain, dma_addr, size, dir);
>  }
>  
> -static void vduse_dev_sync_single_for_cpu(struct device *dev,
> +static void vduse_dev_sync_single_for_cpu(void *token,
>  					     dma_addr_t dma_addr, size_t size,
>  					     enum dma_data_direction dir)
>  {
> +	struct device *dev = token;
>  	struct vduse_dev *vdev = dev_to_vduse(dev);
>  	struct vduse_iova_domain *domain = vdev->domain;
>  
>  	vduse_domain_sync_single_for_cpu(domain, dma_addr, size, dir);
>  }
>  
> -static dma_addr_t vduse_dev_map_page(struct device *dev, struct page *page,
> +static dma_addr_t vduse_dev_map_page(void *token, struct page *page,
>  				     unsigned long offset, size_t size,
>  				     enum dma_data_direction dir,
>  				     unsigned long attrs)
>  {
> +	struct device *dev = token;
>  	struct vduse_dev *vdev = dev_to_vduse(dev);
>  	struct vduse_iova_domain *domain = vdev->domain;
>  
>  	return vduse_domain_map_page(domain, page, offset, size, dir, attrs);
>  }
>  
> -static void vduse_dev_unmap_page(struct device *dev, dma_addr_t dma_addr,
> +static void vduse_dev_unmap_page(void *token, dma_addr_t dma_addr,
>  				size_t size, enum dma_data_direction dir,
>  				unsigned long attrs)
>  {
> +	struct device *dev = token;
>  	struct vduse_dev *vdev = dev_to_vduse(dev);
>  	struct vduse_iova_domain *domain = vdev->domain;
>  
>  	return vduse_domain_unmap_page(domain, dma_addr, size, dir, attrs);
>  }
>  
> -static void *vduse_dev_alloc_coherent(struct device *dev, size_t size,
> -					dma_addr_t *dma_addr, gfp_t flag,
> -					unsigned long attrs)
> +static void *vduse_dev_alloc_coherent(void *token, size_t size,
> +				      dma_addr_t *dma_addr, gfp_t flag)
>  {
> +	struct device *dev = token;
>  	struct vduse_dev *vdev = dev_to_vduse(dev);
>  	struct vduse_iova_domain *domain = vdev->domain;
>  	unsigned long iova;
> @@ -866,7 +870,7 @@ static void *vduse_dev_alloc_coherent(struct device *dev, size_t size,
>  
>  	*dma_addr = DMA_MAPPING_ERROR;
>  	addr = vduse_domain_alloc_coherent(domain, size,
> -				(dma_addr_t *)&iova, flag, attrs);
> +					   (dma_addr_t *)&iova, flag);
>  	if (!addr)
>  		return NULL;
>  
> @@ -875,25 +879,27 @@ static void *vduse_dev_alloc_coherent(struct device *dev, size_t size,
>  	return addr;
>  }
>  
> -static void vduse_dev_free_coherent(struct device *dev, size_t size,
> +static void vduse_dev_free_coherent(void *token, size_t size,
>  					void *vaddr, dma_addr_t dma_addr,
>  					unsigned long attrs)
>  {
> +	struct device *dev = token;
>  	struct vduse_dev *vdev = dev_to_vduse(dev);
>  	struct vduse_iova_domain *domain = vdev->domain;
>  
>  	vduse_domain_free_coherent(domain, size, vaddr, dma_addr, attrs);
>  }
>  
> -static size_t vduse_dev_max_mapping_size(struct device *dev)
> +static size_t vduse_dev_max_mapping_size(void *token)
>  {
> +	struct device *dev = token;
>  	struct vduse_dev *vdev = dev_to_vduse(dev);
>  	struct vduse_iova_domain *domain = vdev->domain;
>  
>  	return domain->bounce_size;
>  }
>  
> -static const struct dma_map_ops vduse_dev_dma_ops = {
> +static const struct virtio_map_ops vduse_map_ops = {
>  	.sync_single_for_device = vduse_dev_sync_single_for_device,
>  	.sync_single_for_cpu = vduse_dev_sync_single_for_cpu,
>  	.map_page = vduse_dev_map_page,
> @@ -2009,7 +2015,7 @@ static int vduse_dev_init_vdpa(struct vduse_dev *dev, const char *name)
>  		return -EEXIST;
>  
>  	vdev = vdpa_alloc_device(struct vduse_vdpa, vdpa, dev->dev,
> -				 &vduse_vdpa_config_ops, NULL,
> +				 &vduse_vdpa_config_ops, &vduse_map_ops,
>  				 1, 1, name, true);
>  	if (IS_ERR(vdev))
>  		return PTR_ERR(vdev);
> @@ -2022,7 +2028,6 @@ static int vduse_dev_init_vdpa(struct vduse_dev *dev, const char *name)
>  		put_device(&vdev->vdpa.dev);
>  		return ret;
>  	}
> -	set_dma_ops(&vdev->vdpa.dev, &vduse_dev_dma_ops);
>  	vdev->vdpa.map_token = &vdev->vdpa.dev;
>  	vdev->vdpa.mdev = &vduse_mgmt->mgmt_dev;
>  
> -- 
> 2.34.1

