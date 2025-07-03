Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E4329CB4A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 22:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751580845; cv=none; b=ZfyE6Yn6TfTlMRSjzSe/7bxZkAE8gHnoaXSbXnDzgu5+VLOU24yxooXqTq+vodmYC14YP2KUBQD3N9wWt2kewivm2iMIjdrEtd+TXAkAZqkSbGDWNODSBQpEwa74KoSYRieKIlbX9EypQLzkdjUCex+P2JLzMYXtXW9j3lJ8Vx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751580845; c=relaxed/simple;
	bh=UkzW8Ro69MEnCly9rrVk9a1BN9hioGbdCMPz+Y+hFRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HRpWAaTVH79aVeFjKYkTBKdNH5kg1PINr6BOlG5PtSKH0Ojt2s0ajDG4i5bjR9oEm4niQcEHjtgCfCNVWj7lr5hUPxAfvwq9XIRpM15/fq2fySAf1vHP+FeqM6dEcUUh+x3srGyPPXoEHycK44nRmPbSgIQedAvHrOZmbkBsF2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KXZMB3CI; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KXZMB3CI"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-235e389599fso273355ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 15:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751580843; x=1752185643; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MuHvBdZctEtzhPELFeCYnZqsR6O+CCEh7cw6bo3Z+rc=;
        b=KXZMB3CIUP2uBDx1RuWr30RKbK1mHqBfdvYF6P2Qcd3dKr1gEsdxOzuQQweDNnSaWU
         +si8wlVmOEDc0FBg1p8/vxM62CObmqczkrwGhm4wuVieC/PeAq86vrQU2OywQsBTLZUR
         lYK6mQyt9cYV+48v70WXIQybHB8PpUmhG72/mCSLMH0Zbc5ur96m4bhzG27UHWclJWQa
         rcDZxjvSuunmOO9voVVCtr7qm6NsmMk5qP8oFWBmRTQHHIJ+QUkPAyTy63fblHuRFUJG
         nVaCBYlQ7RbbouDfRGtqto1VrbBy6PiNkXnYnB6WLPMEMniO0lXoEBW0eZM+8cPpIWOA
         XKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751580843; x=1752185643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MuHvBdZctEtzhPELFeCYnZqsR6O+CCEh7cw6bo3Z+rc=;
        b=ACs+Kfuc7otB3YOIKbe0YYEXt8KtoAKay6ApFRoxXMFIMXyeqvE/nFf1Y++fSEXzJq
         fqRcX0ZcrCd0PjHzKAw/uRWjRJqwGGgaQeMlb5FZ2gqa/TIoj/YFr+2uyaqKS8BV/Dow
         pOIIFdwuB6yFABfRqWibK6hzCw0VgsjIgPSaWR4PJVV0HouUGC/l4ep1uT/t0K/jAtGF
         /T4ZPigDN522c9Mcj3svEtWVixG5oP4me5sHPLsWa5rJ+QnDVDKFm+HPFO/fn3HdivQz
         zyMn9cWu68P1oSSd62GCfOf4Zq+vtT5culCDbM5P/SSlIAKACCrckRL0dJV+zPF2mGO7
         gJTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJsUG4mx9Q2Te/GjWEML8mMmMOijPcdy1IHS4KObGNRhFj5wtImu0FfMPlZcnpDY348E+Yru6d0My1nv4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbzhzSQCqj8GyZOJnwqHTZgK1zmRUhsj7tZqZIWgydrxSeTrt2
	ydTEg8V4FMojHL9x5ihtk5InL5OTrTsGwqwFxHW7Z8T7YlQgBIZq+7GUuv2wapHGkZXHGB3UF4c
	uvBkQGw==
X-Gm-Gg: ASbGncsDsxyIJ/cMtBkRH4DQTfnFQuLeNeA9VETuuPebpYelIXVRrgtCfnlATCsVqZe
	BIARWFir7XoXl6NoNT9vdR/xjyHQsOGVrn4rJTcBPbYNjxYzBaPHJJvV6jCTrGAQGD5CkbyeZ4Y
	Pl+NHMUjTJM2n2ybIHpx2wzAuYq9p6KogtpPzoT0MRXOXkT6e+im/xDSh9qi1wdxno2H1E1GQfN
	2kcwFk3LBV09mrv53NGw3t7LDaEqQtfzsZRN7p8eSWu2/AeezBFbJTfVYKgy7VDKLLsqVpgOuPV
	5iD99ieKh7B6BfDjZS33wXAOgij/u0qHEeDNEiQHlnMeAyAviXulikCMQdoBMUBIylShVsvv4yY
	4BcIWuW266/naTjzAEQSxYMYLyPNYDq+V3VEzpQ==
X-Google-Smtp-Source: AGHT+IH31YOAgpp6cWXPyDDiSdW0FsgI8z3zIJNlzWY7vAq0H2n7kS+w2YKYWOMSnIdeLnEkqfRSUA==
X-Received: by 2002:a17:902:ebca:b0:234:9f02:e937 with SMTP id d9443c01a7336-23c7ac250c0mr3191765ad.25.1751580842742;
        Thu, 03 Jul 2025 15:14:02 -0700 (PDT)
Received: from google.com (135.228.125.34.bc.googleusercontent.com. [34.125.228.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8455ec28sm4302055ad.117.2025.07.03.15.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 15:14:02 -0700 (PDT)
Date: Thu, 3 Jul 2025 22:13:55 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Lu Baolu <baolu.lu@linux.intel.com>, Rolf Eike Beer <eb@emlix.com>,
	Arnd Bergmann <arnd@arndb.de>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>,
	Nate Watterson <nwatterson@nvidia.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu: arm: fix building smmuv3 as loadable module
Message-ID: <aGcAo3pUwdsa-mON@google.com>
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

Thanks, this fixed our allmodconfig builds downstream.

Tested-by: Carlos Llamas <cmllamas@google.com>
