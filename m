Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9331AA786
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 06:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744179884; cv=none; b=nK5ix18UHWCWPgMhfcBns1X9SeGIqMYWR+zev+mK0yK88DVrt+GfmEdvR38ffdP4HZVcKbv5LHWe0Z2DF6vWJOXMmQoJ80AI9Y03/y/IMCs5W9SeHclFi+hYMMOBNtaXY6fTsTc+AcQ4Jz1uBIfU/KnKnZ7yD8WNg5Yk9kHaoUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744179884; c=relaxed/simple;
	bh=liMyIG7/4mCzxn6tmCcAdM+q9KqgorkJlhO8n903kjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H7PmFPe6wpkS7FKqsiQux64at3tGLQn1uqoUpgdGrgOQc/6PK/SImkjZa13n5vzHbzyJCfE01fOieEtr4fRusV4yZ6CRQgGsCtUtQWLnN1IUddjPPf2diSw1MsyElFmYuiuMpKlpKjEGSE42GYPMNEvVuzC2sq/HoZVLveMmSZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IvgQIXlP; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IvgQIXlP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744179883; x=1775715883;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=liMyIG7/4mCzxn6tmCcAdM+q9KqgorkJlhO8n903kjM=;
  b=IvgQIXlPBEaA8e+1uLNXSUK2QWs0dhdb1YVh4LBhnffmj805JOL9By5m
   JjSJgJY7xZN78Z1SQpkCXsqZtXFBRdWxnQarRwm5KbPOSkzJU2wiyjXlB
   p6K9e/Vo0u/uGJQ01pW6ac8v0SaUrpKspKswRPiq0QARsgDrK/Gb6We5R
   S2NO7wi6RyVn0tCFEDHFsw6t7yhKjTqTZSiiWR03pRq/Eg8uDjy/9rXvr
   H5NSsRiUXe702CTfsO8m6nKPVb86IY2h8c5WbBlZUQwl10HXZF1+iYCka
   Ug6NBBcwY+WUgndVbE9ykLr+PFvW4C2BGSL4Cb5dRjus9A88dRqWn3lCD
   Q==;
X-CSE-ConnectionGUID: //+AMG7KQKedMHSN5Smpaw==
X-CSE-MsgGUID: hiJKv1iZQxq5jxxuP4o3lQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45769335"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="45769335"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 23:24:42 -0700
X-CSE-ConnectionGUID: ArX8oMHbQZ+GSIsQI/ir6A==
X-CSE-MsgGUID: 1oqwE9+3SdCqGmqUbtY7Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="132614748"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 23:24:38 -0700
Date: Wed, 9 Apr 2025 09:24:35 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: jiangfeng@kylinos.cn
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	rodrigo.vivi@intel.com, andrealmeid@igalia.com,
	christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm: Fix potential overflow issue in event_string
 array
Message-ID: <Z_YSo9YBbsLaYzkO@black.fi.intel.com>
References: <20250409014633.31303-1-jiangfeng@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409014633.31303-1-jiangfeng@kylinos.cn>

On Wed, Apr 09, 2025 at 09:46:33AM +0800, jiangfeng@kylinos.cn wrote:
> From: Feng Jiang <jiangfeng@kylinos.cn>
> 
> When calling scnprintf() to append recovery method to event_string,
> the second argument should be `sizeof(event_string) - len`, otherwise
> there is a potential overflow problem.
> 
> Fixes: b7cf9f4ac1b8 ("drm: Introduce device wedged event")
> Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>

Thanks for the fix.
