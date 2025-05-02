Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF902F2F
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 05:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746165360; cv=none; b=H6yk7QWHfA1+7VZcRW5nXZjS+kR8AdQITOv+omgwaePcl3HyNgZZ9anMFTw7EPl9dhmQ3+cdwr0PdYKTAsRNrMmNx1uhBvkn+EzzFh7N1OF9BjN7OdpXi50SYqJPfViaXSZtDwM/p3WebM8ArelsQziiGYIrGd9Zs6tI282CI0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746165360; c=relaxed/simple;
	bh=TtQAyY7k8o+pYqZfIFtejAoxTkozvAbrQ4tWdE3Gdh8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fo7elg7gbhJqndq48b4AejYWJCDxJzjBs1XUohxQbBE0reXj1IoCB7TnkcxOdckUQB/ZgAGecnHqCL5qotcXVgH5Y+1qvNDtDDnEoVBB/0An/E6feSvFML2qHAZ6n7ojGkhX2oMhxlaDrgI7A4qOiBwMliNKm8pubmQ2H4x7+V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B7VT+MZT; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B7VT+MZT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746165356; x=1777701356;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TtQAyY7k8o+pYqZfIFtejAoxTkozvAbrQ4tWdE3Gdh8=;
  b=B7VT+MZToh7qwcFHHVxc2UuS/39QEjbqhekPlYwOdvcK3zl4J7JwjnBU
   q7Q1gi5zQ4PF6K0PtNKDeMJYPQ0RIIQaEW4+lw5B0wjQWWeyPL/oV48uP
   ffeIq/e3vOEld1LdFqE28IIGvnR5GGxNhT2HmWueZxRZuhTozS8Oxn/7y
   YzcE5j9p004btaccccPP2er5zZ96m8jk/+9GUia0205tbS1EvoGLvTrAv
   n7qnI0Nks4zCrifA1+wEYL5TTHkLutHgtWsdkrFV7ztHo4U6XHs1uI40s
   5sJgq61vyHTkN7a9hMr8u2hfm7sw1coEoAq00YvorKlN5WLdhD18vdpXj
   g==;
X-CSE-ConnectionGUID: itxBpgfKR5Sbw5wuF21idA==
X-CSE-MsgGUID: 96DqoZSmR/WCSDbNNY4XlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47729228"
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="47729228"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 22:55:55 -0700
X-CSE-ConnectionGUID: 5BiortiJSNOnK2GgSQKhUw==
X-CSE-MsgGUID: SmMef99xSCmHuxOzXv5tyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="135087122"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 01 May 2025 22:55:53 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAjNH-0004Z7-1o;
	Fri, 02 May 2025 05:55:51 +0000
Date: Fri, 2 May 2025 13:54:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: arch/arm/boot/dts/arm/arm-realview-pb1176.dtb: fpga_flash@38000000
 (arm,versatile-flash): Unevaluated properties are not allowed ('partitions'
 was unexpected)
Message-ID: <202505021312.5IxUl2WK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b6ea1680d0ac0e45157a819c41b46565f4616186
commit: 9ea13d9e40cfb6675a299147bb89d6ca9e7aad9a dt-bindings: mtd: physmap: Ensure all properties are defined
date:   8 weeks ago
config: arm-randconfig-051-20250428 (https://download.01.org/0day-ci/archive/20250502/202505021312.5IxUl2WK-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505021312.5IxUl2WK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505021312.5IxUl2WK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/arm/arm-realview-pb1176.dts:310.24-326.5: Warning (unit_address_vs_reg): /soc/cache-controller: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/arm/arm-realview-pb1176.dts:301.46-308.5: Warning (simple_bus_reg): /soc/interrupt-controller@10120000: simple-bus unit address format error, expected "10121000"
   arch/arm/boot/dts/arm/arm-realview-pb1176.dts:310.24-326.5: Warning (simple_bus_reg): /soc/cache-controller: simple-bus unit address format error, expected "10110000"
   arch/arm/boot/dts/arm/arm-realview-pb1176.dts:328.7-332.5: Warning (simple_bus_reg): /soc/pmu: missing or empty reg/ranges property
   arch/arm/boot/dts/arm/arm-realview-pb1176.dts:530.48-539.5: Warning (simple_bus_reg): /fpga/interrupt-controller@10040000: simple-bus unit address format error, expected "10041000"
   arch/arm/boot/dts/arm/arm-realview-pb1176.dts:140.9-165.4: Warning (avoid_unnecessary_addr_size): /bridge: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/arm/arm-realview-pb1176.dtb: / (arm,realview-pb1176): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 134217728]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm/boot/dts/arm/arm-realview-pb1176.dtb: fpga_flash@38000000 (arm,versatile-flash): $nodename:0: 'fpga_flash@38000000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/arm/boot/dts/arm/arm-realview-pb1176.dtb: fpga_flash@38000000 (arm,versatile-flash): Unevaluated properties are not allowed ('partitions' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/arm/arm-realview-pb1176.dtb: secflash@3c000000 (arm,versatile-flash): $nodename:0: 'secflash@3c000000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/arm/arm-realview-pb1176.dtb: bridge (ti,ths8134a): '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/simple-bridge.yaml#
   arch/arm/boot/dts/arm/arm-realview-pb1176.dtb: soc (arm,realview-pb1176-soc): cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/arm/arm-realview-pb1176.dtb: soc (arm,realview-pb1176-soc): pmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/arm/arm-realview-pb1176.dtb: cache-controller (arm,l220-cache): 'arm,override-auxreg' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/arm/arm-realview-pb11mp.dts:42.9-49.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/arm/arm-realview-pb11mp.dts:663.46-672.5: Warning (simple_bus_reg): /soc/interrupt-controller@1e000000: simple-bus unit address format error, expected "1e001000"
   arch/arm/boot/dts/arm/arm-realview-pb11mp.dts:213.9-238.4: Warning (avoid_unnecessary_addr_size): /bridge: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/arm/arm-realview-pb11mp.dtb: / (arm,realview-pb11mp): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[1879048192, 536870912]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm/boot/dts/arm/arm-realview-pb11mp.dtb: flash0@40000000 (arm,versatile-flash): $nodename:0: 'flash0@40000000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/arm/boot/dts/arm/arm-realview-pb11mp.dtb: flash0@40000000 (arm,versatile-flash): Unevaluated properties are not allowed ('partitions' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/arm/arm-realview-pb11mp.dtb: flash1@44000000 (arm,versatile-flash): $nodename:0: 'flash1@44000000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/arm/boot/dts/arm/arm-realview-pb11mp.dtb: flash1@44000000 (arm,versatile-flash): Unevaluated properties are not allowed ('partitions' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/arm/arm-realview-pb11mp.dtb: bridge (ti,ths8134a): '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/simple-bridge.yaml#
   arch/arm/boot/dts/arm/arm-realview-pb11mp.dtb: mmcsd@10005000 (arm,pl18x): $nodename:0: 'mmcsd@10005000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/arm,pl18x.yaml#
   arch/arm/boot/dts/arm/arm-realview-pb11mp.dtb: mmcsd@10005000 (arm,pl18x): Unevaluated properties are not allowed ('bus-width', 'cap-mmc-highspeed', 'cap-sd-highspeed', 'cd-gpios', 'max-frequency', 'vmmc-supply', 'wp-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/arm,pl18x.yaml#
--
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:41.9-45.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/arm/arm-realview-eb.dts:51.39-58.5: Warning (simple_bus_reg): /soc/interrupt-controller@10040000: simple-bus unit address format error, expected "10041000"
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:114.9-139.4: Warning (avoid_unnecessary_addr_size): /bridge: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/arm/arm-realview-eb.dtb: / (arm,realview-eb): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 134217728]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb.dtb: flash0@40000000 (arm,versatile-flash): $nodename:0: 'flash0@40000000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/arm/boot/dts/arm/arm-realview-eb.dtb: flash0@40000000 (arm,versatile-flash): Unevaluated properties are not allowed ('partitions' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb.dtb: flash1@44000000 (arm,versatile-flash): $nodename:0: 'flash1@44000000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/arm/boot/dts/arm/arm-realview-eb.dtb: flash1@44000000 (arm,versatile-flash): Unevaluated properties are not allowed ('partitions' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb.dtb: ethernet@4e000000 (smsc,lan91c111): reg-io-width: 7 is not one of [1, 2, 4]
   	from schema $id: http://devicetree.org/schemas/net/smsc,lan91c111.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb.dtb: ethernet@4e000000 (smsc,lan91c111): Unevaluated properties are not allowed ('reg-io-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/smsc,lan91c111.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb.dtb: bridge (ti,ths8134a): '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/simple-bridge.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb.dtb: fpga (simple-bus): $nodename:0: 'fpga' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb.dtb: mmcsd@10005000 (arm,pl18x): $nodename:0: 'mmcsd@10005000' does not match '^mmc(@.*)?$'
--
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:41.9-45.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/arm/arm-realview-eb.dts:51.39-58.5: Warning (simple_bus_reg): /soc/interrupt-controller@10040000: simple-bus unit address format error, expected "10041000"
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:114.9-139.4: Warning (avoid_unnecessary_addr_size): /bridge: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/arm/arm-realview-eb-bbrevd.dtb: / (arm,realview-eb): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 134217728]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-bbrevd.dtb: flash0@40000000 (arm,versatile-flash): $nodename:0: 'flash0@40000000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/arm/boot/dts/arm/arm-realview-eb-bbrevd.dtb: flash0@40000000 (arm,versatile-flash): Unevaluated properties are not allowed ('partitions' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-bbrevd.dtb: flash1@44000000 (arm,versatile-flash): $nodename:0: 'flash1@44000000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/arm/boot/dts/arm/arm-realview-eb-bbrevd.dtb: flash1@44000000 (arm,versatile-flash): Unevaluated properties are not allowed ('partitions' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-bbrevd.dtb: ethernet@4e000000 (smsc,lan9118): reg-io-width: 7 is not one of [2, 4]
   	from schema $id: http://devicetree.org/schemas/net/smsc,lan9115.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-bbrevd.dtb: bridge (ti,ths8134a): '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/simple-bridge.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-bbrevd.dtb: fpga (simple-bus): $nodename:0: 'fpga' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-bbrevd.dtb: mmcsd@10005000 (arm,pl18x): $nodename:0: 'mmcsd@10005000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/arm,pl18x.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-bbrevd.dtb: mmcsd@10005000 (arm,pl18x): Unevaluated properties are not allowed ('bus-width', 'cap-mmc-highspeed', 'cap-sd-highspeed', 'cd-gpios', 'max-frequency', 'vmmc-supply', 'wp-gpios' were unexpected)
--
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:41.39-48.5: Warning (simple_bus_reg): /soc/interrupt-controller@1f000100: simple-bus unit address format error, expected "1f001000"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:51.46-60.5: Warning (simple_bus_reg): /soc/interrupt-controller@10040000: simple-bus unit address format error, expected "10041000"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:62.24-84.5: Warning (simple_bus_reg): /soc/cache-controller: simple-bus unit address format error, expected "1f002000"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:106.12-113.5: Warning (simple_bus_reg): /soc/pmu: missing or empty reg/ranges property
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:114.9-139.4: Warning (avoid_unnecessary_addr_size): /bridge: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/arm/arm-realview-eb-11mp.dtb: / (arm,realview-eb): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 134217728]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp.dtb: flash0@40000000 (arm,versatile-flash): $nodename:0: 'flash0@40000000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/arm/boot/dts/arm/arm-realview-eb-11mp.dtb: flash0@40000000 (arm,versatile-flash): Unevaluated properties are not allowed ('partitions' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp.dtb: flash1@44000000 (arm,versatile-flash): $nodename:0: 'flash1@44000000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/arm/boot/dts/arm/arm-realview-eb-11mp.dtb: flash1@44000000 (arm,versatile-flash): Unevaluated properties are not allowed ('partitions' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp.dtb: ethernet@4e000000 (smsc,lan91c111): reg-io-width: 7 is not one of [1, 2, 4]
   	from schema $id: http://devicetree.org/schemas/net/smsc,lan91c111.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp.dtb: ethernet@4e000000 (smsc,lan91c111): Unevaluated properties are not allowed ('reg-io-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/smsc,lan91c111.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp.dtb: bridge (ti,ths8134a): '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/simple-bridge.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp.dtb: fpga (simple-bus): $nodename:0: 'fpga' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp.dtb: mmcsd@10005000 (arm,pl18x): $nodename:0: 'mmcsd@10005000' does not match '^mmc(@.*)?$'
--
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:41.39-48.5: Warning (simple_bus_reg): /soc/interrupt-controller@1f000100: simple-bus unit address format error, expected "1f001000"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:51.46-60.5: Warning (simple_bus_reg): /soc/interrupt-controller@10040000: simple-bus unit address format error, expected "10041000"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:62.24-84.5: Warning (simple_bus_reg): /soc/cache-controller: simple-bus unit address format error, expected "1f002000"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:106.12-113.5: Warning (simple_bus_reg): /soc/pmu: missing or empty reg/ranges property
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:114.9-139.4: Warning (avoid_unnecessary_addr_size): /bridge: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd.dtb: / (arm,realview-eb): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 134217728]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd.dtb: flash0@40000000 (arm,versatile-flash): $nodename:0: 'flash0@40000000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd.dtb: flash0@40000000 (arm,versatile-flash): Unevaluated properties are not allowed ('partitions' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd.dtb: flash1@44000000 (arm,versatile-flash): $nodename:0: 'flash1@44000000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd.dtb: flash1@44000000 (arm,versatile-flash): Unevaluated properties are not allowed ('partitions' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd.dtb: ethernet@4e000000 (smsc,lan9118): reg-io-width: 7 is not one of [2, 4]
   	from schema $id: http://devicetree.org/schemas/net/smsc,lan9115.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd.dtb: bridge (ti,ths8134a): '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/simple-bridge.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd.dtb: fpga (simple-bus): $nodename:0: 'fpga' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd.dtb: mmcsd@10005000 (arm,pl18x): $nodename:0: 'mmcsd@10005000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/arm,pl18x.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd.dtb: mmcsd@10005000 (arm,pl18x): Unevaluated properties are not allowed ('bus-width', 'cap-mmc-highspeed', 'cap-sd-highspeed', 'cd-gpios', 'max-frequency', 'vmmc-supply', 'wp-gpios' were unexpected)
--
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:98.31-103.5: Warning (simple_bus_reg): /soc/watchdog@1f000620: simple-bus unit address format error, expected "10100620"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:106.12-113.5: Warning (simple_bus_reg): /soc/pmu: missing or empty reg/ranges property
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:114.9-139.4: Warning (avoid_unnecessary_addr_size): /bridge: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-ctrevb.dtb: / (arm,realview-eb): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 134217728]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-ctrevb.dtb: flash0@40000000 (arm,versatile-flash): $nodename:0: 'flash0@40000000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/arm/boot/dts/arm/arm-realview-eb-11mp-ctrevb.dtb: flash0@40000000 (arm,versatile-flash): Unevaluated properties are not allowed ('partitions' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-ctrevb.dtb: flash1@44000000 (arm,versatile-flash): $nodename:0: 'flash1@44000000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/arm/boot/dts/arm/arm-realview-eb-11mp-ctrevb.dtb: flash1@44000000 (arm,versatile-flash): Unevaluated properties are not allowed ('partitions' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-ctrevb.dtb: ethernet@4e000000 (smsc,lan91c111): reg-io-width: 7 is not one of [1, 2, 4]
   	from schema $id: http://devicetree.org/schemas/net/smsc,lan91c111.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-ctrevb.dtb: ethernet@4e000000 (smsc,lan91c111): Unevaluated properties are not allowed ('reg-io-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/smsc,lan91c111.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-ctrevb.dtb: bridge (ti,ths8134a): '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/simple-bridge.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-ctrevb.dtb: fpga (simple-bus): $nodename:0: 'fpga' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-ctrevb.dtb: mmcsd@10005000 (arm,pl18x): $nodename:0: 'mmcsd@10005000' does not match '^mmc(@.*)?$'
--
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:98.31-103.5: Warning (simple_bus_reg): /soc/watchdog@1f000620: simple-bus unit address format error, expected "10100620"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:106.12-113.5: Warning (simple_bus_reg): /soc/pmu: missing or empty reg/ranges property
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:114.9-139.4: Warning (avoid_unnecessary_addr_size): /bridge: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd-ctrevb.dtb: / (arm,realview-eb): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 134217728]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd-ctrevb.dtb: flash0@40000000 (arm,versatile-flash): $nodename:0: 'flash0@40000000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd-ctrevb.dtb: flash0@40000000 (arm,versatile-flash): Unevaluated properties are not allowed ('partitions' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd-ctrevb.dtb: flash1@44000000 (arm,versatile-flash): $nodename:0: 'flash1@44000000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd-ctrevb.dtb: flash1@44000000 (arm,versatile-flash): Unevaluated properties are not allowed ('partitions' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd-ctrevb.dtb: ethernet@4e000000 (smsc,lan9118): reg-io-width: 7 is not one of [2, 4]
   	from schema $id: http://devicetree.org/schemas/net/smsc,lan9115.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd-ctrevb.dtb: bridge (ti,ths8134a): '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/simple-bridge.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd-ctrevb.dtb: fpga (simple-bus): $nodename:0: 'fpga' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd-ctrevb.dtb: mmcsd@10005000 (arm,pl18x): $nodename:0: 'mmcsd@10005000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/arm,pl18x.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd-ctrevb.dtb: mmcsd@10005000 (arm,pl18x): Unevaluated properties are not allowed ('bus-width', 'cap-mmc-highspeed', 'cap-sd-highspeed', 'cd-gpios', 'max-frequency', 'vmmc-supply', 'wp-gpios' were unexpected)
--
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:41.39-48.5: Warning (simple_bus_reg): /soc/interrupt-controller@1f000100: simple-bus unit address format error, expected "1f001000"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:51.46-60.5: Warning (simple_bus_reg): /soc/interrupt-controller@10040000: simple-bus unit address format error, expected "10041000"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:62.24-84.5: Warning (simple_bus_reg): /soc/cache-controller: simple-bus unit address format error, expected "1f002000"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:106.12-113.5: Warning (simple_bus_reg): /soc/pmu: missing or empty reg/ranges property
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:114.9-139.4: Warning (avoid_unnecessary_addr_size): /bridge: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/arm/arm-realview-eb-a9mp.dtb: / (arm,realview-eb): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 134217728]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-a9mp.dtb: flash0@40000000 (arm,versatile-flash): $nodename:0: 'flash0@40000000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/arm/boot/dts/arm/arm-realview-eb-a9mp.dtb: flash0@40000000 (arm,versatile-flash): Unevaluated properties are not allowed ('partitions' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-a9mp.dtb: flash1@44000000 (arm,versatile-flash): $nodename:0: 'flash1@44000000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/arm/boot/dts/arm/arm-realview-eb-a9mp.dtb: flash1@44000000 (arm,versatile-flash): Unevaluated properties are not allowed ('partitions' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-a9mp.dtb: ethernet@4e000000 (smsc,lan91c111): reg-io-width: 7 is not one of [1, 2, 4]
   	from schema $id: http://devicetree.org/schemas/net/smsc,lan91c111.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-a9mp.dtb: ethernet@4e000000 (smsc,lan91c111): Unevaluated properties are not allowed ('reg-io-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/smsc,lan91c111.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-a9mp.dtb: bridge (ti,ths8134a): '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/simple-bridge.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-a9mp.dtb: fpga (simple-bus): $nodename:0: 'fpga' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-a9mp.dtb: mmcsd@10005000 (arm,pl18x): $nodename:0: 'mmcsd@10005000' does not match '^mmc(@.*)?$'
--
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:41.39-48.5: Warning (simple_bus_reg): /soc/interrupt-controller@1f000100: simple-bus unit address format error, expected "1f001000"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:51.46-60.5: Warning (simple_bus_reg): /soc/interrupt-controller@10040000: simple-bus unit address format error, expected "10041000"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:62.24-84.5: Warning (simple_bus_reg): /soc/cache-controller: simple-bus unit address format error, expected "1f002000"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:106.12-113.5: Warning (simple_bus_reg): /soc/pmu: missing or empty reg/ranges property
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:114.9-139.4: Warning (avoid_unnecessary_addr_size): /bridge: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/arm/arm-realview-eb-a9mp-bbrevd.dtb: / (arm,realview-eb): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 134217728]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-a9mp-bbrevd.dtb: flash0@40000000 (arm,versatile-flash): $nodename:0: 'flash0@40000000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/arm/boot/dts/arm/arm-realview-eb-a9mp-bbrevd.dtb: flash0@40000000 (arm,versatile-flash): Unevaluated properties are not allowed ('partitions' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-a9mp-bbrevd.dtb: flash1@44000000 (arm,versatile-flash): $nodename:0: 'flash1@44000000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/arm/boot/dts/arm/arm-realview-eb-a9mp-bbrevd.dtb: flash1@44000000 (arm,versatile-flash): Unevaluated properties are not allowed ('partitions' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-a9mp-bbrevd.dtb: ethernet@4e000000 (smsc,lan9118): reg-io-width: 7 is not one of [2, 4]
   	from schema $id: http://devicetree.org/schemas/net/smsc,lan9115.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-a9mp-bbrevd.dtb: bridge (ti,ths8134a): '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/simple-bridge.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-a9mp-bbrevd.dtb: fpga (simple-bus): $nodename:0: 'fpga' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-a9mp-bbrevd.dtb: mmcsd@10005000 (arm,pl18x): $nodename:0: 'mmcsd@10005000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/arm,pl18x.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-a9mp-bbrevd.dtb: mmcsd@10005000 (arm,pl18x): Unevaluated properties are not allowed ('bus-width', 'cap-mmc-highspeed', 'cap-sd-highspeed', 'cd-gpios', 'max-frequency', 'vmmc-supply', 'wp-gpios' were unexpected)
--
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:42.9-46.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:130.9-155.4: Warning (avoid_unnecessary_addr_size): /bridge: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/arm/arm-realview-pba8.dtb: / (arm,realview-pba8): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 134217728]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm/boot/dts/arm/arm-realview-pba8.dtb: flash0@40000000 (arm,versatile-flash): $nodename:0: 'flash0@40000000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/arm/boot/dts/arm/arm-realview-pba8.dtb: flash0@40000000 (arm,versatile-flash): Unevaluated properties are not allowed ('partitions' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/arm/arm-realview-pba8.dtb: flash1@44000000 (arm,versatile-flash): $nodename:0: 'flash1@44000000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/arm/boot/dts/arm/arm-realview-pba8.dtb: flash1@44000000 (arm,versatile-flash): Unevaluated properties are not allowed ('partitions' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/arm/arm-realview-pba8.dtb: bridge (ti,ths8134a): '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/simple-bridge.yaml#
   arch/arm/boot/dts/arm/arm-realview-pba8.dtb: fpga (simple-bus): $nodename:0: 'fpga' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/arm/arm-realview-pba8.dtb: mmcsd@10005000 (arm,pl18x): $nodename:0: 'mmcsd@10005000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/arm,pl18x.yaml#
   arch/arm/boot/dts/arm/arm-realview-pba8.dtb: mmcsd@10005000 (arm,pl18x): Unevaluated properties are not allowed ('bus-width', 'cap-mmc-highspeed', 'cap-sd-highspeed', 'cd-gpios', 'max-frequency', 'vmmc-supply', 'wp-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/arm,pl18x.yaml#
   arch/arm/boot/dts/arm/arm-realview-pba8.dtb: issp (simple-bus): $nodename:0: 'issp' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
--
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:42.9-46.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/arm/arm-realview-pbx-a9.dts:63.23-79.4: Warning (unit_address_vs_reg): /cache-controller: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:130.9-155.4: Warning (avoid_unnecessary_addr_size): /bridge: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/arm/arm-realview-pbx-a9.dts:81.20-84.4: Warning (unique_unit_address_if_enabled): /scu@1f000000: duplicate unit-address (also used in node /interrupt-controller@1f000000)
   arch/arm/boot/dts/arm/arm-realview-pbx-a9.dtb: / (arm,realview-pbx): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 134217728]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm/boot/dts/arm/arm-realview-pbx-a9.dtb: flash0@40000000 (arm,versatile-flash): $nodename:0: 'flash0@40000000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/arm/boot/dts/arm/arm-realview-pbx-a9.dtb: flash0@40000000 (arm,versatile-flash): Unevaluated properties are not allowed ('partitions' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/arm/arm-realview-pbx-a9.dtb: flash1@44000000 (arm,versatile-flash): $nodename:0: 'flash1@44000000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/arm/boot/dts/arm/arm-realview-pbx-a9.dtb: flash1@44000000 (arm,versatile-flash): Unevaluated properties are not allowed ('partitions' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/arm/arm-realview-pbx-a9.dtb: bridge (ti,ths8134a): '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/simple-bridge.yaml#
   arch/arm/boot/dts/arm/arm-realview-pbx-a9.dtb: fpga (simple-bus): $nodename:0: 'fpga' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/arm/arm-realview-pbx-a9.dtb: mmcsd@10005000 (arm,pl18x): $nodename:0: 'mmcsd@10005000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/arm,pl18x.yaml#
   arch/arm/boot/dts/arm/arm-realview-pbx-a9.dtb: mmcsd@10005000 (arm,pl18x): Unevaluated properties are not allowed ('bus-width', 'cap-mmc-highspeed', 'cap-sd-highspeed', 'cd-gpios', 'max-frequency', 'vmmc-supply', 'wp-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/arm,pl18x.yaml#
   arch/arm/boot/dts/arm/arm-realview-pbx-a9.dtb: issp (simple-bus): $nodename:0: 'issp' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
