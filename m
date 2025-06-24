Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAF21DB148;
	Tue, 24 Jun 2025 03:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750737451; cv=none; b=s0YLls09KAElZ/XGTDu9yr6HvJombuU7hjiYv8xt1gtKYkEsTUt9UUygrG/bR5K6zyhkDvOWeH2aCReRDsJzIra7pTpem6hrzqn/1aAQb09lSwaamdiXsd5NgIfJX4xpfuVcqbL46YpQbJxNqeXoO8vy2JFm01nQ18/1nJhe2GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750737451; c=relaxed/simple;
	bh=eDRLwb46ZJNkUBRm5BBOB9MU9TVVS4hMshWk6nSG+fM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HPcCPe7C8MdjLiZeNBQip2/CU2GYO34o2Lx1Cr6bRRwxuIxnJmFmC+kJ6T1acjDOAdr7OdghvTLcbmrjZPd23Pr4HaPgKaaK95S2d5nN4v+rCtciWYxaRMOBRxhKwqTplyab9QcCMytmhsYWdn84Raeyt6WZKiS2nwTAeCnfnUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GjXHGbQQ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GjXHGbQQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750737450; x=1782273450;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eDRLwb46ZJNkUBRm5BBOB9MU9TVVS4hMshWk6nSG+fM=;
  b=GjXHGbQQwuPptryXi6ORwaah2nJa6MgSOQej3MFnBsnPOOuhALfbOl5o
   xJ9EYwYq+rioF3FlyfHNkdbNb5QlWfaZYV8/xKb0G16dRBFXc/BbL2RGA
   f6o5UD4a8kyxufBXxHnMyHQM2+0SS/z/r0quGTQmL50wlJbrQCgmZHR3W
   zBabLTE0FbPtWvosujaCRLjo1DBCdKWKnQ7OMBQtnQxvy4NKE1Z1Sexqv
   2E9ZGFCSPrrG9rbtm6r3CeIMoJysviy8QowRFcIG0jOJ5i4fZ/uN6FTAD
   NXsgjhizl64gKExlOYiJM9UjMrmuNC8oJdsvWRc0qzPNFmHNHK2S8zRBN
   A==;
X-CSE-ConnectionGUID: lkuGDu2ESEicfOWL9y5Y5w==
X-CSE-MsgGUID: HoDDye/nR/CyR/1C2yTKIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52899989"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="52899989"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 20:57:25 -0700
X-CSE-ConnectionGUID: hTpeXAEMS8WjON5jEVhW+g==
X-CSE-MsgGUID: 6lr16b0fSsKfY8hjpPXPag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="157282861"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 Jun 2025 20:57:22 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTume-000RhN-2P;
	Tue, 24 Jun 2025 03:57:20 +0000
Date: Tue, 24 Jun 2025 11:56:58 +0800
From: kernel test robot <lkp@intel.com>
To: GalaxySnail <me@glxys.nl>, linux-sound@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	GalaxySnail <me@glxys.nl>
Subject: Re: [PATCH] ALSA: hda: add MODULE_FIRMWARE for cs35l41/cs35l56
Message-ID: <202506241158.kxrazQoo-lkp@intel.com>
References: <20250623140030.1539477-2-me@glxys.nl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623140030.1539477-2-me@glxys.nl>

Hi GalaxySnail,

kernel test robot noticed the following build errors:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on tiwai-sound/for-linus linus/master v6.16-rc3 next-20250623]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/GalaxySnail/ALSA-hda-add-MODULE_FIRMWARE-for-cs35l41-cs35l56/20250623-220657
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20250623140030.1539477-2-me%40glxys.nl
patch subject: [PATCH] ALSA: hda: add MODULE_FIRMWARE for cs35l41/cs35l56
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20250624/202506241158.kxrazQoo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506241158.kxrazQoo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506241158.kxrazQoo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/module.h:22,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/acpi.h:14,
                    from sound/pci/hda/cs35l41_hda.c:9:
>> include/linux/moduleparam.h:24:9: error: expected ',' or ';' before 'static'
      24 |         static const char __UNIQUE_ID(name)[]                             \
         |         ^~~~~~
   include/linux/module.h:168:32: note: in expansion of macro '__MODULE_INFO'
     168 | #define MODULE_INFO(tag, info) __MODULE_INFO(tag, tag, info)
         |                                ^~~~~~~~~~~~~
   include/linux/module.h:299:36: note: in expansion of macro 'MODULE_INFO'
     299 | #define MODULE_FIRMWARE(_firmware) MODULE_INFO(firmware, _firmware)
         |                                    ^~~~~~~~~~~
   sound/pci/hda/cs35l41_hda.c:2116:1: note: in expansion of macro 'MODULE_FIRMWARE'
    2116 | MODULE_FIRMWARE("cirrus/cs35l41-*.bin")
         | ^~~~~~~~~~~~~~~
--
   In file included from include/linux/module.h:22,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/acpi.h:14,
                    from sound/pci/hda/cs35l56_hda.c:9:
>> include/linux/moduleparam.h:24:9: error: expected ',' or ';' before 'static'
      24 |         static const char __UNIQUE_ID(name)[]                             \
         |         ^~~~~~
   include/linux/module.h:168:32: note: in expansion of macro '__MODULE_INFO'
     168 | #define MODULE_INFO(tag, info) __MODULE_INFO(tag, tag, info)
         |                                ^~~~~~~~~~~~~
   include/linux/module.h:299:36: note: in expansion of macro 'MODULE_INFO'
     299 | #define MODULE_FIRMWARE(_firmware) MODULE_INFO(firmware, _firmware)
         |                                    ^~~~~~~~~~~
   sound/pci/hda/cs35l56_hda.c:1126:1: note: in expansion of macro 'MODULE_FIRMWARE'
    1126 | MODULE_FIRMWARE("cirrus/cs35l54-*.bin")
         | ^~~~~~~~~~~~~~~
--
   In file included from include/linux/module.h:22,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/acpi.h:14,
                    from cs35l41_hda.c:9:
>> include/linux/moduleparam.h:24:9: error: expected ',' or ';' before 'static'
      24 |         static const char __UNIQUE_ID(name)[]                             \
         |         ^~~~~~
   include/linux/module.h:168:32: note: in expansion of macro '__MODULE_INFO'
     168 | #define MODULE_INFO(tag, info) __MODULE_INFO(tag, tag, info)
         |                                ^~~~~~~~~~~~~
   include/linux/module.h:299:36: note: in expansion of macro 'MODULE_INFO'
     299 | #define MODULE_FIRMWARE(_firmware) MODULE_INFO(firmware, _firmware)
         |                                    ^~~~~~~~~~~
   cs35l41_hda.c:2116:1: note: in expansion of macro 'MODULE_FIRMWARE'
    2116 | MODULE_FIRMWARE("cirrus/cs35l41-*.bin")
         | ^~~~~~~~~~~~~~~
--
   In file included from include/linux/module.h:22,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/acpi.h:14,
                    from cs35l56_hda.c:9:
>> include/linux/moduleparam.h:24:9: error: expected ',' or ';' before 'static'
      24 |         static const char __UNIQUE_ID(name)[]                             \
         |         ^~~~~~
   include/linux/module.h:168:32: note: in expansion of macro '__MODULE_INFO'
     168 | #define MODULE_INFO(tag, info) __MODULE_INFO(tag, tag, info)
         |                                ^~~~~~~~~~~~~
   include/linux/module.h:299:36: note: in expansion of macro 'MODULE_INFO'
     299 | #define MODULE_FIRMWARE(_firmware) MODULE_INFO(firmware, _firmware)
         |                                    ^~~~~~~~~~~
   cs35l56_hda.c:1126:1: note: in expansion of macro 'MODULE_FIRMWARE'
    1126 | MODULE_FIRMWARE("cirrus/cs35l54-*.bin")
         | ^~~~~~~~~~~~~~~


vim +24 include/linux/moduleparam.h

730b69d2252595 Rusty Russell  2008-10-22  22  
^1da177e4c3f41 Linus Torvalds 2005-04-16  23  #define __MODULE_INFO(tag, name, info)					  \
34182eea36fc1d Rusty Russell  2012-11-22 @24  	static const char __UNIQUE_ID(name)[]				  \
2aec389e19150e Johan Hovold   2020-11-23  25  		__used __section(".modinfo") __aligned(1)		  \
898490c010b5d2 Alexey Gladkov 2019-04-29  26  		= __MODULE_INFO_PREFIX __stringify(tag) "=" info
898490c010b5d2 Alexey Gladkov 2019-04-29  27  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
