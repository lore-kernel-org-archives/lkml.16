Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A22C2192EB
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 22:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747346575; cv=none; b=AE2p7BR6AW17uOsNlV/ckHFLeArQFh0hOG3hqJhYW449OCdNUeCIz8A7B95QnkuteGh6N6AC/lUYYgVFdk46ROYO/un07gyzYCKVmEc4yPJ5X2qRRia5ZAJROVDzqcF6ivLo6FYIDhH5SbwEnaj919xxZU3NDC17s8iAihYsaFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747346575; c=relaxed/simple;
	bh=Wpi1y51hGjRQmOPEdKddEeCkBUbhfg86pbv2pJmpZQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a9CLgNY8s2Z/LVLR2j+HoIVOPDTNao4P/u4JmyxYrKrfrbCdYfBZwe+DqQy6pNjzBlhkhcNOhfO5Nfc5j8PLg4LfxYs9RHugZiUfwvlhily28QTycTVLb5KzSs5P3ooTZrdPHUcoE9IpGgGQFoSGLUu3enOy/7m8gT9eunCQ5qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fnv34oAX; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fnv34oAX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747346571; x=1778882571;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Wpi1y51hGjRQmOPEdKddEeCkBUbhfg86pbv2pJmpZQ4=;
  b=Fnv34oAX0e3VW51dR844FCEdGyE37kndA9P9vIBNj7xJFdOwa1yuaERQ
   FedMvEIRt6G+qCyEJoKIR/wR99S//v4JOervb/Nu0it8/iBjpLhAUb/Q1
   EgT+BcPLw9tvblenlTVr9THAGjMfXScV/TrlHWSs5uX+A1uMdh8BvHCMJ
   S266EU8DFP+UZ4XB9k8fXcvOOVhtI1ctw1LoGb/8acDgjIpTddheS3uq+
   J8fspYpJ52dCCfM4W9FvO1pRitcMFeSg6IXZjc6oq25k6F0bWGNxgc1Qw
   O6iCxFRtWyPqQz2b7SfUlyV5C64TyvsF+qf1s5fsuWTyie3Eq6b0YwrKk
   A==;
X-CSE-ConnectionGUID: NdFrUe36Qt6CtbXAaS49pQ==
X-CSE-MsgGUID: qJAIWYldTw6bXpQrBdQ4nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49000594"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="49000594"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 15:02:51 -0700
X-CSE-ConnectionGUID: XpfqRAKzRQSKMWA8venlGw==
X-CSE-MsgGUID: dGJEbi+TRQm43ajJCTpANw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="138898238"
Received: from gkhatri-mobl.amr.corp.intel.com (HELO desk) ([10.125.146.13])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 15:02:50 -0700
Date: Thu, 15 May 2025 15:02:43 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: "Kaplan, David" <David.Kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] x86/bugs: Restructure ITS mitigation
Message-ID: <20250515220243.fk4z7rifcxdm2e7h@desk>
References: <20250515134756.93274-1-david.kaplan@amd.com>
 <20250515211159.njyxgxuxmyhqx46m@desk>
 <LV3PR12MB92655C23DF46F1F3B88139009490A@LV3PR12MB9265.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <LV3PR12MB92655C23DF46F1F3B88139009490A@LV3PR12MB9265.namprd12.prod.outlook.com>

On Thu, May 15, 2025 at 09:15:59PM +0000, Kaplan, David wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> > -----Original Message-----
> > From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> > Sent: Thursday, May 15, 2025 4:12 PM
> > To: Kaplan, David <David.Kaplan@amd.com>
> > Cc: Thomas Gleixner <tglx@linutronix.de>; Borislav Petkov <bp@alien8.de>; Peter
> > Zijlstra <peterz@infradead.org>; Josh Poimboeuf <jpoimboe@kernel.org>; Ingo
> > Molnar <mingo@redhat.com>; Dave Hansen <dave.hansen@linux.intel.com>;
> > x86@kernel.org; H. Peter Anvin <hpa@zytor.com>; linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH] x86/bugs: Restructure ITS mitigation
> >
> > Caution: This message originated from an External Source. Use proper caution
> > when opening attachments, clicking links, or responding.
> >
> >
> > On Thu, May 15, 2025 at 08:47:56AM -0500, David Kaplan wrote:
> > ...
> > > +static void __init its_apply_mitigation(void) {
> > > +     /* its=stuff forces retbleed stuffing and is enabled there. */
> > > +     if (its_mitigation != ITS_MITIGATION_ALIGNED_THUNKS)
> > > +             return;
> > > +
> > > +     if (!boot_cpu_has(X86_FEATURE_RETPOLINE))
> > > +             setup_force_cpu_cap(X86_FEATURE_INDIRECT_THUNK_ITS);
> > > +
> > > +     setup_force_cpu_cap(X86_FEATURE_RETHUNK);
> > > +     set_return_thunk(its_return_thunk);
> > > +}
> > > +
> > >  #undef pr_fmt
> > >  #define pr_fmt(fmt)     "Spectre V2 : " fmt
> > >
> > >
> > > base-commit: 04bdd560124ec4d02d1d11ee3abc88d51954d7b8
> >
> > I am having trouble applying this patch to upstream and tip/master. I can't seem to
> > find this base-commit in Linus's or tip tree. Please let me know what am I missing?
> 
> Hmm.  I was working off origin/master on tip.  This was the base commit in my git log from this morning:
> 
> commit 04bdd560124ec4d02d1d11ee3abc88d51954d7b8 (origin/master, origin/HEAD)
> Merge: 61e94712bb24 e59236b5a09e
> Author: Ingo Molnar <mingo@kernel.org>
> Date:   Thu May 15 10:16:23 2025 +0200
> 
> Not sure if something happened to it since?

Likely yes. I am getting:

	Notice: this object is not reachable from any branch.

when I go to this link:

https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit?id=04bdd560124ec4d02d1d11ee3abc88d51954d7b8

> Or is there something else I can provide to help?

No, I am able to apply now. Earlier my b4 based script failed because it
couldn't find the base-commit. It works when I am apply manually, sorry to
bother you.
