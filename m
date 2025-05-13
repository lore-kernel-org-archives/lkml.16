Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209ED433C8
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 18:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747161114; cv=none; b=J3iI/DSCYdM15+uKimctqL3RcQN4NkUUowPD2El9M2RplBGRX7XciZUAW3IFE1LeGGclBbq/WP4PbUsgUr6fM+8eLdtxvWPRvpPz7ghaF6SM+NcqlhiOs5F+Q+5QejDmx0VOnMi1XlVCrgvWGv+BK6odQmlQQcAnL62T0phmWSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747161114; c=relaxed/simple;
	bh=rJBPnA8TGJX13YRuwqtzueA/mnw6MbJxj6hqdWnIYwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cNl/z3992f2e5z3IPgyDcaKu6Q12vqL9DbShR8/1N61Mw4d+ZN53gSrZRbHK+Jfv9DyVCezXJw79397Uu05m/Tmg51wGDxD7P62yl76sjnSEZEI4kH0JGBXQQB8rO2i7+Wp6at959v5DxUiTep5TfZBgXaPlIFuGq+DqF5gHrRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XW1tNotT; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XW1tNotT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747161112; x=1778697112;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=rJBPnA8TGJX13YRuwqtzueA/mnw6MbJxj6hqdWnIYwM=;
  b=XW1tNotT+Kx9pOK5yfOEpaFQMrQBh2kQIv/qNIzHB4y+XVk+wHq4MDrW
   qj7Hu9BDmcdBXd9tlWVLZ4FfPSGcaawwI768uwPEqKR4MPj8LeBfjpDjG
   fAJW08NAPIsKKrwlNfYdHyYJm1Q71Hr5bE2Pfb5sc6I3mJq5q1QjUQSVN
   WwSG6yiaw4Y0424N7ZeyNA+Pssk1Ux/haL5l6hQ5NcCiJnZvjWWw/yCvn
   Hsf3fCNKIfF08kFS7Ax+kRrjhmqD5hyhtwiICKxurze34/VyRYQWQHWb7
   YZAQ1LTLkvC2y7w6gDcYNmvpRPAcV0aUuDi/qbZke471pfgnQWCdWuhZa
   w==;
X-CSE-ConnectionGUID: OxgWfVrfRgySGbVDt/V/pw==
X-CSE-MsgGUID: 7RpDk/aCReGNuUZy2BAEBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="66576689"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="66576689"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 11:31:51 -0700
X-CSE-ConnectionGUID: soHmn7MdRkaAicAsiKNdeQ==
X-CSE-MsgGUID: zayVSekKTGOUlzo1T/zQSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="141831324"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 May 2025 11:31:48 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEuPq-000GJH-0W;
	Tue, 13 May 2025 18:31:46 +0000
Date: Wed, 14 May 2025 02:31:41 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>,
	dregan@broadcom.com, florian.fainelli@broadcom.com,
	computersforpeace@gmail.com, kamal.dasu@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com, miquel.raynal@bootlin.com,
	richard@nod.at, vigneshr@ti.com, jonas.gorski@gmail.com,
	dgcbueu@gmail.com, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	=?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: brcmnand: remove unused parameters
Message-ID: <202505140147.koX7Q1tn-lkp@intel.com>
References: <20250513061052.547392-1-noltari@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250513061052.547392-1-noltari@gmail.com>

Hi Álvaro,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mtd/nand/next]
[also build test WARNING on linus/master v6.15-rc6 next-20250513]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/lvaro-Fern-ndez-Rojas/mtd-rawnand-brcmnand-remove-unused-parameters/20250513-141316
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
patch link:    https://lore.kernel.org/r/20250513061052.547392-1-noltari%40gmail.com
patch subject: [PATCH] mtd: rawnand: brcmnand: remove unused parameters
config: arc-randconfig-002-20250514 (https://download.01.org/0day-ci/archive/20250514/202505140147.koX7Q1tn-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505140147.koX7Q1tn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505140147.koX7Q1tn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mtd/nand/raw/brcmnand/brcmnand.c: In function 'brcmnand_read_page':
>> drivers/mtd/nand/raw/brcmnand/brcmnand.c:2233:31: warning: unused variable 'host' [-Wunused-variable]
    2233 |         struct brcmnand_host *host = nand_get_controller_data(chip);
         |                               ^~~~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c: In function 'brcmnand_write_page':
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2359:31: warning: unused variable 'host' [-Wunused-variable]
    2359 |         struct brcmnand_host *host = nand_get_controller_data(chip);
         |                               ^~~~


vim +/host +2233 drivers/mtd/nand/raw/brcmnand/brcmnand.c

27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris           2015-03-06  2228  
b976168757f7f4 drivers/mtd/nand/raw/brcmnand/brcmnand.c Boris Brezillon        2018-09-06  2229  static int brcmnand_read_page(struct nand_chip *chip, uint8_t *buf,
b976168757f7f4 drivers/mtd/nand/raw/brcmnand/brcmnand.c Boris Brezillon        2018-09-06  2230  			      int oob_required, int page)
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris           2015-03-06  2231  {
b976168757f7f4 drivers/mtd/nand/raw/brcmnand/brcmnand.c Boris Brezillon        2018-09-06  2232  	struct mtd_info *mtd = nand_to_mtd(chip);
d699ed250c0738 drivers/mtd/nand/brcmnand/brcmnand.c     Boris Brezillon        2015-12-10 @2233  	struct brcmnand_host *host = nand_get_controller_data(chip);
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris           2015-03-06  2234  	u8 *oob = oob_required ? (u8 *)chip->oob_poi : NULL;
3c8260ce766342 drivers/mtd/nand/raw/brcmnand/brcmnand.c David Regan            2023-11-24  2235  	u64 addr = (u64)page << chip->page_shift;
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris           2015-03-06  2236  
898f67d076dde5 drivers/mtd/nand/raw/brcmnand/brcmnand.c Álvaro Fernández Rojas 2025-05-13  2237  	return brcmnand_read(mtd, chip, addr, mtd->writesize >> FC_SHIFT,
898f67d076dde5 drivers/mtd/nand/raw/brcmnand/brcmnand.c Álvaro Fernández Rojas 2025-05-13  2238  			     (u32 *)buf, oob);
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris           2015-03-06  2239  }
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris           2015-03-06  2240  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
