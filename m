Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B914B22538F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 04:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744001201; cv=none; b=AW94OjgCvVmUHhdnJw0TogV6McrcedI3+THGHHXScIZW02oL81oO2+9hK79DesFArgDSyCbMMx0chnSK/GShgB9TSR1ZlC2F+YvxTrPq/+/i0dUpjYfR49PAftVRyuYLjc8UF4oTozBZb/onnyl/1IRRkuSh9FqalusAUXItr/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744001201; c=relaxed/simple;
	bh=cDebycVq9pZjSWmtfxT+24dkoAq4Mrn9Etuxjp80A74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gcCxEK66PPRryzWvkbkVa/y6L+wkFCDoUqmipXnOPViriLfMK78F2jQqtjf35/15d03z/SGy4YoAi3JoRVup1qx86inBLhDxIfSLYBOQibx2Gk6Pfy3ZlC4+wGP0s35hDrkv5jXbJY/2VIYir20DV+IHukkJ2tkrYiOu4l3tVa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=npah8DRN; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="npah8DRN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744001199; x=1775537199;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cDebycVq9pZjSWmtfxT+24dkoAq4Mrn9Etuxjp80A74=;
  b=npah8DRNXznRHxTEoznkf7Cuw6RnP3yuSOLa9wyitmUe+OSQPFBqwc6/
   YV69SglJ/3RPL3wkdNpPZnE6hFOhns+sTwM5npqZdzSZhDSifvx5EKigT
   TnR6pVdbPw2Y7/kEob/ipzSpkBQhmKabgf1l7WQw1PQbKRTltOZwxt1LY
   TYj3eb30M/FAwn0e4TDByGvNlRkTWAouHvLXTkdpAFtfNTL0BD5SjMhD1
   y2PQ4kn93a+MwDHeyrqU0VxgzRiiXE/EIljPcpFwOEVtbT3PMV7wUdG4Z
   LDsl64CLbd2Nnsluia26utJu5Wv7PXh8cPqsiUEHtX9mlQAYtURx+ni5R
   g==;
X-CSE-ConnectionGUID: d3yW1gUlQLqHtcQf48hYZQ==
X-CSE-MsgGUID: m+s/JUnuR5mo1IQwlyFoBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="45082029"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="45082029"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 21:46:39 -0700
X-CSE-ConnectionGUID: TiNzR/hbRMuCM2b0J0C9Kw==
X-CSE-MsgGUID: DIZn/0IFR/aeyqsIXFmV3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="128356380"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Apr 2025 21:46:37 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1eNW-0002zz-2D;
	Mon, 07 Apr 2025 04:46:34 +0000
Date: Mon, 7 Apr 2025 12:46:15 +0800
From: kernel test robot <lkp@intel.com>
To: Wentao Liang <vulab@iscas.ac.cn>, miquel.raynal@bootlin.com,
	richard@nod.at, vigneshr@ti.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: Re: [PATCH] mtd: nand: Add error log for marvell_nfc_end_cmd()
Message-ID: <202504071221.XxGT6EaS-lkp@intel.com>
References: <20250407020917.1242-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407020917.1242-1-vulab@iscas.ac.cn>

Hi Wentao,

kernel test robot noticed the following build errors:

[auto build test ERROR on mtd/nand/next]
[also build test ERROR on linus/master v6.15-rc1 next-20250404]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wentao-Liang/mtd-nand-Add-error-log-for-marvell_nfc_end_cmd/20250407-101213
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
patch link:    https://lore.kernel.org/r/20250407020917.1242-1-vulab%40iscas.ac.cn
patch subject: [PATCH] mtd: nand: Add error log for marvell_nfc_end_cmd()
config: arm64-randconfig-001-20250407 (https://download.01.org/0day-ci/archive/20250407/202504071221.XxGT6EaS-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250407/202504071221.XxGT6EaS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504071221.XxGT6EaS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/mtd/nand/raw/marvell_nand.c:89:
   In file included from include/linux/dmaengine.h:12:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mtd/nand/raw/marvell_nand.c:1354:3: error: use of undeclared identifier 'err'
    1354 |                 err = marvell_nfc_end_cmd(chip, NDSR_RDDREQ,
         |                 ^
   drivers/mtd/nand/raw/marvell_nand.c:1356:7: error: use of undeclared identifier 'err'
    1356 |                 if (err)
         |                     ^
   drivers/mtd/nand/raw/marvell_nand.c:1364:3: error: use of undeclared identifier 'err'
    1364 |                 err = marvell_nfc_end_cmd(chip, NDSR_RDDREQ,
         |                 ^
   drivers/mtd/nand/raw/marvell_nand.c:1366:7: error: use of undeclared identifier 'err'
    1366 |                 if (err)
         |                     ^
   3 warnings and 4 errors generated.


vim +/err +1354 drivers/mtd/nand/raw/marvell_nand.c

  1302	
  1303	static void marvell_nfc_hw_ecc_bch_read_chunk(struct nand_chip *chip, int chunk,
  1304						      u8 *data, unsigned int data_len,
  1305						      u8 *spare, unsigned int spare_len,
  1306						      int page)
  1307	{
  1308		struct marvell_nand_chip *marvell_nand = to_marvell_nand(chip);
  1309		struct marvell_nfc *nfc = to_marvell_nfc(chip->controller);
  1310		const struct marvell_hw_ecc_layout *lt = to_marvell_nand(chip)->layout;
  1311		int i, ret;
  1312		struct marvell_nfc_op nfc_op = {
  1313			.ndcb[0] = NDCB0_CMD_TYPE(TYPE_READ) |
  1314				   NDCB0_ADDR_CYC(marvell_nand->addr_cyc) |
  1315				   NDCB0_LEN_OVRD,
  1316			.ndcb[1] = NDCB1_ADDRS_PAGE(page),
  1317			.ndcb[2] = NDCB2_ADDR5_PAGE(page),
  1318			.ndcb[3] = data_len + spare_len,
  1319		};
  1320	
  1321		ret = marvell_nfc_prepare_cmd(chip);
  1322		if (ret)
  1323			return;
  1324	
  1325		if (chunk == 0)
  1326			nfc_op.ndcb[0] |= NDCB0_DBC |
  1327					  NDCB0_CMD1(NAND_CMD_READ0) |
  1328					  NDCB0_CMD2(NAND_CMD_READSTART);
  1329	
  1330		/*
  1331		 * Trigger the monolithic read on the first chunk, then naked read on
  1332		 * intermediate chunks and finally a last naked read on the last chunk.
  1333		 */
  1334		if (chunk == 0)
  1335			nfc_op.ndcb[0] |= NDCB0_CMD_XTYPE(XTYPE_MONOLITHIC_RW);
  1336		else if (chunk < lt->nchunks - 1)
  1337			nfc_op.ndcb[0] |= NDCB0_CMD_XTYPE(XTYPE_NAKED_RW);
  1338		else
  1339			nfc_op.ndcb[0] |= NDCB0_CMD_XTYPE(XTYPE_LAST_NAKED_RW);
  1340	
  1341		marvell_nfc_send_cmd(chip, &nfc_op);
  1342	
  1343		/*
  1344		 * According to the datasheet, when reading from NDDB
  1345		 * with BCH enabled, after each 32 bytes reads, we
  1346		 * have to make sure that the NDSR.RDDREQ bit is set.
  1347		 *
  1348		 * Drain the FIFO, 8 32-bit reads at a time, and skip
  1349		 * the polling on the last read.
  1350		 *
  1351		 * Length is a multiple of 32 bytes, hence it is a multiple of 8 too.
  1352		 */
  1353		for (i = 0; i < data_len; i += FIFO_DEPTH * BCH_SEQ_READS) {
> 1354			err = marvell_nfc_end_cmd(chip, NDSR_RDDREQ,
  1355						  "RDDREQ while draining FIFO (data)");
  1356			if (err)
  1357				dev_err(nfc->dev, "Fail to confirm the NDSR.RDDREQ");
  1358			marvell_nfc_xfer_data_in_pio(nfc, data,
  1359						     FIFO_DEPTH * BCH_SEQ_READS);
  1360			data += FIFO_DEPTH * BCH_SEQ_READS;
  1361		}
  1362	
  1363		for (i = 0; i < spare_len; i += FIFO_DEPTH * BCH_SEQ_READS) {
  1364			err = marvell_nfc_end_cmd(chip, NDSR_RDDREQ,
  1365						  "RDDREQ while draining FIFO (OOB)");
  1366			if (err)
  1367				dev_err(nfc->dev, "Fail to confirm the NDSR.RDDREQ");
  1368			marvell_nfc_xfer_data_in_pio(nfc, spare,
  1369						     FIFO_DEPTH * BCH_SEQ_READS);
  1370			spare += FIFO_DEPTH * BCH_SEQ_READS;
  1371		}
  1372	}
  1373	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
