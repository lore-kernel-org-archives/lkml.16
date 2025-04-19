Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55732AE95;
	Sat, 19 Apr 2025 16:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745080034; cv=none; b=U4hNeMN/jnfOqpD6IvCkPBkU5RA0+uBcdaBZbFEH29RFDwzm3UBzbO8K9nYFN7SyChVQ+vnBEQlpvA/JWaTum6AYhhanRhxkMM7tpazRkmUjRIY5De+uJtEwT4ljkX5Cd83BanJcJCtbmhcud+0nWlrt036T74p8MidrEb/gvEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745080034; c=relaxed/simple;
	bh=CjSLS6CFLaMP2MqJxwT233TWR4a50xcSmKRK5SbNH14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RO4trNTUYiVrMQsPRjWO+QU38a2MXvdi7Z3y06IEXLDEtMw+BeBirpW3jUcK3VOTAnStZ/Rv9HWDfW2zvZCpdlerOlDonz/VqP2ClKvRR2DNat2uDdOnIPaq+l6rN6t87S2Yl9NUbPeLvpnUYJ9/xpEmLN2+ntAsIVkuQAgvipw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XtHzZ9Ua; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XtHzZ9Ua"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745080033; x=1776616033;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=CjSLS6CFLaMP2MqJxwT233TWR4a50xcSmKRK5SbNH14=;
  b=XtHzZ9Uafj84Mj6ohPk9KdtDmmXeTanmmebWXxYBjQTSDLLZBgmSqCMV
   ihvxyFG2R8VdjfxMrGSTKv9IsArgfAgIMCIxnRJq1MY/JqqfGiRGZH99+
   dmVR7PR6dbymEjIq/WiF6wWRn3XETTiO4PCDle+5jZaNmtLfDUd5lUV7+
   uDJsBYijlfz2PL9pw0r7MRBpXNY/1V/C30exLFcmp8p0aiX74TsJVulKL
   58jSCbsf3byuOuUoj+cvUmmO+Od3Z58UyQYlw7iQtyBBTAqBpcCqvgkLT
   KSpWKAAaxxKWyrLIHeg53dYEeghSVazohPi2f5k66txMpNPjO+sqwjs4M
   A==;
X-CSE-ConnectionGUID: RjJdKomaTm+ZvGfhBeZefA==
X-CSE-MsgGUID: fa8nK8bbSSCMdOeMA7n2nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="45914040"
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="45914040"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 09:27:12 -0700
X-CSE-ConnectionGUID: d3EMuULqRwGvtV4QMgvRug==
X-CSE-MsgGUID: ybnQLnxDS3mJg6vDWZAzEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="136516042"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 09:27:11 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u6B24-0000000Drfe-1j5Z;
	Sat, 19 Apr 2025 19:27:08 +0300
Date: Sat, 19 Apr 2025 19:27:08 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 1/1] usb: Add checks for snprintf() calls in
 usb_alloc_dev()
Message-ID: <aAPO3P1_-C7Nhil4@smile.fi.intel.com>
References: <20250321164949.423957-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250321164949.423957-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Mar 21, 2025 at 06:49:49PM +0200, Andy Shevchenko wrote:
> When creating a device path in the driver the snprintf() takes
> up to 16 characters long argument along with the additional up to
> 12 characters for the signed integer (as it can't see the actual limits)
> and tries to pack this into 16 bytes array. GCC complains about that
> when build with `make W=1`:
> 
>   drivers/usb/core/usb.c:705:25: note: ‘snprintf’ output between 3 and 28 bytes into a destination of size 16
> 
> Since everything works until now, let's just check for the potential
> buffer overflow and bail out. It is most likely a never happen situation,
> but at least it makes GCC happy.

Any comments anybody?

-- 
With Best Regards,
Andy Shevchenko


