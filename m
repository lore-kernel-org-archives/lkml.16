Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD7A2E8887;
	Tue, 24 Jun 2025 20:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750795870; cv=none; b=Sq1Q5tulqSHmDz/qxrL5lRjPiuX7MRBN/YeNyFGI/nsvXx+DFTUHL3e4QDWsDzm8aZA3s3pCwVj151WVtmFJCa1xZfYsI37+uUV9YF1OFGhR+inBBhWWR1OWF8HD+MEZc00aFoeJ3nsBcX2QSWThg81dTxL87uwyO2HnOOX5VT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750795870; c=relaxed/simple;
	bh=70D2k7yXcTK7Rw00Rm9AT2z6a5zBXSiSPPvQxfjP4C4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N0nJQFyjKg0IQhlD0jOAcEJxZasCNe8YJqNrj/7EPu+b9dxKQfzyMn/5D5vqRBNY8AeyxG97/w6QBrRdEz0Q9dKe76Spc4VsjAdaiMQTapxU3OeG8kCb/6pG2jcKwGoJiG+3J6crsTpOKu/f+ee+zf886s/ugehXlGeLhLFfd1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G/2JUWjp; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G/2JUWjp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750795869; x=1782331869;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=70D2k7yXcTK7Rw00Rm9AT2z6a5zBXSiSPPvQxfjP4C4=;
  b=G/2JUWjpyuvqCC20o1fRA2k9m8nMN/VMU4cgy//Au4OtA3WTk61FnwvP
   uLZOBPc2bwB/paT+rp3eGfbMWT/KSnTnWCdJuYdrh0FoZ1kwy8698shZj
   +poBSWu+IWiJPx7F4neVAOQ+VCYDCXtP90RFB4Uo882RXrTNl9vMsEe4B
   cYW8ZBYMKEcxeQGmFXRwwPVt1YResjNWN4itUKdw/gVXg/lTXomCO4OJG
   ksl9ABLxTtInJhTG2LDyoUYEDGtPmybp/QzqYflZyxcPgxKyDWBcOmsSX
   lU5dYCFYa9SZEMP1/j8/Ok6Ao1YzoxOvh49usXTLfuOfWsMIp3oC0qQwx
   g==;
X-CSE-ConnectionGUID: 8hJKb9G6QIeSGC7lxcTl4g==
X-CSE-MsgGUID: o8OBK6sATt+fGnfldt45lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="56857343"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="56857343"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 13:11:08 -0700
X-CSE-ConnectionGUID: RF5wQeHwT4a+G9nMkAqRbA==
X-CSE-MsgGUID: 8dj3LGN5SDKMp4a5EqqjDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="157781403"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Jun 2025 13:11:01 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uU9ys-000STa-32;
	Tue, 24 Jun 2025 20:10:58 +0000
Date: Wed, 25 Jun 2025 04:10:42 +0800
From: kernel test robot <lkp@intel.com>
To: tzuhao.wtmh@gmail.com, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
	Michal Simek <monstr@monstr.eu>, Fabio Estevam <festevam@gmail.com>,
	Henry Wu <Henry_Wu@quantatw.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	Leo Yang <leo.yang.sy0@gmail.com>,
	Ninad Palsule <ninad@linux.ibm.com>,
	Alex Vdovydchenko <xzeol@yahoo.com>,
	John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>,
	Nuno Sa <nuno.sa@analog.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Noah Wang <noahwang.wang@outlook.com>,
	Mariel Tinaco <Mariel.Tinaco@analog.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/2] hwmon: (pmbus) Add support for MPS multi-phase
 mp2869a/mp29612a controllers
Message-ID: <202506250448.jwRL4o9n-lkp@intel.com>
References: <20250624074156.291176-1-Henry_Wu@quantatw.tw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624074156.291176-1-Henry_Wu@quantatw.tw>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on robh/for-next krzk-dt/for-next linus/master v6.16-rc3 next-20250624]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/tzuhao-wtmh-gmail-com/dt-bindings-trivial-devices-Add-mp2869a-mp29612a-device-entry/20250624-154444
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20250624074156.291176-1-Henry_Wu%40quantatw.tw
patch subject: [PATCH 1/2] hwmon: (pmbus) Add support for MPS multi-phase mp2869a/mp29612a controllers
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250625/202506250448.jwRL4o9n-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250625/202506250448.jwRL4o9n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506250448.jwRL4o9n-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/module.h:22,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/acpi.h:14,
                    from include/linux/i2c.h:13,
                    from drivers/hwmon/pmbus/mp2869a.c:10:
>> drivers/hwmon/pmbus/mp2869a.c:299:18: error: expected ',' or ';' before 'PMBUS'
     299 | MODULE_IMPORT_NS(PMBUS);
         |                  ^~~~~
   include/linux/moduleparam.h:26:61: note: in definition of macro '__MODULE_INFO'
      26 |                 = __MODULE_INFO_PREFIX __stringify(tag) "=" info
         |                                                             ^~~~
   include/linux/module.h:301:33: note: in expansion of macro 'MODULE_INFO'
     301 | #define MODULE_IMPORT_NS(ns)    MODULE_INFO(import_ns, ns)
         |                                 ^~~~~~~~~~~
   drivers/hwmon/pmbus/mp2869a.c:299:1: note: in expansion of macro 'MODULE_IMPORT_NS'
     299 | MODULE_IMPORT_NS(PMBUS);
         | ^~~~~~~~~~~~~~~~


vim +299 drivers/hwmon/pmbus/mp2869a.c

   294	
   295	
   296	MODULE_AUTHOR("Henry Wu <Henry_WU@quantatw.com>");
   297	MODULE_DESCRIPTION("PMBus driver for MPS MP2869A/MP29612A device");
   298	MODULE_LICENSE("GPL");
 > 299	MODULE_IMPORT_NS(PMBUS);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
