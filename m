Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D26260A20;
	Tue, 11 Feb 2025 16:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739292997; cv=none; b=Ayrd/IY8gSVx4AScU0K7o+C2fjeBBuS5PGNa4CKLNchWLmBoMShFXZd9Arqsb9CSiOTirsY5dLekID2Au7dNPw0/LfPRZY3BHJYkgqauiYwgxU/vKEdJS4jKDEnlFTEkEydT6nfb0YO/3lgBCN5avv9v9Vzv+6q9QfF67NEtggs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739292997; c=relaxed/simple;
	bh=TflqI1VzBNC2nAOZcM1JKCWEcdaHZrHdj5z5b6rAVyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iDtvkTiXYqvLbpg79KSUwi48ogf7oczt4W9LaQxgDDZfeHqkGAbw3kbgHLPBRiTs1nO7HhamPiGbBcU/B0RLyeBCRmfACvKSdbNiwNCV4TPG3ZqYmFQmmVQldRWwT5rxUWMfWOxXijluKlZY16VCTPaulSHuaoM6x6H1pK0MK8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n08hpbFH; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n08hpbFH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739292996; x=1770828996;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TflqI1VzBNC2nAOZcM1JKCWEcdaHZrHdj5z5b6rAVyw=;
  b=n08hpbFHrWPJSTWUm5yDc8KF5DmlUZfox39fVUbnJ2SdMVpyRcoSqo9c
   IkK6ymK0Nh4uPZRozCRgreo2Pc01/PurijRCHXzsYYPqHRXL82JMlGnFQ
   IE/G4vmPCU9k3oLmhSf5D7TdtpdHbTP6cMKBsMjq4KtiaYnP0phzvTcpl
   BG2hzfB/KjLLrT+qB9gLscSWZIJjcpBpC7OrMpRrV9aZYjp7/eg30625m
   UzmH/ijXaE911mMqhZaLzOpIkS0gZ5Sjva3SjupNFwaFbC66aRlVqsPXk
   ILQ+LlQ6k84/q4uTJ9VieYjxaROY3fdAmTjhhJ5dVt/i8ogRSIcg/FGbq
   w==;
X-CSE-ConnectionGUID: fCfMkwp8SSm1xdp4eIyusw==
X-CSE-MsgGUID: /5YjLLf3SGqfpAbXknDX5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40042346"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="40042346"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 08:56:34 -0800
X-CSE-ConnectionGUID: YgcJp3PeRTer3sFeHzaXLg==
X-CSE-MsgGUID: 7hvXJdtNTRe4k/esyEyW3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="149754577"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 11 Feb 2025 08:56:32 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 632768F; Tue, 11 Feb 2025 18:56:30 +0200 (EET)
Date: Tue, 11 Feb 2025 18:56:30 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Kurt Borja <kuurtb@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Hans de Goede <hdegoede@redhat.com>, Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 12/14] platform/x86: dell: Modify Makefile alignment
Message-ID: <Z6uBPuzGtLZ0xUb7@black.fi.intel.com>
References: <20250207154610.13675-1-kuurtb@gmail.com>
 <20250207154610.13675-13-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207154610.13675-13-kuurtb@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Feb 07, 2025 at 10:46:08AM -0500, Kurt Borja wrote:
> Add one more TAB to each line to support upcoming changes.

Fix the objs to be y!

-- 
With Best Regards,
Andy Shevchenko


