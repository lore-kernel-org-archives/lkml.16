Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F9A28FFCB
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 11:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746791170; cv=none; b=uXJF+KhWbSlK+67/mL+YokiFaoYr/5NhHJlE0MTFTethkybpb0L34yLqB6BIy8p8yhmLKiWmmk5LmptSh6HDP929BjQE0SAp72R8WoFUsJojJNtnC0w7K+dYQO/5hWQkXM/sZky45O4F6UTvPYeIl4P1cReFubF8xkgBlPt4gr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746791170; c=relaxed/simple;
	bh=pOD2nkSCnsdYvD6AIZ7pAB9pYT8Q1KZUsIaF5ls5jpY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UGwQBljZ3M58dSGTFbkNs1nNlYHseVPWTpj26shJ8wRgdDj4RLvAEGjrqifAg19/TJ2QvH2WjMgoA+OZpXsQuUaa9oMBdMR9lzbwbp5UC9bFFXB46btgpxJGB9NPOqpu8unLrQscrYjJ2u54pwE7qpR7nF5brNtOmJBBujhy6Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FoK0OvcS; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FoK0OvcS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746791169; x=1778327169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pOD2nkSCnsdYvD6AIZ7pAB9pYT8Q1KZUsIaF5ls5jpY=;
  b=FoK0OvcSdWMon5waOAdCcq7M14woIJOkDqtd9YlyNxw+540QzeRj/Ye4
   JMRVIYdbt9nriItvgGS1GDWOefj4xEXpo/5P8BUQ/CZcy12Vt4llwF8vW
   +OsM0suVpwKBA3j/4h6v3oOYvOt5FlTX1N4ftHzuFJl3PQmQ1szsoleyr
   OsfeIUd/E77bkqJzVrnCMagHY6p88/h+czF8dyR8S7xS3qRaFfaQ2Z6vN
   AkHObsyjyfYIJNiFuuZ2qzwbx/v8ARlG8Ct9h5V2meFIV++vyoDNVYQ1p
   RMxzDPL3ZSojerTHlDOOSPHjo6f0Jur5BOR4jYy4RUk4/cvUCAoz8ev5o
   g==;
X-CSE-ConnectionGUID: RgmTbPxzSCWDk4tflap7hA==
X-CSE-MsgGUID: dWogiE0bQ0O/pzUUJvw/yA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48774446"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="48774446"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 04:46:08 -0700
X-CSE-ConnectionGUID: U7sqcpeIRl+0LkM0IZAXFw==
X-CSE-MsgGUID: LaKeih6yR0iXQTBQ98LNGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="141372924"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 May 2025 04:46:07 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDMB2-000C1t-1Y;
	Fri, 09 May 2025 11:46:04 +0000
Date: Fri, 9 May 2025 19:45:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Simon Horman <horms@kernel.org>
Subject: net/8021q/vlan.c:235:46: warning: '%.4i' directive output may be
 truncated writing 4 bytes into a region of size between 0 and 15
Message-ID: <202505091920.9jwiNmDX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9c69f88849045499e8ad114e5e13dbb3c85f4443
commit: 2034d90ae41ae93e30d492ebcf1f06f97a9cfba6 net: treat possible_net_t net pointer as an RCU one and add read_pnet_rcu()
date:   1 year, 7 months ago
config: csky-randconfig-002-20250106 (https://download.01.org/0day-ci/archive/20250509/202505091920.9jwiNmDX-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505091920.9jwiNmDX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505091920.9jwiNmDX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/8021q/vlan.c: In function 'register_vlan_device':
   net/8021q/vlan.c:247:46: warning: '%i' directive output may be truncated writing between 1 and 4 bytes into a region of size between 0 and 15 [-Wformat-truncation=]
     247 |                 snprintf(name, IFNAMSIZ, "%s.%i", real_dev->name, vlan_id);
         |                                              ^~
   net/8021q/vlan.c:247:42: note: directive argument in the range [0, 4094]
     247 |                 snprintf(name, IFNAMSIZ, "%s.%i", real_dev->name, vlan_id);
         |                                          ^~~~~~~
   net/8021q/vlan.c:247:17: note: 'snprintf' output between 3 and 21 bytes into a destination of size 16
     247 |                 snprintf(name, IFNAMSIZ, "%s.%i", real_dev->name, vlan_id);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/8021q/vlan.c:235:46: warning: '%.4i' directive output may be truncated writing 4 bytes into a region of size between 0 and 15 [-Wformat-truncation=]
     235 |                 snprintf(name, IFNAMSIZ, "%s.%.4i", real_dev->name, vlan_id);
         |                                              ^~~~
   net/8021q/vlan.c:235:42: note: directive argument in the range [0, 4094]
     235 |                 snprintf(name, IFNAMSIZ, "%s.%.4i", real_dev->name, vlan_id);
         |                                          ^~~~~~~~~
   net/8021q/vlan.c:235:17: note: 'snprintf' output between 6 and 21 bytes into a destination of size 16
     235 |                 snprintf(name, IFNAMSIZ, "%s.%.4i", real_dev->name, vlan_id);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +235 net/8021q/vlan.c

e89fe42cd03c8f Patrick McHardy   2007-06-13  210  
c1d3ee9925ca71 Patrick McHardy   2007-06-13  211  /*  Attach a VLAN device to a mac address (ie Ethernet Card).
2ae0bf69b716d0 Patrick McHardy   2007-06-13  212   *  Returns 0 if the device was created or a negative error code otherwise.
c1d3ee9925ca71 Patrick McHardy   2007-06-13  213   */
9bb8582efb5555 Patrick McHardy   2008-07-08  214  static int register_vlan_device(struct net_device *real_dev, u16 vlan_id)
c1d3ee9925ca71 Patrick McHardy   2007-06-13  215  {
c1d3ee9925ca71 Patrick McHardy   2007-06-13  216  	struct net_device *new_dev;
0c0667a8548ef2 Wang Sheng-Hui    2013-08-03  217  	struct vlan_dev_priv *vlan;
7a17a2f79f54a9 Pavel Emelyanov   2008-04-16  218  	struct net *net = dev_net(real_dev);
7a17a2f79f54a9 Pavel Emelyanov   2008-04-16  219  	struct vlan_net *vn = net_generic(net, vlan_net_id);
c1d3ee9925ca71 Patrick McHardy   2007-06-13  220  	char name[IFNAMSIZ];
2ae0bf69b716d0 Patrick McHardy   2007-06-13  221  	int err;
c1d3ee9925ca71 Patrick McHardy   2007-06-13  222  
9bb8582efb5555 Patrick McHardy   2008-07-08  223  	if (vlan_id >= VLAN_VID_MASK)
2ae0bf69b716d0 Patrick McHardy   2007-06-13  224  		return -ERANGE;
c1d3ee9925ca71 Patrick McHardy   2007-06-13  225  
33fa382324ebd1 David Ahern       2018-05-17  226  	err = vlan_check_real_dev(real_dev, htons(ETH_P_8021Q), vlan_id,
33fa382324ebd1 David Ahern       2018-05-17  227  				  NULL);
2ae0bf69b716d0 Patrick McHardy   2007-06-13  228  	if (err < 0)
2ae0bf69b716d0 Patrick McHardy   2007-06-13  229  		return err;
c1d3ee9925ca71 Patrick McHardy   2007-06-13  230  
^1da177e4c3f41 Linus Torvalds    2005-04-16  231  	/* Gotta set up the fields for the device. */
7a17a2f79f54a9 Pavel Emelyanov   2008-04-16  232  	switch (vn->name_type) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  233  	case VLAN_NAME_TYPE_RAW_PLUS_VID:
^1da177e4c3f41 Linus Torvalds    2005-04-16  234  		/* name will look like:	 eth1.0005 */
9bb8582efb5555 Patrick McHardy   2008-07-08 @235  		snprintf(name, IFNAMSIZ, "%s.%.4i", real_dev->name, vlan_id);
^1da177e4c3f41 Linus Torvalds    2005-04-16  236  		break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  237  	case VLAN_NAME_TYPE_PLUS_VID_NO_PAD:
^1da177e4c3f41 Linus Torvalds    2005-04-16  238  		/* Put our vlan.VID in the name.
^1da177e4c3f41 Linus Torvalds    2005-04-16  239  		 * Name will look like:	 vlan5
^1da177e4c3f41 Linus Torvalds    2005-04-16  240  		 */
9bb8582efb5555 Patrick McHardy   2008-07-08  241  		snprintf(name, IFNAMSIZ, "vlan%i", vlan_id);
^1da177e4c3f41 Linus Torvalds    2005-04-16  242  		break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  243  	case VLAN_NAME_TYPE_RAW_PLUS_VID_NO_PAD:
^1da177e4c3f41 Linus Torvalds    2005-04-16  244  		/* Put our vlan.VID in the name.
^1da177e4c3f41 Linus Torvalds    2005-04-16  245  		 * Name will look like:	 eth0.5
^1da177e4c3f41 Linus Torvalds    2005-04-16  246  		 */
9bb8582efb5555 Patrick McHardy   2008-07-08 @247  		snprintf(name, IFNAMSIZ, "%s.%i", real_dev->name, vlan_id);
^1da177e4c3f41 Linus Torvalds    2005-04-16  248  		break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  249  	case VLAN_NAME_TYPE_PLUS_VID:
^1da177e4c3f41 Linus Torvalds    2005-04-16  250  		/* Put our vlan.VID in the name.
^1da177e4c3f41 Linus Torvalds    2005-04-16  251  		 * Name will look like:	 vlan0005
^1da177e4c3f41 Linus Torvalds    2005-04-16  252  		 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  253  	default:
9bb8582efb5555 Patrick McHardy   2008-07-08  254  		snprintf(name, IFNAMSIZ, "vlan%.4i", vlan_id);
3ff50b7997fe06 Stephen Hemminger 2007-04-20  255  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  256  
c835a677331495 Tom Gundersen     2014-07-14  257  	new_dev = alloc_netdev(sizeof(struct vlan_dev_priv), name,
c835a677331495 Tom Gundersen     2014-07-14  258  			       NET_NAME_UNKNOWN, vlan_setup);
5dd8d1e9eb8b51 Arjan van de Ven  2006-07-03  259  
^1da177e4c3f41 Linus Torvalds    2005-04-16  260  	if (new_dev == NULL)
2ae0bf69b716d0 Patrick McHardy   2007-06-13  261  		return -ENOBUFS;
^1da177e4c3f41 Linus Torvalds    2005-04-16  262  
65d292a2ef2df6 Pavel Emelyanov   2008-04-16  263  	dev_net_set(new_dev, net);
^1da177e4c3f41 Linus Torvalds    2005-04-16  264  	/* need 4 bytes for extra VLAN header info,
^1da177e4c3f41 Linus Torvalds    2005-04-16  265  	 * hope the underlying device can handle it.
^1da177e4c3f41 Linus Torvalds    2005-04-16  266  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  267  	new_dev->mtu = real_dev->mtu;
^1da177e4c3f41 Linus Torvalds    2005-04-16  268  
0c0667a8548ef2 Wang Sheng-Hui    2013-08-03  269  	vlan = vlan_dev_priv(new_dev);
0c0667a8548ef2 Wang Sheng-Hui    2013-08-03  270  	vlan->vlan_proto = htons(ETH_P_8021Q);
0c0667a8548ef2 Wang Sheng-Hui    2013-08-03  271  	vlan->vlan_id = vlan_id;
0c0667a8548ef2 Wang Sheng-Hui    2013-08-03  272  	vlan->real_dev = real_dev;
0c0667a8548ef2 Wang Sheng-Hui    2013-08-03  273  	vlan->dent = NULL;
0c0667a8548ef2 Wang Sheng-Hui    2013-08-03  274  	vlan->flags = VLAN_FLAG_REORDER_HDR;
^1da177e4c3f41 Linus Torvalds    2005-04-16  275  
07b5b17e157b70 Patrick McHardy   2007-06-13  276  	new_dev->rtnl_link_ops = &vlan_link_ops;
42ab19ee902929 David Ahern       2017-10-04  277  	err = register_vlan_dev(new_dev, NULL);
2ae0bf69b716d0 Patrick McHardy   2007-06-13  278  	if (err < 0)
42429aaee5eb44 Patrick McHardy   2007-06-13  279  		goto out_free_newdev;
^1da177e4c3f41 Linus Torvalds    2005-04-16  280  
2ae0bf69b716d0 Patrick McHardy   2007-06-13  281  	return 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  282  
^1da177e4c3f41 Linus Torvalds    2005-04-16  283  out_free_newdev:
^1da177e4c3f41 Linus Torvalds    2005-04-16  284  	free_netdev(new_dev);
2ae0bf69b716d0 Patrick McHardy   2007-06-13  285  	return err;
^1da177e4c3f41 Linus Torvalds    2005-04-16  286  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  287  

:::::: The code at line 235 was first introduced by commit
:::::: 9bb8582efb555521c7eec595ebd34e835ddc34b8 vlan: TCI related type and naming cleanups

:::::: TO: Patrick McHardy <kaber@trash.net>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
