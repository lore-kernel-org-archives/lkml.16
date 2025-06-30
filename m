Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CE72580FB
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751279206; cv=none; b=Hfp1fPJqEazCTmBR+MAulac/V0FrWILJ3jCN17zIMnUuCNGEbKHVfdbBJuJtm+GuXW367YzeKOC4o2ML3KgQpNbPjJdntVynVfjnt5GAk0yUgMZ7K153JILfCAR9g4cr1HSZE7wKuOlDu4BNnUNqho1zA9kwapeBArChpLBJ6lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751279206; c=relaxed/simple;
	bh=lP9cZ5ZVd213PgYvBxRjMQzsYmVuhyx9RNU0p02YOoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OvGBYdR4igamwkdRt+Nxa4MSUxyAynSYXLy7eHEmD/uiHB6QUKlWNo/xZq6c8YHrEW1QwiKb+sclI1jQ0nLN5X8oS+o7V8Qw+NJyrD3Zv667OnHjeWl5/2+PLnfKfgDpHdKO4nuOABn+lJyMzEn/apAOWNbAvxKxqD4uFedL74w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fPfesW2j; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fPfesW2j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751279206; x=1782815206;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lP9cZ5ZVd213PgYvBxRjMQzsYmVuhyx9RNU0p02YOoU=;
  b=fPfesW2j89FgU9T2NtE++pAB/wY7F9nYLJSE8cu/g+95rKdoM6I2GP5L
   X82b82zVfgnXmGANbsRoueChkG/d0wVRI2DmMgpjzXZJ5aT5z3W5tbsNH
   TZkJj1JLT/1SnOJsf2+F9mV9y+NDJU7dX+O4nLqthOrDClXLAUZAcrV1y
   X43o/LFVCR9cG8Shh5C9ZAh99GzB6noLH9nZu3dQq5sQp30cNBO3IEy6o
   TmQ34mRsd98Ij3ef+Oc0oVEm6rj949xqcEcIVXtH/A+NmAPvQt/KJ9urj
   h5gtmzHIe9kVD4DoYhrew3ee271Tv5nCXHqw+PjMuKfxYjCfBd8R7FxT0
   A==;
X-CSE-ConnectionGUID: CZh3T9sfRweohpKnXch1DQ==
X-CSE-MsgGUID: DnPl9310TDWt9o/UJyptyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53649399"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="53649399"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 03:26:45 -0700
X-CSE-ConnectionGUID: 6QCD6s3aRCuhF1tFyrQ++Q==
X-CSE-MsgGUID: ifNOHc7BR3KyP2lv8WUJbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="152900050"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by orviesa006.jf.intel.com with ESMTP; 30 Jun 2025 03:26:41 -0700
Date: Mon, 30 Jun 2025 18:18:50 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "jgg@nvidia.com" <jgg@nvidia.com>, "jgg@ziepe.ca" <jgg@ziepe.ca>,
	"will@kernel.org" <will@kernel.org>,
	"aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"joro@8bytes.org" <joro@8bytes.org>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"nicolinc@nvidia.com" <nicolinc@nvidia.com>,
	"aik@amd.com" <aik@amd.com>,
	"Williams, Dan J" <dan.j.williams@intel.com>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
	"Xu, Yilun" <yilun.xu@intel.com>
Subject: Re: [PATCH v3 2/5] iommufd: Destroy vdevice on idevice destroy
Message-ID: <aGJkitx6wjfQ888t@yilunxu-OptiPlex-7050>
References: <20250627033809.1730752-1-yilun.xu@linux.intel.com>
 <20250627033809.1730752-3-yilun.xu@linux.intel.com>
 <BL1PR11MB52712CE938B57E41C34580908C46A@BL1PR11MB5271.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL1PR11MB52712CE938B57E41C34580908C46A@BL1PR11MB5271.namprd11.prod.outlook.com>

On Mon, Jun 30, 2025 at 06:27:51AM +0000, Tian, Kevin wrote:
> > From: Xu Yilun <yilun.xu@linux.intel.com>
> > Sent: Friday, June 27, 2025 11:38 AM
> > 
> > +static void iommufd_device_remove_vdev(struct iommufd_device *idev)
> > +{
> > +	struct iommufd_vdevice *vdev;
> > +
> > +	mutex_lock(&idev->igroup->lock);
> > +	/* vdev has been completely destroyed by userspace */
> > +	if (!idev->vdev)
> > +		goto out_unlock;
> > +
> > +	vdev = iommufd_get_vdevice(idev->ictx, idev->vdev->obj.id);
> > +	if (IS_ERR(vdev)) {
> > +		/*
> > +		 * vdev is removed from xarray by userspace, but is not
> > +		 * destroyed/freed. Since iommufd_vdevice_abort() is
> > reentrant,
> > +		 * safe to destroy vdev here.
> > +		 */
> > +		iommufd_vdevice_abort(&idev->vdev->obj);
> > +		goto out_unlock;
> > +	}
> 
> let's add a comment that vdev is still freed in iommufd_destroy()
> in this situation.

Yes.

> 
> > -void iommufd_vdevice_destroy(struct iommufd_object *obj)
> > +void iommufd_vdevice_abort(struct iommufd_object *obj)
> >  {
> >  	struct iommufd_vdevice *vdev =
> >  		container_of(obj, struct iommufd_vdevice, obj);
> >  	struct iommufd_viommu *viommu = vdev->viommu;
> > +	struct iommufd_device *idev = vdev->idev;
> > +
> > +	lockdep_assert_held(&idev->igroup->lock);
> > +
> > +	/*
> > +	 * iommufd_vdevice_abort() could be reentrant, by
> > +	 * iommufd_device_unbind() or by iommufd_destroy(). Cleanup only
> > once.
> > +	 */
> > +	if (!viommu)
> > +		return;
> 
> Just check idev->vdev, to be consistent with the other path.

I think there is problem here. From your comments above, vdev could be
aborted/destroyed by iommufd_destroy() again *after* idev is freed.
That means in iommufd_vdevice_abort/destroy(), usage of vdev->idev or
idev->vdev or vdev->idev->igroup->lock may be invalid.

I need to reconsider this, seems we need a dedicated vdev lock to
synchronize concurrent vdev abort/destroy.

Thanks,
Yilun

