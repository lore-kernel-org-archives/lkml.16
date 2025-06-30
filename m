Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D48433A4
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751266196; cv=none; b=iLae571oRDc/sf5azTUmGT+Gt+U44ju9KmoDMLQ5FIxcT+scdazJqqCJb069vmBIOJihNzCk3m9+PY3dAmsL5LhLH/6+r0qYWG+yVUgxqQBv6JMRM2Hp0mghMc4wwaOSVKaVFFvntdOrMTskSRdgObA257BNMqdIc5tSLjDIfgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751266196; c=relaxed/simple;
	bh=eHUuaA4RfF+uW9zm/55GGGBJbAeQ0GdtoByOHi+5vfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XtFOcrJ8I4L9RVWi+1XNvi4CzwGLYY5rkN/ymXr8IsNJQUAy2FP47j2NvEWuXrnXbN6GPfsrbu53X+kGcUwXPPuhLuh7afE8QHf/706PQCw4VInV9coD+j3iDGCkIsXWVWME5cYdhUA2eQEI6i2Fs58Z8JZSnNcGZ8JuQOH1Di8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=maFBdTrQ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="maFBdTrQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751266195; x=1782802195;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eHUuaA4RfF+uW9zm/55GGGBJbAeQ0GdtoByOHi+5vfI=;
  b=maFBdTrQU6xcg6D4ncPqA5kIwEWbGsrBEtlcdfYfXXPB0Tb9KlDGtfCP
   eMxBbBlEnaasLEMY4V5VcX3CmI1z+yZsXUayGSF6q2QCEsq8uKCL+7ABo
   d0FDx+KWLFZbAvvWGLkFIFom6DwbOs3/6PW77lVsEn6+F8G4tYfUxyfum
   X0CoCSao385yZt6aXwwpIu/CGARemjOyK4L+lRoM0LL+5byNr4QGD/1Sq
   1aRhSPGWtgipCLqDdLEr7UD2BCcF8qOiHPsSDoQ9AD2JvBApmwxUcXvxr
   Vc67aELqfVScoEN2dw+FBpE609yASLM0IG5+X+Z55oVPc5YaIVISM8ltq
   w==;
X-CSE-ConnectionGUID: LyjVFNwITUGku/znVwXTnw==
X-CSE-MsgGUID: VqOUIJg1SgeCbGvWHMD/Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="64079798"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="64079798"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 23:49:51 -0700
X-CSE-ConnectionGUID: 2WnOCjOVQNKlR15kNVQnWA==
X-CSE-MsgGUID: 50bHyLX8Qcm3bl+aw5hy1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="154083462"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmviesa010.fm.intel.com with ESMTP; 29 Jun 2025 23:49:47 -0700
Date: Mon, 30 Jun 2025 14:41:56 +0800
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
Subject: Re: [PATCH v3 1/5] iommufd: Add iommufd_object_tombstone_user()
 helper
Message-ID: <aGIxtMZa1UsvACs4@yilunxu-OptiPlex-7050>
References: <20250627033809.1730752-1-yilun.xu@linux.intel.com>
 <20250627033809.1730752-2-yilun.xu@linux.intel.com>
 <BL1PR11MB5271410ADB704F459C77BC248C46A@BL1PR11MB5271.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL1PR11MB5271410ADB704F459C77BC248C46A@BL1PR11MB5271.namprd11.prod.outlook.com>

On Mon, Jun 30, 2025 at 05:52:26AM +0000, Tian, Kevin wrote:
> > From: Xu Yilun <yilun.xu@linux.intel.com>
> > Sent: Friday, June 27, 2025 11:38 AM
> >
> > @@ -239,6 +239,7 @@ static int iommufd_fops_release(struct inode *inode,
> > struct file *filp)
> >  	struct iommufd_sw_msi_map *next;
> >  	struct iommufd_sw_msi_map *cur;
> >  	struct iommufd_object *obj;
> > +	bool empty;
> 
> move into for(;;) loop

Yes.

> 
> > 
> >  	/*
> >  	 * The objects in the xarray form a graph of "users" counts, and we
> > have
> > @@ -249,23 +250,35 @@ static int iommufd_fops_release(struct inode
> > *inode, struct file *filp)
> >  	 * until the entire list is destroyed. If this can't progress then there
> >  	 * is some bug related to object refcounting.
> >  	 */
> > -	while (!xa_empty(&ictx->objects)) {
> > +	for (;;) {
> >  		unsigned int destroyed = 0;
> >  		unsigned long index;
> > 
> > +		empty = true;
> >  		xa_for_each(&ictx->objects, index, obj) {
> > +			empty = false;
> >  			if (!refcount_dec_if_one(&obj->users))
> >  				continue;
> > +
> >  			destroyed++;
> >  			xa_erase(&ictx->objects, index);
> >  			iommufd_object_ops[obj->type].destroy(obj);
> >  			kfree(obj);
> >  		}
> > +
> > +		if (empty)
> > +			break;
> > +
> >  		/* Bug related to users refcount */
> >  		if (WARN_ON(!destroyed))
> >  			break;
> >  	}
> > -	WARN_ON(!xa_empty(&ictx->groups));
> 
> I didn't get the rationale of this change. tombstone only means the
> object ID reserved, but all the destroy work for the object has been
> done, e.g. after all idevice objects are destroyed there should be no
> valid igroup entries in ictx->groups (and there is no tombstone
> state for igroup).
> 
> Is it a wrong change by misreading ictx->groups as ictx->objects?

Sorry, this is a true mistake.

> 
> > +
> > +	/*
> > +	 * There may be some tombstones left over from
> > +	 * iommufd_object_tombstone_user()
> > +	 */
> > +	xa_destroy(&ictx->groups);
> > 
> 
> And here should be ictx->objects?

Yes, thanks for catching up.

-       xa_destroy(&ictx->groups);
+       xa_destroy(&ictx->objects);
+
+       WARN_ON(!xa_empty(&ictx->groups));

Thanks,
Yilun




