Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6C313D53B;
	Thu,  5 Jun 2025 19:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749152618; cv=none; b=PrjhlXSS04uWplaPJ5Asi3KN/W2U9Ebtkqkc7+TVZCKTcQzJpebK75FtBB33Ffks2Jql4pu/hmwl0QTUdCcdSkgww4RVpQ/woV731TQJj8hW9tOzIS5B8v9X/L/qL5tJoSeXOybOVjjC9wpYMRwQaZP7n18+stecxB4at3QTSdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749152618; c=relaxed/simple;
	bh=VLOUVhQrMl4XAJ98RU/ZeVhQMV1SLl+3znWYmt8OdJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bFVj+sbJUd+93t5c9f7o7axUMJ4L+oRE+HrW9lZ1tQf9aKpDLqsrjKQIoqvbndkvH4WSNZbG/aVqkYHtUvV+iUzQnYCWi0p+4muFaseYX345fOV413Dq8BP588x6LTVI4dt/rIsl8ZkJOixFGppZcqvM/QhZHfJU11xlBLvBy4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PX+W28fm; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PX+W28fm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749152617; x=1780688617;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VLOUVhQrMl4XAJ98RU/ZeVhQMV1SLl+3znWYmt8OdJQ=;
  b=PX+W28fme3MUZxmAxQy8V2sfB5g5uHP0uS2wueAKJaQw4UMKqrj8mfAo
   /MLydDASzqnF6rBrwhEw8TYNzd8WNH2IvOr8j8y/827snj/6cb1cIesbQ
   nLYGaCLKdOGzA5oY/cljYdLd8DbtORKiZquQOZ3iOPY2t3MIZ5sL1wZcz
   0lXLpmv+uEKyyAcmdtRcHZTEz46zSIW+I8nEhPJ+Nr/dori9ThvQ4nlin
   4WwizdP2Jidzktizeft344rA97/1C8yVMq1mBYI5NFu9AO7nKczpQ3C5r
   F+6TUF06iey90XcvFVmUUPczVbep31mtnokW5LvsA7sw094VM/Vh15zfI
   g==;
X-CSE-ConnectionGUID: WUA/Ld+qRhG63gkAJ0XNgw==
X-CSE-MsgGUID: FQUP2z1ASBGWKG0870e4Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="55097227"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
   d="scan'208";a="55097227"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 12:43:36 -0700
X-CSE-ConnectionGUID: E1ZyDno8RNGwjQxzqLw5zQ==
X-CSE-MsgGUID: wWqhUdQ1QHmESSUM+W2UZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
   d="scan'208";a="145576147"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 12:43:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uNGUs-00000003yiI-0sUk;
	Thu, 05 Jun 2025 22:43:30 +0300
Date: Thu, 5 Jun 2025 22:43:29 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, ikepanhc@gmail.com,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	Armin Wolf <W_Armin@gmx.de>, linux-doc@vger.kernel.org,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: Move Lenovo files into lenovo subdir
Message-ID: <aEHzYT4XqhzIpO5k@smile.fi.intel.com>
References: <mpearson-lenovo@squebb.ca>
 <20250604173702.3025074-1-mpearson-lenovo@squebb.ca>
 <aEEyEfYgpPQm8Tlx@smile.fi.intel.com>
 <71f410f4-6ac6-41d2-8c99-2a02e0f05fed@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71f410f4-6ac6-41d2-8c99-2a02e0f05fed@app.fastmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Jun 05, 2025 at 11:53:47AM -0400, Mark Pearson wrote:
> On Thu, Jun 5, 2025, at 1:58 AM, Andy Shevchenko wrote:
> > On Wed, Jun 04, 2025 at 01:36:53PM -0400, Mark Pearson wrote:
> >> Create lenovo subdirectory for holding Lenovo specific drivers.

...

> >> -F:	drivers/platform/x86/lenovo-wmi-hotkey-utilities.c
> >> +F:	drivers/platform/x86/lenovo/lenovo-wmi-hotkey-utilities.c
> >
> > You may follow the trick in the Makefile (see intel folder) to avoid repetition
> > of the folder name in the file names. Note, the modules will be called the
> > same (assuming no ABI breakages due to renames).
> >
> Interesting - I'll have to look at that a bit more.
> Any objections if I leave that for a future change?

IF it's nearest future :-)

...

> >> -# IBM Thinkpad and Lenovo
> >> +# IBM Thinkpad
> >
> > This is a bit ambiguous now. It's IBM and Lenove for ThinkPad... Perhaps you
> > should put some kind of date or so? Like
> >
> > # IBM Thinkpad (before 2007)
> >
> > (note, I speculated on the year, you may know better what to put there).
> >
> 
> Sure. Realistically the thinkpad_acpi driver still works for the (pretty old
> now!) IBM Thinkpads so it's a bit messy.
> 
> Main reason I did this is those two IBM specific drivers aren't, to my
> understanding, active for Lenovo devices now, and it seemed wrong to move
> them. Not sure if anybody really cares though :) I just didn't want to step
> on any toes.
> 
> IBM sold the PC business to Lenovo in 2005, so I can put that date there
> unless anybody else has concerns.

Sounds good to me.

-- 
With Best Regards,
Andy Shevchenko


