Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0E92770B
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 05:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738734010; cv=none; b=uDqLf/+gFecu0FOwML6WPPEudNT5iA8MXSWGXRq1kJqimP0WiM0gpIEbTSTBgd4QIst5yJmKCBF8F7CGWTSDNqIp/w93ldd6vInD4pn0sG9Fikky23z70n0fAL8SMERp8sk/1jRUon5yD0lFmxHsMNm4pvq/t+BulDAemiQ2hPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738734010; c=relaxed/simple;
	bh=ezmPad5fsmR8mnI+YmWvBH5TB9LNW6msTsAkmuugELw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gSJ2jyuzwDQHoZh+DeE0hwyFCgvx5qv7w+/pnzqqACsrYYaN6lardyQ/mPc7503D9C4PLfN7wUaAKsHNLp8BDl6zAaBpxLucFgWRu5g3lOZDXi/54MnE7NBA147cPtnESetfT5mM2GkEad5s38s7+yYqkqCCDKtGkiVulfs3ZGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W77+REdq; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W77+REdq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738734009; x=1770270009;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ezmPad5fsmR8mnI+YmWvBH5TB9LNW6msTsAkmuugELw=;
  b=W77+REdqvH9FtT5eFcjfiwa4TwVAuL7h3SITP3exEexiGVwIBQG4BGy2
   6DXKN2ilIHrX6c/e6J+0TWuuI+DPTwDbwAGCbnO7jvc4/9U2O+MQLw78o
   nLGQwMYVxMpO+ySwPIoXNT/He226zty0UZcsjLlVGLZ2q2n9jVLdSXRYC
   K+Z6zBAvpQDMGoy2PMIbqQtqnTSrxMDQ7Hi5qcWCRLDCrRfoARpbQBVc/
   XU2BVIyaNGmkbVdYbQFgoZYRRXhgd4waZt9kw/1uXiB1Mx+K7X3H1sQsm
   4KtwP6huHZOXN1Evn45A39NJiRddGLiKnLyD+nwhp2tod+hL5QPDUmAR+
   A==;
X-CSE-ConnectionGUID: fy2kMyuZQGWU9KnegBOOhA==
X-CSE-MsgGUID: hRo4xTifQAiSmPGyIuWSqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39315347"
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; 
   d="scan'208";a="39315347"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 21:40:09 -0800
X-CSE-ConnectionGUID: o9W/FGUHRaCt2OsfqK702Q==
X-CSE-MsgGUID: vZwK1uLkQnaF/k1e6UOQoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141690945"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 04 Feb 2025 21:40:08 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 82C9925B; Wed, 05 Feb 2025 07:40:06 +0200 (EET)
Date: Wed, 5 Feb 2025 07:40:06 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] MAINTAINERS: Add pin control and GPIO to the
 Intel MID record
Message-ID: <20250205054006.GP3713119@black.fi.intel.com>
References: <20250204170100.48263-1-andriy.shevchenko@linux.intel.com>
 <Z6JQTdXEDWPaupZp@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z6JQTdXEDWPaupZp@smile.fi.intel.com>

On Tue, Feb 04, 2025 at 07:37:17PM +0200, Andy Shevchenko wrote:
> On Tue, Feb 04, 2025 at 07:01:00PM +0200, Andy Shevchenko wrote:
> > Intel MID record is not listed all related files. Add to there
> > pin control and GPIO drivers along with HSU (High Speed UART)
> > and HSU DMA.
> 
> Mika, JFYI, it's supposed to go via Intel pin control tree.

Got it :)

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
