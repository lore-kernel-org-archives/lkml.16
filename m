Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A84013AC1
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 18:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748541652; cv=none; b=f9a6K14ch6lDESkSGymvsfUZ+a6NJKSgfquLOgDKF0EFWxOIU0LNZyybPxNd18H/4XSqLunOeF5ZvMo02FtgniaRaNo4ItuGQkJgi7mu6ZHcN/oZYm0VuQh7H7dQhoyU4OhclCEJiHwjG5wKEikg8HTZyl8FjCZvMutEdrQc1Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748541652; c=relaxed/simple;
	bh=2BScaSoXpzwDAEUI/iw4F3ZwvW0/AWsXB3E9/5Nx000=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Aan+RjaMsEjEgMqDgTlqJwkF5oJJ+KUgQzHt0A60WzsEzVlrxM6GalW1/KyNeuKCFGQI60unL0OjcmU4WwLjDEvBlOHKTm9FeFoCUp14wntzVAJYBsNlGxaIB/HdUHf/NW8Ny3mJH/+IJj8ctY6FuWU6Or50R9ow2xRCikpoq2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YcqP+2Ys; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YcqP+2Ys"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748541650; x=1780077650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2BScaSoXpzwDAEUI/iw4F3ZwvW0/AWsXB3E9/5Nx000=;
  b=YcqP+2YszKVMQoKDdAn2vH/Pn8YdhVm5gGI3+4Pw7tjRm9/zaofWZ5Cd
   lFKM0O72fmccSLJ/vrnzdzSMx0q5kFk4W6c824P3BIpm366f4yG8CW9sl
   0NnwNg0qceHySA8wsEqLQ2RsNSjrG3ZnWi+osdj+yzrFNQxIxj7H2UbM0
   LaB6N/ELBId8YZjoSwzbT1CwHDkaaKw4omqzJtepo97e1PUDPKLWAhXvy
   jKv2DxsoeX0kYv3wjlelip5GnsUT0ND0AxcM8WruWH9oyY93fsajNhM+P
   GV6B01Eu/g4sNg/ZI1554ZxKDGny5DYOSAsHfbUBcMl/Zib3P1Ty9h9kV
   w==;
X-CSE-ConnectionGUID: q6YSQNYmRvebxL4WKAnbVw==
X-CSE-MsgGUID: 7FYlHR2/RNCVK8fj4+jHew==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="73152843"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; 
   d="scan'208";a="73152843"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 11:00:49 -0700
X-CSE-ConnectionGUID: YtUiqIbURweJuGw3OIppkg==
X-CSE-MsgGUID: 6tCpEaGzQ0iWnmLGQR6ZhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; 
   d="scan'208";a="148790808"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 29 May 2025 11:00:42 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKhYU-000Wy0-0E;
	Thu, 29 May 2025 18:00:38 +0000
Date: Fri, 30 May 2025 01:59:55 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: arch/powerpc/boot/dts/mpc8313erdb.dtb: timer@500 (fsl,mpc8313-gtm):
 'clock-frequency' is a required property
Message-ID: <202505300136.HOpO5P6y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   90b83efa6701656e02c86e7df2cb1765ea602d07
commit: eb7bc6920153a7d025c0b0001d5a6462fe08034f dt-bindings: timer: Convert fsl,gtm to YAML
date:   13 days ago
config: powerpc-randconfig-051-20250529 (https://download.01.org/0day-ci/archive/20250530/202505300136.HOpO5P6y-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250530/202505300136.HOpO5P6y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505300136.HOpO5P6y-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/mpc8313erdb.dtb: ethernet@24000 (gianfar): Unevaluated properties are not allowed ('sleep' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/powerpc/boot/dts/mpc8313erdb.dtb: ethernet@25000 (gianfar): Unevaluated properties are not allowed ('sleep' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/powerpc/boot/dts/mpc8313erdb.dtb: serial@4500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/mpc8313erdb.dtb: serial@4600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/mpc8313erdb.dtb: /soc8313@e0000000/power@b00: failed to match any schema with compatible: ['fsl,mpc8313-pmc', 'fsl,mpc8349-pmc']
   arch/powerpc/boot/dts/mpc8313erdb.dtb: /soc8313@e0000000/power@b00: failed to match any schema with compatible: ['fsl,mpc8313-pmc', 'fsl,mpc8349-pmc']
>> arch/powerpc/boot/dts/mpc8313erdb.dtb: timer@500 (fsl,mpc8313-gtm): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/timer/fsl,gtm.yaml#
   arch/powerpc/boot/dts/mpc8313erdb.dtb: timer@600 (fsl,mpc8313-gtm): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/timer/fsl,gtm.yaml#
   arch/powerpc/boot/dts/mpc8313erdb.dtb: sleep-nexus (simple-bus): $nodename:0: 'sleep-nexus' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mpc8313erdb.dtb: pci@e0008500 (fsl,mpc8349-pci): Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml#
   arch/powerpc/boot/dts/mpc8313erdb.dtb: dma@82a8 (fsl,mpc8313-dma): dma-channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc8313-dma-channel', 'fsl,elo-dma-channel'] is too long
   	'fsl,mpc8313-dma-channel' is not one of ['fsl,mpc8315-dma-channel', 'fsl,mpc8323-dma-channel', 'fsl,mpc8347-dma-channel', 'fsl,mpc8349-dma-channel', 'fsl,mpc8360-dma-channel', 'fsl,mpc8377-dma-channel', 'fsl,mpc8378-dma-channel', 'fsl,mpc8379-dma-channel']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
