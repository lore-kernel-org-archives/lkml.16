Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBD11DE2D6
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746552578; cv=none; b=eGkAKXr6ubnIM4mN+F5olcTdfWn1QqUEAj6p7UD0uSS8XaGdlsio2HIeF6rsgmUwd1Zo3B2NaqAD83T22sMPuGcQazwyfA0iNLaU5H9YXyXzvbwArmLqOYWjahRVC3wlHfdLuKXR9V/mCI5RWv7SfGr2x3PZwE7d8DoaV3DMz/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746552578; c=relaxed/simple;
	bh=i4e7G7xw+wz0sgchsoY3CUzITAN56WMwZ67/B/5MgNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OQtnWAvoCUhSij00futQ3q6LImZWpIAkEqzfcSMIwOqv7PkKQ/TuphuEcwQ/3FI8vBE4vYV0KmCLhM9iHmDztEREX9xJebgd87fMhJ6aiKpfvASymQRC2DXOuR7skGRr8aC+9jLc9gpXMDnFXgADEZPqXRw9ZLrlaVg5vRqIAzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Quqw1wQa; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Quqw1wQa"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c5e1b40f68so691029385a.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 10:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1746552574; x=1747157374; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lzw/NpSpLJ013Llh+NLWNGNiT0GNflI59y1+tAq7i9w=;
        b=Quqw1wQaQ1nUS1wALMCCC9F+XhEl2zNUNxVp/UL7DsGTao8KtCJXTq+EUKYbPp/NV3
         M3yxQH2qfcOs+5vZMEQDtFhoEpydAlA0P+mjBhb4hikXaAe5xlP5SkyX4syyDXyStoS3
         wguZehFh2YApSfBWXCe01CpV8uTpO3Bs62R7aEK4SmCfEGiEVgYwyqozW2pfhqkRa+6O
         VzR+iNobF81fuEcx7cL46PGNCSB15J3SsKwYKSIIh82DYm+Cy4FSKw64nbtFVxeq6Bvl
         Fzy+61PyReOdfWcBnG/rL+6CVZbiPNzllxbDhfcbvAcFgk9UP4AdrbjqDIYRy9+/ebLa
         B1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746552574; x=1747157374;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lzw/NpSpLJ013Llh+NLWNGNiT0GNflI59y1+tAq7i9w=;
        b=iWv6OMi5ogI/pxR2/KOwKpmpuS/WVHEnW1JvTHKLvlW0XO+DvjRxYAKRQgYfti98uZ
         WcsZn1/3qWBKU7sQsMQ55GKbxcOTLsWQUDM9o1Tp4b1WexS9Z9lO/SzNxcrvGKAtjanV
         Ftt+3C4RBxt7DtHZO9Wy17U8YeorDU4e6huemYi1DQMdUJhGNB0C4BHLduktPOiNvFRy
         btFr+OmJR8SzPIvPzNneMjembGLOrXauYzeSwSUo5iaqZ0TORMe3EJk5Mf8YF0f1zsGp
         6skRcWt0ruXA9WZv/LQHnF7V93rLZ84tGIBQDi78NDUOuVAze6B/y3rAU3iY5ptSas0B
         3Rdw==
X-Forwarded-Encrypted: i=1; AJvYcCVonkssaHDc0M3XBorcLRE23BkKqLs9cAuVqR2MnTjn2py+vSW0x6ART8z1EouzKgWAksga7XrUUfBKFt4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9CACJ7GYQWvVvhTyPRC+2B3DuHypR3lapqNsxqTucbGrG+8yJ
	q0UAoKzix6fFVab41O44Fz1CLLhfXB81VbMmjN6E+YioYP+6bKL5MLvEhma/C9g=
X-Gm-Gg: ASbGncskveEGXiDG6GM+m+Q8R5587BHpkbCeHSnwTmBx9P+/e/HUeWNgtN/0VckeZms
	U05TlL+m22G7QrGTZr0H1xKW77tFxRQ7F0apM4Dz1Cg5ajZYYvzIbGWj3m8d+nyLM5pUWFfTHyU
	uukVPwrkm3cC8+B727xkBoyw4sMmAggSTwHwh7gcQNwE+XZH46ZOMCi2k7gNWTRO3F60N0aJdDC
	E/bFp83ECQSGkx+DFTBgxkVbOhWatQKv0IirDAVFKsQ/4tOXJf+z0SLmtGoXcrX0Zp6eT8CqCqa
	f38CeuJr6rcJ8bpreNb2w9LUaNA/fKwRyBIEOD2cYWrwj6bhc5H309KfW6mWDgbQqzdVh/LggeT
	5ulVwY7XBUU/sTQ5Yi9w=
X-Google-Smtp-Source: AGHT+IHsQ8juIlpShZZzkUdMDq7xB5U8B/5m+eZbdsl8X4APoHP6XCwe0ty4ChmcMRK06w7rXiGzUA==
X-Received: by 2002:a05:620a:44c9:b0:7c9:2612:32d6 with SMTP id af79cd13be357-7caf74129demr26939485a.48.1746552574201;
        Tue, 06 May 2025 10:29:34 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-49222f8b1c0sm121101cf.52.2025.05.06.10.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 10:29:33 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uCM6m-00000000LG8-3Doe;
	Tue, 06 May 2025 14:29:32 -0300
Date: Tue, 6 May 2025 14:29:32 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Kevin Tian <kevin.tian@intel.com>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] iommu/vt-d: Use ida to manage domain id
Message-ID: <20250506172932.GA33739@ziepe.ca>
References: <20250430021135.2370244-1-baolu.lu@linux.intel.com>
 <20250430021135.2370244-2-baolu.lu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430021135.2370244-2-baolu.lu@linux.intel.com>

On Wed, Apr 30, 2025 at 10:11:34AM +0800, Lu Baolu wrote:
> Switch the intel iommu driver to use the ida mechanism for managing domain
> IDs, replacing the previous fixed-size bitmap.
> 
> The previous approach allocated a bitmap large enough to cover the maximum
> number of domain IDs supported by the hardware, regardless of the actual
> number of domains in use. This led to unnecessary memory consumption,
> especially on systems supporting a large number of iommu units but only
> utilizing a small number of domain IDs.
> 
> The ida allocator dynamically manages the allocation and freeing of integer
> IDs, only consuming memory for the IDs that are currently in use. This
> significantly optimizes memory usage compared to the fixed-size bitmap.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> ---
>  drivers/iommu/intel/dmar.c  |  3 ++
>  drivers/iommu/intel/iommu.c | 80 ++++++++-----------------------------
>  drivers/iommu/intel/iommu.h | 19 +++++++--
>  3 files changed, 34 insertions(+), 68 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
