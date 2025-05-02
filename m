Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25120215184
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 22:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746226778; cv=none; b=ez3NkWlVx8vUAKtlMaUVEN3d0dSBCGUbulqCXTEuTy2k2xwokRayBMyr2j9GeLqn7vAj7WoVu/89D17tvZK6EdqegZRAdMNspjWkY29LYrYLMuwkMvbdTbZb/QTsOv4WzHuD8cr/hBqiWobZdJtAXj9RGtwvh3MSFIb17Idccrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746226778; c=relaxed/simple;
	bh=6V0dMhs2NP5kdsJ98+ZkBKlkqzXleKNqZhRkr2QYxq8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KKTrlNif0hdNrXPULdyLynO3qZR2B2Ou6REcU4zRDlA6D7QBU8VGCkG3MyZ8mrTpwGSCxCFb/YBMVSRwHNQepTtwjq60I8hAVBQ/OrJwGAduGobPF79qmVlRu8jaU/G0ugJqv3bDeNw+5TkrSWoOTnHtTBVTgvbH1FbiiX3TNN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qtbkn3gn; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qtbkn3gn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746226777; x=1777762777;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6V0dMhs2NP5kdsJ98+ZkBKlkqzXleKNqZhRkr2QYxq8=;
  b=Qtbkn3gniTYEQrisF9P5IguatGC9UYJsKwnCWpvHvaZfL5sHAKLjyWkA
   awr/L1z0S3QAZtXHPkxDb7Pknu4NqKnYDAVGVBUVc5WiOGM9Qg+zD3c/F
   PVTsygHDBqPQhLJCgjEj33QfZ9D0ne3bKIVaq0u6dupg7Hfd2bBeA3u3S
   BcWqR8oMMFm5GLxnypWrL4Prh1kZo22V8vUZTV0iVNP4sULPtvOW9l4kq
   pLtmEcoO6BUnk7n5z6A2MPXCcEK1K9LFgQKQ1slgxuRDzXvorYWHNQJCA
   4cFPywnYVGLSFwF9nGtI61rCv6yugzFMqzXjY9EvTHpBFKmkaGqQPgM9+
   g==;
X-CSE-ConnectionGUID: Ve7qGNfESgqw7op+g0UW7g==
X-CSE-MsgGUID: fUSO/b/NQJy0POc1+uM3mA==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="48004913"
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="48004913"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 15:59:36 -0700
X-CSE-ConnectionGUID: 4ri05/NhSYyvqTaGYm2Fjg==
X-CSE-MsgGUID: m8w95Mt7RNaGKRCeZzEMzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="139552211"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 02 May 2025 15:59:33 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAzLv-00054T-1P;
	Fri, 02 May 2025 22:59:31 +0000
Date: Sat, 3 May 2025 06:58:52 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: arch/mips/boot/dts/realtek/cameo-rtl9302c-2x-rtl8224-2xge.dtb:
 switch@1b000000 (realtek,rtl9302c-switch): 'oneOf' conditional failed, one
 must be fixed:
Message-ID: <202505030630.YJsD28vV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b6a218ff8b88d09f86a17167772e7aaff1724e54
commit: 92575a2182376e1244fe0c45e85158f5ebbd7b51 dt-bindings: net: Add switch ports and interrupts to RTL9300
date:   2 months ago
config: mips-randconfig-051-20250503 (https://download.01.org/0day-ci/archive/20250503/202505030630.YJsD28vV-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250503/202505030630.YJsD28vV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505030630.YJsD28vV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/realtek/rtl83xx.dtsi:19.11-58.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/mips/boot/dts/realtek/cameo-rtl9302c-2x-rtl8224-2xge.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['mips,mips34Kc']
>> arch/mips/boot/dts/realtek/cameo-rtl9302c-2x-rtl8224-2xge.dtb: switch@1b000000 (realtek,rtl9302c-switch): 'oneOf' conditional failed, one must be fixed:
   	'ports' is a required property
   	'ethernet-ports' is a required property
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl9301-switch.yaml#
>> arch/mips/boot/dts/realtek/cameo-rtl9302c-2x-rtl8224-2xge.dtb: switch@1b000000 (realtek,rtl9302c-switch): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl9301-switch.yaml#
>> arch/mips/boot/dts/realtek/cameo-rtl9302c-2x-rtl8224-2xge.dtb: switch@1b000000 (realtek,rtl9302c-switch): 'interrupt-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl9301-switch.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
