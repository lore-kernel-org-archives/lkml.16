Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DC9158DA3
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 22:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746223285; cv=none; b=l4zqV87tvxkEb9nWZFlP2/slm2Qsz+9yWGl6xqOICi8v2+f6b8xzXaPtpPbsAKftT1Sc1GKu/nf/BI7pIVRdLsdzv4BfENjefI48oJWc+ve0P+kKQeVKWhZ33/LVeKU55P4AYBK+slaY1J2rzUBafSDOABgsIk1K/F4JYnI4BpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746223285; c=relaxed/simple;
	bh=g2L0DiFchcRcWTRIYrYtKwdvxxj4qkBj/M+zD1Wt90A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T5Ttmlr68TGeqsDl8pJGY94IQ9TSbp667PeVAS0cDVmmxQU86TRtNRFnmEFqG+ndV4eBXP1Hcf6ibVFyy1z+6C2HqQilDSNJ2jzNHKRYPF//YblX3UAPibio5prkQTXF3B7/IIORZTqm1TIssJRjEcQ6gQW6q+lDBMHyKZUsqJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T932DS4G; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T932DS4G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746223284; x=1777759284;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g2L0DiFchcRcWTRIYrYtKwdvxxj4qkBj/M+zD1Wt90A=;
  b=T932DS4GTkBuPlul9SIP2HxpZWpWHojJVq1S0fNdAEgxO+8v6vbm/cYB
   WLF1vchtndc7shvZ0c10jb8lYSdldeJmEp1rz7X/bDi/sNPpizgzgZ347
   dS+/9x9fyFrpAxqQmzNaePSJo1sRzKO0Rgbo6RSgrFhcxWKmdt0UTN2DH
   BXJmoccjrIykUrqv+J1N68WaCfJPTAG7oy7gBdhVAzRVUMMC+PBJyfiLM
   yTbQUnYeKZRBU7cCwl9h8tbWytWResY9f3udK3wQcI1wTxqfACEta3/x8
   2uj6vizy8l6trkDUDzPLGD5Gx6wHtIB5T8azGTHHWlRTz1DweKJD7cb3z
   Q==;
X-CSE-ConnectionGUID: DlHDHG06SAeFbynA6JLWlQ==
X-CSE-MsgGUID: mO9X1+JoRFWCkNUjbhKYEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="35530985"
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="35530985"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 15:01:23 -0700
X-CSE-ConnectionGUID: HXywO6IAQ6SchY06TtzNAQ==
X-CSE-MsgGUID: EACeiJPjQp2DMuv4js4efQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="157966951"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 15:01:21 -0700
Date: Sat, 3 May 2025 01:01:17 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Lee Jones <lee@kernel.org>, gregkh@linuxfoundation.org
Cc: david.m.ertman@intel.com, ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
	heikki.krogerus@linux.intel.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] mfd: core: Support auxiliary device
Message-ID: <aBVArb-zJ_aqicHW@black.fi.intel.com>
References: <20250428060207.3170325-1-raag.jadav@intel.com>
 <20250501125028.GM1567507@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501125028.GM1567507@google.com>

On Thu, May 01, 2025 at 01:50:28PM +0100, Lee Jones wrote:
> On Mon, 28 Apr 2025, Raag Jadav wrote:
> 
> > Extend MFD subsystem to support auxiliary child device. This is useful
> > for MFD usecases where parent device is on a discoverable bus and doesn't
> > fit into the platform device criteria. Purpose of this implementation is
> > to provide discoverable MFDs just enough infrastructure to register
> > independent child devices without abusing the platform device.
> > 
> > Current support is limited to just PCI type MFDs, but this can be further
> > extended to support other types like USB in the future.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> > 
> > v2: Introduce a shared struct mfd_aux_device
> >     Introduce auxiliary device opt-in flag
> > 
> > v3: Fix device_type ABI breakage (Andy)
> >     Aesthetic adjustments (Andy)
> > 
> > v4: s/mfd_aux/maux
> >     Allow num_resources for child device (Andy)
> >     Fix build warning (Andy)
> > 
> >  drivers/mfd/Kconfig      |   2 +-
> >  drivers/mfd/Makefile     |   2 +-
> >  drivers/mfd/mfd-aux.c    | 156 +++++++++++++++++++++++++++++++
> 
> This looks like mostly duplicated platform device code.
> 
> If you are _certain_ that it needs to exist, you need to push it out to
> the auxiliary subsystem and remove any traces of it being MFD related.
> 
> If it's needed by MFD, it'll be needed by other auxiliary users.  Even
> if not now, sometime in the future.

Greg, if you are okay with this, please let me know. Or perhaps suggest
a better alternative.

Raag
