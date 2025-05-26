Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A3023741
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 18:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748284786; cv=none; b=PDEV9znctI57zt8H1fbDchKATPQj58VJ7+x4JlyNRSILTy50a3EuxjctQu4inOsTeoXLQuJQMRt/xcx/+El+coLgAT7DB6sEylsiy3hWQX2d87bwNAAWFaoh5tbB45wVD6r+qQZrQ8Y68bdb67x5iRBYZWNOJpP9czkS0akJk04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748284786; c=relaxed/simple;
	bh=vQM+dbOsVNtnD6l723Z1cplax/h0AmSZd+7H89VyNRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LFFzQDljUmG25IeImp2ps/H3aabuZZOHwBYFs1ZIFXiAL4GD408SLebHWN6WEXvLg8bonnB0t5Bqmwd5SaMbsgUx1hU++zMLG9I21dInHfQb60bB8jBtpRGFWflU6rOF95YbUXSrq5Ua7dkWpy5GTKuljqTp+zuCtLLCz3Q7r50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=B/sG5P6u; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="B/sG5P6u"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c58974ed57so241035085a.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 11:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748284782; x=1748889582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c86jKa309c3+QcTsQwLNlEeQh4J3Qa5o3Yi92C1rAmE=;
        b=B/sG5P6uUxIrjwgYGz04MktsXZYu2xBOJn2X97W9z50w+lupSDCrQFpCEpafwAjFzt
         AjY7Sp5YaXlT+5EYFLFsDBRYZAO7ZKp2RVGXxTb9YHaff+ElkQM3ai26VURdWOd+0QCV
         SZW12ilCVVzFUSKxe68gnCcsuIhYAfN/pR5KBY9dY8ATvujl2VNftnFMC10q6wf2adra
         UKHQiHA/kOaA9FFv2WVbjmQOqISjRJ7QkSrZ6fYTVXzOaVjCaVHMwLRU6Y/lG18gq/VA
         hawz6dgmMOKQH5I1btbJ2qPczZovEH7oiAUn3cOBCZXQzcU+HUR5yZED4t7eobhJX1I1
         Hmfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748284782; x=1748889582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c86jKa309c3+QcTsQwLNlEeQh4J3Qa5o3Yi92C1rAmE=;
        b=PKjg/hqPpGesAKQLvHGZavTIrhL3LuoyTO/meEHt3CVTiNCdcpXjfnZ/tg7XICMEs1
         iAo5WqOTLgbWWDk40zE/hcH6ur9L6BVvNG764DxllRvdblHWc9p5q+lRlBpE9TV5M9h7
         3OcjKnn+Csf7zP1EhTmmK8HrnBlYWhlUCaEGRIgFDqxLlzqON/educPmh5pL8rQaTb1D
         ek4VsU61Qmr4GkZAVnwXdJN87n+wj7ZBHrrerVo0oZVLM2+1b/g66DicJnwCDj3QG4e4
         OG6PcId8ThT1AasNbtg4pOyifyzJyQgWeyqjKeGyna76e3LqZ+Ctz0KNrYAmWk7D6QQF
         DznQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIfW4fD+oxnceU/Z3N26cxIlbUH0ccGUeVgGQatLnGUOt1c/7i47Vu2AE9pKxQNjQq1z2znLB7z5je9us=@vger.kernel.org
X-Gm-Message-State: AOJu0YxD/ZBu3kNyR2kShOObqJpUDP0aP8tIIZOsbhsmHqQUoaDxOLj0
	zv7iupCbouQG1oHu3j8838pmwDtruGSQVZBv2K2wM+ocB+o8/x85TqrEQrDjVwDRztI=
X-Gm-Gg: ASbGncumWJ1DvKX18qjc4maFKI/K2jx2oL9GZGv4B6WvE1h3BA6zll0FoOko5sP2cwi
	RpNhx/CpcOHQtBn1HOOSOnBRfzKaegYDoooh8apInwAHOChskcFWhv8PGelfnCViMSzxXOTBVZj
	IzZZoGRZI9jYZmljHq7+JlGLJdMsrBUuDODsJukkgch0to5St0FBQagySPENp3V3b1YA+Yuula/
	gVnWPXSGFx5KkPNxMrgG0r3y5Hs5Bkz8RtvuAO087SeWDtv9dqRfSlnIn40QnpfwtdA2ljrvokK
	nOQ2i/Ljk3as0Xcb5E+uyqT1h+rARyG7bCJk0hKnTY3nJpdOsuAkWKE/IjyCCY3giZuSdu9nI5a
	Mkki/GuVZcL0VALi5yGgNb7AngcA=
X-Google-Smtp-Source: AGHT+IGL7te5fpMbZe9HXdt3D5MGVGH/Bdpvl2UHGaBVcVqu8HICiF43E0e5svsb0e6OdO9BbM2sDg==
X-Received: by 2002:a05:620a:269b:b0:7cd:4b5b:a202 with SMTP id af79cd13be357-7ceecbad0cbmr1427354485a.20.1748284782328;
        Mon, 26 May 2025 11:39:42 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd468b844bsm1592181385a.87.2025.05.26.11.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 11:39:41 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uJcjd-00000000Ts1-0aL8;
	Mon, 26 May 2025 15:39:41 -0300
Date: Mon, 26 May 2025 15:39:41 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Lu Baolu <baolu.lu@linux.intel.com>, Rolf Eike Beer <eb@emlix.com>,
	Arnd Bergmann <arnd@arndb.de>, Robin Murphy <robin.murphy@arm.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Nate Watterson <nwatterson@nvidia.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu: arm: fix building smmuv3 as loadable module
Message-ID: <20250526183941.GE12328@ziepe.ca>
References: <20250523121257.2340274-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523121257.2340274-1-arnd@kernel.org>

On Fri, May 23, 2025 at 02:12:53PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The smmu-v3 kunit test fail to link when the SMMU driver is configured
> as a loadable mdoule:
> 
> ERROR: modpost: "arm_smmu_make_cdtable_ste" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
> ERROR: modpost: "arm_smmu_make_s2_domain_ste" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
> ERROR: modpost: "arm_smmu_make_s1_cd" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
> ERROR: modpost: "arm_smmu_make_bypass_ste" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
> ERROR: modpost: "arm_smmu_make_abort_ste" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
> ERROR: modpost: "arm_smmu_make_sva_cd" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
> ERROR: modpost: "arm_smmu_get_ste_used" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
> ERROR: modpost: "arm_smmu_write_entry" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
> ERROR: modpost: "arm_smmu_get_cd_used" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
> 
> The problem is that the drivers/iommu/arm/arm-smmu-v3/Makefile only gets
> parsed while building modules, but the driver itself is accidentally marked
> as built-in unconditionally, so not only does the kunit test fail, but the
> entire driver is missing.
> 
> Change the driver configuration back to $(CONFIG_ARM_SMMU_V3) so it
> actually gets build here.
> 
> Fixes: e436576b0231 ("iommu: make inclusion of arm/arm-smmu-v3 directory conditional")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/iommu/arm/arm-smmu-v3/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
