Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BDA221DA4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 05:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744004987; cv=none; b=f20pp2yKFkMVykBbOLex95qJkGBvyHtIzQx7ia6cj1sGCpMSJ+5+OClU1IdhsU1m6Ufb52N0TDvs5mltR7sCY8ZGlaFqvpXR2AlnOMbJhhL/Mveu5V1eDo3SlkxI0Mol+iIBRVHGl4WJPtOn08RXXuNQgXn2OTZhz99cuyB0GZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744004987; c=relaxed/simple;
	bh=+FuZ4lXffAc4LJv48Whc6SuLpxUH2pc87Bs1zC2YhxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ab4i4d8iQAbhw8Vfcl34Za1ApT0/M5RgGWmvjHfsm9Qxr/r2yiRCl5C85RnKhqfmqs4Leb0d9EefwSo01qmhGQdMuCHTAdxYRZbWU68ERJgWpPf5Nl5iX6cYCevRmVlXxiSwiITaeJVNEKemnMM5RCkpeds0ePjWqetIfono47E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TJOjkfJV; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TJOjkfJV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744004984; x=1775540984;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+FuZ4lXffAc4LJv48Whc6SuLpxUH2pc87Bs1zC2YhxU=;
  b=TJOjkfJVkRAHmC/CT0/GF2rXZwYCvWssfXCgTySEPwYhPtWTDMgwv9YN
   Eog3VHRgPWZcV204ZTTz5ScVzJtcORZlfAQqmD0yrr5ePL+ccEDJJCVkq
   BTtJ/AmkfhfREhyX2g4DGI14n1GH3SyU/1WPEH13gqpfsdzxCFVUiB/RK
   EdC2wzX0qt4jSc+yOESwuWscTGKvjH5w46h8xCp6Psm2wA+CRr1a7WvEm
   /m3wtwouGw3RFIXajhviMXOO5mB1j0iXgZjpwQXR8udsg+u7yGRriYBAx
   nz8e8W7cxbqmILSKAJx86x5rqi49uSEfAa9GvkH78q5eXJj6YSTWuy99w
   g==;
X-CSE-ConnectionGUID: 9E2LlNbxTFqXmC+F98UVKA==
X-CSE-MsgGUID: /13uzin+Rs6b4HrCEp/P7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56741271"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="56741271"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 22:49:44 -0700
X-CSE-ConnectionGUID: oxpQGkiUSNmubfhycnIP7A==
X-CSE-MsgGUID: f2t+c7CFRi+XVxpyWiuDlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="151043199"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Apr 2025 22:49:42 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1fMZ-00031b-32;
	Mon, 07 Apr 2025 05:49:39 +0000
Date: Mon, 7 Apr 2025 13:49:17 +0800
From: kernel test robot <lkp@intel.com>
To: Wentao Liang <vulab@iscas.ac.cn>, miquel.raynal@bootlin.com,
	richard@nod.at, vigneshr@ti.com
Cc: oe-kbuild-all@lists.linux.dev, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, Wentao Liang <vulab@iscas.ac.cn>
Subject: Re: [PATCH] mtd: nand: Add error log for marvell_nfc_end_cmd()
Message-ID: <202504071218.tZSv0K1o-lkp@intel.com>
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
[also build test ERROR on linus/master v6.15-rc1 next-20250407]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wentao-Liang/mtd-nand-Add-error-log-for-marvell_nfc_end_cmd/20250407-101213
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
patch link:    https://lore.kernel.org/r/20250407020917.1242-1-vulab%40iscas.ac.cn
patch subject: [PATCH] mtd: nand: Add error log for marvell_nfc_end_cmd()
config: arm64-randconfig-003-20250407 (https://download.01.org/0day-ci/archive/20250407/202504071218.tZSv0K1o-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250407/202504071218.tZSv0K1o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504071218.tZSv0K1o-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/nand/raw/marvell_nand.c: In function 'marvell_nfc_hw_ecc_bch_read_chunk':
>> drivers/mtd/nand/raw/marvell_nand.c:1354:3: error: 'err' undeclared (first use in this function)
      err = marvell_nfc_end_cmd(chip, NDSR_RDDREQ,
      ^~~
   drivers/mtd/nand/raw/marvell_nand.c:1354:3: note: each undeclared identifier is reported only once for each function it appears in


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
