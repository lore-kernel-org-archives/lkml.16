Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B77279900;
	Thu,  8 May 2025 15:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746719002; cv=none; b=q8ms+EbJhpDAr48qx8+dG+kiQIaKYvtnVT9i/4nU3n1X3esqFuFkA4IgWmRKQWZL8n5k0FvueetqvcMSx9CfhrBlN5FfhkDz36s4Ct+yrJi/ld3BuUKh547CCxZwWE1ylEV0MXp3VHB/OOZZLfU1AtF7BFgAzJmlwliZZvvU/W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746719002; c=relaxed/simple;
	bh=7s/lCc95cwjSyVrILrpuwT3kDvb8Ll0Dx+xVCXz6qoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ayomCW2b+e/SZFyqQTLFomNa479PXNZ5bXBJEXlU3dBWCUDfwez8JJdgA5LYoSpj30JNBDrXqpo6f6rEOa5jC9Wkjv3k1rhr06fCq9Hkm5ySOF8Lswt8veWthj82YrTdRubEqfFogKAuYp+FKCqRouRBlp1czTZ/kg7POzj1diU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lAS+hsSb; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lAS+hsSb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746719000; x=1778255000;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7s/lCc95cwjSyVrILrpuwT3kDvb8Ll0Dx+xVCXz6qoE=;
  b=lAS+hsSb4r+0wbG5MtyDgvp3vglT6eIk+whlqFbe66fyqiWeprByOA/2
   zg8tZltej1Vzs/v/fpL8c9IPkh7Jhxl1Zv0RvnYGsOHBRPOFsCgyV79YJ
   agHMx4Uy6j5CMzIdw/IQZzllZlo74079h48idi6Jq7GeaxuEMoyXK3wh1
   HnX/qyr37Kr/VOv8q+huO++4/4i7zZlyzKn8scrqy/ZkR5PlAYb+lg/wz
   Tqh9iXoS8DW3FhDUN2xvqhFNzSxLdyeFW+xtThhmqx231Du6bifkqgpNp
   bsx7YJMeoC1nmNII2Yks/7SxpdMKNkLs0VPnTCopYo8nQo0uvnd1jPkDt
   Q==;
X-CSE-ConnectionGUID: ZowUfHi9QSiSh0bBuMhRcA==
X-CSE-MsgGUID: airJDLwrRzOv4IHfqm59lQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48675962"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="48675962"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 08:43:17 -0700
X-CSE-ConnectionGUID: aCRjluoISEKIYweJGTQg9A==
X-CSE-MsgGUID: alOZR5A+Sjua+lG2Oud9qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="136262749"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 May 2025 08:43:14 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD3Oy-000B7F-2C;
	Thu, 08 May 2025 15:43:12 +0000
Date: Thu, 8 May 2025 23:42:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: timer: Convert marvell,armada-370-timer to
 DT schema
Message-ID: <202505082358.dnIeqrs0-lkp@intel.com>
References: <20250506022301.2588282-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506022301.2588282-1-robh@kernel.org>

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/timers/core]
[also build test WARNING on linus/master v6.15-rc5 next-20250508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/dt-bindings-timer-Convert-marvell-armada-370-timer-to-DT-schema/20250506-144131
base:   tip/timers/core
patch link:    https://lore.kernel.org/r/20250506022301.2588282-1-robh%40kernel.org
patch subject: [PATCH] dt-bindings: timer: Convert marvell,armada-370-timer to DT schema
reproduce: (https://download.01.org/0day-ci/archive/20250508/202505082358.dnIeqrs0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505082358.dnIeqrs0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
>> Warning: drivers/clocksource/timer-armada-370-xp.c references a file that doesn't exist: Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt
   Can't build as 1 mandatory dependency is missing at ./scripts/sphinx-pre-install line 984.
   make[2]: *** [Documentation/Makefile:121: htmldocs] Error 255
   make[1]: *** [Makefile:1801: htmldocs] Error 2
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'htmldocs' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
