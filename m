Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3233C230996;
	Tue, 24 Jun 2025 13:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750770582; cv=none; b=GFsADp2HOkIKPTtsg57eA2eSomQyy0gszv2eoe8sZAW61FMHxSs7Xv3MWpVHF41ybTJtJluSZ2lrqS+UxfPrAbViuTgnLdF0ElKR5QyXHIirxwmLb1DWa7+kbnMtNnY8X4EAWrN6+jJu7VHh+UyeCDG5nZwhMw62qR9tnhzGlgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750770582; c=relaxed/simple;
	bh=dbXZ7nSfq6fTxFvYT5gu9ItR78nhxwfO9MMCL8FkCSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sfpITfzBkz5iT0UJTY2IBfxW7c4Ffh252v/0AN7lfoovraaqSrmUFDjU8R0aVtfQ7cK+j91xzadmIJNpJEmrGoI9mAGWvFJEEyvSgJvpqRl3oQJsbSI+Shnkk3kX4svGL0KLyccKkHDYz3i3jypA72uELuS1gqasru7nYC1EGB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AlTmNgrf; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AlTmNgrf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750770581; x=1782306581;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dbXZ7nSfq6fTxFvYT5gu9ItR78nhxwfO9MMCL8FkCSY=;
  b=AlTmNgrfR+vMS/eJuPy3YZpsoGeJsZZ0xeVUalQmBGg88KkCpLRIY+vM
   I54wX6jEBAY+eMVyLRs03BXq2/UzpAM0kMlXkmMxy+zw7OQs7sS+ZHoXz
   zstJd9/SpmCGRSkFsTp7zdGY7dANHWnZMPleczQZ+txjIKWmH6lrTGine
   FAnOjovbXseZk5jQAR2A262wxNTlEP78YKzG+CedvSWmHjppmrpuDvgcW
   dtShrjbydHiUCrhXw4ZXGP+UxyCwALNVYAxG3PANRI1Z/lp6Rav+strT5
   1Gnnv/O1pkgmOAq3dylh+r5nW6pzLi/cbVODHjayLs7QctBR2dAe6DomO
   A==;
X-CSE-ConnectionGUID: zVFmA7nJT5evOruj/YeCFw==
X-CSE-MsgGUID: Mo6FWSKlTYqrTVb/bTwB6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52877055"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="52877055"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 06:09:40 -0700
X-CSE-ConnectionGUID: zQ5SV2b1Q72K2t9mcS3AZw==
X-CSE-MsgGUID: Gv+nfDZ9S7effF2Crpc1hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="152413419"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 06:09:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uU3P4-00000009TUa-0b6I;
	Tue, 24 Jun 2025 16:09:34 +0300
Date: Tue, 24 Jun 2025 16:09:33 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Petr Mladek <pmladek@suse.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [RFC 1/2] lib/vsprintf: Add support for pte_t
Message-ID: <aFqjje91QnAgg2_h@smile.fi.intel.com>
References: <20250618041235.1716143-1-anshuman.khandual@arm.com>
 <20250618041235.1716143-2-anshuman.khandual@arm.com>
 <aFQYVPmStsIIFcMW@pathway.suse.cz>
 <68cdf649-a273-4d83-b862-6b675a793f18@arm.com>
 <aFqCmgT1k8daroNZ@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFqCmgT1k8daroNZ@pathway.suse.cz>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jun 24, 2025 at 12:48:58PM +0200, Petr Mladek wrote:
> On Fri 2025-06-20 13:32:31, Anshuman Khandual wrote:
> > On 19/06/25 7:31 PM, Petr Mladek wrote:

...

> > Something like BUILD_BUG_ON() against pte_t as either u64 or u32 aka all
> > the sizes the print format is going to support and it should pass on all
> > platforms ?
> 
> Yes, I had BUILD_BUG_ON() in mind. It would be nice if you check at
> least the most known architectures.

FWIW, we use static_assert():s in the file, so may be better to use them.

-- 
With Best Regards,
Andy Shevchenko


