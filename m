Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B424223302
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 10:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750328804; cv=none; b=tzy9fwbZ8IxhEceiTJahuhKdGJ8uQRTWvxpSRLyL9ZehhevvraIBhIIqT7jGIMgObYqxo13AvTvHKu/YDHZdkzcwv3Yp/vbtUtXj5jc3qtiqOAYYR6HJSziEldyTua2u5ycJOmZGRrYSZe8knj/SVDH9fj5xqI+yxuAKEt/D8rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750328804; c=relaxed/simple;
	bh=l5p9J2QLOh7J7ogYCt7vV0BkK248vYvNV1+J7U/FHbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LBYAyks59lh4P1T/A5R51ltAGYSnhiulEJPtfHfZuUAcWeSEwttB3/6s0SvL9TVVqh60Lg65oGTueR+iUuikwLUcgTDI3jVFYaSkcdP/CqPgKfohhXM2dc7+ZsZWu0CHpCOFRHDwciO4MlnvV+3HePzkR3dHBOjt0Ltk+61grwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LEtDX93D; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LEtDX93D"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-235e389599fso166605ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 03:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750328801; x=1750933601; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jrdYKQcH3sp0apOchPLnA+m1+Ly6Mzn8RffcZko3gSE=;
        b=LEtDX93DFDeoZojEpnkHQoJVgEjAjCq1ih1RMCuWDYzYmZZv3SLgc0FZdXOI2A3j/C
         SdgFl4AhIqn4ONzjhg45rpCucJulpSBGol1w+Th70biz5NQKTz8PWqXeuoKNnRgFaDBc
         4Bg5zT353R+aAQpkHSL0zA9rUjwWp5Fp9gyNd/PiXTqt9t9FAMB+oSqfwK49GF3E1qwW
         05hAMioXNDT3Ot+mhhxHdim0wxdl+EFqJX3a7B0CXgvqSRoLMtwtadbTUMnqtbNgLKnI
         9stDrgABCzz0L1sZxGi45E7bMkyAYLzVmSR7DKFrIry7eUNdzxIgSvXutCHzOWHqc0ig
         AdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750328801; x=1750933601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jrdYKQcH3sp0apOchPLnA+m1+Ly6Mzn8RffcZko3gSE=;
        b=DwaLifx0Bgak1FK6SbBX0ALBmVZ8HafiIHCB6C4yoR1yvxbLStWEFWiRzg51u57Vua
         6UfG9mVbkWTfljYLIo0eCqvK66jWVrH0+0MFM23ZKuFOUHeZQB0h/IKcBwq6EBX/5Qr7
         uKh9zxJ0FfOkN3QhEXQaxmuEcGBGplwtrprnV+8bEIvHymTiXkSeLjWs7yCBqkw6Bf4z
         d8ndtcn6VdTyW7qAYFmVOaXnj6jF0pHHwYP55Aokh6jsOMx5PrdQDHtpW/ii2a45mBKM
         itVcf8dt88XvSg6BNekauFRuvrs5h801GwVNCuMmtgsOw8TE3vUWI9SI/17IjIdQeIrc
         7xOA==
X-Forwarded-Encrypted: i=1; AJvYcCUNTCWjXYAMLobpAdr02lonNOxy+q16CPtqvdZUPfA6aECQqdsMadmSbbHOmQSw0x2H2JHz6hNSsfsznBw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzRlTlhDae18Vj2e+tYbn1YjG61g7xKl90OrJqSFIfgSXHgaq0
	HNMc1MDFL5IPvKGv95eB/C+Kt1uTek66JLnrh26+EtJCd76SFsrCS+5IuIIMCKPMUg==
X-Gm-Gg: ASbGncvWUqUku81brYT1b3R08wXfrNIRRHh3eFl+FaakRkwQxEM0LjGJzZmSYN6egpS
	tMNunPEcU2fRdmExXWEeqg/0v22nzYAqms7OmC3puSZYTuFrX62IvVEHE5p/df6GAotlOCGM2/6
	rF/a1F3byODoMnml5y6sKYTHp8FitkHOWZXCVqVqaMkne/oNC46fShR6t3ba1tdvpxB9fkb8mlB
	WpaH1PP+k6fogxnM/qi+MlhOdxXIlf88u6hqYv5Y6RXEET82sNQiTI9HdnBrsgISDm4N3bGTSgT
	UYuIV7/vR2s9YXqZAh/Ju3EsNg2taUBbgsNKaG+QkptJyTwY/lGsjyNJMztBtyyHP5ajLSeMC34
	9VKORJmxvVmIGKw7u8Ow4
X-Google-Smtp-Source: AGHT+IGiUkrhNhPK9lXuO365Ne3OwVoTaAk8SvrZ2YyadUl+5Mml/HIcLv4k3/+1+30tV1lrdYYgXA==
X-Received: by 2002:a17:902:e5c3:b0:224:6c8:8d84 with SMTP id d9443c01a7336-237cca5ada5mr2619125ad.4.1750328800415;
        Thu, 19 Jun 2025 03:26:40 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900b04e4sm12850712b3a.121.2025.06.19.03.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 03:26:39 -0700 (PDT)
Date: Thu, 19 Jun 2025 10:26:28 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
	zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v6 08/25] iommufd/viommu: Add driver-defined vDEVICE
 support
Message-ID: <aFPl1LD8r3Du-Far@google.com>
References: <cover.1749884998.git.nicolinc@nvidia.com>
 <937d515032be07af36c06a4adb662ee2f7693c75.1749884998.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <937d515032be07af36c06a4adb662ee2f7693c75.1749884998.git.nicolinc@nvidia.com>

On Sat, Jun 14, 2025 at 12:14:33AM -0700, Nicolin Chen wrote:
> NVIDIA VCMDQ driver will have a driver-defined vDEVICE structure and do
> some HW configurations with that.
> 
> To allow IOMMU drivers to define their own vDEVICE structures, move the
> struct iommufd_vdevice to the public header and provide a pair of viommu
> ops, similar to get_viommu_size and viommu_init.
> 
> Doing this, however, creates a new window between the vDEVICE allocation
> and its driver-level initialization, during which an abort could happen
> but it can't invoke a driver destroy function from the struct viommu_ops
> since the driver structure isn't initialized yet. vIOMMU object doesn't
> have this problem, since its destroy op is set via the viommu_ops by the
> driver viommu_init function. Thus, vDEVICE should do something similar:
> add a destroy function pointer inside the struct iommufd_vdevice instead
> of the struct iommufd_viommu_ops.
> 
> Note that there is unlikely a use case for a type dependent vDEVICE, so
> a static vdevice_size is probably enough for the near term instead of a
> get_vdevice_size function op.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/iommufd/iommufd_private.h |  7 -------
>  include/linux/iommufd.h                 | 26 +++++++++++++++++++++++++
>  drivers/iommu/iommufd/viommu.c          | 26 ++++++++++++++++++++++++-
>  3 files changed, 51 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
> index 468717d5e5bc..e6b1eb2ab375 100644
> --- a/drivers/iommu/iommufd/iommufd_private.h
> +++ b/drivers/iommu/iommufd/iommufd_private.h
> @@ -638,13 +638,6 @@ void iommufd_viommu_destroy(struct iommufd_object *obj);
>  int iommufd_vdevice_alloc_ioctl(struct iommufd_ucmd *ucmd);
>  void iommufd_vdevice_destroy(struct iommufd_object *obj);
>  
> -struct iommufd_vdevice {
> -	struct iommufd_object obj;
> -	struct iommufd_viommu *viommu;
> -	struct device *dev;
> -	u64 id; /* per-vIOMMU virtual ID */
> -};
> -
>  #ifdef CONFIG_IOMMUFD_TEST
>  int iommufd_test(struct iommufd_ucmd *ucmd);
>  void iommufd_selftest_destroy(struct iommufd_object *obj);
> diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
> index 2d1bf2f97ee3..f3b5cfdb6d53 100644
> --- a/include/linux/iommufd.h
> +++ b/include/linux/iommufd.h
> @@ -104,6 +104,16 @@ struct iommufd_viommu {
>  	enum iommu_viommu_type type;
>  };
>  
> +struct iommufd_vdevice {
> +	struct iommufd_object obj;
> +	struct iommufd_viommu *viommu;
> +	struct device *dev;
> +	u64 id; /* per-vIOMMU virtual ID */

Nit: Why not call this viommu_id?

> +
> +	/* Clean up all driver-specific parts of an iommufd_vdevice */
> +	void (*destroy)(struct iommufd_vdevice *vdev);
> +};
> +
>  /**
>   * struct iommufd_viommu_ops - vIOMMU specific operations
>   * @destroy: Clean up all driver-specific parts of an iommufd_viommu. The memory
> @@ -120,6 +130,14 @@ struct iommufd_viommu {
>   *                    array->entry_num to report the number of handled requests.
>   *                    The data structure of the array entry must be defined in
>   *                    include/uapi/linux/iommufd.h
> + * @vdevice_size: Size of the driver-defined vDEVICE structure per this vIOMMU
> + * @vdevice_init: Initialize the driver-level structure of a vDEVICE object, or
> + *                related HW procedure. @vdev is already initialized by iommufd
> + *                core: vdev->dev and vdev->viommu pointers; vdev->id carries a
> + *                per-vIOMMU virtual ID (refer to struct iommu_vdevice_alloc in
> + *                include/uapi/linux/iommufd.h)
> + *                If driver has a deinit function to revert what vdevice_init op
> + *                does, it should set it to the @vdev->destroy function pointer
>   */
>  struct iommufd_viommu_ops {
>  	void (*destroy)(struct iommufd_viommu *viommu);
> @@ -128,6 +146,8 @@ struct iommufd_viommu_ops {
>  		const struct iommu_user_data *user_data);
>  	int (*cache_invalidate)(struct iommufd_viommu *viommu,
>  				struct iommu_user_data_array *array);
> +	const size_t vdevice_size;
> +	int (*vdevice_init)(struct iommufd_vdevice *vdev);
>  };
>  
>  #if IS_ENABLED(CONFIG_IOMMUFD)
> @@ -224,4 +244,10 @@ static inline int iommufd_viommu_report_event(struct iommufd_viommu *viommu,
>  	 BUILD_BUG_ON_ZERO(offsetof(drv_struct, member)) +                     \
>  	 BUILD_BUG_ON_ZERO(!__same_type(struct iommufd_viommu,                 \
>  					((drv_struct *)NULL)->member)))
> +
> +#define VDEVICE_STRUCT_SIZE(drv_struct, member)                                \
> +	(sizeof(drv_struct) +                                                  \
> +	 BUILD_BUG_ON_ZERO(offsetof(drv_struct, member)) +                     \
> +	 BUILD_BUG_ON_ZERO(!__same_type(struct iommufd_vdevice,                \
> +					((drv_struct *)NULL)->member)))
>  #endif
> diff --git a/drivers/iommu/iommufd/viommu.c b/drivers/iommu/iommufd/viommu.c
> index c5eea9900c54..28ea5d026222 100644
> --- a/drivers/iommu/iommufd/viommu.c
> +++ b/drivers/iommu/iommufd/viommu.c
> @@ -116,6 +116,8 @@ void iommufd_vdevice_destroy(struct iommufd_object *obj)
>  		container_of(obj, struct iommufd_vdevice, obj);
>  	struct iommufd_viommu *viommu = vdev->viommu;
>  
> +	if (vdev->destroy)
> +		vdev->destroy(vdev);
>  	/* xa_cmpxchg is okay to fail if alloc failed xa_cmpxchg previously */
>  	xa_cmpxchg(&viommu->vdevs, vdev->id, vdev, NULL, GFP_KERNEL);
>  	refcount_dec(&viommu->obj.users);
> @@ -126,6 +128,7 @@ int iommufd_vdevice_alloc_ioctl(struct iommufd_ucmd *ucmd)
>  {
>  	struct iommu_vdevice_alloc *cmd = ucmd->cmd;
>  	struct iommufd_vdevice *vdev, *curr;
> +	size_t vdev_size = sizeof(*vdev);
>  	struct iommufd_viommu *viommu;
>  	struct iommufd_device *idev;
>  	u64 virt_id = cmd->virt_id;
> @@ -150,7 +153,22 @@ int iommufd_vdevice_alloc_ioctl(struct iommufd_ucmd *ucmd)
>  		goto out_put_idev;
>  	}
>  
> -	vdev = iommufd_object_alloc_ucmd(ucmd, vdev, IOMMUFD_OBJ_VDEVICE);
> +	if (viommu->ops && viommu->ops->vdevice_size) {
> +		/*
> +		 * It is a driver bug for:
> +		 * - ops->vdevice_size smaller than the core structure size
> +		 * - not implementing a pairing ops->vdevice_init op
> +		 */
> +		if (WARN_ON_ONCE(viommu->ops->vdevice_size < vdev_size ||
> +				 !viommu->ops->vdevice_init)) {
> +			rc = -EOPNOTSUPP;
> +			goto out_put_idev;
> +		}
> +		vdev_size = viommu->ops->vdevice_size;
> +	}
> +
> +	vdev = (struct iommufd_vdevice *)_iommufd_object_alloc_ucmd(
> +		ucmd, vdev_size, IOMMUFD_OBJ_VDEVICE);
>  	if (IS_ERR(vdev)) {
>  		rc = PTR_ERR(vdev);
>  		goto out_put_idev;
> @@ -168,6 +186,12 @@ int iommufd_vdevice_alloc_ioctl(struct iommufd_ucmd *ucmd)
>  		goto out_put_idev;
>  	}
>  
> +	if (viommu->ops && viommu->ops->vdevice_init) {
> +		rc = viommu->ops->vdevice_init(vdev);
> +		if (rc)
> +			goto out_put_idev;
> +	}
> +
>  	cmd->out_vdevice_id = vdev->obj.id;
>  	rc = iommufd_ucmd_respond(ucmd, sizeof(*cmd));
> 

Reviewed-by: Pranjal Shrivastava <praan@google.com>

> -- 
> 2.43.0
> 
