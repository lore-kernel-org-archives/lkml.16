Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14721C5496;
	Wed, 18 Jun 2025 04:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750220521; cv=none; b=HEfLr7iDTelF0n0oNsEO8uddS7U/9+p1QWqr5AIoWAt4E3wPx4HTb8xeiEviJkOPozmzTc1mzqI1B/OTXOiE/hfOKUApkGzrd/8CgaYDSMdt4zWGRBFdHCVzln68Ox97pY7NZbjiHSataJNQqpcy2wzvrjQNEdWsr61oaJSQpH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750220521; c=relaxed/simple;
	bh=R2c+9apKgvZGYvXoA0VEtTmN9lHTbPOTL+kLmwGezA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ubwwicn90/VLF/wPPIyiwi8RA2fTw921e7vxGq98Zw8k+70prufvOqn/3f9XgIpPfyWMidPWbWwnqruIVXUXotEuSsiVNo2ejqu+4/Yy2KxJRE8Cn/0QUCilj+1BAkMyHl5CJnnrTC6hesAXfztliHwNLORq7pjHpUsFV4C3Srg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ji/1c4IQ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ji/1c4IQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750220520; x=1781756520;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R2c+9apKgvZGYvXoA0VEtTmN9lHTbPOTL+kLmwGezA0=;
  b=Ji/1c4IQ93IdtP+4kS3l+dRvP8Z9vyQi1WsKnvtLRRnSaQkKLEt7PsyC
   FnxfEq0xH4f22tELU/KTjOuDhkk1XNnqN0xD5y2T4sQ3ydetzTlqDBP5y
   yrwyoTrNxVK6hURvaupdXgfvajyAaoNFZxsCSLDRFsP3iwUYCnoEUoyOg
   zKhM2WFpeR4g1qgcbn5SYti6k2PtBFasJ4ax4zR3zfdIeo7yi0PBfudtq
   WROdlXluNfZQJ/bO1/cHXzgGEtirvyb4ikO2UGj7ipo1tepVrqDFkqU87
   qqiRM+0nuNUQBisd36BrOG6Io20buoYTdpTChjtAWhaFBLgZxL/3DjeoE
   Q==;
X-CSE-ConnectionGUID: Kifp9FckRI6RC1wpRU6tLQ==
X-CSE-MsgGUID: j6TIe4dBQ/OMCiyUdQy+VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="40027713"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="40027713"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 21:21:59 -0700
X-CSE-ConnectionGUID: aOMg6EiyRhOMvSXpDmrsOg==
X-CSE-MsgGUID: TAMcggMSRw+2pqPGXG4Dyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="153851262"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Jun 2025 21:21:55 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRkJ6-000JO2-2W;
	Wed, 18 Jun 2025 04:21:52 +0000
Date: Wed, 18 Jun 2025 12:21:20 +0800
From: kernel test robot <lkp@intel.com>
To: Joy Zou <joy.zou@nxp.com>, lgirdwood@gmail.com, broonie@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev, frank.li@nxp.com,
	ye.li@nxp.com, ping.bai@nxp.com, aisheng.dong@nxp.com
Subject: Re: [PATCH v1 2/2] regulator: pf0900: Add PMIC PF0900 support
Message-ID: <202506181134.0Hkvy7CK-lkp@intel.com>
References: <20250617102025.3455544-3-joy.zou@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617102025.3455544-3-joy.zou@nxp.com>

Hi Joy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-regulator/for-next]
[also build test WARNING on linus/master v6.16-rc2 next-20250617]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joy-Zou/dt-bindings-regulator-add-PF0900-regulator-yaml/20250617-182500
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20250617102025.3455544-3-joy.zou%40nxp.com
patch subject: [PATCH v1 2/2] regulator: pf0900: Add PMIC PF0900 support
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250618/202506181134.0Hkvy7CK-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250618/202506181134.0Hkvy7CK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506181134.0Hkvy7CK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/regulator/pf0900-regulator.c:20:
>> include/linux/regulator/pf0900.h:235:9: warning: 'IRQ_MODE' redefined
     235 | #define IRQ_MODE                        0x04
         |         ^~~~~~~~
   In file included from arch/arm/include/asm/ptrace.h:10,
                    from arch/arm/include/asm/irqflags.h:7,
                    from include/linux/irqflags.h:18,
                    from arch/arm/include/asm/bitops.h:28,
                    from include/linux/bitops.h:67,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arm/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from include/linux/i2c.h:13,
                    from drivers/regulator/pf0900-regulator.c:10:
   arch/arm/include/uapi/asm/ptrace.h:60:9: note: this is the location of the previous definition
      60 | #define IRQ_MODE        0x00000012
         |         ^~~~~~~~


vim +/IRQ_MODE +235 include/linux/regulator/pf0900.h

   227	
   228	
   229	/* PF0900_REG_STSTEM_INT bits */
   230	#define IRQ_EWARN			0x80
   231	#define IRQ_GPIO			0x40
   232	#define IRQ_OV				0x20
   233	#define IRQ_UV				0x10
   234	#define IRQ_ILIM			0x08
 > 235	#define IRQ_MODE			0x04
   236	#define IRQ_STATUS2			0x02
   237	#define IRQ_STATUS1			0x01
   238	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
