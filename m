Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7F01A3168
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750670472; cv=none; b=iXMwrl6s5GhPLFIqwNjCUC9jk+hWRNqvtyuqkNRefkOda++/MMABVdzcExp6KDlOThyu4fG2FRZ3fdTerrztm41ABZkIM2TD6iYwo+NWZQ70MH1xVfrXVtBqd3dh6rugsXOib8XjlnJ7ID27RoKuAteWWxJtlOzcnjzgVuyAyg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750670472; c=relaxed/simple;
	bh=WHuMrT4VV4Bu1Jl7ZtS7maj/zCPsiEJExK/Xuq5G/B4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jiOo0j1a6j91w0GSg5E/LMw81zBNEQTAsM/YCRwjvGCcse+m61CNNe9B+LwpexT/xKD4nryJ7iea/6zhRtdHriZoQG1aeazD2vQ+oYV1Cp4mmQ64oqT3aumPgraDGiebQq+oofevoR90bE3kIyPrAjPHiC9MNXv1KJ1K1qXy84A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WPhft0/e; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WPhft0/e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750670470; x=1782206470;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=WHuMrT4VV4Bu1Jl7ZtS7maj/zCPsiEJExK/Xuq5G/B4=;
  b=WPhft0/eXQ7q4pXRYCsFsS3P36vfqoAZ0MxXwOajxgf71rxu/WgBp1Le
   aVJ+VGv2xT/egRhEs2avMx6iTNP9DEU2/XGLoWOCrE7DDrEqb4KyPndzJ
   e9l6YUHOXUlU0l3cped84mt7/uPXsdyN+Zdwfq2pSkKfmUExoc5IWaAvC
   UavjoyGe7iNBMiO9/IFQnnB5zfQO70N0b2Jvn1Qgh0boA9/fs5I2R+io5
   pfN9M8pLJ3AG+wAJz8ywjOxWrUYj74adeNsS5mjPRhOFlMds3g111dsqr
   iERy0fiDzsZiMtFWA0+PQIo77BUgAkXE3+1zFGbqwtrQZM1N60FfjDlBp
   w==;
X-CSE-ConnectionGUID: eyKgD6ZsRfG83hXETxocgQ==
X-CSE-MsgGUID: DAv+p/d6Q+ehNsko+flAqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52839482"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="52839482"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 02:21:10 -0700
X-CSE-ConnectionGUID: zj72m9qZRfG6/tslyOohHw==
X-CSE-MsgGUID: 2Y3bHLmbSB+kGoHi9UbV4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="152218840"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 02:21:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uTdMO-000000097WG-0pHz;
	Mon, 23 Jun 2025 12:21:04 +0300
Date: Mon, 23 Jun 2025 12:21:03 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Daniel =?iso-8859-1?Q?D=EDaz?= <daniel.diaz@linaro.org>
Subject: Re: [PATCH v1 1/1] x86/defconfigs: Explicitly unset CONFIG_64BIT in
 i386_defconfig
Message-ID: <aFkcf6it0bW36jdw@smile.fi.intel.com>
References: <20250623072536.3425344-1-andriy.shevchenko@linux.intel.com>
 <20250623090642.GAaFkZIq__HR0FJE-0@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250623090642.GAaFkZIq__HR0FJE-0@fat_crate.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jun 23, 2025 at 11:06:42AM +0200, Borislav Petkov wrote:
> On Mon, Jun 23, 2025 at 10:25:36AM +0300, Andy Shevchenko wrote:
> > From: Daniel Díaz <daniel.diaz@linaro.org>
> > 
> > A recent refresh of the defconfigs got rid of the following
> > (unset) config:
> > 
> >   # CONFIG_64BIT is not set
> > 
> > Innocuous as it seems, when the config file is saved again the
> > behavior is changed so that CONFIG_64BIT=y.
> > 
> > Currently,
> > 
> >   $ make i386_defconfig
> >   $ grep CONFIG_64BIT .config
> >   CONFIG_64BIT=y
> > 
> > whereas previously (and with this patch):
> > 
> >   $ make i386_defconfig
> >   $ grep CONFIG_64BIT .config
> >   # CONFIG_64BIT is not set
> > 
> > Fixes: 0e11f689ec03 ("x86/kconfig/32: Refresh defconfig")
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> No SOB by Daniel?

Ah, this is just a cherry-pick (with fixing conflicts, updated Fixes
and removed the last paragraph) of 5y.o. 76366050eb1b ("x86/defconfigs:
Explicitly unset CONFIG_64BIT in i386_defconfig"), it should be standalone
patch. I borrowed the commit message.  So, whatever you prefer: I can send
it again as the original one, one of x86 maintainers can do themselves
the cherry-picking / conflict resolution, or I can resend it as mine.

-- 
With Best Regards,
Andy Shevchenko


