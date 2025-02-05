Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C9C2288FA
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 07:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738742331; cv=none; b=acSVBcMWbj8LSHoEw5CXjrpBsBm4+7ycJFi7qV4xkm53cCcfx8X2FqZCiZgP4n8CubASvT6Oo/Gj9jyM6+zzVnwkxe3uDY3WJlB4tPA9/9mtacpy60uUfoNJbs0DUx9qkmW/HVyhzwv1pgW6FWVC2PnPLRW3uhbXzJMaheH5O9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738742331; c=relaxed/simple;
	bh=za10ppFd3LMvTI5u30Aw/yO25iB9zNqVPTJoLSVJ4jc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g2m2RHlDkj66Vk6rPPCuM3d0pZplJuMkfFOiCuuA1KzsXr0RoyVaWbYL9OyUFZTxtERJm9yCFKpYiUZID+lB0DVa9QlovRAiFMCZV4u3ocarMkLWwsaCinC/dI0UwHD9cVYQBN6FJmkG3SLijPOocc7TorYodyF9yN56w0MIpeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FtE5zw13; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FtE5zw13"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738742330; x=1770278330;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=za10ppFd3LMvTI5u30Aw/yO25iB9zNqVPTJoLSVJ4jc=;
  b=FtE5zw13u6QCEpc+Tbx5vHqm3mOX6xqWZ5Zkfigy/h0GPAUEDAACCbbj
   flasLaCeAffWNEDV0oxgKXG6ZiG9b8uX6+FkEJyCG8nfwyDTGy70Tb1+a
   iNjpzYJUKy4p7ouphRlZD8BRasUL4RripCL+o7j7ZlxLk/2sBYSPAdSpr
   bdH8lWWmAZE21VD+OgrpmfISK85DsMtY1SvxcD6oRq1iHIz9UGcLTrXiF
   qhcRDWp5JfbwPnGZEnFKrZXSpV8xVoWREmJOcJnG8/Be60b8BOfLP07Pf
   dm5Izbshig2QDsaq7Osw33lWD0bfsglb94NWtVfCCzXZxwB3ADWYFTAyr
   Q==;
X-CSE-ConnectionGUID: Xc3m33qKSrC9SslyY1geRA==
X-CSE-MsgGUID: kztjIaNERUmDYjN2jM05oQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="42132410"
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; 
   d="scan'208";a="42132410"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 23:58:49 -0800
X-CSE-ConnectionGUID: P2fXbVH6SImWEgxX+dMuIQ==
X-CSE-MsgGUID: nD9HonyLTpCorB9blfQ5LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110679021"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 23:58:47 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tfaJ3-00000008Q1e-0qFK;
	Wed, 05 Feb 2025 09:58:45 +0200
Date: Wed, 5 Feb 2025 09:58:44 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] MAINTAINERS: Add pin control and GPIO to the
 Intel MID record
Message-ID: <Z6MaNI2SiWLKyE2k@smile.fi.intel.com>
References: <20250204170100.48263-1-andriy.shevchenko@linux.intel.com>
 <Z6JQTdXEDWPaupZp@smile.fi.intel.com>
 <20250205054006.GP3713119@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205054006.GP3713119@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Feb 05, 2025 at 07:40:06AM +0200, Mika Westerberg wrote:
> On Tue, Feb 04, 2025 at 07:37:17PM +0200, Andy Shevchenko wrote:
> > On Tue, Feb 04, 2025 at 07:01:00PM +0200, Andy Shevchenko wrote:
> > > Intel MID record is not listed all related files. Add to there
> > > pin control and GPIO drivers along with HSU (High Speed UART)
> > > and HSU DMA.
> > 
> > Mika, JFYI, it's supposed to go via Intel pin control tree.
> 
> Got it :)
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko


