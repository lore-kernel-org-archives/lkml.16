Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE69317ADE8
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 11:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739013167; cv=none; b=VCqK6p+rAavwyz4WgFkHDks4wl+Y+f7vVPM75ek8QSuKF6kXvqJLW0/MKmOBB1Kx5KmKhQZwhNt9hrTIGoxWTyuxF7yqqPvBhN3Cg40fFBTbFOaDCgN2mmoxL+GST8FLPB61nmOQNLhuawy4BOWu7mgZtsfygvPVb+9V091gguI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739013167; c=relaxed/simple;
	bh=77rQGx21Ayeb1DDaG2cGncdZFL2SzphziRDR+LrIUHg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q+IC3rvCyQy480dOhyzHcZtX76nlClgX/vIjRemDNqAiOdkyiLCNCi6EhRfTWWQ2MLHVwkk/3cY9t8+QdaAj2+qiWERSPqb5Xtxek6PQhq8az9HkGcQMYClqojj9wColbaynzVYDAPCpHoxrhLSJ0Jxf2HJG3Equf3Nz0tqRctA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pw11ENmp; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pw11ENmp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739013165; x=1770549165;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=77rQGx21Ayeb1DDaG2cGncdZFL2SzphziRDR+LrIUHg=;
  b=Pw11ENmpfoBP+4EAA4F/yf8uz9+Q7gyhMmlTZr9mCKRBmbUAdHZ9pKpF
   scUAcg7pGW4XvwEoPM55TZiWSe3Y/vWVshhLkqCUbkDjoLnEUlNCBNrNb
   Rzp6J+0SfaYqv0uXJymnTr0XW0mz9wy5G9SVTmfqjX92mXU5wXtX/DsYa
   TR+Th6qy7G5+G/bDckMIbQ1OeLXEwYx9oaZlne1jPss97nVns1OogxW13
   4V3AEeEKyySGy9EvaZ9nXDCCbZQ/6GxjL+nDxXLv/nM+ijA3GY96d/MH4
   AemC88Zgy+Wh4pB6HFBL0cGF4aK3YDSwiPqBsRM8xQ0ZLusmp+zZLK9MK
   A==;
X-CSE-ConnectionGUID: Xmi9NLeYRDu2NLBJJUHn7A==
X-CSE-MsgGUID: 3IMhzLp1S/mndosai2zGzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51081232"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="51081232"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 03:12:44 -0800
X-CSE-ConnectionGUID: AW1hzXltQXOTHoPNMxlJOg==
X-CSE-MsgGUID: qNHqHV1CSBC1OQsTn5m9bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="112270374"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Feb 2025 03:12:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgilM-000ztF-2v;
	Sat, 08 Feb 2025 11:12:40 +0000
Date: Sat, 8 Feb 2025 19:12:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20250203 6/16]
 drivers/net/wireless/intel/iwlwifi/mvm/d3.c:2163:2: error: call to
 '__compiletime_assert_1138' declared with 'error' attribute: BUILD_BUG_ON
 failed: conf->keylen < WLAN_KEY_LEN_GCMP_256
Message-ID: <202502081807.8dh4fSjz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20250203
head:   c8a61127eedf61fcbf8d3f34301d29a782b9eeb0
commit: 8bfdf37e1eeb4f469702361a8c511f40f6c6e486 [6/16] wifi: iwlwifi: mvm: Use __counted_by() and avoid -Wfamnae warnings
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20250208/202502081807.8dh4fSjz-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 6807164500e9920638e2ab0cdb4bf8321d24f8eb)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502081807.8dh4fSjz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502081807.8dh4fSjz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/wireless/intel/iwlwifi/mvm/d3.c:7:
   In file included from include/linux/etherdevice.h:20:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/riscv/include/asm/cacheflush.h:9:
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
>> drivers/net/wireless/intel/iwlwifi/mvm/d3.c:2163:2: error: call to '__compiletime_assert_1138' declared with 'error' attribute: BUILD_BUG_ON failed: conf->keylen < WLAN_KEY_LEN_GCMP_256
    2163 |         BUILD_BUG_ON(conf->keylen < WLAN_KEY_LEN_GCMP_256);
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:542:2: note: expanded from macro 'compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:530:2: note: expanded from macro '_compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:523:4: note: expanded from macro '__compiletime_assert'
     523 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:167:1: note: expanded from here
     167 | __compiletime_assert_1138
         | ^
>> drivers/net/wireless/intel/iwlwifi/mvm/d3.c:2162:2: error: call to '__compiletime_assert_1137' declared with 'error' attribute: BUILD_BUG_ON failed: conf->keylen < WLAN_KEY_LEN_CCMP
    2162 |         BUILD_BUG_ON(conf->keylen < WLAN_KEY_LEN_CCMP);
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:542:2: note: expanded from macro 'compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:530:2: note: expanded from macro '_compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:523:4: note: expanded from macro '__compiletime_assert'
     523 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:163:1: note: expanded from here
     163 | __compiletime_assert_1137
         | ^
   3 warnings and 2 errors generated.


vim +2163 drivers/net/wireless/intel/iwlwifi/mvm/d3.c

  2148	
  2149	static bool iwl_mvm_gtk_rekey(struct iwl_wowlan_status_data *status,
  2150				      struct ieee80211_vif *vif,
  2151				      struct iwl_mvm *mvm, u32 gtk_cipher)
  2152	{
  2153		int i, j;
  2154		struct ieee80211_key_conf *key;
  2155		DEFINE_FLEX(struct ieee80211_key_conf, conf, key, keylen,
  2156			    WOWLAN_KEY_MAX_SIZE);
  2157		int link_id = vif->active_links ? __ffs(vif->active_links) : -1;
  2158	
  2159		conf->cipher = gtk_cipher;
  2160	
  2161		BUILD_BUG_ON(WLAN_KEY_LEN_CCMP != WLAN_KEY_LEN_GCMP);
> 2162		BUILD_BUG_ON(conf->keylen < WLAN_KEY_LEN_CCMP);
> 2163		BUILD_BUG_ON(conf->keylen < WLAN_KEY_LEN_GCMP_256);
  2164		BUILD_BUG_ON(conf->keylen < WLAN_KEY_LEN_TKIP);
  2165		BUILD_BUG_ON(conf->keylen < sizeof(status->gtk[0].key));
  2166	
  2167		switch (gtk_cipher) {
  2168		case WLAN_CIPHER_SUITE_CCMP:
  2169		case WLAN_CIPHER_SUITE_GCMP:
  2170			conf->keylen = WLAN_KEY_LEN_CCMP;
  2171			break;
  2172		case WLAN_CIPHER_SUITE_GCMP_256:
  2173			conf->keylen = WLAN_KEY_LEN_GCMP_256;
  2174			break;
  2175		case WLAN_CIPHER_SUITE_TKIP:
  2176			conf->keylen = WLAN_KEY_LEN_TKIP;
  2177			break;
  2178		default:
  2179			WARN_ON(1);
  2180		}
  2181	
  2182		for (i = 0; i < ARRAY_SIZE(status->gtk); i++) {
  2183			if (!status->gtk[i].len)
  2184				continue;
  2185	
  2186			conf->keyidx = status->gtk[i].id;
  2187			IWL_DEBUG_WOWLAN(mvm,
  2188					 "Received from FW GTK cipher %d, key index %d\n",
  2189					 conf->cipher, conf->keyidx);
  2190			memcpy(conf->key, status->gtk[i].key,
  2191			       sizeof(status->gtk[i].key));
  2192	
  2193			key = ieee80211_gtk_rekey_add(vif, conf, link_id);
  2194			if (IS_ERR(key))
  2195				return false;
  2196	
  2197			for (j = 0; j < ARRAY_SIZE(status->gtk_seq); j++) {
  2198				if (!status->gtk_seq[j].valid ||
  2199				    status->gtk_seq[j].key_id != key->keyidx)
  2200					continue;
  2201				iwl_mvm_set_key_rx_seq_idx(key, status, j);
  2202				break;
  2203			}
  2204			WARN_ON(j == ARRAY_SIZE(status->gtk_seq));
  2205		}
  2206	
  2207		return true;
  2208	}
  2209	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
