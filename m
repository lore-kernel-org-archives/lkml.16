Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C99B1991B8
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 17:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743874937; cv=none; b=hq74ni2q7Vtu6ZlC8RjdkKLaB8VVWVm3BLW0mdH/LWEXayvkHf6oJMQqAqYlnLQxY390rPjpmY8wVY38Y+E+Ix26ZqiRcpBPWs7KGNWMtVZihZdnhANUWUoU0WRit8yuX6TOKLq1pyDN8Q/u0I+C4Ji0Nt967K2eR26UDZYpGrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743874937; c=relaxed/simple;
	bh=DMruvwZj9pN+nRLYEysIuozn5rHzpma6PJ+sm5luUPE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uhuouNuf+O4Hg82Nl/9e7eI83LAoF4rfmmBG75Jwrrpjzh52roY5Jhsw/aPyyo1RDhJx63vJyJRAxfBxExtbVSucob4Sig7I+JyXd8JeNNnvdZmZDojs+ckfdvWp0GFaaea8l63XE468Q63pp7YMdNcloCR1MaYtLxdcAS8mqMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c+Sos4TZ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c+Sos4TZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743874934; x=1775410934;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DMruvwZj9pN+nRLYEysIuozn5rHzpma6PJ+sm5luUPE=;
  b=c+Sos4TZVzYYyh46wqEVIy8nwuQMyVb0CnKoxJrO72KW+JgM2iEKfpNH
   zv41V3MCRAwNAKFe7ETGRtOmEzsbyC2WDH8HiHOGI/59Pv3/BJc6/PLoy
   q1UVk97D7Ttpw+tW+A97a5d1Ggb8R1WcPNeoLQHeSKZbpbVSn8TspbXJc
   FRa1OFk4KTVnuSQLVrl4ylT+iGunSRe5zL9wZTO/y4RJIwqkAofj9ciPQ
   l8r5dOGF8q7FOwJBlEePTaNJ33JvKLzmpAQSWzdnzQD6sbcXuUs/8RpVU
   QtONJTUOZ7jS9Ukm2lZrzi55LWDPwro0BfGf37I+3J8U2YfArG3Wx4RVb
   w==;
X-CSE-ConnectionGUID: e4n7EBEARfCVYGCjlTmiHQ==
X-CSE-MsgGUID: FJYIYCT3TQ+k/OtIFZhnXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="48010549"
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="48010549"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 10:42:14 -0700
X-CSE-ConnectionGUID: BF3zq3WHT0eL0ODX/E6tRA==
X-CSE-MsgGUID: u64enPA/RdGx4pTyuvd0rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="127556461"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Apr 2025 10:39:42 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u17Ua-0002BF-0X;
	Sat, 05 Apr 2025 17:39:40 +0000
Date: Sun, 6 Apr 2025 01:38:40 +0800
From: kernel test robot <lkp@intel.com>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: arch/mips/boot/dts/ralink/rt3052_eval.dtb: syscon@0: compatible:1:
 'syscon' was expected
Message-ID: <202504060140.bDmNDvJV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a8662bcd2ff152bfbc751cab20f33053d74d0963
commit: acf13fc60cfa0824cafd7ce9ab0784ffc87a5d86 mips: dts: ralink: rt3050: update system controller node and its consumers
date:   6 weeks ago
config: mips-randconfig-052-20250406 (https://download.01.org/0day-ci/archive/20250406/202504060140.bDmNDvJV-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
dtschema version: 2025.3.dev6+gb64c5c3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250406/202504060140.bDmNDvJV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504060140.bDmNDvJV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/ralink/rt3050.dtsi:10.9-12.5: Warning (unit_address_vs_reg): /cpus/cpu@0: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/ralink/rt3052_eval.dtb: cpus: cpu@0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
   arch/mips/boot/dts/ralink/rt3052_eval.dtb: cpus: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
   arch/mips/boot/dts/ralink/rt3052_eval.dtb: cpus: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
   arch/mips/boot/dts/ralink/rt3052_eval.dtb: cpu@0: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml#
>> arch/mips/boot/dts/ralink/rt3052_eval.dtb: syscon@0: compatible:1: 'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mtmips-sysc.yaml#
>> arch/mips/boot/dts/ralink/rt3052_eval.dtb: syscon@0: compatible: ['ralink,rt3052-sysc', 'ralink,rt3050-sysc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mtmips-sysc.yaml#
   arch/mips/boot/dts/ralink/rt3052_eval.dtb: intc@200: $nodename:0: 'intc@200' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/ralink,rt2880-intc.yaml#
   arch/mips/boot/dts/ralink/rt3052_eval.dtb: intc@200: compatible:0: 'ralink,rt2880-intc' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/ralink,rt2880-intc.yaml#
   arch/mips/boot/dts/ralink/rt3052_eval.dtb: intc@200: compatible: ['ralink,rt3052-intc', 'ralink,rt2880-intc'] is too long
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/ralink,rt2880-intc.yaml#
   arch/mips/boot/dts/ralink/rt3052_eval.dtb: /palmbus@10000000/intc@200: failed to match any schema with compatible: ['ralink,rt3052-intc', 'ralink,rt2880-intc']
   arch/mips/boot/dts/ralink/rt3052_eval.dtb: /palmbus@10000000/memc@300: failed to match any schema with compatible: ['ralink,rt3052-memc', 'ralink,rt3050-memc']
   arch/mips/boot/dts/ralink/rt3052_eval.dtb: /palmbus@10000000/memc@300: failed to match any schema with compatible: ['ralink,rt3052-memc', 'ralink,rt3050-memc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
