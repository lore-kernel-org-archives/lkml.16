Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEF0206F27;
	Wed, 25 Jun 2025 20:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750882953; cv=none; b=UFqa4qh96Of6E5IfYZy5lzIrUXXJVuXqSzfrB7bQdtAa9B2M2pn581xSNWlynyDkM02B25KsACbTPLBQPStev8++LvbORCM4QIw6sskOZgbD6udVZ5Q7hqGbsdROKxx+sYS+WWg0OV0G9Egg/Ubd0UHwaYv+IzGu0Kt3uVpn0d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750882953; c=relaxed/simple;
	bh=sy0slLvzdoe6gzQQMYjOFUEpJzTSYUsDzXH/WoAaZIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mlwJAKcB8YdchJEyHD/gwb3sB3DEESnFRCM88tL9tjwDFBaephRGStDCPC3b3IxnzLvLNSqSNdzszzRBbWF/6um52znHFEnVC2Qj9nSI0uKMW5GRP17jcbs+9iY/oxJ6s0jBxpJp5NU4PPbV+LrvcY1u2hMBm2iB+D4ajwU3JpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lT7Vs73h; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lT7Vs73h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750882952; x=1782418952;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sy0slLvzdoe6gzQQMYjOFUEpJzTSYUsDzXH/WoAaZIY=;
  b=lT7Vs73hrSOfP3rpfE+qerU9eBKuXx5vTrewCDnQV6b4zqGg/27Zb6Ax
   7Fpqjl/YGNyTDwI5UsEXfULpK/VjVOHDgIbPpmcM/KpoVlBI52bIT5+EF
   cWqnsk1ItJW74ird4U0NkumxKUnNSXf4GysHWqbaoP+X58S1ltkNnqcel
   7C5BUfV0nLaxhJNUdlffW1/2vbjonDxwD8rxM5lyuvNpORNu0z5Xj4BPF
   697t1IDLLPkgTqtr4gy8numH0wfUbo+XQT9FxUXGrB6NYk7YcMGM17Loq
   HIdlgQuoUHeshsVJrNwZSPDpTKc7upv1GKObN86MWYCxxDJzNjiKAHblX
   A==;
X-CSE-ConnectionGUID: kPCRr78fR/ydUkB2e7skiQ==
X-CSE-MsgGUID: XQn5BjbcQPCxDPdVeGWJTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53134169"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="53134169"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 13:22:32 -0700
X-CSE-ConnectionGUID: RGmiQDO6Qe2PrZaJhYOvmA==
X-CSE-MsgGUID: zx35dHvJQIq4LHUQHO63aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="158079221"
Received: from agluck-desk3.sc.intel.com (HELO agluck-desk3) ([172.25.103.51])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 13:22:31 -0700
Date: Wed, 25 Jun 2025 13:22:29 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: "David E. Box" <david.e.box@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	andriy.shevchenko@linux.intel.com, ilpo.jarvinen@linux.intel.com,
	xi.pardee@linux.intel.com, hdegoede@redhat.com
Subject: Re: [PATCH V2 00/15] Intel VSEC/PMT: Introduce Discovery Driver
Message-ID: <aFxahfwnntrMFumI@agluck-desk3>
References: <20250617014041.2861032-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617014041.2861032-1-david.e.box@linux.intel.com>

On Mon, Jun 16, 2025 at 06:40:24PM -0700, David E. Box wrote:
> This patch series introduces a new discovery driver for Intel Platform
> Monitoring Technology (PMT) and a set of supporting changes to improve
> telemetry integration across Intel VSEC features.

Caution. Part 14 has this "Subject:"

   [PATCH V2] platform/x86/intel/pmt/telemetry: Add API to retrieve telemetry regions by feature

which is missing the "14/15" "b4 am" does warn:

	ERROR: missing [14/15]!

But my eyes skipped over that, and then I got surprised that the
DISCOVERY driver was missing from my kernel.

With part 14 manually applied things seem good.

-Tony
