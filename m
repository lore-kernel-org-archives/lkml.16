Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DADE19B3CB
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 21:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748469357; cv=none; b=Me0515XK1uKSQGlETt5pDhy9mCg0LQlpvVZHRgbOkCE2sB3M17yOyBqTyE6fAZ0PmHcdZpA7xUM72oXJtURGwJsrRhWFtZ5UIe8d7sbkXebQxqQAuvbzW0Y5rt4tKJBRlJV14MkguGjgnHIaVrdqbn7rhI/VLI+5hzLwFbJs0Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748469357; c=relaxed/simple;
	bh=ZwExfTh8PB4nfZkRxbG05t+RXDRqjm3lDtywr8XrmdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uwf0hJzxTAIfRlJOx9SW3TyfM2h/X5rISBlzbIAtaXTXelT0p9YUe4hivNo/wKNs7zd0gj9eflKjJaKdunOla+M3DHTe7T5v/UTqmBvgkejYksMsQGkj6GDtxJ3LxpMaUYbrFJRUFx5epf67xE2gteGO8a7w8j78RbjXq2nxXhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=az1ArzfA; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="az1ArzfA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748469356; x=1780005356;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZwExfTh8PB4nfZkRxbG05t+RXDRqjm3lDtywr8XrmdI=;
  b=az1ArzfAcCnWMv8vu04KmLDXA7Qxn7DSuGwTFKdNkZnh5mPIcMoDwuQo
   Aj+6AKzWSgk2Pd0vPYcIafNP7QvH0yIV9lXyZHK3rb6QckTSokjUHMUEm
   yKAB0cM+7M+GD4bdo/Oyy6JdM/KKGtvjtxvkNyworiDdascwsNb+iQco4
   ZOe35CqPTsft5OW1TrYkDJvQ9xMbuysDEyHu0SCHUfsaBWcCt3AmqqtWp
   Bv0JaTfMDNQjmh492tDlqCzAvZifjbCccTpsCnK6q/m1KacKIenpo9PML
   rDZiS+WITKCcx66LV40kdfjDpx/QNwnx92Qwpen95lYRc0t6qA+dfIOk0
   w==;
X-CSE-ConnectionGUID: LMTSzT4cQG+b/+5m+I9Ukw==
X-CSE-MsgGUID: O130YLnASXCZo2GmMEei0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61569908"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="61569908"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 14:55:56 -0700
X-CSE-ConnectionGUID: qT+NsUXDRaWZsIvqqpKh9w==
X-CSE-MsgGUID: YrAfmVeMQPm7StRxw4N4nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="148224684"
Received: from josephbr-mobl1.amr.corp.intel.com (HELO desk) ([10.125.146.30])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 14:55:55 -0700
Date: Wed, 28 May 2025 14:55:49 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org, David Kaplan <david.kaplan@amd.com>,
	linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: Re: [PATCH v3 3/7] x86/bugs: Exit early if return thunk is already
 set
Message-ID: <20250528215549.ql33m3tasfxzunbw@desk>
References: <20250522-eibrs-fix-v3-0-12704e291e1e@linux.intel.com>
 <20250522-eibrs-fix-v3-3-12704e291e1e@linux.intel.com>
 <20250524112729.GJaDGtIQ9pR-pPiy9e@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250524112729.GJaDGtIQ9pR-pPiy9e@fat_crate.local>

On Sat, May 24, 2025 at 01:27:29PM +0200, Borislav Petkov wrote:
> On Thu, May 22, 2025 at 06:21:02PM -0700, Pawan Gupta wrote:
> > When the exact same return thunk is already set, avoid the warning and exit
> > early. This is to prepare for ITS to also set CDT return thunk independent
> > of retbleed.
> > 
> > Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> > ---
> >  arch/x86/kernel/cpu/bugs.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
> > index 94d0de3e61aec32b3b67c8d21f89a8c67b93dff3..354593065025fd7c5727e955d76523777b3da9ee 100644
> > --- a/arch/x86/kernel/cpu/bugs.c
> > +++ b/arch/x86/kernel/cpu/bugs.c
> > @@ -113,6 +113,9 @@ void (*x86_return_thunk)(void) __ro_after_init = __x86_return_thunk;
> >  
> >  static void __init set_return_thunk(void *thunk)
> >  {
> > +	if (thunk == x86_return_thunk)
> > +		return;
> > +
> >  	if (x86_return_thunk != __x86_return_thunk)
> >  		pr_warn("x86/bugs: return thunk changed\n");
> 
> Ok, let's drop those silly conditionals here and simply issue the name. We'll
> see later whether this needs to be louder...

Ok, will do.
