Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5244A2951C3
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 18:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745866605; cv=none; b=ZW5sxDk7axGwkZfRalmjJViqDBQXEpBzYvy5cvD0tXBDb6YvmLaSDlM1qtnJEgZSFaHB4CPp1KaTpkIoJF2mXvlyOlocsfBzCfsbxVWbWWrqwenMOAedmgLyxjQLtW8vIvhB65rlsKiJfDqco2kXHSBO0UkarxfDTLcSCEw8TsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745866605; c=relaxed/simple;
	bh=OFEc8MAiX9TeMfChiyb/QiYaNmOIEMhcKoAsH046gjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gWTUsWzWN0Fi0Jl28+gHRsBHRU2TZ9x6g5f0RnuuGisC8NJzQEYh0v+1MX62nMYF7SZ08hckWqczD9bWkNF4+CkVDR0AnXic0BH1qM65xSVcDbJsI6HkXSj8ZlwY3K9QqkjKAYWp8uq7txN/bnjjGVnXz7phDRP6JrJNJkC3oKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=05ZTyijT; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="05ZTyijT"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2240aad70f2so35085ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 11:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745866603; x=1746471403; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gUeOpwsZ3bAk2qBL8+dBV7f0gHVviZTQa3DepiItlZA=;
        b=05ZTyijThZcTRXxbuLmt/233GJXoJB37HSECYx1is9sR5Yqq02YDUVj/rj6OMLtNus
         qOKEJpqriP1B/ovIYYNxSz3+2I/hBtfgymqrWUfVeHdSr/XowQprs48oyHu1WwucRj2l
         orrXD+Knqcebg78KB2021k30O6dUUPfzFPjn3ORpnX3cCiu+uKJtQulTEvd0D5J8r1lG
         zMhzQ4rQEabmYKITZqbnmj4AdnRyEmbw2UKKSqtjgXX3E+a0wt6ebqQRUXdqmNOvSYbH
         dp1pMMbD9oLUOhxRNoV+EAFMJxOyBwkPAuXTq7EW+SPW2cMUmgUyMX196A3L2kSa6Oqu
         AYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745866603; x=1746471403;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUeOpwsZ3bAk2qBL8+dBV7f0gHVviZTQa3DepiItlZA=;
        b=b6ZOB+QAkrL//QtugFDC6AxkwcoaL9MQfLfxXvoWHxV8OT9eCkNKnLWTTSN2zlM+vZ
         8JSHC6nxkLCFaLwkkhOKHFcbkEN6psT8Z+4vRwKS4K8v8lacb4sGTLzOu2pwaMIM5waW
         1swUOGRqTT7mKXz7BBJy7pNRSuvuKCVYMbcagfXrIOyjQR4murvJBkmh6gkWXnQNuma/
         GqzMB6WmQwpi+7WauKqnW4HZJQbA4m9ApKkUmd8fw/9BUdx2zZY2ivFpO15Q3pNpVi7H
         FyhqhA31oeS1WpaOJ3iHJGNakyeY4bo05IQxderfUXf9FKXQAZzP+B4L0CIdybiA7urP
         xmYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWh7hNqmjkiVdRlNQeoCslh/57bPYe5phM+Dvsej/A0ORwFWlIKLhTyX2vwuE5OxMqCXzkIXF7/NcZClF8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAdEy++Thjp1HuYyclxzEr92yC1+nJ8RrevuDgjWm7rXNynfS0
	fUfK6294cSinMQNUsgq6jUyvg+lLf4D9npO4E419Qzchs++g327bTARdNJ1bxg==
X-Gm-Gg: ASbGncu20fxV4W0QsG2viFFuwC/TRrgaWm8gnb1ocfeL6YzDBDVsgXU+Cj3+Ymz0DLP
	ycEFFZJqtm6NkXMjPO0l7LPZfwOxjVLhO9WYNT8HYziZ6E1WpIAWPP9/DSnuM9zARkjhkhzzHC4
	H98XS3X8WRIwpoFiX+L5VjSCcCOdqEFxpz0/bo3rwEoo2AXGP80FbAfJ6onY0Lf9uw3iadzNcro
	6fU0BamNQDTqRXOPlhjIWQKlbZudmj9OqUbwG46C7H7CtsTuB+ysAvaHba5usJnvh9Zah0JwOml
	NersmDKn+OBgV0KOQ300WI0VDRqpFsKZzn1ejjpED/oVaKnKvUe78Usxze/onZP4VJj5te+b
X-Google-Smtp-Source: AGHT+IEn9NdqisiZUEFudVyDLIBAx0JrxSAXK9s59PU8BubuekqQOaQAsWfs78yrsnFIaEMxYjdNjg==
X-Received: by 2002:a17:903:2447:b0:223:5182:6246 with SMTP id d9443c01a7336-22de6ecc0acmr313105ad.23.1745866602737;
        Mon, 28 Apr 2025 11:56:42 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbd6f7sm86915695ad.76.2025.04.28.11.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 11:56:42 -0700 (PDT)
Date: Mon, 28 Apr 2025 18:56:31 +0000
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
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com
Subject: Re: [PATCH v2 06/22] iommufd/selftest: Support user_data in
 mock_viommu_alloc
Message-ID: <aA_PX5k_haI3RwoN@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <786cd49df9fb437790b7dba53165e4316747913b.1745646960.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <786cd49df9fb437790b7dba53165e4316747913b.1745646960.git.nicolinc@nvidia.com>

On Fri, Apr 25, 2025 at 10:58:01PM -0700, Nicolin Chen wrote:
> Add a simple user_data for an input-to-output loopback test.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/iommufd/iommufd_test.h | 13 +++++++++++++
>  drivers/iommu/iommufd/selftest.c     | 19 +++++++++++++++++++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/drivers/iommu/iommufd/iommufd_test.h b/drivers/iommu/iommufd/iommufd_test.h
> index 1cd7e8394129..fbf9ecb35a13 100644
> --- a/drivers/iommu/iommufd/iommufd_test.h
> +++ b/drivers/iommu/iommufd/iommufd_test.h
> @@ -227,6 +227,19 @@ struct iommu_hwpt_invalidate_selftest {
>  
>  #define IOMMU_VIOMMU_TYPE_SELFTEST 0xdeadbeef
>  
> +/**
> + * struct iommu_viommu_selftest - vIOMMU data for Mock driver
> + *                                (IOMMU_VIOMMU_TYPE_SELFTEST)
> + * @in_data: Input random data from user space
> + * @out_data: Output data (matching @in_data) to user space
> + *
> + * Simply set @out_data=@in_data for a loopback test
> + */
> +struct iommu_viommu_selftest {
> +	__u32 in_data;
> +	__u32 out_data;
> +};
> +
>  /* Should not be equal to any defined value in enum iommu_viommu_invalidate_data_type */
>  #define IOMMU_VIOMMU_INVALIDATE_DATA_SELFTEST 0xdeadbeef
>  #define IOMMU_VIOMMU_INVALIDATE_DATA_SELFTEST_INVALID 0xdadbeef
> diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
> index 8b8ba4fb91cd..b04bd2fbc53d 100644
> --- a/drivers/iommu/iommufd/selftest.c
> +++ b/drivers/iommu/iommufd/selftest.c
> @@ -740,16 +740,35 @@ mock_viommu_alloc(struct device *dev, struct iommu_domain *domain,
>  {
>  	struct mock_iommu_device *mock_iommu =
>  		iommu_get_iommu_dev(dev, struct mock_iommu_device, iommu_dev);
> +	struct iommu_viommu_selftest data;
>  	struct mock_viommu *mock_viommu;
> +	int rc;
>  
>  	if (viommu_type != IOMMU_VIOMMU_TYPE_SELFTEST)
>  		return ERR_PTR(-EOPNOTSUPP);
>  
> +	if (user_data) {
> +		rc = iommu_copy_struct_from_user(
> +			&data, user_data, IOMMU_VIOMMU_TYPE_SELFTEST, out_data);
> +		if (rc)
> +			return ERR_PTR(rc);
> +	}
> +
>  	mock_viommu = iommufd_viommu_alloc(ictx, struct mock_viommu, core,
>  					   &mock_viommu_ops);
>  	if (IS_ERR(mock_viommu))
>  		return ERR_CAST(mock_viommu);
>  
> +	if (user_data) {
> +		data.out_data = data.in_data;
> +		rc = iommu_copy_struct_to_user(
> +			user_data, &data, IOMMU_VIOMMU_TYPE_SELFTEST, out_data);
> +		if (rc) {
> +			iommufd_struct_destroy(ictx, mock_viommu, core);
> +			return ERR_PTR(rc);
> +		}
> +	}
> +
>  	refcount_inc(&mock_iommu->users);
>  	return &mock_viommu->core;
>  }

Builds fine for me.

Reviewed-by: Pranjal Shrivastava <praan@google.com>

> -- 
> 2.43.0
> 
