Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62D6257AC4;
	Tue, 11 Feb 2025 16:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739291994; cv=none; b=rTNOQNmDY4iI/TCbJv31FDPe2cV1/qUYZndO3jLSPKLTBwt1C1JpdWQJHHxNTeGfeyITWSZ4i8MHg3a0eQ4JawVDh5RFXa3Tqs5IFdHAtLjIXmSo3M5CJTxpcyX4zW06HRld1ntHKUfTypuWbHv8hp/pHDp1garHbXkXKQ143NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739291994; c=relaxed/simple;
	bh=H2fCS4Q4rqBdrg7i74n6x0vUEzZhCNop8HhhxXYZHn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bucLA5nh7Z3/J1k5xOjnFKtOc5SA8rZ+8RpGVFkSWzDjWbFyCOXoRHfrRL4RgGieyIkiO8gnwn3gh6C7Tni+GM5nzn/fO6zmHsWhNbh2yuWcy/gfVo7sLlyij4lodAaCjs/XeZU1r7IzePFK0b2obnTUUoX0PeZ3cqPaJXDW4FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B80xUC+U; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B80xUC+U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739291993; x=1770827993;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H2fCS4Q4rqBdrg7i74n6x0vUEzZhCNop8HhhxXYZHn8=;
  b=B80xUC+Ugz4F0VmyAzlmrQYAYRJVXdoQ9OdsSZNkxH7x/xxImyaWra5W
   x8DDn9c8RYRqwE5tN/H6Um4hZDdDUTiipzArY6JeEYCvGI2MSdNz0dpL/
   mGNe9XTzjFVRl3Bi79d4L1gXsoZJV/3fYar55/MSGANivFUBZNGZ8lLyN
   5HLw8qhonAZb7ZOWwYsoXNdgwu5H3SMyiktjtX01V+YeaIs7TTOkMX2vD
   ZC6T4VBXLq0x96jw88+S05PEKtVk1x3aL1FSbcdu+o407RQ0IfJq3Lms9
   ekPlBDtcj4NmIszNwWk9BsUNy7b6A7EQuoT1/b0a9pYdb5DJNs+bVtQeu
   Q==;
X-CSE-ConnectionGUID: /2LfW9EMSiCdxGrURdSk8A==
X-CSE-MsgGUID: A3ki7GbwSGi1HDopNO4FNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="43680104"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="43680104"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 08:39:53 -0800
X-CSE-ConnectionGUID: njqMASv5S1iJuEVoN6V+cw==
X-CSE-MsgGUID: 166zJZvgTUiEs6tbVkBnWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="149748905"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 11 Feb 2025 08:39:50 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D39228F; Tue, 11 Feb 2025 18:39:48 +0200 (EET)
Date: Tue, 11 Feb 2025 18:39:48 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Kurt Borja <kuurtb@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Hans de Goede <hdegoede@redhat.com>, Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 07/14] platform/x86: alienware-wmi: Split DMI table
Message-ID: <Z6t9VD3r4ZodtQW8@black.fi.intel.com>
References: <20250207154610.13675-1-kuurtb@gmail.com>
 <20250207154610.13675-8-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207154610.13675-8-kuurtb@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Feb 07, 2025 at 10:46:03AM -0500, Kurt Borja wrote:
> Split thermal features into a new DMI table to support upcoming file
> split. While at it:
> 
> Rename quirk_entry -> alienfx_quirks,
> Rename quirks -> alienfx
> 
> and change hdmi_mux, amplifier and deepslp types to bool, because they are
> already being implicitly used as bools.

...

> +struct awcc_quirks {
> +	bool pprof;
> +	bool gmode;

Wouldn't it be better to have them as bitfields?

	unsigned int pprof:1;
	...

On 5th quirk (if ever happens) this will gain memory.

> +};

-- 
With Best Regards,
Andy Shevchenko


