Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D734B1E5E
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 23:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747698670; cv=none; b=SveLgxQXa33nqPXKJ4AVj9Uf0LMiofZ1Fz/hCdNdVvLOQzrvA+N9XyW9hl26Kzfc89gCSdMdXsEKcTNWSXyUuO9OsQMWpe5IuiFlYceDg9jqGDpTTYyPE1yMxZq1qZFkFR38zLVvsHXyKOuEQdsxaNgN1d+LtQdO66tRjLBaHT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747698670; c=relaxed/simple;
	bh=tOI36sNRkWlX7FkhfvR7gFqOk79/5tauignh5GotD64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a+Iy7sI/8yvXoIQk6jdi3gTGTsMFwJVsvspgbPXDyCuVmgXvHRye9J0CKz30T7vkz4ZRIZRKRHCinL3DD8Ga1bBCTJ/3/lwLKqttdfsPEo8f+SddhZpCYfztR/Evut7os1Y0/bOIlr141IDyWIFZiXbSE0eOnUv2hZpFuiXetoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W92zn4Qo; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W92zn4Qo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747698669; x=1779234669;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tOI36sNRkWlX7FkhfvR7gFqOk79/5tauignh5GotD64=;
  b=W92zn4QoQ1QMUlG/wp2nGF0DbJvzJyd5Sm2lqwib7HnzLWFYJpudRlKr
   6p7Gx7VF2jEgL3c/vqhxYiflUEvs/PFDS5MaPp+mu34BhTi006WCru4lE
   KBfFEBh+RuXwGRrol05+uECE+IfaE8hc53I5FA8X5EcAQK3T+1PFCLq1h
   otwUnKiCuHRMf2iuH4wPTmw4KnetHKDwJo99CD1a9Orxl7yjsUwiXP+6f
   FN7XynFNTr4WXO5mvnC1G+48a/YqviL7E2BxYmUunkrOjXhMMsE+wZCoK
   4qX7QrrTOaVOSI2ojXOcwI1ZM9aFXvF69QuscfZImMu1GhWLSunSPPUYc
   g==;
X-CSE-ConnectionGUID: TdUhuXG/Rja635C/X5z8Zw==
X-CSE-MsgGUID: T4At4rThTtatAfg0XZI5DQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="48729478"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="48729478"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 16:51:08 -0700
X-CSE-ConnectionGUID: lfxGwa9/Qo6YNJtr2EuAIA==
X-CSE-MsgGUID: rK37tPSzSdW67PeJIaiMEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="140527431"
Received: from shikevix-mobl.amr.corp.intel.com (HELO desk) ([10.125.146.20])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 16:51:08 -0700
Date: Mon, 19 May 2025 16:51:01 -0700
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
Message-ID: <20250519235101.2vm6sc5txyoykb2r@desk>
References: <20250515134756.93274-1-david.kaplan@amd.com>
 <20250515235210.ooq7ogymcdvbtakd@desk>
 <LV3PR12MB92653811577802E84DEB6ACE9493A@LV3PR12MB9265.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <LV3PR12MB92653811577802E84DEB6ACE9493A@LV3PR12MB9265.namprd12.prod.outlook.com>

On Fri, May 16, 2025 at 03:06:26PM +0000, Kaplan, David wrote:
> > > +1261,19 @@ static void __init retbleed_update_mitigation(void)
> > >       /*
> > >        * retbleed=stuff is only allowed on Intel.  If stuffing can't be used
> > >        * then a different mitigation will be selected below.
> > > +      *
> > > +      * its=stuff will also attempt to enable stuffing.
> > >        */
> > > -     if (retbleed_mitigation == RETBLEED_MITIGATION_STUFF) {
> > > +     if (retbleed_mitigation == RETBLEED_MITIGATION_STUFF ||
> > > +         its_mitigation == ITS_MITIGATION_RETPOLINE_STUFF) {
> > >               if (spectre_v2_enabled != SPECTRE_V2_RETPOLINE) {
> >
> > SPECTRE_V2_EIBRS_RETPOLINE also enables retpoline.
> >
> > >                       pr_err("WARNING: retbleed=stuff depends on
> > > spectre_v2=retpoline\n");
> >
> > This can be updated to:
> >
> >                         pr_err("WARNING: retbleed=stuff depends on retpoline\n");
> >
> 
> Yeah, I noticed that too.  But the existing upstream code (before my
> re-write) was also only checking spectre_v2_enabled == SPECTRE_V2_RETPOLINE
> in retbleed_select_mitigation(). So it seems like CDT previously wasn't
> supported with spectre_v2=eibrs,retpoline.

Thats because there was no need for CDT when eIBRS was enabled, until ITS.
The current upstream ITS mitigation behavior is to allow CDT with eIBRS.
This restructuring is changing that as ITS now relies on retbleed
mitigation, but retbleed_update_mitigation() is refusing to enable CDT when
eIBRS is enabled.

> If we want to change that, I suggest doing it in a separate patch.
> > >       }
> > >
> > > -     if (cmd == ITS_CMD_RSB_STUFF &&
> > > -         (!boot_cpu_has(X86_FEATURE_RETPOLINE) ||
> > !IS_ENABLED(CONFIG_MITIGATION_CALL_DEPTH_TRACKING))) {
> > > +     if (its_mitigation == ITS_MITIGATION_RETPOLINE_STUFF &&
> > > +         !IS_ENABLED(CONFIG_MITIGATION_CALL_DEPTH_TRACKING)) {
> > >               pr_err("RSB stuff mitigation not supported, using default\n");
> > > -             cmd = ITS_CMD_ON;
> > > +             its_mitigation = ITS_MITIGATION_ALIGNED_THUNKS;
> >
> > This and ...
> >
> > >       }
> > >
> > > -     switch (cmd) {
> > > -     case ITS_CMD_OFF:
> > > +     if (its_mitigation == ITS_MITIGATION_VMEXIT_ONLY &&
> > > +         !boot_cpu_has_bug(X86_BUG_ITS_NATIVE_ONLY))
> > > +             its_mitigation = ITS_MITIGATION_ALIGNED_THUNKS;
> >
> > ... this are essentially resetting the mitigation to default. This will be more clear if
> > you could change the mitigation to ITS_MITIGATION_AUTO here, and at the end
> > have:
> >
> >         if (its_mitigation == ITS_MITIGATION_AUTO)
> >                 its_mitigation = ITS_MITIGATION_ALIGNED_THUNKS;
> 
> The point of AUTO is really to say that no cmdline option was specified.
> This is relevant for my attack vector patches because AUTO means "defer
> to the enabled attack vectors".
> 
> In the attack vector series, AUTO is checked early in the select function
> and the mitigation will be disabled if needed.  If it is needed, the
> default mitigation is chosen.

Okay, I see your point. But it is debatable whether not selecting a
mitigation (which is auto) is equivalent to selecting an invalid mitigation
which then falls back to the default (also equivalent to auto).

> In the current code without attack vectors, AUTO just always means pick
> the default, but is really a preparatory thing for the attack vector
> support.
> 
> The code you highlighted deals with cases where an explicit cmdline
> option was specified asking for mitigation, but it can't be done.
> Falling back to the default option is fine, but calling it AUTO I think
> would be confusing because AUTO (in the next patch series) means "defer
> to the attack vectors".  So I would prefer to leave the code as-is.

In the other series can we make this subtlity more clear with:

enum its_mitigation {
        ITS_MITIGATION_OFF,
        ITS_MITIGATION_AUTO,
        ITS_MITIGATION_VECTOR_BASED = ITS_MITIGATION_AUTO,
	...
};

> > > +
> > > +}
> > > +
> > > +static void __init its_update_mitigation(void) {
> > > +     if (!boot_cpu_has_bug(X86_BUG_ITS) || cpu_mitigations_off())
> > > +             return;
> > > +
> > > +     switch (spectre_v2_enabled) {
> > > +     case SPECTRE_V2_NONE:
> > > +             pr_err("WARNING: Spectre-v2 mitigation is off, disabling
> > > + ITS\n");
> > >               its_mitigation = ITS_MITIGATION_OFF;
> > >               break;
> > > -     case ITS_CMD_VMEXIT:
> > > -             if (boot_cpu_has_bug(X86_BUG_ITS_NATIVE_ONLY)) {
> > > -                     its_mitigation = ITS_MITIGATION_VMEXIT_ONLY;
> > > -                     goto out;
> > > -             }
> > > -             fallthrough;
> > > -     case ITS_CMD_ON:
> > > -             its_mitigation = ITS_MITIGATION_ALIGNED_THUNKS;
> > > -             if (!boot_cpu_has(X86_FEATURE_RETPOLINE))
> > > -                     setup_force_cpu_cap(X86_FEATURE_INDIRECT_THUNK_ITS);
> > > -             setup_force_cpu_cap(X86_FEATURE_RETHUNK);
> > > -             set_return_thunk(its_return_thunk);
> > > +     case SPECTRE_V2_RETPOLINE:
> >
> > Also SPECTRE_V2_EIBRS_RETPOLINE.
> 
> See above.
> 
> >
> > > +             /* Retpoline+CDT mitigates ITS */
> > > +             if (retbleed_mitigation == RETBLEED_MITIGATION_STUFF)
> >
> >
> >
> > > +                     its_mitigation = ITS_MITIGATION_RETPOLINE_STUFF;
> > >               break;
> > > -     case ITS_CMD_RSB_STUFF:
> > > -             its_mitigation = ITS_MITIGATION_RETPOLINE_STUFF;
> > > -             setup_force_cpu_cap(X86_FEATURE_RETHUNK);
> > > -             setup_force_cpu_cap(X86_FEATURE_CALL_DEPTH);
> > > -             set_return_thunk(call_depth_return_thunk);
> > > -             if (retbleed_mitigation == RETBLEED_MITIGATION_NONE) {
> > > -                     retbleed_mitigation = RETBLEED_MITIGATION_STUFF;
> > > -                     pr_info("Retbleed mitigation updated to stuffing\n");
> > > -             }
> > > +     case SPECTRE_V2_LFENCE:
> > > +     case SPECTRE_V2_EIBRS_LFENCE:
> > > +             pr_err("WARNING: ITS mitigation is not compatible with lfence
> > mitigation\n");
> > > +             its_mitigation = ITS_MITIGATION_OFF;
> > > +             break;
> > > +     default:
> > >               break;
> > >       }
> > > -out:
> > > +
> > > +     /*
> > > +      * retbleed_update_mitigation() will try to do stuffing if its=stuff.
> > > +      * If it can't, such as if spectre_v2!=retpoline, then fall back to
> > > +      * aligned thunks.
> > > +      */
> > > +     if (its_mitigation == ITS_MITIGATION_RETPOLINE_STUFF &&
> > > +         retbleed_mitigation != RETBLEED_MITIGATION_STUFF)
> > > +             its_mitigation = ITS_MITIGATION_ALIGNED_THUNKS;
> >
> > The =stuff mitigation depends on retpoline, not really on retbleed.
> > Shouldn't this be handled in the switch (spectre_v2_enabled) above?
> >
> > >       pr_info("%s\n", its_strings[its_mitigation]);  }
> > >
> > > +static void __init its_apply_mitigation(void) {
> > > +     /* its=stuff forces retbleed stuffing and is enabled there. */
> >
> > Oh, this is why you are depending on retbleed_mitigation above, this part is a bit
> > confusing.
> >
> > Will think about it more later, trying to have a couple of days off.
> 
> It is a bit confusing, no argument there.  And why I spent most of the
> commit log trying to explain it :)
> 
> I do prefer this way of handling it though compared to the existing code.
> The existing code would *change* retbleed_mitigation in
> its_select_mitigation() which I think is very confusing.  I believe the
> rule for these functions should be that xxx_mitigation is only ever
> modified in the xxx_select_mitigation() and xxx_update_mitigation()
> functions.
> 
> If there's another idea though (or a place where a comment might help),
> let me know.

One way to handle intersection between two mitigations is via a common
function that each mitigation can call. Something on the lines of
set_return_thunk().
