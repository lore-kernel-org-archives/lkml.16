Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BAB26B973
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750840667; cv=none; b=cnY+2APVlAocza9QJh2RxqZo/ejn0R6FTF9CCB+QsBqKJ4gebv3sGiSrYjc5dyj/3ufm9HMX2A5IBGwvSkhYQneM9XTfCJ/FFvAWcdOKabBHT3Uh1AF8woIVCHIASbh80HaMKYL+3P16mX0lKOAOBcydtfuyq8dDS30gEWA69/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750840667; c=relaxed/simple;
	bh=EwvPZo7oTwprahWbVv9CKBqzmPZmEw39Hs2j42qQ/og=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E1M8yk4r6Sp05fMzNcgLpt5CRMZlyyJsINeL5tjOAaMce+AoON/ShKtqQo14I5FixWy+5I+fl4La0VUvnpjRrPKMI965h8BUPWKLpXYckiU8LeXDmbPzmz4p/SsVhfy/nSow31S4pFOPAUfwS+ytUMb/q2vUv8nIeqApZeSqo5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NH02XYi7; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NH02XYi7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750840667; x=1782376667;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EwvPZo7oTwprahWbVv9CKBqzmPZmEw39Hs2j42qQ/og=;
  b=NH02XYi769r1+YHwfSulY1PSz9hXh+MDin5jWDeTln+cNwBlR/uq6Fiu
   3PTexSS7kAiV7CC+bXqyLJ4iaaK8FycV1OSyNlE54oWfV9y72n9M/pwlN
   N5UaWIOGn1RDcFHAo179jQdpIrqEhBbJMS7G5q4Kf9/R92RUtbOnSAXLL
   /Lc+2z7SNqsiPaVZu+jLumonIz9w9BafQoL8rRe16Ddzwp92axnEVtcSR
   M74DMjJn/84UZ1/vLYTlY0t4FxB2Ltq7V7zgffSyIyEi5Wdc0/rCchDYm
   NRGBYpmahgkuX0A9YViAD+p/D1yUThRTLuH6IT8julytpNXiqfhZx3UH7
   Q==;
X-CSE-ConnectionGUID: 1jbn6YWOSLCGFVZwKrLRiQ==
X-CSE-MsgGUID: rIJFN/HTRWiDD8oyylzvPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52973198"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="52973198"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 01:37:39 -0700
X-CSE-ConnectionGUID: whELoIkaQLOb2fMkjiX5Eg==
X-CSE-MsgGUID: WWOHAobDSV6gRb7pT1MS+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="156186620"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmviesa003.fm.intel.com with ESMTP; 25 Jun 2025 01:37:36 -0700
Date: Wed, 25 Jun 2025 16:29:59 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: kevin.tian@intel.com, will@kernel.org, aneesh.kumar@kernel.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	joro@8bytes.org, robin.murphy@arm.com, shuah@kernel.org,
	nicolinc@nvidia.com, aik@amd.com, dan.j.williams@intel.com,
	baolu.lu@linux.intel.com, yilun.xu@intel.com
Subject: Re: [PATCH v2 4/4] iommufd/selftest: Add coverage for vdevice
 tombstone
Message-ID: <aFuzh4OPmjfemD8I@yilunxu-OptiPlex-7050>
References: <20250623094946.1714996-1-yilun.xu@linux.intel.com>
 <20250623094946.1714996-5-yilun.xu@linux.intel.com>
 <20250624134145.GB150753@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624134145.GB150753@nvidia.com>

On Tue, Jun 24, 2025 at 10:41:45AM -0300, Jason Gunthorpe wrote:
> On Mon, Jun 23, 2025 at 05:49:46PM +0800, Xu Yilun wrote:
> > diff --git a/tools/testing/selftests/iommu/iommufd.c b/tools/testing/selftests/iommu/iommufd.c
> > index 1a8e85afe9aa..092e1344447e 100644
> > --- a/tools/testing/selftests/iommu/iommufd.c
> > +++ b/tools/testing/selftests/iommu/iommufd.c
> > @@ -3014,6 +3014,19 @@ TEST_F(iommufd_viommu, vdevice_cache)
> >  	}
> >  }
> >  
> > +TEST_F(iommufd_viommu, vdevice_tombstone)
> > +{
> > +	uint32_t viommu_id = self->viommu_id;
> > +	uint32_t dev_id = self->device_id;
> > +	uint32_t vdev_id = 0;
> > +
> > +	if (dev_id) {
> 
> Why the if? The test should work or skip, not silently skip.
> 
> self->device_id is setup by the fixture, it can't be absent.

It can, when the variant no_viommu.

I agree this should not be silently skipped, see below changes:
Should also apply to viommu_alloc_nested_iopf, vdevice_cache.

+TEST_F(iommufd_viommu, vdevice_tombstone)
+{
+       uint32_t viommu_id = self->viommu_id;
+       uint32_t dev_id = self->device_id;
+       uint32_t vdev_id = 0;
+
+       if (!dev_id)
+               SKIP(return, "Skipping test for variant no_viommu");
+
+       test_cmd_vdevice_alloc(viommu_id, dev_id, 0x99, &vdev_id);
+       test_ioctl_destroy(self->stdev_id);
+       EXPECT_ERRNO(ENOENT, _test_ioctl_destroy(self->fd, vdev_id));
+}

Thanks,
Yilun

> 
> Jason
