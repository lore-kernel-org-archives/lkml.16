Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D3A2459E0
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 22:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751322560; cv=none; b=Z6T0S/xDOagz9O9KsdrgVxfT6V1JGa/WJUTbNZr6KQwrEDHU+UTSDriaGfetSgKzLhTK67XohsSwL7WSxFnooTqmwAg9dGPImx8i6ZXzY0GPN5sLe+EZOUY3pWtwrAA+yU0FReNu25OJXHg+agZpU5EFdmnizG0CVGUoNBFbh9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751322560; c=relaxed/simple;
	bh=TH6VDimW9Tj/0bjuzSN5fQ5HqY/XfIdb4j7Fmht/4dw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L/LmQTuRNXdIpzjg1Mj7WxL6BMbuZpWkZv63JTY9Vq+mC4kkC+wADAhraIVRb/PdG0oeQcKl1OOS3SDqwe+IvUEEtyupk/VJH5/ONjb61MYfnFBc4rvO2N3I/OXlvU0/PYM4qpqWCniirIjrNRG/ISdYXxzbKl5hcUWCJJ7nPMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=erp7m6Ku; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="erp7m6Ku"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751322558; x=1782858558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TH6VDimW9Tj/0bjuzSN5fQ5HqY/XfIdb4j7Fmht/4dw=;
  b=erp7m6KulWnmF6ndgZXrqq+jN5WXKu09+a32JQhhnYrMPTZpbTAPacAW
   Zv5ktY96cO2VzeC0d3gOwUDwp0tTFHOuuo9yT6pYES1VYNw3Ka6lWjYpt
   5pTwv8i2SxHPveczbs4DrYB4ytLwMHkGNcMNAoOWXNNn2xjZadgjErf9P
   A0BckrdyCmOj7mlVA+Fghs5RBiLV+mXbvuCBZhmzpDTRrW7YoSCJzvlgZ
   1qy8DpC6Q9/ykhwRHzB4g0po/CDKV4omWxmWYwEQDsa3Zhd1ErZtEsf0V
   K2OBtl5YJ68ngdVsEg0NZdzpmyVh5pW6OCkykqwRKfWAlBikDv1ABU/dr
   w==;
X-CSE-ConnectionGUID: jDlsguYdRZKIjuSjyAchIg==
X-CSE-MsgGUID: vZtajL0KQ8yCVWUmHvJepg==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="76111537"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="76111537"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 15:29:18 -0700
X-CSE-ConnectionGUID: eNKms1soTT6rcbcJRa92tA==
X-CSE-MsgGUID: 9EzHB/m2T7unHKUfLSiD0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="153063620"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 30 Jun 2025 15:29:16 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWMzx-000ZQI-1X;
	Mon, 30 Jun 2025 22:29:13 +0000
Date: Tue, 1 Jul 2025 06:29:03 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Zhang <markzhang@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Leon Romanovsky <leon@kernel.org>
Subject: drivers/infiniband/core/nldev.c:2459:12: warning: stack frame size
 (1032) exceeds limit (1024) in 'nldev_stat_get_counter_status_doit'
Message-ID: <202507010618.ffCC4JWZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af
commit: 060c642b2ab8b40b39f9db99c1d14c7d19ba507f RDMA/nldev: Add support to add/delete a sub IB device through netlink
date:   12 months ago
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250701/202507010618.ffCC4JWZ-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507010618.ffCC4JWZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507010618.ffCC4JWZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/infiniband/core/nldev.c:35:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/nldev.c:1251:12: warning: stack frame size (1048) exceeds limit (1024) in 'nldev_port_get_dumpit' [-Wframe-larger-than]
    1251 | static int nldev_port_get_dumpit(struct sk_buff *skb,
         |            ^
   drivers/infiniband/core/nldev.c:2402:12: warning: stack frame size (1048) exceeds limit (1024) in 'nldev_stat_get_doit' [-Wframe-larger-than]
    2402 | static int nldev_stat_get_doit(struct sk_buff *skb, struct nlmsghdr *nlh,
         |            ^
>> drivers/infiniband/core/nldev.c:2459:12: warning: stack frame size (1032) exceeds limit (1024) in 'nldev_stat_get_counter_status_doit' [-Wframe-larger-than]
    2459 | static int nldev_stat_get_counter_status_doit(struct sk_buff *skb,
         |            ^
   drivers/infiniband/core/nldev.c:1536:12: warning: stack frame size (1032) exceeds limit (1024) in 'res_get_common_dumpit' [-Wframe-larger-than]
    1536 | static int res_get_common_dumpit(struct sk_buff *skb,
         |            ^
   9 warnings generated.


vim +/nldev_stat_get_counter_status_doit +2459 drivers/infiniband/core/nldev.c

c4ffee7c9bdba7 Mark Zhang    2019-07-02  2458  
7301d0a9834c7f Aharon Landau 2021-10-08 @2459  static int nldev_stat_get_counter_status_doit(struct sk_buff *skb,
7301d0a9834c7f Aharon Landau 2021-10-08  2460  					      struct nlmsghdr *nlh,
7301d0a9834c7f Aharon Landau 2021-10-08  2461  					      struct netlink_ext_ack *extack)
7301d0a9834c7f Aharon Landau 2021-10-08  2462  {
7301d0a9834c7f Aharon Landau 2021-10-08  2463  	struct nlattr *tb[RDMA_NLDEV_ATTR_MAX], *table, *entry;
7301d0a9834c7f Aharon Landau 2021-10-08  2464  	struct rdma_hw_stats *stats;
7301d0a9834c7f Aharon Landau 2021-10-08  2465  	struct ib_device *device;
7301d0a9834c7f Aharon Landau 2021-10-08  2466  	struct sk_buff *msg;
7301d0a9834c7f Aharon Landau 2021-10-08  2467  	u32 devid, port;
7301d0a9834c7f Aharon Landau 2021-10-08  2468  	int ret, i;
7301d0a9834c7f Aharon Landau 2021-10-08  2469  
7301d0a9834c7f Aharon Landau 2021-10-08  2470  	ret = nlmsg_parse(nlh, 0, tb, RDMA_NLDEV_ATTR_MAX - 1,
7301d0a9834c7f Aharon Landau 2021-10-08  2471  			  nldev_policy, extack);
7301d0a9834c7f Aharon Landau 2021-10-08  2472  	if (ret || !tb[RDMA_NLDEV_ATTR_DEV_INDEX] ||
7301d0a9834c7f Aharon Landau 2021-10-08  2473  	    !tb[RDMA_NLDEV_ATTR_PORT_INDEX])
7301d0a9834c7f Aharon Landau 2021-10-08  2474  		return -EINVAL;
7301d0a9834c7f Aharon Landau 2021-10-08  2475  
7301d0a9834c7f Aharon Landau 2021-10-08  2476  	devid = nla_get_u32(tb[RDMA_NLDEV_ATTR_DEV_INDEX]);
7301d0a9834c7f Aharon Landau 2021-10-08  2477  	device = ib_device_get_by_index(sock_net(skb->sk), devid);
7301d0a9834c7f Aharon Landau 2021-10-08  2478  	if (!device)
7301d0a9834c7f Aharon Landau 2021-10-08  2479  		return -EINVAL;
7301d0a9834c7f Aharon Landau 2021-10-08  2480  
7301d0a9834c7f Aharon Landau 2021-10-08  2481  	port = nla_get_u32(tb[RDMA_NLDEV_ATTR_PORT_INDEX]);
7301d0a9834c7f Aharon Landau 2021-10-08  2482  	if (!rdma_is_port_valid(device, port)) {
7301d0a9834c7f Aharon Landau 2021-10-08  2483  		ret = -EINVAL;
7301d0a9834c7f Aharon Landau 2021-10-08  2484  		goto err;
7301d0a9834c7f Aharon Landau 2021-10-08  2485  	}
7301d0a9834c7f Aharon Landau 2021-10-08  2486  
7301d0a9834c7f Aharon Landau 2021-10-08  2487  	stats = ib_get_hw_stats_port(device, port);
7301d0a9834c7f Aharon Landau 2021-10-08  2488  	if (!stats) {
7301d0a9834c7f Aharon Landau 2021-10-08  2489  		ret = -EINVAL;
7301d0a9834c7f Aharon Landau 2021-10-08  2490  		goto err;
7301d0a9834c7f Aharon Landau 2021-10-08  2491  	}
7301d0a9834c7f Aharon Landau 2021-10-08  2492  
7301d0a9834c7f Aharon Landau 2021-10-08  2493  	msg = nlmsg_new(NLMSG_DEFAULT_SIZE, GFP_KERNEL);
7301d0a9834c7f Aharon Landau 2021-10-08  2494  	if (!msg) {
7301d0a9834c7f Aharon Landau 2021-10-08  2495  		ret = -ENOMEM;
7301d0a9834c7f Aharon Landau 2021-10-08  2496  		goto err;
7301d0a9834c7f Aharon Landau 2021-10-08  2497  	}
7301d0a9834c7f Aharon Landau 2021-10-08  2498  
7301d0a9834c7f Aharon Landau 2021-10-08  2499  	nlh = nlmsg_put(
7301d0a9834c7f Aharon Landau 2021-10-08  2500  		msg, NETLINK_CB(skb).portid, nlh->nlmsg_seq,
7301d0a9834c7f Aharon Landau 2021-10-08  2501  		RDMA_NL_GET_TYPE(RDMA_NL_NLDEV, RDMA_NLDEV_CMD_STAT_GET_STATUS),
7301d0a9834c7f Aharon Landau 2021-10-08  2502  		0, 0);
7301d0a9834c7f Aharon Landau 2021-10-08  2503  
7301d0a9834c7f Aharon Landau 2021-10-08  2504  	ret = -EMSGSIZE;
67e6272d53386f Or Har-Toov   2022-11-28  2505  	if (!nlh || fill_nldev_handle(msg, device) ||
7301d0a9834c7f Aharon Landau 2021-10-08  2506  	    nla_put_u32(msg, RDMA_NLDEV_ATTR_PORT_INDEX, port))
7301d0a9834c7f Aharon Landau 2021-10-08  2507  		goto err_msg;
7301d0a9834c7f Aharon Landau 2021-10-08  2508  
7301d0a9834c7f Aharon Landau 2021-10-08  2509  	table = nla_nest_start(msg, RDMA_NLDEV_ATTR_STAT_HWCOUNTERS);
7301d0a9834c7f Aharon Landau 2021-10-08  2510  	if (!table)
7301d0a9834c7f Aharon Landau 2021-10-08  2511  		goto err_msg;
7301d0a9834c7f Aharon Landau 2021-10-08  2512  
7301d0a9834c7f Aharon Landau 2021-10-08  2513  	mutex_lock(&stats->lock);
7301d0a9834c7f Aharon Landau 2021-10-08  2514  	for (i = 0; i < stats->num_counters; i++) {
7301d0a9834c7f Aharon Landau 2021-10-08  2515  		entry = nla_nest_start(msg,
7301d0a9834c7f Aharon Landau 2021-10-08  2516  				       RDMA_NLDEV_ATTR_STAT_HWCOUNTER_ENTRY);
7301d0a9834c7f Aharon Landau 2021-10-08  2517  		if (!entry)
7301d0a9834c7f Aharon Landau 2021-10-08  2518  			goto err_msg_table;
7301d0a9834c7f Aharon Landau 2021-10-08  2519  
7301d0a9834c7f Aharon Landau 2021-10-08  2520  		if (nla_put_string(msg,
7301d0a9834c7f Aharon Landau 2021-10-08  2521  				   RDMA_NLDEV_ATTR_STAT_HWCOUNTER_ENTRY_NAME,
7301d0a9834c7f Aharon Landau 2021-10-08  2522  				   stats->descs[i].name) ||
7301d0a9834c7f Aharon Landau 2021-10-08  2523  		    nla_put_u32(msg, RDMA_NLDEV_ATTR_STAT_HWCOUNTER_INDEX, i))
7301d0a9834c7f Aharon Landau 2021-10-08  2524  			goto err_msg_entry;
7301d0a9834c7f Aharon Landau 2021-10-08  2525  
7301d0a9834c7f Aharon Landau 2021-10-08  2526  		if ((stats->descs[i].flags & IB_STAT_FLAG_OPTIONAL) &&
7301d0a9834c7f Aharon Landau 2021-10-08  2527  		    (nla_put_u8(msg, RDMA_NLDEV_ATTR_STAT_HWCOUNTER_DYNAMIC,
7301d0a9834c7f Aharon Landau 2021-10-08  2528  				!test_bit(i, stats->is_disabled))))
7301d0a9834c7f Aharon Landau 2021-10-08  2529  			goto err_msg_entry;
7301d0a9834c7f Aharon Landau 2021-10-08  2530  
7301d0a9834c7f Aharon Landau 2021-10-08  2531  		nla_nest_end(msg, entry);
7301d0a9834c7f Aharon Landau 2021-10-08  2532  	}
7301d0a9834c7f Aharon Landau 2021-10-08  2533  	mutex_unlock(&stats->lock);
7301d0a9834c7f Aharon Landau 2021-10-08  2534  
7301d0a9834c7f Aharon Landau 2021-10-08  2535  	nla_nest_end(msg, table);
7301d0a9834c7f Aharon Landau 2021-10-08  2536  	nlmsg_end(msg, nlh);
7301d0a9834c7f Aharon Landau 2021-10-08  2537  	ib_device_put(device);
7301d0a9834c7f Aharon Landau 2021-10-08  2538  	return rdma_nl_unicast(sock_net(skb->sk), msg, NETLINK_CB(skb).portid);
7301d0a9834c7f Aharon Landau 2021-10-08  2539  
7301d0a9834c7f Aharon Landau 2021-10-08  2540  err_msg_entry:
7301d0a9834c7f Aharon Landau 2021-10-08  2541  	nla_nest_cancel(msg, entry);
7301d0a9834c7f Aharon Landau 2021-10-08  2542  err_msg_table:
7301d0a9834c7f Aharon Landau 2021-10-08  2543  	mutex_unlock(&stats->lock);
7301d0a9834c7f Aharon Landau 2021-10-08  2544  	nla_nest_cancel(msg, table);
7301d0a9834c7f Aharon Landau 2021-10-08  2545  err_msg:
7301d0a9834c7f Aharon Landau 2021-10-08  2546  	nlmsg_free(msg);
7301d0a9834c7f Aharon Landau 2021-10-08  2547  err:
7301d0a9834c7f Aharon Landau 2021-10-08  2548  	ib_device_put(device);
7301d0a9834c7f Aharon Landau 2021-10-08  2549  	return ret;
7301d0a9834c7f Aharon Landau 2021-10-08  2550  }
7301d0a9834c7f Aharon Landau 2021-10-08  2551  

:::::: The code at line 2459 was first introduced by commit
:::::: 7301d0a9834c7f1f0c91c1f0a46c7b191b1fd0da RDMA/nldev: Add support to get status of all counters

:::::: TO: Aharon Landau <aharonl@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
