Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1486191484
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 17:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747935747; cv=none; b=jXgKeHOTmSBA/NVeThKIAcMmYaIDLdqOSt4GW7MjcvD57yv8fY17+PZQ6fdrdcx8vKsjN3KtG3shbZt6VfyYJUBBl4Opz4I7+2WsAO4OHziycbkQVlGwSYwa+e+RJgrQl3ABx0n4C8z9bVHjw8FxpsreMbH6B8Lfq1dsy1rhdWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747935747; c=relaxed/simple;
	bh=T1pbeFr6ibkAx6wVwmr8gE3+At6mxdPNyNkPrZk5aso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fv6/ZwSlI6TFHKpDJ3poQyWJUSWCKyuAYPoDpXOhXcFAEY/tvAg/1pdIi+kuA1ztehsYka1yVZT84XZKS5EfJJf7gEykI1sXcnQLawQwHRFxB8xFvI8BiBZgR8FULi+RTs2z0kKDNT+R/g62jlDLEqA8NATVX65M/UkZjVZl1Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MYaIqgit; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MYaIqgit"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747935746; x=1779471746;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T1pbeFr6ibkAx6wVwmr8gE3+At6mxdPNyNkPrZk5aso=;
  b=MYaIqgitGiB7WRpCkyM+l5Yq7sgvZyWfBc5AsIUA03GXcauOa+Z6Dzur
   nxRugOewIO5cRsz/wXQG+vzRmqYqVvQNHDSSUPHEyfNacBzNDXk1z6Zyj
   ljPj4zhKmWqI117OCrABEcK5zZk5rFSEmSXp+CoffL4c+TLKssvIOfd4+
   r+s37pMKXY0kXRyxfNNCMEpZs4QOYJPQMuW+JgJA0DwHbC2Oj8dmmBSSh
   mgssaa1DmWaq2vJcW9kUaLB0JYW6zB6XMzi5qRWqa4TdhITj2URYgCwQe
   MGSG1jnB5sRup+pkyOJfXDvXDWjUOJTY/bPTwgLRc8msHykYV5sr6fNqe
   w==;
X-CSE-ConnectionGUID: wKKDy8mcRp+nvSAY960tIg==
X-CSE-MsgGUID: FCOaEWPzRXqgy8dnkcTLHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="61330297"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="61330297"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 10:42:25 -0700
X-CSE-ConnectionGUID: TIAfqjB0TUiQQ+tx45ohEg==
X-CSE-MsgGUID: 2HTGqIpbS4Kb9J0FHPnQ5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="140564938"
Received: from lindenmc-mobl.amr.corp.intel.com (HELO desk) ([10.125.146.24])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 10:42:25 -0700
Date: Thu, 22 May 2025 10:42:19 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org, David Kaplan <david.kaplan@amd.com>,
	linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: Re: [PATCH v2 1/7] x86/retbleed: Check for AUTO in all cases
Message-ID: <20250522174219.75uajbghvnnnvcmk@desk>
References: <20250521-eibrs-fix-v2-0-70e2598e932c@linux.intel.com>
 <20250521-eibrs-fix-v2-1-70e2598e932c@linux.intel.com>
 <20250522112730.GFaC8KIk7jbj4EyoV7@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522112730.GFaC8KIk7jbj4EyoV7@fat_crate.local>

On Thu, May 22, 2025 at 01:27:30PM +0200, Borislav Petkov wrote:
> On Wed, May 21, 2025 at 07:44:22PM -0700, Pawan Gupta wrote:
> > When none of mitigation option is selected, AUTO gets converted to NONE.
> > This is currently only being done for Intel. The check is useful in
> > general, make it common.
> > 
> > Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> > ---
> >  arch/x86/kernel/cpu/bugs.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
> > index 7f94e6a5497d9a2d312a76095e48d6b364565777..19ff705b3128eacad5659990ed345d7a19bcb0f4 100644
> > --- a/arch/x86/kernel/cpu/bugs.c
> > +++ b/arch/x86/kernel/cpu/bugs.c
> > @@ -1294,15 +1294,15 @@ static void __init retbleed_update_mitigation(void)
> >  			if (retbleed_mitigation != RETBLEED_MITIGATION_STUFF)
> >  				pr_err(RETBLEED_INTEL_MSG);
> >  		}
> > -		/* If nothing has set the mitigation yet, default to NONE. */
> > -		if (retbleed_mitigation == RETBLEED_MITIGATION_AUTO)
> > -			retbleed_mitigation = RETBLEED_MITIGATION_NONE;
> >  	}
> > +
> > +	/* If nothing has set the mitigation yet, default to NONE. */
> > +	if (retbleed_mitigation == RETBLEED_MITIGATION_AUTO)
> > +		retbleed_mitigation = RETBLEED_MITIGATION_NONE;
> >  out:
> >  	pr_info("%s\n", retbleed_strings[retbleed_mitigation]);
> >  }
> 
> So, the way I see it is, AUTO means user didn't select anything so we will
> select the default thing.
>  
> And we do that in the select function.
> 
> But then in the update function we bring back AUTO from the dead again,
> forcing us to having to deal with it, well, again.
> 
> So can we simply set to RETBLEED_MITIGATION_NONE in the retbleed + its = stuff
> option when SPECTRE_V2_RETPOLINE not selected?

That can be done.

> This'll get rid of the AUTO crap.

Yup.

> For that, the select function should probably select something else from AUTO
> on Intel too.
> 
> My point is, let's deal with AUTO in the select functions only and then forget
> it from then on...
> 
> Right?

Yes, makes sense to me.

This is how it is looking:

---
diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index ad04da8711b2..156fee146228 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -1264,6 +1264,13 @@ static void __init retbleed_select_mitigation(void)
 			retbleed_mitigation = RETBLEED_MITIGATION_IBPB;
 		else
 			retbleed_mitigation = RETBLEED_MITIGATION_NONE;
+	} else if (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL) {
+		if (boot_cpu_has(X86_FEATURE_IBRS_ENHANCED))
+			retbleed_mitigation = RETBLEED_MITIGATION_EIBRS;
+		else if (boot_cpu_has(X86_FEATURE_IBRS))
+			retbleed_mitigation = RETBLEED_MITIGATION_IBRS;
+		else
+			retbleed_mitigation = RETBLEED_MITIGATION_NONE;
 	}
 }
 
@@ -1272,9 +1279,6 @@ static void __init retbleed_update_mitigation(void)
 	if (!boot_cpu_has_bug(X86_BUG_RETBLEED) || cpu_mitigations_off())
 		return;
 
-	if (retbleed_mitigation == RETBLEED_MITIGATION_NONE)
-		goto out;
-
 	 /* ITS can also enable stuffing */
 	if (its_mitigation == ITS_MITIGATION_RETPOLINE_STUFF)
 		retbleed_mitigation = RETBLEED_MITIGATION_STUFF;
@@ -1282,7 +1286,7 @@ static void __init retbleed_update_mitigation(void)
 	if (retbleed_mitigation == RETBLEED_MITIGATION_STUFF &&
 	    !cdt_possible(spectre_v2_enabled)) {
 		pr_err("WARNING: retbleed=stuff depends on retpoline\n");
-		retbleed_mitigation = RETBLEED_MITIGATION_AUTO;
+		retbleed_mitigation = RETBLEED_MITIGATION_NONE;
 	}
 
 	/*
@@ -1305,10 +1309,6 @@ static void __init retbleed_update_mitigation(void)
 		}
 	}
 
-	/* If nothing has set the mitigation yet, default to NONE. */
-	if (retbleed_mitigation == RETBLEED_MITIGATION_AUTO)
-		retbleed_mitigation = RETBLEED_MITIGATION_NONE;
-out:
 	pr_info("%s\n", retbleed_strings[retbleed_mitigation]);
 }
 
