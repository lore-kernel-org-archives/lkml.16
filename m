Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AACF12B63
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 23:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745105196; cv=none; b=iLda+t41a8bVB/CTyzx971yS/ZK7m7dUd1rcHUv03Wi/uWFSHCSrNixRZjeqx5E4mQXPETKWHN0oiJKHhJ7izbxQgFCEkD+TSTqLwIN7mi+Wp6/U/ckXv035QvpHWvPfk46w7NSA67DaRxJVQ4Ecrusj5E1eCgyhwVuUtoprlB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745105196; c=relaxed/simple;
	bh=qVScdkl5iPBLiBdRmiJzCqG13jp15oisHxcdqp8EuQk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SBTtAxCBKFgZjQJwvO6OyYLShilL2Offi80w2kHVYjwL3AyKfMYPrFGOvC4uc0AV3QXbS7JC8q6+Z2dGec8Q5oQQ6tzt4AljIidCgUFvaFIvx+NniVS4HRnijpUKVMIQ1QNjrFCdNc6ZGOARpZeIW6XmCGRkkEUeLyVF1/MooEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LSblfsvJ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LSblfsvJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745105195; x=1776641195;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qVScdkl5iPBLiBdRmiJzCqG13jp15oisHxcdqp8EuQk=;
  b=LSblfsvJjdM1ERH2u8SPdUAfse5B6menGyZCAXam6X7ZNZrau+dp7zBX
   t0z56ZoikNGpoeFi3iFZlcHuDiMIkEGQobNBZ7QnXUKQexxf8TmVa9E0T
   GFFvxbV2ZGECCi76pLlM3AS3S3dV6DU2ujGQkoavzaRs4mJgvse2zmb41
   lPmq0jqiNrXAZI8ddPmzuNgzHdCT+6SRHwngVWUsHKSx0ClEGFJ8Hfh29
   +ZzVgKCp6+pPO7f18L//WxZQKjYBlgDy12oUYiA54uQRoZ+rxxYyD+4NW
   2UVaMknww1mzZ+Tdk2FcZn7Pntv9Q4UGfmPHYCgP3QSSlHbHZeItpxCWa
   g==;
X-CSE-ConnectionGUID: ggejyDTFQz2Bt2CmH1jrRw==
X-CSE-MsgGUID: 8QIS/W53RbixGU2oUxvhyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="46395028"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="46395028"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 16:26:34 -0700
X-CSE-ConnectionGUID: 9OEHYU2bTi6f0WXx2F/voA==
X-CSE-MsgGUID: +X3W9JFzRu+7kqitwi7C8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="168601627"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Apr 2025 16:26:32 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6HZt-0004Ft-2Y;
	Sat, 19 Apr 2025 23:26:29 +0000
Date: Sun, 20 Apr 2025 07:25:58 +0800
From: kernel test robot <lkp@intel.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Sam Protsenko <semen.protsenko@linaro.org>
Subject: drivers/tty/serial/samsung_tty.c:1391:48: warning: '%d' directive
 writing between 1 and 3 bytes into a region of size 2
Message-ID: <202504200747.91Ja2Gmr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tudor,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1ca0f935a126950c2f0b305a50f31f3b00542b0d
commit: 6e1e48b6ef2613ff4c28a34f7a57c29a4367ad87 tty: serial: samsung: shrink the clock selection to 8 clocks
date:   1 year, 3 months ago
config: csky-randconfig-r053-20231127 (https://download.01.org/0day-ci/archive/20250420/202504200747.91Ja2Gmr-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504200747.91Ja2Gmr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504200747.91Ja2Gmr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/tty/serial/samsung_tty.c: In function 's3c24xx_serial_set_termios':
>> drivers/tty/serial/samsung_tty.c:1391:48: warning: '%d' directive writing between 1 and 3 bytes into a region of size 2 [-Wformat-overflow=]
    1391 |                 sprintf(clkname, "clk_uart_baud%d", cnt);
         |                                                ^~
   In function 's3c24xx_serial_getclk',
       inlined from 's3c24xx_serial_set_termios' at drivers/tty/serial/samsung_tty.c:1492:9:
   drivers/tty/serial/samsung_tty.c:1391:34: note: directive argument in the range [0, 254]
    1391 |                 sprintf(clkname, "clk_uart_baud%d", cnt);
         |                                  ^~~~~~~~~~~~~~~~~
   drivers/tty/serial/samsung_tty.c:1391:17: note: 'sprintf' output between 15 and 17 bytes into a destination of size 15
    1391 |                 sprintf(clkname, "clk_uart_baud%d", cnt);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/samsung_tty.c: In function 's3c24xx_serial_init_port':
   drivers/tty/serial/samsung_tty.c:1789:49: warning: '%d' directive writing between 1 and 3 bytes into a region of size 2 [-Wformat-overflow=]
    1789 |                 sprintf(clk_name, "clk_uart_baud%d", clk_num);
         |                                                 ^~
   In function 's3c24xx_serial_enable_baudclk',
       inlined from 's3c24xx_serial_init_port' at drivers/tty/serial/samsung_tty.c:1895:8:
   drivers/tty/serial/samsung_tty.c:1789:35: note: directive argument in the range [0, 254]
    1789 |                 sprintf(clk_name, "clk_uart_baud%d", clk_num);
         |                                   ^~~~~~~~~~~~~~~~~
   drivers/tty/serial/samsung_tty.c:1789:17: note: 'sprintf' output between 15 and 17 bytes into a destination of size 15
    1789 |                 sprintf(clk_name, "clk_uart_baud%d", clk_num);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1391 drivers/tty/serial/samsung_tty.c

5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1372  
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1373  static unsigned int s3c24xx_serial_getclk(struct s3c24xx_uart_port *ourport,
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1374  			unsigned int req_baud, struct clk **best_clk,
6e1e48b6ef2613 drivers/tty/serial/samsung_tty.c Tudor Ambarus       2024-01-19  1375  			u8 *clk_num)
b497549a035c2a drivers/serial/samsung.c         Ben Dooks           2008-07-03  1376  {
97a6cfe8115b04 drivers/tty/serial/samsung_tty.c Krzysztof Kozlowski 2022-03-08  1377  	const struct s3c24xx_uart_info *info = ourport->info;
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1378  	struct clk *clk;
b497549a035c2a drivers/serial/samsung.c         Ben Dooks           2008-07-03  1379  	unsigned long rate;
6e1e48b6ef2613 drivers/tty/serial/samsung_tty.c Tudor Ambarus       2024-01-19  1380  	unsigned int baud, quot, best_quot = 0;
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1381  	char clkname[MAX_CLK_NAME_LENGTH];
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1382  	int calc_deviation, deviation = (1 << 30) - 1;
6e1e48b6ef2613 drivers/tty/serial/samsung_tty.c Tudor Ambarus       2024-01-19  1383  	u8 cnt;
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1384  
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1385  	for (cnt = 0; cnt < info->num_clks; cnt++) {
7d31676a8d91dd drivers/tty/serial/samsung_tty.c Jonathan Bakker     2020-05-08  1386  		/* Keep selected clock if provided */
7d31676a8d91dd drivers/tty/serial/samsung_tty.c Jonathan Bakker     2020-05-08  1387  		if (ourport->cfg->clk_sel &&
7d31676a8d91dd drivers/tty/serial/samsung_tty.c Jonathan Bakker     2020-05-08  1388  			!(ourport->cfg->clk_sel & (1 << cnt)))
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1389  			continue;
b497549a035c2a drivers/serial/samsung.c         Ben Dooks           2008-07-03  1390  
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24 @1391  		sprintf(clkname, "clk_uart_baud%d", cnt);
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1392  		clk = clk_get(ourport->port.dev, clkname);
7cd88831feb03c drivers/tty/serial/samsung.c     Kyoungil Kim        2012-05-20  1393  		if (IS_ERR(clk))
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1394  			continue;
b497549a035c2a drivers/serial/samsung.c         Ben Dooks           2008-07-03  1395  
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1396  		rate = clk_get_rate(clk);
a9c09546e903f1 drivers/tty/serial/samsung_tty.c Christophe JAILLET  2023-06-10  1397  		if (!rate) {
a9c09546e903f1 drivers/tty/serial/samsung_tty.c Christophe JAILLET  2023-06-10  1398  			dev_err(ourport->port.dev,
a9c09546e903f1 drivers/tty/serial/samsung_tty.c Christophe JAILLET  2023-06-10  1399  				"Failed to get clock rate for %s.\n", clkname);
a9c09546e903f1 drivers/tty/serial/samsung_tty.c Christophe JAILLET  2023-06-10  1400  			clk_put(clk);
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1401  			continue;
a9c09546e903f1 drivers/tty/serial/samsung_tty.c Christophe JAILLET  2023-06-10  1402  		}
090f848da00008 drivers/serial/samsung.c         Ben Dooks           2008-12-12  1403  
090f848da00008 drivers/serial/samsung.c         Ben Dooks           2008-12-12  1404  		if (ourport->info->has_divslot) {
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1405  			unsigned long div = rate / req_baud;
090f848da00008 drivers/serial/samsung.c         Ben Dooks           2008-12-12  1406  
090f848da00008 drivers/serial/samsung.c         Ben Dooks           2008-12-12  1407  			/* The UDIVSLOT register on the newer UARTs allows us to
090f848da00008 drivers/serial/samsung.c         Ben Dooks           2008-12-12  1408  			 * get a divisor adjustment of 1/16th on the baud clock.
090f848da00008 drivers/serial/samsung.c         Ben Dooks           2008-12-12  1409  			 *
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1410  			 * We don't keep the UDIVSLOT value (the 16ths we
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1411  			 * calculated by not multiplying the baud by 16) as it
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1412  			 * is easy enough to recalculate.
090f848da00008 drivers/serial/samsung.c         Ben Dooks           2008-12-12  1413  			 */
090f848da00008 drivers/serial/samsung.c         Ben Dooks           2008-12-12  1414  
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1415  			quot = div / 16;
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1416  			baud = rate / div;
090f848da00008 drivers/serial/samsung.c         Ben Dooks           2008-12-12  1417  		} else {
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1418  			quot = (rate + (8 * req_baud)) / (16 * req_baud);
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1419  			baud = rate / (quot * 16);
090f848da00008 drivers/serial/samsung.c         Ben Dooks           2008-12-12  1420  		}
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1421  		quot--;
b497549a035c2a drivers/serial/samsung.c         Ben Dooks           2008-07-03  1422  
f3710f5e9e1a68 drivers/tty/serial/samsung_tty.c Christophe JAILLET  2023-06-10  1423  		calc_deviation = abs(req_baud - baud);
b497549a035c2a drivers/serial/samsung.c         Ben Dooks           2008-07-03  1424  
b497549a035c2a drivers/serial/samsung.c         Ben Dooks           2008-07-03  1425  		if (calc_deviation < deviation) {
832e231cff4761 drivers/tty/serial/samsung_tty.c Christophe JAILLET  2023-06-10  1426  			/*
832e231cff4761 drivers/tty/serial/samsung_tty.c Christophe JAILLET  2023-06-10  1427  			 * If we find a better clk, release the previous one, if
832e231cff4761 drivers/tty/serial/samsung_tty.c Christophe JAILLET  2023-06-10  1428  			 * any.
832e231cff4761 drivers/tty/serial/samsung_tty.c Christophe JAILLET  2023-06-10  1429  			 */
832e231cff4761 drivers/tty/serial/samsung_tty.c Christophe JAILLET  2023-06-10  1430  			if (!IS_ERR(*best_clk))
832e231cff4761 drivers/tty/serial/samsung_tty.c Christophe JAILLET  2023-06-10  1431  				clk_put(*best_clk);
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1432  			*best_clk = clk;
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1433  			best_quot = quot;
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1434  			*clk_num = cnt;
b497549a035c2a drivers/serial/samsung.c         Ben Dooks           2008-07-03  1435  			deviation = calc_deviation;
832e231cff4761 drivers/tty/serial/samsung_tty.c Christophe JAILLET  2023-06-10  1436  		} else {
832e231cff4761 drivers/tty/serial/samsung_tty.c Christophe JAILLET  2023-06-10  1437  			clk_put(clk);
b497549a035c2a drivers/serial/samsung.c         Ben Dooks           2008-07-03  1438  		}
b497549a035c2a drivers/serial/samsung.c         Ben Dooks           2008-07-03  1439  	}
b497549a035c2a drivers/serial/samsung.c         Ben Dooks           2008-07-03  1440  
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1441  	return best_quot;
b497549a035c2a drivers/serial/samsung.c         Ben Dooks           2008-07-03  1442  }
b497549a035c2a drivers/serial/samsung.c         Ben Dooks           2008-07-03  1443  

:::::: The code at line 1391 was first introduced by commit
:::::: 5f5a7a5578c5885201cf9c85856f023fe8b81765 serial: samsung: switch to clkdev based clock lookup

:::::: TO: Thomas Abraham <thomas.abraham@linaro.org>
:::::: CC: Kukjin Kim <kgene.kim@samsung.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
