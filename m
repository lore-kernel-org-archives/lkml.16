Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BE62629C;
	Fri, 16 May 2025 15:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747409461; cv=none; b=PV74D/6+t8XGml/L2W7wHCsjFEwIEtu5B8PAlQFeLHbtPqUr4AO6EK3o+HtUBpJcjR15iSUsnk2NU3ZLa7gTCKVYTT1+iNGDH763ufG8s8OxFSiBcRcO9hIUWh0HeR1jnUZ5tR9E4loCQOBvgJQWyQX+zbD3iW9n9mffG5DsVkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747409461; c=relaxed/simple;
	bh=svL/aY79Ecgpjdyn0gTlrY1lFNGI5rcL2sg9dXmNGdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=akOccas/krcSswcJa6fD5rm1GmrHLmtYhc7tQppnrt1aBw2p+fYusjAORcufaUan5HEGEm6MbAYTVyMyjr4HZBODTVpEeQwnMJR4aPhpZAZMew3OKBFsY0LzhZoTE8N3CTH6H1bxBpV9DWXLSABIFlHXYF3Eb71/iW55YjL+ZvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mA8o03Aa; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mA8o03Aa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747409461; x=1778945461;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=svL/aY79Ecgpjdyn0gTlrY1lFNGI5rcL2sg9dXmNGdM=;
  b=mA8o03AaKd3qWN9PazAkDClGI2XFuk6/Yl4fZVngX6r5lTOsLU1cNXMW
   6MSQyMJRGmHEwsRCRmit5iYsVtSGETkBPZfM+sJ8FCfMlYvhPaEQ2caQw
   KpLno1sY7YE80jSiWCo0JD0R2Jxgz+7RQ8VBxiD8HIBX+HvdqSW7QMAJf
   Efeu9Zz4XT8bMOOvKWDlQHAkp70CB/yzJTs4T9XlpY0Cp5hFnIpl5DCaq
   JMxXjzIUcjFXuOL1dq/3lNDLh82aHbe//wrFZ6WLTvt0YKFERrM9vy0Hx
   lNqobbyc3lA8p3/+nLemCSv1ycEOS0Mp412dv5GQHnAXYveUmLrC88VZZ
   Q==;
X-CSE-ConnectionGUID: 4BDl6nhuT+ujo1anekK8KQ==
X-CSE-MsgGUID: p3qGkSDyTk6dGRDqSxuzPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49286090"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="49286090"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 08:31:00 -0700
X-CSE-ConnectionGUID: qoEoDJC5SPeYwhmBgWAWtg==
X-CSE-MsgGUID: N6WibDeCRSGNW+ObP/Vgow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="175850756"
Received: from agluck-desk3.sc.intel.com (HELO agluck-desk3) ([172.25.103.51])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 08:31:00 -0700
Date: Fri, 16 May 2025 08:30:57 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: "David E. Box" <david.e.box@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	andriy.shevchenko@linux.intel.com, ilpo.jarvinen@linux.intel.com,
	xi.pardee@linux.intel.com, hdegoede@redhat.com
Subject: Re: [PATCH 00/15] Intel VSEC/PMT: Introduce Discovery Driver
Message-ID: <aCdaMel-zV8Qir69@agluck-desk3>
References: <20250430212106.369208-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430212106.369208-1-david.e.box@linux.intel.com>

On Wed, Apr 30, 2025 at 02:20:49PM -0700, David E. Box wrote:
> 4. Discovery Driver and API:  The core of the series is the addition of
> the PMT Discovery driver. This driver not only implements discovery of
> telemetry attributes and capability data (exposed via sysfs) but also
> introduces an API to retrieve telemetry regions by feature, which is
> essential for features like per-RMID telemetry counters.

This part of the series is the foundation for my telemetry/resctrl
patches:

https://lore.kernel.org/all/20250429003359.375508-1-tony.luck@intel.com/

That series includes a fake place holder for the discovery driver, but
I've been using David's patches for all my testing on real hardware.

Tested-by: Tony Luck <tony.luck@intel.com>

-Tony
