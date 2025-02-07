Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2B92206A0
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 14:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738939219; cv=none; b=e0siLzTMwXtJgxu568KDOK7reLGDtgOPJJ4PD+hcylSjk+LRUcH+vfuLuufmlci3T7aLEgS3OmPD1D8Ln7sMrtDpScrk4MMqCHmFU5XElEM6lsV0vY9JrK91akDs6jRmDFRyH9IwQYy3UpoCUVPfAAcA+e0AHJS0hQja9tQHsVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738939219; c=relaxed/simple;
	bh=jIFsdK9IIa9cEJ7JoDQd5uMOx0CFh/dMUcvQBUBDU/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GBRbYnoBQqXTychyTzHA4ScZ3/lYGjVbJLBzd8FskeOWnIp3AZjJ9h5ItOe8DZ6bMcvzzwclOdz8Wg+I0jLDDQlTSeQTgi9GgHtmX7ZkZeRMQlKR9yqTmozz+SYkh5BLvj7t8+J31ZIwY4APPc2rsrZ7olS47wizOPvlbgLEd88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TbCciovo; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TbCciovo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738939218; x=1770475218;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=jIFsdK9IIa9cEJ7JoDQd5uMOx0CFh/dMUcvQBUBDU/Y=;
  b=TbCciovoad31rMEwj+vAAZtY8II2Yoth7PN65I1CRGYMB3H2qBlRpwLK
   hHUPc9/nBvY6VOWSjWWkL7TlQeKEz7puJR6AIHLJ1prwGc1r/xi9v9VhZ
   +LEpyA+C3h00eF34iKLGGgDiww+Lc8U5d7k9vG5mEsl/H9jBd10R/M1ly
   2DhTuYZfw97Xu5JXK6+e6KeMca+ekppMa9iw26EwDHf/NnRMUQ9ty1xDf
   JaMeyQvauzuved1OnN4xheRXgGDg7pQpH04mI06ofeKm5H8QoCyK8uX5i
   7/oA74xWTtowR8lSK2uW5AgxlESIX1W812Civ06GPUjQS3gs4bIoWrALG
   g==;
X-CSE-ConnectionGUID: xpJqIdeDRwe0qI7Y7XVgMg==
X-CSE-MsgGUID: qfAELEOAS/G+x3LOWiqyLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="43240004"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="43240004"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 06:40:18 -0800
X-CSE-ConnectionGUID: xBcxY248Q7WTx2SP0x/kUw==
X-CSE-MsgGUID: T1ezgydSRRi04Vzf07MPNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111983618"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 07 Feb 2025 06:40:17 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 2E10E125; Fri, 07 Feb 2025 16:40:14 +0200 (EET)
Date: Fri, 7 Feb 2025 16:40:14 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] kthread: Return the assigned value rather than 0
Message-ID: <Z6YbTgpbimhonft2@black.fi.intel.com>
References: <20250203164855.3699026-1-andriy.shevchenko@linux.intel.com>
 <Z6FjGV1-CxE12f8L@pavilion.home>
 <Z6IkFec26HmiwM4H@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z6IkFec26HmiwM4H@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Feb 04, 2025 at 04:28:37PM +0200, Andy Shevchenko wrote:
> On Tue, Feb 04, 2025 at 01:45:13AM +0100, Frederic Weisbecker wrote:
> > Le Mon, Feb 03, 2025 at 06:48:55PM +0200, Andy Shevchenko a écrit :
> > > Recently introduced kthread_affine_preferred() has a bug that the value
> > > of ret variable set but not used. This breaks the compilation with error
> > > (assume default CONFIG_WERROR=y and `make W=1` to run the build):
> > > 
> > > kernel/kthread.c:862:6: error: variable 'ret' set but not used [-Werror,-Wunused-but-set-variable]
> > > 
> > > Fixes: 4d13f4304fa4 ("kthread: Implement preferred affinity")
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > 
> > Thanks but I already have it queued there:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git/commit/?h=kthread/fixes&id=1b0332a42656b798bea867631d739de023633ec6
> > 
> > I'll do a pull request shortly.
> 
> I'm fine with any approach as long as the issue will be fixed rather sooner.

Any news? As of today no appearance of the (alternative) fix either in upstream,
or in Linux Next. What's the plan, please?

-- 
With Best Regards,
Andy Shevchenko


