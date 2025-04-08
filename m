Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7325A267B15
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 12:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744114164; cv=none; b=B7uT0Z7ISm0y8w9H/OzH5nFzNGJfyS12B4whLNMJV7iPchEd8dU2z5OfFIbVzUWNGL4LqNIRAvDe5GG+6BQQvA8jxX7kLXvoXn73naxLO7cJZVCK+vgmnrZe6eG7ieeNrsJD9mCZLuYwbeCVWRsWZaXg2jnFI4r2eYE8HAlxECU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744114164; c=relaxed/simple;
	bh=tpHAquJG4Dkb66PrhDikfbFF6dS5Oa2U69jSk8hSrEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FANjd8c1qoBYxS0hv2fWGXaC3rvQrOHx/KGD7yBZO6iRczr6rQzdGiwH/qh84Br+JLxsPXwRv0W5azKf2xxrftQiCX+HrD60Bc+CcAe25zdtBLZmvPwfp3cTkrVPK5zOUtfUmUzrJx/+Hwen9/zkcjOvfMM/oXkw+//FEsgK7fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=E7RGiRxy; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="E7RGiRxy"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4769bbc21b0so48805341cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 05:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1744114160; x=1744718960; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EvZTf+A2Tig+IRGHQAjPjWtgFVFDb9fydbEYyz2o1UM=;
        b=E7RGiRxyovccSIds7l0fV9OmSI8f//tO8n2FOjd2DP3eND/loUU+ckgmZNRyZNte2q
         kCO1lqZx29XkbLN/XzEO27PqyTSw4cUu3g9uX8THUmcolnntWmTTyXPm+cZsGOTUKJyZ
         G/DrxR2NWltzEQg5ZvPiTQM0FX1Zfw0TT1KBN6058iHDKUnftpcXn7HUaplg4m9Pspby
         7QJJaCEJvxcNWV3gC6azGIJ+aqpSrrINXp+nCvhRsXynvWAoa+/9tCLfyMhNiwsY18FS
         eOAmx4+OS5X19wInISELUYn5mpsHRLn7ZYmM4RdCeqU45U75KYLx995IJAivxYl9Eo9o
         RXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744114160; x=1744718960;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EvZTf+A2Tig+IRGHQAjPjWtgFVFDb9fydbEYyz2o1UM=;
        b=D3vjCDOSg2VqpvAlm1zm/McJV23810jdb/EzrSqMSqJ9Q6Hlnk2yuITbbap+J7aCoT
         GAbqapdY19F/bnwfIs12vNqnew0PV228Adt7n0cTzof/5TcXfvowkHVCIJinI+cjmGRx
         b0rkv2JgfPGrZOLE7uluteluP4uPtNo1JWs7414xkO1bF+i/LRG5N64XD8UxsbBiUuaY
         MTg9u4hpmMj+Y4CW0ho7n1MzTVHCJiBqOFgZB9mG+If2m8joG/sVoVP/tTpMfm/EqP/u
         A/X/AXU4EBSCLjFpDpjQHa2O5rRlOo1N0n1tTWiGzZ7rVVK7dMVDcP+y3g1QVhSYexnt
         axUg==
X-Forwarded-Encrypted: i=1; AJvYcCX8MQgqtB8TsOB4Dd/gx5PSR4RNqEEGKnCC0BiF4n/KJTo6eFfMDh2QZiPkFIlktck/sUBQ3ZAlLf/nhlY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsdxIjGHQD4z2l6H1We8t+hawl3P/1L+qAREP0XTiQiy4fOmTx
	t/hzo8tnAj1vE3QEGvgUhjPvnN+UQ/A+XPQsoVmLJ0VNMCLYREg2NOxJirWQsw8=
X-Gm-Gg: ASbGncsUKbq9YwPY6Yuuc6FF3vsQmcdkxp+cFBU5DPt+feHchdwQdTOyOc7FKdBCMgO
	D1cOaqlNGWTpm+Oqkmr5qRA3qIEsaUPVqPmoktO/Aq6IDgXcOL0iifAunlLVrBBMeyDqwWKXw1F
	m47i78hN8dyIkyy7zSrHk8Dem/oASdLuGHwbdQE/Em4CsXP2BNsGP+Zqi/edJ+anhlWLlOs47bb
	PTmg9uod80XQ9bU9HORA4EB6pSUVJ04HNcMG41e6B+EQZX+9j2KCTimhvwrBlPtY2b5zqaTX8XT
	eAkKDL6FQeoRnPXS+pTUOHBGU732pPnMFwIgVJxWVDUC3hyAfCsPgrQro27TgZrQgvnVl0Oe7qE
	xZ3VsCGM8FLNbH2adn9M0KJpP6gQBcOVakg==
X-Google-Smtp-Source: AGHT+IElwz6ZYvtcmCNJZ23hEjFuxJMkyHm7q2gsXSKL95/zDdGVqmGJmKoKERZUukK8jrmOAgtPdw==
X-Received: by 2002:a05:622a:394:b0:476:77a5:3104 with SMTP id d75a77b69052e-47930f6f3e1mr204130021cf.11.1744114160142;
        Tue, 08 Apr 2025 05:09:20 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4791b088544sm77395201cf.45.2025.04.08.05.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 05:09:19 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u27lX-00000007fyn-0hJN;
	Tue, 08 Apr 2025 09:09:19 -0300
Date: Tue, 8 Apr 2025 09:09:19 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, will@kernel.org,
	robin.murphy@arm.com, nicolinc@nvidia.com, jsnitsel@redhat.com,
	praan@google.com, kevin.tian@intel.com, ddutile@redhat.com
Subject: Re: [PATCH] iommu/arm-smmu-v3: Add missing S2FWB feature detection
Message-ID: <20250408120919.GB1727154@ziepe.ca>
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

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

This should go to rc

Jason
