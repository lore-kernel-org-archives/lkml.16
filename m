Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAD21C07C4
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 11:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738322940; cv=none; b=G1DdyxJO68xJ2k0qkNs2/GJpTXHgARYRxyZefhpQsuK/dFRFPWRlFjJKvQ6gi9TC+iH9o6wRwtmQokgRDj+YVHnOYVtEsVVRs7hxk4wKP0r6NfTQf2mW4/sC3zQoCK3AHx+HdgBGvzV1La+ivKAxe4kiXsd/ldaUWaCf8q7JiCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738322940; c=relaxed/simple;
	bh=P85MS6I410RWpO0QVeQvCMuySsQE7THqWuvFBr3Fx8c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=obh62juzE5iD9M93UHQccFsYm8/sxoFiPOsbmilqpmOXXnOG5A+i4xyCfRcQ3Lqs135DCv6chKSdUUnlOfA8wnw7UhWMKJO5oM9NWIP1SUlQnqu85brvM0g4YTjZeni2Z/h/dx/90D4qj1hTiVsoqpeg2HFi2QfXt/8Hze7m6LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PZNAQPDv; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PZNAQPDv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738322939; x=1769858939;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=P85MS6I410RWpO0QVeQvCMuySsQE7THqWuvFBr3Fx8c=;
  b=PZNAQPDvP2HWUyiO3JkJ3D/K0fL4QGgKJqQPaidPrl9084Y1+PC/Ez7r
   XQb+zocyCz3I9msObMoBiuUnomhs3xxCkntVb9OH4Sy5mPkieDhnX/61M
   hiHVj9fRf2Amx0B4pfHubAvj5VTEeaXOwu6NvqDVwQzXiuadKtCaUkDpT
   B9OZrx5fIbynA5ez0eaoy/ieeVOZhPO1yZSb17/UuZ7Mx2L7YJGy3tZBk
   wO9GD/Aky6YhartUzk7nV2XUF3HRqTE7ylyX2blaotm4Ev0aoLoWd+C7o
   hqgMZtFssRWcwcLbKnwQwrCoKm+G4BYz8nsdas6H7CQzgkNsGByR7ExCc
   g==;
X-CSE-ConnectionGUID: yyCTPnCyQyGKSZcPN/b/Zw==
X-CSE-MsgGUID: Od7P2RWJRC6TCAkZNvARvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="39048491"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; 
   d="scan'208";a="39048491"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 03:28:58 -0800
X-CSE-ConnectionGUID: bc8gGKLQTRKwLHGDKMGR6A==
X-CSE-MsgGUID: zaaohGfGTfyKX/Q8jknCXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; 
   d="scan'208";a="110190966"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 31 Jan 2025 03:28:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdpCh-000mJ5-08;
	Fri, 31 Jan 2025 11:28:55 +0000
Date: Fri, 31 Jan 2025 19:28:43 +0800
From: kernel test robot <lkp@intel.com>
To: George Lander <lander@jagmn.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Marcus Cooper <codekipper@gmail.com>
Subject: sound/soc/sunxi/sun4i-spdif.c:180: warning: Function parameter or
 struct member 'mclk_multiplier' not described in 'sun4i_spdif_quirks'
Message-ID: <202501311953.0Ox9CW5w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi George,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   69e858e0b8b2ea07759e995aa383e8780d9d140c
commit: 0a2319308de88b9e819c0b43d0fccd857123eb31 ASoC: sun4i-spdif: Add clock multiplier settings
date:   8 weeks ago
config: mips-randconfig-r024-20220830 (https://download.01.org/0day-ci/archive/20250131/202501311953.0Ox9CW5w-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250131/202501311953.0Ox9CW5w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501311953.0Ox9CW5w-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/sunxi/sun4i-spdif.c:180: warning: Function parameter or struct member 'mclk_multiplier' not described in 'sun4i_spdif_quirks'


vim +180 sound/soc/sunxi/sun4i-spdif.c

f8260afa444b67 Marcus Cooper 2016-02-08  167  
ae9cccc30f6c08 Clément Péron 2019-05-27  168  /**
ae9cccc30f6c08 Clément Péron 2019-05-27  169   * struct sun4i_spdif_quirks - Differences between SoC variants.
ae9cccc30f6c08 Clément Péron 2019-05-27  170   *
c7202a19cf838d Lee Jones     2020-07-09  171   * @reg_dac_txdata: TX FIFO offset for DMA config.
ae9cccc30f6c08 Clément Péron 2019-05-27  172   * @has_reset: SoC needs reset deasserted.
f6a86b436b2658 Clément Péron 2019-05-27  173   * @val_fctl_ftx: TX FIFO flush bitmask.
ae9cccc30f6c08 Clément Péron 2019-05-27  174   */
ae9cccc30f6c08 Clément Péron 2019-05-27  175  struct sun4i_spdif_quirks {
ae9cccc30f6c08 Clément Péron 2019-05-27  176  	unsigned int reg_dac_txdata;
ae9cccc30f6c08 Clément Péron 2019-05-27  177  	bool has_reset;
f6a86b436b2658 Clément Péron 2019-05-27  178  	unsigned int val_fctl_ftx;
0a2319308de88b George Lander 2024-11-11  179  	unsigned int mclk_multiplier;
ae9cccc30f6c08 Clément Péron 2019-05-27 @180  };
ae9cccc30f6c08 Clément Péron 2019-05-27  181  

:::::: The code at line 180 was first introduced by commit
:::::: ae9cccc30f6c088dd6ead63e990407e37cd9437b ASoC: sun4i-spdif: Move quirks to the top

:::::: TO: Clément Péron <peron.clem@gmail.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
