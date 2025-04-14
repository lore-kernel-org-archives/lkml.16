Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7C74C62
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 06:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744613977; cv=none; b=AvJvjJqSoytwnIFMmdlmUMuN5n/Rt6kh4Uua0z8xpbFFozVpy+vq/dUeS5iizc8/CbdaHoU+wTKbEuTwoV7am5ldaaGkOLgaqjCBizijXpfzzYqQB+CycNAz38jN3yz1hDcReQLVTj55ISwZQ3qPj4VMZVC2pJTUOas/O7dCMq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744613977; c=relaxed/simple;
	bh=0wMjcRHkX6uNdf6OAm/aJu4belyKkC3mKg2uyoE4llo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Szyysc52uD50lV2tdc8HtRsy4dKym0Aczp6fsvMT0vZq0W7gLceyCl4dBBYoWirQSQ4txAmoH78BAaepXC7nfyZftppf4ifYkiGUnwwhu6N8a2gkfHhDx7vB4ogGVhu5OHFz8GcQyJrOzKcnAQhQmf04/kkqAtqo1W6qNqZXeM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IB0vHJPV; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IB0vHJPV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744613976; x=1776149976;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0wMjcRHkX6uNdf6OAm/aJu4belyKkC3mKg2uyoE4llo=;
  b=IB0vHJPV72qgTH1a6a3iB4mVzdPhdJ0RfLlFLQbeke0aib7lsXRTjql5
   0eB9fUix5sR8yQxigKBLwYG5s9B/Lm1BI/z7MB7UiHIt6GYzYUp/R77c+
   ZXgxwfDP04d4IvpJWiuP9+2wrN4ISKhxeR4C3CeRo4XlcXUebXGtMdu4G
   5O3Q6YXTyq1O+FN4cIX8vIZvMEiwzkpHeVGncfjz5UlPSLfH42SzdtYMc
   JBYFXHOj6qa287ZvLFHIuV8zmbEj9WSHvkVr4EoC8UgiyVdbfqrHiBXMk
   cKY/vMOXPUeIiVQ/Kww86oysymN/nm0wGR4PtEFVsXV2pCJMBKTlkddCh
   Q==;
X-CSE-ConnectionGUID: 42UK41dERl2VyvIWcMYIhA==
X-CSE-MsgGUID: mBk9do3kT/WEhBpXnyQ6/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="46204173"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="46204173"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 23:59:35 -0700
X-CSE-ConnectionGUID: GfbqN0cTQHiFgvxdInDqPQ==
X-CSE-MsgGUID: +ViJCt8sR5+zZ3xgJOlnXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="129582849"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 23:59:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u4Dn1-0000000C9p6-0log;
	Mon, 14 Apr 2025 09:59:31 +0300
Date: Mon, 14 Apr 2025 09:59:30 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Remo Senekowitsch <remo@buenzli.dev>, Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: Re: Exporting functions from vsprintf.c for Rust
Message-ID: <Z_yyUmYoihvpP0_5@smile.fi.intel.com>
References: <D931ZH9KRY2E.2D7HN6QWELGFJ@buenzli.dev>
 <Z_jj_8vvmWY-WuTU@pathway.suse.cz>
 <D93S1SHPJDDU.INJ3UWZUM1UY@buenzli.dev>
 <CAKwiHFi_egfePDdXQEtYNvO-U65O==MosHNQ7Vm4F6iudJs95g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwiHFi_egfePDdXQEtYNvO-U65O==MosHNQ7Vm4F6iudJs95g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Apr 11, 2025 at 03:43:12PM +0200, Rasmus Villemoes wrote:
> On Fri, Apr 11, 2025, 13:36 Remo Senekowitsch <remo@buenzli.dev> wrote:
> > On Fri Apr 11, 2025 at 11:42 AM CEST, Petr Mladek wrote:

...

> > > Honestly, I do not have a good feeling about exporting the internal
> > > vsprintf() functions. They have a very specific semantic.
> > >
> > > Especially, they return pointer to the next-to-write character.
> > > And it might be even beyond the given *end pointer. It is because, for
> > > example, vsnprintf() returns the number of characters which would
> > > have been written to the buffer when it was big enough.
> > >
> > > Instead, I suggest to create a wrapper which would have a sane
> > > semantic and call scnprintf() internally. Something like:
> > >
> > > int fwnode_full_name_to_string(char *buf, size_t size,
> > >                              struct fwnode_handle *fwnode)
> > > {
> > >       return scnprintf(buf, size, "%pfwf", fwnode);
> > > }
> >
> > That makes sense. I tried your suggestion and it works, thank you!
> >
> >
> But is a wrapper even needed for this? Can't the appropriate sprintf
> variant just be called from Rust with that %pfwf format string?

+1 here. But if really really need that wrapper, it should go to property.h.

-- 
With Best Regards,
Andy Shevchenko


