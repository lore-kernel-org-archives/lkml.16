Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0333515665C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 14:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744121337; cv=none; b=O0lwKaW7JKbiTO+6smg5LTzLEIWsTiqRkH7b/dUFCyVBKPFBTRccYK0D0qphKeYZCH3AGruqFVJyFxufsU0y+gWF1fHPDgbtXCNgH51cKFwC8WLpqpSMxglx/uxGNaqq5KfYprWzA2nEgyT0yN8+DNSQSNvbvqV7bKhYkrTJO54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744121337; c=relaxed/simple;
	bh=NOfEbOF5rTnvpjJIT1xnv2/oWd63tDLrRFEpwfkEAf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F5SeXSGYEpD/zBs/opuJW5Q9vdPOuNt8PkzIxgJTKpzYqNmHQ26Cn+lQ2Qw1XCEX3wYuvVtrQckNeMoOuysoO4OS/nKn0hM3MvGBHJo38MX+cj9cxbNtKgZjOVAS8b5E8qlurmJnj1eVbHsRk02TDsLmLRUFJbONe9PVrodm3BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WQMuxA8b; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WQMuxA8b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744121336; x=1775657336;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NOfEbOF5rTnvpjJIT1xnv2/oWd63tDLrRFEpwfkEAf4=;
  b=WQMuxA8b5Rq6AYwTlmtNoxDekaFn3Wt9UbdpHRVpzqXaGzDs/XBSyZFx
   gl+5/Oywlv4+BJb2rArKNa2RVFTbKD1L2goWPYAvJPc8nltAEcYSH86YF
   TFMVKfMM6f1irFvS2AyYSCrtM9p/lMUpOULcU4AnC02hxRSprfsQFTO2a
   ZrozJwA73vuB2covQDdhKJHLUe4zAu2UOM8p5WudoWX35ESmcDditzPuo
   d6XLB2A7M+2AsT/J/A9E9rAD2JwrVU0IhvSmqWxM7NXEHRUG+DzFyNMFT
   dKUPB4axoqwLKXrX4ffUy4zEMgFWcosE2s+ipIIPfbRxGHTtQFeVLW6Ia
   Q==;
X-CSE-ConnectionGUID: 4fIC2GJJT/mKdZ8sTm9fOA==
X-CSE-MsgGUID: sr4j9d+PTVOanDORyUCvrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56195448"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="56195448"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 07:08:55 -0700
X-CSE-ConnectionGUID: 21bM2bdYTy6O5WqypJnt8Q==
X-CSE-MsgGUID: fKhuY+rfTcG3uXLZpW78GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="159272350"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 07:08:52 -0700
Date: Tue, 8 Apr 2025 17:08:49 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: jiangfeng@kylinos.cn
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	rodrigo.vivi@intel.com, christian.koenig@amd.com,
	andrealmeid@igalia.com, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm: Fix the length of event_string in
 drm_dev_wedged_event()
Message-ID: <Z_Ut8UwQigTLXqKr@black.fi.intel.com>
References: <20250408112728.244146-1-jiangfeng@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408112728.244146-1-jiangfeng@kylinos.cn>

On Tue, Apr 08, 2025 at 07:27:28PM +0800, jiangfeng@kylinos.cn wrote:
> From: Feng Jiang <jiangfeng@kylinos.cn>
> 
> When calling scnprintf() to append recovery method to event_string,
> the second argument should be `sizeof(event_string) - len`, otherwise
> there is a potential overflow problem.

Thanks. Perhaps change the subject to reflect this as well?

Raag
