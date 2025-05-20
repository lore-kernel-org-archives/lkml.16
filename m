Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BE625D1F9;
	Tue, 20 May 2025 10:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747736135; cv=none; b=FMOePtpt0+0XF/Vv7oyJxJD4pcVTYD2XSCq7YK3F6HxBWiEMn3SI/dyU0siTtMWrrnZdOinBk+9pHtGFDZZ09B/N/82M4kimNkhW/dudmCSf7y4cOuLPq76lSkbdw0okrYkwM7Gf7xLI6MT2tMXknEy91OxQH3gVBWdcld8X/e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747736135; c=relaxed/simple;
	bh=ik41+/abgRIeP12Fo3CeVM7xonKl0FwXFjP6dgxTLNA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VnUBTt+8o41NYQg5IexEr96hvyn+ijM1p3vnu9obFaJo5JTN74dmlHko+4xWU1heTwmOSbmCzKtDe2yAn0lo0zMU8PqJidtCBdao7YYBmyI0EN8smSH6fi91PkhCF9b/M7KLsvYrlNlFoSXsBeT4eBv4gXFWk2DKGQyHlMc7r+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kuncn6ZK; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kuncn6ZK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747736134; x=1779272134;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=ik41+/abgRIeP12Fo3CeVM7xonKl0FwXFjP6dgxTLNA=;
  b=kuncn6ZKguwQIDFGI9NQJ9k8ZHnEl3F2bCNRkgpxE9BOtBEPP+esYdEL
   8EStaDzBKdsFwZZXRf6qL+MM9LelX1qfFeyjiy3MnwpbC56vjUFtm3fAg
   OFe7rTa5IBv2hgBmwgXkmWHy9VACubhE3u8pxHmUr1Po0Kzh2YtQDAA+u
   SHasBGukLJ0kt869tQIINOXhvKs6JBEvwjBiiWGLwiBy7mjYo/faOWedB
   rBEqDi/XYVe2wu7vFR64V9Ohl1C+QtaTh46z3VB2SBcTTGIyU7QhZK5H4
   6fF8uLskdiJVjTtMX9On9AOtdf39R1vpYp1bnAxrnxRu0mymYaovHHggU
   A==;
X-CSE-ConnectionGUID: /b/Czne7Soqq2YL9AP6K+g==
X-CSE-MsgGUID: VNFHF95wSbe1UZRfCnIW7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49360223"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49360223"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 03:15:34 -0700
X-CSE-ConnectionGUID: LJBebCiJRLy6I6Cf/zPk2w==
X-CSE-MsgGUID: +KVRVJbGT1K+cnkOrCh53w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="144637248"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 03:15:31 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, xi.pardee@linux.intel.com, 
 Todd Brandt <todd.e.brandt@intel.com>
Cc: linux-kernel@vger.kernel.org, todd.e.brandt@linux.intel.com
In-Reply-To: <20250516170507.4064466-1-todd.e.brandt@intel.com>
References: <20250516170507.4064466-1-todd.e.brandt@intel.com>
Subject: Re: [PATCH v2] platform/x86/intel/pmc Fix Arrow Lake U/H support
 to intel_pmc_core driver
Message-Id: <174773612605.1880.7682337143207967545.b4-ty@linux.intel.com>
Date: Tue, 20 May 2025 13:15:26 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 16 May 2025 10:05:07 -0700, Todd Brandt wrote:

> The ARL requires that the GMA and NPU devices both be in D3Hot in order
> for PC10 and S0iX to be achieved in S2idle. The original ARL-H/U addition
> to the intel_pmc_core driver attempted to do this by switching them to D3
> in the init and resume calls of the intel_pmc_core driver.
> 
> The problem is the ARL-H/U have a different NPU device and thus are not
> being properly set and thus S0iX does not work properly in ARL-H/U. This
> patch creates a new ARL-H specific device id that is correct and also
> adds the D3 fixup to the suspend callback. This way if the PCI devies
> drop from D3 to D0 after resume they can be corrected for the next
> suspend. Thus there is no dropout in S0iX.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/intel/pmc Fix Arrow Lake U/H support to intel_pmc_core driver
      commit: 219aadc94ba0bddc1355ce5c5abba7fc96e758a2

--
 i.

