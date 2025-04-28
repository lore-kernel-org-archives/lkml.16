Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F16919C542
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 01:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745889582; cv=none; b=Gqelt6RIofWVaUxkO1YK+0V50eaP4A/CRrGcWV86HS7uV7X8h+n2bvHNRmFnA2VA3n8bD+q7SZKjCRz0I/JtKotCY4Zk6IRii3wtyPeDUlIfjBCLODiqtX1WS6DxF4cWV4DHiz1OpR/IDBTfUQ0ofdBP+7eIZDzxcigffnK1u5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745889582; c=relaxed/simple;
	bh=6lXCGWOXBlsuyFkmPwrGhHIUNi3cg7bVtcVuwOLUiWg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GEV+TtpnR2S7H5DllWnofLJop9Dmi/2kpYdQyZ+fi5FTvnpkobY9xyzhGib1+eEae6KZR5gFcVzZAcTGAKCudmMHMjbtwdgB4NsVqEI9nfOjRR9wwYyTxzVvgkHeDmOMs3dPlw8R8NqbBQ4lrRGoAl4qQx+ymY9TwAJmp4FGOU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nDxxYwYI; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nDxxYwYI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745889580; x=1777425580;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6lXCGWOXBlsuyFkmPwrGhHIUNi3cg7bVtcVuwOLUiWg=;
  b=nDxxYwYIWPavYWB3Otig8GWulnvffMvzQctQ/r/5ynE1mV1mhZkwdz2f
   IwTB8QY76ISPZ3bREkSk8uSjB4s66ADlPiNGSv6P1Ku2iYa2VmQm8G70/
   ReoP4V2RRE0Yqg4P7pBvkyO4/+JcPr7Qbk6XrqXwDz0TIPTg3sESGkH3v
   +LTmSEQ2BV2ycZHPnRlWwNM+QvRaORD3O4Se9BWD+s+IEkb+R3W+NQP7h
   mme7B0KSt2uqP6WDobJGO3vlzIVVBt/Cie86o/wzz8zEp9Ff5j7iw40+V
   dReLmLq6oRaGAksaaRhnNmrrgQLGZkzIgB0TpvXdepsQS8AB2VTvxEEoS
   Q==;
X-CSE-ConnectionGUID: V1iQQc1tSg2TuXHjyY8z0g==
X-CSE-MsgGUID: 2diV6K0sRB23uypWgF/chw==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="51313354"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="51313354"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 18:19:40 -0700
X-CSE-ConnectionGUID: TrsiJmNzSL6DkZdpoe+mFA==
X-CSE-MsgGUID: VcHt/szfSnG0BCuuKFU5SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="164637879"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Apr 2025 18:19:39 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9ZdI-0000Lq-0J;
	Tue, 29 Apr 2025 01:19:36 +0000
Date: Tue, 29 Apr 2025 01:10:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: arch/microblaze/boot/dts/system.dtb: flash@a0000000
 (xlnx,xps-mch-emc-2.00.a): Unevaluated properties are not allowed
 ('xlnx,family', 'xlnx,include-datawidth-matching-0',
 'xlnx,include-datawidth-matching-1', 'xlnx,include-datawidth-matching-2',
 'xlnx,incl...
Message-ID: <202504290136.oY3KMgyd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b4432656b36e5cc1d50a1f2dc15357543add530e
commit: 9ea13d9e40cfb6675a299147bb89d6ca9e7aad9a dt-bindings: mtd: physmap:=
 Ensure all properties are defined
date:   8 weeks ago
config: microblaze-randconfig-052-20250428 (https://download.01.org/0day-ci=
/archive/20250429/202504290136.oY3KMgyd-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250429/202504290136.oY3KMgyd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504290136.oY3KMgyd-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/microblaze/boot/dts/system.dtb: /: failed to match any schema with =
compatible: ['xlnx,microblaze']
   arch/microblaze/boot/dts/system.dtb: /cpus/cpu@0: failed to match any sc=
hema with compatible: ['xlnx,microblaze-7.10.d']
   arch/microblaze/boot/dts/system.dtb: plb@0 (xlnx,plb-v46-1.03.a): gpio-l=
eds: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/microblaze/boot/dts/system.dtb: plb@0 (xlnx,plb-v46-1.03.a): gpio-r=
estart: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/microblaze/boot/dts/system.dtb: plb@0 (xlnx,plb-v46-1.03.a): $noden=
ame:0: 'plb@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi=
|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/microblaze/boot/dts/system.dtb: /plb@0: failed to match any schema =
with compatible: ['xlnx,plb-v46-1.03.a', 'xlnx,plb-v46-1.00.a', 'simple-bus=
']
   arch/microblaze/boot/dts/system.dtb: /plb@0: failed to match any schema =
with compatible: ['xlnx,plb-v46-1.03.a', 'xlnx,plb-v46-1.00.a', 'simple-bus=
']
>> arch/microblaze/boot/dts/system.dtb: flash@a0000000 (xlnx,xps-mch-emc-2.=
00.a): Unevaluated properties are not allowed ('xlnx,family', 'xlnx,include=
-datawidth-matching-0', 'xlnx,include-datawidth-matching-1', 'xlnx,include-=
datawidth-matching-2', 'xlnx,include-datawidth-matching-3', 'xlnx,include-n=
egedge-ioregs', 'xlnx,include-plb-ipif', 'xlnx,include-wrbuf', 'xlnx,max-me=
m-width', 'xlnx,mch-native-dwidth', 'xlnx,mch-plb-clk-period-ps', 'xlnx,mch=
-splb-awidth', 'xlnx,mch0-accessbuf-depth', 'xlnx,mch0-protocol', 'xlnx,mch=
0-rddatabuf-depth', 'xlnx,mch1-accessbuf-depth', 'xlnx,mch1-protocol', 'xln=
x,mch1-rddatabuf-depth', 'xlnx,mch2-accessbuf-depth', 'xlnx,mch2-protocol',=
 'xlnx,mch2-rddatabuf-depth', 'xlnx,mch3-accessbuf-depth', 'xlnx,mch3-proto=
col', 'xlnx,mch3-rddatabuf-depth', 'xlnx,mem0-width', 'xlnx,mem1-width', 'x=
lnx,mem2-width', 'xlnx,mem3-width', 'xlnx,num-banks-mem', 'xlnx,num-channel=
s', 'xlnx,priority-mode', 'xlnx,synch-mem-0', 'xlnx,synch-mem-1', 'xlnx,syn=
ch-mem-2', 'xlnx,synch-mem-3', 'xlnx,synch-pipedelay-0', 'xlnx,synch-pipede=
lay-1', 'xlnx,synch-pipedelay-2', 'xlnx,synch-pipedelay-3', 'xlnx,tavdv-ps-=
mem-0', 'xlnx,tavdv-ps-mem-1', 'xlnx,tavdv-ps-mem-2', 'xlnx,tavdv-ps-mem-3'=
, 'xlnx,tcedv-ps-mem-0', 'xlnx,tcedv-ps-mem-1', 'xlnx,tcedv-ps-mem-2', 'xln=
x,tcedv-ps-mem-3', 'xlnx,thzce-ps-mem-0', 'xlnx,thzce-ps-mem-1', 'xlnx,thzc=
e-ps-mem-2', 'xlnx,thzce-ps-mem-3', 'xlnx,thzoe-ps-mem-0', 'xlnx,thzoe-ps-m=
em-1', 'xlnx,thzoe-ps-mem-2', 'xlnx,thzoe-ps-mem-3', 'xlnx,tlzwe-ps-mem-0',=
 'xlnx,tlzwe-ps-mem-1', 'xlnx,tlzwe-ps-mem-2', 'xlnx,tlzwe-ps-mem-3', 'xlnx=
,twc-ps-mem-0', 'xlnx,twc-ps-mem-1', 'xlnx,twc-ps-mem-2', 'xlnx,twc-ps-mem-=
3', 'xlnx,twp-ps-mem-0', 'xlnx,twp-ps-mem-1', 'xlnx,twp-ps-mem-2', 'xlnx,tw=
p-ps-mem-3', 'xlnx,xcl0-linesize', 'xlnx,xcl0-writexfer', 'xlnx,xcl1-linesi=
ze', 'xlnx,xcl1-writexfer', 'xlnx,xcl2-linesize', 'xlnx,xcl2-writexfer', 'x=
lnx,xcl3-linesize', 'xlnx,xcl3-writexfer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/microblaze/boot/dts/system.dtb: /plb@0/xps-ll-temac@81c00000: faile=
d to match any schema with compatible: ['xlnx,compound']
   arch/microblaze/boot/dts/system.dtb: /plb@0/xps-ll-temac@81c00000/ethern=
et@81c00000: failed to match any schema with compatible: ['xlnx,xps-ll-tema=
c-1.01.b', 'xlnx,xps-ll-temac-1.00.a']
   arch/microblaze/boot/dts/system.dtb: /plb@0/xps-ll-temac@81c00000/ethern=
et@81c00000: failed to match any schema with compatible: ['xlnx,xps-ll-tema=
c-1.01.b', 'xlnx,xps-ll-temac-1.00.a']
   arch/microblaze/boot/dts/system.dtb: i2c@81600000 (xlnx,xps-iic-2.00.a):=
 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/i2c/xlnx,xps-iic-2.00.a.=
yaml#
   arch/microblaze/boot/dts/system.dtb: i2c@81600000 (xlnx,xps-iic-2.00.a):=
 Unevaluated properties are not allowed ('xlnx,clk-freq', 'xlnx,family', 'x=
lnx,gpo-width', 'xlnx,iic-freq', 'xlnx,scl-inertial-delay', 'xlnx,sda-inert=
ial-delay', 'xlnx,ten-bit-adr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/xlnx,xps-iic-2.00.a.=
yaml#
   arch/microblaze/boot/dts/system.dtb: gpio@81400000 (xlnx,xps-gpio-1.00.a=
): Unevaluated properties are not allowed ('xlnx,family', 'xlnx,is-bidir', =
'xlnx,is-bidir-2' were unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/xlnx,gpio-xilinx.ya=
ml#

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
