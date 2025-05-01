Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AD919A297
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 12:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746102155; cv=none; b=LEk70LLFSDqSqSeIfHtQ7GBLMdFN6l1zf70Wq2dpex8ePebOVF+HWQEmyWs/2EDunBJaacw+i+NNmUet7dHsGxFsPzjE3JFQGtkWsqevT1fTw29XeyTtFtiDx3UgEO5SqlxIjp3B683/Px/ynB3hTW/wh09P5SXEWUztbld/8Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746102155; c=relaxed/simple;
	bh=iZADHagPzlbOXuR7Zz7ck4NkeUdS+gmooYnVB60pVpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OhQLpzSOuy5pEAixmS91u5VZtt7MyhjSxEckAmtH8n6CEuFmERAmxEuuBFgF1/0H7Lg8oQBZkcNYltOzAOx5gD97J4PycGppH6HJtzPqfddxZ5ApFBDq9fXXpMuwMa/8iYbBcWNPs2aCMALaNdy+EFfO+9Q/kxtjB7X2XY/NFpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IC9IG0ys; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IC9IG0ys"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746102153; x=1777638153;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iZADHagPzlbOXuR7Zz7ck4NkeUdS+gmooYnVB60pVpk=;
  b=IC9IG0ysYVwAjmRJ/ELdM7wC9smpKDg1vQtSj4taM9pz+VpF3yuRywsN
   GdSVQmf6fF+hdnlzez1d0yhbVFO7K8Huzy/zTRsQwVPae+CH0fScorh/e
   raOWVdWdJOxc8oN5mZtrm3ZE6DsqJqTWsT5ew1cibBgruLd28RFTTFvIW
   NSEaMeHQvtXZ1OZOGpGqdRhdi0r2owfpnjR4X6C9/pQ/vNccM9OyRwxd3
   d9nNbycyjGxJEGiOgaqno6mOJKTfxPFl4QXClt4tDT4Y/ELA+F3nEVY6b
   ZUpqzHadTYDV7nrWkORvsR/PyZIOr2xDQK2mVRT+ZFG09wRaKfBcCCJ78
   w==;
X-CSE-ConnectionGUID: F/drxbV0S7inKXbW0m5xDA==
X-CSE-MsgGUID: 4v4wOnhaQ6OSt+kyp499MQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="51593457"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="51593457"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 05:22:32 -0700
X-CSE-ConnectionGUID: eaTPhNftRoyIC0JLOldXZg==
X-CSE-MsgGUID: ubKq23+6SiStcolwEQQAAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="134891495"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 05:22:29 -0700
Date: Thu, 1 May 2025 15:22:25 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: jiangfeng@kylinos.cn
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	rodrigo.vivi@intel.com, andrealmeid@igalia.com,
	christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm: Fix potential overflow issue in event_string
 array
Message-ID: <aBNngS4XZR4ZtdAL@black.fi.intel.com>
References: <20250409014633.31303-1-jiangfeng@kylinos.cn>
 <Z_YSo9YBbsLaYzkO@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_YSo9YBbsLaYzkO@black.fi.intel.com>

On Wed, Apr 09, 2025 at 09:24:41AM +0300, Raag Jadav wrote:
> On Wed, Apr 09, 2025 at 09:46:33AM +0800, jiangfeng@kylinos.cn wrote:
> > From: Feng Jiang <jiangfeng@kylinos.cn>
> > 
> > When calling scnprintf() to append recovery method to event_string,
> > the second argument should be `sizeof(event_string) - len`, otherwise
> > there is a potential overflow problem.
> > 
> > Fixes: b7cf9f4ac1b8 ("drm: Introduce device wedged event")
> > Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
> 
> Reviewed-by: Raag Jadav <raag.jadav@intel.com>
> 
> Thanks for the fix.

This one seems got lost in the noise but important for 6.15.
Any takers?

Raag
