Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F947227BA4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744015446; cv=none; b=UNIkXm55UCHqiLa65ZAb44CXLQ/R2p60yI6OrkO43WM/RvYCaBqNUc1RRSxouDccfIsmOXFOLU4/5vrHlKYLOZb2k1nzko9hVaiy0edGlcON0jiN3ioLEKHzEdnQyfzP5ykj9gVFbynFuu6Kkff4reXOuX7PMItGThPWhHHz/Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744015446; c=relaxed/simple;
	bh=HE9aqzr8e2stgYa2HwRFP2Sto99ygzQH+LuBXRw+IdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b520N1LwP6VHDDjmQUIohCBf7UY6orKos4iNEPaZrRq8pFsvrwsoL2+V7mFjTAynVPTXFVsiBOyXF9QDT8K2uzhU7zxvxix4xgeB2aq20Ejij/iDUu3Mjg92/FCorV7N+Ir8NvCFDFl2QVZVeZEvgKc5+wVZDrL17eii02yrCPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HvnGnkRL; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HvnGnkRL"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2263428c8baso325155ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 01:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744015444; x=1744620244; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DZGfkkPmnNx5Vcse4K7FbD7duuc9vXIWCD4w41JK8tg=;
        b=HvnGnkRLo7m4jgSrOAEsQz75tHzboENGphLmhyTwwyz+YT/ef12KcYoqDkTLWN1Qkv
         N3sYYPN6LXOZwVD6ZUaGeTabJNRj4TmikcRerzfbeicxcyoZyFcLMNNss7T86FMMsUI/
         twxpN9hHfzA+MyYsjba8Yq1MLalmREZTOCTrqs5VNZ84A9PVRp2vV1OTEOtDmIaAVPQP
         eS94mX/S2nE7C2hPRn0MiDvgpqd7d+lIcojD995+LUBTT/LMQEZ9TfVpockyaMYpcdUN
         Y8syG9wSZjAkMoLG7Dj40jmE93eqjOJSciqhAhpXchCv9/9dUN9926FVzXE0RH/1bE9X
         CVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744015444; x=1744620244;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZGfkkPmnNx5Vcse4K7FbD7duuc9vXIWCD4w41JK8tg=;
        b=sV532ejZMZgcLjNmbnOBG8z1VL1KK60UwTLtKXYg6bIFxipf9yS/AjL4ABVT3hQHXe
         wK8nPsdkfT28YxMfQtbOOX2JzDTIE5OU+sFe4zEeog4K4v04STXGOvVFhyjSE/I5Vqsr
         rkk6fp1WV+HbZRPyIPXpviLEGUW68eSqnpWBhzJ7aOUghrn1Eg0yJplG/lBgdiKh4iff
         IPBz7xXO9K0xMLbemLMcN8Gfqouw7cwLHCDDNefFR/eQCssJGeMXu2vDN5pO6V3IMU+A
         2mjxQeGcf3Gp3RvJ17TNCz+8/XKSP/55EFuDe7EHk21riCpUtUuMz+SY3cyBBVSaNOsf
         G40g==
X-Forwarded-Encrypted: i=1; AJvYcCWgLLW94+Ihxy3uXHJRt0Fe6pVSLldHCuJoJKk7vhbrDC0Ka+DR6+CVNUqz7nLxbNzP63/cB5UpIYEyR1I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3/XNXnJ2lcQGu3Dfj4BqhYfeFTjW8jtIVQuHzs5hgnJ4NP5sD
	Zv32TUWGjJUglSyILal2IcA3TyA16munP+Y/N0aXnxDNuT9dxROx5uK5zC8iBA==
X-Gm-Gg: ASbGncs2/6BNIf6OXGqyvE9hufU7sdjTtXlLmXygU9+6W8mQd3LtDihvPSAYy/okX6x
	iQmRq/dURQlFmWLKyb4JObL+SRtxzSq5Drp4oUQEUprvlGBo4hvKEd+MgxetPUR3rR6ge42PBUd
	Z/v5dxN1azNYYCoVmdxJ8ueKlfX4CN074pF7+3UVl2dv0v5l9M1RkK7OBu9X/n1ozzW6NKiTbyA
	+/k4ARTDCGig04uLMnHTAt4S/qyP4QiROlyaSSZt9MfQrjujEayYLylmp2FRu8I9RHYdPOOzMxa
	+xuQO2v83Wy9lCzQ87CK+Rn1yszr+blaF5dOZNYvm78yMqc1UUrHL5RzhkCmxqNOk+JbQHYKZB9
	fNmmqZi7k6dnSpQ==
X-Google-Smtp-Source: AGHT+IG8wjhur4IfqDYDYICfFUkplKu7lJpQ3Db3dou+cam/uidrheTR7PdDzM6iKfGDeqVg7o/0Iw==
X-Received: by 2002:a17:902:c3c1:b0:223:37ec:63be with SMTP id d9443c01a7336-22a95e499damr3284425ad.4.1744015443341;
        Mon, 07 Apr 2025 01:44:03 -0700 (PDT)
Received: from google.com (188.152.87.34.bc.googleusercontent.com. [34.87.152.188])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3058494a321sm8298964a91.19.2025.04.07.01.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 01:44:02 -0700 (PDT)
Date: Mon, 7 Apr 2025 08:43:55 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, shameerali.kolothum.thodi@huawei.com
Subject: Re: [PATCH v1 2/4] iommu/arm-smmu-v3: Share
 arm_smmu_cmdq_issue_cmd_with_sync() with vsmmu
Message-ID: <Z_OQS-4P8HfL7M4s@google.com>
References: <cover.1741150594.git.nicolinc@nvidia.com>
 <e9e8df0b9dadfb8c716b8b9072657327ab14898c.1741150594.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9e8df0b9dadfb8c716b8b9072657327ab14898c.1741150594.git.nicolinc@nvidia.com>

On Tue, Mar 04, 2025 at 09:04:01PM -0800, Nicolin Chen wrote:
> Allow arm-smmu-v3-iommufd to call it for S2 cache invalidations.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>
Thanks
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h | 2 ++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 4 ++--
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index e08c4ede4b2d..3336d196062c 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -984,6 +984,8 @@ void arm_smmu_install_ste_for_dev(struct arm_smmu_master *master,
>  int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
>  				struct arm_smmu_cmdq *cmdq, u64 *cmds, int n,
>  				bool sync);
> +int arm_smmu_cmdq_issue_cmd_with_sync(struct arm_smmu_device *smmu,
> +				      struct arm_smmu_cmdq_ent *ent);
>  
>  #ifdef CONFIG_ARM_SMMU_V3_SVA
>  bool arm_smmu_sva_supported(struct arm_smmu_device *smmu);
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 310bb4109ec9..0462eb1b2912 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -929,8 +929,8 @@ static int arm_smmu_cmdq_issue_cmd(struct arm_smmu_device *smmu,
>  	return __arm_smmu_cmdq_issue_cmd(smmu, ent, false);
>  }
>  
> -static int arm_smmu_cmdq_issue_cmd_with_sync(struct arm_smmu_device *smmu,
> -					     struct arm_smmu_cmdq_ent *ent)
> +int arm_smmu_cmdq_issue_cmd_with_sync(struct arm_smmu_device *smmu,
> +				      struct arm_smmu_cmdq_ent *ent)
>  {
>  	return __arm_smmu_cmdq_issue_cmd(smmu, ent, true);
>  }
> -- 
> 2.43.0
> 
> 
