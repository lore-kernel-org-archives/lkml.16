Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AFD2EF288
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750258650; cv=none; b=JGtkdw7DcFurk4fYTz77otmewCJUGaeetS306fHntDxkY21R37QJS5dPQCpx4f7AbcKAG6B68larwPAPCyehzSmV0OYIA20PcL59J8t/7bDK3sstqf7MpxVkExWpIi81QWuBqtDAPtNzJDocHdDYX6Hz+IVeTJE4L918x7uQuNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750258650; c=relaxed/simple;
	bh=OPezsAgE4NKsy9v1Mr0Ip+bSrXVKO25UcHNhgGBFSFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iepBTJIU6hwEYVqh9XmYDiVzYWJFzroOgGOmgxvIVcXuLoLe8CiWXK6L5gup4PQ5LBkW3/eolUp1RAr8ByPsVinlkjhwWkaHW5dK5OkSBe09frUguu3Jt54VR4aNbEW4WFyAUeOrvqFwzESkr586K77iWCvZBZSgJVZ8/aFV/qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=nUFvbGz2; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="nUFvbGz2"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7d20451c016so405734285a.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 07:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750258648; x=1750863448; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nWuA5n/7XV52piKpzEtlj4+eRvGXTp7zsvMDV3q1c/g=;
        b=nUFvbGz2PF97qcnM5g2vHhj7mlDOqnkMDXDg/83hzbBTTwrKsZUVrDt25jQxU569lo
         kFy/tls0Bq+Y0hzK4M+0HzHLJQB84P3aVYX2l0uM6skO5c4t/zd74yYdJYFgQB0IoRxg
         PH3nTpmDGQ/BH26lPyqtKz4m96WaLMiJJIB/Kc8hOim1zK1vA517DisQ0cVoQF/GQs6Q
         guW8v2OZ5msk7mezEKqcexOzEKD4l8utNEKkKqJCXvZNZYDoC4kUrhUFElnoX7idONYL
         N1zmpp5UmxGq5B9Me9/HZaLaDW8VBDWLP/cbpLd6gJS/PdFyZ2F0LT1rUiHetNPgFHxx
         1TYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750258648; x=1750863448;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWuA5n/7XV52piKpzEtlj4+eRvGXTp7zsvMDV3q1c/g=;
        b=I6QJtq/RgnfDE3da2Ood9463nwo08oIPwCr/Oj5ON7AstAtWLhBKEMuygaEVttciZ7
         ksx+z3H91UxPs4GOfV99E6vlQHQqsT4Lmqf8v/en6a7YBp0UR+ZUkNJVAQ0aNr1FlLMf
         qFb+/HVdCSHcHBD0c9ea+zOf6/0+znQ/+i40SzzMlMWuoJMNQViDLBG5KCT4wpqVFhNA
         O5hkjmfAh/r0vKg5p4Kqp/KY4VQIiBkNM3WkR0mp7E3iPgQsiQMSYTPLtoQF9PYA095q
         8lJvsK9Dv+yoTDgOZMhZOKWIOvsLoqnKQlomx3Eb4HlktYOzX5cRVodJlpoOk5BVl/8m
         syyQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+LMAQvNXb29snEF62uf3hNhw8TPm9fOzmn2nyIhFkiTKKMYloqGC27P23d/A1qn38XZdm4akpRNbO1dc=@vger.kernel.org
X-Gm-Message-State: AOJu0YywQbO08F5uqMegYA9AXyALeCZTLTetX3B4n0g6u4QfculduZda
	2qmON7j5cFBT13N+ggqvDuHx+Hx/KWwfDLyoe8IRWezt6HhcZF1cQ8b2Q/DV/tRMbtA=
X-Gm-Gg: ASbGncsmr0gDgc/3erDZNuUKB0yg/yuB1WZlmqLuJjPZWbhvBz8mboI1Jqs7of3+l/F
	d6PiPoVuri9CDbdOdL8o25Dho9eFuvADPlrrjcaUa8Cdo/AEwy7kHz+CUowyyQfAZcsEp2qUTDu
	aiOEIsdTQL7S57NlYGxlWh5tyYc0ZgfZdviS4Eg0smCgnHbkStMcsoQaMxPuakN6JfXdZbjN3ZO
	kfDrgL0GtROi1BF3czz0bBAVEIy5toc+Izp6q9pjD8lg4Rm4LXrZQCgHdLGn+VqzBpKnbWxSHon
	cLP1tKYa71lJIzeBqI2eySjk+nxgNexMVRGR4MOnCVWOQswuWQFZyMAFU9VxOvZGLycyRoHPSoj
	1PZACR1IyqBdFMnYxHd8wR2KvpXPQyR8JFW+9og==
X-Google-Smtp-Source: AGHT+IEqAm8w07CYn9jssi0u9N9oTKmQEBd4zXaVvYiKXP4kVC2Pg2ZszP/NIklhkByTPLh6hrPUVw==
X-Received: by 2002:a05:620a:2720:b0:7d3:8fd2:c0cd with SMTP id af79cd13be357-7d3c6d0c5e6mr2844239185a.56.1750258645240;
        Wed, 18 Jun 2025 07:57:25 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8edf51fsm771719285a.93.2025.06.18.07.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 07:57:24 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uRuE7-00000006osS-460H;
	Wed, 18 Jun 2025 11:57:23 -0300
Date: Wed, 18 Jun 2025 11:57:23 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 3/5] iommu: Add verisilicon IOMMU driver
Message-ID: <20250618145723.GR1376515@ziepe.ca>
References: <20250618140923.97693-1-benjamin.gaignard@collabora.com>
 <20250618140923.97693-4-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618140923.97693-4-benjamin.gaignard@collabora.com>

On Wed, Jun 18, 2025 at 04:09:12PM +0200, Benjamin Gaignard wrote:
> +config VSI_IOMMU
> +	bool "Verisilicon IOMMU Support"
> +	depends on ARM64
> +	select IOMMU_API
> +	select ARM_DMA_USE_IOMMU

ARM_DMA_USE_IOMMU is only used by ARM32, you don't need it if you
depends on ARM64

> +static void vsi_iommu_release_device(struct device *dev)
> +{
> +	struct vsi_iommu *iommu = dev_iommu_priv_get(dev);
> +
> +	device_link_remove(dev, iommu->dev);
> +}

This does not seem right, release is supposed to reprogram the HW to
stop walking any page table.

You should implement a static blocked (or identity?) domain that idles
the hardware and use that as the blocked and release_domain in the
ops.

The logic around vsi_iommu_detach_device() and
vsi_iommu_attach_device() is also not quite right. The attach can
happen while iommu->domain is already set and doesn't deal with
removing the iommu from the old domain's list.

I would probably change vsi_iommu_enable() into vsi_iommu_set_paging()
and then presumably vsi_iommu_disable() is vsi_iommu_set_blocking() ?

vsi_iommu_detach_device() should be deleted and integrated into the
blocked domain and attach error unwind.

> +static int vsi_iommu_of_xlate(struct device *dev,
> +			      const struct of_phandle_args *args)
> +{
> +	struct platform_device *iommu_dev;
> +
> +	if (!dev_iommu_priv_get(dev)) {
> +		iommu_dev = of_find_device_by_node(args->np);
> +		if (WARN_ON(!iommu_dev))
> +			return -EINVAL;
> +
> +		dev_iommu_priv_set(dev, platform_get_drvdata(iommu_dev));
> +	}

The driver should ideally not be calling dev_iommu_priv_set/get here,
and this leads the reference doesn't it? Do what ARM did to locate
the iommu_dev.

I would also add a comment here:

> +static int vsi_iommu_map(struct iommu_domain *domain, unsigned long _iova,
> +                        phys_addr_t paddr, size_t size, size_t count,
> +                        int prot, gfp_t gfp, size_t *mapped)
> +{
> +       struct vsi_iommu_domain *vsi_domain = to_vsi_domain(domain);
> +       unsigned long flags;
> +       dma_addr_t pte_dma, iova = (dma_addr_t)_iova;
> +       u32 *page_table, *pte_addr;
> +       u32 dte, pte_index;
> +       int ret;

/*
 * IOMMU drivers are not supposed to lock the page table, however this
 * driver does not safely handle the cache flushing or table
 * installation across concurrent threads so locking is used as a simple
 * solution.
 */

> +       spin_lock_irqsave(&vsi_domain->dt_lock, flags);

Jason
