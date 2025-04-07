Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917FF22689C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744015045; cv=none; b=j8dlVrYbhyzfHRRLd5o9lw4Sg+efSDvmundj2seEuWL5RIHH4GKVo4vYOFyFZ6A7sI+euGX3GvJa/NoKtFyuaQDvWmpwcqMJPHmt+1YBdOHNIbEZyIonQdcZaY/ptGOn30VwLkADNsIhNdtanfb5jacoHleLC6I4oK1pvVighyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744015045; c=relaxed/simple;
	bh=r9MKe/SVH5Cpaz/tNBI5uI7KSiWB2m0t/5DQuFADqN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=smarIw3I3pwqy9I7JuuRM9snFTGbyMLH1Ngl6ThGdCAdPt9KPbNJzwdD21UX6R8+nQKM/ve+aTxeFXarAQldNlwWw2W+EKzSngjNmI3hf01umIHDffBF02Gj5r2RccUToWFpp0kIVpzRAVkuFZmKKeVeoXfvtyi3Yhe/aiTkTLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VfhuKKF0; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VfhuKKF0"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2264c9d0295so324955ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 01:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744015043; x=1744619843; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PM1xp6gzVd/l23ioaAQhkaBubnLpRRJNpYojAABDe0E=;
        b=VfhuKKF0VF5NV8pmqp3gn4ZiuVWu7z2Q7x4sv8PtHaQkh30dsCYr5KrAzp/j5oASnh
         AndhI0IEbBPgO/mrPmhq2aX22wwb91nnKZcC2lKN5YFad/+NVuwYHD4IuYrHetetROsh
         TvSBGbXKl8GZ1rdTPE3DLQj3MkVR+aeztcHV/mYUu6Hpptf1z7ZHhJmknxqSKJtfWQF4
         BB0sfZrHLInVRNV06AY59R9tXKJP5jtiYzs/7uIMn4dOJacAZxxwCydA4NYT1wTF8VSD
         akeVFufUUqNxKRcSwVX4nS8vPcxsR6dVcXa7GpcAesKj2MrkgI9cyBPMEfMLizpRKk+p
         6Z3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744015043; x=1744619843;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PM1xp6gzVd/l23ioaAQhkaBubnLpRRJNpYojAABDe0E=;
        b=lucl5YuSVETVf+JjmG1gQJNHoPrMhIBFtCn4aRCmbO9VRFaVuksspdFrjRPQjMFkY/
         0fz/bULoHpFvqRSicgd3OvNGHEkZCJqQsBziV2hkRfILpkTC5E6lEp5+oHyhPqE4a539
         oUzQ4uo/EX6eaoZo+17rEZ8kjLmGh1d8XKyz1tf30S+RL3VjOnlaPN1D8uUSn/tEBtox
         2+hICMXc59hmcjumoHFzmNEkT6BidxdAqNEUvK7YuTXIN0N7P2FEmTOIfAdinJC+zZwk
         FWQ8HZab4CcItICgbSctfsLZVxk/rWmWYo0QHAs7MXzN8+2VHIHadx4E/c9dWWQhRE0Q
         bA6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXSg0B4QvWTDapKOz2dyaTxVWGS4n6F4wV6NsZz7oLj0k0h5JpeMtT5prVzPp336iA2N4AC5O3P6+ZGDt0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2prHVdXhxAC1TLD3/IwoyWx/cQUrGB69DaOln1zZ4iZTtn0Uk
	R0TcPvPTUeoGXpfe8RRlOFUt/c8gWh2Jp9/Kre+jGTXAa1H54f1azhCR6KQVfA==
X-Gm-Gg: ASbGncsEx1rSf8Dy/K2ACrMNFFoYNPXUE3f4Zp/8JKD8Ybna19WKqsZbecFhb9CHSb7
	MyAFMs/0AGJA2k2Gp/9OddnS+RKJV17I/N12ssZCvuIRAHQRjYGZwJf7rp/MQ2hZEo7p+1n7X5C
	DRNrNzNa364u9sIyPyu+DIomEDpFI91ziFNLFiKMqfLzkAD4I7vmnxbjvXRVIDJi34dm7hNIylw
	PchwgZZZVToDPeGROGJqBwU2cgINoDfip0Ck6jbc7xvLZEodfw8IBUHIfex0XIRoNrCrs6FVSt4
	eeadd8SbNLO43WpgTuMrQ04PnKguP4CqXHa4O64PMRhB/XwvrJuyHT1gF++oBoi6Goe73Hk4K9E
	eFLo=
X-Google-Smtp-Source: AGHT+IFEcecwODNx4wiqbqJKpBlZrrA4mcqLS8OyyMt6tYMj4vc7ksfjibFdVhVKjFGu4nMmJA0OlA==
X-Received: by 2002:a17:903:2308:b0:215:8232:5596 with SMTP id d9443c01a7336-22a95e638e2mr3367595ad.16.1744015042625;
        Mon, 07 Apr 2025 01:37:22 -0700 (PDT)
Received: from google.com (188.152.87.34.bc.googleusercontent.com. [34.87.152.188])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97d19c5sm7904646b3a.20.2025.04.07.01.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 01:37:22 -0700 (PDT)
Date: Mon, 7 Apr 2025 08:37:14 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	"will@kernel.org" <will@kernel.org>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"jgg@nvidia.com" <jgg@nvidia.com>,
	"joro@8bytes.org" <joro@8bytes.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/4] iommu/arm-smmu-v3: Pass in vmid to
 arm_smmu_make_s2_domain_ste()
Message-ID: <Z_OOukRG0foehmV6@google.com>
References: <cover.1741150594.git.nicolinc@nvidia.com>
 <214b10db02f1046efdc70e2c4803111357f60070.1741150594.git.nicolinc@nvidia.com>
 <a95b39a55c324907a7001d3a2cdf076b@huawei.com>
 <Z8iNfnZ9N5Lczxmq@Asurada-Nvidia>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8iNfnZ9N5Lczxmq@Asurada-Nvidia>

On Wed, Mar 05, 2025 at 09:44:30AM -0800, Nicolin Chen wrote:
> On Wed, Mar 05, 2025 at 08:50:17AM +0000, Shameerali Kolothum Thodi wrote:
> > > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> > > b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> > > index bd9d7c85576a..e08c4ede4b2d 100644
> > > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> > > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> > > @@ -887,7 +887,7 @@ struct arm_smmu_entry_writer_ops {
> > >  void arm_smmu_make_abort_ste(struct arm_smmu_ste *target);
> > >  void arm_smmu_make_s2_domain_ste(struct arm_smmu_ste *target,
> > >  				 struct arm_smmu_master *master,
> > > -				 struct arm_smmu_domain *smmu_domain,
> > > +				 struct arm_smmu_domain *smmu_domain,
> > > u16 vmid,
> > >  				 bool ats_enabled);
> > 
> > Now that vmid is an input, do we need some kind of validation here as
> > at least vmid = 0 is reserved I guess for bypass STEs.
> 
> Perhaps it should do a WARN_ON_ONCE(!vmid), as it doesn't make
> sense for a caller to make an S2-bypass STE with this function.
> 

+1, a warning should suffice as the caller isn't expected to call this
with vmid = 0. For the s2 bypass case, we already set vmid field to 0 in
make_cdtable_ste for clients who *really* want the vmid = 0.

> Thanks
> Nicolin
> 

Thanks
Praan
