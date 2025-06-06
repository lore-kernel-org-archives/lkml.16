Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEF5189F43;
	Fri,  6 Jun 2025 08:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749198140; cv=none; b=X8UKH8Dg8U1WemXkmNTz+xIy/iQpJvVnW9b2bxxCe0WZdeLNLjQLY87nVe1ZHnaulubuAus3U0DLFRCo3Pf8zvYg04DbIQTJmi/vlpyJFfqy27PA21Cc4ytq8J/glNGyk8Hltgbwcyp26enWoQ28yUuXtKyKUxsifBmPKjBedrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749198140; c=relaxed/simple;
	bh=5Wcwpm0Z8kSMrpruTks0M12X5foA0MV5jmGMbNb+6dM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TxylhGxcl2Fy6ozcNJTUj/CaoL376lEydp/9cpomx8zsNk/sPhrwkEl/JDdvZQmi9szLzGjekv+m846PY9Nxj7bsRUI5fyEOgxr+xB1EAqLVd87DGhBBZGBmCl0Q0kb4ZSfj61gGWlaGGqbibKFdfD7iK5PGeckxmV2zBVYyhHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PgiPE4xi; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PgiPE4xi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749198139; x=1780734139;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5Wcwpm0Z8kSMrpruTks0M12X5foA0MV5jmGMbNb+6dM=;
  b=PgiPE4xiq3agC8yfPvRGGyqz3Bj1BMWMdd6oCY8ZAouBCRbkMMsGe+OY
   i/B5uao6dM6AynfMRjNOXBKYiLSD5IX72c+mhHPlSUYJHqQvZLF4IRB0o
   piknMLz/7MqpxmeyNHsHm/ppDG6ppSXlcXsBW1HTZFrC3sMVnT6Ai4P+U
   9+/8fIpsvWT6cMER6DawjHhacNUIVYsGD+DVyxINSgFpAV2RKqjzKumz/
   bsp0ok70rtfvKSXDIwLmb2Lm9zQf7RLX3BMeK+RNqBxmdX8F6BU1P8sfp
   kbNbMbDqG8magKrqFTehdT5BuAXAds5db0RRiExaMOcsW7S9yca9MC3OP
   w==;
X-CSE-ConnectionGUID: eMynQqGZRumCpVJn7QcTCg==
X-CSE-MsgGUID: U7i0eh3wT7u74oiA/d3JCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51486171"
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; 
   d="scan'208";a="51486171"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 01:22:18 -0700
X-CSE-ConnectionGUID: eboYxtTKRUmWuzIQmUOnyA==
X-CSE-MsgGUID: 1kUmMYwXQ2eM37IKT+dL5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; 
   d="scan'208";a="145776851"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 01:22:14 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uNSL5-00000004837-1i9R;
	Fri, 06 Jun 2025 11:22:11 +0300
Date: Fri, 6 Jun 2025 11:22:11 +0300
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
Message-ID: <aEKlM5lzhuVdYS-U@smile.fi.intel.com>
References: <mpearson-lenovo@squebb.ca>
 <20250604173702.3025074-1-mpearson-lenovo@squebb.ca>
 <aEEyEfYgpPQm8Tlx@smile.fi.intel.com>
 <71f410f4-6ac6-41d2-8c99-2a02e0f05fed@app.fastmail.com>
 <aEHzYT4XqhzIpO5k@smile.fi.intel.com>
 <dd3b79e3-a0d1-4413-8c69-58ca6b4fb8c9@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd3b79e3-a0d1-4413-8c69-58ca6b4fb8c9@app.fastmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Jun 05, 2025 at 05:03:15PM -0400, Mark Pearson wrote:
> On Thu, Jun 5, 2025, at 3:43 PM, Andy Shevchenko wrote:
> > On Thu, Jun 05, 2025 at 11:53:47AM -0400, Mark Pearson wrote:
> >> On Thu, Jun 5, 2025, at 1:58 AM, Andy Shevchenko wrote:
> >> > On Wed, Jun 04, 2025 at 01:36:53PM -0400, Mark Pearson wrote:
> >> >> Create lenovo subdirectory for holding Lenovo specific drivers.

...

> >> >> -F:	drivers/platform/x86/lenovo-wmi-hotkey-utilities.c
> >> >> +F:	drivers/platform/x86/lenovo/lenovo-wmi-hotkey-utilities.c
> >> >
> >> > You may follow the trick in the Makefile (see intel folder) to avoid repetition
> >> > of the folder name in the file names. Note, the modules will be called the
> >> > same (assuming no ABI breakages due to renames).
> >> >
> >> Interesting - I'll have to look at that a bit more.
> >> Any objections if I leave that for a future change?
> >
> > IF it's nearest future :-)
> >
> I got this implemented - I'll include it with v3. It's less complicated than
> I thought when I initially looked. 

Thank you!

> Thanks for the suggestion.

You're welcome!

-- 
With Best Regards,
Andy Shevchenko


