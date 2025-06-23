Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB550A945
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750696486; cv=none; b=LwUmx8Coog7kgbLM6r6cImbxQOjC8e3qrLXqOUNP9qrSMfa4QOnm+xqlI8zrD7hpDDL/crzYqu1UeJPrlHT6ccQx5VDaltOyRxPgM53+/fh+Tbs47a0l02bzMbiLYg5EYSxGSonZAm2jVNMUq+3KBisocCr9UNJZSIV0X74BZEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750696486; c=relaxed/simple;
	bh=+qIiCgtBWa+1iq23dwO1R9zMl+4efB4et4THR8FKOq8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kpz15i4u16qexJSHgSXYzyTr1SA9FtKInrsJjdFYZcCq7AaZk9xwP+DqjvpkgVI529uc9O5N7V0NYxzSc8aEn7IPLPN5ApZAaUC7fCYBzQkUXKT1YRa08zo614MAMJ6OwXYqe6+i/dAtx2xyOApcbyGiCN3TXX6Xp8EFH59LXWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XhgrwvqK; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XhgrwvqK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750696485; x=1782232485;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+qIiCgtBWa+1iq23dwO1R9zMl+4efB4et4THR8FKOq8=;
  b=XhgrwvqKveT8ieswZAz/E3rcb0U2F6fy3+WIISSAgAd/As0/kUQLefgN
   7sYLS9HSX2Apon2E0DSP5nqtwJO2bPDt91RCMoUIIbQmO7mnDRbrFI86H
   5c0C08vExWeBT5DiHJyMhhkQOzW9R+dwfUK20P5MXGXzDLNFPMpC1gf8p
   56Y3/yRdqyFgE83HCHUaC4GZwEoMFzhQk3XooBi5AmJHt3/4ElpO4S5PF
   Lw3Q8Sr7UrfZ4OVdkcYIRGPu4b6m/xGga7JEq204DfG8RMetbpIMIug5u
   K3jEARzJGCMk7fmzF3tL5CckSqCS4jlm65U5ra/sUKeA/4edWVSeahysp
   A==;
X-CSE-ConnectionGUID: fWR0eZVHQn+aPgO2NnBKMw==
X-CSE-MsgGUID: UNqb56pLR4idshsveIp7PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52139960"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="52139960"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 09:34:44 -0700
X-CSE-ConnectionGUID: 84yHfsV9S/uiVxbZg6MLzw==
X-CSE-MsgGUID: 2FhlRV81T3CRGP6E/A5DSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="152343340"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Jun 2025 09:34:43 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTk80-000P6i-24;
	Mon, 23 Jun 2025 16:34:40 +0000
Date: Tue, 24 Jun 2025 00:34:33 +0800
From: kernel test robot <lkp@intel.com>
To: Junxian Huang <huangjunxian6@hisilicon.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Leon Romanovsky <leon@kernel.org>
Subject: drivers/infiniband/hw/hns/hns_roce_hw_v2.c:5359:1: warning: the
 frame size of 1088 bytes is larger than 1024 bytes
Message-ID: <202506240032.CSgIyFct-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Junxian,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   86731a2a651e58953fc949573895f2fa6d456841
commit: 8977b561216c7e693d61c6442657e33f134bfeb5 RDMA/hns: Clean up the legacy CONFIG_INFINIBAND_HNS
date:   6 months ago
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250624/202506240032.CSgIyFct-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506240032.CSgIyFct-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506240032.CSgIyFct-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/infiniband/hw/hns/hns_roce_hw_v2.c: In function 'hns_roce_v2_modify_qp':
>> drivers/infiniband/hw/hns/hns_roce_hw_v2.c:5359:1: warning: the frame size of 1088 bytes is larger than 1024 bytes [-Wframe-larger-than=]
    5359 | }
         | ^


vim +5359 drivers/infiniband/hw/hns/hns_roce_hw_v2.c

f0cb411aad23af Lang Cheng      2021-06-21  5293  
606bf89e98efb1 Lijun Ou        2019-07-08  5294  static int hns_roce_v2_modify_qp(struct ib_qp *ibqp,
606bf89e98efb1 Lijun Ou        2019-07-08  5295  				 const struct ib_qp_attr *attr,
606bf89e98efb1 Lijun Ou        2019-07-08  5296  				 int attr_mask, enum ib_qp_state cur_state,
2bb185c68bf4c1 Luoyouming      2022-12-24  5297  				 enum ib_qp_state new_state, struct ib_udata *udata)
606bf89e98efb1 Lijun Ou        2019-07-08  5298  {
606bf89e98efb1 Lijun Ou        2019-07-08  5299  	struct hns_roce_dev *hr_dev = to_hr_dev(ibqp->device);
606bf89e98efb1 Lijun Ou        2019-07-08  5300  	struct hns_roce_qp *hr_qp = to_hr_qp(ibqp);
4b42d05d0b2ca5 Lang Cheng      2019-08-08  5301  	struct hns_roce_v2_qp_context ctx[2];
4b42d05d0b2ca5 Lang Cheng      2019-08-08  5302  	struct hns_roce_v2_qp_context *context = ctx;
4b42d05d0b2ca5 Lang Cheng      2019-08-08  5303  	struct hns_roce_v2_qp_context *qpc_mask = ctx + 1;
ae1c61489c7fa0 Lijun Ou        2020-03-20  5304  	struct ib_device *ibdev = &hr_dev->ib_dev;
b5c229dc1585ad Lang Cheng      2019-08-08  5305  	int ret;
606bf89e98efb1 Lijun Ou        2019-07-08  5306  
26e990badde40b Jason Gunthorpe 2020-10-03  5307  	if (attr_mask & ~IB_QP_ATTR_STANDARD_BITS)
26e990badde40b Jason Gunthorpe 2020-10-03  5308  		return -EOPNOTSUPP;
26e990badde40b Jason Gunthorpe 2020-10-03  5309  
606bf89e98efb1 Lijun Ou        2019-07-08  5310  	/*
606bf89e98efb1 Lijun Ou        2019-07-08  5311  	 * In v2 engine, software pass context and context mask to hardware
606bf89e98efb1 Lijun Ou        2019-07-08  5312  	 * when modifying qp. If software need modify some fields in context,
606bf89e98efb1 Lijun Ou        2019-07-08  5313  	 * we should set all bits of the relevant fields in context mask to
606bf89e98efb1 Lijun Ou        2019-07-08  5314  	 * 0 at the same time, else set them to 0x1.
606bf89e98efb1 Lijun Ou        2019-07-08  5315  	 */
98912ee82a0c22 Wenpeng Liang   2020-09-16  5316  	memset(context, 0, hr_dev->caps.qpc_sz);
98912ee82a0c22 Wenpeng Liang   2020-09-16  5317  	memset(qpc_mask, 0xff, hr_dev->caps.qpc_sz);
98912ee82a0c22 Wenpeng Liang   2020-09-16  5318  
606bf89e98efb1 Lijun Ou        2019-07-08  5319  	ret = hns_roce_v2_set_abs_fields(ibqp, attr, attr_mask, cur_state,
2bb185c68bf4c1 Luoyouming      2022-12-24  5320  					 new_state, context, qpc_mask, udata);
606bf89e98efb1 Lijun Ou        2019-07-08  5321  	if (ret)
606bf89e98efb1 Lijun Ou        2019-07-08  5322  		goto out;
606bf89e98efb1 Lijun Ou        2019-07-08  5323  
606bf89e98efb1 Lijun Ou        2019-07-08  5324  	/* When QP state is err, SQ and RQ WQE should be flushed */
f0cb411aad23af Lang Cheng      2021-06-21  5325  	if (new_state == IB_QPS_ERR)
f0cb411aad23af Lang Cheng      2021-06-21  5326  		v2_set_flushed_fields(ibqp, context, qpc_mask);
606bf89e98efb1 Lijun Ou        2019-07-08  5327  
606bf89e98efb1 Lijun Ou        2019-07-08  5328  	/* Configure the optional fields */
606bf89e98efb1 Lijun Ou        2019-07-08  5329  	ret = hns_roce_v2_set_opt_fields(ibqp, attr, attr_mask, context,
606bf89e98efb1 Lijun Ou        2019-07-08  5330  					 qpc_mask);
606bf89e98efb1 Lijun Ou        2019-07-08  5331  	if (ret)
606bf89e98efb1 Lijun Ou        2019-07-08  5332  		goto out;
606bf89e98efb1 Lijun Ou        2019-07-08  5333  
f0cb411aad23af Lang Cheng      2021-06-21  5334  	hr_reg_write_bool(context, QPC_INV_CREDIT,
f0cb411aad23af Lang Cheng      2021-06-21  5335  			  to_hr_qp_type(hr_qp->ibqp.qp_type) == SERV_TYPE_XRC ||
f0cb411aad23af Lang Cheng      2021-06-21  5336  			  ibqp->srq);
f0cb411aad23af Lang Cheng      2021-06-21  5337  	hr_reg_clear(qpc_mask, QPC_INV_CREDIT);
c7bcb13442e1bd Lijun Ou        2018-11-24  5338  
926a01dc000d76 Wei Hu(Xavier   2017-08-30  5339) 	/* Every status migrate must change state */
f0cb411aad23af Lang Cheng      2021-06-21  5340  	hr_reg_write(context, QPC_QP_ST, new_state);
f0cb411aad23af Lang Cheng      2021-06-21  5341  	hr_reg_clear(qpc_mask, QPC_QP_ST);
926a01dc000d76 Wei Hu(Xavier   2017-08-30  5342) 
926a01dc000d76 Wei Hu(Xavier   2017-08-30  5343) 	/* SW pass context to HW */
98912ee82a0c22 Wenpeng Liang   2020-09-16  5344  	ret = hns_roce_v2_qp_modify(hr_dev, context, qpc_mask, hr_qp);
926a01dc000d76 Wei Hu(Xavier   2017-08-30  5345) 	if (ret) {
323275ac2ff15b wenglianfa      2024-10-24  5346  		ibdev_err_ratelimited(ibdev, "failed to modify QP, ret = %d.\n", ret);
926a01dc000d76 Wei Hu(Xavier   2017-08-30  5347) 		goto out;
926a01dc000d76 Wei Hu(Xavier   2017-08-30  5348) 	}
926a01dc000d76 Wei Hu(Xavier   2017-08-30  5349) 
926a01dc000d76 Wei Hu(Xavier   2017-08-30  5350) 	hr_qp->state = new_state;
926a01dc000d76 Wei Hu(Xavier   2017-08-30  5351) 
606bf89e98efb1 Lijun Ou        2019-07-08  5352  	hns_roce_v2_record_opt_fields(ibqp, attr, attr_mask);
926a01dc000d76 Wei Hu(Xavier   2017-08-30  5353) 
32548870d438ab Wenpeng Liang   2021-03-04  5354  	if (new_state == IB_QPS_RESET && !ibqp->uobject)
32548870d438ab Wenpeng Liang   2021-03-04  5355  		clear_qp(hr_qp);
926a01dc000d76 Wei Hu(Xavier   2017-08-30  5356) 
926a01dc000d76 Wei Hu(Xavier   2017-08-30  5357) out:
926a01dc000d76 Wei Hu(Xavier   2017-08-30  5358) 	return ret;
926a01dc000d76 Wei Hu(Xavier   2017-08-30 @5359) }
926a01dc000d76 Wei Hu(Xavier   2017-08-30  5360) 

:::::: The code at line 5359 was first introduced by commit
:::::: 926a01dc000d76df3f5b110dddcebfb517b8f57b RDMA/hns: Add QP operations support for hip08 SoC

:::::: TO: Wei Hu(Xavier) <xavier.huwei@huawei.com>
:::::: CC: Doug Ledford <dledford@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
