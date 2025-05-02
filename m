Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C9F13C81B
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 14:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746195150; cv=none; b=MdeJmlm6aOk0czmUNsi0XDx1aCezTQRKIYL5mWYYnIuWK9AbsOx2z4RWzCDpnQFvJBQzOlEhihnJwbWOclws60RTUmEODRtgBqZln98RzW25hDtbB991sZx2G9g/kUj0uWdDpG12cYgfQdlUx9V/Za/rBay1IziUZEhBHX7Q5/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746195150; c=relaxed/simple;
	bh=6IiN64pMdETTKuBoZ6KIahbYP1bxXL+nvOO7V81IoLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sa8b2TPrlHOlxBeQCAKEoeki1LcQ8aaYSETH5W/RjY4JryqVY1jXNP4Xnbu+WITKCE5EG7UfJFJPYxAZeRmLMJwRJV2Iq+3MF7iOHLpW7zPVEH3FuUFvoAltgDE2s53X+hHsZ6P9PYu25Mm58ikkTb/GbUurronMAnhwEuntwj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=io2X+Wz4; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="io2X+Wz4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746195149; x=1777731149;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6IiN64pMdETTKuBoZ6KIahbYP1bxXL+nvOO7V81IoLA=;
  b=io2X+Wz4nAvMEJ5CctWeqLGVwM5zdiXMpPnrbg2R1QhEB/CMcdRcEnRc
   ikMfkvvNUUw6X0fr39FvsellQYT5wgXdh55sYiFuk2dG43mWLJAcpeA1K
   QY1SSIgR5azQZKM9A/VmrZhrk6KVY/9jIoTMmNYkfl64vR6croQqcgDRh
   5gEqkVGFoKUCx1FKKMw/7LJp+g3jGMXuu/Cg1Kboj2E0RlcflAxYmxMzt
   Vhdj18r+6IhlRHTlcKaWtNIN4LdJFXDsCSpGLVmqPKhRyLrT1l7w2YHN1
   7B6I+voFBndtySD1+8tf7rzwsP4oT55RKFMooVnZtNeBEcrDJWWcHmiwW
   A==;
X-CSE-ConnectionGUID: 1uB1L84VSi6vOQaxb8PCrg==
X-CSE-MsgGUID: Lww92LA4S9GWUEFj0NITYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="50533611"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="50533611"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 07:12:28 -0700
X-CSE-ConnectionGUID: dRbbnPvAS2qfiOETG/r39g==
X-CSE-MsgGUID: TVhQzDj3TzWWANPp4OevBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="135161349"
Received: from smile.fi.intel.com ([10.237.72.55])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 07:12:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uAr7m-00000002DjA-3C1Q;
	Fri, 02 May 2025 17:12:22 +0300
Date: Fri, 2 May 2025 17:12:22 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] coresight: cti: Replace inclusion by struct
 fwnode_handle forward declaration
Message-ID: <aBTSxhSoin-AOz44@smile.fi.intel.com>
References: <20250331071453.3987013-1-andriy.shevchenko@linux.intel.com>
 <28dd049e-65b1-4111-8a24-ba9765bbb1f6@linaro.org>
 <Z_zeIdZMhF31DL4o@smile.fi.intel.com>
 <34488e3a-9d59-4774-94e3-6369ab3c235d@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34488e3a-9d59-4774-94e3-6369ab3c235d@arm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 14, 2025 at 12:00:49PM +0100, Suzuki K Poulose wrote:
> On 14/04/2025 11:06, Andy Shevchenko wrote:
> > On Mon, Mar 31, 2025 at 02:40:51PM +0100, James Clark wrote:
> > > On 31/03/2025 8:14 am, Andy Shevchenko wrote:
> > 
> > > Reviewed-by: James Clark <james.clark@linaro.org>
> > 
> > Thank you! Can it be applied now?
> 
> I will queue this via coresight tree, for v6.16

I still don't see it in Linux Next, what did I miss?

-- 
With Best Regards,
Andy Shevchenko


