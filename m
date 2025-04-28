Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3A51DE2B5
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 17:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745862759; cv=none; b=lQ0XLmxrPRIeouVA8JR2SvzmrQhNYcnhnhK0NZZA4PgbB2rhEHUi7SicKKBbMnO32WzHN2DLZKaZsdBy3Q/UhRi9uB0rZ3CborCrq8wsa3wJNyQRsjtsfizu7iHEeSq6xCQ6m57bU61OrdBZB4G5UY9einXyvSi5icaZ0ARjyDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745862759; c=relaxed/simple;
	bh=tlXItLWYzM0MSceJkd0MV2mZMr+DBkTlO0xigxKGaW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UxbpW28pIyniMgA/GYRn57O67Rd3VpJSToXkLQdcZ1/PVCbKe0acRZY+kbV683s1/NcOBJeLa5edqLZoTHHWmJTuORFTBxNJipYhw5tpnP949rFxj/3gcdVtozkCWPVfbAt3L03zXeIxw9HPjbulW857u7CV+hpQwl1+eAFHga8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=znVVWzsZ; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="znVVWzsZ"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2264c9d0295so22935ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745862757; x=1746467557; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mXoy6sxPPZ/z2WrCrnWnxSxhkK1XoAbzd892zSPGLLk=;
        b=znVVWzsZkViwJ9KNktbWf0SVEF5noddR04XFaMmY94Zy2Xp2+D18rCgAGTGH1tVaqs
         TTyFi1VVrmWxZdr0LcmPaGtWFCemB5Vr4HzCt+SQOJbpsyeKqoQrkODdAXvAPgc6FcgI
         m8gf/hXk4Dm97gDdpRCGZMGEX4KlwN5Bc2SpDRh5aEfr2BDL+riD58djW1JpnFk5Xzp7
         uCDhmAH54yhLseams5OI7IDMQ2rQ9lO5eE6apAlkhTtzASG0t1ETlsqjNKHzpwxIk0U0
         +7K1gghkiN4zT5XsR3iE7fA/xJ0cgdcfnq7o+4ITt60LrvoNt5Y3znxW39c+OrVCGm/5
         5kgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745862757; x=1746467557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXoy6sxPPZ/z2WrCrnWnxSxhkK1XoAbzd892zSPGLLk=;
        b=Vuxe+rx1hp383supnMbgc7LBuXLlaSNIs2vFP/VEg/pSn5smAUmawAZvsYVr5cTmTp
         r02xIRFeHFm0We8rBdbVp58WrxkHHg7A7UybAc0tbS3zom1C4g2huPCkQk/wAziDB2mX
         1Ma3jBDJSA52fPJUaX/Lxy7y6g15I/8dnFF/jubYalgC4v+CmzAopYHf7mhm8Ra2WPhl
         qlU+1iHuE9tn2CfYSr/7hfPAWvfQUi4jhbsoRIyUOlnAaKEf1uCZvMySz3L+UeXBqYbo
         8wEPL9vHVYTK9RYGDDUcDYsOYNZt+j29gPZPi6Jmrnf7li/M32gKgoh1uYQRdqgIsYfg
         oWZA==
X-Forwarded-Encrypted: i=1; AJvYcCU4EgABG1nSpTI7WxLzwL1wK9qgrP8TwsOkv+oNA4A2YRpx4OC87YhiB22Zw/mH9tTczdY5gyxvuEgTvqI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+szLpMUnw0N2EbW9YnsD4AUuYsKQnIzK/87ltipp2XB5Vba22
	Uf5wZYVQlshnkxqq2XfKBWI53ZjDb0OCGbxw6pB73suq/lev1QzQ6iFsPTvDkQ==
X-Gm-Gg: ASbGncv3BiZIwXsKd8BKlsGZgd7STMLVEs9KMWEVnY2jSBlkDhkGl5/T80L6iyFhYQP
	k7tWL8b+HxNSvB01K8pGIlU+NvYEHFYWGqYWBIE9iH8LC/tV32dxw2fONo3TxE0tWkPmbRhvGxg
	xXX/nAy20PTU7Ai6ME6/4TzRIycEtxOGUNhhEXGxb9YUDMW3FmfzVNjI5INlFDQNsA23cf/wNAH
	Gbv6/c55T0jB6QNf7wO4qNk7Mbkm6NVXVzKSaqrFDyGkCMjw2SAmX+UEzWtiCoQfKiprY4VZAIa
	m9o4x/NM2/xJKFESLDIGB5NGizo7qpoqzGRpK/jQow1eblJOFxiIqcK8fMa5buB5KRrX49A/
X-Google-Smtp-Source: AGHT+IF7sSGBhp3GPgZs/6zIUASVzRs0/32vLn2f7+jmPw+exeJNlnbAKCbgqdOEVPuoFGNIT6O/Vw==
X-Received: by 2002:a17:903:1946:b0:216:7aaa:4c5f with SMTP id d9443c01a7336-22de6ebc2f6mr21395ad.3.1745862756998;
        Mon, 28 Apr 2025 10:52:36 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f77032f9sm7553154a12.15.2025.04.28.10.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 10:52:36 -0700 (PDT)
Date: Mon, 28 Apr 2025 17:52:26 +0000
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
Subject: Re: [PATCH v2 03/22] iommufd/viommu: Allow driver-specific user data
 for a vIOMMU object
Message-ID: <aA_AWhJGFWwAzRUl@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <7031ae5ab6f625e73dbd51b074c2ff8a9923c731.1745646960.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7031ae5ab6f625e73dbd51b074c2ff8a9923c731.1745646960.git.nicolinc@nvidia.com>

On Fri, Apr 25, 2025 at 10:57:58PM -0700, Nicolin Chen wrote:
> The new type of vIOMMU for tegra241-cmdqv driver needs a driver-specific
> user data. So, add data_len/uptr to the iommu_viommu_alloc uAPI and pass
> it in via the viommu_alloc iommu op.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Acked-by: Pranjal Shrivastava <praan@google.com>

> ---
>  include/uapi/linux/iommufd.h   | 6 ++++++
>  drivers/iommu/iommufd/viommu.c | 8 +++++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
> index f29b6c44655e..cc90299a08d9 100644
> --- a/include/uapi/linux/iommufd.h
> +++ b/include/uapi/linux/iommufd.h
> @@ -965,6 +965,9 @@ enum iommu_viommu_type {
>   * @dev_id: The device's physical IOMMU will be used to back the virtual IOMMU
>   * @hwpt_id: ID of a nesting parent HWPT to associate to
>   * @out_viommu_id: Output virtual IOMMU ID for the allocated object
> + * @data_len: Length of the type specific data
> + * @__reserved: Must be 0
> + * @data_uptr: User pointer to an array of driver-specific virtual IOMMU data
>   *
>   * Allocate a virtual IOMMU object, representing the underlying physical IOMMU's
>   * virtualization support that is a security-isolated slice of the real IOMMU HW
> @@ -985,6 +988,9 @@ struct iommu_viommu_alloc {
>  	__u32 dev_id;
>  	__u32 hwpt_id;
>  	__u32 out_viommu_id;
> +	__u32 data_len;
> +	__u32 __reserved;
> +	__aligned_u64 data_uptr;
>  };
>  #define IOMMU_VIOMMU_ALLOC _IO(IOMMUFD_TYPE, IOMMUFD_CMD_VIOMMU_ALLOC)
>  
> diff --git a/drivers/iommu/iommufd/viommu.c b/drivers/iommu/iommufd/viommu.c
> index fffa57063c60..a65153458a26 100644
> --- a/drivers/iommu/iommufd/viommu.c
> +++ b/drivers/iommu/iommufd/viommu.c
> @@ -17,6 +17,11 @@ void iommufd_viommu_destroy(struct iommufd_object *obj)
>  int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
>  {
>  	struct iommu_viommu_alloc *cmd = ucmd->cmd;
> +	const struct iommu_user_data user_data = {
> +		.type = cmd->type,
> +		.uptr = u64_to_user_ptr(cmd->data_uptr),
> +		.len = cmd->data_len,
> +	};
>  	struct iommufd_hwpt_paging *hwpt_paging;
>  	struct iommufd_viommu *viommu;
>  	struct iommufd_device *idev;
> @@ -48,7 +53,8 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
>  	}
>  
>  	viommu = ops->viommu_alloc(idev->dev, hwpt_paging->common.domain,
> -				   ucmd->ictx, cmd->type, NULL);
> +				   ucmd->ictx, cmd->type,
> +				   user_data.len ? &user_data : NULL);
>  	if (IS_ERR(viommu)) {
>  		rc = PTR_ERR(viommu);
>  		goto out_put_hwpt;
> -- 
> 2.43.0
> 
