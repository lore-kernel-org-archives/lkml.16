Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F30222585
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 09:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747386440; cv=none; b=HhnIrsQ66dXqBsGA6b+hHcvshNB3HzJXzF6QeTP5PupzRWuXMYL7ODGOlcIdDO+6vO6nHjDHlwtJ9FBaY0P1J26PRk8A2GLEFSOXSP9p0DoDcHX+cyukAMx2RLfDp6FkNLQRCVS0456hb/Auu95EPrfhzrVwBVpaXFTXnMKynNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747386440; c=relaxed/simple;
	bh=woPyfxXdUkhsMAmUUBKTxPdGncf9X3NZSxD45aa20LQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LoIrfHd19LMFwxHVofHaMo9gScrd6k/9S/YdV510T3+65S0Ifx9UAbCyI9+hu0fFT6gPDtIGzYLM5s9Imw/CrRl1Y7RpfGdZmZRYNsiDHjegnNBr7KtZc1JujxiXGQG3uqVH3k0cezeRUkYH7u7Pv3EGeh+tKQdwAJDuJR44j6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TmeGG0rf; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TmeGG0rf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747386439; x=1778922439;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=woPyfxXdUkhsMAmUUBKTxPdGncf9X3NZSxD45aa20LQ=;
  b=TmeGG0rf6iYcnG/AEgYPA330xQHBRGsECfB+0sSwVx/AWoczyz60fBPP
   N/1vJ9Lbr5qG+ecItZhPtViH6m3ms06PEhixDcGZq7fqj1nEpTzJ/Hk79
   SbQ+KmoxCumz7hYXTisSvOHWRbQpBB6uJxAEx1Lu2HJe5JNYzQjYSmRLZ
   lcuzAf9nitJZj8nJlG3AlhCgpyfXZnPSecQS7xzAr6NoF4uOMdtHP05y9
   ++6nDAIc/kmtliAfQw9CJrMZZNj8pXvA4bR3v5/N9bEs5yQWzj9V+xWOt
   rlpl9+za9dL7rsdrXXR6mn691HtDadJET1vN55SS9a9OqaZHZecqmDjO5
   w==;
X-CSE-ConnectionGUID: aDtUXqcwSy21f2dhhQSU3w==
X-CSE-MsgGUID: pDItIQmPTMOAQ9GXV9/lng==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60009178"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="60009178"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 02:07:15 -0700
X-CSE-ConnectionGUID: Vh/JjJRiQRO8isXGKGKcWw==
X-CSE-MsgGUID: xve/MdAuSVi4LMseb/oVzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="139119554"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 02:07:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uFr27-000000025mv-2N38;
	Fri, 16 May 2025 12:07:11 +0300
Date: Fri, 16 May 2025 12:07:11 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v1 1/1] genirq: Bump the size of the local variable for
 sprintf()
Message-ID: <aCcAP3eIn5XmNALA@smile.fi.intel.com>
References: <20250515085516.2913290-1-andriy.shevchenko@linux.intel.com>
 <0e79e48c-f466-41f7-bb60-03f45f6b0628@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e79e48c-f466-41f7-bb60-03f45f6b0628@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 16, 2025 at 06:45:04AM +0200, Jiri Slaby wrote:
> On 15. 05. 25, 10:55, Andy Shevchenko wrote:

...

> > -	char name [10];
> > +	char name [12];
> 
> The max irq is ~ 512000, if I am counting correctly, so 7 B should be
> actually enough for everybody ;).

GCC can't proved it. And FWIW, on current Debian unstable (GCC 14?) I can't
reproduce this. In any case this doesn't increase stack usage AFAICT, the array
already have reserved 12 or 16 bytes.

> But well, can we silence the warning in a better way? I doubt that...

With the above said, I think it's pretty much close to the best way.
But if you find anything better, I also would like to learn.

-- 
With Best Regards,
Andy Shevchenko


