Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD3C1A5BA0
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745600854; cv=none; b=A34zeKzduYP4aOFsAI3eBornkyfUPDeQciIX8zdKTjmevOxp1K1+7xIvSTgGLwlpMdZZqbQoF/Ma2NbcMaeJ42a9wXfvDWTrM8k9bOWHS+NZFcz/Ldem1FJZnkob5azVZVxVZOUpFuPQIPuGLPHiesgqctmOM2qCaIMdpozJ2Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745600854; c=relaxed/simple;
	bh=xACxU08YfavSIBhz1z+Mxxtk2BAK8e0mIyI+1/SYI6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gCmZiuFWfAJcQ/6aIUwRbRF5SGHZRwC+41cj1qVWQKaK4M/v6gYww/ElCZfY7dQRnDYAiNtnFnXmKwbb9rGmEmCPZiL/IOq5pPAmVrd6gD5i+YF+88597WHuusvHTNClhN2g9tSYxwkGktSLUPXCL7wyw/wt0T7i+ni2FP0apFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QsnCd9rw; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QsnCd9rw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745600853; x=1777136853;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xACxU08YfavSIBhz1z+Mxxtk2BAK8e0mIyI+1/SYI6A=;
  b=QsnCd9rwzCRJZETlUad2oZn/AShIKCsiZiUSzxwNXQ3gaT1Mewa5GRW3
   zCiJKwGZuV7N5PlK6y91nMF9DffHXM8ra/+34xYKIv7ANwYfLLtsttRW5
   zT+AHjZ7/oILnfMeTMCCYQoeNKXp/qTp+o1ctsP5i78Sndqz3ElY3RGrv
   Qjf2fY1JgdZjb7PmOyf3nW25/xsbQItQBbrNMCNwVoAl0v/oCAt/2GMh7
   kbcm1kRxW81Sq2e11bktTB93DwgCVu7u8nLzFmiGd1kAJv+U4MyqTQRwf
   JsO3tCoSjDSmqiMW6OtQQtdg8ktpz2ZgQav9UeizZcJzRopcEBsYSWypA
   A==;
X-CSE-ConnectionGUID: vyURRx98RAKQzz108o0hGA==
X-CSE-MsgGUID: ZKBV09uoSVe7OTeHzlRjgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="47360000"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="47360000"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 10:07:32 -0700
X-CSE-ConnectionGUID: Idg15IsVQnizmjaa/0I/OQ==
X-CSE-MsgGUID: 6A7BFc5BQimxFwVh19BGhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="132695902"
Received: from smile.fi.intel.com ([10.237.72.55])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 10:07:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u8MWL-00000000KIx-01d2;
	Fri, 25 Apr 2025 20:07:25 +0300
Date: Fri, 25 Apr 2025 20:07:24 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Christoph Lameter <cl@linux-foundation.org>,
	David Rientjes <rientjes@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Harry Yoo <harry.yoo@oracle.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v1 1/1] mm, slab: fold need_slab_obj_ext() into its only
 user
Message-ID: <aAvBTL7vVLc6iqsD@smile.fi.intel.com>
References: <20250424164800.2658961-1-andriy.shevchenko@linux.intel.com>
 <202504250357.9ZZudhto-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202504250357.9ZZudhto-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Apr 25, 2025 at 03:41:15AM +0800, kernel test robot wrote:
> Hi Andy,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on akpm-mm/mm-everything]

Yes, it's fixup to the Linux Next commit which is not in Andrew's tree AFAIU.

-- 
With Best Regards,
Andy Shevchenko


