Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8239E23D284
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734578; cv=none; b=MVpho+W7mSHh32CYfTfwStmLmQjLd8SqN5RFpJBx3dr2rc0ZupvhDXz971joCweWUugUEwTWEjEktGROu4CuGVk1n6rnuws39Oo3ceFojqojd+T7jEHYZsTuK2o/3wWXtDAMXNUV6D9c/LFoI/YKZc1A71Zquwx2LscXuIhOrys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734578; c=relaxed/simple;
	bh=DX6UEMb+iyNSYkkAU+xtYVYYiAZRgNNPDyijXIvfsL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AukkfX1ITHG9OHF0zTlkKssNAQh+C69nWOS2b+UgAq8r4sJuU24M2g8L5V55mUawc5Rt/RgoDsrH8mP4B/yF/m37g/ufzQo2syZNKgVIMeORdEnBJH2Xu6gTFHNXsffaQpmf6B4XAD8nGyrxW4kv37eLRmn/DfjsGqPVw0vZN2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LZjslZB6; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LZjslZB6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749734576; x=1781270576;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DX6UEMb+iyNSYkkAU+xtYVYYiAZRgNNPDyijXIvfsL4=;
  b=LZjslZB6aaSK3wiMJ3lmxsxiQIW/GtQ4LDSKSsY9L4FTeasHoknIjewP
   4HKS2m3t2C36y1kvOqmCfAscBAFTyzh8G/I5WapH3UMe7U3nQJnEvg0Wg
   bVDf7aj+GhUXt4EwVV/BV8kw4XzFeWeCPpn8AKsesMV3MGW2SgjhStRAS
   +2kMYvh0VaT0e/8p6Joe0EI/DSiL1Lb+cQQrTe4YFC+ZpjHldp8I+MzJT
   xxr1W3sya1vEegvcgpqqCaAOB4c7cJHIOxgiGs2gPbYgFmG/FqdY5tJjQ
   aAe6vT/9J3ncAZQH+v8SKQ2UGhd5P5sZANs0XR3CsMuNtSQRCu5RfmXer
   Q==;
X-CSE-ConnectionGUID: 2EZWuATRQwWtyrbRK3R6jw==
X-CSE-MsgGUID: gHqhjKg0QJ2zJSkF4cl7RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="63321666"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="63321666"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 06:22:56 -0700
X-CSE-ConnectionGUID: 552AbT7GQG2qjsELcjgc1Q==
X-CSE-MsgGUID: A9DAT8ypQxmkOkCFQjLO7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="178425128"
Received: from dholevas-mobl1.amr.corp.intel.com (HELO desk) ([10.125.146.47])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 06:22:56 -0700
Date: Thu, 12 Jun 2025 06:22:50 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: Nikolay Borisov <nik.borisov@suse.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Borislav Petkov <bp@alien8.de>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: Re: [PATCH] x86/its: Warn when microcode is old
Message-ID: <20250612132250.k2loomkqhkfvksvk@desk>
References: <20250611-its-warn-v1-1-02eb9a75ce9c@linux.intel.com>
 <f9e2dcaa-6eff-4eda-8c7c-0d19c2d11e73@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9e2dcaa-6eff-4eda-8c7c-0d19c2d11e73@suse.com>

On Thu, Jun 12, 2025 at 09:58:35AM +0300, Nikolay Borisov wrote:
> 
> 
> On 6/12/25 03:08, Pawan Gupta wrote:
> > A microcode update is required for IBPB to be effective against ITS. On
> > Intel, X86_BUG_OLD_MICROCODE is set already when old microcode is detected.
> > In such a case system is tainted and a warning is issued.
> > 
> > Also warn that userspace could be vulnerable to ITS.
> > 
> > Suggested-by: Borislav Petkov <bp@alien8.de>
> > Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> > ---
> >   arch/x86/kernel/cpu/bugs.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> > 
> > diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
> > index 7f94e6a5497d9a2d312a76095e48d6b364565777..7aa3ae00e6b4daa5e42217b66c50cd46d6bcc115 100644
> > --- a/arch/x86/kernel/cpu/bugs.c
> > +++ b/arch/x86/kernel/cpu/bugs.c
> > @@ -1427,6 +1427,10 @@ static void __init its_select_mitigation(void)
> >   		return;
> >   	}
> > +	/* For IBPB to be effective against ITS */
> > +	if (boot_cpu_has_bug(X86_BUG_OLD_MICROCODE))
> > +		pr_warn("Old microcode, userspace may be vulnerable to ITS\n");
> > +
> 
> That check is too coarse and probably has a high chance of false positive,
> i.e
> 
> Latest firmware for your CPU is version Z as defined in intel-ucode-defs.h,
> current running version is X which is older than Z , but it already contains
> IBPB fixups for ITS. Then it will trigger a false positive.

Agree, as I mentioned in the other email, I am okay dropping this patch.
This creates more confusion than it helps.
