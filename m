Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528F1229B0E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 14:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744122975; cv=none; b=FMFPqT6C+/SAbV+ghUhjUtMs9tmWhKSS97HrUagkjnRAEdySM0wPARFGzQGOFwlwx9SAEKkOcY/yPKU1rzTad9jvo/4cVuSqcbNyhG0MNkgcVdATF+h4aLpyNPHeq74ihHPeGB9znT+Gh+RNdgDh9A2A+y8f0gYOSqov7X6XkBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744122975; c=relaxed/simple;
	bh=1FfTJO/QLlag6WFx411/x8xKsrT7nnIgrMSC3imzVtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ny7qSWEReTV0FFJqmfS47zqYbOYTHEQhFiYbotYzQJV7D7CV5xNBEvhRZg+LsHEkhr4FbcfchL/JLHuwi/XLq5C0KLO4UWJQkw2XOcxvLwVGZJZLdTWM6ccWnRbISF0PDsFnEMTAj4AL0lNq6zcXbBF8Iy04BzX9Nno5oTekQLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LV7/MKYS; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LV7/MKYS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744122974; x=1775658974;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1FfTJO/QLlag6WFx411/x8xKsrT7nnIgrMSC3imzVtY=;
  b=LV7/MKYSZLv6vzs6s8KqFOgyjVo8xEkQzX/ILUJDonFQFCVFPca7Hr5/
   BZ7HNuPm6DVFVHn1NNBRYjZVWxpitBN4vsFhkWClqeDJ4PbKfjwIs37Rm
   mTS0jDxRE+/PkTVXBg3aw3XmsbE3/VvbuwBw+4FJMpj5WeS8U45uQRYDV
   HIXmteVyWkE2gDvvH/vY2oCURmvC5qs7MgNGsvBQMRujCCpybROGUymXr
   2yCg52S3kYRC45p+gUJ3Z1sqv+ewjDHwcwOrJEYZ1xJ/9cxj3xtf+YUTT
   o/XWfw9yqDcr+WVXAhPRFiV8/Fly/G29ginWDfHECkxudyIa3C9clS2RI
   A==;
X-CSE-ConnectionGUID: zoLs4jSqQk6Rv9FlXOjrOw==
X-CSE-MsgGUID: 6tABZv8GSDe/TZgoaRmuyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49218618"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="49218618"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 07:36:14 -0700
X-CSE-ConnectionGUID: 2TbrZd5ATWOS8rTjrm1t2g==
X-CSE-MsgGUID: I2tCfs2+RZyIG3+tq+DqJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="133157273"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 07:36:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u2A3b-0000000AQkH-0OCL;
	Tue, 08 Apr 2025 17:36:07 +0300
Date: Tue, 8 Apr 2025 17:36:06 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v2 1/1] x86/reboot: KVM: Guard
 nmi_shootdown_cpus_on_restart() with ifdeffery
Message-ID: <Z_U0Vn0V18KYGjkP@smile.fi.intel.com>
References: <20241008191555.2336659-1-andriy.shevchenko@linux.intel.com>
 <ZwbazZpTSAn9aAC7@google.com>
 <ZwcT149jx-iOmEfl@surfacebook.localdomain>
 <ZykbvVZ32FKCRT_q@smile.fi.intel.com>
 <Z_UUXOe61BwVkGob@smile.fi.intel.com>
 <f670905f-f14b-4482-83ee-568234647f46@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f670905f-f14b-4482-83ee-568234647f46@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 08, 2025 at 07:17:51AM -0700, Dave Hansen wrote:
> On 4/8/25 05:19, Andy Shevchenko wrote:
> > Any news here? Build error is still reproducible.
> 
> In the end, adding the #ifdefs leads to worse code, less maintainable
> code. I'll take the occasional actual unused static inline in a .c file
> over a mess of #ifdefs to make the compiler happy.
> 
> I really think that warning needs to go away in some way, shape or form.
> Either get rid of it entirely, or kick it out of -Wall somehow. It's a
> super pedantic warning that leads to worse code most of the time.

Does it mean you can take Sean's approach?

-- 
With Best Regards,
Andy Shevchenko


