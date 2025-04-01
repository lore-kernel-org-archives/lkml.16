Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF471494DB
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 18:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743533245; cv=none; b=h65E34VssNXyp7IqTLh9lXB4x6rkVKzq1ygX068Y+MAg8vRYecWps3xIW7CXb+UZ6teOmnOz4sE16zNkC6+zO4y0kxCxLv2qRsU+G906uulRo6n/Np/R85Kn7LEzy5VtGYVrLnCYPt+23vdmQqc+ZtF24Nuix7HF/QOAsi3aKTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743533245; c=relaxed/simple;
	bh=44HNRj6Jv8oETcBw3g3gA5P119b7d5iU/7EuwTzsSaI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LdRx9g9N2hMoqjcxxqhYOqej+FWIhjLzBotrG2U95eUMscSCVHVHJaTblXLvV7iFNQ4yLCF9Zqg++bMmMt2r7/mWUWwzBnvlh2QZJPD7//kH3L2jtOkOQyo6ySBrMNdL0TfK3LNxK2ckgSxtUjMVWmcikUzQiaiUL9O3V9vGhxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IGpQZa5A; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IGpQZa5A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743533243; x=1775069243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=44HNRj6Jv8oETcBw3g3gA5P119b7d5iU/7EuwTzsSaI=;
  b=IGpQZa5ACrmLVzUfCsOho+24mPCo7ce8GrR496x7KnA3vfR+ZJ3LdD+2
   tglhniNIhqumDrPCGGowD+SBycQfq+MR5WmZjlaHFaE0SdEfuDJiDTNYW
   midf6dz1yGxGSaS0MJRsqeuKUQJQ77MP5gNTZ3S4Al3ok+UNogJg2dApt
   hbXDYauNSLCtcMsoTULRGblHygBYEDbi/r0ySx3Rq/g7T7Z6FayHD2Fme
   oooE4qxwOKYlK5Toojza9rDVBi9QslKuA6NV6WVDYlxlvvhzaexGxP6sQ
   hfHi68Lm7jbkV7ONdvZhpPfLFeZ+1h8C1XFZZlERjsa2Jldf+yc3QsYIk
   g==;
X-CSE-ConnectionGUID: ni5a5RI/Sru6PkzSnpIX0A==
X-CSE-MsgGUID: dUI0kbAkTyqnQiPEVFHGVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44999473"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="44999473"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 11:47:21 -0700
X-CSE-ConnectionGUID: kkJExfyuS/2/ft5ESIe9iQ==
X-CSE-MsgGUID: Z8J4R3cwRk+jnZKqaP5cJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="157457092"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 01 Apr 2025 11:47:19 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzgdp-000A4O-2A;
	Tue, 01 Apr 2025 18:47:17 +0000
Date: Wed, 2 Apr 2025 02:46:38 +0800
From: kernel test robot <lkp@intel.com>
To: Brett Creeley <brett.creeley@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leonro@nvidia.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shannon Nelson <shannon.nelson@amd.com>
Subject: drivers/fwctl/pds/main.c:113:65: sparse: sparse: restricted __le32
 degrades to integer
Message-ID: <202504020246.Dfbhxoo9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   08733088b566b58283f0f12fb73f5db6a9a9de30
commit: 92c66ee829b99a860a90f62ef16df3e42f92edac pds_fwctl: add rpc and query support
date:   11 days ago
config: loongarch-randconfig-r111-20250401 (https://download.01.org/0day-ci/archive/20250402/202504020246.Dfbhxoo9-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250402/202504020246.Dfbhxoo9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504020246.Dfbhxoo9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/fwctl/pds/main.c:113:65: sparse: sparse: restricted __le32 degrades to integer
>> drivers/fwctl/pds/main.c:202:50: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] endpoint @@     got restricted __le32 [usertype] id @@
   drivers/fwctl/pds/main.c:202:50: sparse:     expected unsigned int [usertype] endpoint
   drivers/fwctl/pds/main.c:202:50: sparse:     got restricted __le32 [usertype] id
   drivers/fwctl/pds/main.c:250:29: sparse: sparse: restricted __le32 degrades to integer
   drivers/fwctl/pds/main.c:288:39: sparse: sparse: restricted __le32 degrades to integer
   drivers/fwctl/pds/main.c:294:40: sparse: sparse: restricted __le32 degrades to integer
   drivers/fwctl/pds/main.c:300:41: sparse: sparse: restricted __le32 degrades to integer
   drivers/fwctl/pds/main.c:329:44: sparse: sparse: restricted __le32 degrades to integer
>> drivers/fwctl/pds/main.c:330:21: sparse: sparse: cast to restricted __le32
   drivers/fwctl/pds/main.c:330:21: sparse: sparse: restricted __le32 degrades to integer
   drivers/fwctl/pds/main.c:330:21: sparse: sparse: restricted __le32 degrades to integer
>> drivers/fwctl/pds/main.c:330:21: sparse: sparse: cast to restricted __le32
   drivers/fwctl/pds/main.c:330:21: sparse: sparse: restricted __le32 degrades to integer
   drivers/fwctl/pds/main.c:330:21: sparse: sparse: restricted __le32 degrades to integer
>> drivers/fwctl/pds/main.c:405:56: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] flags @@     got int @@
   drivers/fwctl/pds/main.c:405:56: sparse:     expected restricted __le16 [usertype] flags
   drivers/fwctl/pds/main.c:405:56: sparse:     got int

vim +113 drivers/fwctl/pds/main.c

   104	
   105	static void pdsfc_free_endpoints(struct pdsfc_dev *pdsfc)
   106	{
   107		struct device *dev = &pdsfc->fwctl.dev;
   108		int i;
   109	
   110		if (!pdsfc->endpoints)
   111			return;
   112	
 > 113		for (i = 0; pdsfc->endpoint_info && i < pdsfc->endpoints->num_entries; i++)
   114			mutex_destroy(&pdsfc->endpoint_info[i].lock);
   115		vfree(pdsfc->endpoint_info);
   116		pdsfc->endpoint_info = NULL;
   117		dma_free_coherent(dev->parent, PAGE_SIZE,
   118				  pdsfc->endpoints, pdsfc->endpoints_pa);
   119		pdsfc->endpoints = NULL;
   120		pdsfc->endpoints_pa = DMA_MAPPING_ERROR;
   121	}
   122	
   123	static void pdsfc_free_operations(struct pdsfc_dev *pdsfc)
   124	{
   125		struct device *dev = &pdsfc->fwctl.dev;
   126		u32 num_endpoints;
   127		int i;
   128	
   129		num_endpoints = le32_to_cpu(pdsfc->endpoints->num_entries);
   130		for (i = 0; i < num_endpoints; i++) {
   131			struct pdsfc_rpc_endpoint_info *ei = &pdsfc->endpoint_info[i];
   132	
   133			if (ei->operations) {
   134				dma_free_coherent(dev->parent, PAGE_SIZE,
   135						  ei->operations, ei->operations_pa);
   136				ei->operations = NULL;
   137				ei->operations_pa = DMA_MAPPING_ERROR;
   138			}
   139		}
   140	}
   141	
   142	static struct pds_fwctl_query_data *pdsfc_get_endpoints(struct pdsfc_dev *pdsfc,
   143								dma_addr_t *pa)
   144	{
   145		struct device *dev = &pdsfc->fwctl.dev;
   146		union pds_core_adminq_comp comp = {0};
   147		struct pds_fwctl_query_data *data;
   148		union pds_core_adminq_cmd cmd;
   149		dma_addr_t data_pa;
   150		int err;
   151	
   152		data = dma_alloc_coherent(dev->parent, PAGE_SIZE, &data_pa, GFP_KERNEL);
   153		if (!data) {
   154			dev_err(dev, "Failed to map endpoint list\n");
   155			return ERR_PTR(-ENOMEM);
   156		}
   157	
   158		cmd = (union pds_core_adminq_cmd) {
   159			.fwctl_query = {
   160				.opcode = PDS_FWCTL_CMD_QUERY,
   161				.entity = PDS_FWCTL_RPC_ROOT,
   162				.version = 0,
   163				.query_data_buf_len = cpu_to_le32(PAGE_SIZE),
   164				.query_data_buf_pa = cpu_to_le64(data_pa),
   165			}
   166		};
   167	
   168		err = pds_client_adminq_cmd(pdsfc->padev, &cmd, sizeof(cmd), &comp, 0);
   169		if (err) {
   170			dev_err(dev, "Failed to send adminq cmd opcode: %u entity: %u err: %d\n",
   171				cmd.fwctl_query.opcode, cmd.fwctl_query.entity, err);
   172			dma_free_coherent(dev->parent, PAGE_SIZE, data, data_pa);
   173			return ERR_PTR(err);
   174		}
   175	
   176		*pa = data_pa;
   177	
   178		return data;
   179	}
   180	
   181	static int pdsfc_init_endpoints(struct pdsfc_dev *pdsfc)
   182	{
   183		struct pds_fwctl_query_data_endpoint *ep_entry;
   184		u32 num_endpoints;
   185		int i;
   186	
   187		pdsfc->endpoints = pdsfc_get_endpoints(pdsfc, &pdsfc->endpoints_pa);
   188		if (IS_ERR(pdsfc->endpoints))
   189			return PTR_ERR(pdsfc->endpoints);
   190	
   191		num_endpoints = le32_to_cpu(pdsfc->endpoints->num_entries);
   192		pdsfc->endpoint_info = vcalloc(num_endpoints,
   193					       sizeof(*pdsfc->endpoint_info));
   194		if (!pdsfc->endpoint_info) {
   195			pdsfc_free_endpoints(pdsfc);
   196			return -ENOMEM;
   197		}
   198	
   199		ep_entry = (struct pds_fwctl_query_data_endpoint *)pdsfc->endpoints->entries;
   200		for (i = 0; i < num_endpoints; i++) {
   201			mutex_init(&pdsfc->endpoint_info[i].lock);
 > 202			pdsfc->endpoint_info[i].endpoint = ep_entry[i].id;
   203		}
   204	
   205		return 0;
   206	}
   207	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
