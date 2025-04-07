Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0F0224B1B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744012138; cv=none; b=HbZ3sN4Ggp8C1BzFG17qQtUN4xvM1Qjfejybe6uiT+QvDg3W4zU1Ow69DCdLl5VzFJEXy1KZpfGa6SK8SDZiosTrGyR7tCFHlQCJV0DX30/I4BV7BQBp+AQzebEiQsCZd7TwEJT/hS1ijnR3LOtz82qlR1dbeQjR30nJxrMPF2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744012138; c=relaxed/simple;
	bh=6kMCL7e98Trg/kRmYdJ9CL8T2YBILAgPyDXm5N6Ter4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eH0/YT6r9Fbte8Cvfkc8IaU051NFWtcsIFAxny96RlJvkboLtOc4blz5H7w9bi9Jmgvtp0278E6rvYDcopXrTHNHy/hXuIDWBc992SkTEq6oWrgaq7Ei3oJqpWRNtzXL3Lk3JfafaqXd/SjuWtrdqhIU/23D6Qm4i97tNAbqN60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YqGWh6Dj; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YqGWh6Dj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744012137; x=1775548137;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6kMCL7e98Trg/kRmYdJ9CL8T2YBILAgPyDXm5N6Ter4=;
  b=YqGWh6DjpyENtih8mkRIbXVA3m4ZCaZyJI3n9Ea3+0ZZiO/zk9ihniWy
   dCfuhNBeytEGf5uZ2nvE+y4ZmXUtchxZPaeExOrDSBMOwyJoNxa+75Cr1
   6T2fDzB13QxPRo5iHQ8Vo5Jh+Y22JfZfvvpIfDRaErLsLiGt8l5gGAs0N
   TUi+nAizMkSOI3o2iOpWaW3k8M5JNdayAd02QSkhXCwKGAJmADcuJA1dA
   XennGxz28Epnk5Af5h8XLRBz5OGXawJ6LFV77l8rYUtbfgMIrSqtUKLPk
   vH9GDpkfNEFcmm6b/DaDoDN0cbL8aYLGQcPRqsxDaxSJ2rUtyFSuXPPsx
   w==;
X-CSE-ConnectionGUID: TcBR3kRjRpmutVFNEOQihA==
X-CSE-MsgGUID: qbJUGxAJSd670VVMDHRMuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="49235685"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="49235685"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 00:48:56 -0700
X-CSE-ConnectionGUID: dLEeMPSBTdGe695sosnT5Q==
X-CSE-MsgGUID: eJT7hNQyR0OzsXbgzdVhSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="132718633"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 00:48:55 -0700
Date: Mon, 7 Apr 2025 10:48:51 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: giometti@enneenne.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] pps: generators: tio: fix platform_set_drvdata()
Message-ID: <Z_ODY6AlU3mCQg_5@black.fi.intel.com>
References: <20250318114038.2058677-1-raag.jadav@intel.com>
 <Z9l4ktWrZ3VGN8B_@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9l4ktWrZ3VGN8B_@smile.fi.intel.com>

On Tue, Mar 18, 2025 at 03:43:46PM +0200, Andy Shevchenko wrote:
> On Tue, Mar 18, 2025 at 05:10:38PM +0530, Raag Jadav wrote:
> > platform_set_drvdata() is setting a double pointer to struct pps_tio as
> > driver_data, which will point to the local stack of probe function instead
> > of intended data. Set driver_data correctly and fix illegal memory access
> > by its user.
> > 
> >  BUG: unable to handle page fault for address: ffffc9000117b738
> >  RIP: 0010:hrtimer_active+0x2b/0x60
> >  Call Trace:
> >   ? hrtimer_active+0x2b/0x60
> >   hrtimer_cancel+0x19/0x50
> >   pps_gen_tio_remove+0x1e/0x80 [pps_gen_tio]
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thank you.

Any guidance on routing this one?

Raag
