Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FE08F5A
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 02:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743216487; cv=none; b=rAzdHvSSAV90BZLBb/YFLEvnzU1Trllpd7YDTuaOIcVUQIfMR3gB88Il5hXgo4jJ7UqUg5c0ViGA+u+frBZaMbn2UYPsa6uE6lVC91vNi2PwhQxjBGqeN3lpkJnRM3BKSDar3Dnms54EI4evyn9tG8Ml368rk3uwj7LnISzTckE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743216487; c=relaxed/simple;
	bh=EDYG4zRvkdH/KzsY2QmjYFwURAqnv8xw9ek6Kew5GGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=br6mf8uuot/CiB6L7yF+ALVmKGxUkZkLk9yWMn1abZFC/shtzwyTuKJhHbZNJ66WsvADDS9trh7YivyWEKyg4fW3rKlOcXnzotSVGidQBRwv3OMAGuzCWSHkPcDjuArGR68szR7FBb17Lwl9bOYuSyNOYdbeoi7sSuXf3oy0+d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EHn+opqu; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EHn+opqu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743216484; x=1774752484;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EDYG4zRvkdH/KzsY2QmjYFwURAqnv8xw9ek6Kew5GGU=;
  b=EHn+opquKa4dRtb4XAI5A8Ctvuoz0buafF2m6s4VBjDhF+GDYK0xWAJs
   43IZsi0DNgYuySHkU6aerYusRj5zz6gF1wQa7NhClAgWSPKXNYqX9bJtS
   MLZzxJ5tSkQDSMoC9VXeW6UqfWoDMUNvZvoMKgp3o2IxOS8T1h8CnIqig
   wfkPJM6QV8wgqvbWrcZbOAlkJ8Kt+J1lN+WihIrSmw0x5O6LJJnakk7je
   fjzRfhxQ+15uqQm6BdHsvI149aKEenCamv6DpmjhhAyWDwgmmDocJyC4t
   y6VV3jey4xZcibJYUBdVZkLPhAmxKMxBOvZvbzGxg+0pVM2kUsdlYitdT
   Q==;
X-CSE-ConnectionGUID: UQwJClesREWca1qloAtN8A==
X-CSE-MsgGUID: qZO11FgbQNi6qGN+fJXu3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="55235493"
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="55235493"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 19:48:04 -0700
X-CSE-ConnectionGUID: 3tECzbuhSTOIowdi/Eizkw==
X-CSE-MsgGUID: SrZtT6CpTyKIxWH3gjU1RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="125838908"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 28 Mar 2025 19:48:02 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyMEo-0007rO-13;
	Sat, 29 Mar 2025 02:47:58 +0000
Date: Sat, 29 Mar 2025 10:47:31 +0800
From: kernel test robot <lkp@intel.com>
To: nancyenos <nicymimz@gmail.com>, gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev,
	nancyenos <nicymimz@gmail.com>
Subject: Re: [PATCH] staging: octeon: Fix unused macro Argument 'x'
Message-ID: <202503291001.v9aaXwZc-lkp@intel.com>
References: <20250325100952.2956-1-nicymimz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325100952.2956-1-nicymimz@gmail.com>

Hi nancyenos,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/nancyenos/staging-octeon-Fix-unused-macro-Argument-x/20250325-181353
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20250325100952.2956-1-nicymimz%40gmail.com
patch subject: [PATCH] staging: octeon: Fix unused macro Argument 'x'
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20250329/202503291001.v9aaXwZc-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503291001.v9aaXwZc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503291001.v9aaXwZc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/staging/octeon/octeon-ethernet.h:41,
                    from drivers/staging/octeon/ethernet.c:23:
   drivers/staging/octeon/ethernet.c: In function 'cvm_oct_common_change_mtu':
>> drivers/staging/octeon/ethernet.c:258:37: error: 'OCTEON_CN3XXX' undeclared (first use in this function)
     258 |                 if (OCTEON_IS_MODEL(OCTEON_CN3XXX) ||
         |                                     ^~~~~~~~~~~~~
   drivers/staging/octeon/octeon-stubs.h:11:36: note: in definition of macro 'OCTEON_IS_MODEL'
      11 | #define OCTEON_IS_MODEL(x) ((void)(x), 0)
         |                                    ^
   drivers/staging/octeon/ethernet.c:258:37: note: each undeclared identifier is reported only once for each function it appears in
     258 |                 if (OCTEON_IS_MODEL(OCTEON_CN3XXX) ||
         |                                     ^~~~~~~~~~~~~
   drivers/staging/octeon/octeon-stubs.h:11:36: note: in definition of macro 'OCTEON_IS_MODEL'
      11 | #define OCTEON_IS_MODEL(x) ((void)(x), 0)
         |                                    ^
   drivers/staging/octeon/octeon-stubs.h:11:38: warning: left-hand operand of comma expression has no effect [-Wunused-value]
      11 | #define OCTEON_IS_MODEL(x) ((void)(x), 0)
         |                                      ^
   drivers/staging/octeon/ethernet.c:258:21: note: in expansion of macro 'OCTEON_IS_MODEL'
     258 |                 if (OCTEON_IS_MODEL(OCTEON_CN3XXX) ||
         |                     ^~~~~~~~~~~~~~~
>> drivers/staging/octeon/ethernet.c:259:37: error: 'OCTEON_CN58XX' undeclared (first use in this function)
     259 |                     OCTEON_IS_MODEL(OCTEON_CN58XX)) {
         |                                     ^~~~~~~~~~~~~
   drivers/staging/octeon/octeon-stubs.h:11:36: note: in definition of macro 'OCTEON_IS_MODEL'
      11 | #define OCTEON_IS_MODEL(x) ((void)(x), 0)
         |                                    ^
   drivers/staging/octeon/octeon-stubs.h:11:38: warning: left-hand operand of comma expression has no effect [-Wunused-value]
      11 | #define OCTEON_IS_MODEL(x) ((void)(x), 0)
         |                                      ^
   drivers/staging/octeon/ethernet.c:259:21: note: in expansion of macro 'OCTEON_IS_MODEL'
     259 |                     OCTEON_IS_MODEL(OCTEON_CN58XX)) {
         |                     ^~~~~~~~~~~~~~~
   drivers/staging/octeon/ethernet.c: In function 'cvm_oct_common_open':
>> drivers/staging/octeon/ethernet.c:469:32: error: 'OCTEON_FEATURE_PKND' undeclared (first use in this function)
     469 |         if (octeon_has_feature(OCTEON_FEATURE_PKND))
         |                                ^~~~~~~~~~~~~~~~~~~
   drivers/staging/octeon/octeon-stubs.h:12:39: note: in definition of macro 'octeon_has_feature'
      12 | #define octeon_has_feature(x) ((void)(x), 0)
         |                                       ^
   drivers/staging/octeon/octeon-stubs.h:12:41: warning: left-hand operand of comma expression has no effect [-Wunused-value]
      12 | #define octeon_has_feature(x) ((void)(x), 0)
         |                                         ^
   drivers/staging/octeon/ethernet.c:469:13: note: in expansion of macro 'octeon_has_feature'
     469 |         if (octeon_has_feature(OCTEON_FEATURE_PKND))
         |             ^~~~~~~~~~~~~~~~~~
   drivers/staging/octeon/ethernet.c: In function 'cvm_oct_probe':
>> drivers/staging/octeon/ethernet.c:725:53: error: 'OCTEON_CN68XX' undeclared (first use in this function)
     725 |                                 if (OCTEON_IS_MODEL(OCTEON_CN68XX))
         |                                                     ^~~~~~~~~~~~~
   drivers/staging/octeon/octeon-stubs.h:11:36: note: in definition of macro 'OCTEON_IS_MODEL'
      11 | #define OCTEON_IS_MODEL(x) ((void)(x), 0)
         |                                    ^
   drivers/staging/octeon/octeon-stubs.h:11:38: warning: left-hand operand of comma expression has no effect [-Wunused-value]
      11 | #define OCTEON_IS_MODEL(x) ((void)(x), 0)
         |                                      ^
   drivers/staging/octeon/ethernet.c:725:37: note: in expansion of macro 'OCTEON_IS_MODEL'
     725 |                                 if (OCTEON_IS_MODEL(OCTEON_CN68XX))
         |                                     ^~~~~~~~~~~~~~~
--
   In file included from drivers/staging/octeon/octeon-ethernet.h:41,
                    from drivers/staging/octeon/ethernet-rx.c:26:
   drivers/staging/octeon/ethernet-rx.c: In function 'cvm_oct_check_rcv_error':
>> drivers/staging/octeon/ethernet-rx.c:67:32: error: 'OCTEON_FEATURE_PKND' undeclared (first use in this function)
      67 |         if (octeon_has_feature(OCTEON_FEATURE_PKND))
         |                                ^~~~~~~~~~~~~~~~~~~
   drivers/staging/octeon/octeon-stubs.h:12:39: note: in definition of macro 'octeon_has_feature'
      12 | #define octeon_has_feature(x) ((void)(x), 0)
         |                                       ^
   drivers/staging/octeon/ethernet-rx.c:67:32: note: each undeclared identifier is reported only once for each function it appears in
      67 |         if (octeon_has_feature(OCTEON_FEATURE_PKND))
         |                                ^~~~~~~~~~~~~~~~~~~
   drivers/staging/octeon/octeon-stubs.h:12:39: note: in definition of macro 'octeon_has_feature'
      12 | #define octeon_has_feature(x) ((void)(x), 0)
         |                                       ^
   drivers/staging/octeon/octeon-stubs.h:12:41: warning: left-hand operand of comma expression has no effect [-Wunused-value]
      12 | #define octeon_has_feature(x) ((void)(x), 0)
         |                                         ^
   drivers/staging/octeon/ethernet-rx.c:67:13: note: in expansion of macro 'octeon_has_feature'
      67 |         if (octeon_has_feature(OCTEON_FEATURE_PKND))
         |             ^~~~~~~~~~~~~~~~~~
   drivers/staging/octeon/ethernet-rx.c: In function 'cvm_oct_poll':
>> drivers/staging/octeon/ethernet-rx.c:201:29: error: 'OCTEON_CN68XX' undeclared (first use in this function)
     201 |         if (OCTEON_IS_MODEL(OCTEON_CN68XX)) {
         |                             ^~~~~~~~~~~~~
   drivers/staging/octeon/octeon-stubs.h:11:36: note: in definition of macro 'OCTEON_IS_MODEL'
      11 | #define OCTEON_IS_MODEL(x) ((void)(x), 0)
         |                                    ^
   drivers/staging/octeon/octeon-stubs.h:11:38: warning: left-hand operand of comma expression has no effect [-Wunused-value]
      11 | #define OCTEON_IS_MODEL(x) ((void)(x), 0)
         |                                      ^
   drivers/staging/octeon/ethernet-rx.c:201:13: note: in expansion of macro 'OCTEON_IS_MODEL'
     201 |         if (OCTEON_IS_MODEL(OCTEON_CN68XX)) {
         |             ^~~~~~~~~~~~~~~
   drivers/staging/octeon/octeon-stubs.h:11:38: warning: left-hand operand of comma expression has no effect [-Wunused-value]
      11 | #define OCTEON_IS_MODEL(x) ((void)(x), 0)
         |                                      ^
   drivers/staging/octeon/ethernet-rx.c:233:29: note: in expansion of macro 'OCTEON_IS_MODEL'
     233 |                         if (OCTEON_IS_MODEL(OCTEON_CN68XX)) {
         |                             ^~~~~~~~~~~~~~~
   drivers/staging/octeon/ethernet-rx.c:267:40: error: 'OCTEON_FEATURE_PKND' undeclared (first use in this function)
     267 |                 if (octeon_has_feature(OCTEON_FEATURE_PKND))
         |                                        ^~~~~~~~~~~~~~~~~~~
   drivers/staging/octeon/octeon-stubs.h:12:39: note: in definition of macro 'octeon_has_feature'
      12 | #define octeon_has_feature(x) ((void)(x), 0)
         |                                       ^
   drivers/staging/octeon/octeon-stubs.h:12:41: warning: left-hand operand of comma expression has no effect [-Wunused-value]
      12 | #define octeon_has_feature(x) ((void)(x), 0)
         |                                         ^
   drivers/staging/octeon/ethernet-rx.c:267:21: note: in expansion of macro 'octeon_has_feature'
     267 |                 if (octeon_has_feature(OCTEON_FEATURE_PKND))
         |                     ^~~~~~~~~~~~~~~~~~
   drivers/staging/octeon/octeon-stubs.h:11:38: warning: left-hand operand of comma expression has no effect [-Wunused-value]
      11 | #define OCTEON_IS_MODEL(x) ((void)(x), 0)
         |                                      ^
   drivers/staging/octeon/ethernet-rx.c:389:13: note: in expansion of macro 'OCTEON_IS_MODEL'
     389 |         if (OCTEON_IS_MODEL(OCTEON_CN68XX)) {
         |             ^~~~~~~~~~~~~~~
   drivers/staging/octeon/ethernet-rx.c: In function 'cvm_oct_rx_initialize':
   drivers/staging/octeon/ethernet-rx.c:489:37: error: 'OCTEON_CN68XX' undeclared (first use in this function)
     489 |                 if (OCTEON_IS_MODEL(OCTEON_CN68XX)) {
         |                                     ^~~~~~~~~~~~~
   drivers/staging/octeon/octeon-stubs.h:11:36: note: in definition of macro 'OCTEON_IS_MODEL'
      11 | #define OCTEON_IS_MODEL(x) ((void)(x), 0)
         |                                    ^
   drivers/staging/octeon/octeon-stubs.h:11:38: warning: left-hand operand of comma expression has no effect [-Wunused-value]
      11 | #define OCTEON_IS_MODEL(x) ((void)(x), 0)
         |                                      ^
   drivers/staging/octeon/ethernet-rx.c:489:21: note: in expansion of macro 'OCTEON_IS_MODEL'
     489 |                 if (OCTEON_IS_MODEL(OCTEON_CN68XX)) {
         |                     ^~~~~~~~~~~~~~~
   drivers/staging/octeon/ethernet-rx.c: In function 'cvm_oct_rx_shutdown':
   drivers/staging/octeon/ethernet-rx.c:532:37: error: 'OCTEON_CN68XX' undeclared (first use in this function)
     532 |                 if (OCTEON_IS_MODEL(OCTEON_CN68XX))
         |                                     ^~~~~~~~~~~~~
   drivers/staging/octeon/octeon-stubs.h:11:36: note: in definition of macro 'OCTEON_IS_MODEL'
      11 | #define OCTEON_IS_MODEL(x) ((void)(x), 0)
         |                                    ^
   drivers/staging/octeon/octeon-stubs.h:11:38: warning: left-hand operand of comma expression has no effect [-Wunused-value]
      11 | #define OCTEON_IS_MODEL(x) ((void)(x), 0)
         |                                      ^
   drivers/staging/octeon/ethernet-rx.c:532:21: note: in expansion of macro 'OCTEON_IS_MODEL'
     532 |                 if (OCTEON_IS_MODEL(OCTEON_CN68XX))
         |                     ^~~~~~~~~~~~~~~
--
   In file included from drivers/staging/octeon/octeon-ethernet.h:41,
                    from drivers/staging/octeon/ethernet-tx.c:25:
   drivers/staging/octeon/ethernet-tx.c: In function 'cvm_oct_xmit':
>> drivers/staging/octeon/ethernet-tx.c:227:48: error: 'OCTEON_CN3XXX' undeclared (first use in this function)
     227 |         if ((skb->len < 64) && OCTEON_IS_MODEL(OCTEON_CN3XXX)) {
         |                                                ^~~~~~~~~~~~~
   drivers/staging/octeon/octeon-stubs.h:11:36: note: in definition of macro 'OCTEON_IS_MODEL'
      11 | #define OCTEON_IS_MODEL(x) ((void)(x), 0)
         |                                    ^
   drivers/staging/octeon/ethernet-tx.c:227:48: note: each undeclared identifier is reported only once for each function it appears in
     227 |         if ((skb->len < 64) && OCTEON_IS_MODEL(OCTEON_CN3XXX)) {
         |                                                ^~~~~~~~~~~~~
   drivers/staging/octeon/octeon-stubs.h:11:36: note: in definition of macro 'OCTEON_IS_MODEL'
      11 | #define OCTEON_IS_MODEL(x) ((void)(x), 0)
         |                                    ^
   drivers/staging/octeon/octeon-stubs.h:11:38: warning: left-hand operand of comma expression has no effect [-Wunused-value]
      11 | #define OCTEON_IS_MODEL(x) ((void)(x), 0)
         |                                      ^
   drivers/staging/octeon/ethernet-tx.c:227:32: note: in expansion of macro 'OCTEON_IS_MODEL'
     227 |         if ((skb->len < 64) && OCTEON_IS_MODEL(OCTEON_CN3XXX)) {
         |                                ^~~~~~~~~~~~~~~
   drivers/staging/octeon/ethernet-tx.c: In function 'cvm_oct_xmit_pow':
>> drivers/staging/octeon/ethernet-tx.c:558:30: error: 'OCTEON_CN68XX' undeclared (first use in this function)
     558 |         if (!OCTEON_IS_MODEL(OCTEON_CN68XX))
         |                              ^~~~~~~~~~~~~
   drivers/staging/octeon/octeon-stubs.h:11:36: note: in definition of macro 'OCTEON_IS_MODEL'
      11 | #define OCTEON_IS_MODEL(x) ((void)(x), 0)
         |                                    ^
   drivers/staging/octeon/octeon-stubs.h:11:38: warning: left-hand operand of comma expression has no effect [-Wunused-value]
      11 | #define OCTEON_IS_MODEL(x) ((void)(x), 0)
         |                                      ^
   drivers/staging/octeon/ethernet-tx.c:558:14: note: in expansion of macro 'OCTEON_IS_MODEL'
     558 |         if (!OCTEON_IS_MODEL(OCTEON_CN68XX))
         |              ^~~~~~~~~~~~~~~


vim +/OCTEON_CN3XXX +258 drivers/staging/octeon/ethernet.c

422d97b8b05ed38 Chris Packham 2020-02-05  230  
422d97b8b05ed38 Chris Packham 2020-02-05  231  /**
422d97b8b05ed38 Chris Packham 2020-02-05  232   * cvm_oct_common_change_mtu - change the link MTU
422d97b8b05ed38 Chris Packham 2020-02-05  233   * @dev:     Device to change
422d97b8b05ed38 Chris Packham 2020-02-05  234   * @new_mtu: The new MTU
422d97b8b05ed38 Chris Packham 2020-02-05  235   *
422d97b8b05ed38 Chris Packham 2020-02-05  236   * Returns Zero on success
422d97b8b05ed38 Chris Packham 2020-02-05  237   */
422d97b8b05ed38 Chris Packham 2020-02-05  238  static int cvm_oct_common_change_mtu(struct net_device *dev, int new_mtu)
422d97b8b05ed38 Chris Packham 2020-02-05  239  {
422d97b8b05ed38 Chris Packham 2020-02-05  240  	struct octeon_ethernet *priv = netdev_priv(dev);
422d97b8b05ed38 Chris Packham 2020-02-05  241  	int interface = INTERFACE(priv->port);
422d97b8b05ed38 Chris Packham 2020-02-05  242  #if IS_ENABLED(CONFIG_VLAN_8021Q)
422d97b8b05ed38 Chris Packham 2020-02-05  243  	int vlan_bytes = VLAN_HLEN;
422d97b8b05ed38 Chris Packham 2020-02-05  244  #else
422d97b8b05ed38 Chris Packham 2020-02-05  245  	int vlan_bytes = 0;
422d97b8b05ed38 Chris Packham 2020-02-05  246  #endif
422d97b8b05ed38 Chris Packham 2020-02-05  247  	int mtu_overhead = ETH_HLEN + ETH_FCS_LEN + vlan_bytes;
422d97b8b05ed38 Chris Packham 2020-02-05  248  
422d97b8b05ed38 Chris Packham 2020-02-05  249  	dev->mtu = new_mtu;
422d97b8b05ed38 Chris Packham 2020-02-05  250  
422d97b8b05ed38 Chris Packham 2020-02-05  251  	if ((interface < 2) &&
422d97b8b05ed38 Chris Packham 2020-02-05  252  	    (cvmx_helper_interface_get_mode(interface) !=
422d97b8b05ed38 Chris Packham 2020-02-05  253  		CVMX_HELPER_INTERFACE_MODE_SPI)) {
422d97b8b05ed38 Chris Packham 2020-02-05  254  		int index = INDEX(priv->port);
422d97b8b05ed38 Chris Packham 2020-02-05  255  		/* Add ethernet header and FCS, and VLAN if configured. */
422d97b8b05ed38 Chris Packham 2020-02-05  256  		int max_packet = new_mtu + mtu_overhead;
422d97b8b05ed38 Chris Packham 2020-02-05  257  
422d97b8b05ed38 Chris Packham 2020-02-05 @258  		if (OCTEON_IS_MODEL(OCTEON_CN3XXX) ||
422d97b8b05ed38 Chris Packham 2020-02-05 @259  		    OCTEON_IS_MODEL(OCTEON_CN58XX)) {
422d97b8b05ed38 Chris Packham 2020-02-05  260  			/* Signal errors on packets larger than the MTU */
422d97b8b05ed38 Chris Packham 2020-02-05  261  			cvmx_write_csr(CVMX_GMXX_RXX_FRM_MAX(index, interface),
422d97b8b05ed38 Chris Packham 2020-02-05  262  				       max_packet);
422d97b8b05ed38 Chris Packham 2020-02-05  263  		} else {
422d97b8b05ed38 Chris Packham 2020-02-05  264  			/*
422d97b8b05ed38 Chris Packham 2020-02-05  265  			 * Set the hardware to truncate packets larger
422d97b8b05ed38 Chris Packham 2020-02-05  266  			 * than the MTU and smaller the 64 bytes.
422d97b8b05ed38 Chris Packham 2020-02-05  267  			 */
422d97b8b05ed38 Chris Packham 2020-02-05  268  			union cvmx_pip_frm_len_chkx frm_len_chk;
422d97b8b05ed38 Chris Packham 2020-02-05  269  
422d97b8b05ed38 Chris Packham 2020-02-05  270  			frm_len_chk.u64 = 0;
422d97b8b05ed38 Chris Packham 2020-02-05  271  			frm_len_chk.s.minlen = VLAN_ETH_ZLEN;
422d97b8b05ed38 Chris Packham 2020-02-05  272  			frm_len_chk.s.maxlen = max_packet;
422d97b8b05ed38 Chris Packham 2020-02-05  273  			cvmx_write_csr(CVMX_PIP_FRM_LEN_CHKX(interface),
422d97b8b05ed38 Chris Packham 2020-02-05  274  				       frm_len_chk.u64);
422d97b8b05ed38 Chris Packham 2020-02-05  275  		}
422d97b8b05ed38 Chris Packham 2020-02-05  276  		/*
422d97b8b05ed38 Chris Packham 2020-02-05  277  		 * Set the hardware to truncate packets larger than
422d97b8b05ed38 Chris Packham 2020-02-05  278  		 * the MTU. The jabber register must be set to a
422d97b8b05ed38 Chris Packham 2020-02-05  279  		 * multiple of 8 bytes, so round up.
422d97b8b05ed38 Chris Packham 2020-02-05  280  		 */
422d97b8b05ed38 Chris Packham 2020-02-05  281  		cvmx_write_csr(CVMX_GMXX_RXX_JABBER(index, interface),
422d97b8b05ed38 Chris Packham 2020-02-05  282  			       (max_packet + 7) & ~7u);
422d97b8b05ed38 Chris Packham 2020-02-05  283  	}
422d97b8b05ed38 Chris Packham 2020-02-05  284  	return 0;
422d97b8b05ed38 Chris Packham 2020-02-05  285  }
422d97b8b05ed38 Chris Packham 2020-02-05  286  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
