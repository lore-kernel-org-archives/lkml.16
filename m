Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A12927979D;
	Mon, 19 May 2025 17:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747675955; cv=none; b=spkGC3r1JMaO7Lt1Ch/mVhHxoe6t2RHfrIXfF4ANuaH7wzfilHEJ8qVwXFjwb3qpweYA1VPuuPN5VIzdrMNfaApQE2zbISEm6nTSufFCY+x2kZ614hE2HnEbqKC1pcO43wqNv+wNgIpgX6wckwfUfjjinxY0E5VA/a6/+WtxiwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747675955; c=relaxed/simple;
	bh=uxW/Y44LlHu7A4hcYct8su/An7A98gxV72NAtsVDtHI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=g3e3EfYoK4c76IjJZJJlRz/LxDY6wyXR873VmuK6Gj3KUWbRUDvyZN+i+uErGREayvOilICCCw+E4dQLRSGOOuoI/EMD0RcueiYYnm0Cx+YMrVa79CnfRBqxRZKFH7KTC8ebB/nn4LxBQRgijitLIULaayhjyrCg6TbGhRXSTKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZDzt0Mp0; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZDzt0Mp0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747675954; x=1779211954;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=uxW/Y44LlHu7A4hcYct8su/An7A98gxV72NAtsVDtHI=;
  b=ZDzt0Mp0cCUvG7oE6d0vLqPgb+RqTwXryg1nngDHInrtD6/pok2kgxNb
   CN1ew9SfF3Ib6ExYu+TfcVfkh7Xz5NLY1IFRv/tdJ70oW0FCtYmY7wPsJ
   71QOs0oEZzhSMBFiAoEwzfJnDTLqRZgDJuBO2pOSBgVe0dkTaSLP02aiP
   i98D82+qXJ+azBdbPhkA7Q2qz2idnYIu9UxTj+X53giCzErdXMBcF+yap
   fdA/fG8Jeo0/tpEe4j459cq/FytzqM06wAsJZZZJSZmHNol7Io1JdID1p
   pwXHJ9APIobT4hZNW10q6fGXkkPJ7lZLz02bfJVZ4se05kF7nfpfiW9Jq
   Q==;
X-CSE-ConnectionGUID: 78w5aZdLTkmw8n0lDGiwiQ==
X-CSE-MsgGUID: CaoZpYl7R3WG6GGUAhOlYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49739528"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="49739528"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 10:32:32 -0700
X-CSE-ConnectionGUID: eDKgWOTfS8qudHCpi506WQ==
X-CSE-MsgGUID: iJeyVBImTTC82hhFXVOT1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="176547197"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.35])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 10:32:28 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 19 May 2025 20:32:25 +0300 (EEST)
To: "Luck, Tony" <tony.luck@intel.com>
cc: Hans de Goede <hdegoede@redhat.com>, LKML <linux-kernel@vger.kernel.org>, 
    platform-driver-x86@vger.kernel.org, srinivas.pandruvada@linux.intel.com, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    xi.pardee@linux.intel.com, "David E. Box" <david.e.box@linux.intel.com>
Subject: Re: [PATCH 00/15] Intel VSEC/PMT: Introduce Discovery Driver
In-Reply-To: <aCtouJ7Lz80srgBa@agluck-desk3>
Message-ID: <9b0a215f-1a42-6e23-6b00-f6a8531f14cc@linux.intel.com>
References: <20250430212106.369208-1-david.e.box@linux.intel.com> <aCdaMel-zV8Qir69@agluck-desk3> <aCtouJ7Lz80srgBa@agluck-desk3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 19 May 2025, Luck, Tony wrote:
> On Fri, May 16, 2025 at 08:30:59AM -0700, Luck, Tony wrote:
> > On Wed, Apr 30, 2025 at 02:20:49PM -0700, David E. Box wrote:
> > > 4. Discovery Driver and API:  The core of the series is the addition of
> > > the PMT Discovery driver. This driver not only implements discovery of
> > > telemetry attributes and capability data (exposed via sysfs) but also
> > > introduces an API to retrieve telemetry regions by feature, which is
> > > essential for features like per-RMID telemetry counters.
> > 
> > This part of the series is the foundation for my telemetry/resctrl
> > patches:
> > 
> > https://lore.kernel.org/all/20250429003359.375508-1-tony.luck@intel.com/
> > 
> > That series includes a fake place holder for the discovery driver, but
> > I've been using David's patches for all my testing on real hardware.
> > 
> > Tested-by: Tony Luck <tony.luck@intel.com>
> 
> Ilpo, Hans,
> 
> Linus released -rc7 as the likely final rc before opening merge window
> next week.
> 
> Are David's patches in shape to be part of that merge? Or will I be
> using them out of tree for another cycle?

It's relatively large series so it isn't exactly a small task to go 
through it. I've been hoping to find enough time still to review it in 
this cycle and if nothing major comes up, it might make into this cycle.

-- 
 i.

