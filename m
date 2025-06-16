Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07581E9B08
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 21:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750110605; cv=none; b=biWSdGxYabiscv+3uTJmlcPchJjNb61A491UWFUTCCKj+iidiwvJM7pig3JDUzSGz/KIWe/y3b6DVhmiTRKesIvVODfE2uj4+2RTF6OV9nbD44u+gM/B4tn/gZka4RKK6LiT9Top2TkQ95qpKf1wjwibHxCv6wNgCgeKElztvm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750110605; c=relaxed/simple;
	bh=4P4+dDLseVM5kdBfJdd+5Th3NLvd1u4/4k+NujoyAVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pXEk2s5zlMmmheqV2VHk3nUQ4fqG68un4GA3voMXUdYF1BK9dCQVmPpCn8hNNDeCfW4lGCp9jiSfRg89m+AktxU0Bi1/WWw/Bcu6URaJNBdLlCHyOo/vGPsYBPE6VTFqzuvAdeH+CIpmhQQTl8J3tNq+OsQ9kXtRocLx+Vdp/v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0y1FfALI; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0y1FfALI"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2357c61cda7so20935ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750110603; x=1750715403; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nbJOiRet1tK2+kvy2xbNTvVOXK/uFfHNcA+YMImy1oY=;
        b=0y1FfALIVQE9RGlhfg3zrAN6jSZJNZ2H5UDJDpTBSdYyycGJwzqDeoxSEUg+UAn79M
         rJqw9iq9NUGPDe3Zq7aDUpuOzpBeRrISOJV4qEHGIXjGrPfxQNkqUQddy5o/d/yK99p2
         uMWnwnnE01twRsme29ckUNbn9ORs8Zl9z8qtB02559O5XQKJ/qkwmQsR2YNXLKdTSg8N
         JwBWUPDCieGLl5Sq/M6urPz8Dpz6iPcl4buchBoZOvf8EZvHNSSkUF04bdgToNJSx33p
         53aXhZ5rNQmRWgDFRTgg82nXFxbPsriK0MQNyezAa1ihTZA8/NuAJU6ZBnFfUweqbjKB
         t8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750110603; x=1750715403;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nbJOiRet1tK2+kvy2xbNTvVOXK/uFfHNcA+YMImy1oY=;
        b=glOZzV8g1FduqfBxn4kVHVeblbN4gA2BjP56u6ECCa8KPwJpKjg4cRFXPqhlAj83nG
         doqY1mBapxcsvJEMPwBtDmcg1xFxfqR8fBlCJ64MEFt2iuhSJoeqKw6wpUBz7zVNU2BK
         WmnM6zpS83rYJLtW7qDT0E2raeiLTqfgyuP9YwkjEu9HjseLmox6O7Nj4v/i7iSYTIiy
         n+i0/rZ2zsd0EuM7iAzbN9dRX7DLHF1ZnoggexABsYaLf5tLcCQtTMDD7stkIVko5uHD
         3FEx1+k1E2jnQJUPVbY2GnMy5+blW7zzKp8VyA6ldz3xCZYpAfdKjlB5U6zV1hWyEdLH
         ks1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvs0CnXpvTSyChU58RBmj0vgOfJcfT2WUZD50TfTlIYQv6ev0EtcZi556TOzfhGbwfTYRRmtmBSKVo4tA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMt5hUw8impJTtSBAHL4PJtRdbq3xb7jPjxgG7fqLqAnanc5f0
	yduSaY5G4TkUe3fM1QhlYf0TR8+//7JvcwI1ydmoG/zd3nN9aA6lfbQ6rbboR6UeJ747Iven2HJ
	kNpupKvTl
X-Gm-Gg: ASbGncvB6yEobigsu60I62ST6dKX91TQ2bnmvRBEyY2ViWmDRYsOjk5JkzNvt+xkAD3
	jn6cKCtVhRlx6mkDLnbtBBrpN2ej8mcgeb4crzJFY10YFj6U3OYwCl+r06FIE16NrfwX5MNWMzS
	49iFzai0SeXxLddQPb1P5zoSA0Jbb91MeoZ7oL3xBd3N5KP71Gys5zIdx7ZcyXwuxJ+qBm/AVyn
	Y5HUMV4+D8Hhylk3an9VB5ud/TKAt+PcEEsIfffEXPDZl4fFGbpfdqAfk49wgzZ2kqy8fX+JyAB
	GOgvS+8MrSY4OvaIyevGDgj9XsOIBAvSBIcxfrahh/2Mc4rW3UbR54EYr20AB30MjdYV298Ijzp
	nAlbcm8FeKmNLcoVvQ50U
X-Google-Smtp-Source: AGHT+IF5kh8T4/erotyg7EIWicbLom/nqSTy/PmeD+RjMgee3aQrbG4s0yxcVK37VjyTfpjXDUZbBw==
X-Received: by 2002:a17:902:e74f:b0:21f:631c:7fc9 with SMTP id d9443c01a7336-2366c4f491bmr6774135ad.0.1750110602745;
        Mon, 16 Jun 2025 14:50:02 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d88c1f5sm66411465ad.25.2025.06.16.14.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 14:50:02 -0700 (PDT)
Date: Mon, 16 Jun 2025 21:49:53 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, yi.l.liu@intel.com,
	peterz@infradead.org, jsnitsel@redhat.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev,
	baolu.lu@linux.intel.com
Subject: Re: [PATCH v2 05/14] iommufd: Return EOPNOTSUPP for failures due to
 driver bugs
Message-ID: <aFCRgUeP8NJ_f-Q9@google.com>
References: <cover.1749882255.git.nicolinc@nvidia.com>
 <623bb6f0e8fdd7b9c5745a2f99f280163f9f1f5a.1749882255.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <623bb6f0e8fdd7b9c5745a2f99f280163f9f1f5a.1749882255.git.nicolinc@nvidia.com>

On Fri, Jun 13, 2025 at 11:35:17PM -0700, Nicolin Chen wrote:
> It's more accurate to report EOPNOTSUPP when an ioctl failed due to driver
> bug, since there is nothing wrong with the user space side.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/iommufd/device.c       | 2 +-
>  drivers/iommu/iommufd/hw_pagetable.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
> index ed0dc539d490..e9b6ca47095c 100644
> --- a/drivers/iommu/iommufd/device.c
> +++ b/drivers/iommu/iommufd/device.c
> @@ -1483,7 +1483,7 @@ int iommufd_get_hw_info(struct iommufd_ucmd *ucmd)
>  		 */
>  		if (WARN_ON_ONCE(cmd->out_data_type ==
>  				 IOMMU_HW_INFO_TYPE_NONE)) {
> -			rc = -ENODEV;
> +			rc = -EOPNOTSUPP;
>  			goto out_free;
>  		}
>  	} else {
> diff --git a/drivers/iommu/iommufd/hw_pagetable.c b/drivers/iommu/iommufd/hw_pagetable.c
> index 8565a6f596b2..fe789c2dc0c9 100644
> --- a/drivers/iommu/iommufd/hw_pagetable.c
> +++ b/drivers/iommu/iommufd/hw_pagetable.c
> @@ -264,7 +264,7 @@ iommufd_hwpt_nested_alloc(struct iommufd_ctx *ictx,
>  	hwpt->domain->cookie_type = IOMMU_COOKIE_IOMMUFD;
>  
>  	if (WARN_ON_ONCE(hwpt->domain->type != IOMMU_DOMAIN_NESTED)) {
> -		rc = -EINVAL;
> +		rc = -EOPNOTSUPP;
>  		goto out_abort;
>  	}
>  	return hwpt_nested;
> @@ -321,7 +321,7 @@ iommufd_viommu_alloc_hwpt_nested(struct iommufd_viommu *viommu, u32 flags,
>  	hwpt->domain->cookie_type = IOMMU_COOKIE_IOMMUFD;
>  
>  	if (WARN_ON_ONCE(hwpt->domain->type != IOMMU_DOMAIN_NESTED)) {
> -		rc = -EINVAL;
> +		rc = -EOPNOTSUPP;
>  		goto out_abort;
>  	}
>  	return hwpt_nested;

Much clearer retvals.
Reviewed-by: Pranjal Shrivastava <praan@google.com>

> -- 
> 2.43.0
> 
