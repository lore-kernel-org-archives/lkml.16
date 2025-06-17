Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21E028A714
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 05:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750139002; cv=none; b=H/jkSmgRBOfz1nKVcGFU7Ohr6ond2qU19gaP3f9DiKLFChoIF5T7d7rPp/KPRUbXL9PyT4ec8nsNceEYX+hbjvUDMhmJUzjqB/hWkyFJAGCptYCiZ58hZMbHw7zzsudz9mrgmJOu79g5viHij447cHmO07ircKZXBmfaA4OvKBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750139002; c=relaxed/simple;
	bh=SghC4et/z2EDycDOFtWYFVm+MtMf9BDEsdZTXx4JMDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ai7wh10DFvA6dFU0tZI+gS1KhDMSIKBxAQmYzmzVyS1LjDRd1iEIxg6LodIQDpxmT3HkJ9yL4erS5pqdMGTeVUVlj+i/I3Trzz3B8Kxzok0nw3J+kbQcZ8SdSIT23Hf+W6/HkLrIzUE2R95acCscQItjGLPffRNDYq/4VSurmms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rr5/3jiL; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rr5/3jiL"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-235ca5eba8cso107625ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 22:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750139000; x=1750743800; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vqy+/M9QHJY6wwtqs4c/CeBC/StH/tZ5ncI+kmSkSV8=;
        b=rr5/3jiLJcu8VIbAQS/bRk2ScLs4LNC/d99hCQkfl6RlXQeDxm0U8482XrkEoi+xFt
         3w5q11cdB1Y4ZJfbHLZYqKtzKTXVIlvCOB0XiSciV8jgIAR7EdBnFNqwk7Jd6IUNDD+G
         1qzr4H4N1Ywx2PVMvFJglepQ75ZKfuodowIGwqIAGQsla19d3Juy3od7FHHYN4RbtTM7
         fngn1vSJLMx3WpPMc6slWNDRGJTnJv1ePSkE0+YB2M7hCx8tsOiwK02Fkb0ZtdItMbbo
         90mv9JqFQCG4xQWyYeSfiCnIgcAnWQB4iQJ0NgCvZqIs0JEGe2FcEY2dabQfJC3nrbQe
         JLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750139000; x=1750743800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqy+/M9QHJY6wwtqs4c/CeBC/StH/tZ5ncI+kmSkSV8=;
        b=pZ4AL4YLMIbS75m3076ViqUFIRC3a9+PZAYeKghSCciCrXvTb2dEIwomaRNz5N1S4G
         2eS2wscLvbJykDA0eaY/IVWy4rJ5hKybp27j31OzKHId0P0XaQ+HF6xh3B92jppUe38d
         Xw4/oGfgoVZRYO7FVaQs34e3QOfH1UbvP3GeluywOOFm5WVBhe/l/Ok6u+XBDW4gd4zp
         X15Op8Pgk2VtQ6sTWozABBWykK38SYo5Ol2nisDdh20+AMuhpKuzRBWaNCsyK+VgxR8V
         g2xtEpPzXXcgKK3t6ErrIJoLbNTKIPx6IR+TeHfXAvm/Cr57thdm+xrNzh/73MMjN42F
         +67w==
X-Forwarded-Encrypted: i=1; AJvYcCU5/XnP6VPoyYB/bCMV1C+ZgtWCP2g+hshNtjts74xQnE3HPk+O6A4hiXB7qa8TRv1swlxfdC4eoilOcfI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzO6zXEs0U9IJbv/rkc0/ySFXYgZDH1KhMQO26mKtmTQu+15X9+
	6PrlfEzfbgoPPOJHgaqGFu9kK8cYqUawdJru9o9dSFkEXn4eO//LnD0l2PDwSe14qw==
X-Gm-Gg: ASbGncvq8kYdy0NpWfuLTlXJCZtNV6EELtGwgC4uOVcxO6DsptkYVxiQXleLp1Lcq9g
	/PzEi5K63hB5aeZi4uee3Bs3dB9YyXRt2GJG6GsDyY6jzZbyWC6ZSGvtRa/Uc+z+6dupU26b+Vm
	FHLv3aeX1NnNZn6TgL2OpNiHZow+0k+fZySbE8Bg0VI2oK4snYCOr8XjjV20Ld8J+m4csse35Nl
	+7/xd6uP2yWLYTHs1+2blA8JyJy8gjbPAmBGOz9CLuMJYbWKwAbZeWV12Qyp6QymTgQgxHg839B
	4VXzFQOLEvvlFKlapfA90b35Vk5/R5tq9yQOkNWQaQ3yCfBXESh8TIvOASa602Rdu5goYnPxPs9
	BXpKPCpurIjHknghR/uyC
X-Google-Smtp-Source: AGHT+IFZAGH5Q2HoxTbpqlW9at8Yr/ZmYieszNEdcG0xorIcE8VWLoKmbjyoc4gI81zSv/z5UnBfOQ==
X-Received: by 2002:a17:902:d48f:b0:234:c2e7:a0e7 with SMTP id d9443c01a7336-2366c5bf6d3mr7082695ad.4.1750138999607;
        Mon, 16 Jun 2025 22:43:19 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1bcbb39sm9722410a91.8.2025.06.16.22.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 22:43:19 -0700 (PDT)
Date: Tue, 17 Jun 2025 05:43:09 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, yi.l.liu@intel.com,
	peterz@infradead.org, jsnitsel@redhat.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev,
	baolu.lu@linux.intel.com
Subject: Re: [PATCH v2 10/14] iommu/arm-smmu-v3: Replace arm_vsmmu_alloc with
 arm_vsmmu_init
Message-ID: <aFEAbc5URD93out3@google.com>
References: <cover.1749882255.git.nicolinc@nvidia.com>
 <64e4b4c33acd26e1bd676e077be80e00fb63f17c.1749882255.git.nicolinc@nvidia.com>
 <aFCeCvKkm1MvT3xP@google.com>
 <aFDPtzY3EygoOpUx@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFDPtzY3EygoOpUx@nvidia.com>

On Mon, Jun 16, 2025 at 07:15:19PM -0700, Nicolin Chen wrote:
> On Mon, Jun 16, 2025 at 10:43:22PM +0000, Pranjal Shrivastava wrote:
> > On Fri, Jun 13, 2025 at 11:35:22PM -0700, Nicolin Chen wrote:
> > > To ease the for-driver iommufd APIs, get_viommu_size and viommu_init ops
> > > are introduced.
> > > 
> > > Sanitize the inputs and report the size of struct arm_vsmmu on success, in
> > > arm_smmu_get_viommu_size().
> > > 
> > > Place the type sanity at the last, becase there will be soon an impl level
> > > get_viommu_size op, which will require the same sanity tests prior. It can
> > > simply insert a piece of code in front of the IOMMU_VIOMMU_TYPE_ARM_SMMUV3
> > > sanity.
> > > 
> > 
> > That's what I was wondering, so we plan to replace the impl->vsmmu_alloc
> > op as well?
> 
> There is no such op in v6.16-rc1.
> 
> > > -	return &vsmmu->core;
> > > +	viommu->ops = &arm_vsmmu_ops;
> > > +	return 0;
> > >  }
> > 
> > Seems much better now that the driver doesn't need to callback to the
> > core for allocating viommu. One quick question though I see we've 
> > removed the following too:
> > 
> >         if (master->smmu->impl_ops &&master->smmu->impl_ops->vsmmu_alloc)
> > 	                vsmmu = master->smmu->impl_ops->vsmmu_alloc(
> > 			                        master->smmu, s2_parent,
> > 						ictx, viommu_type,
> > 						user_data);
> > 
> > Not sure why don't I see that in the diffs.. do we plan to split this
> > into an impl-specific size and init too?
> 
> Because there is no vsmmu_alloc in v6.16-rc1. I guess you are
> referring to older versions of HW queue (vCMDQ) series that
> was not merged?

That's right, my bad. I rebased the older series while pulling,
apologies for the confusion!

Reviewed-by: Pranjal Shrivastava <praan@google.com>

> 
> Thanks
> Nicolin

Thanks!
