Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C9022CBD7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 12:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744027754; cv=none; b=VywNzZr6ZQhPTVQ252P6x768fUkjAMRhDukozLrTf/soER1FLHpLKdi698uqty0oH+wbxYr8ZA2eYttRDWufRVo2+ldDIeqQZnUMpzwpl8KAFOtMW4m4FHa4ECoGoS4yDfOFK5iww5HLF5bTFZB+2lxMBUHcB+D6HpYLadazsHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744027754; c=relaxed/simple;
	bh=sBCQHBDcAUpG17ddyItmIuUCIWSKR3D3zFJjSYLtoVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GbXz6uF3GJMnXoftM6XZ4tbyGkJKqUCSDNx7+KJVOpMfE8e5dYSjYuk+xovtfardRRbBGya4im7s0DYFxIlPcdwKUE144upvS7DWqe5R8dDcRck7F+fcqOS1TywSqxIBDxItesy4OtUVQsSuzAOmbodrFHpwlXl9scsjeundI4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O1QJa5vY; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O1QJa5vY"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30bfc8faef9so41102351fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 05:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744027749; x=1744632549; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m/LHFPsYBw0bwDf6dVcpDSJnHybANIimgmPtryFgNPA=;
        b=O1QJa5vY6mTfmLs4ycXkNd6aOG9TDOigmEPs4fGrs6HMlbtovJIojTYeLGjotYTCEi
         Nu6iahUJ6uSbz3VOCihPxCibWBcX53WqJWABSHx51ja9uZWjhVGK6+c2s0Xf84/jo0TL
         sIeRlZwEVDfcRnGsdTgXbAu5wIYRW02VQofWNVlYgUYF6FGFvJhvX+ny1je2EkvMmMDK
         3k3b7uqj4/3izloAXQNSCGOrJnl5C3ximExbC/8fyjr8Nqn5qhZWy6YgwdiPPH4QXdRB
         NbqhoiRDg1WssFrf8I/vOaF897YXt9zSMnkgOYRqlCGfaF2uukSl0YqXO1xA2WFFmNgR
         v+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744027749; x=1744632549;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m/LHFPsYBw0bwDf6dVcpDSJnHybANIimgmPtryFgNPA=;
        b=uN8BXNWpyFrZUXKXRU9IvWym60Ei+cuzkFEzxbFmq8fwCfL5ukyzQTEHC+aZdlaLqy
         aHNil3XH1ZTvxyi3TfleirUGw7k2EAYW54Q40vTH7Vq+eU4Ie6DOn2C+Nvlzi0fUfOTR
         k8tn4r5Q5BWPEHbaeW/WrYsIfqUzbi/vdj5qn6GDFLMFJl4j4cUwOQr05ONNJLUqCJ9O
         vU4ZZ2x2kGwTXwZIK4nCZ6NN4SduUFSfY2X+g21eRJf4g33nEe11vqOjASPnMeDMyVvV
         bX1cq2iaCxw6wXCPeeFtSGBB8sFyJ2DFsNhsKvEvoRDVLyIk52AUtlA9BTR8ZdfzWUMH
         8hBA==
X-Forwarded-Encrypted: i=1; AJvYcCWjvyd8nsOjkfXpWdVaPOcnZ5eJD8lqI76EE5E4TVGIQWkl1TobpKyDB2+L1371e0yInud4WuFysgphako=@vger.kernel.org
X-Gm-Message-State: AOJu0YwC4VY9EkFl8p+XRuyEph7RuG+6bzyvtJrXtUUQrBxamLQQvcaR
	/p6i1GzNWOMSWL88fCnh/nvR1UYXZz2ZyZXOJWMjl76cRJDWteTKExRkmaNrfaVqolCPnpFRHBQ
	PTzFs2hkqQT2IkvHswjytaGTzKy7kSjtC9ziJEg==
X-Gm-Gg: ASbGncv/UEqbHu1rYTY4s2CUyKZ8spHupQ4SJdhxWFT9UkVm0flOULJeuG+U9FlwPQj
	6ranR5QSP91EwghaFsNsN61QTar0cbjGu48McdOtS1zt2ziNUOe8RWiU6rjLbnZIof04E7kFcoe
	wjRjb2bEU9lhf4nCZd6eWIJ5X5JU4ws71UZN7QzbO80A==
X-Google-Smtp-Source: AGHT+IE7avfocEmD5lqNIyS63JcSTkkwf3BvTJpAGhR9l+oQoFSuLjrFiN2oMnoA2mOmJOAmlfiARgKB+FZMo6LuuCU=
X-Received: by 2002:a2e:bc1b:0:b0:308:f580:729e with SMTP id
 38308e7fff4ca-30f0a180dd0mr35506541fa.27.1744027749231; Mon, 07 Apr 2025
 05:09:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1740504232.git.nicolinc@nvidia.com> <f205a4e2f5971cd4b1033d7cac41683e10ebabfb.1740504232.git.nicolinc@nvidia.com>
In-Reply-To: <f205a4e2f5971cd4b1033d7cac41683e10ebabfb.1740504232.git.nicolinc@nvidia.com>
From: Zhangfei Gao <zhangfei.gao@linaro.org>
Date: Mon, 7 Apr 2025 20:08:57 +0800
X-Gm-Features: ATxdqUE-WE2mGG2qPqESoLiVUp7LnTlD7II4G1YhfYdYp1Eq06d5HdYvjf8h2-k
Message-ID: <CABQgh9Fuh2HdBH7pyAteawZBpa55ZzfR9dv2K4RF=Ps4yhREbw@mail.gmail.com>
Subject: Re: [PATCH v8 12/14] iommu/arm-smmu-v3: Introduce struct arm_smmu_vmaster
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org, 
	joro@8bytes.org, suravee.suthikulpanit@amd.com, robin.murphy@arm.com, 
	dwmw2@infradead.org, baolu.lu@linux.intel.com, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	eric.auger@redhat.com, jean-philippe@linaro.org, mdf@kernel.org, 
	mshavit@google.com, shameerali.kolothum.thodi@huawei.com, smostafa@google.com, 
	ddutile@redhat.com, yi.l.liu@intel.com, praan@google.com, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi, Nico

On Wed, 26 Feb 2025 at 01:35, Nicolin Chen <nicolinc@nvidia.com> wrote:
>
> Use it to store all vSMMU-related data. The vsid (Virtual Stream ID) will
> be the first use case. Since the vsid reader will be the eventq handler
> that already holds a streams_mutex, reuse that to fenche the vmaster too.
>
> Also add a pair of arm_smmu_attach_prepare/commit_vmaster helpers to set
> or unset the master->vmaster point. Put these helpers inside the existing
> arm_smmu_attach_prepare/commit().
>
> For identity/blocked ops that don't call arm_smmu_attach_prepare/commit(),
> add a simpler arm_smmu_master_clear_vmaster helper to unset the vmaster.
>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Pranjal Shrivastavat <praan@google.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---

>
> +int arm_smmu_attach_prepare_vmaster(struct arm_smmu_attach_state *state,
> +                                   struct arm_smmu_nested_domain *nested_domain)
> +{
> +       struct arm_smmu_vmaster *vmaster;
> +       unsigned long vsid;
> +       int ret;
> +
> +       iommu_group_mutex_assert(state->master->dev);
> +
> +       /* Skip invalid vSTE */
> +       if (!(nested_domain->ste[0] & cpu_to_le64(STRTAB_STE_0_V)))
> +               return 0;

Why this is removed in v9 and 6.15-rc1?

I tested 6.15-rc1 the qemu failed to boot with qemu branch:
for_iommufd_veventq-v8
"failed to attach the bypass pagetable"

After adding this "skip check" back, the qemu works again.

Do we need to add this back?

Thanks
