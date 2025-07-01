Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C8485C5E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 12:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751373054; cv=none; b=kfLPj7jvhBspLHTXoj2ldF1uLyGRxWKDlISvnHaCKmu1rALk8W/t1xrFAALEGvrpwAlHs/EKSZ+mgYScyPxgsvnuRiUltdOU82459hhRA173ZvLFhymgi8KjvapX8Ej4KUKjifTF+heBgFNMyGhYwRZ5GVXclO429sTdgSyHlRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751373054; c=relaxed/simple;
	bh=oNWtBTfARcQCwaHYGLs5aIj0PBvFVGGFyKJg1UjJTYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KOAYgDIY0gFopnQXTLboc9lt+vg/PBH05ysrcBeepBD9G473x92/fR+oE76m1ykLQy+03OEhIHcwrWgikZhJUYcjuPC8QjHo6v8Fb2UHzRLzbKcw0oPc8KunV/p63YTyvyGH+ITiIgnf2GqUNJHRSm+JIgmT3HMe4FAjjX0ixKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WKbn0Nnm; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WKbn0Nnm"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-237f270513bso137305ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 05:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751373052; x=1751977852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5G5J3LAQCME/FJ/aVZc/0ZWGlfQeuCDS4lOhsOKRFGs=;
        b=WKbn0NnmgkzxUsdcaqhQqraPMyrURXHKnri5ElSn1Vkd6BoqcdJ+BpbWZHRjOlYZzm
         NbP4xOICMR07Egga4/fajji1H5YeNz8LkRGRQVi97jr8gxwK03VAeI/v76ao5vcEth2/
         I7qCPu1lO+z90lkSnZD9P1Bq2LYvwRcu+Jt8/iNmhfKNQf4oQTo7RZ3Ppc0QvlX3n31u
         zd5zLWVizh5Ixst6JzcJxBp8j0nExn9Cnhgd9KuYQIpBsfjHvJF50X+gLlRo7wpe4x+B
         iuwMl6EycXVvvzBFEXVjcmCHNaGj/of7MPz3Bvvxz7M7DeNs0ch+lolEIsPjbZaLjtJl
         YtUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751373052; x=1751977852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5G5J3LAQCME/FJ/aVZc/0ZWGlfQeuCDS4lOhsOKRFGs=;
        b=a1b9dNfHWgIW48YjCb8W0BUfCEj/gBi93Fr95XuygMz2jI3k3nPqYqYhUn6yArMrL3
         gB3tmRA9gjHPinyyze984IKwATdJ8AQ+za8KMrpTmhl6mTG9e++4Qya1y52mvCvO02Rk
         hXUegWnj8iNuRSFr/byDtUJNPczBmXy/65izL8z4ZSm66lWoxxe/TModODUxya5Tsyv9
         Hb5WL0cbDAG/l9zm3xYjYH6j7N5/mHQScIJTjegBSHQ9fvI6KatuZLgvyezYaY7vXYzJ
         7eCODa2k6jjYW11FBXx7KShJEIVT1l9Mw3DLTYnakIWpCC+/5jP1fypmjSlixIyQSoob
         /zvA==
X-Forwarded-Encrypted: i=1; AJvYcCWDVQw8IM+tDXzFhI/yDOC+nNZO0b1AcfDQHynOXjqz4eMVeC59TdYBbjGQjaGJH7H3YGofu2oYMexkFQs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKRDCdUK1T7o6gZHfELEQatIrHJAw6bT8FZi9cxhKlAE+9jeF8
	O0GhChqbqEBO/d2Ob8+lVwMU2rpq6utMOnA2psaCUSVPaECxUBxUCAAvOCgNB1rN2g==
X-Gm-Gg: ASbGncthd/YOu8F+0jfySv/51MNNisGM3yG+cJybX8sa6a6KWhrgrvcyZLoUMhIXtQ+
	/TawemKFQodQa51Cc2uKHsKeeU+9Tw9aR7+ZiT98EhWYTk+355O5ib7WTSELxXK4ZsH9KpKWmq9
	FLEzFPzzi9Xu5WBpaya4fX/jnjVQvdFKhhoDjWKTe3UnVEXOpADey4vdwcguo9gOQDhYkV8GfwM
	7e6j4OsNELYkCB7SFXkb9HeFZjWNS8WikjgqXd/RzuyI0XTgvoiSk7DwexvpdbBl/jcez8Xhl8n
	KeMxDNWGL6siyGLD15kk4xNu9JKO28TZ9CyrB78zo46Ri4dv4mQk+2z0XgxTozaoTb4yAHLRNBy
	lx2hec/l1/JjtAV1hJQWz
X-Google-Smtp-Source: AGHT+IGYS+ky70yGGbfgecWTu3WMn+4HvkqtKADO91HI0LqScQKuEGTHZn38lZjYqivfuwsxMW7HzQ==
X-Received: by 2002:a17:902:ce89:b0:235:f10a:ad0 with SMTP id d9443c01a7336-23c601a7645mr2227915ad.28.1751373051941;
        Tue, 01 Jul 2025 05:30:51 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e31da818sm9319671a12.61.2025.07.01.05.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 05:30:51 -0700 (PDT)
Date: Tue, 1 Jul 2025 12:30:42 +0000
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
Subject: Re: [PATCH v7 02/28] iommufd/viommu: Explicitly define vdev->virt_id
Message-ID: <aGPU8qgfsa816eQ1@google.com>
References: <cover.1750966133.git.nicolinc@nvidia.com>
 <cc7a558bfcdce5c2ea0d53b0c9c382f944df33ce.1750966133.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc7a558bfcdce5c2ea0d53b0c9c382f944df33ce.1750966133.git.nicolinc@nvidia.com>

On Thu, Jun 26, 2025 at 12:34:33PM -0700, Nicolin Chen wrote:
> The "id" is too genernal to get its meaning easily. Rename it explicitly to
> "virt_id" and update the kdocs for readability. No functional changes.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/iommufd/iommufd_private.h | 7 ++++++-
>  drivers/iommu/iommufd/driver.c          | 2 +-
>  drivers/iommu/iommufd/viommu.c          | 4 ++--
>  3 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
> index 4f5e8cd99c96..09f895638f68 100644
> --- a/drivers/iommu/iommufd/iommufd_private.h
> +++ b/drivers/iommu/iommufd/iommufd_private.h
> @@ -634,7 +634,12 @@ struct iommufd_vdevice {
>  	struct iommufd_object obj;
>  	struct iommufd_viommu *viommu;
>  	struct device *dev;
> -	u64 id; /* per-vIOMMU virtual ID */
> +
> +	/*
> +	 * Virtual device ID per vIOMMU, e.g. vSID of ARM SMMUv3, vDeviceID of
> +	 * AMD IOMMU, and vRID of a nested Intel VT-d to a Context Table
> +	 */
> +	u64 virt_id;
>  };
>  
>  #ifdef CONFIG_IOMMUFD_TEST
> diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
> index 2fee399a148e..887719016804 100644
> --- a/drivers/iommu/iommufd/driver.c
> +++ b/drivers/iommu/iommufd/driver.c
> @@ -30,7 +30,7 @@ int iommufd_viommu_get_vdev_id(struct iommufd_viommu *viommu,
>  	xa_lock(&viommu->vdevs);
>  	xa_for_each(&viommu->vdevs, index, vdev) {
>  		if (vdev->dev == dev) {
> -			*vdev_id = vdev->id;
> +			*vdev_id = vdev->virt_id;
>  			rc = 0;
>  			break;
>  		}
> diff --git a/drivers/iommu/iommufd/viommu.c b/drivers/iommu/iommufd/viommu.c
> index 25ac08fbb52a..bc8796e6684e 100644
> --- a/drivers/iommu/iommufd/viommu.c
> +++ b/drivers/iommu/iommufd/viommu.c
> @@ -111,7 +111,7 @@ void iommufd_vdevice_destroy(struct iommufd_object *obj)
>  	struct iommufd_viommu *viommu = vdev->viommu;
>  
>  	/* xa_cmpxchg is okay to fail if alloc failed xa_cmpxchg previously */
> -	xa_cmpxchg(&viommu->vdevs, vdev->id, vdev, NULL, GFP_KERNEL);
> +	xa_cmpxchg(&viommu->vdevs, vdev->virt_id, vdev, NULL, GFP_KERNEL);
>  	refcount_dec(&viommu->obj.users);
>  	put_device(vdev->dev);
>  }
> @@ -150,7 +150,7 @@ int iommufd_vdevice_alloc_ioctl(struct iommufd_ucmd *ucmd)
>  		goto out_put_idev;
>  	}
>  
> -	vdev->id = virt_id;
> +	vdev->virt_id = virt_id;
>  	vdev->dev = idev->dev;
>  	get_device(idev->dev);
>  	vdev->viommu = viommu;

Reviewed-by: Pranjal Shrivastava <praan@google.com>

> -- 
> 2.43.0
> 
