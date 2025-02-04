Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019A1215F7F
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 17:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738690643; cv=none; b=ZQ2GJt2O5P/PYkp67tXh9CYf/3YLYUkYsQ42UJK7Ewqh9ypTw3mJFlsEQ4Geoj19wjdLrYb+NFdjU86AXNjaYm/fTGw+Gm4yu7GtlKREgugEeJUSbvngKEvmk6BQjKRITN52HRqCIgzI1UekhzVWE0ElWHx9ozhZ/wfXWeoaIV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738690643; c=relaxed/simple;
	bh=iCTbSkQzSnfDpO7rJBNHYdT63RyeFsPcfKqFqUyu26Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dADeU6C0XxgElji9iD0hqTM5da7ODTg5K3GntwyQYOuvP/ZEFf79LY1HLKwpBsO2Z3DbEQBe12uVCPoVIVO5cXvx9OS7CGTyIIOhogyAXQyfHOUyolVAf348UwJetZpxFeT/aG1649TBKQn5aM06EU65WFw6AuPXsPjlg4W4CB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SvNaRBQg; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SvNaRBQg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738690642; x=1770226642;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iCTbSkQzSnfDpO7rJBNHYdT63RyeFsPcfKqFqUyu26Y=;
  b=SvNaRBQg2QklQJgSiU0DKhwTsu2N8Z1MGwjks54efI4C3SbtQksS2Gvv
   jYyzSS+K5zyBxeeLLxXHMdwiJ3bgkDe1/19teJ4d/oMkYwlbCaqlTOJvE
   ReLDdY6M/O47J4qRE/e/r2Zf1ijXmrgN24iwC3ZRtkSi+bgVCXHbSil9F
   rOOQp639j3OADbU5agUUtB2W1pDuvbckFXmt6vU9N5l9qMwEkhfRpvcnN
   ojZrT1n3YzeZ0XM93W6E3+aowEwYKQZMO1O3bQJqbSwKc8oNUSzXR8+3d
   mgiMVnffZhEsYICumpwFL5k6Pz5cWvVh7nV+c8AC1lfT+QPFSe9RFqF1B
   w==;
X-CSE-ConnectionGUID: Ko61X0tWTFOH0+QJilnsOQ==
X-CSE-MsgGUID: eymBdeiUQjqKhqLCiWd92w==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50224504"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="50224504"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:37:22 -0800
X-CSE-ConnectionGUID: DXrB1vMwSLSVwIJjON0Pcg==
X-CSE-MsgGUID: u5oJvKBKQpKSxtyfyzL45Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114716353"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:37:21 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tfMrN-00000008DQV-47n9;
	Tue, 04 Feb 2025 19:37:17 +0200
Date: Tue, 4 Feb 2025 19:37:17 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1 1/1] MAINTAINERS: Add pin control and GPIO to the
 Intel MID record
Message-ID: <Z6JQTdXEDWPaupZp@smile.fi.intel.com>
References: <20250204170100.48263-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204170100.48263-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Feb 04, 2025 at 07:01:00PM +0200, Andy Shevchenko wrote:
> Intel MID record is not listed all related files. Add to there
> pin control and GPIO drivers along with HSU (High Speed UART)
> and HSU DMA.

Mika, JFYI, it's supposed to go via Intel pin control tree.


-- 
With Best Regards,
Andy Shevchenko


