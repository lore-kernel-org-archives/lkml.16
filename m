Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8259521C176
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 22:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750113814; cv=none; b=CSzpeaooSRP5lTma/tMM8xah+DHpJYw0Qh0XplwmOqoOELPZeccxSD3p6UFjzLhIlusEyInBLCVrH3f7JYJ5Wl0dihujwiRFeYx5B72qY+E9/nT/65qe8DiMuasMZulSjqQOQk313yo80j6qWrTWyjAMLvmIXofaaK8vUgzdbKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750113814; c=relaxed/simple;
	bh=9VAhz6xNRMl911jOxUf9NXCD/sddwJ16lYh5+w/2mdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AUXA1N4dL3xfaLJMU27hR30XJXIVQ2rASArtvXrwD4sW3nTFL4nBJWBFw+M21UQoTO1VIwa68WReCwwMiPhn6DtI/+slBOWNv57VTJsJ4vtwZEd7gclP8573+ynI637gNIvGIsYBHlRISOaA6+P2COeGT9n8luEKfNGkP1E9frc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Zupy3CIl; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Zupy3CIl"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-235e389599fso79925ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750113811; x=1750718611; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ymL8Mqhb7MuXq62tfegfyenrSBgHaY6RdOOoY9Vdrxo=;
        b=Zupy3CIl2KxnQY/wO3ntsJO2xQM6h/TpfNe7BWscn/hJIrQaHQNTTFQVrIyoMghZt0
         3YTJ9lTN2JZYdtjqMTkndEiyjskf4uoaDoDWcunbKd4fWZOaQkUcbpeEJWjsT3sWXkSP
         AARY3fOyyDOLCBT7mmDw1ttzI6Wa8roCx9PfMbKMdOtQQI7f/mT1Z8rkR5dlvq/LNeVK
         mIqlUKgAaQizsX3SD0Z1CWmub7+Mh/iPDQrkepeiWg7nbqVmFZWq9sFAsz2vBJbK8ogN
         740nKNsuDOpwJ+bzUZRDruTBE/Bu3Q7BnvNee5+22DgxvIJ8lOCpUMv0lX6RC62Kh4B0
         2Aww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750113811; x=1750718611;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymL8Mqhb7MuXq62tfegfyenrSBgHaY6RdOOoY9Vdrxo=;
        b=Lf3uhN+G9QjRAKcod+vFUl0CQ/FXxuHX+AZGKi4wp1qvfUaemmGRYEaFMQDlU0wIK6
         IuWV6kM9LaQJD51VUC/h5X0J1yEhN8D6l7JlwK4xJzBHTfTgsI3kZVQkHuCQT323fz5e
         yDRU93bZIKzP2FSjgrBVDCNUDGeMQfJaIeo9LGtVNX7uTORunGcrxSqha+P4nT2FMWWG
         rQ8743nlCCrMPyLXdb32iqRHi9Dm0+JD0DPMB30gKo2Fx//rMvY/MxZkbccaQHD8lzCs
         m+eoVvKLyChroTEvYTE4qmQtpYLoR9AJo7pgw+H1J5OCjQuFg/NNhguLnXIaNYfiz2lc
         6VdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBCjALzjyNvmueB5Y0bo1UxEfmOlP3dMjdLpdU0ybt8ydRWD32+6hsLOKPyftzZeID3oQcJ7bwniisKlg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMG58QTEYBAfK7D0/+rYz0OsPg4URGbN8Bz8rSs59OsnI/09oY
	jfIxh6A4DSq1tmasSLKtcbN9k0I7QiDEO1xb0/IywbAvW243Ej77I6W5CP7RJM8qPQ==
X-Gm-Gg: ASbGnctO7RHS7rWA8PIiIdphtLQcYyB3tl6VaJEoPEOiDSAXLcaHKvgUw5+zde/kUeg
	Dlcg3l+wcud2hjW1478MOGMP+gUn7E0MuCvkQVdkgU+eRSF/lzE9oDZpqdnuV4chIrYXVTqaPeD
	bWs4cmdbsCGFBkri4bKRdVQCSsV8zpoiQBNvslfw3sDWr6GyNKA1w276pdyaJMHdkEQ56n3FOrv
	u+wqf4Rpo/w6hU03IYpi4Hs3LeJE95s/QUl6sDpFYPYCS37N1JyXgB0I+SPZ9aUOxf6K4YzHNkJ
	gZv7AfDv0SurRCI8wHxVw1G3zgOKeg0luOhQLX16DaHkQW/OcaPvW9EtHw/HZRTEjndNRZizjw8
	8U2xuoC591RS/o0CI1fIw
X-Google-Smtp-Source: AGHT+IEkufL7OuATbKkyQmUkhfoeOlW/ZVbGbDv9YqSYwYKyZQFbECA2k6ko4G5Q+boO/eTGgvXo1g==
X-Received: by 2002:a17:902:d2c6:b0:234:a469:62ef with SMTP id d9443c01a7336-2366eda3363mr5460125ad.3.1750113811264;
        Mon, 16 Jun 2025 15:43:31 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900829f7sm7357692b3a.87.2025.06.16.15.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 15:43:30 -0700 (PDT)
Date: Mon, 16 Jun 2025 22:43:22 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, yi.l.liu@intel.com,
	peterz@infradead.org, jsnitsel@redhat.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev,
	baolu.lu@linux.intel.com
Subject: Re: [PATCH v2 10/14] iommu/arm-smmu-v3: Replace arm_vsmmu_alloc with
 arm_vsmmu_init
Message-ID: <aFCeCvKkm1MvT3xP@google.com>
References: <cover.1749882255.git.nicolinc@nvidia.com>
 <64e4b4c33acd26e1bd676e077be80e00fb63f17c.1749882255.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64e4b4c33acd26e1bd676e077be80e00fb63f17c.1749882255.git.nicolinc@nvidia.com>

On Fri, Jun 13, 2025 at 11:35:22PM -0700, Nicolin Chen wrote:
> To ease the for-driver iommufd APIs, get_viommu_size and viommu_init ops
> are introduced.
> 
> Sanitize the inputs and report the size of struct arm_vsmmu on success, in
> arm_smmu_get_viommu_size().
> 
> Place the type sanity at the last, becase there will be soon an impl level
> get_viommu_size op, which will require the same sanity tests prior. It can
> simply insert a piece of code in front of the IOMMU_VIOMMU_TYPE_ARM_SMMUV3
> sanity.
> 

That's what I was wondering, so we plan to replace the impl->vsmmu_alloc
op as well?

> The core will ensure the viommu_type is set to the core vIOMMU object, and
> pass in the same dev pointer, so arm_vsmmu_init() won't need to repeat the
> same sanity tests but to simply init the arm_vsmmu struct.
> 
> Remove the arm_vsmmu_alloc, completing the replacement.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   | 11 +++--
>  .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     | 46 ++++++++++---------
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  3 +-
>  3 files changed, 32 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index ea41d790463e..bb39af84e6b0 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -1034,18 +1034,19 @@ struct arm_vsmmu {
>  
>  #if IS_ENABLED(CONFIG_ARM_SMMU_V3_IOMMUFD)
>  void *arm_smmu_hw_info(struct device *dev, u32 *length, u32 *type);
> -struct iommufd_viommu *arm_vsmmu_alloc(struct device *dev,
> -				       struct iommu_domain *parent,
> -				       struct iommufd_ctx *ictx,
> -				       unsigned int viommu_type);
> +size_t arm_smmu_get_viommu_size(struct device *dev,
> +				enum iommu_viommu_type viommu_type);
> +int arm_vsmmu_init(struct iommufd_viommu *viommu,
> +		   struct iommu_domain *parent_domain);
>  int arm_smmu_attach_prepare_vmaster(struct arm_smmu_attach_state *state,
>  				    struct arm_smmu_nested_domain *nested_domain);
>  void arm_smmu_attach_commit_vmaster(struct arm_smmu_attach_state *state);
>  void arm_smmu_master_clear_vmaster(struct arm_smmu_master *master);
>  int arm_vmaster_report_event(struct arm_smmu_vmaster *vmaster, u64 *evt);
>  #else
> +#define arm_smmu_get_viommu_size NULL
>  #define arm_smmu_hw_info NULL
> -#define arm_vsmmu_alloc NULL
> +#define arm_vsmmu_init NULL
>  
>  static inline int
>  arm_smmu_attach_prepare_vmaster(struct arm_smmu_attach_state *state,
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> index e4fd8d522af8..9f59c95a254c 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> @@ -382,25 +382,14 @@ static const struct iommufd_viommu_ops arm_vsmmu_ops = {
>  	.cache_invalidate = arm_vsmmu_cache_invalidate,
>  };
>  
> -struct iommufd_viommu *arm_vsmmu_alloc(struct device *dev,
> -				       struct iommu_domain *parent,
> -				       struct iommufd_ctx *ictx,
> -				       unsigned int viommu_type)
> +size_t arm_smmu_get_viommu_size(struct device *dev,
> +				enum iommu_viommu_type viommu_type)
>  {
> -	struct arm_smmu_device *smmu =
> -		iommu_get_iommu_dev(dev, struct arm_smmu_device, iommu);
>  	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
> -	struct arm_smmu_domain *s2_parent = to_smmu_domain(parent);
> -	struct arm_vsmmu *vsmmu;
> -
> -	if (viommu_type != IOMMU_VIOMMU_TYPE_ARM_SMMUV3)
> -		return ERR_PTR(-EOPNOTSUPP);
> +	struct arm_smmu_device *smmu = master->smmu;
>  
>  	if (!(smmu->features & ARM_SMMU_FEAT_NESTING))
> -		return ERR_PTR(-EOPNOTSUPP);
> -
> -	if (s2_parent->smmu != master->smmu)
> -		return ERR_PTR(-EINVAL);
> +		return 0;
>  
>  	/*
>  	 * FORCE_SYNC is not set with FEAT_NESTING. Some study of the exact HW
> @@ -408,7 +397,7 @@ struct iommufd_viommu *arm_vsmmu_alloc(struct device *dev,
>  	 * any change to remove this.
>  	 */
>  	if (WARN_ON(smmu->options & ARM_SMMU_OPT_CMDQ_FORCE_SYNC))
> -		return ERR_PTR(-EOPNOTSUPP);
> +		return 0;
>  
>  	/*
>  	 * Must support some way to prevent the VM from bypassing the cache
> @@ -420,19 +409,32 @@ struct iommufd_viommu *arm_vsmmu_alloc(struct device *dev,
>  	 */
>  	if (!arm_smmu_master_canwbs(master) &&
>  	    !(smmu->features & ARM_SMMU_FEAT_S2FWB))
> -		return ERR_PTR(-EOPNOTSUPP);
> +		return 0;
>  
> -	vsmmu = iommufd_viommu_alloc(ictx, struct arm_vsmmu, core,
> -				     &arm_vsmmu_ops);
> -	if (IS_ERR(vsmmu))
> -		return ERR_CAST(vsmmu);
> +	if (viommu_type != IOMMU_VIOMMU_TYPE_ARM_SMMUV3)
> +		return 0;
> +
> +	return VIOMMU_STRUCT_SIZE(struct arm_vsmmu, core);
> +}
> +
> +int arm_vsmmu_init(struct iommufd_viommu *viommu,
> +		   struct iommu_domain *parent_domain)
> +{
> +	struct arm_vsmmu *vsmmu = container_of(viommu, struct arm_vsmmu, core);
> +	struct arm_smmu_device *smmu =
> +		container_of(viommu->iommu_dev, struct arm_smmu_device, iommu);
> +	struct arm_smmu_domain *s2_parent = to_smmu_domain(parent_domain);
> +
> +	if (s2_parent->smmu != smmu)
> +		return -EINVAL;
>  
>  	vsmmu->smmu = smmu;
>  	vsmmu->s2_parent = s2_parent;
>  	/* FIXME Move VMID allocation from the S2 domain allocation to here */
>  	vsmmu->vmid = s2_parent->s2_cfg.vmid;
>  
> -	return &vsmmu->core;
> +	viommu->ops = &arm_vsmmu_ops;
> +	return 0;
>  }

Seems much better now that the driver doesn't need to callback to the
core for allocating viommu. One quick question though I see we've 
removed the following too:

        if (master->smmu->impl_ops &&master->smmu->impl_ops->vsmmu_alloc)
	                vsmmu = master->smmu->impl_ops->vsmmu_alloc(
			                        master->smmu, s2_parent,
						ictx, viommu_type,
						user_data);

Not sure why don't I see that in the diffs.. do we plan to split this
into an impl-specific size and init too?

>  
>  int arm_vmaster_report_event(struct arm_smmu_vmaster *vmaster, u64 *evt)
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 10cc6dc26b7b..181d07bc1a9d 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -3688,7 +3688,8 @@ static struct iommu_ops arm_smmu_ops = {
>  	.get_resv_regions	= arm_smmu_get_resv_regions,
>  	.page_response		= arm_smmu_page_response,
>  	.def_domain_type	= arm_smmu_def_domain_type,
> -	.viommu_alloc		= arm_vsmmu_alloc,
> +	.get_viommu_size	= arm_smmu_get_viommu_size,
> +	.viommu_init		= arm_vsmmu_init,
>  	.user_pasid_table	= 1,
>  	.pgsize_bitmap		= -1UL, /* Restricted during device attach */
>  	.owner			= THIS_MODULE,
> -- 
> 2.43.0
> 

With that, 
Reviewed-by: Pranjal Shrivastava <praan@google.com>
