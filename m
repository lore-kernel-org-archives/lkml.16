Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6720D2D3229
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 17:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750701599; cv=none; b=oZrupqxo+Q7hJxH+PupSYqpVK6id4McbdWt3ZmScxRbmkq1yKseA/r8kxZlo2yGG5uTMH0x/hqTdGyiqY8069iVGFBp+QM6exomrxijExRqKMYepsUTCK1RTljwd8t2UqvttIf1ZbONEDXqIMXa50bBrY4dzSVY19M+iRAPV/k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750701599; c=relaxed/simple;
	bh=h5lBrHU3tPhyxcn3NyOanp5uK2HuROK4hGOLZNBNWTU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AVdpyU5wJbMEj0qvB2yk1z8GVkIe/fvYwvWkU3fqUFCS0rRC5EZv3T4FJqz4XKSnxrNrpyfawlVK/UFc1IjtihEb7syYZ0wUYpQIaVZxedyWZ4C63CuIcHbSs4C/wuZwrwr02BcPGSkSbtZDw5yPCqXIpbsgZz/ohHTPg22BM+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NpJdAxcx; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NpJdAxcx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750701598; x=1782237598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h5lBrHU3tPhyxcn3NyOanp5uK2HuROK4hGOLZNBNWTU=;
  b=NpJdAxcx799MDVjArQQASyR1QoDr+pQwPWuldtXX2n+89Sxv0AGpGGkI
   hYlpd2u6f0Z1GP+Dz7rmIJwkKzoJFAzGkwjmGVm7euEjU2/HtYvHgVamf
   EnI2kaoqcXhMFdagUDWYls/byCZs05ZJdTHgS6Df0yaatZ514t3kPXPlD
   JrQb6O1QATM5fl88YjPAR1ssXXCy3GGtL+CzgjOiqkruUymIe23qrnDlc
   Wayvd6UPM1bpM5F5wPgDZNGlQqmmu5bCWL41PCpG3w8+LYFilsJl6Xm6N
   4S5QciQMH27PSeqB+UVhpeCdunmNj3pxvrCPmecz8oSEzvKz97qGxm8br
   w==;
X-CSE-ConnectionGUID: R5kA9XtUQsauNaTQWuavzw==
X-CSE-MsgGUID: 7ucHjyaVTWyEE47k/aOxRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="70346385"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="70346385"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 10:59:58 -0700
X-CSE-ConnectionGUID: izoGaBvLRbaA4K23v1iYIg==
X-CSE-MsgGUID: jJPYYTY6SuyCqjK4ttdppw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="157454263"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 23 Jun 2025 10:59:55 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTlSS-000PBS-36;
	Mon, 23 Jun 2025 17:59:52 +0000
Date: Tue, 24 Jun 2025 01:59:46 +0800
From: kernel test robot <lkp@intel.com>
To: Bitterblue Smith <rtl8821cerfe2@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Ping-Ke Shih <pkshih@realtek.com>
Subject: drivers/net/wireless/realtek/rtlwifi/rtl8192du/phy.c:2039:6:
 warning: stack frame size (1152) exceeds limit (1024) in
 'rtl92du_phy_iq_calibrate'
Message-ID: <202506240149.jkmuq1B9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bitterblue,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   86731a2a651e58953fc949573895f2fa6d456841
commit: 59ea089dcba3b51769280522fd62696d4d436cbc wifi: rtlwifi: Enable the new rtl8192du driver
date:   1 year, 1 month ago
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20250624/202506240149.jkmuq1B9-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 875b36a8742437b95f623bab1e0332562c7b4b3f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506240149.jkmuq1B9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506240149.jkmuq1B9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/wireless/realtek/rtlwifi/rtl8192du/phy.c:4:
   In file included from drivers/net/wireless/realtek/rtlwifi/rtl8192du/../wifi.h:11:
   In file included from include/linux/etherdevice.h:20:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/powerpc/include/asm/cacheflush.h:7:
   In file included from include/linux/mm.h:2210:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/realtek/rtlwifi/rtl8192du/phy.c:2039:6: warning: stack frame size (1152) exceeds limit (1024) in 'rtl92du_phy_iq_calibrate' [-Wframe-larger-than]
    2039 | void rtl92du_phy_iq_calibrate(struct ieee80211_hw *hw)
         |      ^
   6 warnings generated.


vim +/rtl92du_phy_iq_calibrate +2039 drivers/net/wireless/realtek/rtlwifi/rtl8192du/phy.c

af46caf0515281a Bitterblue Smith 2024-05-23  2038  
af46caf0515281a Bitterblue Smith 2024-05-23 @2039  void rtl92du_phy_iq_calibrate(struct ieee80211_hw *hw)
af46caf0515281a Bitterblue Smith 2024-05-23  2040  {
af46caf0515281a Bitterblue Smith 2024-05-23  2041  	long rege94, rege9c, regea4, regeac, regeb4;
af46caf0515281a Bitterblue Smith 2024-05-23  2042  	bool is12simular, is13simular, is23simular;
af46caf0515281a Bitterblue Smith 2024-05-23  2043  	struct rtl_priv *rtlpriv = rtl_priv(hw);
af46caf0515281a Bitterblue Smith 2024-05-23  2044  	struct rtl_hal *rtlhal = &rtlpriv->rtlhal;
af46caf0515281a Bitterblue Smith 2024-05-23  2045  	long regebc, regec4, regecc, regtmp = 0;
af46caf0515281a Bitterblue Smith 2024-05-23  2046  	struct rtl_phy *rtlphy = &rtlpriv->phy;
af46caf0515281a Bitterblue Smith 2024-05-23  2047  	u8 i, final_candidate, indexforchannel;
af46caf0515281a Bitterblue Smith 2024-05-23  2048  	bool patha_ok, pathb_ok;
af46caf0515281a Bitterblue Smith 2024-05-23  2049  	long result[4][8] = {};
af46caf0515281a Bitterblue Smith 2024-05-23  2050  
af46caf0515281a Bitterblue Smith 2024-05-23  2051  	RTPRINT(rtlpriv, FINIT, INIT_IQK,
af46caf0515281a Bitterblue Smith 2024-05-23  2052  		"IQK:Start!!!channel %d\n", rtlphy->current_channel);
af46caf0515281a Bitterblue Smith 2024-05-23  2053  
af46caf0515281a Bitterblue Smith 2024-05-23  2054  	final_candidate = 0xff;
af46caf0515281a Bitterblue Smith 2024-05-23  2055  	patha_ok = false;
af46caf0515281a Bitterblue Smith 2024-05-23  2056  	pathb_ok = false;
af46caf0515281a Bitterblue Smith 2024-05-23  2057  	is12simular = false;
af46caf0515281a Bitterblue Smith 2024-05-23  2058  	is23simular = false;
af46caf0515281a Bitterblue Smith 2024-05-23  2059  	is13simular = false;
af46caf0515281a Bitterblue Smith 2024-05-23  2060  	RTPRINT(rtlpriv, FINIT, INIT_IQK,
af46caf0515281a Bitterblue Smith 2024-05-23  2061  		"IQK !!!currentband %d\n", rtlhal->current_bandtype);
af46caf0515281a Bitterblue Smith 2024-05-23  2062  
af46caf0515281a Bitterblue Smith 2024-05-23  2063  	for (i = 0; i < 3; i++) {
af46caf0515281a Bitterblue Smith 2024-05-23  2064  		if (rtlhal->current_bandtype == BAND_ON_5G) {
af46caf0515281a Bitterblue Smith 2024-05-23  2065  			_rtl92du_phy_iq_calibrate_5g_normal(hw, result, i);
af46caf0515281a Bitterblue Smith 2024-05-23  2066  		} else if (rtlhal->current_bandtype == BAND_ON_2_4G) {
af46caf0515281a Bitterblue Smith 2024-05-23  2067  			if (IS_92D_SINGLEPHY(rtlhal->version))
af46caf0515281a Bitterblue Smith 2024-05-23  2068  				_rtl92du_phy_iq_calibrate(hw, result, i, true);
af46caf0515281a Bitterblue Smith 2024-05-23  2069  			else
af46caf0515281a Bitterblue Smith 2024-05-23  2070  				_rtl92du_phy_iq_calibrate(hw, result, i, false);
af46caf0515281a Bitterblue Smith 2024-05-23  2071  		}
af46caf0515281a Bitterblue Smith 2024-05-23  2072  
af46caf0515281a Bitterblue Smith 2024-05-23  2073  		if (i == 1) {
af46caf0515281a Bitterblue Smith 2024-05-23  2074  			is12simular = _rtl92du_phy_simularity_compare(hw, result,
af46caf0515281a Bitterblue Smith 2024-05-23  2075  								      0, 1);
af46caf0515281a Bitterblue Smith 2024-05-23  2076  			if (is12simular) {
af46caf0515281a Bitterblue Smith 2024-05-23  2077  				final_candidate = 0;
af46caf0515281a Bitterblue Smith 2024-05-23  2078  				break;
af46caf0515281a Bitterblue Smith 2024-05-23  2079  			}
af46caf0515281a Bitterblue Smith 2024-05-23  2080  		}
af46caf0515281a Bitterblue Smith 2024-05-23  2081  
af46caf0515281a Bitterblue Smith 2024-05-23  2082  		if (i == 2) {
af46caf0515281a Bitterblue Smith 2024-05-23  2083  			is13simular = _rtl92du_phy_simularity_compare(hw, result,
af46caf0515281a Bitterblue Smith 2024-05-23  2084  								      0, 2);
af46caf0515281a Bitterblue Smith 2024-05-23  2085  			if (is13simular) {
af46caf0515281a Bitterblue Smith 2024-05-23  2086  				final_candidate = 0;
af46caf0515281a Bitterblue Smith 2024-05-23  2087  				break;
af46caf0515281a Bitterblue Smith 2024-05-23  2088  			}
af46caf0515281a Bitterblue Smith 2024-05-23  2089  
af46caf0515281a Bitterblue Smith 2024-05-23  2090  			is23simular = _rtl92du_phy_simularity_compare(hw, result,
af46caf0515281a Bitterblue Smith 2024-05-23  2091  								      1, 2);
af46caf0515281a Bitterblue Smith 2024-05-23  2092  			if (is23simular) {
af46caf0515281a Bitterblue Smith 2024-05-23  2093  				final_candidate = 1;
af46caf0515281a Bitterblue Smith 2024-05-23  2094  			} else {
af46caf0515281a Bitterblue Smith 2024-05-23  2095  				for (i = 0; i < 8; i++)
af46caf0515281a Bitterblue Smith 2024-05-23  2096  					regtmp += result[3][i];
af46caf0515281a Bitterblue Smith 2024-05-23  2097  
af46caf0515281a Bitterblue Smith 2024-05-23  2098  				if (regtmp != 0)
af46caf0515281a Bitterblue Smith 2024-05-23  2099  					final_candidate = 3;
af46caf0515281a Bitterblue Smith 2024-05-23  2100  				else
af46caf0515281a Bitterblue Smith 2024-05-23  2101  					final_candidate = 0xFF;
af46caf0515281a Bitterblue Smith 2024-05-23  2102  			}
af46caf0515281a Bitterblue Smith 2024-05-23  2103  		}
af46caf0515281a Bitterblue Smith 2024-05-23  2104  	}
af46caf0515281a Bitterblue Smith 2024-05-23  2105  
af46caf0515281a Bitterblue Smith 2024-05-23  2106  	for (i = 0; i < 4; i++) {
af46caf0515281a Bitterblue Smith 2024-05-23  2107  		rege94 = result[i][0];
af46caf0515281a Bitterblue Smith 2024-05-23  2108  		rege9c = result[i][1];
af46caf0515281a Bitterblue Smith 2024-05-23  2109  		regea4 = result[i][2];
af46caf0515281a Bitterblue Smith 2024-05-23  2110  		regeac = result[i][3];
af46caf0515281a Bitterblue Smith 2024-05-23  2111  		regeb4 = result[i][4];
af46caf0515281a Bitterblue Smith 2024-05-23  2112  		regebc = result[i][5];
af46caf0515281a Bitterblue Smith 2024-05-23  2113  		regec4 = result[i][6];
af46caf0515281a Bitterblue Smith 2024-05-23  2114  		regecc = result[i][7];
af46caf0515281a Bitterblue Smith 2024-05-23  2115  		RTPRINT(rtlpriv, FINIT, INIT_IQK,
af46caf0515281a Bitterblue Smith 2024-05-23  2116  			"IQK: rege94=%lx rege9c=%lx regea4=%lx regeac=%lx regeb4=%lx regebc=%lx regec4=%lx regecc=%lx\n",
af46caf0515281a Bitterblue Smith 2024-05-23  2117  			rege94, rege9c, regea4, regeac, regeb4, regebc, regec4,
af46caf0515281a Bitterblue Smith 2024-05-23  2118  			regecc);
af46caf0515281a Bitterblue Smith 2024-05-23  2119  	}
af46caf0515281a Bitterblue Smith 2024-05-23  2120  
af46caf0515281a Bitterblue Smith 2024-05-23  2121  	if (final_candidate != 0xff) {
af46caf0515281a Bitterblue Smith 2024-05-23  2122  		rege94 = result[final_candidate][0];
af46caf0515281a Bitterblue Smith 2024-05-23  2123  		rtlphy->reg_e94 = rege94;
af46caf0515281a Bitterblue Smith 2024-05-23  2124  		rege9c = result[final_candidate][1];
af46caf0515281a Bitterblue Smith 2024-05-23  2125  		rtlphy->reg_e9c = rege9c;
af46caf0515281a Bitterblue Smith 2024-05-23  2126  		regea4 = result[final_candidate][2];
af46caf0515281a Bitterblue Smith 2024-05-23  2127  		regeac = result[final_candidate][3];
af46caf0515281a Bitterblue Smith 2024-05-23  2128  		regeb4 = result[final_candidate][4];
af46caf0515281a Bitterblue Smith 2024-05-23  2129  		rtlphy->reg_eb4 = regeb4;
af46caf0515281a Bitterblue Smith 2024-05-23  2130  		regebc = result[final_candidate][5];
af46caf0515281a Bitterblue Smith 2024-05-23  2131  		rtlphy->reg_ebc = regebc;
af46caf0515281a Bitterblue Smith 2024-05-23  2132  		regec4 = result[final_candidate][6];
af46caf0515281a Bitterblue Smith 2024-05-23  2133  		regecc = result[final_candidate][7];
af46caf0515281a Bitterblue Smith 2024-05-23  2134  
af46caf0515281a Bitterblue Smith 2024-05-23  2135  		RTPRINT(rtlpriv, FINIT, INIT_IQK,
af46caf0515281a Bitterblue Smith 2024-05-23  2136  			"IQK: final_candidate is %x\n", final_candidate);
af46caf0515281a Bitterblue Smith 2024-05-23  2137  		RTPRINT(rtlpriv, FINIT, INIT_IQK,
af46caf0515281a Bitterblue Smith 2024-05-23  2138  			"IQK: rege94=%lx rege9c=%lx regea4=%lx regeac=%lx regeb4=%lx regebc=%lx regec4=%lx regecc=%lx\n",
af46caf0515281a Bitterblue Smith 2024-05-23  2139  			rege94, rege9c, regea4, regeac, regeb4, regebc, regec4,
af46caf0515281a Bitterblue Smith 2024-05-23  2140  			regecc);
af46caf0515281a Bitterblue Smith 2024-05-23  2141  
af46caf0515281a Bitterblue Smith 2024-05-23  2142  		patha_ok = true;
af46caf0515281a Bitterblue Smith 2024-05-23  2143  		pathb_ok = true;
af46caf0515281a Bitterblue Smith 2024-05-23  2144  	} else {
af46caf0515281a Bitterblue Smith 2024-05-23  2145  		rtlphy->reg_e94 = 0x100;
af46caf0515281a Bitterblue Smith 2024-05-23  2146  		rtlphy->reg_eb4 = 0x100; /* X default value */
af46caf0515281a Bitterblue Smith 2024-05-23  2147  		rtlphy->reg_e9c = 0x0;
af46caf0515281a Bitterblue Smith 2024-05-23  2148  		rtlphy->reg_ebc = 0x0;   /* Y default value */
af46caf0515281a Bitterblue Smith 2024-05-23  2149  	}
af46caf0515281a Bitterblue Smith 2024-05-23  2150  	if (rege94 != 0 /*&& regea4 != 0*/)
af46caf0515281a Bitterblue Smith 2024-05-23  2151  		_rtl92du_phy_patha_fill_iqk_matrix(hw, patha_ok, result,
af46caf0515281a Bitterblue Smith 2024-05-23  2152  						   final_candidate,
af46caf0515281a Bitterblue Smith 2024-05-23  2153  						   regea4 == 0);
af46caf0515281a Bitterblue Smith 2024-05-23  2154  	if (IS_92D_SINGLEPHY(rtlhal->version) &&
af46caf0515281a Bitterblue Smith 2024-05-23  2155  	    regeb4 != 0 /*&& regec4 != 0*/)
af46caf0515281a Bitterblue Smith 2024-05-23  2156  		_rtl92du_phy_pathb_fill_iqk_matrix(hw, pathb_ok, result,
af46caf0515281a Bitterblue Smith 2024-05-23  2157  						   final_candidate,
af46caf0515281a Bitterblue Smith 2024-05-23  2158  						   regec4 == 0);
af46caf0515281a Bitterblue Smith 2024-05-23  2159  
af46caf0515281a Bitterblue Smith 2024-05-23  2160  	if (final_candidate != 0xFF) {
af46caf0515281a Bitterblue Smith 2024-05-23  2161  		indexforchannel =
af46caf0515281a Bitterblue Smith 2024-05-23  2162  			rtl92d_get_rightchnlplace_for_iqk(rtlphy->current_channel);
af46caf0515281a Bitterblue Smith 2024-05-23  2163  
af46caf0515281a Bitterblue Smith 2024-05-23  2164  		for (i = 0; i < IQK_MATRIX_REG_NUM; i++)
af46caf0515281a Bitterblue Smith 2024-05-23  2165  			rtlphy->iqk_matrix[indexforchannel].value[0][i] =
af46caf0515281a Bitterblue Smith 2024-05-23  2166  				result[final_candidate][i];
af46caf0515281a Bitterblue Smith 2024-05-23  2167  
af46caf0515281a Bitterblue Smith 2024-05-23  2168  		rtlphy->iqk_matrix[indexforchannel].iqk_done = true;
af46caf0515281a Bitterblue Smith 2024-05-23  2169  
af46caf0515281a Bitterblue Smith 2024-05-23  2170  		rtl_dbg(rtlpriv, COMP_SCAN | COMP_MLME, DBG_LOUD,
af46caf0515281a Bitterblue Smith 2024-05-23  2171  			"IQK OK indexforchannel %d\n", indexforchannel);
af46caf0515281a Bitterblue Smith 2024-05-23  2172  	}
af46caf0515281a Bitterblue Smith 2024-05-23  2173  }
af46caf0515281a Bitterblue Smith 2024-05-23  2174  

:::::: The code at line 2039 was first introduced by commit
:::::: af46caf0515281a30e119b53afb3083fcc5110a9 wifi: rtlwifi: Add rtl8192du/phy.{c,h}

:::::: TO: Bitterblue Smith <rtl8821cerfe2@gmail.com>
:::::: CC: Ping-Ke Shih <pkshih@realtek.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
