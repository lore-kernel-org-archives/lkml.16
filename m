Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC2120330
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 05:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744090252; cv=none; b=mt1CMF/DzOeRtWau5SLdDuy8FF4GIjh2HeaoLBRxbS+HIhQLn6GfPInsB+eP4p/QWNRfEWbHERNRlhK7TJiDaOV5eRXbrTFckaOHqtQnbhKaQR55A/f1sStqpzSz0zZygyAxJcNEs4OKd/8plnxHesuEwOlANTWo7CWJdQCYxD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744090252; c=relaxed/simple;
	bh=vs7thu9ZGjlYIf6x+aITyKdaIi50BAkOES4aa0JW7Ac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dcUj/t/QrunrgX9D22N9sf29u6NSR5Hnc9O8gB8zDoQ9RLUfVCEwWLPwlEUBKfM8W838w+PjtaS7cA2uAf8sLBGhZf2Ho5uD29k35UIDH2ZPOH/wVCVCOheu+9qto8h+VkpXU5RV+BC1jmJkWviU6XRYeI7dwZlJHLquZrLYKBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KqhvpYe3; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KqhvpYe3"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2240aad70f2so151745ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 22:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744090250; x=1744695050; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iIblNaCDqbuIOdoWiMsvT5bzQtdq7ut/Mrgb9e4M8PA=;
        b=KqhvpYe3agxIdALzddfYEFQWdCXmxSJED4EVqgKz+w+Y8vjXHb5MbbegpWaUb0JCL5
         GpoH4wDLdmopMPENuO5TBHK8GoR2mQYNzDgco/WJvZb52yJohWpHikd+bhd4iLW0VZYU
         IJp2DSbIFtz6/qvz6IhcL2Rag3OIpeUryNuULWNVEmAe/8jlVqzNPZu7mkECQczWy6sO
         vGuDXtmS+fRj/I7wkb4b3OU6USC9M3sQKrGUy5AleZ7EUW/EO4vVHwjtSJGdPdMnwKT7
         7DL4tY9s446hVrSj0Ve51+pQR4BZyRpBqtVwqAAqRiQNCZcJ0FkSl6uthC8O+5NzyKZr
         RTFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744090250; x=1744695050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIblNaCDqbuIOdoWiMsvT5bzQtdq7ut/Mrgb9e4M8PA=;
        b=ZCWCEA2sp/Pm7tPfuUlggqv1cbhiqlIVupYWTR2Tx5A6n84HjGZkMcwMKMBHe8pDde
         MnblmjqWiXbXvqy5KAXnmKAUFuY/gQIApmjANVbIN7ZZzln6c5NDKw7ZgX52AwsFmDjl
         ozcpk4tLabgmb6AlUNg3oxM/rcDp2TpjyVKSpG3yJNuj2bjASwARCeI4vGMgynvygZiY
         owITHPXAJyiPZEEY53kGLHCj9IbF6FFtVL1MZs+lrXg7n/Bqi+GbL6DTcNvQTpgwzHnn
         oeeZ/QaMx37OvFzNFbc6e3qc19zc+ON7LCj3xdXZYdl8B/u7KD0MWuviuvmLWnrtMQ0e
         gRUA==
X-Forwarded-Encrypted: i=1; AJvYcCV4qNyvhjPe5JSvYC/3xfA4P/Q+sTgp3G4iJCWdjbeFRRy9AMMq76M44dzpcSY4nJnx4+ICBNoqdKav4W0=@vger.kernel.org
X-Gm-Message-State: AOJu0YysvWm/4yYIv8uXIbg+gFzacgykAZPS7qeL5JOywvXAmrfXMMuL
	T2VL6Tzd+kOpRvJeXMTNmH3KT5BIi6elBEoaPOlYBsCKk+lvuMdj10nF1SQ/oUeMyGzDl+MCsxb
	kug==
X-Gm-Gg: ASbGncsl0b/79ea616QgCxL2mhyFSXVWIBbkydFt4xYVCtMJsiQ8xr+kwaqy2kG5WXx
	xjSbUedR9VIODETIC+8T8t5FCVANyQCbHtW02MjgFUh1c6YFQJwA0gdeB1nBWAk//4Dfzf3zEk8
	BzOIwjNqysCcehatdtgpwmWj8TlLotAIQPmliL2NrDG35HSdR0Bl9UKwLDcqFzqZHUDyhikLy8U
	0F7+4v+3YwgJtHLNgtHnoo9VuLImavsmp2w6GRIlFW7TJHBVs6Nzlct5zrISEwKdSgw+DnmW23+
	G0MW7x2VbAQDkOgavCMLSy9ZqOjTMKUR/XXwo4m/IfP0uOggfa/xeomgd4hFenIjVReg9CU5Y92
	TzfA=
X-Google-Smtp-Source: AGHT+IEVENxuSQ9koyTDCtEVC43uFdSdVMF6wPG/+02fUSwR03JHFDiN0ICdqRcuMfCQhrHrrYOGyQ==
X-Received: by 2002:a17:903:22d2:b0:223:3b76:4e25 with SMTP id d9443c01a7336-22ab804c493mr1114505ad.17.1744090250071;
        Mon, 07 Apr 2025 22:30:50 -0700 (PDT)
Received: from google.com (188.152.87.34.bc.googleusercontent.com. [34.87.152.188])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97ee90asm9907314b3a.57.2025.04.07.22.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 22:30:49 -0700 (PDT)
Date: Tue, 8 Apr 2025 05:30:41 +0000
From: Pranjal Shrivastava <praan@google.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, will@kernel.org,
	robin.murphy@arm.com, jgg@ziepe.ca, nicolinc@nvidia.com,
	jsnitsel@redhat.com, kevin.tian@intel.com, ddutile@redhat.com
Subject: Re: [PATCH] iommu/arm-smmu-v3: Add missing S2FWB feature detection
Message-ID: <Z_S0gVMuAqrv3R_v@google.com>
References: <20250408033351.1012411-1-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408033351.1012411-1-aneesh.kumar@kernel.org>

On Tue, Apr 08, 2025 at 09:03:51AM +0530, Aneesh Kumar K.V (Arm) wrote:
> Commit 67e4fe398513 ("iommu/arm-smmu-v3: Use S2FWB for NESTED domains")
> introduced S2FWB usage but omitted the corresponding feature detection.
> As a result, vIOMMU allocation fails on FVP in arm_vsmmu_alloc(), due to
> the following check:
> 
> 	if (!arm_smmu_master_canwbs(master) &&
> 	    !(smmu->features & ARM_SMMU_FEAT_S2FWB))
> 		return ERR_PTR(-EOPNOTSUPP);
> 
> This patch adds the missing detection logic to prevent allocation
> failure when S2FWB is supported.
> 
> Fixes: 67e4fe398513 ("iommu/arm-smmu-v3: Use S2FWB for NESTED domains")
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 358072b4e293..c7d297ceabdb 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -4405,6 +4405,8 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>  	reg = readl_relaxed(smmu->base + ARM_SMMU_IDR3);
>  	if (FIELD_GET(IDR3_RIL, reg))
>  		smmu->features |= ARM_SMMU_FEAT_RANGE_INV;
> +	if (FIELD_GET(IDR3_FWB, reg))
> +		smmu->features |= ARM_SMMU_FEAT_S2FWB;
>  
>  	/* IDR5 */
>  	reg = readl_relaxed(smmu->base + ARM_SMMU_IDR5);

Indeed. Looks like setting the feature flag was missed previously.

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
