Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1054B260A22;
	Tue, 11 Feb 2025 16:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739293113; cv=none; b=QctkWwLmmASQ3zweKZ7ayNrSTyS+O0MmUlXAr6VhHph1gWW/IXGHAP32DS9lRsuIuzOpG4qbME8AErukS5BVY7Mn5RItCg55yztowOjboHo4r1SIuXKzrbmwLQH8jzqzp0vLS0rhTAyd410i7/fDH9bb4LxV/SN3b03RfrYLvdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739293113; c=relaxed/simple;
	bh=JxhyIFT/kpdhKlUGLQ6bdwzTRMcGXiQ6AtSHMduG9K0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OwI+X3WIM8eHuSknJIlT61VK6Xw0qhe6QnZ+9FuEi2FJRduiKHwOkTXR7i1bIQJV6N5/cUFj2f2FWghIDkWGb6T6NYOZ6XieA5fkw7dysn5Lc1HlnEV1VCFK/1K8ViFu6eiApHNwfaHCTNbKcL9YHfX7u6dDlx//JAAhyDEik5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kfJK9XwE; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kfJK9XwE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739293112; x=1770829112;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=JxhyIFT/kpdhKlUGLQ6bdwzTRMcGXiQ6AtSHMduG9K0=;
  b=kfJK9XwECePLwynouuUZIpybMbvE3P9foeDpREs117Qxm9hBrXf+aXPE
   qLGfByvCZPDWz+cmVgk/kJTVIuku+fbDHdKSQ6auhNW7C17Ck89W26z5V
   96fNQvsrHgBOsUV6gi2+ruVvq27F2B1DzbeSygIVIXDNyUr59+Ru644Oo
   DQYwQLTaoLzPR3LqR9DXQgrQiXEB4NYSQe0cZGtGLMWiNj/79QjNT6HT+
   oq5Wf7u8o+9E03oUaZUdougoQH35BPhBlkPBMKxfsqCsL2WQFjVDLv6Nr
   AMwul1QjQlIOstxezXuExadvLJda3/lcK4vvmfieX7ZUZkBglQ9dONpBg
   Q==;
X-CSE-ConnectionGUID: kZwyFYajT8ShiEoPO7vFZg==
X-CSE-MsgGUID: heZ5bAtHSEKl41hT1cJW+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39156318"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="39156318"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 08:58:31 -0800
X-CSE-ConnectionGUID: Axd9I7z3QsOQgJqFlncPdw==
X-CSE-MsgGUID: jqPlC4RsQvC9VI5fVkRFMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="117648676"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 11 Feb 2025 08:58:29 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 1C6CA8F; Tue, 11 Feb 2025 18:58:28 +0200 (EET)
Date: Tue, 11 Feb 2025 18:58:28 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Kurt Borja <kuurtb@gmail.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, Armin Wolf <W_Armin@gmx.de>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Hans de Goede <hdegoede@redhat.com>, Dell.Client.Kernel@dell.com,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 00/14] platform/x86: alienware-wmi driver rework
Message-ID: <Z6uBtEg7DZtWPn4r@black.fi.intel.com>
References: <20250207154610.13675-1-kuurtb@gmail.com>
 <fd4524a6-0b1f-d929-61a5-b1ad188c938a@linux.intel.com>
 <D7OT9WA7NKIG.1HK94X2IR7ZBX@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D7OT9WA7NKIG.1HK94X2IR7ZBX@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Feb 10, 2025 at 08:48:05AM -0500, Kurt Borja wrote:
> On Mon Feb 10, 2025 at 6:53 AM -05, Ilpo Järvinen wrote:
> > On Fri, 7 Feb 2025, Kurt Borja wrote:
> >
> >> One more correction. I apologize for the noise!
> >
> > Applied to review-ilpo-next. Thanks.
> 
> Thank you so much for reviewing this, Ilpo :) 

Please address my concerns in the followup patches.

(Main concern is abuse of objs, others are more like cleanups to improve
 readability and maintenance)

-- 
With Best Regards,
Andy Shevchenko


