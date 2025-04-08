Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9852C1C863C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 14:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744122063; cv=none; b=Bblxo50+AeuBL9iHYQpBAG6nq9EPTFadorbWjoZarz0zGUF4VpT8cs8TwNqYzjqD6luG+tS/ZyTFkxlWp1r8kRHhSWQ0YNaMlUaaUfkGor9aNP396Mxka77w1KHFP6s7mM9JGC4HZfgt39GPokgO4KaW1K42wjTW8awFYz167OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744122063; c=relaxed/simple;
	bh=2Za3cLRtM7U0gO0EIvM/IkgVzkWdWwiibIb4Fc41G4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ooMgHM4A1Kz7dYoCcIsfAxfQUxfmRvSvMDjwtEgSGXKy0iwOLN049kVpObyle2oxn4l7uGycA8uZ9immaQMk0uN5qlF8pG1h1mzbD5SqjZW5aflKu+g+LEmRA7wRTPLW4LEmQz/ZwxkaTCXmz09ALjP76+NUQEJq3PMR6UUERak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cpoYX3Rz; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cpoYX3Rz"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2242ac37caeso158815ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 07:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744122060; x=1744726860; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=50rhH0P4C6X37y8/XrUykTYL68bxlRnwKFJu2ki7lY4=;
        b=cpoYX3RziCQiFfPMraMNdcIExBuanIO6sS7o41qMAjayp1EeTN3Mpvn2lIhHQV8oCz
         d9NzBr/MhLPyIhEz5peMO02rBbQ1D/xEdUNzxOWtoYegnc+5ansihwJn1z+x09YjPCmV
         N+U3P80nw/0qeeme0a6I+j70WzY5z/tBzF3mpVAC2EgZxXO0B7cRxeUf2Srqu9A0ikBc
         njfLghHsjqAL1wnccBdTxMlH3KI8HPitdHbKWnwYTmY5eavzd2Evo9hwib275B/YpNPP
         NJ5nMpd3ZLh6SvsMKt3oiZ00mKjLXdeXWKlFJmW26oGIXSf63o4ht2NnFGHJNI1dtBEs
         kB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744122060; x=1744726860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50rhH0P4C6X37y8/XrUykTYL68bxlRnwKFJu2ki7lY4=;
        b=Ww9P5s6kwCLf9hOnUHqSIe/lmqAjmZz+h/TIIJeUy8f2nc1w9EQehj87WFrkYl9Oq+
         MlgJSufJM40sqAa0LES/39wWHvcm3tySzMd1x2M9Ye5D6jN9ySsBTD/J9/XwB1PwmSi2
         qTv832kc56ng9IDtTz9XzWL63wL/JHd3HHJ1SqRjFFTbxWWQy+QKvIpPRrMyNQo1xh+A
         7UdyVHVdspVYNKyUol2IGHSGBE6vtpetXMj2vkAn4UOcGFbermqbwu4VuYPiHQGAh6d3
         B1ynOLo34XsWCflXWVB+t9AYZJKLaT/99A1lCiZobtCPNcpW9eavHn5WwJxc8WfDFEli
         +RuA==
X-Forwarded-Encrypted: i=1; AJvYcCUJsU5p8CyL4MI9Mw7mfhmwZglnRNr4ZUFfUqXo73M+NHpCA4NXWzVeCHJ7R1NGIIuC9fzb9vDMstrqL3o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVMN66hk4BA/cIx4QQ6chkavwgb7rsrY45RtkaxQQIGQBhxXzX
	swzeRmANz0K1re2SWixEPleEReGIV+UkvK5UMOXxP4WHZKyDFAscpzqRAdb3Jw==
X-Gm-Gg: ASbGnctyAO7B8THa5RnQfaHGv+Kdqog9UTSxUmbHwlKxNxGW6fZTO6ImxaWOoGTDJdc
	yFbobgQo3LB3TD0PQMLuIVW205GMiraWAIiAPXWBi/lZa4lkaHESo9LpfvxGIO5OOypxj/AbGQv
	BhMslmkULac50eJ09bTo8myu2y4ZNdfQ8wEgA+ED/H1/qelRs3Mbfec5vlXi3eToXxcBvMWhRrV
	8V+HnYbRGEPxB7XtUpva5L+SgU+T4ACvLdD6ASxI8Fm1vsVg+K/7MUJI1GN0ZfsixFyz86rziYG
	xt5Bo0zXFJgzeieXVUEqBpl3DzKMm7uTtJg2BBSZJyeJ/ExuNxAYHBNhNeEx0rzdg4zVt86aLd6
	6IJo=
X-Google-Smtp-Source: AGHT+IE4iRRh4X4YLUZunHgPf+vwd/X5Yt1E655M4r0NMhwn9qwL0MFydS3s1KuHykiWXHRTrO7ZHQ==
X-Received: by 2002:a17:902:db03:b0:20c:f40e:6ec3 with SMTP id d9443c01a7336-22ab7136fa8mr2614455ad.22.1744122059590;
        Tue, 08 Apr 2025 07:20:59 -0700 (PDT)
Received: from google.com (188.152.87.34.bc.googleusercontent.com. [34.87.152.188])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc32382dsm9155045a12.28.2025.04.08.07.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 07:20:59 -0700 (PDT)
Date: Tue, 8 Apr 2025 14:20:51 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, shameerali.kolothum.thodi@huawei.com
Subject: Re: [PATCH v1 3/4] iommu/arm-smmu-v3: Decouple vmid from S2
 nest_parent domain
Message-ID: <Z_Uww4PdJesOoA8N@google.com>
References: <cover.1741150594.git.nicolinc@nvidia.com>
 <0429d554fb0f54f6d79bdacacb3fb3e7877ca8f7.1741150594.git.nicolinc@nvidia.com>
 <Z_OuLJ7RGnChDckY@google.com>
 <20250407165220.GH1557073@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407165220.GH1557073@nvidia.com>

On Mon, Apr 07, 2025 at 01:52:20PM -0300, Jason Gunthorpe wrote:
> On Mon, Apr 07, 2025 at 10:51:24AM +0000, Pranjal Shrivastava wrote:
> > > @@ -381,15 +401,24 @@ struct iommufd_viommu *arm_vsmmu_alloc(struct device *dev,
> > >  	    !(smmu->features & ARM_SMMU_FEAT_S2FWB))
> > >  		return ERR_PTR(-EOPNOTSUPP);
> > >  
> > > +	vmid = ida_alloc_range(&smmu->vmid_map, 1, (1 << smmu->vmid_bits) - 1,
> > > +			       GFP_KERNEL);
> > > +	if (vmid < 0)
> > > +		return ERR_PTR(vmid);
> > > +
> > 
> > Probably a basic question, I hope we'll have one vSMMU per VM? 
> 
> A VIOMMU is tied to the physical SMMU, it cannot be shared across
> physical SMMU, so this is the right sort of way to get the ID
> 
> > Even if that's not the case then the VMM should take care of
> > invalidating contexts of all associated vSMMUs anyway? (Just
> > thinking if we should allocate a VMID per VM or per vSMMU)
> 
> If the VMM wants to present a single vSMMU to the VM then the VMM
> needs to replicate invalidations as required to all the physical
> VIOMMU objects. This will prevent using the HW accelerated
> invalidation paths, so I expect that the VMM will have one vSMM per
> physical.
> 

Makes sense. Thanks!

> > Nit: Does it makes sense to create a helper like `arm_smmu_vmid_alloc`
> > and call it here and finalise_s2?
> 
> Maybe so
> 

I recently saw Shameer's patch [1] using a different vmid allocation
scheme, so I guess it's okay if we don't share this function..


Thanks,
Praan

[1] https://lore.kernel.org/linux-arm-kernel/20250319173202.78988-5-shameerali.kolothum.thodi@huawei.com/
