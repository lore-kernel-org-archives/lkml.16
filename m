Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C401C5D77
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 21:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748726933; cv=none; b=PcOuGesnB/YOJ2HUeK17lD1cPIawPnubL4/4AIvJzsiHkGNDYxHm4sl1SyuBJQQicHsml/MkgTnKO6yd2H7C57YGadiqJe60D5OfijIWKmji/Zv86GZlshkesDVV7bWVE16LS8Jdexq4wckBjkR+z7bwR0pd+yHx6sksJFOYxIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748726933; c=relaxed/simple;
	bh=WMk8N9cpHhXWxtSwtp3eC6IsRUq10cpfS5Jz3CcZvfw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QbAGpiTm0swxeD7lV1uVVejf2dm8luc25guPBNeasxPqK8EpldOM0hmXB7xiXDkBHh9OfInO82hK9Lspgx/EWqiQPOoRnpxGmvc/Hxmu9GoHCplkjz34Cy1tdXmI5BW5sM1JKcmBVKjX17vwTYvFka4F6b1atncDQbmvYdL0RgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ebd5WF1Y; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ebd5WF1Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748726932; x=1780262932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WMk8N9cpHhXWxtSwtp3eC6IsRUq10cpfS5Jz3CcZvfw=;
  b=ebd5WF1YpANOHWARCT23i8Thhglm88AthJsM3w0UO2ihbNwEWV4T19nQ
   xdzVM9T56NEiNzg+iffVhCbgD9S5r3IdUEgFVASKyrNZpfcXweyqPWPbq
   34WmThAPBI8g0jiDjKOlBdRqDZ/riPYs8D4lf5oH80FjRhwzB5Vn+0T2I
   541kYYXt+HCquITOUQCIvauLe/ytkIzrtJHXA8Eg8cyU4fHJpIuIODuyy
   iGw9fBLkYviWpNWe8yDQj/XdJd4kERHkgHtoFt98qqQpxo48pJa3jgaJY
   m2p8ioa2ridvGn54+FpcNjJlqYr9Mq7d6ixTLzZwhKTBz0+NiFw+UecxH
   A==;
X-CSE-ConnectionGUID: LrK0GJAcSG2BGQ2rvDzumw==
X-CSE-MsgGUID: ZMLOGg1DRnSMXMJMSjUoPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="76176177"
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="76176177"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 14:28:51 -0700
X-CSE-ConnectionGUID: xvkglJUHQQyvkb+Qi6stMA==
X-CSE-MsgGUID: RkKYKleJSF2Ra9FxpgdZjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="144153833"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 31 May 2025 14:28:48 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLTl0-000Yes-07;
	Sat, 31 May 2025 21:28:46 +0000
Date: Sun, 1 Jun 2025 05:27:50 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Takashi Iwai <tiwai@suse.de>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Jarkko Sakkinen <jarkko@kernel.org>
Subject: include/asm-generic/io.h:733:14: error: call to 'insw' declared with
 attribute error: insw() requires HAS_IOPORT
Message-ID: <202506010518.J3CbysGR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Niklas,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4cb6c8af8591135ec000fbe4bb474139ceec595d
commit: 6f043e75744596968b6547c4bd43e4d30bbb6d6e asm-generic/io.h: Remove I/O port accessors for HAS_IOPORT=n
date:   7 months ago
config: m68k-randconfig-r113-20250601 (https://download.01.org/0day-ci/archive/20250601/202506010518.J3CbysGR-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 10.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250601/202506010518.J3CbysGR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506010518.J3CbysGR-lkp@intel.com/

All errors (new ones prefixed by >>):

         |              ^~~~~
   drivers/net/ethernet/8390/mcf8390.c:132:18: note: in expansion of macro 'outb'
     132 | #define ei_outb  outb
         |                  ^~~~
   drivers/net/ethernet/8390/mcf8390.c:141:19: note: in expansion of macro 'ei_outb'
     141 | #define ei_outb_p ei_outb
         |                   ^~~~~~~
   drivers/net/ethernet/8390/lib8390.c:404:2: note: in expansion of macro 'ei_outb_p'
     404 |  ei_outb_p(ENISR_ALL, e8390_base + EN0_IMR);
         |  ^~~~~~~~~
   drivers/net/ethernet/8390/mcf8390.c: In function 'mcf8390_get_8390_hdr':
   include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/net/ethernet/8390/mcf8390.c:132:18: note: in expansion of macro 'outb'
     132 | #define ei_outb  outb
         |                  ^~~~
   drivers/net/ethernet/8390/mcf8390.c:201:2: note: in expansion of macro 'ei_outb'
     201 |  ei_outb(E8390_NODMA + E8390_PAGE0 + E8390_START, addr + NE_CMD);
         |  ^~~~~~~
   include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/net/ethernet/8390/mcf8390.c:132:18: note: in expansion of macro 'outb'
     132 | #define ei_outb  outb
         |                  ^~~~
   drivers/net/ethernet/8390/mcf8390.c:202:2: note: in expansion of macro 'ei_outb'
     202 |  ei_outb(ENISR_RDC, addr + NE_EN0_ISR);
         |  ^~~~~~~
   include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/net/ethernet/8390/mcf8390.c:132:18: note: in expansion of macro 'outb'
     132 | #define ei_outb  outb
         |                  ^~~~
   drivers/net/ethernet/8390/mcf8390.c:203:2: note: in expansion of macro 'ei_outb'
     203 |  ei_outb(sizeof(struct e8390_pkt_hdr), addr + NE_EN0_RCNTLO);
         |  ^~~~~~~
   include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/net/ethernet/8390/mcf8390.c:132:18: note: in expansion of macro 'outb'
     132 | #define ei_outb  outb
         |                  ^~~~
   drivers/net/ethernet/8390/mcf8390.c:204:2: note: in expansion of macro 'ei_outb'
     204 |  ei_outb(0, addr + NE_EN0_RCNTHI);
         |  ^~~~~~~
   include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/net/ethernet/8390/mcf8390.c:132:18: note: in expansion of macro 'outb'
     132 | #define ei_outb  outb
         |                  ^~~~
   drivers/net/ethernet/8390/mcf8390.c:205:2: note: in expansion of macro 'ei_outb'
     205 |  ei_outb(0, addr + NE_EN0_RSARLO);  /* On page boundary */
         |  ^~~~~~~
   include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/net/ethernet/8390/mcf8390.c:132:18: note: in expansion of macro 'outb'
     132 | #define ei_outb  outb
         |                  ^~~~
   drivers/net/ethernet/8390/mcf8390.c:206:2: note: in expansion of macro 'ei_outb'
     206 |  ei_outb(ring_page, addr + NE_EN0_RSARHI);
         |  ^~~~~~~
   include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/net/ethernet/8390/mcf8390.c:132:18: note: in expansion of macro 'outb'
     132 | #define ei_outb  outb
         |                  ^~~~
   drivers/net/ethernet/8390/mcf8390.c:207:2: note: in expansion of macro 'ei_outb'
     207 |  ei_outb(E8390_RREAD + E8390_START, addr + NE_CMD);
         |  ^~~~~~~
   In file included from arch/m68k/include/asm/io.h:14,
                    from include/linux/io.h:14,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/m68k/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/highmem.h:12,
                    from include/linux/bvec.h:10,
                    from include/linux/skbuff.h:17,
                    from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from drivers/net/ethernet/8390/mcf8390.c:15:
>> include/asm-generic/io.h:733:14: error: call to 'insw' declared with attribute error: insw() requires HAS_IOPORT
     733 | #define insw insw
   drivers/net/ethernet/8390/mcf8390.c:134:18: note: in expansion of macro 'insw'
     134 | #define ei_insw  insw
         |                  ^~~~
   drivers/net/ethernet/8390/mcf8390.c:209:2: note: in expansion of macro 'ei_insw'
     209 |  ei_insw(addr + NE_DATAPORT, hdr, sizeof(struct e8390_pkt_hdr) >> 1);
         |  ^~~~~~~
   In file included from arch/m68k/include/asm/io.h:14,
                    from include/linux/io.h:14,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/m68k/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/highmem.h:12,
                    from include/linux/bvec.h:10,
                    from include/linux/skbuff.h:17,
                    from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from drivers/net/ethernet/8390/mcf8390.c:15:
   include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/net/ethernet/8390/mcf8390.c:211:2: note: in expansion of macro 'outb'
     211 |  outb(ENISR_RDC, addr + NE_EN0_ISR); /* Ack intr */
         |  ^~~~
   drivers/net/ethernet/8390/mcf8390.c: In function 'mcf8390_block_input':
   include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/net/ethernet/8390/mcf8390.c:132:18: note: in expansion of macro 'outb'
     132 | #define ei_outb  outb
         |                  ^~~~
   drivers/net/ethernet/8390/mcf8390.c:237:2: note: in expansion of macro 'ei_outb'
     237 |  ei_outb(E8390_NODMA + E8390_PAGE0 + E8390_START, addr + NE_CMD);
         |  ^~~~~~~
   include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/net/ethernet/8390/mcf8390.c:132:18: note: in expansion of macro 'outb'
     132 | #define ei_outb  outb
         |                  ^~~~
   drivers/net/ethernet/8390/mcf8390.c:238:2: note: in expansion of macro 'ei_outb'
     238 |  ei_outb(ENISR_RDC, addr + NE_EN0_ISR);
         |  ^~~~~~~
   include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/net/ethernet/8390/mcf8390.c:132:18: note: in expansion of macro 'outb'
     132 | #define ei_outb  outb
         |                  ^~~~
   drivers/net/ethernet/8390/mcf8390.c:239:2: note: in expansion of macro 'ei_outb'
     239 |  ei_outb(count & 0xff, addr + NE_EN0_RCNTLO);
         |  ^~~~~~~
   include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/net/ethernet/8390/mcf8390.c:132:18: note: in expansion of macro 'outb'
     132 | #define ei_outb  outb
         |                  ^~~~
   drivers/net/ethernet/8390/mcf8390.c:240:2: note: in expansion of macro 'ei_outb'
     240 |  ei_outb(count >> 8, addr + NE_EN0_RCNTHI);
         |  ^~~~~~~
   include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/net/ethernet/8390/mcf8390.c:132:18: note: in expansion of macro 'outb'
     132 | #define ei_outb  outb
         |                  ^~~~
   drivers/net/ethernet/8390/mcf8390.c:241:2: note: in expansion of macro 'ei_outb'
     241 |  ei_outb(ring_offset & 0xff, addr + NE_EN0_RSARLO);
         |  ^~~~~~~
   include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/net/ethernet/8390/mcf8390.c:132:18: note: in expansion of macro 'outb'
     132 | #define ei_outb  outb
         |                  ^~~~
   drivers/net/ethernet/8390/mcf8390.c:242:2: note: in expansion of macro 'ei_outb'
     242 |  ei_outb(ring_offset >> 8, addr + NE_EN0_RSARHI);
         |  ^~~~~~~
   include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/net/ethernet/8390/mcf8390.c:132:18: note: in expansion of macro 'outb'
     132 | #define ei_outb  outb
         |                  ^~~~
   drivers/net/ethernet/8390/mcf8390.c:243:2: note: in expansion of macro 'ei_outb'
     243 |  ei_outb(E8390_RREAD + E8390_START, addr + NE_CMD);
         |  ^~~~~~~
   In file included from arch/m68k/include/asm/io.h:14,
                    from include/linux/io.h:14,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/m68k/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/highmem.h:12,
                    from include/linux/bvec.h:10,
                    from include/linux/skbuff.h:17,
                    from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from drivers/net/ethernet/8390/mcf8390.c:15:
>> include/asm-generic/io.h:733:14: error: call to 'insw' declared with attribute error: insw() requires HAS_IOPORT
     733 | #define insw insw
   drivers/net/ethernet/8390/mcf8390.c:134:18: note: in expansion of macro 'insw'
     134 | #define ei_insw  insw
         |                  ^~~~
   drivers/net/ethernet/8390/mcf8390.c:245:2: note: in expansion of macro 'ei_insw'
     245 |  ei_insw(addr + NE_DATAPORT, buf, count >> 1);
         |  ^~~~~~~
   In file included from arch/m68k/include/asm/io.h:14,
                    from include/linux/io.h:14,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/m68k/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/highmem.h:12,
                    from include/linux/bvec.h:10,
                    from include/linux/skbuff.h:17,
                    from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from drivers/net/ethernet/8390/mcf8390.c:15:
   include/asm-generic/io.h:542:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     542 | #define _inb _inb
   include/asm-generic/io.h:643:13: note: in expansion of macro '_inb'
     643 | #define inb _inb
         |             ^~~~
   drivers/net/ethernet/8390/mcf8390.c:131:17: note: in expansion of macro 'inb'
     131 | #define ei_inb  inb
         |                 ^~~
   drivers/net/ethernet/8390/mcf8390.c:247:20: note: in expansion of macro 'ei_inb'
     247 |   buf[count - 1] = ei_inb(addr + NE_DATAPORT);
         |                    ^~~~~~
   include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/net/ethernet/8390/mcf8390.c:132:18: note: in expansion of macro 'outb'
     132 | #define ei_outb  outb
         |                  ^~~~
   drivers/net/ethernet/8390/mcf8390.c:249:2: note: in expansion of macro 'ei_outb'
     249 |  ei_outb(ENISR_RDC, addr + NE_EN0_ISR); /* Ack intr */
         |  ^~~~~~~
   drivers/net/ethernet/8390/lib8390.c: In function '__NS8390_init':
   include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/net/ethernet/8390/mcf8390.c:132:18: note: in expansion of macro 'outb'
     132 | #define ei_outb  outb
         |                  ^~~~
   drivers/net/ethernet/8390/mcf8390.c:141:19: note: in expansion of macro 'ei_outb'
     141 | #define ei_outb_p ei_outb
         |                   ^~~~~~~
   drivers/net/ethernet/8390/lib8390.c:1025:2: note: in expansion of macro 'ei_outb_p'
    1025 |  ei_outb_p(E8390_NODMA+E8390_PAGE0+E8390_STOP, e8390_base+E8390_CMD); /* 0x21 */
         |  ^~~~~~~~~
   include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/net/ethernet/8390/mcf8390.c:132:18: note: in expansion of macro 'outb'
     132 | #define ei_outb  outb
         |                  ^~~~
   drivers/net/ethernet/8390/mcf8390.c:141:19: note: in expansion of macro 'ei_outb'
     141 | #define ei_outb_p ei_outb
         |                   ^~~~~~~
   drivers/net/ethernet/8390/lib8390.c:1026:2: note: in expansion of macro 'ei_outb_p'
    1026 |  ei_outb_p(endcfg, e8390_base + EN0_DCFG); /* 0x48 or 0x49 */
         |  ^~~~~~~~~
   include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/net/ethernet/8390/mcf8390.c:132:18: note: in expansion of macro 'outb'
     132 | #define ei_outb  outb
         |                  ^~~~
   drivers/net/ethernet/8390/mcf8390.c:141:19: note: in expansion of macro 'ei_outb'
     141 | #define ei_outb_p ei_outb
         |                   ^~~~~~~
   drivers/net/ethernet/8390/lib8390.c:1028:2: note: in expansion of macro 'ei_outb_p'
    1028 |  ei_outb_p(0x00,  e8390_base + EN0_RCNTLO);
         |  ^~~~~~~~~
   include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/net/ethernet/8390/mcf8390.c:132:18: note: in expansion of macro 'outb'
     132 | #define ei_outb  outb
         |                  ^~~~
   drivers/net/ethernet/8390/mcf8390.c:141:19: note: in expansion of macro 'ei_outb'
     141 | #define ei_outb_p ei_outb
         |                   ^~~~~~~
   drivers/net/ethernet/8390/lib8390.c:1029:2: note: in expansion of macro 'ei_outb_p'
    1029 |  ei_outb_p(0x00,  e8390_base + EN0_RCNTHI);
         |  ^~~~~~~~~
   include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
..


vim +/insw +733 include/asm-generic/io.h

9ab3a7a0d2b417 Thierry Reding  2014-07-04  731  
9ab3a7a0d2b417 Thierry Reding  2014-07-04  732  #ifndef insw
9ab3a7a0d2b417 Thierry Reding  2014-07-04 @733  #define insw insw
6f043e75744596 Niklas Schnelle 2024-10-24  734  #ifdef CONFIG_HAS_IOPORT
9ab3a7a0d2b417 Thierry Reding  2014-07-04  735  static inline void insw(unsigned long addr, void *buffer, unsigned int count)
9ab3a7a0d2b417 Thierry Reding  2014-07-04  736  {
9ab3a7a0d2b417 Thierry Reding  2014-07-04  737  	readsw(PCI_IOBASE + addr, buffer, count);
9ab3a7a0d2b417 Thierry Reding  2014-07-04  738  }
6f043e75744596 Niklas Schnelle 2024-10-24  739  #else
6f043e75744596 Niklas Schnelle 2024-10-24  740  void insw(unsigned long addr, void *buffer, unsigned int count)
6f043e75744596 Niklas Schnelle 2024-10-24  741  	__compiletime_error("insw() requires HAS_IOPORT");
6f043e75744596 Niklas Schnelle 2024-10-24  742  #endif
9ab3a7a0d2b417 Thierry Reding  2014-07-04  743  #endif
9ab3a7a0d2b417 Thierry Reding  2014-07-04  744  
9ab3a7a0d2b417 Thierry Reding  2014-07-04  745  #ifndef insl
9ab3a7a0d2b417 Thierry Reding  2014-07-04  746  #define insl insl
6f043e75744596 Niklas Schnelle 2024-10-24  747  #ifdef CONFIG_HAS_IOPORT
9ab3a7a0d2b417 Thierry Reding  2014-07-04  748  static inline void insl(unsigned long addr, void *buffer, unsigned int count)
9ab3a7a0d2b417 Thierry Reding  2014-07-04  749  {
9ab3a7a0d2b417 Thierry Reding  2014-07-04  750  	readsl(PCI_IOBASE + addr, buffer, count);
9ab3a7a0d2b417 Thierry Reding  2014-07-04  751  }
6f043e75744596 Niklas Schnelle 2024-10-24  752  #else
6f043e75744596 Niklas Schnelle 2024-10-24  753  void insl(unsigned long addr, void *buffer, unsigned int count)
6f043e75744596 Niklas Schnelle 2024-10-24  754  	__compiletime_error("insl() requires HAS_IOPORT");
6f043e75744596 Niklas Schnelle 2024-10-24  755  #endif
9ab3a7a0d2b417 Thierry Reding  2014-07-04  756  #endif
9ab3a7a0d2b417 Thierry Reding  2014-07-04  757  
9ab3a7a0d2b417 Thierry Reding  2014-07-04  758  #ifndef outsb
9ab3a7a0d2b417 Thierry Reding  2014-07-04  759  #define outsb outsb
6f043e75744596 Niklas Schnelle 2024-10-24  760  #ifdef CONFIG_HAS_IOPORT
9ab3a7a0d2b417 Thierry Reding  2014-07-04  761  static inline void outsb(unsigned long addr, const void *buffer,
9ab3a7a0d2b417 Thierry Reding  2014-07-04  762  			 unsigned int count)
9ab3a7a0d2b417 Thierry Reding  2014-07-04  763  {
9ab3a7a0d2b417 Thierry Reding  2014-07-04  764  	writesb(PCI_IOBASE + addr, buffer, count);
9ab3a7a0d2b417 Thierry Reding  2014-07-04  765  }
6f043e75744596 Niklas Schnelle 2024-10-24  766  #else
6f043e75744596 Niklas Schnelle 2024-10-24  767  void outsb(unsigned long addr, const void *buffer, unsigned int count)
6f043e75744596 Niklas Schnelle 2024-10-24  768  	__compiletime_error("outsb() requires HAS_IOPORT");
6f043e75744596 Niklas Schnelle 2024-10-24  769  #endif
9ab3a7a0d2b417 Thierry Reding  2014-07-04  770  #endif
9ab3a7a0d2b417 Thierry Reding  2014-07-04  771  
9ab3a7a0d2b417 Thierry Reding  2014-07-04  772  #ifndef outsw
9ab3a7a0d2b417 Thierry Reding  2014-07-04 @773  #define outsw outsw
6f043e75744596 Niklas Schnelle 2024-10-24  774  #ifdef CONFIG_HAS_IOPORT
9ab3a7a0d2b417 Thierry Reding  2014-07-04  775  static inline void outsw(unsigned long addr, const void *buffer,
9ab3a7a0d2b417 Thierry Reding  2014-07-04  776  			 unsigned int count)
9ab3a7a0d2b417 Thierry Reding  2014-07-04  777  {
9ab3a7a0d2b417 Thierry Reding  2014-07-04  778  	writesw(PCI_IOBASE + addr, buffer, count);
9ab3a7a0d2b417 Thierry Reding  2014-07-04  779  }
6f043e75744596 Niklas Schnelle 2024-10-24  780  #else
6f043e75744596 Niklas Schnelle 2024-10-24  781  void outsw(unsigned long addr, const void *buffer, unsigned int count)
6f043e75744596 Niklas Schnelle 2024-10-24  782  	__compiletime_error("outsw() requires HAS_IOPORT");
6f043e75744596 Niklas Schnelle 2024-10-24  783  #endif
9ab3a7a0d2b417 Thierry Reding  2014-07-04  784  #endif
9ab3a7a0d2b417 Thierry Reding  2014-07-04  785  

:::::: The code at line 733 was first introduced by commit
:::::: 9ab3a7a0d2b417773e8e8a880fc3a69f7fc1f57a asm-generic/io.h: Implement generic {read,write}s*()

:::::: TO: Thierry Reding <treding@nvidia.com>
:::::: CC: Thierry Reding <treding@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
