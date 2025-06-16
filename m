Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F8F273D91
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750072876; cv=none; b=XXoM0ONTScDuQHHvL8jt0ajsMWSgN7ENS6cH7p2i4Eanc8f3aET5Z7/lOP6pJ8gsOazRLQYDewTpgHe3Tr0H6ODP1v9PhmU2smnWmJBBfGfGoFqxxmfeA5WGmlNknS06MjRR3gJ1efec0Lc5bdeWwzovhGyNzUvLq3681tpq46A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750072876; c=relaxed/simple;
	bh=qgYShiCICLGlyXPXkMFaa9MBddkYx+zhgvPZouJhpug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DhffgOehiPPbBwYok1YvAi4A2l9p7s+TwzQNtBJIgvTT/JXzAPCD4IArPRtmPu0YTi9K96sVT+hIqXABNmAmf2UZMXFWgRV0H6mY9nhxJKBaInM0YdEM+JEUKM8NqKW1EOi+KwqYHC8yfej2vz7NbEAlF/up3aj2+bqydFB87Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hExHp9/8; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hExHp9/8"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4531e146a24so26928395e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 04:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750072873; x=1750677673; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M4euJ7IL/UtIuqUuTsf6umM3mNJN/f7JKsQPFpax4oo=;
        b=hExHp9/875LeWT6ykEHjyAWx7hjRXx4I/jz3F3zzbyLI4pJjJtjB1N9IS1Os4Bko7t
         ta6y8ucgNyiEv56NAVFlcZWCRO5z4/9NjamcaBdHxqQmnoqUzO9Ag+kAEkog+h+iDgfc
         liMGVLt5zvXH6/GsfvY/T9xcBzNS3yqiRrqMyMGUGEQolnADI216pPY+dVx0WOjWbl/5
         beUc809JabUOTS/Pyaqk44pY14CK0FEjzOEYB0XKI1g0mGaWfftRW6yRLaft0FVx4mvQ
         WfVd8VrldHMB88S5Wdfq+at4z7osBsvH39CANk8uWrbnwrkL9RDEFdzZHvo2RxeW5VJn
         BnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750072873; x=1750677673;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M4euJ7IL/UtIuqUuTsf6umM3mNJN/f7JKsQPFpax4oo=;
        b=ID7wLdnjPyoyRCrXlEPw7RieArd59OW9ZIMgSy27nBOfKzBjoGOP+APvXEsEAafuLK
         ifgtDO/IfD2zP9y8d5dwrs2V8YJmcq5Q4PHTNHss4QV63VzQTSlDonmfEm/uv5xIwURq
         tAdvmgE6kOpWUApK6RpBzrR86BT00rwXXajpYjGJL58ViGE7v2RnIjCDTUYQDHyEswQG
         BPwjiczjurArO6Yk+E/KHN9LvW4Ac5o3zNmThJkFt4hFVlkTyIz7h89hEHcVVyU6Q8ee
         lweSjkG7BHVBVO8FQfi6PkGEsjkrSkW+ddPOwa/jo7UagqGY/SGrT6byyxmA417tlvAA
         dewA==
X-Forwarded-Encrypted: i=1; AJvYcCVd7iV3eYXufUq5sMOLuW0x4mHCcqJ2BNl4TVaq1rAFFXdK0eplcZ7CIi7ZeXWPutc+7c6b8dvJXbnFo/M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH2zGonqY6LVQ996s8QDhssjke5ElH4+q9RjuLEzg5kBzwd+a6
	lTK3eHolBPPAMH7sDYB+00le7AVwPscxOmmIlS7JX1QeYfyRb8qhi4ib71Z0fYRAKBk=
X-Gm-Gg: ASbGncvqrf6qU5N0gDahJML5cwycZ9kX9/WzQXccll90jdUk4sMgrhf08cti9h9Shue
	wApleda4C3sGZhfuvBfb2SpX9mCkogsdK6YkOomb/59x//QE0dl9dQzWiSI3jR2aK7tPdAZUtOJ
	NL9G2Z5Gg/BbayLlDIyPQMeQCakisN59f/2Bf6ibl4HhSALNuVugOiKgkCW4r+WizIfdWzJ3Khi
	CwQ+O9VxvbMeBfSmD5U1Hi3uuu3gniqhJx4QVOdUt8RcmoMlXso/J3uJHLGBa5YW0RDjRm7SYhi
	btg8oTvY5j+n2vtvSDuzZykZszY8FK/hzLXTctDz3hoTMjGCuqHwtoJAN+BsLTGMs40=
X-Google-Smtp-Source: AGHT+IFm7lURtK3nakQke2Eo0A04R9F5ogbYQ5oAvV51pSxGomor7dB0raebWDwLvF03RocQuXgBNA==
X-Received: by 2002:a05:600c:a218:b0:451:edc8:7806 with SMTP id 5b1f17b1804b1-4533e57d98dmr39178155e9.32.1750072872918;
        Mon, 16 Jun 2025 04:21:12 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e254396sm145401575e9.28.2025.06.16.04.21.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 04:21:12 -0700 (PDT)
Message-ID: <7cf90a89-b381-48ae-98bc-1316022e03b6@linaro.org>
Date: Mon, 16 Jun 2025 12:21:11 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-mapping: Stub out dma_{alloc,free,map}_pages() API
To: hch@lst.de
Cc: olteanv@gmail.com, broonie@kernel.org, oe-kbuild-all@lists.linux.dev,
 arnd@arndb.de, larisa.grigore@nxp.com, Frank.li@nxp.com,
 linux-spi@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev
References: <202506160036.t9VDxF6p-lkp@intel.com>
 <20250616111749.316413-1-james.clark@linaro.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250616111749.316413-1-james.clark@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/06/2025 12:17 pm, James Clark wrote:
> The implementations are in mapping.c which requires HAS_DMA so stub them
> out if not present. This is required for some drivers to pass randconfig
> builds.
> 

So the commit message makes it seem like this fixes an existing issue 
and it would need a fixes: tag. But I didn't add one because it seems 
like it would only hit new users like in the linked patchset. It might 
be better to add a tag but it was changed 5 years ago and nobody hit it 
until now so I'm not sure.

> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202506160036.t9VDxF6p-lkp@intel.com/
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>   include/linux/dma-mapping.h | 28 +++++++++++++++++++++-------
>   1 file changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
> index 55c03e5fe8cb..766f28a0e11f 100644
> --- a/include/linux/dma-mapping.h
> +++ b/include/linux/dma-mapping.h
> @@ -161,6 +161,12 @@ void *dma_vmap_noncontiguous(struct device *dev, size_t size,
>   void dma_vunmap_noncontiguous(struct device *dev, void *vaddr);
>   int dma_mmap_noncontiguous(struct device *dev, struct vm_area_struct *vma,
>   		size_t size, struct sg_table *sgt);
> +struct page *dma_alloc_pages(struct device *dev, size_t size,
> +		dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp);
> +void dma_free_pages(struct device *dev, size_t size, struct page *page,
> +		dma_addr_t dma_handle, enum dma_data_direction dir);
> +int dma_mmap_pages(struct device *dev, struct vm_area_struct *vma,
> +		size_t size, struct page *page);
>   #else /* CONFIG_HAS_DMA */
>   static inline dma_addr_t dma_map_page_attrs(struct device *dev,
>   		struct page *page, size_t offset, size_t size,
> @@ -291,6 +297,21 @@ static inline int dma_mmap_noncontiguous(struct device *dev,
>   {
>   	return -EINVAL;
>   }
> +static inline struct page *dma_alloc_pages(struct device *dev, size_t size,
> +		dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp)
> +{
> +	return NULL;
> +}
> +static inline void dma_free_pages(struct device *dev, size_t size,
> +		struct page *page, dma_addr_t dma_handle,
> +		enum dma_data_direction dir)
> +{
> +}
> +static inline int dma_mmap_pages(struct device *dev, struct vm_area_struct *vma,
> +				 size_t size, struct page *page)
> +{
> +	return -EINVAL;
> +}
>   #endif /* CONFIG_HAS_DMA */
>   
>   #ifdef CONFIG_IOMMU_DMA
> @@ -438,13 +459,6 @@ static inline bool dma_need_unmap(struct device *dev)
>   }
>   #endif /* !CONFIG_HAS_DMA || !CONFIG_DMA_NEED_SYNC */
>   
> -struct page *dma_alloc_pages(struct device *dev, size_t size,
> -		dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp);
> -void dma_free_pages(struct device *dev, size_t size, struct page *page,
> -		dma_addr_t dma_handle, enum dma_data_direction dir);
> -int dma_mmap_pages(struct device *dev, struct vm_area_struct *vma,
> -		size_t size, struct page *page);
> -
>   static inline void *dma_alloc_noncoherent(struct device *dev, size_t size,
>   		dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp)
>   {

