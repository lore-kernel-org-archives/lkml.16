Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2601270EB8;
	Tue, 29 Apr 2025 13:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745933387; cv=none; b=HXgWnqkhZM967mWXX22bT4yg08DiVtKROsLy1yiFZxFdZJGNaIbiO0U2W56tHApynU6xr6znYJKJF+jtLMIc1wMlk96PmDOFpFna997JvYfJhijd7EeLGDvljm/NtyrMRQvqJZqRZ6Hcssgokz3c1Lp6mjQfJeAM8fVz0ZbLM3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745933387; c=relaxed/simple;
	bh=Whwr+9l41YP9STYkQ/1ThI+dnOqAHdVf9Mdd37OTqX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=usTeb8zF1eYF3WctuAPgYxu3L6ESWXVjj+eEeoPqhzSieSpaRF+KwO38kiwF41Kp8Yf2ElVFqezALHTPOVOI1aoe2JWtCXUuKrexedLTKqP1AFJIAhCd4Hmr9aIqBiU2WbVs/FvS1kd8C9uW0T9dk3H2259cA5q736567OSZjQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Puib2IAs; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Puib2IAs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745933386; x=1777469386;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Whwr+9l41YP9STYkQ/1ThI+dnOqAHdVf9Mdd37OTqX0=;
  b=Puib2IAsekkIOc3pOqXOGPjPtchNqdRSRLdOFJb8UNfepmt3GT6z927u
   7HzymygwOr2n40b5EyieUF75h9FlXdkrpBkJHlLdxNQxQtwkdlCh9SaGM
   59rDtbGTdmBNEIAhNg5PcYF9RwBMN2ZSz4dGHjhpGQ1UI+cAPz5wyRcrE
   b9Ahc8vg0VjRXhgs80qbm6jd6JlFfXO1z46h66rjqx3Z7tszApvht68Qu
   QH6Kvdg4UnnAgunHjuceaUctXhGLxjBsXTRbq+pKSXFBDZqXesurhYWe6
   QmJBoogbm4LJ0UrUfWfKKLdudOWu6F1jyaxd/u1pBYY0rL3iLbQPe4i8Y
   Q==;
X-CSE-ConnectionGUID: 5D2hWhKdTnCGVAj7Mh8JWQ==
X-CSE-MsgGUID: 1Grr92+XT9qwpunxRJstCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="51376310"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="51376310"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 06:29:45 -0700
X-CSE-ConnectionGUID: cmBLZoefS7Cieu8WlhaxWg==
X-CSE-MsgGUID: /eu5IBmfRHSlYrIGiT80og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="133775633"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Apr 2025 06:29:41 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9l1n-0000jn-0k;
	Tue, 29 Apr 2025 13:29:39 +0000
Date: Tue, 29 Apr 2025 21:28:54 +0800
From: kernel test robot <lkp@intel.com>
To: Pawel Dembicki <paweldembicki@gmail.com>, linux-hwmon@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Pawel Dembicki <paweldembicki@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Greg KH <greg@kroah.com>,
	Shen Lichuan <shenlichuan@vivo.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Charles Hsu <ythsu0511@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 5/5] dt-bindings: hwmon: Add bindings for mpq8785 driver
Message-ID: <202504291853.nDOvzGEJ-lkp@intel.com>
References: <20250428221420.2077697-6-paweldembicki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428221420.2077697-6-paweldembicki@gmail.com>

Hi Pawel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v6.15-rc4 next-20250428]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pawel-Dembicki/hwmon-pmbus-mpq8785-Prepare-driver-for-multiple-device-support/20250429-061658
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20250428221420.2077697-6-paweldembicki%40gmail.com
patch subject: [PATCH 5/5] dt-bindings: hwmon: Add bindings for mpq8785 driver
config: csky-randconfig-052-20250429 (https://download.01.org/0day-ci/archive/20250429/202504291853.nDOvzGEJ-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 11.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504291853.nDOvzGEJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504291853.nDOvzGEJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Duplicate compatible "mps,mpq8785" found in schemas matching "$id":
   	http://devicetree.org/schemas/trivial-devices.yaml#
   	http://devicetree.org/schemas/hwmon/pmbus/mps,mpq8785.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
