Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEF3290098;
	Fri,  9 May 2025 12:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746793756; cv=none; b=joRrcijoqmTBlAPTmHZxPaKXdcAO3h95uz0jWzgvc1RBm63OmM8RZbQMFGdsoQ4nCe9/Yys3A3nmDwhCHw+zD1KNd0kegx72zqz7oJTMZTIqsbjSgQSM5J38VDigcT0zxf9VedWn8vI/CxbBhnCvEyKSYQ0vtjRAG1K+WI2j1Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746793756; c=relaxed/simple;
	bh=PzYfM4U0oRLonPlgfQq8pnsotxVOcUZeYx58AFSn078=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PrjLiezcWOW0xvPwMe2UEmFNTheS92sKc+WCbKmt9dg4aWIHRuhR3S44auLIPkD8HjC6K1aHU8IPuai3BcXiXhhI4dyP7O79u1bl4PbH7uFx/4Slpf1AyTuVfL2k++fx75FR0Y6swSA98dJNcF969obBhTOrJrkH7eGPHJwSggc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EuBvdW/d; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EuBvdW/d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746793754; x=1778329754;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PzYfM4U0oRLonPlgfQq8pnsotxVOcUZeYx58AFSn078=;
  b=EuBvdW/dAc20W9ccB6mbJgWUJ2jEnNcQNzcLIDbvmpi3EJzW4dkL8I0A
   8RFFJqdXh2Vvd2+yaJA7Tao7w4No5FjjGo8BfEbg4Z8QtCTqbhBxTArIT
   JNtl73MVfXkqHVvKjM2BSkrA9QvdOI0RyjdnXf9VR3EYm41JvCLNoO0K/
   dtOYRRESZeeIM5SPbEwovT36WVrNQd7nauWMdQJmXcJYcXwd+js1bGcfq
   CejDbZL0deHBmTLQKUEJ6419WUhNVH9L/3oQb/uYaET0FoiVfohDHfi+D
   42G4a5EEaMPAqWAbX6VqJEemneOI1Ggn6/6ttGHIbOqISPgzqNUIxm2tt
   g==;
X-CSE-ConnectionGUID: lsbw+6MSSFmbXWDLYBvofg==
X-CSE-MsgGUID: r9XpN3L1Q1ejMulLjgkMrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59963904"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="59963904"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 05:29:13 -0700
X-CSE-ConnectionGUID: AEAKygE/R5OtNhb1QY27qw==
X-CSE-MsgGUID: xc5/UoSQQ/Wj9mtgwrwTYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="137101795"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 May 2025 05:29:11 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDMqi-000C4B-29;
	Fri, 09 May 2025 12:29:08 +0000
Date: Fri, 9 May 2025 20:28:12 +0800
From: kernel test robot <lkp@intel.com>
To: Aman Kumar Pandey <aman.kumarpandey@nxp.com>,
	linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	vikash.bansal@nxp.com, priyanka.jain@nxp.com,
	shashank.rebbapragada@nxp.com, Frank.Li@nxp.com,
	Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: Re: [PATCH v2 2/2] drivers: i3c: Add driver for NXP P3H2x4x i3c-hub
 device
Message-ID: <202505092036.D5saUso4-lkp@intel.com>
References: <20250508045711.2810207-2-aman.kumarpandey@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508045711.2810207-2-aman.kumarpandey@nxp.com>

Hi Aman,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.15-rc5 next-20250508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aman-Kumar-Pandey/drivers-i3c-Add-driver-for-NXP-P3H2x4x-i3c-hub-device/20250508-125929
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250508045711.2810207-2-aman.kumarpandey%40nxp.com
patch subject: [PATCH v2 2/2] drivers: i3c: Add driver for NXP P3H2x4x i3c-hub device
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250509/202505092036.D5saUso4-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505092036.D5saUso4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505092036.D5saUso4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/i3c/hub/p3h2840_i3c_hub_common.c:125:12: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     125 |                 value |= P3H2x4x_TP0145_PULLUP_CONF(p3h2x4x_pullup_dt_to_reg
         |                          ^
   drivers/i3c/hub/p3h2840_i3c_hub.h:93:3: note: expanded from macro 'P3H2x4x_TP0145_PULLUP_CONF'
      93 |                 FIELD_PREP(P3H2x4x_TP0145_PULLUP_CONF_MASK, x)
         |                 ^
   drivers/i3c/hub/p3h2840_i3c_hub_common.c:131:12: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     131 |                 value |= P3H2x4x_TP2367_PULLUP_CONF(p3h2x4x_pullup_dt_to_reg
         |                          ^
   drivers/i3c/hub/p3h2840_i3c_hub.h:96:3: note: expanded from macro 'P3H2x4x_TP2367_PULLUP_CONF'
      96 |                 FIELD_PREP(P3H2x4x_TP2367_PULLUP_CONF_MASK, x)
         |                 ^
   drivers/i3c/hub/p3h2840_i3c_hub_common.c:168:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     168 |                 val = P3H2x4x_CP0_VCCIO_LDO_VOLTAGE(p3h2x4x_ldo_dt_to_reg
         |                       ^
   drivers/i3c/hub/p3h2840_i3c_hub.h:68:3: note: expanded from macro 'P3H2x4x_CP0_VCCIO_LDO_VOLTAGE'
      68 |                 FIELD_PREP(P3H2x4x_CP0_VCCIO_LDO_VOLTAGE_MASK, x)
         |                 ^
   drivers/i3c/hub/p3h2840_i3c_hub_common.c:178:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     178 |                 val = P3H2x4x_CP1_VCCIO_LDO_VOLTAGE(p3h2x4x_ldo_dt_to_reg
         |                       ^
   drivers/i3c/hub/p3h2840_i3c_hub.h:71:3: note: expanded from macro 'P3H2x4x_CP1_VCCIO_LDO_VOLTAGE'
      71 |                 FIELD_PREP(P3H2x4x_CP1_VCCIO_LDO_VOLTAGE_MASK, x)
         |                 ^
   drivers/i3c/hub/p3h2840_i3c_hub_common.c:188:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     188 |                 val = P3H2x4x_TP0145_VCCIO_LDO_VOLTAGE(p3h2x4x_ldo_dt_to_reg
         |                       ^
   drivers/i3c/hub/p3h2840_i3c_hub.h:74:3: note: expanded from macro 'P3H2x4x_TP0145_VCCIO_LDO_VOLTAGE'
      74 |                 FIELD_PREP(P3H2x4x_TP0145_VCCIO_LDO_VOLTAGE_MASK, x)
         |                 ^
   drivers/i3c/hub/p3h2840_i3c_hub_common.c:198:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     198 |                 val = P3H2x4x_TP2367_VCCIO_LDO_VOLTAGE(p3h2x4x_ldo_dt_to_reg
         |                       ^
   drivers/i3c/hub/p3h2840_i3c_hub.h:77:3: note: expanded from macro 'P3H2x4x_TP2367_VCCIO_LDO_VOLTAGE'
      77 |                 FIELD_PREP(P3H2x4x_TP2367_VCCIO_LDO_VOLTAGE_MASK, x)
         |                 ^
   drivers/i3c/hub/p3h2840_i3c_hub_common.c:246:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     246 |                 val = P3H2x4x_CP0_IO_STRENGTH(p3h2x4x_io_strength_dt_to_reg
         |                       ^
   drivers/i3c/hub/p3h2840_i3c_hub.h:59:3: note: expanded from macro 'P3H2x4x_CP0_IO_STRENGTH'
      59 |                 FIELD_PREP(P3H2x4x_CP0_IO_STRENGTH_MASK, x)
         |                 ^
   drivers/i3c/hub/p3h2840_i3c_hub_common.c:252:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     252 |                 val = P3H2x4x_CP1_IO_STRENGTH(p3h2x4x_io_strength_dt_to_reg
         |                       ^
   drivers/i3c/hub/p3h2840_i3c_hub.h:62:3: note: expanded from macro 'P3H2x4x_CP1_IO_STRENGTH'
      62 |                 FIELD_PREP(P3H2x4x_CP1_IO_STRENGTH_MASK, x)
         |                 ^
   drivers/i3c/hub/p3h2840_i3c_hub_common.c:258:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     258 |                 val = P3H2x4x_TP0145_IO_STRENGTH(p3h2x4x_io_strength_dt_to_reg
         |                       ^
   drivers/i3c/hub/p3h2840_i3c_hub.h:53:3: note: expanded from macro 'P3H2x4x_TP0145_IO_STRENGTH'
      53 |                 FIELD_PREP(P3H2x4x_TP0145_IO_STRENGTH_MASK, x)
         |                 ^
   drivers/i3c/hub/p3h2840_i3c_hub_common.c:264:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     264 |                 val = P3H2x4x_TP2367_IO_STRENGTH(p3h2x4x_io_strength_dt_to_reg
         |                       ^
   drivers/i3c/hub/p3h2840_i3c_hub.h:56:3: note: expanded from macro 'P3H2x4x_TP2367_IO_STRENGTH'
      56 |                 FIELD_PREP(P3H2x4x_TP2367_IO_STRENGTH_MASK, x)
         |                 ^
   10 errors generated.


vim +/FIELD_PREP +125 drivers/i3c/hub/p3h2840_i3c_hub_common.c

   117	
   118	static int p3h2x4x_configure_pullup(struct device *dev)
   119	{
   120		struct p3h2x4x *priv = dev_get_drvdata(dev);
   121		u8 mask = 0, value = 0;
   122	
   123		if (priv->settings.tp0145_pullup != P3H2x4x_TP_PULLUP_NOT_SET) {
   124			mask |= P3H2x4x_TP0145_PULLUP_CONF_MASK;
 > 125			value |= P3H2x4x_TP0145_PULLUP_CONF(p3h2x4x_pullup_dt_to_reg
   126							    (priv->settings.tp0145_pullup));
   127		}
   128	
   129		if (priv->settings.tp2367_pullup != P3H2x4x_TP_PULLUP_NOT_SET) {
   130			mask |= P3H2x4x_TP2367_PULLUP_CONF_MASK;
   131			value |= P3H2x4x_TP2367_PULLUP_CONF(p3h2x4x_pullup_dt_to_reg
   132							    (priv->settings.tp2367_pullup));
   133		}
   134	
   135		return regmap_update_bits(priv->regmap, P3H2x4x_LDO_AND_PULLUP_CONF,
   136					  mask, value);
   137	}
   138	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
