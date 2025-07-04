Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F374315F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 02:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751595776; cv=none; b=tA1Z/ngRUtBL9UmwKbC+c2gMzqOCUAciedKrqxXqWaIJ5sMWEkqcAjbk+ZlK2+7K1k7p9SAbkEaAxVNHajEMjYRLo7KJXAkPZxI88aLWbY3526j+wpIhyBXyug5njwB9RCREf/cMlPNcRS5s+/QX9ZKXyZ27dysNokIeRens9s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751595776; c=relaxed/simple;
	bh=Heuj4A3C9IpnhfL/sGEreqQAnEu9NfzBteqR00oA0BY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FlPCaR73+elWk96ezyt4uqIWDNuyGruOoLY3sqKiVBhVXfybwTiKPe++1MUEdfgunFyzDKNnLhoY1/YNpOoR0FZAUc4spaKrw7O7e3STJmm2oRewpXzPUKRO/siIap/f1Xv9P9JmZR5BtC9zmISTkl6eveQAw17Rlf72zKdha7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fhEpkCa1; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fhEpkCa1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751595775; x=1783131775;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Heuj4A3C9IpnhfL/sGEreqQAnEu9NfzBteqR00oA0BY=;
  b=fhEpkCa1WD4cOnEQYxiN49lBVYD5h+YdN93f8nKVzHD2OFOMyUV6Ry80
   aTW7W3rX1miDnHMKH5HznR2GKWtrZFHH/0veyDA3kc0955000/lKhHghZ
   kGBDhRfytv+m96abzmMeJxpgC5YPd3nfHVhldGqdRRzVQIqTteaOFajk6
   qS4sTy9kIaoNehf+d/8f8tYGS3tZs/R+Q92sC2S4STOISTKidZcBNHUwT
   O1l3QhA7Fy9ChaQdpczocCw/BbbYBCD+03AM/BnCJEGTgzMyqLHVuSGl9
   2hUeCA9qbCxQMZ51eJJVYQe4iGXNaDgO/gJ77V+8Yhsz5g6R3wmFEooMB
   g==;
X-CSE-ConnectionGUID: AW0GO3b/RQWFeLjmWej+/w==
X-CSE-MsgGUID: 5hehGhvBRQ2PqFB7pZgRvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="54047707"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="54047707"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 19:22:55 -0700
X-CSE-ConnectionGUID: CaCjBhAARrmmXq04FuFiuQ==
X-CSE-MsgGUID: n9d6ikfgRrqsaNx2N9fcpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="154610043"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Jul 2025 19:22:52 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXW4f-0003Dn-2P;
	Fri, 04 Jul 2025 02:22:49 +0000
Date: Fri, 4 Jul 2025 10:22:09 +0800
From: kernel test robot <lkp@intel.com>
To: ChenMiao <chenmiao.ku@gmail.com>,
	Linux RISCV <linux-riscv@lists.infradead.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, chenmiao <chenmiao.ku@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: ftrace: Fix the logic issue in DYNAMIC_FTRACE
 selection
Message-ID: <202507041001.7eWJmB1g-lkp@intel.com>
References: <20250703084818.394491-1-chenmiao.ku@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703084818.394491-1-chenmiao.ku@gmail.com>

Hi ChenMiao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.16-rc4 next-20250703]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/ChenMiao/riscv-ftrace-Fix-the-logic-issue-in-DYNAMIC_FTRACE-selection/20250703-165308
base:   linus/master
patch link:    https://lore.kernel.org/r/20250703084818.394491-1-chenmiao.ku%40gmail.com
patch subject: [PATCH] riscv: ftrace: Fix the logic issue in DYNAMIC_FTRACE selection
config: riscv-kismet-CONFIG_DYNAMIC_FTRACE-CONFIG_RISCV-0-0 (https://download.01.org/0day-ci/archive/20250704/202507041001.7eWJmB1g-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250704/202507041001.7eWJmB1g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507041001.7eWJmB1g-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DYNAMIC_FTRACE when selected by RISCV
   

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
