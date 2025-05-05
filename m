Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AB5140E30;
	Mon,  5 May 2025 05:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746423457; cv=none; b=FUn7iR7+Q3HUPLlE398qunw0wHycImy7iifwr+St+tQ/l7GaJAsEBEsT66Aqz9Ig05V1aJ7uVugHx4XtDl7yIQIn957Eg9LTiAYgYqgfKzPmXa/etHZPV+OqCPNZ+lLyAhLmLz181AdysmcXJEaM1eEY2jxZ8fmbWBJkwLQNIG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746423457; c=relaxed/simple;
	bh=Al4K5e1+agXGNWYOJPi3g9w45mWzI7ikU+sRe9IiBmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k0UN7xFfSDGqXvA5BhZGoDWE9fFTrwj0iaEM6dIPB5EVFS6Ct6R7R+YdqXJiqBqWwPYn/il3c3O+9ZjbfPJeD84WQklCzFBGOc0tw5QAco1sYuu/GS6roCKZLdb/t6glbA52cFXFNiR3/iKkllZtCYgSvqlJUCCh23o0zpwqDUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kkmxk/VM; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kkmxk/VM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746423455; x=1777959455;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Al4K5e1+agXGNWYOJPi3g9w45mWzI7ikU+sRe9IiBmI=;
  b=kkmxk/VMHJtpf38dk4pJNxQ/I+2XHK5GRLCt4gIR5mzFK1PLzYgaG/i3
   gI9Iug+E2jlr3hVeB7/d/aNYJPdMRaEzyn/GhAN4c/tU10q5cQEkFTH3b
   6ktklJL7FQc8hQw7gV6xByHXCQIKdlgzL9GQOs4QElG9n2zLS0gHNJxZ3
   DCZNowinm6Xlolf8USuvA9voHOBR4GkdKdoi2swn/vpu42ERo4RiBXAWo
   ep8C2aPfZKt7HyybmilQ/5QhVS3bksLpvs55iUTqOPsyDC5BewVQezxJu
   IVq6QM9rDW2UDfcUhfegbnMa+3VCq6GIGF+ZZIIm40YYCh+Sa2ZiVuSCe
   Q==;
X-CSE-ConnectionGUID: KzM7ahHJSyWLsSKRZ2v1eg==
X-CSE-MsgGUID: b8U67wK6T9aHi3mnO5+63g==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="65421745"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="65421745"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2025 22:37:34 -0700
X-CSE-ConnectionGUID: M37Hi0EtQcqLAmvDhbW58Q==
X-CSE-MsgGUID: 0mJ2wQ00TH+IUvpkpQ58eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="140306062"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 May 2025 22:37:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uBoW7-0005bd-2S;
	Mon, 05 May 2025 05:37:27 +0000
Date: Mon, 5 May 2025 13:36:28 +0800
From: kernel test robot <lkp@intel.com>
To: Magnus Lindholm <linmag7@gmail.com>, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, richard.henderson@linaro.org,
	mattst88@gmail.com, arnd@arndb.de, paulmck@kernel.org,
	glaubitz@physik.fu-berlin.de, macro@redhat.com, mcree@orcon.net.nz,
	ink@unseen.parts, Magnus Lindholm <linmag7@gmail.com>
Subject: Re: [PATCH v2] alpha: machine check handler for tsunami
Message-ID: <202505051339.kc4bhqlt-lkp@intel.com>
References: <20250423194958.30715-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423194958.30715-1-linmag7@gmail.com>

Hi Magnus,

kernel test robot noticed the following build errors:

[auto build test ERROR on mattst88-alpha/for-linus]
[also build test ERROR on linus/master v6.15-rc4 next-20250502]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Magnus-Lindholm/alpha-machine-check-handler-for-tsunami/20250424-035141
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha.git for-linus
patch link:    https://lore.kernel.org/r/20250423194958.30715-1-linmag7%40gmail.com
patch subject: [PATCH v2] alpha: machine check handler for tsunami
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20250505/202505051339.kc4bhqlt-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250505/202505051339.kc4bhqlt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505051339.kc4bhqlt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> alpha-linux-ld: arch/alpha/kernel/sys_eiger.o:(.init.data+0x118): undefined reference to `tsunami_machine_check'
   alpha-linux-ld: arch/alpha/kernel/sys_dp264.o: in function `clipper_init_pci':
>> (.init.text+0x394): undefined reference to `tsunami_register_error_handlers'
>> alpha-linux-ld: (.init.text+0x3a0): undefined reference to `tsunami_register_error_handlers'
>> alpha-linux-ld: arch/alpha/kernel/sys_dp264.o:(.init.data+0x118): undefined reference to `tsunami_machine_check'
   alpha-linux-ld: arch/alpha/kernel/sys_dp264.o:(.init.data+0x298): undefined reference to `tsunami_machine_check'
   alpha-linux-ld: arch/alpha/kernel/sys_dp264.o:(.init.data+0x418): undefined reference to `tsunami_machine_check'
   alpha-linux-ld: arch/alpha/kernel/sys_dp264.o:(.init.data+0x598): undefined reference to `tsunami_machine_check'
   alpha-linux-ld: arch/alpha/kernel/sys_dp264.o:(.init.data+0x718): undefined reference to `tsunami_machine_check'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
