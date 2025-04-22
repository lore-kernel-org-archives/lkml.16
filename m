Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FB138382
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 19:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745348965; cv=none; b=XdPGPPj2BPpeI7cRaiTB1ma2k5LRWXdh6kyZB3NdV6Carl/w/2ItCJcJAq4+rymKWGaw0gsxsP8+EfMNrfTm1OeW4ml/DO5gdD/iLT1fCpf6Fx7/k5vCjGw96hQaQQjmt0le+pONNq1btIRYaytT/KZdNwQQHp7G9TeBxEompWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745348965; c=relaxed/simple;
	bh=Dm1Bdw5Cwxm1RgWBTZQDppgB/DUjE2ED8xVVUD6VHrY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lzhpz1q6UJtuJ2eOeT6jFdeeVlOEPNrPUeky1y1NefK8P+nngfb1VYfqTZo08sOyVUg6OWDptgkGHyiOoDd7WBCGjVE1Ryo3FEFgtlGjZpYGP5mx+ZFnOidQuaKk1IKf625s6dvMvvFSGHxYLO2m4Bdfj6O1TK6AMngsI8KdrBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=WCJqeLY5; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="WCJqeLY5"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c08fc20194so295559985a.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 12:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1745348962; x=1745953762; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l5KwgOa0BGBtglnb/EmAwT1KJYw0ByggohSX6F5Qhzg=;
        b=WCJqeLY54OVrPxFH9yk7COLotD58PWkioBry61iT6qmlbAgVLds+HVgipS+TiK2b/H
         a2fWzuU86Qivtz+bHv2vghD06W/o9z5h0C6u+l7Fu2QWruyHCi/t1xuijRH62gA6XVNV
         4F5oSeYjudVIZkBdloC6nh2qHeDy8LtT1AESRYZs+O68L1kSlir6yQ9106KzzRkSzeKZ
         N6ykaxWtcCbLcMibYuh0ijrpnwV0dz/m2L00hbAEkXzk+wRrBDx6E33j2oP/wjpI/oWX
         hP4EBnTHPhlDLutcT2LZOC1pmzC5xEZhj5HFaC0iYnN1OuKZ3xDdyfMFy+UjN3e/CkHu
         alMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745348962; x=1745953762;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5KwgOa0BGBtglnb/EmAwT1KJYw0ByggohSX6F5Qhzg=;
        b=cjOADs49HSRJG++BCv5ruGpvGTL1DARPKA2C79LE07hJuLsIjcVc6T1ZtHcEBXt/dJ
         86lBJn+M5QW9amfezmHISqcojC1tmfp+CWX28HpruHX1W3ey3eT5ngFzTjAV1R6QZ3RZ
         KNaI/IOzVFuO6dUTR9zOEfV6G+3RArSyz0uF6FsPT0GSKoHeEOT/ymlK6HNk+v8FnPvQ
         iG+ZV4PKpkIA1nwwO+CfeeGfiy7M5M31AJYVM39304KZL41Bx14oIheIN5dWjAmGMmi3
         SvcdzNW5eXelh9f5nKOaheAXZxu2VX4NXdzA2SqxInWOimhcpCtpfGQ6w2E/TL8v5YKd
         EOcg==
X-Forwarded-Encrypted: i=1; AJvYcCUM8GDNRgwLzK2eGdIlaVxaWleO9Wu1D+zrTWS2QBMd9OxVkuVYu6eXu5AXYGZQRMoBDcCFquc7/mSS6hA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4+PeHGKSsePTGBQNfQWYuoBZ6ihvGSPuR0H6pilfLCQowkW62
	LrrcNxc4pg3etZIlqVtC4CemhaQfBKgs6VfxgPkk1j+EQO6uwWhUhcDiDNITD/KwQDsVNwRWk4S
	V
X-Gm-Gg: ASbGnctII/inEQ0PxZkf3DTNaPM/nekaCrluTSGhdiY815BiYAKTDwxT7JzhzoDAR1l
	sral8WSW/m04NgZ85DEXCcCMNTcixK/fYcyCG0NOwsphnL3UFey6u8NwM7U7TfQnVVHAeUw4rZf
	bGcdN+dDPcrI7QL88DO7tiHw6GZx2EneV4fcRwdKb7t2s4TwsTh9mQ4l2qC80neWKcIm/iZgnc9
	stIWoXo1lIghkY2X+k47i1MZRk+F1h1C/t0oT/RqIM2E5/gIAVCpYYpqbsXSgsGCXdgrefvcEYO
	kTxMXly6Mx7Kh71OSr80Ch8TgFLoFkD0gR2aloIYRBQH81LBFDVnZQL9w83j5vrv32FjzmfoAWl
	m6R03bbjWYl2OGwFIhkU=
X-Google-Smtp-Source: AGHT+IFhAGFfyv8bohe/pDvVL8xD9tiUQcnS5dS4QxAQwB4x0kumkU1YhBjNi9x7Uz+SvdcDBwQGFA==
X-Received: by 2002:a05:620a:4627:b0:7c5:4a3a:bc12 with SMTP id af79cd13be357-7c927fa8740mr3038817285a.32.1745348962481;
        Tue, 22 Apr 2025 12:09:22 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925b4e01dsm592265185a.75.2025.04.22.12.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 12:09:22 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u7Izh-00000006vaw-26Wh;
	Tue, 22 Apr 2025 16:09:21 -0300
Date: Tue, 22 Apr 2025 16:09:21 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] fsl_pamu: Use 40-bits for addressing where appropriate
Message-ID: <20250422190921.GB1213339@ziepe.ca>
References: <2025042122-prudent-dogfish-eac6bf@boujee-and-buff>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025042122-prudent-dogfish-eac6bf@boujee-and-buff>

On Mon, Apr 21, 2025 at 10:46:19PM -0400, Ben Collins wrote:
> diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
> index 30be786bff11e..a4bc6482a00f7 100644
> --- a/drivers/iommu/fsl_pamu_domain.c
> +++ b/drivers/iommu/fsl_pamu_domain.c
> @@ -214,9 +214,10 @@ static struct iommu_domain *fsl_pamu_domain_alloc(unsigned type)
>  	INIT_LIST_HEAD(&dma_domain->devices);
>  	spin_lock_init(&dma_domain->domain_lock);
>  
> -	/* default geometry 64 GB i.e. maximum system address */
> +	/* Set default geometry based on physical address limit. */
>  	dma_domain->iommu_domain. geometry.aperture_start = 0;
> -	dma_domain->iommu_domain.geometry.aperture_end = (1ULL << 36) - 1;
> +	dma_domain->iommu_domain.geometry.aperture_end =
> +		(1ULL << PAMU_MAX_PHYS_BITS) - 1;
>  	dma_domain->iommu_domain.geometry.force_aperture = true;

What on earth does this even do? There is no map_range() callback in
this driver, so nothing should be reading geometry..

Jason
