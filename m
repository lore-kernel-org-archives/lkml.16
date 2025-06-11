Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D043B1632D7;
	Wed, 11 Jun 2025 15:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749655341; cv=none; b=pcha1xyiwHM1Di8MH4IwvsyPzOXNBc4nW/KriGNguZUfLYrjfoBBJrFZ2lNqtNkaTGTwp+INdfWC0JHLRFHCLNGmdXHdjDNLwmdYU92OcHQRybnxBw5fue5F7kfNLtpNnGofUc3O99svuhICTAGC0y5NwATB0hAtvq/5N3LFxtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749655341; c=relaxed/simple;
	bh=nLyTLw3X4zqEgVxTxIWmgt4SSnc21bPbXLZbJ7pGNls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ke0EH4pRmI31wot+sHrnN4ZcwpoAR67l34QhtzWR7wJsI7zmRsvamxavKMVlt40x2aGWGrsEZYfI5iOs3Hlf44zXqzrou/VeFiy9Rm7wTJ+pYj8UyVNaKyHpzqSQZ1+x1Ux+C0hj9xDvytWJoPhMwko5BHh9D17oNrXlzIa0ZW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JU7sK9xS; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JU7sK9xS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749655340; x=1781191340;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=nLyTLw3X4zqEgVxTxIWmgt4SSnc21bPbXLZbJ7pGNls=;
  b=JU7sK9xSS0/OescAGs9zA7wjFlbibfo29ROvlWnPa+69v1vR9unUnYLN
   DxuxAM8lnKsVPfDTc82OXQXfQe7ZWS00Vdr+kf/IRwk77esr0Tfe0yqGV
   fUNrg6bUWhCtBq8U2yqgXPrP7Gr58N7xzoHd0aZ4Im465XiimOfG4LiT0
   dZ9JR76aq3BfnncfPeZrz5ev/KRBTK3eeIR68axY+LWiLYoEKiKF5ebs4
   +fEPRp/jjbrRwlMxbctnlvZ6r93VixRnTlX/Erh1ZVNCFEbt7XBNpnHao
   5dwNL5Qsrks3C2kH8hSRANl1FSmHALJxbabDQXRof55RxMV9bUhr3HXPp
   Q==;
X-CSE-ConnectionGUID: BR6lHDagRDejpkwtyTPnNw==
X-CSE-MsgGUID: 4sGP0AZ4RJiiftqMu9Nbxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51683115"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="51683115"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 08:22:20 -0700
X-CSE-ConnectionGUID: u9bzbMWdQqeO7GUioZzDog==
X-CSE-MsgGUID: ExX/Dka9SDKwCxt7YVLaOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="151019509"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 08:07:49 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uPN3K-00000005gC7-476M;
	Wed, 11 Jun 2025 18:07:46 +0300
Date: Wed, 11 Jun 2025 18:07:46 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Jelle van der Waa <jvanderwaa@redhat.com>,
	Hans de Goede <hdegoede@redhat.com>, ikepanhc@gmail.com,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	Armin Wolf <W_Armin@gmx.de>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	ibm-acpi-devel@lists.sourceforge.net,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] platform/x86: Move Lenovo files into lenovo subdir
Message-ID: <aEmbwiciy81fL58O@smile.fi.intel.com>
References: <mpearson-lenovo@squebb.ca>
 <20250610192830.1731454-1-mpearson-lenovo@squebb.ca>
 <20250610192830.1731454-2-mpearson-lenovo@squebb.ca>
 <aEiVHXI4vS9BDOPW@smile.fi.intel.com>
 <002d39fe-44ed-45a4-9410-4fecf1c2163f@app.fastmail.com>
 <b8af4da0-bd7f-1d65-8645-73dbd08ff3a8@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b8af4da0-bd7f-1d65-8645-73dbd08ff3a8@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Jun 11, 2025 at 06:01:36PM +0300, Ilpo Järvinen wrote:
> On Tue, 10 Jun 2025, Mark Pearson wrote:
> > On Tue, Jun 10, 2025, at 4:27 PM, Andy Shevchenko wrote:
> > > On Tue, Jun 10, 2025 at 03:28:25PM -0400, Mark Pearson wrote:
> > >> Create lenovo subdirectory for holding Lenovo specific drivers.
> > >
> > > Assuming Kconfig entries have mostly been copied'n'pasted, the rest LGTM,
> > 
> > Yes - no changes from what they were previously.
> 
> Indeed, no changes, too bad that the addition "depends on DMI" was missed 
> because of that ;-). I've fixed this for you to not delay this patch 
> further.

Oh, thanks!

> A diff-of-pre/post magic trick helps to validate while preparing and 
> review move changes like this:
> 
> diff -u <(grep '^[-]' patch.patch | cut -b 2- | sort) <(grep '^[+]' patch.patch | cut -b 2- | sort)

AFAIK Git can do something like this for you (patch to the patch) or `b4`.
Never used personally, but interested to try if somebody tells me what to
do :-)

> The sorting is not always needed if no core reordering is done in the 
> patch but regardless of sorting or not, the unexpected differences are 
> usually pretty easy to spot from the output of that command. It's how I 
> found out the lack of depends on DMI on the post side and have found 
> plenty of similar issue when changes are rebased/reordered in a series 
> that does contain a move change.
> 
> While applying this, I realized I'd taken Jelle's ideapad patch which 
> resulted in this move patch not applying cleanly, so I ended up moving 
> Jelle's patch after this change to make things easier for me.
> 
> > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > >
> > Thanks for the reviews and help with both patches
> 
> Thanks for doing this, hopefully LKP will be okay with this change too
> and we can once again focus on less conflict prone work. :-)

-- 
With Best Regards,
Andy Shevchenko


