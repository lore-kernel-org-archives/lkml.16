Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79ACA42065
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750748122; cv=none; b=FXG0qbYNKxIaxYPaFCLoezENUCMLBKM4h7+U+vBRrkFNwSz79fKBSINPsQZlNwdNngoyEw+vd782c+QgpHfc93mtsVIXJ6O3w526RVBQkFo/A+0NyLA5DwF329jbDBydN7myABODcoMDFAujFLYsQEsAaEHUHlBbJyI551mvTsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750748122; c=relaxed/simple;
	bh=tXHl/fqunYnn9miDE1bZcQNgfI8xMAEVRtl7KrUO6C8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KGe+FmA4OImJxVRu85YOd7lDySvVbcM3GogMgGG6fSZedGH6r25peAcqmpiGl3JlA+bGmWIEZt7E8Wpfln1p30r6hl4rcsOHfrIpvLgu6IxpCiIWPUFYiqZ7IsQ/atoA9fDjcpOebYRFfF/cl6pJbOeKmUXZGSvmB6KAAUGZ+/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mfdqEhHT; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mfdqEhHT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750748121; x=1782284121;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tXHl/fqunYnn9miDE1bZcQNgfI8xMAEVRtl7KrUO6C8=;
  b=mfdqEhHTp6oig5U1AhL4eQcynP6TXATqztrCJrey8YFCjsbgGqeVUKvx
   7GMI4sIrcShcn45nnPH2wyMl7BUxmBaz+/Vp/KxafY6SHur7pDNoUq9YS
   ffFggWgLFgdAlBRvwzGRm23p4GqasKjqCAZWDYW/YuJOmKLOxl5MY6L+V
   3serwyjp+y+zTHjx7ba9QB3jsommPZaAGNLjaAZZ4XK8NzcMNeWtVnsyn
   RgUCjUGjRyYwL9wrLKdRHP+VJaOmrq+F3pBIweLI4SZ77+4hO76wZVG3s
   sadHt06WcWcT0Bm/+6GqkFknp1Kzkem9cyczhpB2N89NCFYO/eLX2/vCM
   Q==;
X-CSE-ConnectionGUID: 19Ig1l+BSPiEQPNApDn9DA==
X-CSE-MsgGUID: CYIqTr+/QmKlkYlbOZ6P6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52200145"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="52200145"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 23:55:20 -0700
X-CSE-ConnectionGUID: J+lBBPhlSe66ItEBZ8CM5w==
X-CSE-MsgGUID: GxudAC+RSpqdHxvxokPFZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="151967165"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmviesa006.fm.intel.com with ESMTP; 23 Jun 2025 23:55:17 -0700
Date: Tue, 24 Jun 2025 14:47:44 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: jgg@nvidia.com, jgg@ziepe.ca, kevin.tian@intel.com, will@kernel.org,
	aneesh.kumar@kernel.org
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org, joro@8bytes.org,
	robin.murphy@arm.com, shuah@kernel.org, nicolinc@nvidia.com,
	aik@amd.com, dan.j.williams@intel.com, baolu.lu@linux.intel.com,
	yilun.xu@intel.com
Subject: Re: [PATCH v2 3/4] iommufd: Destroy vdevice on idevice destroy
Message-ID: <aFpKEO7/+Xf6Wu+d@yilunxu-OptiPlex-7050>
References: <20250623094946.1714996-1-yilun.xu@linux.intel.com>
 <20250623094946.1714996-4-yilun.xu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623094946.1714996-4-yilun.xu@linux.intel.com>

> +void iommufd_vdevice_destroy(struct iommufd_object *obj)
> +{
> +	struct iommufd_vdevice *vdev =
> +		container_of(obj, struct iommufd_vdevice, obj);
> +
> +	mutex_lock(&vdev->idev->igroup->lock);
> +	iommufd_vdevice_abort(obj);
> +	mutex_unlock(&vdev->idev->igroup->lock);
> +	wake_up_interruptible_all(&vdev->ictx->destroy_wait);

Should change to

        wake_up_interruptible_all(&vdev->viommu->ictx->destroy_wait);

since vdev->ictx will be deleted.

Thanks,
Yilun
