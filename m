Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CAC13D53B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 13:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744378546; cv=none; b=GfUylBVnQufHy7xbe+imDMNiA+wiUWKFPm7vLFJ5NCQQNnBeOx1rkSK8AGFI0CSb2GkxOumv6s+tIFLYDEj7U+sqkK17yWrDHFnYcyfDtNimfoKAjaNgQniMCDlW+X63QgoItlzmFNC3OmhoLan4/XtVEMpd97/N9mITNOoIbzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744378546; c=relaxed/simple;
	bh=3G5Fv0Yjjx2r3CMEyGoqOLS4NYfX8a5XRFRFNIE8YMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UYuw6JOHu4iYAewkTgVTSkbx0X6Hnh0RKeARIj9NU8SaKM5mDHcvWH2QmfxNhIDllmEtfTf0BhTKT9KYGPveJpG52Cr0518/HzsEWZpI1FhJ7J2MKXkFZu/mpryI5ctCBgFqaW0YzkF0uBfV6bko29lPDyYc/OFO++PCn/ZqXtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uitTGfhA; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uitTGfhA"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2263428c8baso174695ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 06:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744378544; x=1744983344; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ahE45842u7TdL15efT6Z7ZHkp/0EW6XeVJ2l3pr4tVY=;
        b=uitTGfhATx5MDlyGc7oWgV4Edt4TDlsB3gIfXoV2L8EUczOIytqTuZS2M5nucI224h
         1OVv6NSW/6P0+98rohtuc+dgrASN3Z1A9dPHuPji1Y3wM2VfWmPQ6ePdsqK2MbzQNGu4
         x1VeAxV9c6aJ59rdiqd36H1fSYIFjQMp1mtbgnNdLf0mh849ABqS7VWQk34aBBpYZvMU
         tq3g79NhA0wujXMcyQe9HvNVv7242bxLEvuEJ4EGo7UjvN476Aq6m9EKvZKQJ/sO8fgN
         /4UH2PbtvGZjRlRJAoLtkK8IoYTb6XKaxnIwjiIacx5BhZu+6ac7dQhFqoo4ywaTFa3v
         2gpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744378544; x=1744983344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ahE45842u7TdL15efT6Z7ZHkp/0EW6XeVJ2l3pr4tVY=;
        b=tIUNxxqK4TZGAxBZvpZT8PfxYZTbwq93z035zhRDBKfzCwQcGck+QRCGgduJIoXT1l
         VxUoKF/5R3RrtpSqn5SnRTR+hhXkpSRuup2Eq/27NHVeSPhkuyhD2u/ucdJY8v34ldN7
         VFj9aMjoh0b3DfhoCmzqcYJ03M2Q+OZ3GgJhx2UJOVjG97wFEznI50h6Avgk2/XNGcw6
         i4y7vGQQk97wpcKPzMjb7SYA0H5/STEZLbi3I5RagV5ha7Cqmttni8jQaxBj3YXsRG6h
         fhaKvBuuK7lrA0I6YYmGEQhQX7fsXSapK140YdBOuo3XLPBnBSiHVliDXDRZ1ylj8bB7
         YH0w==
X-Forwarded-Encrypted: i=1; AJvYcCUuW6EQbLKuDzkXlvjBism9kMmNDsRLkpy3GITYrDl45zX+7yLdLraVBOc8IDZZovgja4QajOtJLnI7T34=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhumlynWInjALzDfaDCJXfO0fa0JGSWWgwOJtxMXZGmzebbWSL
	haP2TWyziZ7esjpj2L6OraLSCbTOJpWIEM6oUqinfo1XMwq4wXP1x+IlEC3hrw==
X-Gm-Gg: ASbGncv+6tsPaONjO3+6Q/bbTZhg1XC5Rjv6aIBFHLZyY/V5T+xPnygG+UFCTyrUtZR
	cCB8PCrvAdQQOZCxwyQyl+t+EntbwftoISpallImndftWGG81e65CHLkQELozC6Zoy7fbHX7AMK
	AgfEBbsAP9cxdEeWfa9DOlUrqKv8C88kALhW2T2akIntzVjp86BZYp3Lydy/UHgl/Xn/ajA39RE
	ych7RMlZHLh4w0yUvR5YMP7Z7JIlaxmuTUGcbGcXdDmgjw+z47k2b9NvebK9eDWQZmSQGvio/iz
	UrjSHLRI373hxYwZcEmQFVjNOAmAQuQo2unLoKb6yZpfxLfT6fySOV2R3Uu4U1tHcbpxJ5OJEKY
	=
X-Google-Smtp-Source: AGHT+IFuZy5EqTvHAoVOBfr4Fk23t7EUqNIlbLfmzgyWRo1kRCsj3C5cAT42IIfvlQGQQk8a2X+0UQ==
X-Received: by 2002:a17:903:1b65:b0:216:2839:145 with SMTP id d9443c01a7336-22bea8acbadmr2351335ad.1.1744378543195;
        Fri, 11 Apr 2025 06:35:43 -0700 (PDT)
Received: from google.com (188.152.87.34.bc.googleusercontent.com. [34.87.152.188])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd2198be9sm1459659b3a.9.2025.04.11.06.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 06:35:42 -0700 (PDT)
Date: Fri, 11 Apr 2025 13:35:34 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Nicolin Chen <nicolinc@nvidia.com>,
	will@kernel.org, joro@8bytes.org, jsnitsel@redhat.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-v3: Allow stream table to have nodes with
 the same ID
Message-ID: <Z_kaprkADtmMLyiH@google.com>
References: <20250411044706.356395-1-nicolinc@nvidia.com>
 <b62f5ea3-99cd-4e9e-a2a8-cb325308ed34@arm.com>
 <20250411130155.GD8423@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411130155.GD8423@nvidia.com>

On Fri, Apr 11, 2025 at 10:01:55AM -0300, Jason Gunthorpe wrote:
> On Fri, Apr 11, 2025 at 01:10:29PM +0100, Robin Murphy wrote:
> 
> > This is adding support for StreamID aliasing between devices, and as such it
> > is incomplete. It's not OK to just allow devices to arbitrarily rewrite each
> > other's STEs,
> 
> Okay, yes, we should be checking the iommu_group before permitting two
> devices to share the STE. That is an easy fix, see below
> 
> > Aliases can only be permitted within a group, which means
> > arm_smmu_device_group() also has to check and account for them in the first
> > place - note that that applies to PCI devices as well, because as
> > soon as we
> 
> On this system the alias come from the PCI DMA alias support and
> pci_device_group() is already correctly grouping things.
> 
> Aliases from other places, like the IORT, never did work..
> 
> > allow StreamID aliasing at all then we're inherently allowing RID->SID
> > mappings to alias outside the PCI hierarchy in ways that pci_device_group()
> > can't know about. It should work out basically the same as SMMUv2, just with
> > the streams tree in place of the S2CR array.
> 
> You mean the logic in v2's arm_smmu_device_group() to consult the
> stream map to select the group if the IORT is creating aliases? Yes it
> could be done..
> 
> However, this is a significant regression fix and I think we can be
> confident there are no IORT tables in the wild that have aliases or
> they would already be broken.
> 
> How about we add the missing validation that the group is the same,
> that is easy to do and should be there anyhow:
> 
> static int arm_smmu_streams_cmp_node(struct rb_node *lhs,
> 				     const struct rb_node *rhs)
> {
> 	struct arm_smmu_stream *stream_lhs =
> 		&rb_entry(lhs, struct arm_smmu_stream, node);
> 	struct arm_smmu_stream *stream_rhs =
> 		rb_entry(rhs, struct arm_smmu_stream, node);
> 
> 	if (stream_lhs->id < stream_rhs->id)
> 		return -1;
> 	if (stream_lhs->id > stream_rhs->id)
> 		return 1;
> 
> 	/*
> 	 * The stream table can have multiple nodes with the same ID if there
> 	 * are DMA aliases. If multiple masters share the same iommu group then
> 	 * they can use the overlapping STEs within the group.
> 	 */
> 	if (stream_lhs->master->dev->iommu_group ==
> 	    stream_rhs->master->dev->iommu_group) {
> 		if (stream_lhs < stream_rhs)
> 			return -1;
> 		if (stream_lhs > stream_rhs)
> 			return 1;
> 	}
> 	return 0;
> }
> 
> That change will narrow this patch to only enable PCI DMA aliases that
> already generate the correct iommu groupings. Other sources of alising
> that don't generate the right groupings will continue to fail as they
> do today.
> 

Isn't the device grouped *after* the ops->probe_device call? I see that
the dev->iommu_group is assigned the ops->probe_device call in
iommu_init_device.. so I guess this would still fail?

Thanks,
Praan

> Then I propose continuing to wait for a user before adding support for
> more alias scenarios to arm_smmu_device_group()?
> 
> > > +	/*
> > > +	 * If there are DMA alises then there are multiple devices with the same
> > > +	 * stream ID and we cannot reliably convert from SID to master.
> > > +	 */
> > > +	if (node->rb_left &&
> > > +	    rb_entry(node->rb_left, struct arm_smmu_stream, node)->id == sid)
> > > +		return NULL;
> > > +	if (node->rb_right &&
> > > +	    rb_entry(node->rb_right, struct arm_smmu_stream, node)->id == sid)
> > > +		return NULL;
> > 
> > This doesn't really work - the whole mechanism needs to fundamentally change
> > to mapping StreamIDs to groups rather than to devices. Then it's really up
> > to individual callers what they want to do if the group has more than one
> > device.
> 
> There are only two callers. One is using it to print the log message,
> in this case it will fall back to the unknown stream ID path and still
> print a log message. This could perhaps print the group ID # instead
> of the raw stream ID but I wouldn't do that in a regression fix rc
> patch.
> 
> The other is doing stall/future PRI, and I don't think we should be
> doing iommu_group based fault reporting at all. Returning NULL
> effectively disables it.
> 
> Jason
