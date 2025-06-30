Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BAE221DAD
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751268737; cv=none; b=hiBpmGEjEOHQHT+Y2Ki7iOphQ6lbNqENZhF/ecHN/knBuW3DHKf4BK28BAPNBDodfqt28G0IDdmX23bdGWTyTZMIHAAWXX1Wo/D40vSpIWYnKocRrp3eqNvWMHynRY/OvCCYu42d6EFal6AgFmjvA/wJwKMqDnp/jhSBXsoYB+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751268737; c=relaxed/simple;
	bh=cF4T8tL5KjG3b4BVZT+0sC1fmoC6bML2W8hvwNVQEWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QF5jBrWtmohLgvOWMGqLeGv4BCFKacu1qspNUSPV7C9cYb1fZTJiXhHlAm7kv1esFosUPFk2j7zGlYMWsM00poLCEREH6qTu32WOp10sUhKf3fZ5J6OrqzI/qMdYMCvAKo90W1K7zMq5qXsgvigs45TpdfUOhRpUUX4nKRZQDeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IVu3xI0u; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IVu3xI0u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751268736; x=1782804736;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cF4T8tL5KjG3b4BVZT+0sC1fmoC6bML2W8hvwNVQEWg=;
  b=IVu3xI0ucMsSvbguH16UIBSr+itcKavaRp0jBKYrgRKB1a/VHCUGtImQ
   hfbacbSUD/1izueHy0GtgLcO3YbR/+dFT2ARgF5eOyMF+xwf0n8PLHwaE
   DY27wBnh3hgha/IxPkLSoLIQCQqFey5Wyraoa7zUi01VEDTNQ/i60sYRB
   vUlm5JXr0PbEd0ZsRJ4vHMyn/qko8lIx/l+WgINRVyN9rELQEqsZbx11t
   NxgBRdPPMZb2xnhh2rQrymHulG8T98VQxQIOx1LLutczQ/OsArN6I34+t
   eywbQtAUNodpb6u4BhA+Lf2B+kd8V4LM37mJYSorUw2Bdr9heSE7UMSVC
   g==;
X-CSE-ConnectionGUID: Rce+Gfy9RjupaSHw8BKtsw==
X-CSE-MsgGUID: yY5S9cPyS8W22+SkqIRU6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="70918289"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="70918289"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 00:32:12 -0700
X-CSE-ConnectionGUID: cdElIvS8SDuQ1rYa4vQJIw==
X-CSE-MsgGUID: 4K3byNqCTZK9bhTNFWBdPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="153122332"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by orviesa009.jf.intel.com with ESMTP; 30 Jun 2025 00:32:02 -0700
Date: Mon, 30 Jun 2025 15:24:12 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: jgg@nvidia.com, jgg@ziepe.ca, kevin.tian@intel.com, will@kernel.org,
	aneesh.kumar@kernel.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, joro@8bytes.org, robin.murphy@arm.com,
	shuah@kernel.org, nicolinc@nvidia.com, aik@amd.com,
	dan.j.williams@intel.com, yilun.xu@intel.com
Subject: Re: [PATCH v3 1/5] iommufd: Add iommufd_object_tombstone_user()
 helper
Message-ID: <aGI7nHgYNtXhiet9@yilunxu-OptiPlex-7050>
References: <20250627033809.1730752-1-yilun.xu@linux.intel.com>
 <20250627033809.1730752-2-yilun.xu@linux.intel.com>
 <b531ec51-625b-4ea0-a0e1-a90c02cb5e8a@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b531ec51-625b-4ea0-a0e1-a90c02cb5e8a@linux.intel.com>

> > -	while (!xa_empty(&ictx->objects)) {
> > +	for (;;) {
> >   		unsigned int destroyed = 0;
> >   		unsigned long index;
> > +		empty = true;
> >   		xa_for_each(&ictx->objects, index, obj) {
> > +			empty = false;
> 
> People like me, who don't know the details of how xa_for_each() and
> xa_empty() work, will ask why "empty = xa_empty()" isn't used here. So
> it's better to add some comments to make it more readable.
> 
> /* XA_ZERO_ENTRY is treated as a null entry by xa_for_each(). */

Yes. I try to make it more elaborate:

+               /*
+                * xa_for_each() will not return tomestones (zeroed entries),
+                * which prevent the xarray being empty. So use an empty flag
+                * instead of xa_empty() to indicate all entries are either
+                * NULLed or tomestoned.
+                */
                empty = true;

Thanks,
Yilun

> 
> Others look good to me.
> 
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
