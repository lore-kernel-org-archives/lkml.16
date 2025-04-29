Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342731DC988
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 17:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745949585; cv=none; b=BQ3DyWiE8t7suMeRy2Xlzm3iYx9/V/wkxohcQdcU8DQv6JBVq7MI8QcFOKDGk3q/Dn6/gbEeWfZoN4vn3WhkcFkVd77J8BGLMLv4GrDt6nQdne/ayX/PFMrR5bNFSIqod8q9xftj2rlhl14ZoO+G1ZefxHKnCIE93orywWrT3I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745949585; c=relaxed/simple;
	bh=d16RAGrhUAPMnh/Fm7KTz/flsdV6DTvv/njmBuuJRZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f+np/1QF5pjzbGqjAtN9KveJ9EQXBag8fNit/yd0XR3LATfT+A50niQjupg5tM0Th3ml+4OWJHtK0yWSSHaVAp0CswH+NQWqxs8jo6fV0owdlcVfWcwQNS55jOFuwx94j0YpkE/18VuxzpSCanuMJeFIlLDoNigoxfnpqlPMwao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KQhkbJJc; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KQhkbJJc"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2263428c8baso46935ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 10:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745949583; x=1746554383; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QZWx5YzsE6VtBscW7jSSrryOsxFdJT63HSkZNADS7Hs=;
        b=KQhkbJJcGzLvo1uHbQJNFTjX5nhmx2MkqHc+/fEI+SDQVhwDDa4aJuzYG9YAWMFDXJ
         3InBM0/0JGUBs5PC4mgxAWiSJb1c36oWfDT2ew1I9YnxDL2ZTQ8zD1pWCr9L71f06lwO
         ZtOCWrpF02evC1mOVwaVLJQfTUEggPBHko60CWuu5ubPmdghKJKpf1BRd7lc2menlw9x
         jad+/NNqrIGVDq1fU4Li03OucZdSZglhuerrOW0mcPEa7y6+mp8JDQ5vWkB8IvC9cy8G
         MOjeGIcPEZ41HYpI+Y/vSgX4IsmyERs0orBdEo3ybUpPXXE0SyePg6/Gen8mnxpp4fM8
         r+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745949583; x=1746554383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZWx5YzsE6VtBscW7jSSrryOsxFdJT63HSkZNADS7Hs=;
        b=GGK4HtWxgb6lBIFHTGYIPzu2ScVbKBHcImew6N1l8Iq/rCURwxS6Dkgv9Dv0JS5KIp
         yxEyu4021TiozONAvARGz2uEurU/0aZGBqfPn5VznZXfHi4BE8THz4l4jNLP5Z5DbGq8
         ufet/HaGT6W46SEW3NnChLgKEw6Tem800J1Srp74PfkyK/qbQ4duSA4encEIEvOnNF8X
         vR6y+N/rPB5Qop+eZFaoAK91jZjWJFcdKHoWH1XKramoPHMA9aHavSGCaTBsyg13E+Gw
         QfRDSqb8VtFF7t+kbgJlbTDHVW3/8SLfnGiW830SFzI1rcVVHh7k+Bikq5G/bPCk1D3w
         4Stw==
X-Forwarded-Encrypted: i=1; AJvYcCVof7OjKuI3rENFgksOmESHkz35/CBk6sXQ3I7psZMdn1eWiq3ZD6FntuVRXA6i31I35TJ/Lm/8S0J30Ew=@vger.kernel.org
X-Gm-Message-State: AOJu0YyG5b5L8aOsCcfnwXDvdooGDpiKIDhf/tz2GDxj2arQPV2fpx69
	J1GOScihykyKjY3izzzj4KGAQcidFNs+ozCUxTJvn/DssoTm1VwUc2nQC8v0Zw==
X-Gm-Gg: ASbGncvghyRTWu80U001hz5Fpm68Y2pSpglBGuj6FrmMFx8j2k+rN19V5ytyePkgmlH
	eQoH/Rgwdll9xxYFa0BBaBcN3Cng7bjs2ss4fHFFxlT6/7WzuKGWCfL1ufI+XykoeMc3vplTvU+
	s30paeVPsl/3MEExrc72ib1pMqYHko/jtbZF6OaRcvwXO/P+go3SG2dfRbQWpajwEXNR2BuyalH
	rBtT4gHYD56oMkzWvIUOfIk7rVhcPQmi+kfcZztXqqxB+YQe4mbnLInkT5YNLEjQZg2kUsQNL4s
	0ptdWyLILEM6yK3A0du1WYJyqL18R6+glG7iol3f4Vpca5WFUdoYpvk0c2Jl71ZQ9RvZ7WQX
X-Google-Smtp-Source: AGHT+IFpQWcmyzP1N/TbZRNb1gatjkwbbsmgC09afTOnO3GyWImnhX2qlaIfI4JGDZZ0CTRg72ZS0g==
X-Received: by 2002:a17:903:2303:b0:215:f0c6:4dbf with SMTP id d9443c01a7336-22df3fe491emr117295ad.14.1745949583190;
        Tue, 29 Apr 2025 10:59:43 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db510272csm105625315ad.177.2025.04.29.10.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 10:59:42 -0700 (PDT)
Date: Tue, 29 Apr 2025 17:59:32 +0000
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
Subject: Re: [PATCH v2 11/22] iommufd: Add for-driver helpers
 iommufd_vcmdq_depend/undepend()
Message-ID: <aBEThP2Bn0YDgXfu@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <a25c9454c17663f9e79b37bc2908bf3a99856be6.1745646960.git.nicolinc@nvidia.com>
 <aBDIpz7w8wxIn_AF@google.com>
 <aBEIBKdjuecVHgpU@Asurada-Nvidia>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBEIBKdjuecVHgpU@Asurada-Nvidia>

On Tue, Apr 29, 2025 at 10:10:28AM -0700, Nicolin Chen wrote:
> On Tue, Apr 29, 2025 at 12:40:07PM +0000, Pranjal Shrivastava wrote:
> > On Fri, Apr 25, 2025 at 10:58:06PM -0700, Nicolin Chen wrote:
> > >  /* Caller should xa_lock(&viommu->vdevs) to protect the return value */
> > >  struct device *iommufd_viommu_find_dev(struct iommufd_viommu *viommu,
> > >  				       unsigned long vdev_id)
> > 
> > If I'm getting this right, I think we are setting up dependencies like:
> > vcmdq[2] -> vcmdq[1] -> vcmdq[0] based on refcounts of each object,
> > which ensures that the unmaps happen in descending order..
> 
> Yes.
> 
> > If that's right, Is it fair to have iommufd_vcmdq_depend/undepend in the
> > core code itself? Since it's a driver-level limitation, I think we
> > should just have iommufd_object_depend/undepend in the core code and the
> > iommufd_vcmdq_depend/undepend can move into the CMDQV driver?
> 
> The moment we added iommufd_object_depend/undepend, we already had
> a blur boundary here since we had no choice to handle in the driver
> but to ask core for help.
> 
> The iommufd_vcmdq_depend/undepend is just a pair of macros to help
> validating the structure inputs that are core defined. It is quite
> fair to put next to the raw functions. I also had the notes on top
> of the raw functions suggesting callers to use the macros instead.
> 

Well, yes.. in that case let's call the macros something else? The
current names suggest that the macros only setup dependencies for vcmdq
and not any "two sibling structures created by one of the allocators
above" as mentioned by the note. Maybe we could rename the macro to
something like: `iommufd_container_obj_depend`?

With this nit,
Reviewed-by: Pranjal Shrivastava <praan@google.com>

> Thanks
> Nicolin

Thanks,
Praan
