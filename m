Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE55017C91;
	Tue,  1 Jul 2025 04:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751342436; cv=none; b=ToOkXmjcw1RpoKuC0DmLWnC8kybz+tSyk5VIljd4i/V6aHeQVmQRXLl0M3hZmq+QjHf2oY7XPpl3vEZjLgOoyt3NjB7ao+j0+iK3u0y1BbovWIsHS8VEse05oQuH/KQgWC1LgGLL7vRDmtNXPQf9JY83dDHTZaevfC3X6/AEc6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751342436; c=relaxed/simple;
	bh=ZXOGPn1tYEEzAPUU3BWPEZ5qUnP7Mw93nwidwTHo2+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TX/n27j23b7btHBbJZmJ1rRK7i/IU4tAaAWsCMTJ43C0DGV8lCckYxWRi75eujJBusl9xnp4nEfOigQ2l4Z6QOqblnJCQWBf5l6FtFRxeCVV7ACrgxWnNgqBxsEK5QvwAIm7r9wM+r8uCRPcXtGPdYK3RVaipLMrnvgahohGD4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KvzQDbb7; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KvzQDbb7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751342434; x=1782878434;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZXOGPn1tYEEzAPUU3BWPEZ5qUnP7Mw93nwidwTHo2+c=;
  b=KvzQDbb7TD4vC72hUR9Ajt9mMfbwX5Nz4O+ilVnx7r0zOxtDEmJzbfSp
   c/cDqvfdvBTqt76Tm+UZH7PPu1q8bWC9Ua1R3kO1jqZ99fw1uXVhrVKJJ
   LJ2G3sDK3NvLRUanob7HVJHYAHRVZ59Ez7N5EQHp/IQtEpySPejC7qjjr
   pUXCJINOTI6nHOV4qnsdlndLqb+wpXUzvUGm7z0SWvJXlfXeohXkOVMIs
   3RDMzuaXZlaMZXqZBxvQ1H622ckVqS7edM11cksE/iB7ggaNZZ3j6kNlu
   0ajQsCJPShWEDMpWdD9o9+RK0WvT+f+6ddckKXYsomiL82qs610LP4ewO
   g==;
X-CSE-ConnectionGUID: bzwq2TAPTgOYpFaNlyz7Rw==
X-CSE-MsgGUID: ZMTR7SWXTMOX0gJREoalPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="79027269"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="79027269"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 21:00:33 -0700
X-CSE-ConnectionGUID: /khQEmeRSLuaqQT9YKyfrw==
X-CSE-MsgGUID: fozRp0UjRJKMM3SsZJMlmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="154132676"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 Jun 2025 21:00:30 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWSAV-000Zhi-1c;
	Tue, 01 Jul 2025 04:00:27 +0000
Date: Tue, 1 Jul 2025 11:59:29 +0800
From: kernel test robot <lkp@intel.com>
To: Andrei Kuchynski <akuchynski@chromium.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: oe-kbuild-all@lists.linux.dev, Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	"Christian A. Ehrhardt" <lk@c--e.de>, linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: Re: [PATCH v2 05/10] usb: typec: Implement automated mode selection
Message-ID: <202507011101.LAOe7nS8-lkp@intel.com>
References: <20250630141239.3174390-6-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630141239.3174390-6-akuchynski@chromium.org>

Hi Andrei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-linus]
[also build test WARNING on chrome-platform/for-next chrome-platform/for-firmware-next linus/master v6.16-rc4 next-20250630]
[cannot apply to usb/usb-testing usb/usb-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrei-Kuchynski/usb-typec-Add-alt_mode_override-field-to-port-property/20250630-221822
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
patch link:    https://lore.kernel.org/r/20250630141239.3174390-6-akuchynski%40chromium.org
patch subject: [PATCH v2 05/10] usb: typec: Implement automated mode selection
config: arm-randconfig-r072-20250701 (https://download.01.org/0day-ci/archive/20250701/202507011101.LAOe7nS8-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507011101.LAOe7nS8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507011101.LAOe7nS8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/usb/typec/mode_selection.c:166 function parameter 'partner' not described in 'mode_selection_next'
   Warning: drivers/usb/typec/mode_selection.c:166 function parameter 'ms' not described in 'mode_selection_next'
   Warning: drivers/usb/typec/mode_selection.c:294 function parameter 'work' not described in 'mode_selection_work'
   Warning: drivers/usb/typec/mode_selection.c:419 function parameter 'partner' not described in 'typec_mode_selection_start'
>> Warning: drivers/usb/typec/mode_selection.c:464 function parameter 'partner' not described in 'typec_mode_selection_reset'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
