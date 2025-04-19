Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F6481732
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 08:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745049732; cv=none; b=rZqGuXTbB9qE7ZPRXNuJVJeMZ/tmlQmjh2DD9n4fdUTrBgqVNvqouq84/wk51rpk7OKlnHA/hLywz2PJ+UJFaHxw+0Ga9m+LsaR9qB9nYzCHv/kyylvqjXyiqERAVj5qdgHkjfupuq6XP29azPJWJcgwzuQw5VINza7KAJoVBW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745049732; c=relaxed/simple;
	bh=rb/6re70Mj7F8Nbl1LVm/JFzapFAy0HGcO8dNzJ87pQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aBAtC348CqNTeN5corOzN3Zk5NkZJw+d/dw2eAb0YvBwpr4KtZcbRJI1W8YXMvEAEbIUTTk6qLNWqcBa/TcuyDewj1SnQ8fPpLnNBhhXabVZwE3t28QCA2+l8aGuMiTiRoOeQibyzM2Rd7Ecd+Voxaqr8j6lSIbirUeEHWOtFC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c4Kplayq; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c4Kplayq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745049729; x=1776585729;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rb/6re70Mj7F8Nbl1LVm/JFzapFAy0HGcO8dNzJ87pQ=;
  b=c4KplayqKvm8fAmC7KJq99d48chE1UQxmy1nyxYidyRpKhytE+CZK69o
   gXlkeYeUBG67GrQqhcej/DvxRjX0J+23FG9NvXQIJw6DnliRW0qVPTklw
   DtZLu5TovrKljyzO8hDluPg6KY36dfnPC+xLu+u8BW2YQfKNea/rxzjYP
   K/9+rSqWNj0F+eyrMueTJKxGGyT4IyEYRBqvrZao5kx7nFLW7SNxkxiFw
   0Ug33+RHGYYTrU2PP7RrN5YP+mzlWUxAqfH/qLKGGf4sA0lFBEJugns3S
   4ktpaStJnM/+7H8cZP4apZcNM/RPekMTbSYQR71H6S8J/YixfeJLDEHZv
   g==;
X-CSE-ConnectionGUID: uk+5J5UWRJejwkLt2ghODQ==
X-CSE-MsgGUID: rXMzGVSsRMaK7o4OP9Qe3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="64202012"
X-IronPort-AV: E=Sophos;i="6.15,223,1739865600"; 
   d="scan'208";a="64202012"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 01:02:09 -0700
X-CSE-ConnectionGUID: ha/t7U2rSECRNMYyiPcaiw==
X-CSE-MsgGUID: da77cVk8QwOoVQ+0TkVTmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,223,1739865600"; 
   d="scan'208";a="131869807"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Apr 2025 01:02:06 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u639H-0003hZ-0w;
	Sat, 19 Apr 2025 08:02:03 +0000
Date: Sat, 19 Apr 2025 16:01:57 +0800
From: kernel test robot <lkp@intel.com>
To: xiaopeitux@foxmail.com, linux-kernel@vger.kernel.org,
	f.fangjian@huawei.com, robh@kernel.org, john.g.garry@oracle.com,
	andriy.shevchenko@linux.intel.com, xuwei5@hisilicon.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Pei Xiao <xiaopei01@kylinos.cn>
Subject: Re: [PATCH 1/2] bus: hisi_lpc: remove unused head file in hisi_lpc.c
Message-ID: <202504191505.nkccQttS-lkp@intel.com>
References: <tencent_8024B8D7E209E31C8E2B5AC411B70C551106@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_8024B8D7E209E31C8E2B5AC411B70C551106@qq.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-nonmm-unstable]
[also build test ERROR on linus/master v6.15-rc2 next-20250417]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/xiaopeitux-foxmail-com/logic_pio-Add-detailed-comments-for-find_io_range-and-logic_pio_trans_cpuaddr/20250418-171121
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/tencent_8024B8D7E209E31C8E2B5AC411B70C551106%40qq.com
patch subject: [PATCH 1/2] bus: hisi_lpc: remove unused head file in hisi_lpc.c
config: i386-buildonly-randconfig-004-20250419 (https://download.01.org/0day-ci/archive/20250419/202504191505.nkccQttS-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250419/202504191505.nkccQttS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504191505.nkccQttS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/bus/hisi_lpc.c:78:12: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      78 |                 status = readl(mbase + LPC_REG_OP_STATUS);
         |                          ^
>> drivers/bus/hisi_lpc.c:119:2: error: call to undeclared function 'writel_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     119 |         writel_relaxed(opcnt, lpcdev->membase + LPC_REG_OP_LEN);
         |         ^
>> drivers/bus/hisi_lpc.c:123:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     123 |         writel(LPC_REG_STARTUP_SIGNAL_START,
         |         ^
>> drivers/bus/hisi_lpc.c:133:2: error: call to undeclared function 'readsb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     133 |         readsb(lpcdev->membase + LPC_REG_RDATA, buf, opcnt);
         |         ^
   drivers/bus/hisi_lpc.c:172:2: error: call to undeclared function 'writel_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     172 |         writel_relaxed(opcnt, lpcdev->membase + LPC_REG_OP_LEN);
         |         ^
>> drivers/bus/hisi_lpc.c:176:2: error: call to undeclared function 'writesb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     176 |         writesb(lpcdev->membase + LPC_REG_WDATA, buf, opcnt);
         |         ^
   drivers/bus/hisi_lpc.c:178:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     178 |         writel(LPC_REG_STARTUP_SIGNAL_START,
         |         ^
   7 errors generated.


vim +/readl +78 drivers/bus/hisi_lpc.c

adf38bb0b5956a Zhichang Yuan   2018-03-21   72  
663accf1872b22 John Garry      2019-11-05   73  static int wait_lpc_idle(void __iomem *mbase, unsigned int waitcnt)
adf38bb0b5956a Zhichang Yuan   2018-03-21   74  {
adf38bb0b5956a Zhichang Yuan   2018-03-21   75  	u32 status;
adf38bb0b5956a Zhichang Yuan   2018-03-21   76  
adf38bb0b5956a Zhichang Yuan   2018-03-21   77  	do {
adf38bb0b5956a Zhichang Yuan   2018-03-21  @78  		status = readl(mbase + LPC_REG_OP_STATUS);
adf38bb0b5956a Zhichang Yuan   2018-03-21   79  		if (status & LPC_REG_OP_STATUS_IDLE)
adf38bb0b5956a Zhichang Yuan   2018-03-21   80  			return (status & LPC_REG_OP_STATUS_FINISHED) ? 0 : -EIO;
adf38bb0b5956a Zhichang Yuan   2018-03-21   81  		ndelay(LPC_NSEC_PERWAIT);
adf38bb0b5956a Zhichang Yuan   2018-03-21   82  	} while (--waitcnt);
adf38bb0b5956a Zhichang Yuan   2018-03-21   83  
5e3e70b8e1ae98 Andy Shevchenko 2022-09-05   84  	return -ETIMEDOUT;
adf38bb0b5956a Zhichang Yuan   2018-03-21   85  }
adf38bb0b5956a Zhichang Yuan   2018-03-21   86  
adf38bb0b5956a Zhichang Yuan   2018-03-21   87  /*
adf38bb0b5956a Zhichang Yuan   2018-03-21   88   * hisi_lpc_target_in - trigger a series of LPC cycles for read operation
adf38bb0b5956a Zhichang Yuan   2018-03-21   89   * @lpcdev: pointer to hisi lpc device
adf38bb0b5956a Zhichang Yuan   2018-03-21   90   * @para: some parameters used to control the lpc I/O operations
adf38bb0b5956a Zhichang Yuan   2018-03-21   91   * @addr: the lpc I/O target port address
adf38bb0b5956a Zhichang Yuan   2018-03-21   92   * @buf: where the read back data is stored
adf38bb0b5956a Zhichang Yuan   2018-03-21   93   * @opcnt: how many I/O operations required, i.e. data width
adf38bb0b5956a Zhichang Yuan   2018-03-21   94   *
adf38bb0b5956a Zhichang Yuan   2018-03-21   95   * Returns 0 on success, non-zero on fail.
adf38bb0b5956a Zhichang Yuan   2018-03-21   96   */
adf38bb0b5956a Zhichang Yuan   2018-03-21   97  static int hisi_lpc_target_in(struct hisi_lpc_dev *lpcdev,
adf38bb0b5956a Zhichang Yuan   2018-03-21   98  			      struct lpc_cycle_para *para, unsigned long addr,
adf38bb0b5956a Zhichang Yuan   2018-03-21   99  			      unsigned char *buf, unsigned long opcnt)
adf38bb0b5956a Zhichang Yuan   2018-03-21  100  {
adf38bb0b5956a Zhichang Yuan   2018-03-21  101  	unsigned int cmd_word;
adf38bb0b5956a Zhichang Yuan   2018-03-21  102  	unsigned int waitcnt;
adf38bb0b5956a Zhichang Yuan   2018-03-21  103  	unsigned long flags;
adf38bb0b5956a Zhichang Yuan   2018-03-21  104  	int ret;
adf38bb0b5956a Zhichang Yuan   2018-03-21  105  
adf38bb0b5956a Zhichang Yuan   2018-03-21  106  	if (!buf || !opcnt || !para || !para->csize || !lpcdev)
adf38bb0b5956a Zhichang Yuan   2018-03-21  107  		return -EINVAL;
adf38bb0b5956a Zhichang Yuan   2018-03-21  108  
adf38bb0b5956a Zhichang Yuan   2018-03-21  109  	cmd_word = 0; /* IO mode, Read */
adf38bb0b5956a Zhichang Yuan   2018-03-21  110  	waitcnt = LPC_PEROP_WAITCNT;
adf38bb0b5956a Zhichang Yuan   2018-03-21  111  	if (!(para->opflags & FG_INCRADDR_LPC)) {
adf38bb0b5956a Zhichang Yuan   2018-03-21  112  		cmd_word |= LPC_REG_CMD_SAMEADDR;
adf38bb0b5956a Zhichang Yuan   2018-03-21  113  		waitcnt = LPC_MAX_WAITCNT;
adf38bb0b5956a Zhichang Yuan   2018-03-21  114  	}
adf38bb0b5956a Zhichang Yuan   2018-03-21  115  
adf38bb0b5956a Zhichang Yuan   2018-03-21  116  	/* whole operation must be atomic */
adf38bb0b5956a Zhichang Yuan   2018-03-21  117  	spin_lock_irqsave(&lpcdev->cycle_lock, flags);
adf38bb0b5956a Zhichang Yuan   2018-03-21  118  
adf38bb0b5956a Zhichang Yuan   2018-03-21 @119  	writel_relaxed(opcnt, lpcdev->membase + LPC_REG_OP_LEN);
adf38bb0b5956a Zhichang Yuan   2018-03-21  120  	writel_relaxed(cmd_word, lpcdev->membase + LPC_REG_CMD);
adf38bb0b5956a Zhichang Yuan   2018-03-21  121  	writel_relaxed(addr, lpcdev->membase + LPC_REG_ADDR);
adf38bb0b5956a Zhichang Yuan   2018-03-21  122  
adf38bb0b5956a Zhichang Yuan   2018-03-21 @123  	writel(LPC_REG_STARTUP_SIGNAL_START,
adf38bb0b5956a Zhichang Yuan   2018-03-21  124  	       lpcdev->membase + LPC_REG_STARTUP_SIGNAL);
adf38bb0b5956a Zhichang Yuan   2018-03-21  125  
adf38bb0b5956a Zhichang Yuan   2018-03-21  126  	/* whether the operation is finished */
adf38bb0b5956a Zhichang Yuan   2018-03-21  127  	ret = wait_lpc_idle(lpcdev->membase, waitcnt);
adf38bb0b5956a Zhichang Yuan   2018-03-21  128  	if (ret) {
adf38bb0b5956a Zhichang Yuan   2018-03-21  129  		spin_unlock_irqrestore(&lpcdev->cycle_lock, flags);
adf38bb0b5956a Zhichang Yuan   2018-03-21  130  		return ret;
adf38bb0b5956a Zhichang Yuan   2018-03-21  131  	}
adf38bb0b5956a Zhichang Yuan   2018-03-21  132  
adf38bb0b5956a Zhichang Yuan   2018-03-21 @133  	readsb(lpcdev->membase + LPC_REG_RDATA, buf, opcnt);
adf38bb0b5956a Zhichang Yuan   2018-03-21  134  
adf38bb0b5956a Zhichang Yuan   2018-03-21  135  	spin_unlock_irqrestore(&lpcdev->cycle_lock, flags);
adf38bb0b5956a Zhichang Yuan   2018-03-21  136  
adf38bb0b5956a Zhichang Yuan   2018-03-21  137  	return 0;
adf38bb0b5956a Zhichang Yuan   2018-03-21  138  }
adf38bb0b5956a Zhichang Yuan   2018-03-21  139  
adf38bb0b5956a Zhichang Yuan   2018-03-21  140  /*
adf38bb0b5956a Zhichang Yuan   2018-03-21  141   * hisi_lpc_target_out - trigger a series of LPC cycles for write operation
adf38bb0b5956a Zhichang Yuan   2018-03-21  142   * @lpcdev: pointer to hisi lpc device
adf38bb0b5956a Zhichang Yuan   2018-03-21  143   * @para: some parameters used to control the lpc I/O operations
adf38bb0b5956a Zhichang Yuan   2018-03-21  144   * @addr: the lpc I/O target port address
adf38bb0b5956a Zhichang Yuan   2018-03-21  145   * @buf: where the data to be written is stored
adf38bb0b5956a Zhichang Yuan   2018-03-21  146   * @opcnt: how many I/O operations required, i.e. data width
adf38bb0b5956a Zhichang Yuan   2018-03-21  147   *
adf38bb0b5956a Zhichang Yuan   2018-03-21  148   * Returns 0 on success, non-zero on fail.
adf38bb0b5956a Zhichang Yuan   2018-03-21  149   */
adf38bb0b5956a Zhichang Yuan   2018-03-21  150  static int hisi_lpc_target_out(struct hisi_lpc_dev *lpcdev,
adf38bb0b5956a Zhichang Yuan   2018-03-21  151  			       struct lpc_cycle_para *para, unsigned long addr,
adf38bb0b5956a Zhichang Yuan   2018-03-21  152  			       const unsigned char *buf, unsigned long opcnt)
adf38bb0b5956a Zhichang Yuan   2018-03-21  153  {
adf38bb0b5956a Zhichang Yuan   2018-03-21  154  	unsigned int waitcnt;
adf38bb0b5956a Zhichang Yuan   2018-03-21  155  	unsigned long flags;
adf38bb0b5956a Zhichang Yuan   2018-03-21  156  	u32 cmd_word;
adf38bb0b5956a Zhichang Yuan   2018-03-21  157  	int ret;
adf38bb0b5956a Zhichang Yuan   2018-03-21  158  
adf38bb0b5956a Zhichang Yuan   2018-03-21  159  	if (!buf || !opcnt || !para || !lpcdev)
adf38bb0b5956a Zhichang Yuan   2018-03-21  160  		return -EINVAL;
adf38bb0b5956a Zhichang Yuan   2018-03-21  161  
adf38bb0b5956a Zhichang Yuan   2018-03-21  162  	/* default is increasing address */
adf38bb0b5956a Zhichang Yuan   2018-03-21  163  	cmd_word = LPC_REG_CMD_OP; /* IO mode, write */
adf38bb0b5956a Zhichang Yuan   2018-03-21  164  	waitcnt = LPC_PEROP_WAITCNT;
adf38bb0b5956a Zhichang Yuan   2018-03-21  165  	if (!(para->opflags & FG_INCRADDR_LPC)) {
adf38bb0b5956a Zhichang Yuan   2018-03-21  166  		cmd_word |= LPC_REG_CMD_SAMEADDR;
adf38bb0b5956a Zhichang Yuan   2018-03-21  167  		waitcnt = LPC_MAX_WAITCNT;
adf38bb0b5956a Zhichang Yuan   2018-03-21  168  	}
adf38bb0b5956a Zhichang Yuan   2018-03-21  169  
adf38bb0b5956a Zhichang Yuan   2018-03-21  170  	spin_lock_irqsave(&lpcdev->cycle_lock, flags);
adf38bb0b5956a Zhichang Yuan   2018-03-21  171  
adf38bb0b5956a Zhichang Yuan   2018-03-21  172  	writel_relaxed(opcnt, lpcdev->membase + LPC_REG_OP_LEN);
adf38bb0b5956a Zhichang Yuan   2018-03-21  173  	writel_relaxed(cmd_word, lpcdev->membase + LPC_REG_CMD);
adf38bb0b5956a Zhichang Yuan   2018-03-21  174  	writel_relaxed(addr, lpcdev->membase + LPC_REG_ADDR);
adf38bb0b5956a Zhichang Yuan   2018-03-21  175  
adf38bb0b5956a Zhichang Yuan   2018-03-21 @176  	writesb(lpcdev->membase + LPC_REG_WDATA, buf, opcnt);
adf38bb0b5956a Zhichang Yuan   2018-03-21  177  
adf38bb0b5956a Zhichang Yuan   2018-03-21  178  	writel(LPC_REG_STARTUP_SIGNAL_START,
adf38bb0b5956a Zhichang Yuan   2018-03-21  179  	       lpcdev->membase + LPC_REG_STARTUP_SIGNAL);
adf38bb0b5956a Zhichang Yuan   2018-03-21  180  
adf38bb0b5956a Zhichang Yuan   2018-03-21  181  	/* whether the operation is finished */
adf38bb0b5956a Zhichang Yuan   2018-03-21  182  	ret = wait_lpc_idle(lpcdev->membase, waitcnt);
adf38bb0b5956a Zhichang Yuan   2018-03-21  183  
adf38bb0b5956a Zhichang Yuan   2018-03-21  184  	spin_unlock_irqrestore(&lpcdev->cycle_lock, flags);
adf38bb0b5956a Zhichang Yuan   2018-03-21  185  
adf38bb0b5956a Zhichang Yuan   2018-03-21  186  	return ret;
adf38bb0b5956a Zhichang Yuan   2018-03-21  187  }
adf38bb0b5956a Zhichang Yuan   2018-03-21  188  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
