Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C223619BBC
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 04:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739162728; cv=none; b=iSDdgBVdiIpjRUXo6Bqf2+AhzmNDWDRAVoa+KCi6LsXVYt8bXIdWpYpVJzIjsRvv7KbB4FApO32MYLtFpJ/1qqmijggk79f+Kr8kr8W2OT/RJF2MBKFYrNrb5C7c0iYu1iWXYCLI9PFkAAc29eTnH0LfKAcSWwgy+uwoXTBtBts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739162728; c=relaxed/simple;
	bh=gjb+m44JJ4UDwrrQxpTRDnqCI+AlOILzSbuJjlzQacs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nHNNEwO1sLIReNayXSch4IIYMvOTOqrfaws0Rs82q0vt+dKgZv0JHT4MO0+eU1TqjOH1bft6DSOsWpdyq4rVpFHOoKZn9ZB4yyieliTpNxzWOhCyFyZohfZvq9b2fjTKwRZLSKJ8vbvSudgsYEGPJKcMojDOKdQTLa80JLmsdg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wa1Krm/M; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wa1Krm/M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739162726; x=1770698726;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gjb+m44JJ4UDwrrQxpTRDnqCI+AlOILzSbuJjlzQacs=;
  b=Wa1Krm/MS3M3aHb7C0yaVITY25D62tpaakcv2z6+aOdR9M1NH+Dg3zYW
   nzE4yt6VyK9x5p12/M23tr3eF3eXEIUXJ017PmQ5rbvzbMhH9xCucVtGY
   Gnk+dHWU+ZTDM4PJ/Uy6cQ+KhkzOAr7q0Mmjjgx8jYocC+LqaSDTClvdF
   QTHXKIddZ8LCqXrTDVsYpOgUt6EG/IUPlksLpMxYVDttVdkXJ/tmkwJk9
   aCvdoKzaEEL+dn4yp9aCrG1XHnUgUu0fr/qLYvXMBAENl3UUsZr51MzGV
   GyAuvAcpsNJmnRT2xejdvfErBLPSVyunoiDAAslbV11jDSM7XigiJX45d
   g==;
X-CSE-ConnectionGUID: 6pnO5y7TTdChfd+Tm8Ta+g==
X-CSE-MsgGUID: T+bgz4HfQKuMsq14jt8RGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="49965094"
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="49965094"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 20:45:25 -0800
X-CSE-ConnectionGUID: oFYKzI/SSQGbhlJJRN+kWg==
X-CSE-MsgGUID: v9sF2lXuT9S1gmCAoAQ3VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116147952"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Feb 2025 20:45:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thLfd-0012I3-2O;
	Mon, 10 Feb 2025 04:45:21 +0000
Date: Mon, 10 Feb 2025 12:44:35 +0800
From: kernel test robot <lkp@intel.com>
To: Waiman Long <longman@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: net/8021q/vlan.c:241:46: warning: '%.4i' directive output may be
 truncated writing between 4 and 5 bytes into a region of size between 0 and
 15
Message-ID: <202502101253.TDZbCYh6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Waiman,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a64dcfb451e254085a7daee5fe51bf22959d52d3
commit: 925da92ba5cb0c82d07cdd5049a07e40f54e9c44 rcu: Avoid unneeded function call in rcu_read_unlock()
date:   3 years, 5 months ago
config: sparc-randconfig-r122-20240116 (https://download.01.org/0day-ci/archive/20250210/202502101253.TDZbCYh6-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250210/202502101253.TDZbCYh6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502101253.TDZbCYh6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/8021q/vlan.c: In function 'vlan_ioctl_handler':
   net/8021q/vlan.c:253:46: warning: '%i' directive output may be truncated writing between 1 and 5 bytes into a region of size between 0 and 15 [-Wformat-truncation=]
     253 |                 snprintf(name, IFNAMSIZ, "%s.%i", real_dev->name, vlan_id);
         |                                              ^~
   In function 'register_vlan_device',
       inlined from 'vlan_ioctl_handler' at net/8021q/vlan.c:628:9:
   net/8021q/vlan.c:253:42: note: directive argument in the range [0, 65535]
     253 |                 snprintf(name, IFNAMSIZ, "%s.%i", real_dev->name, vlan_id);
         |                                          ^~~~~~~
   net/8021q/vlan.c:253:17: note: 'snprintf' output between 3 and 22 bytes into a destination of size 16
     253 |                 snprintf(name, IFNAMSIZ, "%s.%i", real_dev->name, vlan_id);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/8021q/vlan.c: In function 'vlan_ioctl_handler':
>> net/8021q/vlan.c:241:46: warning: '%.4i' directive output may be truncated writing between 4 and 5 bytes into a region of size between 0 and 15 [-Wformat-truncation=]
     241 |                 snprintf(name, IFNAMSIZ, "%s.%.4i", real_dev->name, vlan_id);
         |                                              ^~~~
   In function 'register_vlan_device',
       inlined from 'vlan_ioctl_handler' at net/8021q/vlan.c:628:9:
   net/8021q/vlan.c:241:42: note: directive argument in the range [0, 65535]
     241 |                 snprintf(name, IFNAMSIZ, "%s.%.4i", real_dev->name, vlan_id);
         |                                          ^~~~~~~~~
   net/8021q/vlan.c:241:17: note: 'snprintf' output between 6 and 22 bytes into a destination of size 16
     241 |                 snprintf(name, IFNAMSIZ, "%s.%.4i", real_dev->name, vlan_id);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +241 net/8021q/vlan.c

e89fe42cd03c8f Patrick McHardy   2007-06-13  216  
c1d3ee9925ca71 Patrick McHardy   2007-06-13  217  /*  Attach a VLAN device to a mac address (ie Ethernet Card).
2ae0bf69b716d0 Patrick McHardy   2007-06-13  218   *  Returns 0 if the device was created or a negative error code otherwise.
c1d3ee9925ca71 Patrick McHardy   2007-06-13  219   */
9bb8582efb5555 Patrick McHardy   2008-07-08  220  static int register_vlan_device(struct net_device *real_dev, u16 vlan_id)
c1d3ee9925ca71 Patrick McHardy   2007-06-13  221  {
c1d3ee9925ca71 Patrick McHardy   2007-06-13  222  	struct net_device *new_dev;
0c0667a8548ef2 Wang Sheng-Hui    2013-08-03  223  	struct vlan_dev_priv *vlan;
7a17a2f79f54a9 Pavel Emelyanov   2008-04-16  224  	struct net *net = dev_net(real_dev);
7a17a2f79f54a9 Pavel Emelyanov   2008-04-16  225  	struct vlan_net *vn = net_generic(net, vlan_net_id);
c1d3ee9925ca71 Patrick McHardy   2007-06-13  226  	char name[IFNAMSIZ];
2ae0bf69b716d0 Patrick McHardy   2007-06-13  227  	int err;
c1d3ee9925ca71 Patrick McHardy   2007-06-13  228  
9bb8582efb5555 Patrick McHardy   2008-07-08  229  	if (vlan_id >= VLAN_VID_MASK)
2ae0bf69b716d0 Patrick McHardy   2007-06-13  230  		return -ERANGE;
c1d3ee9925ca71 Patrick McHardy   2007-06-13  231  
33fa382324ebd1 David Ahern       2018-05-17  232  	err = vlan_check_real_dev(real_dev, htons(ETH_P_8021Q), vlan_id,
33fa382324ebd1 David Ahern       2018-05-17  233  				  NULL);
2ae0bf69b716d0 Patrick McHardy   2007-06-13  234  	if (err < 0)
2ae0bf69b716d0 Patrick McHardy   2007-06-13  235  		return err;
c1d3ee9925ca71 Patrick McHardy   2007-06-13  236  
^1da177e4c3f41 Linus Torvalds    2005-04-16  237  	/* Gotta set up the fields for the device. */
7a17a2f79f54a9 Pavel Emelyanov   2008-04-16  238  	switch (vn->name_type) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  239  	case VLAN_NAME_TYPE_RAW_PLUS_VID:
^1da177e4c3f41 Linus Torvalds    2005-04-16  240  		/* name will look like:	 eth1.0005 */
9bb8582efb5555 Patrick McHardy   2008-07-08 @241  		snprintf(name, IFNAMSIZ, "%s.%.4i", real_dev->name, vlan_id);
^1da177e4c3f41 Linus Torvalds    2005-04-16  242  		break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  243  	case VLAN_NAME_TYPE_PLUS_VID_NO_PAD:
^1da177e4c3f41 Linus Torvalds    2005-04-16  244  		/* Put our vlan.VID in the name.
^1da177e4c3f41 Linus Torvalds    2005-04-16  245  		 * Name will look like:	 vlan5
^1da177e4c3f41 Linus Torvalds    2005-04-16  246  		 */
9bb8582efb5555 Patrick McHardy   2008-07-08  247  		snprintf(name, IFNAMSIZ, "vlan%i", vlan_id);
^1da177e4c3f41 Linus Torvalds    2005-04-16  248  		break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  249  	case VLAN_NAME_TYPE_RAW_PLUS_VID_NO_PAD:
^1da177e4c3f41 Linus Torvalds    2005-04-16  250  		/* Put our vlan.VID in the name.
^1da177e4c3f41 Linus Torvalds    2005-04-16  251  		 * Name will look like:	 eth0.5
^1da177e4c3f41 Linus Torvalds    2005-04-16  252  		 */
9bb8582efb5555 Patrick McHardy   2008-07-08  253  		snprintf(name, IFNAMSIZ, "%s.%i", real_dev->name, vlan_id);
^1da177e4c3f41 Linus Torvalds    2005-04-16  254  		break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  255  	case VLAN_NAME_TYPE_PLUS_VID:
^1da177e4c3f41 Linus Torvalds    2005-04-16  256  		/* Put our vlan.VID in the name.
^1da177e4c3f41 Linus Torvalds    2005-04-16  257  		 * Name will look like:	 vlan0005
^1da177e4c3f41 Linus Torvalds    2005-04-16  258  		 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  259  	default:
9bb8582efb5555 Patrick McHardy   2008-07-08  260  		snprintf(name, IFNAMSIZ, "vlan%.4i", vlan_id);
3ff50b7997fe06 Stephen Hemminger 2007-04-20  261  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  262  
c835a677331495 Tom Gundersen     2014-07-14  263  	new_dev = alloc_netdev(sizeof(struct vlan_dev_priv), name,
c835a677331495 Tom Gundersen     2014-07-14  264  			       NET_NAME_UNKNOWN, vlan_setup);
5dd8d1e9eb8b51 Arjan van de Ven  2006-07-03  265  
^1da177e4c3f41 Linus Torvalds    2005-04-16  266  	if (new_dev == NULL)
2ae0bf69b716d0 Patrick McHardy   2007-06-13  267  		return -ENOBUFS;
^1da177e4c3f41 Linus Torvalds    2005-04-16  268  
65d292a2ef2df6 Pavel Emelyanov   2008-04-16  269  	dev_net_set(new_dev, net);
^1da177e4c3f41 Linus Torvalds    2005-04-16  270  	/* need 4 bytes for extra VLAN header info,
^1da177e4c3f41 Linus Torvalds    2005-04-16  271  	 * hope the underlying device can handle it.
^1da177e4c3f41 Linus Torvalds    2005-04-16  272  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  273  	new_dev->mtu = real_dev->mtu;
^1da177e4c3f41 Linus Torvalds    2005-04-16  274  
0c0667a8548ef2 Wang Sheng-Hui    2013-08-03  275  	vlan = vlan_dev_priv(new_dev);
0c0667a8548ef2 Wang Sheng-Hui    2013-08-03  276  	vlan->vlan_proto = htons(ETH_P_8021Q);
0c0667a8548ef2 Wang Sheng-Hui    2013-08-03  277  	vlan->vlan_id = vlan_id;
0c0667a8548ef2 Wang Sheng-Hui    2013-08-03  278  	vlan->real_dev = real_dev;
0c0667a8548ef2 Wang Sheng-Hui    2013-08-03  279  	vlan->dent = NULL;
0c0667a8548ef2 Wang Sheng-Hui    2013-08-03  280  	vlan->flags = VLAN_FLAG_REORDER_HDR;
^1da177e4c3f41 Linus Torvalds    2005-04-16  281  
07b5b17e157b70 Patrick McHardy   2007-06-13  282  	new_dev->rtnl_link_ops = &vlan_link_ops;
42ab19ee902929 David Ahern       2017-10-04  283  	err = register_vlan_dev(new_dev, NULL);
2ae0bf69b716d0 Patrick McHardy   2007-06-13  284  	if (err < 0)
42429aaee5eb44 Patrick McHardy   2007-06-13  285  		goto out_free_newdev;
^1da177e4c3f41 Linus Torvalds    2005-04-16  286  
2ae0bf69b716d0 Patrick McHardy   2007-06-13  287  	return 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  288  
^1da177e4c3f41 Linus Torvalds    2005-04-16  289  out_free_newdev:
^1da177e4c3f41 Linus Torvalds    2005-04-16  290  	free_netdev(new_dev);
2ae0bf69b716d0 Patrick McHardy   2007-06-13  291  	return err;
^1da177e4c3f41 Linus Torvalds    2005-04-16  292  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  293  

:::::: The code at line 241 was first introduced by commit
:::::: 9bb8582efb555521c7eec595ebd34e835ddc34b8 vlan: TCI related type and naming cleanups

:::::: TO: Patrick McHardy <kaber@trash.net>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
