Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8E8249E5;
	Sun,  6 Jul 2025 06:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751782943; cv=none; b=Jww+FfeUCObFbcuwOehfm4Eo99xvcuDMElbKo59zdSUd36ba7457nAy6xQyC8wRN8SGVXivz72/deFKi8oiqDe2z5lA5pvBGGIi3DoBgv0tIU3Z6zFuBaMp3Uwr8Os4vBG2nGKO7thj+7l2NU9BotV6h1mxIXW5s/QJtawPepxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751782943; c=relaxed/simple;
	bh=nW8O8YdElWySi7VcpRvqBHn54tWkhNDJ64guVXrJuCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ptVv7kF1mf3o7fBHa4V94vxQ++wYotFWHBet1Y6CIHBu62W1cWhWUc5SgHD666l91xSBB5ePG9A60BMjVwWeFdRjkRoDknL9AYZF/WX85MKglIDyNOoEeWeFCk28+CTCH/TBf9KIDDDszZhVZWwz6x09PQlhLXkg2iMWlWxc0QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=giHSbQAG; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="giHSbQAG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751782942; x=1783318942;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nW8O8YdElWySi7VcpRvqBHn54tWkhNDJ64guVXrJuCc=;
  b=giHSbQAGnDhfI9O474JZ/JpNATY6jaD0JkD8IZ/Q/uxFhBNWWi6SBpyr
   eIjAecfIXp1WMaeMVrUwSrxSI3N6saNmuNTNCypvnSv+6bIvo9eFjHDfc
   cyLdUKFiafOHYXOfGKgNTOdaLE/CCLs2tAlCkq2VV9758BA5GQqginJu0
   07hnV/W4TTMb5JD1mzxOQJYhIfa2erizFYENucWQzdj1SHDLW9n4Jd1NR
   CFwgUbmNCp/+S9BWT0bD67j2jPZ7yl98TS6428q9uzTTL0blAGruDU+eE
   aYXixwBA5Cx0BWxEvHSZUhuoKtirf77pv1Ig/B6iG/wa5sr7YCTprWrYx
   g==;
X-CSE-ConnectionGUID: ziNHpL9zQZe9o/qb0axoPw==
X-CSE-MsgGUID: do6Rk6MyQ6u2QVWaD3J2WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="57703926"
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="57703926"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 23:22:22 -0700
X-CSE-ConnectionGUID: bHDd9G8XRAqckPZ8lMKU7A==
X-CSE-MsgGUID: iSE7HrUbTUCEPReK/zoDzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="159486719"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Jul 2025 23:22:18 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYIlT-0004v1-2N;
	Sun, 06 Jul 2025 06:22:15 +0000
Date: Sun, 6 Jul 2025 14:22:01 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	broonie@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 4/6] regulator: Add support for MediaTek MT6363 SPMI
 PMIC Regulators
Message-ID: <202507061437.VKBqvJPn-lkp@intel.com>
References: <20250624073548.29732-5-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624073548.29732-5-angelogioacchino.delregno@collabora.com>

Hi AngeloGioacchino,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-regulator/for-next]
[also build test ERROR on linus/master v6.16-rc4 next-20250704]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-regulator-Document-MediaTek-MT6316-PMIC-Regulators/20250624-154048
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20250624073548.29732-5-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v2 4/6] regulator: Add support for MediaTek MT6363 SPMI PMIC Regulators
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250706/202507061437.VKBqvJPn-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250706/202507061437.VKBqvJPn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507061437.VKBqvJPn-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/regulator/mt6363-regulator.c:375:14: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     375 |                 } else if (cur_mode == REGULATOR_MODE_IDLE) {
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6363-regulator.c:388:6: note: uninitialized use occurs here
     388 |         if (ret) {
         |             ^~~
   drivers/regulator/mt6363-regulator.c:375:10: note: remove the 'if' if its condition is always true
     375 |                 } else if (cur_mode == REGULATOR_MODE_IDLE) {
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6363-regulator.c:347:19: note: initialize the variable 'ret' to silence this warning
     347 |         int cur_mode, ret;
         |                          ^
         |                           = 0
   drivers/regulator/mt6363-regulator.c:351:28: warning: variable 'regmap' is uninitialized when used here [-Wuninitialized]
     351 |                 ret = mt6363_buck_unlock(regmap, true);
         |                                          ^~~~~~
   drivers/regulator/mt6363-regulator.c:346:23: note: initialize the variable 'regmap' to silence this warning
     346 |         struct regmap *regmap;
         |                              ^
         |                               = NULL
>> drivers/regulator/mt6363-regulator.c:455:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     455 |                 sel = FIELD_PREP(MT6363_RG_VEMC_VOSEL_1_MASK, sel);
         |                       ^
>> drivers/regulator/mt6363-regulator.c:487:9: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     487 |                 ret = FIELD_GET(MT6363_RG_VEMC_VOSEL_1_MASK, sel);
         |                       ^
   2 warnings and 2 errors generated.


vim +/FIELD_PREP +455 drivers/regulator/mt6363-regulator.c

   430	
   431	static int mt6363_vemc_set_voltage_sel(struct regulator_dev *rdev, unsigned int sel)
   432	{
   433		const u16 tma_unlock_key = MT6363_TMA_UNLOCK_VALUE;
   434		struct regmap *regmap = rdev->regmap;
   435		unsigned int val;
   436		u16 mask;
   437		int ret;
   438	
   439		ret = regmap_read(rdev->regmap, MT6363_TOP_TRAP, &val);
   440		if (ret)
   441			return ret;
   442	
   443		if (val > 1)
   444			return -EINVAL;
   445	
   446		/* Unlock TMA for writing */
   447		ret = regmap_bulk_write(rdev->regmap, MT6363_TOP_TMA_KEY_L,
   448					&tma_unlock_key, sizeof(tma_unlock_key));
   449		if (ret)
   450			return ret;
   451	
   452		/* If HW trapping value is 1, use VEMC_VOSEL_1 instead of VEMC_VOSEL_0 */
   453		if (val == 1) {
   454			mask = MT6363_RG_VEMC_VOSEL_1_MASK;
 > 455			sel = FIELD_PREP(MT6363_RG_VEMC_VOSEL_1_MASK, sel);
   456		} else {
   457			mask = rdev->desc->vsel_mask;
   458		}
   459	
   460		/* Function must return the result of this write operation */
   461		ret = regmap_update_bits(regmap, rdev->desc->vsel_reg, mask, sel);
   462	
   463		/* Unconditionally re-lock TMA */
   464		val = 0;
   465		regmap_bulk_write(rdev->regmap, MT6363_TOP_TMA_KEY_L, &val, 2);
   466	
   467		return ret;
   468	}
   469	
   470	static int mt6363_vemc_get_voltage_sel(struct regulator_dev *rdev)
   471	{
   472		unsigned int sel, trap;
   473		int ret;
   474	
   475		ret = regmap_read(rdev->regmap, rdev->desc->vsel_reg, &sel);
   476		if (ret)
   477			return ret;
   478	
   479		ret = regmap_read(rdev->regmap, MT6363_TOP_TRAP, &trap);
   480		if (ret)
   481			return ret;
   482	
   483		/* If HW trapping value is 1, use VEMC_VOSEL_1 instead of VEMC_VOSEL_0 */
   484		if (trap > 1)
   485			return -EINVAL;
   486		else if (trap == 1)
 > 487			ret = FIELD_GET(MT6363_RG_VEMC_VOSEL_1_MASK, sel);
   488		else
   489			ret = sel & rdev->desc->vsel_mask;
   490	
   491		return ret;
   492	}
   493	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
