Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAFF35979
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 10:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748428270; cv=none; b=WV64KFx2UB+CSRnTTLYsmtILn/wndEFhnkkgNyxnhf5fbnJTkrwpbAq1z94jqncNNicXZ2mSpD0TekHVrou0P1uKoa2AuDnkUcivKMk2iGM++xYa/27gtVnHFGYwJpQlgZ0D5Oq/j0/PAuEzztLFj0GnWpr1bfZyr83+D5l3iaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748428270; c=relaxed/simple;
	bh=5FpyHY2tQuyzJ0S2g4vKQEYDZ8iGnxH6tJ5/Xaw/2eg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K83/FiyLjZb1xwwdkKkTcSwHgV6zWq5v1BoO3icpDv15g/JISJ00Q9b7D0ieIIZ+jJOKzjNatEGrfA+O0LWiQ9Rbb+iucDJCjdcAPoenDJ+pqNL0DUISzkFmc04ivuVjCWW3bTVFmNGK8TtEchk661MBgsZsFjexdJqn1UG+gFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KnehEPHW; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KnehEPHW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748428269; x=1779964269;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5FpyHY2tQuyzJ0S2g4vKQEYDZ8iGnxH6tJ5/Xaw/2eg=;
  b=KnehEPHWpC1e6bbHC1a1XMJPJg6n5WeMHh3cyp84peYFVqLIyonKYDym
   qALCppj6gkhovHE3qYkGMnZQrn4sRuT+N1PfQMAtF+dVKNfmuCSqbET6n
   33cNHD0n/S5BGH0TS4y8ZikaLPIntobZU+ISMg4nFtIrQUYp0v28TuAoV
   n2rs8lL7gGqMA8NtKGz6vBF2TgDQ4cBKdv1mNa9TjH826L3x2SQ4fCG1u
   DBgGTiEBXNuJthuDCKZIpyEdvJa7bkpBpcRlI0ot1wokPsoDggI6/i6JT
   kQQuaK0+lvgXgz9jpx3x4oF2sdp2mZx46IiKVULqfgFg95tCnZyvg+V38
   A==;
X-CSE-ConnectionGUID: izohwbUkRFaLsFI+zpvOdQ==
X-CSE-MsgGUID: Zq/+W9i3SqeXvxvqFp9VAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="49695531"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="49695531"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 03:31:08 -0700
X-CSE-ConnectionGUID: s3rzE0s4SMa7uinSdw/PTw==
X-CSE-MsgGUID: mhMGwAv/SfGRjzvLZUWWkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="143234633"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 03:31:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uKE3o-00000001PuX-3hiz;
	Wed, 28 May 2025 13:31:00 +0300
Date: Wed, 28 May 2025 13:31:00 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Christopher Snowhill <chris@kode54.net>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
	Imre Deak <imre.deak@intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Michael J. Ruhl" <michael.j.ruhl@intel.com>,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	dri-devel <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/vsec: fix CONFIG_INTEL_VSEC dependency
Message-ID: <aDbl5CIGulMng3de@smile.fi.intel.com>
References: <20250523121106.2231003-1-arnd@kernel.org>
 <j7yodlrk7wh3ylvb2z622ndlzm4guhahmakdb6l5d6qtv5sabo@w4bfiehtmaab>
 <aDbYs7QZRfr2i80A@smile.fi.intel.com>
 <704fd2b9-04da-4ec8-b854-22bc3ce9058e@app.fastmail.com>
 <DA7PSM1WUKBI.3JA6THJTRF5B7@kode54.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DA7PSM1WUKBI.3JA6THJTRF5B7@kode54.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, May 28, 2025 at 03:17:03AM -0700, Christopher Snowhill wrote:
> On Wed May 28, 2025 at 3:03 AM PDT, Arnd Bergmann wrote:
> > On Wed, May 28, 2025, at 11:34, Andy Shevchenko wrote:
> >> On Tue, May 27, 2025 at 03:55:46PM -0500, Lucas De Marchi wrote:
> >>> On Fri, May 23, 2025 at 02:10:46PM +0200, Arnd Bergmann wrote:

...

> > I think ACPI_VIDEO is at the center here, and changing all the
> > 'select ACPI_VIDEO if ACPI' instances to
> > 'depends on ACPI_VIDEO || !ACPI_VIDEO' would solve a lot of
> 
> Maybe you meant 'depends on ACPI_VIDEO || !ACPI' ?

I believe not. The depends on FOO || FOO=n is idiomatic in Kconfig.

> > the recurring dependency loop problems in drivers/gpu/.
> >
> > Actually doing it without regressions is going to be
> > nontrivial though, because any change in this area is likely
> > to trigger another dependency loop somewhere.

-- 
With Best Regards,
Andy Shevchenko


