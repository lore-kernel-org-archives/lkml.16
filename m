Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21302DECB4
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 12:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749816761; cv=none; b=a3HyP0QgcIAJen1jmN28YPqnZcnDUpCqv6o7SpThQUhjt8ehvui0YpQtamOUs7l3iVNfrcT/3NYgN7xdZwz8G4fEdl8IFzxztrj7FOYnIeR4a/wwFJ4ztoTJf++hmg55Cut0nGQnV8dwZNXsSt1uNS+umilBpwj5epP6KcBjVJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749816761; c=relaxed/simple;
	bh=4knsc7FbAH7Q5O0jXH0nJt0AVmU/rcq+p8uTWlA4IDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qjXc2PT0vapp+JkXTNC5+SBNXKm5GPs/aA6+5JT8UqUFsFTpZ9IStP5sAUV3uScSGTrhv8rBlOZp1/pakuGj3reIjg1dSfTXyzYFgyw4u+4isjWa3rHGhKYo8YLURM9pJffuXoW9yHimkZoNjYoh31YCuv6ClOk//KmCmW/LY1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HMZMN8Xg; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HMZMN8Xg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749816758; x=1781352758;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4knsc7FbAH7Q5O0jXH0nJt0AVmU/rcq+p8uTWlA4IDk=;
  b=HMZMN8Xg0lpfUPQjlTCXhnKyEPJyxTaLnQk0OFYoYssekh0/Y3N3HoKw
   oMf6W2IZFu6BG4jbpyniyjsvIcU6pifgyPYSGF4GR4B09Pb1cyNYj/W+n
   yVfvvj0QvfUWQLjpnHlrkBWiKgSpVDhgTg8e9k/uIWLv31glV0ECcMq2i
   m1jFM0W7w6hn835NGc02QRjglECyO453nvTQdhIp131uJnkLbrTQgpoNV
   0lLJ9Jg0dvwT+ahbSBhbvcZ0D/rmdp2gPfGHmN6m9eZ+nNDODNKzFqEbf
   Xk8QEkGzmycTzvv60IOLwYANctxK7cgr+PjQjWupAlMQZuZUrwDcKLy/U
   A==;
X-CSE-ConnectionGUID: DCj6H23yS06w2ZxoC4KeEQ==
X-CSE-MsgGUID: FBIGlRxyT/ip1Ln7LKq3YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="63383151"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="63383151"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 05:12:32 -0700
X-CSE-ConnectionGUID: zPaqIg7gTWW8AEgSuaJUUw==
X-CSE-MsgGUID: 1qLkft/DSV+tezTu08XGoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="148184525"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Jun 2025 05:12:31 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQ3Gm-000CZq-2q;
	Fri, 13 Jun 2025 12:12:28 +0000
Date: Fri, 13 Jun 2025 20:11:50 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Gorlas <michal.gorlas@9elements.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, marcello.bauer@9elements.com,
	Michal Gorlas <michal.gorlas@9elements.com>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] firmware: coreboot: Linux-owned SMI handler to be
 loaded by coreboot
Message-ID: <202506132239.FTTwSHeX-lkp@intel.com>
References: <410d4d62b031d0e751e1933cf746540d5cb1682c.1749734094.git.michal.gorlas@9elements.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <410d4d62b031d0e751e1933cf746540d5cb1682c.1749734094.git.michal.gorlas@9elements.com>

Hi Michal,

kernel test robot noticed the following build errors:

[auto build test ERROR on chrome-platform/for-next]
[also build test ERROR on chrome-platform/for-firmware-next linus/master v6.16-rc1 next-20250613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Michal-Gorlas/firmware-coreboot-support-for-parsing-SMM-related-informations-from-coreboot-tables/20250612-221612
base:   https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next
patch link:    https://lore.kernel.org/r/410d4d62b031d0e751e1933cf746540d5cb1682c.1749734094.git.michal.gorlas%409elements.com
patch subject: [PATCH v1 3/3] firmware: coreboot: Linux-owned SMI handler to be loaded by coreboot
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250613/202506132239.FTTwSHeX-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250613/202506132239.FTTwSHeX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506132239.FTTwSHeX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/google/mm_handler/mm_header.S:7:10: fatal error: asm/page_types.h: No such file or directory
       7 | #include <asm/page_types.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.
--
>> drivers/firmware/google/mm_handler/mm_handler.S:11:10: fatal error: asm/pgtable_types.h: No such file or directory
      11 | #include <asm/pgtable_types.h>
         |          ^~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +7 drivers/firmware/google/mm_handler/mm_header.S

   > 7	#include <asm/page_types.h>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
