Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560861A38F9
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 16:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749227144; cv=none; b=dq1jABtgG89K6fZCZj4pxg/gu6SkytmF4KX69TqGAKrPL9hMQT3RASHdKmGANXSgLXSJSWdzygb/MIdU3rb14lOk6wvDye3uVK93UiPBRXRghVSuR5KYZZezbiL/f/6qncR4BtzvZhigp09XUgDEudSFOvPU37g6BeB6IwKDfDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749227144; c=relaxed/simple;
	bh=oVXZg15NSmSTzHYB7TIMygNLt5CrLOPw+eUrgDEEOoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YelDn6Oeq9qQHMgN3ODDCSwAh6r3C8hcmW4h9CyRL41BYjsYpGMBS9aIQxYSjmN1pZd1VF+V8TwzvJDgyiqi2e23TXpqxGFEl+Rn24K3Vt9r0QgjmbQNzX+zmT+QXbUXIw2F7kLOpIFF/3BJaEdl4JPkFOrcYEarBCyPKN5Lo7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NNWxxbnD; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NNWxxbnD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749227144; x=1780763144;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oVXZg15NSmSTzHYB7TIMygNLt5CrLOPw+eUrgDEEOoI=;
  b=NNWxxbnD2IvO5eIVX47Sa4FxXLTMFooKrwjX0ieXJJtfKiTLCVLjjmVw
   5p3NClz7qp18XamQ0GrUIyWQLnnskVaVQw+9O+hVi5umQ09ewFtZXM962
   1zLAs0tOHgWvCy6pXsbfWxWGs6fU72KasDD7uKdQg88Ud2AjP2yxPvQge
   xYOQUmTX4mPyUfHaAo8Axu9kqY/1AerGdfLTN/DgmTpq00g9ppF8A/ydM
   EQorCxh9QJa67uvg9u536mvADklcl/gZCZ2oM5k8NmHgax6Ov72lnu+gw
   yHYs9WFJrfFPbtw0pWkPTfaHB7e/ML7hwGlINZbiy/JdkUox0yFTtHD6p
   Q==;
X-CSE-ConnectionGUID: ajQFbEn8TQWJNVf9sX8+nQ==
X-CSE-MsgGUID: eejMPj0CRBicZOGbFGuoIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="54009935"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="54009935"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 09:25:43 -0700
X-CSE-ConnectionGUID: jeGBrprqQem9yr4AG2i7iw==
X-CSE-MsgGUID: YJ1vM9b8QSWwVcFyZfLMEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="176817506"
Received: from agluck-desk3.sc.intel.com (HELO agluck-desk3) ([172.25.103.51])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 09:25:42 -0700
Date: Fri, 6 Jun 2025 09:25:40 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: Fenghua Yu <fenghuay@nvidia.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Peter Newman <peternewman@google.com>,
	James Morse <james.morse@arm.com>, Babu Moger <babu.moger@amd.com>,
	Drew Fustini <dfustini@baylibre.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Anil Keshavamurthy <anil.s.keshavamurthy@intel.com>,
	Chen Yu <yu.c.chen@intel.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v5 14/29] x86,fs/resctrl: Support binary fixed point
 event counters
Message-ID: <aEMWhMbLpImmMBrL@agluck-desk3>
References: <20250521225049.132551-1-tony.luck@intel.com>
 <20250521225049.132551-15-tony.luck@intel.com>
 <f368c506-c479-4e8b-a5c6-b9bc5bcd5674@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f368c506-c479-4e8b-a5c6-b9bc5bcd5674@intel.com>

On Tue, Jun 03, 2025 at 08:49:08PM -0700, Reinette Chatre wrote:
> > +	sprintf(buf, "%0*llu", fp->decplaces, frac);
> 
> I'm a bit confused here. I see fp->decplaces as the field width and the "0" indicates
> that the value is zero padded on the _left_. I interpret this to mean that, for example,
> if the value of frac is 42 then it will be printed as "0042". The fraction's value is modified
> (it is printed as "0.0042") and there are no trailing zeroes to remove. What am I missing?

An example may help. Suppose architecture is providing 18 binary place
numbers, and delivers the value 0x60000 to be displayed. With 18 binary
places filesystem chooses 6 decimal places (I'll document the rationale
for this choice in comments in next version). In binary the value looks
like this:

	integer	binary_places
	1	100000000000000000

Running through my algorithm will end with "frac" = 500000 (decimal).

Thus there are *trailing* zeroes. The value should be displayed as
"1.5" not as "1.500000".

-Tony
