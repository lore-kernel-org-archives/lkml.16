Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46405290BCF
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 19:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745521272; cv=none; b=bh2xfSs+j/Z/wQ9j4QmYGqeBnaCfhzXEUO5P9kmPJo3NXhIycWDbUdRAozFZOXuZkG/nambByL5TVn4PKRcg21iMAVRr8y9wDfjXdByNn8oze3RzNrLWIcSbVe8Kqjah+pKH/H8bIn6SogAb6p2StaofCJXfRF1brK99ozxOOOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745521272; c=relaxed/simple;
	bh=XfeVzs942+9g02dBs1aqyKi6qcxeaLfttLApj8kReNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VKql1KWu+QcmagEqtsOFgqQRicNbZxVf+lohnExbQl5m00QYx4GZMMn+VCXbZYeLsjyd4rOCGc0Yjwy6J/+Xk01eKmB5nTls/sxeS5nB8OO92EL9FblfpkMZJCuN0OZolgATWJ9CQsfzEYur7mu0m+VE6bxKNoe8I7foRJzoZm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NdZENzci; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NdZENzci"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745521270; x=1777057270;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XfeVzs942+9g02dBs1aqyKi6qcxeaLfttLApj8kReNE=;
  b=NdZENzcinAnMjvE52ZVf4dLEWSudKXVpLRS/QdwVljKC0PtgtA7hooJG
   AZiuwCVxlbodtiiJv5EXZmO6K+MYbaaEAGoZIYkHb/e2GueZxqkKbGhmP
   SnYugMsXU2e4dVqjei2DfcZvjX3ZWqmwYKN9DB1f8yT6FWunv/VpPs/NR
   2LtKrBiazlj2FT/MZzP02CHNVnKLDiiCKSCMsjv1qScZGtWasS2kvkY9v
   xk6iwjhFtvZX5tbOC9wBuMxbWZ/dVfcC3QqNZ40v9G70MIL5TrnsMo4af
   HuPZzfVtckOG6D4lZ2xhSRSB4hpOdJPajKNWM3U2GHqC1UFdjtGDNugsd
   g==;
X-CSE-ConnectionGUID: o9hAx5ULQ4adcogXsktXlA==
X-CSE-MsgGUID: 3rfCa8LWTxeQHaRgoYe9Xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="50996038"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="50996038"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 12:01:09 -0700
X-CSE-ConnectionGUID: WrjLcc2UQ0mg2uwD7QiA1A==
X-CSE-MsgGUID: yPqe9R0YTJ+U/KUaAyhM7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="137691785"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 24 Apr 2025 12:01:08 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 8B2151AC; Thu, 24 Apr 2025 22:01:06 +0300 (EEST)
Date: Thu, 24 Apr 2025 22:01:06 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: Peter Tyser <ptyser@xes-inc.com>, Purva Yeshi <purvayeshi550@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH] mfd: lpc_ich: Fix ARRAY_SIZE usage for
 apl_gpio_resources
Message-ID: <aAqKcn25bkrjIiLF@black.fi.intel.com>
References: <20250322131841.31711-1-purvayeshi550@gmail.com>
 <174377238828.330559.7652024137546009839.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174377238828.330559.7652024137546009839.b4-ty@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Apr 04, 2025 at 02:13:08PM +0100, Lee Jones wrote:
> On Sat, 22 Mar 2025 18:48:41 +0530, Purva Yeshi wrote:
> > Fix warning detected by smatch tool:
> > drivers/mfd/lpc_ich.c:194:34: error: strange non-value function or array
> > drivers/mfd/lpc_ich.c:194:34: error: missing type information
> > drivers/mfd/lpc_ich.c:201:34: error: strange non-value function or array
> > drivers/mfd/lpc_ich.c:201:34: error: missing type information
> > drivers/mfd/lpc_ich.c:208:34: error: strange non-value function or array
> > drivers/mfd/lpc_ich.c:208:34: error: missing type information
> > drivers/mfd/lpc_ich.c:215:34: error: strange non-value function or array
> > drivers/mfd/lpc_ich.c:215:34: error: missing type information

[...]

> Applied, thanks!
> 
> [1/1] mfd: lpc_ich: Fix ARRAY_SIZE usage for apl_gpio_resources
>       commit: 87e172b0fdd3aa4e3d099884e608dbc70ee3e663

Can this be reverted ASAP, please? See below why.

There is no problem with the code. The original author of the change
haven't proved otherwise.

The change made it much worse to read and maintain. By the way, it actually
_added_ the problem as far as I can see with my small test program.

Let's just calculate based on the sizeof(struct foo) taken as 10 for
simplicity and array size as 4x2. The full size of the array is
4 * 2 * 10 bytes. The size of the entry in outer array will be 2 * 10 bytes.
Now, what ARRAY2D_SIZE do is (4 * 2 * 10 / 10 / (2 * 10 / 10) == 4, and
that's WRONG! This will make a out-of-boundary accesses possible.

If smatch can't parse something, it's problem of smatch. No need to "fix"
the working and robust code. The original code even allows (in theory) to have
different amount of resources per entry, however it's quite unlikely to happen.
But at bare minimum it shows the entry taken along with _its_ ARRAY_SIZE()
and not something common over the outer array.

-- 
With Best Regards,
Andy Shevchenko


