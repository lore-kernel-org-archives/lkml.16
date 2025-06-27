Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB25293C44
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 10:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019753; cv=none; b=ERbj7VAmY5TzqUGgXvs+D+SbS4lJJu16zAzB+qPDnepluhm3B2HoZmw3BLfuEmyCvnl+nZpIMnPNMASiYbdqgALT3vrehAuEAtbMlEOxlrmff3KUepatD0TAlOIQuLA7DB2VsamAFYyMPbEZZXUN+keRhwjhXuUPQSgiFGUtCn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019753; c=relaxed/simple;
	bh=NsAXgbPIuhG4Q23J1SjnSjnBmQPBArQnGyTazc+XHgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R67MHXbiCQsstyvz+PFm0zLUAO3/ktn3BkVCJMGtc8QDngGaQRVORNL+2BPQX7WbvfL8+o22ZcxVVd1A8w3WwRx3i4KC10zbvCvfSk5OmpAZz66YeAzHdjB/UoWyYxMI0OsAEGMOFJ2QTgKe36iwQNHnabEz9aaw09LpqUUKPGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qp90pKW4; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qp90pKW4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751019753; x=1782555753;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NsAXgbPIuhG4Q23J1SjnSjnBmQPBArQnGyTazc+XHgs=;
  b=Qp90pKW4wd6n+/dmUf+uEzR19KG9wlG9mnBeVY9HdosVFs38IVzYTnSD
   izMaPTxyl3PEleBrUMU5BrT1CjwEuzbIS4uNQRGYqGj2T/1S4zn5ZQRHL
   4zhd9jv1o68/yFh3XTOmoBoyLRDDCD/j3ZqEJ8t81STIWhSWxG6M0PISo
   bUcwUY3eTMX9hXT2fch+isXbk8c0dvJ20A/9fj+pwlFfW0GBbP8JexUV8
   SezZW7fHHRMkSreiDEpjVJU+iYwyVLD/c0cLKimm6IvHZxl1tZYYXRNjS
   tD4fg+A/Wbl06ejlsT4Hx8zLpC/hADMytbbFcj9BVmC2w1EBiN4vhnNwF
   w==;
X-CSE-ConnectionGUID: gp8a/HPmRhmRlK4w8BUm+g==
X-CSE-MsgGUID: EVqxOT7LSdqQMh59XLGDCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53296781"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="53296781"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 03:22:31 -0700
X-CSE-ConnectionGUID: 0/pMAkkVSM2pMoQMhzbowQ==
X-CSE-MsgGUID: JS41YD7HQpqIXOTYkGiYog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="158253066"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 03:22:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uV6Dy-0000000ARwa-1SVa;
	Fri, 27 Jun 2025 13:22:26 +0300
Date: Fri, 27 Jun 2025 13:22:25 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v1 1/2] firmware: sysfb: Unorphan sysfb files
Message-ID: <aF5w4QTbSkebYbk2@smile.fi.intel.com>
References: <20250626172039.329052-1-andriy.shevchenko@linux.intel.com>
 <20250626172039.329052-2-andriy.shevchenko@linux.intel.com>
 <87ikkhd0uv.fsf@minerva.mail-host-address-is-not-set>
 <aF5eL1o3WNo3Q7_p@smile.fi.intel.com>
 <87wm8xbkyh.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wm8xbkyh.fsf@minerva.mail-host-address-is-not-set>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jun 27, 2025 at 11:19:34AM +0200, Javier Martinez Canillas wrote:
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:
> > On Fri, Jun 27, 2025 at 10:50:48AM +0200, Javier Martinez Canillas wrote:
> >> Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:

> >> > The commit d391c5827107 ("drivers/firmware: move x86 Generic
> >> > System Framebuffers support") moved some code to the common
> >> > folders and effectively orphaned it without any reason. Put
> >> > it back under DRM MISC record.
> >> 
> >> What do you mean that it was "orphaned without any reason" ? There were no
> >> regex matchs for the old file paths in MAINTAINERS either before that commit.
> >
> > There were maintainers for that code before. The change in question dropped that.
> >
> > [((bf44e8cecc03...))]$ scripts/get_maintainer.pl -f arch/x86/kernel/sysfb*
> > Thomas Gleixner <tglx@linutronix.de> (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT))
> > Ingo Molnar <mingo@redhat.com> (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT))
> > Borislav Petkov <bp@alien8.de> (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT))
> > x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT))
> > "H. Peter Anvin" <hpa@zytor.com> (reviewer:X86 ARCHITECTURE (32-BIT AND 64-BIT))
> > linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT))
> >
> > [((d391c5827107...))]$ scripts/get_maintainer.pl -f drivers/firmware/sysfb*
> > linux-kernel@vger.kernel.org (open list)
> 
> That's just because there is an entry for arch/x86/. The problem then is
> that there isn't an entry for drivers/firmware. It was orphaned then just
> because it was moved to a directory that has no entry in MAINTAINERS.
> 
> > See the difference?
> 
> There is no need to have such a rude tone.

It wasn't meant to be rude, sorry. The point is that any change in
drivers/firmware/sysfb* and respective include are not visible to (any)
maintainers, they just might be sent for a luck of somebody to pick
them up by browsing the LKML for such things.

...

> >> > +F:	drivers/firmware/sysfb*.c
> >
> >> I would prefer these to be in the "DRM DRIVER FOR FIRMWARE FRAMEBUFFERS"
> >> entry instead of "DRM DRIVERS" since the former is what has most of the
> >> code for the sysfb infrastructure.
> >
> > Then do it, please, fix the above.
> 
> Part of the review process is to give feedback to patch authors. I don't
> understand why you expect me to fix an issue you brought up just because
> I ask you to rework your patch a little.

In my humble opinion, the author of the patch that makes the problem appear
can help to fix that as well. Are my expectations too high?

In any case, this was an ad-hoc patch due to the second one, so this one
may be considered as a administrative bug report.

-- 
With Best Regards,
Andy Shevchenko


