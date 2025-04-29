Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0C82550AF
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 22:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745964366; cv=none; b=Ttep4a7sd40ddSgzV3cvvWZoT5d9mLqeQLbWSmlXFubJhDe0ReYHqBIAZLhiS21GXE1z/Iye8ZfNzLE5f1NmatbP8XHAFCwKmRdeij6ygGDFCR7haMY/RhHkEFV0TBj4kHhHxYvRif959e37/Orz+wF40WRkoaXRJaMPeiOqFdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745964366; c=relaxed/simple;
	bh=V0MjIrRRnJ7qPEsKlGIcg2Ppi1C1SKM7n+g7Vbf2skc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J6ApSqOESn7bmygtM06IaM7jUEjX41PihpB0VK+DXQt6UQEjXjx2OuD6d5sKsw60av4TksJy7ZWLt+du7qrV/gAY8LiPvBAb+Tg1ndl1UMA7EEGbi90bMpXJvms5g6I4Fbml9q0dLGkKngGQnBe2rth0W5zrI5+jb+iiyLBSA8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lPd2kfDu; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lPd2kfDu"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2264c9d0295so242295ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 15:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745964363; x=1746569163; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R47AcAvcUPYEXwZnHLXErEx0+JYbAettmKys/t37PLc=;
        b=lPd2kfDuc9nZmG7xpAUOKMVxZ8EzDzMEgogY3cj6kyJDvQz1bnlw/zjrRDqTiWzupw
         sFOWMx7C5cF+3EqP0rvBEjBgT8rOHXN+kB8Sch1EpnV/pwBRhQC4/JeQks2mchCwuv5d
         JI/KxKN9hnBcZ4r7bCxuZ7Pl0FVQ7OJHv6pxjYKM5QVcOsn6W3/uAsUNyXRSBpvSysaT
         HewnD01tsxuh/2t+h1WogrdylOihu1k40RH28rOmX9XX4mTNK/O2uo8BRs51lZNr9oNB
         KOu5/YkNmSY7Lk2JGJ05sgkiSxyFCb60aH0+XynzQlXV4PMTAEMasYtYqotspOfx5LGL
         Sn3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745964363; x=1746569163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R47AcAvcUPYEXwZnHLXErEx0+JYbAettmKys/t37PLc=;
        b=vM1PlFBjeguRotTqbA0rjsdCYFVxT51zyRDtVN19NsWnAbuZ5NeO98XXo4qeNnBWI7
         +jUslht39hAPe1xEUb/8ZYxpCRub22gRjegMGPTc7rBpe3Koqv0pSgDwJX2p4sJ5A7Fk
         FuBMgPKbTeLmol7eUAQud85Y0znBa92jsV9Ac01j4hmlK+8aJ2TOQhQZ0YCo4Jvj8/ja
         /6qFJbV3d5twW6d1TuOPNM74BbWv6pcqpKOE9arXJNG1vATUGOVhmBulNlQAK2xGNL+1
         PCT3koOANzYD/dfgOG92JKPoCJUNXNIxFmetOMrbRLxgVaOIh1+Im2Biam0sXD/Xyc/c
         1eTA==
X-Forwarded-Encrypted: i=1; AJvYcCX21ewA3XJ95o6NDx9NyRlYoX8I6gzKmBhRYN+12ZEiNeJyo6foiqRNs7PvTEIiiBu1Wn4Ny63gL9VIcSw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZwGu3iSihCyFgM94DHoxo+uXx6EclSoB4d/6i5kb4ouhRcMjv
	Of0PL34/GNapael0WsrdGtfprpt4PMJcgaclNVk56FDEKZLun0+tKAv1vOeZ1g==
X-Gm-Gg: ASbGncs+uBUm/0B5uWyU4AQHfkZzPvzphC6dlbytoHHh4+tCOd8HpJfBzzN5Hb9P4If
	PX9ckzGvCQwKWoeuA6YHi57y2IH850gWGfLCr0b0pCBs9ya6kDxklwJuqDvEdXIUEcHCg5Dxeid
	hKLg+P/2zEYRAxk3VNabX2sNDChkQZpcrbTLTUT73tFB3LOFwNwGYSfgot8olGXUjWVlJGD4g3R
	YGZMJ4r7OW3lpDUFtrYRJ3Vg3tgb1MbpydWLc/ufaZmr2c0vObHOC+t4/yCZ7Va/pNSLvfPGu7B
	JS42CiI5wUZnLNPpxbx+SqEvvzGnpsu+urNpLoDc1lg/Q48NoMaTv3AAhTMvtTnQ+U/YtMVL
X-Google-Smtp-Source: AGHT+IH6piFbPZPJtlfgLIuHdj3oSeyNguwt8iF17ao/opI6U18w7y2m7t4fquT0Dch2XSA/jTVSww==
X-Received: by 2002:a17:903:41d1:b0:21f:2ded:bfc5 with SMTP id d9443c01a7336-22df4076324mr1004945ad.28.1745964363012;
        Tue, 29 Apr 2025 15:06:03 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5100aa7sm107720575ad.161.2025.04.29.15.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 15:06:02 -0700 (PDT)
Date: Tue, 29 Apr 2025 22:05:52 +0000
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
Subject: Re: [PATCH v2 19/22] iommu/tegra241-cmdqv: Simplify deinit flow in
 tegra241_cmdqv_remove_vintf()
Message-ID: <aBFNQFVbxyr596gB@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <7c180fb751def39cbc8634b08b65c3f26ad73833.1745646960.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c180fb751def39cbc8634b08b65c3f26ad73833.1745646960.git.nicolinc@nvidia.com>

On Fri, Apr 25, 2025 at 10:58:14PM -0700, Nicolin Chen wrote:
> The current flow of tegra241_cmdqv_remove_vintf() is:
>  1. For each LVCMDQ, tegra241_vintf_remove_lvcmdq():
>     a. Disable the LVCMDQ HW
>     b. Release the LVCMDQ SW resource
>  2. For current VINTF, tegra241_vintf_hw_deinit():
>     c. Disable all LVCMDQ HWs
>     d. Disable VINTF HW
> 
> Obviously, the step 1.a and the step 2.c are redundant.
> 
> Since tegra241_vintf_hw_deinit() disables all of its LVCMDQ HWs, it could
> simplify the flow in tegra241_cmdqv_remove_vintf() by calling that first:
>  1. For current VINTF, tegra241_vintf_hw_deinit():
>     a. Disable all LVCMDQ HWs
>     b. Disable VINTF HW
>  2. Release all LVCMDQ SW resources
> 
> Drop tegra241_vintf_remove_lvcmdq(), and move tegra241_vintf_free_lvcmdq()
> as the new step 2.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> index ba029f7d24ce..8d418c131b1b 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> @@ -628,24 +628,17 @@ static int tegra241_cmdqv_init_vintf(struct tegra241_cmdqv *cmdqv, u16 max_idx,
>  
>  /* Remove Helpers */
>  
> -static void tegra241_vintf_remove_lvcmdq(struct tegra241_vintf *vintf, u16 lidx)
> -{
> -	tegra241_vcmdq_hw_deinit(vintf->lvcmdqs[lidx]);
> -	tegra241_vintf_free_lvcmdq(vintf, lidx);
> -}
> -
>  static void tegra241_cmdqv_remove_vintf(struct tegra241_cmdqv *cmdqv, u16 idx)
>  {
>  	struct tegra241_vintf *vintf = cmdqv->vintfs[idx];
>  	u16 lidx;
>  
> +	tegra241_vintf_hw_deinit(vintf);
> +
>  	/* Remove LVCMDQ resources */
>  	for (lidx = 0; lidx < vintf->cmdqv->num_lvcmdqs_per_vintf; lidx++)
>  		if (vintf->lvcmdqs[lidx])
> -			tegra241_vintf_remove_lvcmdq(vintf, lidx);
> -
> -	/* Remove VINTF resources */
> -	tegra241_vintf_hw_deinit(vintf);
> +			tegra241_vintf_free_lvcmdq(vintf, lidx);
>  
>  	dev_dbg(cmdqv->dev, "VINTF%u: deallocated\n", vintf->idx);
>  	tegra241_cmdqv_deinit_vintf(cmdqv, idx);

I don't have access to a HW spec to verify HW behaviour, but the changes
make sense to me.

Acked-by: Pranjal Shrivastava <praan@google.com>

> -- 
> 2.43.0
> 
