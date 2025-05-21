Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A21190696
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 16:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747845861; cv=none; b=nld/kRB4dSPKm+I6IDsELjeGGj00lMbdOfPTVZmQcgj7zpX96v0dBjMYgeR3Dc+3SNRwYzZH4ORW7T97lc0M05S7DgZemU+nlUqz8nFoOBxmjeYFQqcdYWyj+1bx6DoXb//KdoVwdrCJvlb8nMBkSMpE7cvMJxlkplZkhlaP/aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747845861; c=relaxed/simple;
	bh=8Z+3ylf6wiqbT9gZJ4LTT4wiiT+/ExKUoC5g5qCQ0e4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hvBA2xaBYDeArQyMflcjlMdSEPRamAxV9MrmKmCsQ3AH4PoKJ4HEmwxcY409s0OsYgmDcxe4vA8Mko/cDqkAksUeXi5hkFWrgCnnpS5tRlO7pCmFswnsppmt/N/DgEkw2cvC2Nkdu+Cc5ZV6zP790GzC1cSQJl4Y18L9OMRoZZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AS1DdKN4; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AS1DdKN4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747845859; x=1779381859;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8Z+3ylf6wiqbT9gZJ4LTT4wiiT+/ExKUoC5g5qCQ0e4=;
  b=AS1DdKN4Ko5CXlWnQ6TrsZc43miSkVFzdfF85x9owHpqXYilJxJnFGXb
   natXMZ9lr2LQ92rdQng3LsqD4l9CXX8mfMYXiRowKtzYFGT0lyOpaKfnU
   5NKF0fk+O+FmNBHRfMkgCHgug1dBK39pfp20KHfYGyHRCAFuYUHWvjkxa
   atsoiiIN4KIY/e8TBy+M1ceWhSfgTWN8+AtA7fYUEmFjbMssMdiE3I2uG
   YMVzs1J4CmzZHSRfvgk8FpeAxRvlgxYT7Hu1x7UZ3nV3q5wwVby1HfB7v
   8eMwezpksRD5GzQ2JaLEgTJolnG/h9PIgQwlwro1oOYnFxf2HfsktpLrR
   g==;
X-CSE-ConnectionGUID: g+QVPThHSe6b7oRh59Y0mA==
X-CSE-MsgGUID: aZqUPCfrR2i9DMgFqB5oOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49825553"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="49825553"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 09:44:17 -0700
X-CSE-ConnectionGUID: 6RG9KOdBQBqAXMWhn2kaOA==
X-CSE-MsgGUID: aozAfW8TQimflIsiVCXmuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="145289701"
Received: from nsridha1-mobl.amr.corp.intel.com (HELO desk) ([10.125.146.22])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 09:44:18 -0700
Date: Wed, 21 May 2025 09:44:12 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org, David Kaplan <david.kaplan@amd.com>,
	linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: Re: [PATCH 2/2] x86/its: Allow "=stuff" mitigation when eIBRS is
 enabled
Message-ID: <20250521164412.wjrs3tfe7f4cu5d7@desk>
References: <20250520-eibrs-fix-v1-0-91bacd35ed09@linux.intel.com>
 <20250520-eibrs-fix-v1-2-91bacd35ed09@linux.intel.com>
 <20250521095914.GBaC2j8kmYixjs66Sd@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521095914.GBaC2j8kmYixjs66Sd@fat_crate.local>

On Wed, May 21, 2025 at 11:59:14AM +0200, Borislav Petkov wrote:
> On Tue, May 20, 2025 at 10:35:36PM -0700, Pawan Gupta wrote:
> > After a recent restructuring of ITS mitigation, RSB stuffing can no
> > longer be enabled in eIBRS+Retpoline mode. Before ITS, retbleed
> > mitigation only allowed stuffing when eIBRS was not enabled. This was
> > perfectly fine since eIBRS mitigates retbleed.
> > 
> > However, RSB stuffing mitigation for ITS is still required with eIBRS.
> > The restructuring solely relies on retbleed to deploy stuffing, and does
> > not allow it when eIBRS is enabled. This behavior is different from
> > what was before the restructuring.
> > 
> > Allow RSB stuffing mitigation when eIBRS+retpoline is enabled. Also
> > allow retbleed and ITS mitigation to independently enable stuffing. The
> > dependency is only with respect to retpoline. It is a valid case for
> > retbleed to be mitigated by eIBRS while ITS deploys stuffing at the same
> > time.
> 
> This one definitely needs splitting, just from reading the commit message
> I can see separate patches.
> 
> > 
> > Fixes: 8c57ca583ebf ("x86/bugs: Restructure ITS mitigation")
> > Closes: https://lore.kernel.org/lkml/20250519235101.2vm6sc5txyoykb2r@desk/
> > Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> > ---
> >  arch/x86/kernel/cpu/bugs.c | 101 ++++++++++++++++++++++++++++++---------------
> >  1 file changed, 67 insertions(+), 34 deletions(-)
> > 
> > diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
> > index 7f94e6a5497d9a2d312a76095e48d6b364565777..642d234943fe8fc657c7331ceb3a605201444166 100644
> > --- a/arch/x86/kernel/cpu/bugs.c
> > +++ b/arch/x86/kernel/cpu/bugs.c
> > @@ -113,6 +113,9 @@ void (*x86_return_thunk)(void) __ro_after_init = __x86_return_thunk;
> >  
> >  static void __init set_return_thunk(void *thunk)
> >  {
> > +	if (thunk == x86_return_thunk)
> > +		return;
> 
> This needs a separate patch too.

Will do.

> >  	if (x86_return_thunk != __x86_return_thunk)
> >  		pr_warn("x86/bugs: return thunk changed\n");
> >  
> > @@ -1120,6 +1123,39 @@ early_param("nospectre_v1", nospectre_v1_cmdline);
> >  
> >  enum spectre_v2_mitigation spectre_v2_enabled __ro_after_init = SPECTRE_V2_NONE;
> >  
> > +static inline bool spectre_v2_in_retpoline_mode(enum spectre_v2_mitigation mode)
> > +{
> > +	switch (mode) {
> > +	case SPECTRE_V2_NONE:
> > +	case SPECTRE_V2_IBRS:
> > +	case SPECTRE_V2_EIBRS:
> > +	case SPECTRE_V2_LFENCE:
> > +	case SPECTRE_V2_EIBRS_LFENCE:
> > +		return false;
> > +
> > +	case SPECTRE_V2_RETPOLINE:
> > +	case SPECTRE_V2_EIBRS_RETPOLINE:
> > +		return true;
> > +	}
> > +
> > +	pr_warn("Unknown spectre_v2 mitigation mode %d\n", mode);
> > +
> > +	return false;
> > +}
> 
> A whole function with a almost useless switch-case just for this?

Ok, will remove this function.

> > +
> > +/* Depends on spectre_v2 mitigation selected already */
> > +static inline bool cdt_possible(enum spectre_v2_mitigation mode)
> > +{
> > +	if (!IS_ENABLED(CONFIG_MITIGATION_CALL_DEPTH_TRACKING) ||
> > +	    !IS_ENABLED(CONFIG_MITIGATION_RETPOLINE))
> > +		return false;
> > +
> > +	if (!spectre_v2_in_retpoline_mode(mode))
> > +		return false;
> 
> You're using this function only once here. What's wrong with
> 
> 	if ((mode != SPECTRE_V2_RETPOLINE) &&
> 	    (mode != SPECTRE_V2_EIBRS_RETPOLINE))

will do it this way.

> > +
> > +	return true;
> > +}
> > +
> >  #undef pr_fmt
> >  #define pr_fmt(fmt)     "RETBleed: " fmt
> >  
> > @@ -1258,24 +1294,16 @@ static void __init retbleed_update_mitigation(void)
> >  	if (retbleed_mitigation == RETBLEED_MITIGATION_NONE)
> >  		goto out;
> >  
> > -	/*
> > -	 * retbleed=stuff is only allowed on Intel.  If stuffing can't be used
> > -	 * then a different mitigation will be selected below.
> > -	 *
> > -	 * its=stuff will also attempt to enable stuffing.
> > -	 */
> > -	if (retbleed_mitigation == RETBLEED_MITIGATION_STUFF ||
> > -	    its_mitigation == ITS_MITIGATION_RETPOLINE_STUFF) {
> > -		if (spectre_v2_enabled != SPECTRE_V2_RETPOLINE) {
> > -			pr_err("WARNING: retbleed=stuff depends on spectre_v2=retpoline\n");
> > -			retbleed_mitigation = RETBLEED_MITIGATION_AUTO;
> > -		} else {
> > -			if (retbleed_mitigation != RETBLEED_MITIGATION_STUFF)
> > -				pr_info("Retbleed mitigation updated to stuffing\n");
> > +	 /* ITS can also enable stuffing */
> 
> This needs a separate patch.

Ok.

...
> >  static void __init its_apply_mitigation(void)
> >  {
> > -	/* its=stuff forces retbleed stuffing and is enabled there. */
> > -	if (its_mitigation != ITS_MITIGATION_ALIGNED_THUNKS)
> > -		return;
> > -
> > -	if (!boot_cpu_has(X86_FEATURE_RETPOLINE))
> > -		setup_force_cpu_cap(X86_FEATURE_INDIRECT_THUNK_ITS);
> > +	switch (its_mitigation) {
> > +	case ITS_MITIGATION_OFF:
> > +	case ITS_MITIGATION_AUTO:
> > +	case ITS_MITIGATION_VMEXIT_ONLY:
> > +		break;
> > +	case ITS_MITIGATION_ALIGNED_THUNKS:
> > +		if (!boot_cpu_has(X86_FEATURE_RETPOLINE))
> > +			setup_force_cpu_cap(X86_FEATURE_INDIRECT_THUNK_ITS);
> >  
> > -	setup_force_cpu_cap(X86_FEATURE_RETHUNK);
> > -	set_return_thunk(its_return_thunk);
> > +		setup_force_cpu_cap(X86_FEATURE_RETHUNK);
> > +		set_return_thunk(its_return_thunk);
> > +		break;
> > +	case ITS_MITIGATION_RETPOLINE_STUFF:
> > +		setup_force_cpu_cap(X86_FEATURE_RETHUNK);
> > +		setup_force_cpu_cap(X86_FEATURE_CALL_DEPTH);
> > +		set_return_thunk(call_depth_return_thunk);
> > +		break;
> > +	}
> 
> I don't think you need to return the switch-case back but this is
> unreviewable. Please split. It is perfectly fine if you split into trivial
> patches which do one logical thing and one logical thing only.

Sure, will split this into multiple patches.
