Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC92D26E148
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 12:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744114789; cv=none; b=FiUsCIcpHv7YK6OFVoQ/KMRNMfnuSrWSe1tVPtvbO4EKu5DGDXgUrU5TETSHT+JlPrUjzjaW70+VB4zzwcFLpmOKvw2LWi+p1SA2x86wtkZk53JeQqesZM/3hR1da+sm8pg6AZFyOZ72wFbmx03PJM1Pn/yzsPfnioUCO27SiS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744114789; c=relaxed/simple;
	bh=mYi6TNfCAYQIFjLQeQklUG5RWG2hPyCT2z+XbGTLTxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ad7K+kF4L7VSI8JbXo5uo7em9Ydwy+OLDZI2RbU5wZETextNgbdh3Qoqy9pZcPR5Zce5P27nDUhEt591s5gK2IWq3ghWFBXiRbW2wQSpdfmYiW/g06hesOo3B2UiXKyQCfamhyy++O+nTzqAKTUtgmsl63+gZiTRRvadguvX/L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cah5uqqG; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cah5uqqG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744114788; x=1775650788;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mYi6TNfCAYQIFjLQeQklUG5RWG2hPyCT2z+XbGTLTxw=;
  b=cah5uqqG75x9pw23VX5KT4VqKgdkRSeVvcLZx2FrI9rV65CehvvdvXcp
   X4DTMplx3tBstSSddb3O7SXHjSDQukwaTRLrEmjV3QWA9MBhfTm0oLFQh
   ln4WVmSOJovNZeYdNnN2noq7F6djIewb6DcrzZCU8sE2WtKTVmoyHVMRi
   2hQj/9QghIbzXg545zoyrPf+zvIg+hmmAbzP2p6CCbYP1UJfUQ4I0HNTh
   uz31KaL0nxCXbGSEZs5M2CGlzPDsDQb74RPNQ69mNod72Sox4qXnLhFGz
   kJOjSgJAvP4/6Vj0Q1UypGgiKs6CJyfE6HDYHAMeFMAOFyZS3DyyuZbJo
   A==;
X-CSE-ConnectionGUID: qn34Jr9rTJWA5SH2B9YKfw==
X-CSE-MsgGUID: ee2dmDKqR/O9bvJ2/Paq+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="62945434"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="62945434"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 05:19:47 -0700
X-CSE-ConnectionGUID: TFCQi75JSbuclTRh8tn3yQ==
X-CSE-MsgGUID: D2GU++D2T9KYgmeNmmP5dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="128774927"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 05:19:44 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u27vZ-0000000AOfV-0eao;
	Tue, 08 Apr 2025 15:19:41 +0300
Date: Tue, 8 Apr 2025 15:19:40 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v2 1/1] x86/reboot: KVM: Guard
 nmi_shootdown_cpus_on_restart() with ifdeffery
Message-ID: <Z_UUXOe61BwVkGob@smile.fi.intel.com>
References: <20241008191555.2336659-1-andriy.shevchenko@linux.intel.com>
 <ZwbazZpTSAn9aAC7@google.com>
 <ZwcT149jx-iOmEfl@surfacebook.localdomain>
 <ZykbvVZ32FKCRT_q@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZykbvVZ32FKCRT_q@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Nov 04, 2024 at 09:08:45PM +0200, Andy Shevchenko wrote:
> On Thu, Oct 10, 2024 at 02:37:59AM +0300, Andy Shevchenko wrote:
> > Wed, Oct 09, 2024 at 12:34:37PM -0700, Sean Christopherson kirjoitti:
> > > On Tue, Oct 08, 2024, Andy Shevchenko wrote:
> > > > The nmi_shootdown_cpus_on_restart() in some cases may be not used.
> > > > This, in particular, prevents kernel builds with clang, `make W=1`
> > > > and CONFIG_WERROR=y:
> > > > 
> > > > arch/x86/kernel/reboot.c:957:20: error: unused function 'nmi_shootdown_cpus_on_restart' [-Werror,-Wunused-function]
> > > >   957 | static inline void nmi_shootdown_cpus_on_restart(void)
> > > >       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > 
> > > > Fix this by guarging the definitions with the respective KVM ifdeffery.
> > > > 
> > > > See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
> > > > inline functions for W=1 build").
> > 
> > > Heh, I tried fixing this too, and have patches to clean things up, but I ended up
> > > not posting them because I decided the W=1 warning was less ugly than the resulting
> > > code in nmi_shootdown_cpus().
> > 
> > CONFIG_WERROR=y is the default (at least in the current defconfigs for x86).
> > My goal is to match what ARM builds survive (to some extend?), i.e. W=1, so
> > may one apply either version I provided or yours?
> > 
> > > If we're willing to take on a bit of weirdness in nmi_shootdown_cpus(), then much
> > > of the #ifdeffery can go away.  Patches attached (lightly tested).
> 
> So, what's the status either with the proposed change or with what Sean shared?
> Can we somehow move forward to fix the issue?

Any news here? Build error is still reproducible.

-- 
With Best Regards,
Andy Shevchenko


