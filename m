Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B61C281509
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750691645; cv=none; b=klfMI49d+ggoAdfCgDhaDwq+eym5EdE57tgKJ9z+xaYuswijKXlEsnJw8R+/9iQ9tf1h7PiZ3pgtKO/F4He6zeUM5XALnE4bbk+wnMbwQa8swxMQHfOJpIBKa73imjBb3VCb5xT5WQM7SU0LjkreT9m1Q91OkxZ1fluNOcRebtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750691645; c=relaxed/simple;
	bh=T97FIRu7KTdXAKAuE2uiR/N85Qp0pQvg5x4paRRjBE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LS00plfoOETJK6QebFoK/fV+fXhaHHOXuw5tHlqBzIBq1eQEk+jUvUI/KyJpg97ANCmNi1AjC1xB/iRKRFHTb/6L7NpWV0xVco9TK0I1vubF0GBlHgZ1C3VI9JfgIDSnJAN1knqTHNsCnURN48VEA8rGaz1GGqx/2hYhDeddPaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VKkhY7Ta; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VKkhY7Ta"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2357c61cda7so223415ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750691644; x=1751296444; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sQjNcvHYakrNgjIQGLE/wyS2yfZF4798fujbYGUPWpc=;
        b=VKkhY7Ta928BptYCHJVYvcLh5d5S42bzKA+iRJ+oEn0vaAOt9h0TsdKx0TVjsG5sH4
         Z4q93H89iMYgYf0aYTsAgCNfxEn9VdxmzIGv5nStyrSyPIKbxJo9juXqmMMNq7ECHFDx
         B8JomsblSvNpl/fEvJo6R4/YPa9gv3aZKDa1EMjVHvRE+O9+BIZhlH/xK/wIzNWS/YSZ
         u5O5ucng1O3F0A9odAfGrmPgdSFcRgmoE3vaSf9skQt3uezUoJ5cU1m8WFQM9WRytk3B
         +hYacxGBwtbMioE5B0mmYlJdkMqV/80MQguGEMxtequZg9ItcVJDvF+AGxR7FFvPz+ij
         jIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750691644; x=1751296444;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQjNcvHYakrNgjIQGLE/wyS2yfZF4798fujbYGUPWpc=;
        b=W0tg0zu6Orh0L+Ma4FsxLP7O5v+iSao3PIxoRMlt+VasN0Tt8kiBICoVuv9xJWr8JZ
         6CzGUOiq9w5OFo56VU36y2GaqcvAX+MyO8JdnVak3q+G0lRgm5RtBKg3L80KAThnjfvW
         KZBfkVgd4N2Gw1DxGn0YDIH/wzLOEg3xyToiboNvuKzoEtLedGUgVzDO4x2ZJgVlr+BT
         DtEyJju+LJuCgfksejklTQpLeuVZG3grSdDbBXIWEW4hvjOnv5VgzWzbj5ILlYGBYXO+
         sjAYCoTpQBu4IL0r3J2I+WpEdUoIXnJY24JalTMBaFWwy+EMisS7LCA9hwvGkwzTqoRn
         fwnw==
X-Forwarded-Encrypted: i=1; AJvYcCWjBxpTYBe9bWcnuInvwy7r/rFWeVf0biogvBghMLcw907ZiaUtoa4458wqT8Zvzogjy+yX300tjk0OD9w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyKl4uqN3bbV3xxchadKVQjAP/pRo6NsocpztyRldHLpd/IVvQ
	08O4/MQZf//Z84ro0mbjmpdSbibNzmeubXqB12i5ueEm1YbuHH/ZFHhbvoZq42hdEQ==
X-Gm-Gg: ASbGncseE1i2kgRnrrOXTVQu0c7ppJm7Ia4jaWZgL2soqgEnrL5xsC7i0g/2cgFrIBx
	dA6+7CL9y1BZBCbsyIFdxMa8Sp3MlKWinWHxWZpgVJnq+dOyyCNSFUtgHRMWE4dnj1CCCOCK79g
	2s0jz2rR06t1HQZ53fZIHJxaQIJBHBXiRsEUUf0fmaNKcxkTJitxl3rCmPXLfa9LySuKIhVW1q8
	PMkw7plOqYpkHgrFQF8mXLWv9TjHVw4rCBtGCWjOkOBaPZ3GSd3oVd9Z4HxFDi8O5Z/rYdZLTBy
	WKcxADQeFGJ7ozxtmkP/jPL3/qem338h+02quxx0is1K3KOfAna3/PBjtO0oHt4kDM6mG2/61Q+
	u+qvkBpjHYKBYCSNESd5JI1OcmFv0zIM=
X-Google-Smtp-Source: AGHT+IFjZuHSmjWz3mlyiiORGjulfaekm2TrngIFHZiE0ZqJkNGQDEFi3n1LBmgMIlW05C9z3Da4aQ==
X-Received: by 2002:a17:902:e951:b0:224:6c8:8d84 with SMTP id d9443c01a7336-237e478a96fmr4808555ad.4.1750691643222;
        Mon, 23 Jun 2025 08:14:03 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a23e6fbsm11004566a91.14.2025.06.23.08.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:14:02 -0700 (PDT)
Date: Mon, 23 Jun 2025 15:13:51 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, kevin.tian@intel.com, corbet@lwn.net,
	will@kernel.org, bagasdotme@gmail.com, robin.murphy@arm.com,
	joro@8bytes.org, thierry.reding@gmail.com, vdumpa@nvidia.com,
	jonathanh@nvidia.com, shuah@kernel.org, jsnitsel@redhat.com,
	nathan@kernel.org, peterz@infradead.org, yi.l.liu@intel.com,
	mshavit@google.com, zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v6 20/25] iommu/arm-smmu-v3-iommufd: Add hw_info to
 impl_ops
Message-ID: <aFlvLw0SHgYiA614@google.com>
References: <cover.1749884998.git.nicolinc@nvidia.com>
 <f36b5e42bac83d0cdf5773cad1c3a44c3eaed396.1749884998.git.nicolinc@nvidia.com>
 <aFP4zHIVT6epJeLb@google.com>
 <20250619185325.GB17127@nvidia.com>
 <aFTWQ4v6aZABpzeV@google.com>
 <aFZE+MhTOCvbkKbH@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFZE+MhTOCvbkKbH@nvidia.com>

On Fri, Jun 20, 2025 at 10:36:56PM -0700, Nicolin Chen wrote:
> On Fri, Jun 20, 2025 at 03:32:19AM +0000, Pranjal Shrivastava wrote:
> > My point is that in-case someone passed INTEL_VTD type, we would end up
> > calling impl_ops->hw_info and then the impl_ops->hw_info shall check for
> > the type to return -EOPNOTSUPP. Either we should clearly mention that
> > each impl_op implementing hw_info *must* add another type and check for
> > it
> 
> Let's add this:
> 
> @@ -721,6 +721,11 @@ struct arm_smmu_impl_ops {
>         int (*init_structures)(struct arm_smmu_device *smmu);
>         struct arm_smmu_cmdq *(*get_secondary_cmdq)(
>                 struct arm_smmu_device *smmu, struct arm_smmu_cmdq_ent *ent);
> +       /*
> +        * An implementation should define its own type other than the default
> +        * IOMMU_HW_INFO_TYPE_ARM_SMMUV3. And it must validate the input @type
> +        * to return its own structure.
> +        */
>         void *(*hw_info)(struct arm_smmu_device *smmu, u32 *length, u32 *type);
>         const size_t vsmmu_size;
>         const enum iommu_viommu_type vsmmu_type;
> 
> And I found that we could have another patch changing "u32 *type"
> to "enum iommufd_hw_info_flags *type" to avoid some duplications
> in the kdocs.
> 

Yea, that sounds good. Thanks!

> Thanks
> Nicolin
