Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB40014B965
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 07:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746429592; cv=none; b=mqtDAVxKsnXSj6RfLF/OGglNX0kPVMGrulwNUeOG70yVm1tMUjVHB33KGwygYlu7ioAQtyeTpGDaXVllPn1P2QPZhLdDnTDT2+Lx79oO1b82aNRDZxBnLs4vmRtQUVEVp97yyTft/GiPPzRfRwqsu6kCtwLYqzoXm39byIIlvWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746429592; c=relaxed/simple;
	bh=GCVcV9cmXnhnwDKYMrvd8V8TZ/YtoG0CcBg/cQyXd9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E8UsclAdibOkHn0C7a2fRDA6RwPzj8iWvr8PX8AjL47oG9Lk22O73OVxeB1EN61l4mMMZB/S7TYZTxNQCstvpghrn8a/EHythFZBzhE1M0Y4QEvUxFqRvtG9HXz5igPcqVgJAf0WNMK6TnqmQf1VAJp/vAYjWArfTRYG/1grjCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dA4hCuh7; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dA4hCuh7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746429591; x=1777965591;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GCVcV9cmXnhnwDKYMrvd8V8TZ/YtoG0CcBg/cQyXd9Y=;
  b=dA4hCuh75jYUSTYQXzM8z2Wa9Zwzwy2xAEw1pyxibMyxhXPw++dox2ML
   uX9UXFH69WPAuI4QficWPdgQ0gxCG04lo6CrCK/x7l5S4OIw9gk6ot7tK
   vB+CJXzvSWISeF7skFrboZWqqPk2mWmNatyrbAhfgngoxggC4Mm+g62xJ
   t2oNsrUApM7MIpXOn+EYsLY+cRqNi2Z9Ri7blUK/ESlrSV/kUqo3Xfqzl
   bMqlY4AfxvAhkjkeilkb2sSvnNGGaSLozcpu+GuJTbex53QByQuxmdA9L
   lCdADgTPUbiAfvrQRBUOhZJd4qmwCSkB26ov/ZgkgbbbjW2arOav7XlEA
   g==;
X-CSE-ConnectionGUID: Fuj6ihthQYS/CEvKY5zalg==
X-CSE-MsgGUID: qeTEGpWCQZ2Na6cicAfi6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="48161239"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="48161239"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 00:19:50 -0700
X-CSE-ConnectionGUID: 7zEKmKkYS8KpOTVJn+V6Qg==
X-CSE-MsgGUID: L7lH3OlWS5Kg5hEahriibg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="140164637"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 May 2025 00:19:48 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uBq77-0005cj-2l;
	Mon, 05 May 2025 07:19:45 +0000
Date: Mon, 5 May 2025 15:19:37 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>, linux-kernel@vger.kernel.org,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Gabriele Monaco <gmonaco@redhat.com>
Subject: Re: [PATCH v3 3/3] timers: Exclude isolated cpus from timer migation
Message-ID: <202505051319.949TVTy3-lkp@intel.com>
References: <20250428125417.102741-8-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428125417.102741-8-gmonaco@redhat.com>

Hi Gabriele,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b4432656b36e5cc1d50a1f2dc15357543add530e]

url:    https://github.com/intel-lab-lkp/linux/commits/Gabriele-Monaco/timers-Rename-tmigr-online-bit-to-available/20250428-221704
base:   b4432656b36e5cc1d50a1f2dc15357543add530e
patch link:    https://lore.kernel.org/r/20250428125417.102741-8-gmonaco%40redhat.com
patch subject: [PATCH v3 3/3] timers: Exclude isolated cpus from timer migation
config: x86_64-randconfig-074-20250503 (https://download.01.org/0day-ci/archive/20250505/202505051319.949TVTy3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250505/202505051319.949TVTy3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505051319.949TVTy3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/time/timer.c:2171: warning: Function parameter or struct member 'cpu' not described in 'timer_base_remote_is_idle'


vim +2171 kernel/time/timer.c

  2164	
  2165	/**
  2166	 * timer_base_remote_is_idle() - Return whether timer base is set idle for cpu
  2167	 *
  2168	 * Returns value of local timer base is_idle value for remote cpu.
  2169	 */
  2170	bool timer_base_remote_is_idle(unsigned int cpu)
> 2171	{
  2172		return per_cpu(timer_bases[BASE_LOCAL].is_idle, cpu);
  2173	}
  2174	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
