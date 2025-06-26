Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C56202990
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 05:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750914410; cv=none; b=QHex0FqC6l4n2T+NxbpekyY5nG5KXVIEeNrWV/GvPa3oil+8pqrpxqWVx7SRfbJpd61kXkN26Xv/cHozIvYfeSeFKunWnWfR+J1IjX1yg8adgddNFbz1uDn0ZhK8E6wGxxNVrdEPWVTs7YgEBVyHOhS3YBRTfc97CJVNGgHV3Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750914410; c=relaxed/simple;
	bh=X7Sjk2ka0Kelqb0sjdo5AsKsObeeRUiz7gwR3nkrZnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WL2BfN4okhwJW4KmzwUn6AFc2yNKAvpUe0960L0z8b5RsPWXiQuAio9Ohe4w0+JGF8VNmEbMTqfepou9nyHJ0Qf3HlHZ7wzIJDSXEApG8geSe0mnA3jetATH3VKe5LkpT9W6wMGjGHru44RjmW6EhWfKKHLpc1nkH9XmLsZsLos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jV1JW7kb; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jV1JW7kb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750914409; x=1782450409;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X7Sjk2ka0Kelqb0sjdo5AsKsObeeRUiz7gwR3nkrZnQ=;
  b=jV1JW7kbS54Dc2Mgkgp+CY/LJO3IJrChzY0cj8ZgMw8oNjbDAL7UpXCl
   umKrz6XBm03kUUg0GLzgjur/01hd7mWUYWk7i1GRrrPMDrMws7gUds0dq
   0Udxiv3jfh5m3VWwSpHii6Het68bR4Zh+Eu0DgOYCJ57BIP/NQ3G4NQ62
   5mxekSMCvgyeOUEZ5wnXMwWzjxEyMwixQ6D33Q4Lu5Yc6pBczYRGQHC43
   jJD6vruS7U3lTrxk/GvGl73pnDtQ4OxPL14UgUgn9A3AeR1F0aSyAKe6G
   BW7VRUmXHnniiNij5wzZvl2oOE77Td8zSjXtiZNLx85aUG1N98HduNH25
   g==;
X-CSE-ConnectionGUID: 8yZmm5V8Q5yZWFQcOK+7JQ==
X-CSE-MsgGUID: QRfGePa2SIqDeUN15ZsesA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="63796514"
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="63796514"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 22:06:49 -0700
X-CSE-ConnectionGUID: dHz4p7K0Q2CozheQPadrjg==
X-CSE-MsgGUID: h2potp3fTl6LIjl7AwgsSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="156672267"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmviesa005.fm.intel.com with ESMTP; 25 Jun 2025 22:06:45 -0700
Date: Thu, 26 Jun 2025 12:59:07 +0800
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
Subject: Re: [PATCH v2 3/4] iommufd: Destroy vdevice on idevice destroy
Message-ID: <aFzTm76sdoYJ9hpG@yilunxu-OptiPlex-7050>
References: <20250623094946.1714996-1-yilun.xu@linux.intel.com>
 <20250623094946.1714996-4-yilun.xu@linux.intel.com>
 <BN9PR11MB5276DCB10B6B08811206C3A28C78A@BN9PR11MB5276.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276DCB10B6B08811206C3A28C78A@BN9PR11MB5276.namprd11.prod.outlook.com>

On Tue, Jun 24, 2025 at 08:22:11AM +0000, Tian, Kevin wrote:
> > From: Xu Yilun <yilun.xu@linux.intel.com>
> > Sent: Monday, June 23, 2025 5:50 PM
> > 
> > +static void iommufd_device_remove_vdev(struct iommufd_device *idev)
> > +{
> > +	bool vdev_removing = false;
> > +
> > +	mutex_lock(&idev->igroup->lock);
> > +	if (idev->vdev) {
> > +		struct iommufd_vdevice *vdev;
> > +
> > +		vdev = iommufd_get_vdevice(idev->ictx, idev->vdev->obj.id);
> > +		if (IS_ERR(vdev)) {
> > +			/* vdev is removed from xarray, but is not
> > destroyed/freed */
> > +			vdev_removing = true;
> > +			goto unlock;
> > +		}
> > +
> > +		/* Should never happen */
> > +		if (WARN_ON(vdev != idev->vdev)) {
> > +			idev->vdev = NULL;
> > +			iommufd_put_object(idev->ictx, &vdev->obj);
> > +			goto unlock;
> > +		}
> > +
> > +		/*
> > +		 * vdev cannot be destroyed after refcount_inc, safe to
> > release
> 
> "vdev cannot be destroyed by userspace"
> 
> > +		 * idev->igroup->lock and use idev->vdev afterward.
> > +		 */
> > +		refcount_inc(&idev->vdev->obj.users);
> > +		iommufd_put_object(idev->ictx, &idev->vdev->obj);
> 
> s/idev->vdev/vdev/

Will adopt these fixes.

> 
> > @@ -124,18 +139,28 @@ int iommufd_vdevice_alloc_ioctl(struct
> > iommufd_ucmd *ucmd)
> >  		goto out_put_idev;
> >  	}
> > 
> > +	mutex_lock(&idev->igroup->lock);
> > +	if (idev->vdev) {
> > +		rc = -EEXIST;
> > +		goto out_unlock_igroup;
> > +	}
> > +
> >  	vdev = iommufd_object_alloc(ucmd->ictx, vdev,
> > IOMMUFD_OBJ_VDEVICE);
> >  	if (IS_ERR(vdev)) {
> >  		rc = PTR_ERR(vdev);
> > -		goto out_put_idev;
> > +		goto out_unlock_igroup;
> >  	}
> > 
> > +	/* vdev can't outlive idev, vdev->idev is always valid, need no refcnt
> > */
> > +	vdev->idev = idev;
> >  	vdev->ictx = ucmd->ictx;
> >  	vdev->id = virt_id;
> >  	vdev->dev = idev->dev;
> >  	get_device(idev->dev);
> 
> this is not necessary now, as idevice already holds a reference to device
> and now vdevice cannot outlive idevice.

I agree.

Besides, Jason suggests use vdev->dev for iommufd_vdevice_abort() safe
reentrancy. I think we could change to use vdev->viommu.

@@ -93,10 +93,17 @@ void iommufd_vdevice_abort(struct iommufd_object *obj)

        lockdep_assert_held(&idev->igroup->lock);

+       /*
+        * iommufd_vdevice_abort() could be reentrant, by
+        * iommufd_device_unbind() or by iommufd_destroy(). Cleanup only once.
+        */
+       if (!viommu)
+               return;
+
        /* xa_cmpxchg is okay to fail if alloc failed xa_cmpxchg previously */
        xa_cmpxchg(&viommu->vdevs, vdev->id, vdev, NULL, GFP_KERNEL);
        refcount_dec(&viommu->obj.users);
-       put_device(vdev->dev);
+       vdev->viommu = NULL;
        idev->vdev = NULL;

Thanks,
Yilun








