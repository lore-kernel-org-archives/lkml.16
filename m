Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A31134CF;
	Fri, 25 Apr 2025 18:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745604643; cv=none; b=IEycHt+qoY5RBNvECzvNDHDAJgifSDsYRvFbr0Vy5RkB3EbZOU10/iEUzsEN68uXBmWfbZwOTUwfg4KxhNX9W9z343HlPk2UZrLOx3S9Im5/krAxk9rTa060Fmf6XWqewh3QFaOW7ZEv5LZl/v6BiOSWLMT+8BF1LTKAaaTaPnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745604643; c=relaxed/simple;
	bh=Ccbi8as/srm/a+25bl0H0ePfhO77Kyh3r8GHqSY5bFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fQG6eQqGX4ur5o6zB0x3+rXKqtpBb9CGP+EMiQvvVnrzkMvDn28zowxaXxsafadT5Wu0l1X86zHOUt581PEu2j6H4fCe6XkWlSjsXSfF0+0CdbGDKp12HUrKnKKOZAB3vY+LY9dVuKJ0Sc/0i19vaK/veWqWjqlJqGsPkC9FyF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h/XZEPYy; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h/XZEPYy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745604641; x=1777140641;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ccbi8as/srm/a+25bl0H0ePfhO77Kyh3r8GHqSY5bFQ=;
  b=h/XZEPYyDbSHsn1Pl6ZSyk+cwCJ8pBt/bANChkGicN7qYBmJz08d+inK
   OptkBYUlz2KGLEugbe8Aid0+Du5TjWtzMAqS3vgm8nrKqx7+40r9AdNqi
   um4FZb4SKvZ766gVXR/xOdVJRi5fFKrRB6mPOew7RaFN+Ts7/CSrG12i2
   bK2/6FDGPkkrLjuuey1xmeTP01qfwFUDUpvWO98rpaeZI9jjHBFE/Cref
   dhIYmYR7wiy2J9imlOcGG+vAycoOV5/cv4WXu2Y3joSqP/61Tc1cMTajf
   VDw2Lbn0r6zWPzeV7DcwMXURMy4gM5jGR8+GKX7nRhfFJ9v/XIUo8Gozs
   A==;
X-CSE-ConnectionGUID: msuy3VGESgmBLnWgJ+X9FQ==
X-CSE-MsgGUID: 9gYxAXS3RFCD/ycqtZJ57A==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="51081899"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="51081899"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 11:10:35 -0700
X-CSE-ConnectionGUID: tp6VQSH5ShqchNen0u95fw==
X-CSE-MsgGUID: iYQ45yLeTQW6suHwiQpUGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="163931570"
Received: from smile.fi.intel.com ([10.237.72.55])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 11:10:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1u8NVN-00000000LCb-3DJm;
	Fri, 25 Apr 2025 21:10:29 +0300
Date: Fri, 25 Apr 2025 21:10:29 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Akira Yokosawa <akiyks@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] docs: Makefile: store __pycache__ at the output
 directory
Message-ID: <aAvQFen6D5ukjj-x@smile.fi.intel.com>
References: <cover.1745539360.git.mchehab+huawei@kernel.org>
 <1b9e7f34c1d99a27a8abb308da3221b4663b5693.1745539360.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b9e7f34c1d99a27a8abb308da3221b4663b5693.1745539360.git.mchehab+huawei@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Apr 25, 2025 at 08:08:53AM +0800, Mauro Carvalho Chehab wrote:
> Instead of blocking creation of *.pyc cache, store python
> cache under Documentation/output/__pycache__

Do we need the below in the commit message?
I think having statistics is enough and this can be moved to the cover letter.

> 109 directories, 634 files

-- 
With Best Regards,
Andy Shevchenko


