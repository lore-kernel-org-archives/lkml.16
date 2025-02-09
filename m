Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44FB20EB;
	Sun,  9 Feb 2025 00:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739061392; cv=none; b=kzSDe416TCStcvibwrGW5uyjpn+6yItePGagpTxMmU9jgjHpr0obebVOchl+m8DNjD/RXqiWLSnxpL3MRK715EKNVAeFCJfDqm/l+fInhC0IPyE5UPa9Y50uV1c6vzUpfh6CnmlJ9k3k/J6F26FFtMzdhwm/5rF8SNltIItaF/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739061392; c=relaxed/simple;
	bh=rEtCQ6sQY7H/v4UhdvsasZkTatiK7Wt02KxyfIunSyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M1JgE71z8wYB9/VEaFpbXknN7Je+bF/7OlnojG+V7vfT3rso9WJXDKQEWrbMB8FThVGPpw78eYDE59udWRWy4QUlnu/k2VpeZZlyYadJ0ullYpcP2kjtRm5/juSGENqVt7Y7P3JSrJJixvO771TLJDm1qWpRXLTvTXNgjw8W7s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y9iRyYg7; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y9iRyYg7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739061390; x=1770597390;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rEtCQ6sQY7H/v4UhdvsasZkTatiK7Wt02KxyfIunSyc=;
  b=Y9iRyYg72sgVexVP0KRvB/N4BU+IlA7gmILs/0C80WhKUv+Tc/J5H1zA
   1c+gdLhs9mqg9kp5qw559K/DsWFyA9I+tJYEM4/4v6k8AqrumalrDzrQf
   DW00OKkkDsyDvn/DS7YAoWhwoIeHb7HPUNaNUdWI/VrkOWVWHTJLvEznw
   Ra5Tl6D0Ziy6BWnXQF+G0Mf5SPqHqL6oBXNQXPw8wX7vC/eFFqJcobcGG
   cLx+CXaff6D0WayWPMYp6Nmx+IAE0eW2o9qKTh4g3T/u6TfRmfxAVSHvw
   svYTnOOCIbYFWTKjj/j+hhvokWIiwK4Inqtml5Hxw4N/4F+u8tn2ySwUs
   A==;
X-CSE-ConnectionGUID: 4/wpDFTKQba43ntTugRAvw==
X-CSE-MsgGUID: 3yZMNC/kQk+f9AQ7mQZeHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="27279749"
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="27279749"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 16:36:29 -0800
X-CSE-ConnectionGUID: A8k2NdweS/OPlYJW66xNFQ==
X-CSE-MsgGUID: 0lDncctsTymkVlQt18zbKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116455894"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Feb 2025 16:36:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgvJ9-0010pH-27;
	Sun, 09 Feb 2025 00:36:23 +0000
Date: Sun, 9 Feb 2025 08:35:36 +0800
From: kernel test robot <lkp@intel.com>
To: Nikola Jelic <nikola.jelic83@gmail.com>, lgirdwood@gmail.com,
	broonie@kernel.org, perex@perex.cz, tiwai@suse.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	rwalton@cmlmicro.com
Subject: Re: [PATCH v3 2/2] ASoC: codecs: cmx655: Add CML's CMX655D codec
Message-ID: <202502090855.eWNvBLsV-lkp@intel.com>
References: <20250207161412.6281-2-nikola.jelic83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207161412.6281-2-nikola.jelic83@gmail.com>

Hi Nikola,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on robh/for-next tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.14-rc1 next-20250207]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nikola-Jelic/ASoC-codecs-cmx655-Add-CML-s-CMX655D-codec/20250208-001527
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250207161412.6281-2-nikola.jelic83%40gmail.com
patch subject: [PATCH v3 2/2] ASoC: codecs: cmx655: Add CML's CMX655D codec
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250209/202502090855.eWNvBLsV-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502090855.eWNvBLsV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502090855.eWNvBLsV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/codecs/cmx655.c:10:
   In file included from include/sound/soc.h:26:
   In file included from include/sound/ac97_codec.h:17:
   In file included from include/sound/pcm.h:15:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/codecs/cmx655.c:194:50: warning: use of logical '||' with constant operand [-Wconstant-logical-operand]
     194 |                         *pll_ctrl = (0 << CMX655_PLLCTRL_LFILT_SHIFT) ||
         |                                                                       ^
     195 |                             (3 << CMX655_PLLCTRL_CPI_SHIFT);
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cmx655.c:194:50: note: use '|' for a bitwise operation
     194 |                         *pll_ctrl = (0 << CMX655_PLLCTRL_LFILT_SHIFT) ||
         |                                                                       ^~
         |                                                                       |
>> sound/soc/codecs/cmx655.c:194:19: warning: converting the result of '<<' to a boolean always evaluates to false [-Wtautological-constant-compare]
     194 |                         *pll_ctrl = (0 << CMX655_PLLCTRL_LFILT_SHIFT) ||
         |                                        ^
>> sound/soc/codecs/cmx655.c:195:11: warning: converting the result of '<<' to a boolean; did you mean '(3 << (0)) != 0'? [-Wint-in-bool-context]
     195 |                             (3 << CMX655_PLLCTRL_CPI_SHIFT);
         |                                ^
   sound/soc/codecs/cmx655.c:199:50: warning: use of logical '||' with constant operand [-Wconstant-logical-operand]
     199 |                         *pll_ctrl = (0 << CMX655_PLLCTRL_LFILT_SHIFT) ||
         |                                                                       ^
     200 |                             (3 << CMX655_PLLCTRL_CPI_SHIFT);
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cmx655.c:199:50: note: use '|' for a bitwise operation
     199 |                         *pll_ctrl = (0 << CMX655_PLLCTRL_LFILT_SHIFT) ||
         |                                                                       ^~
         |                                                                       |
   sound/soc/codecs/cmx655.c:199:19: warning: converting the result of '<<' to a boolean always evaluates to false [-Wtautological-constant-compare]
     199 |                         *pll_ctrl = (0 << CMX655_PLLCTRL_LFILT_SHIFT) ||
         |                                        ^
   sound/soc/codecs/cmx655.c:200:11: warning: converting the result of '<<' to a boolean; did you mean '(3 << (0)) != 0'? [-Wint-in-bool-context]
     200 |                             (3 << CMX655_PLLCTRL_CPI_SHIFT);
         |                                ^
   sound/soc/codecs/cmx655.c:204:51: warning: use of logical '||' with constant operand [-Wconstant-logical-operand]
     204 |                         *pll_ctrl = (12 << CMX655_PLLCTRL_LFILT_SHIFT) ||
         |                                                                        ^
     205 |                             (3 << CMX655_PLLCTRL_CPI_SHIFT);
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cmx655.c:204:51: note: use '|' for a bitwise operation
     204 |                         *pll_ctrl = (12 << CMX655_PLLCTRL_LFILT_SHIFT) ||
         |                                                                        ^~
         |                                                                        |
   sound/soc/codecs/cmx655.c:204:20: warning: converting the result of '<<' to a boolean; did you mean '(12 << (4)) != 0'? [-Wint-in-bool-context]
     204 |                         *pll_ctrl = (12 << CMX655_PLLCTRL_LFILT_SHIFT) ||
         |                                         ^
   sound/soc/codecs/cmx655.c:205:11: warning: converting the result of '<<' to a boolean; did you mean '(3 << (0)) != 0'? [-Wint-in-bool-context]
     205 |                             (3 << CMX655_PLLCTRL_CPI_SHIFT);
         |                                ^
   sound/soc/codecs/cmx655.c:209:51: warning: use of logical '||' with constant operand [-Wconstant-logical-operand]
     209 |                         *pll_ctrl = (12 << CMX655_PLLCTRL_LFILT_SHIFT) ||
         |                                                                        ^
     210 |                             (3 << CMX655_PLLCTRL_CPI_SHIFT);
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cmx655.c:209:51: note: use '|' for a bitwise operation
     209 |                         *pll_ctrl = (12 << CMX655_PLLCTRL_LFILT_SHIFT) ||
         |                                                                        ^~
         |                                                                        |
   sound/soc/codecs/cmx655.c:209:20: warning: converting the result of '<<' to a boolean; did you mean '(12 << (4)) != 0'? [-Wint-in-bool-context]
     209 |                         *pll_ctrl = (12 << CMX655_PLLCTRL_LFILT_SHIFT) ||
         |                                         ^
   sound/soc/codecs/cmx655.c:210:11: warning: converting the result of '<<' to a boolean; did you mean '(3 << (0)) != 0'? [-Wint-in-bool-context]
     210 |                             (3 << CMX655_PLLCTRL_CPI_SHIFT);
         |                                ^
   sound/soc/codecs/cmx655.c:859:16: warning: use of logical '&&' with constant operand [-Wconstant-logical-operand]
     859 |                 if ((reg_val && CMX655_VF_DCBLOCK) > 0) {
         |                              ^  ~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cmx655.c:859:16: note: use '&' for a bitwise operation
     859 |                 if ((reg_val && CMX655_VF_DCBLOCK) > 0) {
         |                              ^~
         |                              &
   sound/soc/codecs/cmx655.c:859:16: note: remove constant to silence this warning
     859 |                 if ((reg_val && CMX655_VF_DCBLOCK) > 0) {
         |                              ^~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cmx655.c:859:19: warning: converting the result of '<<' to a boolean; did you mean '(1 << (2)) != 0'? [-Wint-in-bool-context]
     859 |                 if ((reg_val && CMX655_VF_DCBLOCK) > 0) {
         |                                 ^
   sound/soc/codecs/cmx655.h:70:46: note: expanded from macro 'CMX655_VF_DCBLOCK'
      70 | #define     CMX655_VF_DCBLOCK           (0x1 << CMX655_VF_DCBLOCK_SHIFT)
         |                                              ^
   17 warnings generated.


vim +194 sound/soc/codecs/cmx655.c

   149	
   150	/**
   151	 * cmx655_get_sys_clk_config(): Get the clock configuration.
   152	 * @clk_id: Clock source setting as defined in cmx655.h
   153	 * @primary_mode: Non-zero if the CMX655 is the DAI primary
   154	 * @sr_setting: Setting for sample rate 0 to 3
   155	 * @clk_src: pointer for storing clock source (PLLREF, PLLSEL and
   156	 *           CLKSEL bits)
   157	 * @rdiv: pointer for storing PLL's RDIV value (13 bits)
   158	 * @ndiv: pointer for storing PLL's NDIV value (13 bits)
   159	 * @pll_ctrl: pointer for storing PLLCTRL register value (8 bits)
   160	 *
   161	 * Get the clock setup for the system clock based on clock Id, DAI primary mode
   162	 * and sample rate.
   163	 *
   164	 * Return: 0 for success, negative value otherwise
   165	 */
   166	static int cmx655_get_sys_clk_config(int clk_id,
   167					     int primary_mode,
   168					     int sr_setting,
   169					     int *clk_src,
   170					     int *rdiv, int *ndiv, int *pll_ctrl)
   171	{
   172		if (clk_id == CMX655_SYSCLK_AUTO) {
   173			if (primary_mode != 0)
   174				clk_id = CMX655_SYSCLK_RCLK;
   175			else
   176				clk_id = CMX655_SYSCLK_LRCLK;
   177		}
   178		*rdiv = 0;
   179		*ndiv = 0;
   180		*pll_ctrl = 0;
   181		switch (clk_id) {
   182		case CMX655_SYSCLK_RCLK:
   183			*clk_src = CMX655_CLKCTRL_CLRSRC_RCLK;
   184			break;
   185		case CMX655_SYSCLK_LPO:
   186			*clk_src = CMX655_CLKCTRL_CLRSRC_LPO;
   187			break;
   188		case CMX655_SYSCLK_LRCLK:
   189			*clk_src = CMX655_CLKCTRL_CLRSRC_LRCLK;
   190			*rdiv = 1;
   191			switch (sr_setting) {
   192			case CMX655_CLKCTRL_SR_8K:
   193				*ndiv = 3072;
 > 194				*pll_ctrl = (0 << CMX655_PLLCTRL_LFILT_SHIFT) ||
 > 195				    (3 << CMX655_PLLCTRL_CPI_SHIFT);
   196				break;
   197			case CMX655_CLKCTRL_SR_16K:
   198				*ndiv = 1536;
   199				*pll_ctrl = (0 << CMX655_PLLCTRL_LFILT_SHIFT) ||
   200				    (3 << CMX655_PLLCTRL_CPI_SHIFT);
   201				break;
   202			case CMX655_CLKCTRL_SR_32K:
   203				*ndiv = 768;
   204				*pll_ctrl = (12 << CMX655_PLLCTRL_LFILT_SHIFT) ||
   205				    (3 << CMX655_PLLCTRL_CPI_SHIFT);
   206				break;
   207			case CMX655_CLKCTRL_SR_48K:
   208				*ndiv = 512;
   209				*pll_ctrl = (12 << CMX655_PLLCTRL_LFILT_SHIFT) ||
   210				    (3 << CMX655_PLLCTRL_CPI_SHIFT);
   211				break;
   212			default:
   213				return -EINVAL;
   214			}
   215			break;
   216		default:
   217			return -EINVAL;
   218		}
   219		return 0;
   220	};
   221	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
