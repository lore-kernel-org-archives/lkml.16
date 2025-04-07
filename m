Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5EB1A8F6D;
	Mon,  7 Apr 2025 13:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744034067; cv=none; b=GoXuL6XM09QqkhHhwMeO4g+hXzrxlHV+YZ7evyTVOggyQ0vmP5cxR50LuD/5WHJQGCZgA7PNR2vF+GHUy+EDmllHIwqnx6jlMd+uPXRFbRTKCID6lBsjLbUsTi/kzbJA8rtsjXaozcGTRANQ/wJxX1wn5mts/7nMZgAqXdV+Q6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744034067; c=relaxed/simple;
	bh=ebTEjSHDPVKHjqLElg5dQchc9kRzX7fngXPEzS/5OSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ncrJ28nKXmC00qWUfpLdadKIUcP31aHV//TDsopZZ/vT3+amWghveuFx8RKEoVc/G3cAOGjvHayrSArmJC3KemTor9ZBceY36rkWRdlDWE2vxIxdRda0iKj56ESCcwyYwTiezJ8scj3XHF992YXFFia9LoMTCcWPkwp1Cw11C50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N64aoeZY; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N64aoeZY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744034066; x=1775570066;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ebTEjSHDPVKHjqLElg5dQchc9kRzX7fngXPEzS/5OSM=;
  b=N64aoeZYUHPCJNtXXLYskXsWDco+j16wN0aMZOIRRhu+YZSS/uFRzXIU
   iCIK95M9WZI5IzcgCUUo2xo6A/yuJ+m9jC9HyGidmnTB7x//AyRhjW7Um
   sbQ5f++eoDN7Uoj4WrhzuuoqFy1/UTEswdhqMOStnNBfU+SIpw8xpPJvQ
   I1Gq5thZEJW0F4vCAtXGpbsbMJJ3bLRJKOrzvuW/Drife2Bf+CuDAsaSr
   jlpWCu2wTRJ6RNsIhJLTFvZjJwUgOxRNvqFWoCk/G/1oRsPCDEl4rLMVx
   2YdX495X8ThUPL3VsuU7eDQsfMLAh2g9vj+qw/7AMUclXO5NRBySV1OqQ
   A==;
X-CSE-ConnectionGUID: 8cX0OgYwRKqwMhWUVyi6HQ==
X-CSE-MsgGUID: 8a14Ikt5STKbm0pjQQqZCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45587706"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45587706"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 06:54:25 -0700
X-CSE-ConnectionGUID: Dy4TRIkCT5CJkptOv4ahSw==
X-CSE-MsgGUID: ehvvZzDbTdKqfCX5RZ/uWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="133171633"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 06:54:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u1mvW-0000000A5On-3Pgc;
	Mon, 07 Apr 2025 16:54:14 +0300
Date: Mon, 7 Apr 2025 16:54:14 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: alyssa@rosenzweig.io, Petr Mladek <pmladek@suse.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Aun-Ali Zaidi <admin@kodeit.net>,
	Maxime Ripard <mripard@kernel.org>, airlied@redhat.com,
	Simona Vetter <simona@ffwll.ch>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>, apw@canonical.com,
	joe@perches.com, dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com,
	Kees Cook <kees@kernel.org>, tamird@gmail.com,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	Hector Martin <marcan@marcan.st>,
	Asahi Linux Mailing List <asahi@lists.linux.dev>
Subject: Re: [PATCH v3 3/3] drm/appletbdrm: use %p4cl instead of %p4cc
Message-ID: <Z_PZBr0BPnkuoLs2@smile.fi.intel.com>
References: <8153cb02-d8f1-4e59-b2d5-0dfdde7a832e@live.com>
 <PN3PR01MB9597A66B39FF5824E3718EC3B8AA2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN3PR01MB9597A66B39FF5824E3718EC3B8AA2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 07, 2025 at 07:07:54PM +0530, Aditya Garg wrote:
> From: Aditya Garg <gargaditya08@live.com>
> 
> Due to lack of a proper printk format, %p4cc was being used instead of

s/printk format/format specifier/

That's basically the term (`man printf`) everybody knows.

> %p4cl for the purpose of printing FourCCs. But the disadvange was that
> they were being printed in a reverse order. %p4cl should correct this
> issue.

-- 
With Best Regards,
Andy Shevchenko


