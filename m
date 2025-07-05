Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE72184;
	Sat,  5 Jul 2025 03:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751684597; cv=none; b=ckUcga/udPsaVT53w0Xucifoo6pL2wUFjEN28Mp7pIhrY4yvq2oCC3y2T+VBGQVTMSfwFJd/x9sF8zk1FGBoE7o+nQXo9e8yNBecmskmYZ8VB3/zs689K8RmOm0xKn8+XRF+/UZ59pSQfCkuPJMyWAmT62eLx4AlfkvB732AHB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751684597; c=relaxed/simple;
	bh=x1vw/bUicgBqKarq+mK6KE99o3ix3eBXT4smVpz1wQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oom2szfIf44mTwfnJcfHUfqIvFaWqMP2iaQIshhZR0cH91ak4r7qGSq3oEOl8A5ensyOgayDbeGgWJveroq93g5C9CM1H7iMVJ6ESvUlU3EmcjtbDrH0QLf2hPFhJateZjsnEH+ftdArqfnpjj1Q5CIkUm5SRe7G0bcu9HrXrNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I6amdz0c; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I6amdz0c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751684594; x=1783220594;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x1vw/bUicgBqKarq+mK6KE99o3ix3eBXT4smVpz1wQ4=;
  b=I6amdz0cQarg2YOiYFlrFxrIBEuLIChdB2SnhaAVN+FKgxON79eBDGc/
   9SwfcF29vgKXBGCVF0rPU4LyPCGgEJPJDGDAEK/aHjXmF835cGP6WrHtJ
   lWlC+NLe7GDtHkTRO1BU8aIU77u69WrYkkkvCI8JD/aIbu4Gqbcvw1u+a
   ZHbrnQF0wqc2OxSp7zPkgQ+zsZe8lQNHCD344moAuUAhqxd3BS3HegFvI
   /XhGAX34g7VsJVCgSP7zEgbe+Ua0q+F8TjRR/ZF/cBSlZNgDUz2Z/QUdW
   RcqDsmhW7vHOqb85VFgNmF4/butv6s07zOJCqb8G2o9s/RPXN2pnR70M3
   Q==;
X-CSE-ConnectionGUID: F0JA4t+rT2Owij1rZ+9iIw==
X-CSE-MsgGUID: eCp6LtLRT5+Wona4Ono66Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="53720382"
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="53720382"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 20:03:13 -0700
X-CSE-ConnectionGUID: DeaI+HnpTh2wuTAPXYVxKA==
X-CSE-MsgGUID: vTWWaUjNReiTx93Ylp8c3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="159101588"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Jul 2025 20:03:10 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXtBE-0004EV-0H;
	Sat, 05 Jul 2025 03:03:08 +0000
Date: Sat, 5 Jul 2025 11:02:37 +0800
From: kernel test robot <lkp@intel.com>
To: Srikanth Chary Chennoju <srikanth.chary-chennoju@amd.com>,
	gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com,
	m.grzeschik@pengutronix.de, Chris.Wulff@biamp.com, tiwai@suse.de
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, punnaiah.choudary.kalluri@amd.com,
	Srikanth Chary Chennoju <srikanth.chary-chennoju@amd.com>
Subject: Re: [PATCH 3/3] usb: gadget: f_sourcesink: Addition of SSP endpoint
 companion for Isochronous transfers
Message-ID: <202507051018.998T0Yqk-lkp@intel.com>
References: <20250704114013.3396795-4-srikanth.chary-chennoju@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704114013.3396795-4-srikanth.chary-chennoju@amd.com>

Hi Srikanth,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus linus/master v6.16-rc4 next-20250704]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Srikanth-Chary-Chennoju/usb-gadget-zero-support-for-super-speed-plus/20250704-194150
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20250704114013.3396795-4-srikanth.chary-chennoju%40amd.com
patch subject: [PATCH 3/3] usb: gadget: f_sourcesink: Addition of SSP endpoint companion for Isochronous transfers
config: i386-randconfig-063-20250705 (https://download.01.org/0day-ci/archive/20250705/202507051018.998T0Yqk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250705/202507051018.998T0Yqk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507051018.998T0Yqk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/usb/gadget/function/f_sourcesink.c:382:43: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 static [addressable] [toplevel] [usertype] wMaxPacketSize @@     got unsigned int @@
   drivers/usb/gadget/function/f_sourcesink.c:382:43: sparse:     expected restricted __le16 static [addressable] [toplevel] [usertype] wMaxPacketSize
   drivers/usb/gadget/function/f_sourcesink.c:382:43: sparse:     got unsigned int
   drivers/usb/gadget/function/f_sourcesink.c:385:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 static [addressable] [toplevel] [usertype] wMaxPacketSize @@     got unsigned int @@
   drivers/usb/gadget/function/f_sourcesink.c:385:41: sparse:     expected restricted __le16 static [addressable] [toplevel] [usertype] wMaxPacketSize
   drivers/usb/gadget/function/f_sourcesink.c:385:41: sparse:     got unsigned int
   drivers/usb/gadget/function/f_sourcesink.c:421:43: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 static [addressable] [toplevel] [usertype] wMaxPacketSize @@     got unsigned int isoc_maxpacket @@
   drivers/usb/gadget/function/f_sourcesink.c:421:43: sparse:     expected restricted __le16 static [addressable] [toplevel] [usertype] wMaxPacketSize
   drivers/usb/gadget/function/f_sourcesink.c:421:43: sparse:     got unsigned int isoc_maxpacket
   drivers/usb/gadget/function/f_sourcesink.c:422:43: sparse: sparse: invalid assignment: |=
   drivers/usb/gadget/function/f_sourcesink.c:422:43: sparse:    left side has type restricted __le16
   drivers/usb/gadget/function/f_sourcesink.c:422:43: sparse:    right side has type unsigned int
   drivers/usb/gadget/function/f_sourcesink.c:427:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 static [addressable] [toplevel] [usertype] wMaxPacketSize @@     got unsigned int isoc_maxpacket @@
   drivers/usb/gadget/function/f_sourcesink.c:427:41: sparse:     expected restricted __le16 static [addressable] [toplevel] [usertype] wMaxPacketSize
   drivers/usb/gadget/function/f_sourcesink.c:427:41: sparse:     got unsigned int isoc_maxpacket
   drivers/usb/gadget/function/f_sourcesink.c:428:41: sparse: sparse: invalid assignment: |=
   drivers/usb/gadget/function/f_sourcesink.c:428:41: sparse:    left side has type restricted __le16
   drivers/usb/gadget/function/f_sourcesink.c:428:41: sparse:    right side has type unsigned int
   drivers/usb/gadget/function/f_sourcesink.c:443:43: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 static [addressable] [toplevel] [usertype] wMaxPacketSize @@     got unsigned int isoc_maxpacket @@
   drivers/usb/gadget/function/f_sourcesink.c:443:43: sparse:     expected restricted __le16 static [addressable] [toplevel] [usertype] wMaxPacketSize
   drivers/usb/gadget/function/f_sourcesink.c:443:43: sparse:     got unsigned int isoc_maxpacket
   drivers/usb/gadget/function/f_sourcesink.c:447:51: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 static [addressable] [assigned] [toplevel] [usertype] wBytesPerInterval @@     got unsigned int @@
   drivers/usb/gadget/function/f_sourcesink.c:447:51: sparse:     expected restricted __le16 static [addressable] [assigned] [toplevel] [usertype] wBytesPerInterval
   drivers/usb/gadget/function/f_sourcesink.c:447:51: sparse:     got unsigned int
   drivers/usb/gadget/function/f_sourcesink.c:452:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 static [addressable] [toplevel] [usertype] wMaxPacketSize @@     got unsigned int isoc_maxpacket @@
   drivers/usb/gadget/function/f_sourcesink.c:452:41: sparse:     expected restricted __le16 static [addressable] [toplevel] [usertype] wMaxPacketSize
   drivers/usb/gadget/function/f_sourcesink.c:452:41: sparse:     got unsigned int isoc_maxpacket
   drivers/usb/gadget/function/f_sourcesink.c:456:49: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 static [addressable] [assigned] [toplevel] [usertype] wBytesPerInterval @@     got unsigned int @@
   drivers/usb/gadget/function/f_sourcesink.c:456:49: sparse:     expected restricted __le16 static [addressable] [assigned] [toplevel] [usertype] wBytesPerInterval
   drivers/usb/gadget/function/f_sourcesink.c:456:49: sparse:     got unsigned int
>> drivers/usb/gadget/function/f_sourcesink.c:460:53: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 static [addressable] [toplevel] [usertype] dwBytesPerInterval @@     got unsigned int @@
   drivers/usb/gadget/function/f_sourcesink.c:460:53: sparse:     expected restricted __le32 static [addressable] [toplevel] [usertype] dwBytesPerInterval
   drivers/usb/gadget/function/f_sourcesink.c:460:53: sparse:     got unsigned int
   drivers/usb/gadget/function/f_sourcesink.c:462:51: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 static [addressable] [toplevel] [usertype] dwBytesPerInterval @@     got unsigned int @@
   drivers/usb/gadget/function/f_sourcesink.c:462:51: sparse:     expected restricted __le32 static [addressable] [toplevel] [usertype] dwBytesPerInterval
   drivers/usb/gadget/function/f_sourcesink.c:462:51: sparse:     got unsigned int

vim +460 drivers/usb/gadget/function/f_sourcesink.c

   330	
   331	static int
   332	sourcesink_bind(struct usb_configuration *c, struct usb_function *f)
   333	{
   334		struct usb_composite_dev *cdev = c->cdev;
   335		struct f_sourcesink	*ss = func_to_ss(f);
   336		int	id;
   337		int ret;
   338	
   339		/* allocate interface ID(s) */
   340		id = usb_interface_id(c, f);
   341		if (id < 0)
   342			return id;
   343		source_sink_intf_alt0.bInterfaceNumber = id;
   344		source_sink_intf_alt1.bInterfaceNumber = id;
   345	
   346		/* sanity check the bulk module parameters */
   347		if (ss->bulk_maxburst > 15)
   348			ss->bulk_maxburst = 15;
   349	
   350		/* allocate bulk endpoints */
   351		ss->in_ep = usb_ep_autoconfig(cdev->gadget, &fs_source_desc);
   352		if (!ss->in_ep) {
   353	autoconf_fail:
   354			ERROR(cdev, "%s: can't autoconfigure on %s\n",
   355				f->name, cdev->gadget->name);
   356			return -ENODEV;
   357		}
   358	
   359		ss->out_ep = usb_ep_autoconfig(cdev->gadget, &fs_sink_desc);
   360		if (!ss->out_ep)
   361			goto autoconf_fail;
   362	
   363		/*
   364		 * Fill in the SS bulk descriptors from the module parameters.
   365		 * We assume that the user knows what they are doing and won't
   366		 * give parameters that their UDC doesn't support.
   367		 */
   368		ss_source_comp_desc.bMaxBurst = ss->bulk_maxburst;
   369		ss_sink_comp_desc.bMaxBurst = ss->bulk_maxburst;
   370	
   371		/* sanity check the isoc module parameters */
   372		if (ss->isoc_interval < 1)
   373			ss->isoc_interval = 1;
   374		if (ss->isoc_interval > 16)
   375			ss->isoc_interval = 16;
   376		if (ss->isoc_mult > 2)
   377			ss->isoc_mult = 2;
   378		if (ss->isoc_maxburst > 15)
   379			ss->isoc_maxburst = 15;
   380	
   381		/* fill in the FS isoc descriptors from the module parameters */
   382		fs_iso_source_desc.wMaxPacketSize = ss->isoc_maxpacket > 1023 ?
   383							1023 : ss->isoc_maxpacket;
   384		fs_iso_source_desc.bInterval = ss->isoc_interval;
   385		fs_iso_sink_desc.wMaxPacketSize = ss->isoc_maxpacket > 1023 ?
   386							1023 : ss->isoc_maxpacket;
   387		fs_iso_sink_desc.bInterval = ss->isoc_interval;
   388	
   389		/* allocate iso endpoints */
   390		ss->iso_in_ep = usb_ep_autoconfig(cdev->gadget, &fs_iso_source_desc);
   391		if (!ss->iso_in_ep)
   392			goto no_iso;
   393	
   394		ss->iso_out_ep = usb_ep_autoconfig(cdev->gadget, &fs_iso_sink_desc);
   395		if (!ss->iso_out_ep) {
   396			usb_ep_autoconfig_release(ss->iso_in_ep);
   397			ss->iso_in_ep = NULL;
   398	no_iso:
   399			/*
   400			 * We still want to work even if the UDC doesn't have isoc
   401			 * endpoints, so null out the alt interface that contains
   402			 * them and continue.
   403			 */
   404			fs_source_sink_descs[FS_ALT_IFC_1_OFFSET] = NULL;
   405			hs_source_sink_descs[HS_ALT_IFC_1_OFFSET] = NULL;
   406			ss_source_sink_descs[SS_ALT_IFC_1_OFFSET] = NULL;
   407		}
   408	
   409		if (ss->isoc_maxpacket > 1024)
   410			ss->isoc_maxpacket = 1024;
   411	
   412		/* support high speed hardware */
   413		hs_source_desc.bEndpointAddress = fs_source_desc.bEndpointAddress;
   414		hs_sink_desc.bEndpointAddress = fs_sink_desc.bEndpointAddress;
   415	
   416		/*
   417		 * Fill in the HS isoc descriptors from the module parameters.
   418		 * We assume that the user knows what they are doing and won't
   419		 * give parameters that their UDC doesn't support.
   420		 */
   421		hs_iso_source_desc.wMaxPacketSize = ss->isoc_maxpacket;
   422		hs_iso_source_desc.wMaxPacketSize |= ss->isoc_mult << 11;
   423		hs_iso_source_desc.bInterval = ss->isoc_interval;
   424		hs_iso_source_desc.bEndpointAddress =
   425			fs_iso_source_desc.bEndpointAddress;
   426	
   427		hs_iso_sink_desc.wMaxPacketSize = ss->isoc_maxpacket;
   428		hs_iso_sink_desc.wMaxPacketSize |= ss->isoc_mult << 11;
   429		hs_iso_sink_desc.bInterval = ss->isoc_interval;
   430		hs_iso_sink_desc.bEndpointAddress = fs_iso_sink_desc.bEndpointAddress;
   431	
   432		/* support super speed hardware */
   433		ss_source_desc.bEndpointAddress =
   434			fs_source_desc.bEndpointAddress;
   435		ss_sink_desc.bEndpointAddress =
   436			fs_sink_desc.bEndpointAddress;
   437	
   438		/*
   439		 * Fill in the SS isoc descriptors from the module parameters.
   440		 * We assume that the user knows what they are doing and won't
   441		 * give parameters that their UDC doesn't support.
   442		 */
   443		ss_iso_source_desc.wMaxPacketSize = ss->isoc_maxpacket;
   444		ss_iso_source_desc.bInterval = ss->isoc_interval;
   445		ss_iso_source_comp_desc.bmAttributes = 0x80 | ss->isoc_mult;
   446		ss_iso_source_comp_desc.bMaxBurst = ss->isoc_maxburst;
   447		ss_iso_source_comp_desc.wBytesPerInterval = ss->isoc_maxpacket *
   448			(ss->isoc_mult + 1) * (ss->isoc_maxburst + 1);
   449		ss_iso_source_desc.bEndpointAddress =
   450			fs_iso_source_desc.bEndpointAddress;
   451	
   452		ss_iso_sink_desc.wMaxPacketSize = ss->isoc_maxpacket;
   453		ss_iso_sink_desc.bInterval = ss->isoc_interval;
   454		ss_iso_sink_comp_desc.bmAttributes = 0x80 | ss->isoc_mult;
   455		ss_iso_sink_comp_desc.bMaxBurst = ss->isoc_maxburst;
   456		ss_iso_sink_comp_desc.wBytesPerInterval = ss->isoc_maxpacket *
   457			(ss->isoc_mult + 1) * (ss->isoc_maxburst + 1);
   458		ss_iso_sink_desc.bEndpointAddress = fs_iso_sink_desc.bEndpointAddress;
   459	
 > 460		ssp_iso_source_comp_desc.dwBytesPerInterval = ss->isoc_maxpacket *
   461			(ss->isoc_mult + 1) * (ss->isoc_maxburst + 1) * 2;
   462		ssp_iso_sink_comp_desc.dwBytesPerInterval = ss->isoc_maxpacket *
   463			(ss->isoc_mult + 1) * (ss->isoc_maxburst + 1) * 2;
   464	
   465		ret = usb_assign_descriptors(f, fs_source_sink_descs,
   466				hs_source_sink_descs, ss_source_sink_descs,
   467				ss_source_sink_descs);
   468		if (ret)
   469			return ret;
   470	
   471		DBG(cdev, "%s: IN/%s, OUT/%s, ISO-IN/%s, ISO-OUT/%s\n",
   472				f->name, ss->in_ep->name, ss->out_ep->name,
   473				ss->iso_in_ep ? ss->iso_in_ep->name : "<none>",
   474				ss->iso_out_ep ? ss->iso_out_ep->name : "<none>");
   475		return 0;
   476	}
   477	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
