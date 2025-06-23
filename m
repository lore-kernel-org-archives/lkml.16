Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A89D2571BC
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 13:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750685778; cv=none; b=KZUy2bFw96fr6nl7m8H9tl1QueUpV6OMN8sjCH6+WH1OhcrhhCinScy1aQ9hGW++cQ/FDgiSZvQoDlStYfbOpdfQNjxV+kQXHOY2/SEz2NeaXAvBAhIDlF6lyAQMaqRJzAi48Qfp493IYTYNf7uw50eA4Fm2WzOXBAu4xqfjcVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750685778; c=relaxed/simple;
	bh=rhzfgTOoE4oo9IcVleJqDfgnk1Q4qJM9ZRjnB1UiO1U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tjXMXnJ1ndAwIgNSV9M8YStHSlffZiSkoQ5qQoJOysxudBQ3i1UiDlLA46y/k9XYoslLnz3xq0MOUIRfi7TMOtCeWTS/5BusqeS0BC3lnjILx+aT2h2pR+i05kjgIOQ5kWEsBgBIgclmQycTlRj2+Iv3cDL/DcKUerq1Uj1N2G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KRxG95la; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KRxG95la"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750685776; x=1782221776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rhzfgTOoE4oo9IcVleJqDfgnk1Q4qJM9ZRjnB1UiO1U=;
  b=KRxG95lasedEcbrtWAFD3kreXbubp7rKBqw0yB0VKYqZmbFlaeW4tD31
   cm2JVtD1pkk/P6kOOmJIMU6N38QoPqsMx1OHKvm1rYvrJVe9bNubrS5Kp
   P6xwb4Efdzu8GvsOVD76Gw31vBCvgqPLO+vq34nMNJh8G6hJH4p7eKpjz
   47zqzrNBh9M/BE7HAlPc5CtUg8j5OFXq//apLjF3mgMuDEZ/3k8ZXGVPh
   S+VdqWwCyqIqDgIIbYp2mJE0IGVCjrQ9mFZO4yBf/ezvgt9vbHR7E/lwU
   G/tzibCM39G9V3bRMHVywEruNpYkLyqbm8JZh73pi309etQM/T8vC5fjs
   A==;
X-CSE-ConnectionGUID: 7gwhTcVkQOmA3+BFwdgS5A==
X-CSE-MsgGUID: 1beiQaVdSHGW/lqpdfGjPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="40504169"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="40504169"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 06:36:15 -0700
X-CSE-ConnectionGUID: WZaU9leYQ9uA/xWA3IWY6g==
X-CSE-MsgGUID: g+0ZZD0DSaS7SlR+IaMasw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="175213545"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 23 Jun 2025 06:36:12 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uThLG-000Obc-0c;
	Mon, 23 Jun 2025 13:36:10 +0000
Date: Mon, 23 Jun 2025 21:35:15 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Subject: drivers/scsi/mpt3sas/mpt3sas_base.c:8388:1: warning: stack frame
 size (1056) exceeds limit (1024) in 'mpt3sas_base_attach'
Message-ID: <202506232109.AusR1CRE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yury,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   86731a2a651e58953fc949573895f2fa6d456841
commit: fda1dd3c54ef3c4200c2e77634a91610da973950 find: Switch from inline to __always_inline
date:   10 months ago
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20250623/202506232109.AusR1CRE-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 875b36a8742437b95f623bab1e0332562c7b4b3f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250623/202506232109.AusR1CRE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506232109.AusR1CRE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/scsi/mpt3sas/mpt3sas_base.c:52:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:22:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/mpt3sas/mpt3sas_base.c:8388:1: warning: stack frame size (1056) exceeds limit (1024) in 'mpt3sas_base_attach' [-Wframe-larger-than]
    8388 | mpt3sas_base_attach(struct MPT3SAS_ADAPTER *ioc)
         | ^
   6 warnings generated.


vim +/mpt3sas_base_attach +8388 drivers/scsi/mpt3sas/mpt3sas_base.c

f92363d1235949 Sreekanth Reddy          2012-11-30  8380  
f92363d1235949 Sreekanth Reddy          2012-11-30  8381  /**
f92363d1235949 Sreekanth Reddy          2012-11-30  8382   * mpt3sas_base_attach - attach controller instance
f92363d1235949 Sreekanth Reddy          2012-11-30  8383   * @ioc: per adapter object
f92363d1235949 Sreekanth Reddy          2012-11-30  8384   *
4beb4867f049ae Bart Van Assche          2018-06-15  8385   * Return: 0 for success, non-zero for failure.
f92363d1235949 Sreekanth Reddy          2012-11-30  8386   */
f92363d1235949 Sreekanth Reddy          2012-11-30  8387  int
f92363d1235949 Sreekanth Reddy          2012-11-30 @8388  mpt3sas_base_attach(struct MPT3SAS_ADAPTER *ioc)
f92363d1235949 Sreekanth Reddy          2012-11-30  8389  {
9c067c053f94d3 Suganath Prabu           2019-08-03  8390  	int r, i, rc;
f92363d1235949 Sreekanth Reddy          2012-11-30  8391  	int cpu_id, last_cpu_id = 0;
f92363d1235949 Sreekanth Reddy          2012-11-30  8392  
919d8a3f3fef99 Joe Perches              2018-09-17  8393  	dinitprintk(ioc, ioc_info(ioc, "%s\n", __func__));
f92363d1235949 Sreekanth Reddy          2012-11-30  8394  
f92363d1235949 Sreekanth Reddy          2012-11-30  8395  	/* setup cpu_msix_table */
f92363d1235949 Sreekanth Reddy          2012-11-30  8396  	ioc->cpu_count = num_online_cpus();
f92363d1235949 Sreekanth Reddy          2012-11-30  8397  	for_each_online_cpu(cpu_id)
f92363d1235949 Sreekanth Reddy          2012-11-30  8398  		last_cpu_id = cpu_id;
f92363d1235949 Sreekanth Reddy          2012-11-30  8399  	ioc->cpu_msix_table_sz = last_cpu_id + 1;
f92363d1235949 Sreekanth Reddy          2012-11-30  8400  	ioc->cpu_msix_table = kzalloc(ioc->cpu_msix_table_sz, GFP_KERNEL);
f92363d1235949 Sreekanth Reddy          2012-11-30  8401  	ioc->reply_queue_count = 1;
f92363d1235949 Sreekanth Reddy          2012-11-30  8402  	if (!ioc->cpu_msix_table) {
5b061980e36282 Sreekanth Reddy          2019-12-26  8403  		ioc_info(ioc, "Allocation for cpu_msix_table failed!!!\n");
f92363d1235949 Sreekanth Reddy          2012-11-30  8404  		r = -ENOMEM;
f92363d1235949 Sreekanth Reddy          2012-11-30  8405  		goto out_free_resources;
f92363d1235949 Sreekanth Reddy          2012-11-30  8406  	}
f92363d1235949 Sreekanth Reddy          2012-11-30  8407  
7786ab6aff9cea Sreekanth Reddy          2015-11-11  8408  	if (ioc->is_warpdrive) {
7786ab6aff9cea Sreekanth Reddy          2015-11-11  8409  		ioc->reply_post_host_index = kcalloc(ioc->cpu_msix_table_sz,
7786ab6aff9cea Sreekanth Reddy          2015-11-11  8410  		    sizeof(resource_size_t *), GFP_KERNEL);
7786ab6aff9cea Sreekanth Reddy          2015-11-11  8411  		if (!ioc->reply_post_host_index) {
5b061980e36282 Sreekanth Reddy          2019-12-26  8412  			ioc_info(ioc, "Allocation for reply_post_host_index failed!!!\n");
7786ab6aff9cea Sreekanth Reddy          2015-11-11  8413  			r = -ENOMEM;
7786ab6aff9cea Sreekanth Reddy          2015-11-11  8414  			goto out_free_resources;
7786ab6aff9cea Sreekanth Reddy          2015-11-11  8415  		}
7786ab6aff9cea Sreekanth Reddy          2015-11-11  8416  	}
7786ab6aff9cea Sreekanth Reddy          2015-11-11  8417  
610ef1e955cd26 Sreekanth Reddy          2019-06-24  8418  	ioc->smp_affinity_enable = smp_affinity_enable;
610ef1e955cd26 Sreekanth Reddy          2019-06-24  8419  
9b05c91ae7fbff Sreekanth Reddy          2014-09-12  8420  	ioc->rdpq_array_enable_assigned = 0;
55d4ce458c77f2 Jason Yan                2020-04-30  8421  	ioc->use_32bit_dma = false;
d6adc251dd2fed Suganath Prabu S         2021-03-05  8422  	ioc->dma_mask = 64;
4ca10f3e31745d Ranjan Kumar             2023-08-29  8423  	if (ioc->is_aero_ioc) {
b899202901a8ad Suganath Prabu           2018-12-07  8424  		ioc->base_readl = &_base_readl_aero;
4ca10f3e31745d Ranjan Kumar             2023-08-29  8425  		ioc->base_readl_ext_retry = &_base_readl_ext_retry;
4ca10f3e31745d Ranjan Kumar             2023-08-29  8426  	} else {
b899202901a8ad Suganath Prabu           2018-12-07  8427  		ioc->base_readl = &_base_readl;
4ca10f3e31745d Ranjan Kumar             2023-08-29  8428  		ioc->base_readl_ext_retry = &_base_readl;
4ca10f3e31745d Ranjan Kumar             2023-08-29  8429  	}
f92363d1235949 Sreekanth Reddy          2012-11-30  8430  	r = mpt3sas_base_map_resources(ioc);
f92363d1235949 Sreekanth Reddy          2012-11-30  8431  	if (r)
f92363d1235949 Sreekanth Reddy          2012-11-30  8432  		goto out_free_resources;
f92363d1235949 Sreekanth Reddy          2012-11-30  8433  
f92363d1235949 Sreekanth Reddy          2012-11-30  8434  	pci_set_drvdata(ioc->pdev, ioc->shost);
98c56ad32c33f0 Calvin Owens             2016-07-28  8435  	r = _base_get_ioc_facts(ioc);
9c067c053f94d3 Suganath Prabu           2019-08-03  8436  	if (r) {
19a622c39a9d49 Suganath Prabu S         2021-05-18  8437  		rc = mpt3sas_base_check_for_fault_and_issue_reset(ioc);
9c067c053f94d3 Suganath Prabu           2019-08-03  8438  		if (rc || (_base_get_ioc_facts(ioc)))
f92363d1235949 Sreekanth Reddy          2012-11-30  8439  			goto out_free_resources;
9c067c053f94d3 Suganath Prabu           2019-08-03  8440  	}
f92363d1235949 Sreekanth Reddy          2012-11-30  8441  
471ef9d4e49825 Sreekanth Reddy          2015-11-11  8442  	switch (ioc->hba_mpi_version_belonged) {
471ef9d4e49825 Sreekanth Reddy          2015-11-11  8443  	case MPI2_VERSION:
471ef9d4e49825 Sreekanth Reddy          2015-11-11  8444  		ioc->build_sg_scmd = &_base_build_sg_scmd;
471ef9d4e49825 Sreekanth Reddy          2015-11-11  8445  		ioc->build_sg = &_base_build_sg;
471ef9d4e49825 Sreekanth Reddy          2015-11-11  8446  		ioc->build_zero_len_sge = &_base_build_zero_len_sge;
5dd48a555a4043 Suganath Prabu S         2019-05-31  8447  		ioc->get_msix_index_for_smlio = &_base_get_msix_index;
471ef9d4e49825 Sreekanth Reddy          2015-11-11  8448  		break;
471ef9d4e49825 Sreekanth Reddy          2015-11-11  8449  	case MPI25_VERSION:
b130b0d56fa97e Suganath prabu Subramani 2016-01-28  8450  	case MPI26_VERSION:
f92363d1235949 Sreekanth Reddy          2012-11-30  8451  		/*
f92363d1235949 Sreekanth Reddy          2012-11-30  8452  		 * In SAS3.0,
f92363d1235949 Sreekanth Reddy          2012-11-30  8453  		 * SCSI_IO, SMP_PASSTHRU, SATA_PASSTHRU, Target Assist, and
2910a4a9e90a58 Randy Dunlap             2021-04-18  8454  		 * Target Status - all require the IEEE formatted scatter gather
f92363d1235949 Sreekanth Reddy          2012-11-30  8455  		 * elements.
f92363d1235949 Sreekanth Reddy          2012-11-30  8456  		 */
f92363d1235949 Sreekanth Reddy          2012-11-30  8457  		ioc->build_sg_scmd = &_base_build_sg_scmd_ieee;
f92363d1235949 Sreekanth Reddy          2012-11-30  8458  		ioc->build_sg = &_base_build_sg_ieee;
aff39e61218f9a Suganath Prabu Subramani 2017-10-31  8459  		ioc->build_nvme_prp = &_base_build_nvme_prp;
f92363d1235949 Sreekanth Reddy          2012-11-30  8460  		ioc->build_zero_len_sge = &_base_build_zero_len_sge_ieee;
f92363d1235949 Sreekanth Reddy          2012-11-30  8461  		ioc->sge_size_ieee = sizeof(Mpi2IeeeSgeSimple64_t);
5dd48a555a4043 Suganath Prabu S         2019-05-31  8462  		if (ioc->high_iops_queues)
5dd48a555a4043 Suganath Prabu S         2019-05-31  8463  			ioc->get_msix_index_for_smlio =
5dd48a555a4043 Suganath Prabu S         2019-05-31  8464  					&_base_get_high_iops_msix_index;
5dd48a555a4043 Suganath Prabu S         2019-05-31  8465  		else
5dd48a555a4043 Suganath Prabu S         2019-05-31  8466  			ioc->get_msix_index_for_smlio = &_base_get_msix_index;
471ef9d4e49825 Sreekanth Reddy          2015-11-11  8467  		break;
471ef9d4e49825 Sreekanth Reddy          2015-11-11  8468  	}
79c74d03d527f8 Suganath Prabu S         2019-05-31  8469  	if (ioc->atomic_desc_capable) {
79c74d03d527f8 Suganath Prabu S         2019-05-31  8470  		ioc->put_smid_default = &_base_put_smid_default_atomic;
79c74d03d527f8 Suganath Prabu S         2019-05-31  8471  		ioc->put_smid_scsi_io = &_base_put_smid_scsi_io_atomic;
79c74d03d527f8 Suganath Prabu S         2019-05-31  8472  		ioc->put_smid_fast_path =
79c74d03d527f8 Suganath Prabu S         2019-05-31  8473  				&_base_put_smid_fast_path_atomic;
79c74d03d527f8 Suganath Prabu S         2019-05-31  8474  		ioc->put_smid_hi_priority =
79c74d03d527f8 Suganath Prabu S         2019-05-31  8475  				&_base_put_smid_hi_priority_atomic;
79c74d03d527f8 Suganath Prabu S         2019-05-31  8476  	} else {
078a4cc1380de7 Suganath Prabu S         2019-05-31  8477  		ioc->put_smid_default = &_base_put_smid_default;
078a4cc1380de7 Suganath Prabu S         2019-05-31  8478  		ioc->put_smid_fast_path = &_base_put_smid_fast_path;
078a4cc1380de7 Suganath Prabu S         2019-05-31  8479  		ioc->put_smid_hi_priority = &_base_put_smid_hi_priority;
e5747439366c10 Suganath Prabu Subramani 2018-02-07  8480  		if (ioc->is_mcpu_endpoint)
79c74d03d527f8 Suganath Prabu S         2019-05-31  8481  			ioc->put_smid_scsi_io =
79c74d03d527f8 Suganath Prabu S         2019-05-31  8482  				&_base_put_smid_mpi_ep_scsi_io;
e5747439366c10 Suganath Prabu Subramani 2018-02-07  8483  		else
81c16f83231a92 Suganath Prabu Subramani 2016-10-26  8484  			ioc->put_smid_scsi_io = &_base_put_smid_scsi_io;
79c74d03d527f8 Suganath Prabu S         2019-05-31  8485  	}
f92363d1235949 Sreekanth Reddy          2012-11-30  8486  	/*
f92363d1235949 Sreekanth Reddy          2012-11-30  8487  	 * These function pointers for other requests that don't
f92363d1235949 Sreekanth Reddy          2012-11-30  8488  	 * the require IEEE scatter gather elements.
f92363d1235949 Sreekanth Reddy          2012-11-30  8489  	 *
f92363d1235949 Sreekanth Reddy          2012-11-30  8490  	 * For example Configuration Pages and SAS IOUNIT Control don't.
f92363d1235949 Sreekanth Reddy          2012-11-30  8491  	 */
f92363d1235949 Sreekanth Reddy          2012-11-30  8492  	ioc->build_sg_mpi = &_base_build_sg;
f92363d1235949 Sreekanth Reddy          2012-11-30  8493  	ioc->build_zero_len_sge_mpi = &_base_build_zero_len_sge;
f92363d1235949 Sreekanth Reddy          2012-11-30  8494  
fae21608c31ca9 Sreekanth Reddy          2021-07-05  8495  	r = mpt3sas_base_make_ioc_ready(ioc, SOFT_RESET);
f92363d1235949 Sreekanth Reddy          2012-11-30  8496  	if (r)
f92363d1235949 Sreekanth Reddy          2012-11-30  8497  		goto out_free_resources;
f92363d1235949 Sreekanth Reddy          2012-11-30  8498  
f92363d1235949 Sreekanth Reddy          2012-11-30  8499  	ioc->pfacts = kcalloc(ioc->facts.NumberOfPorts,
f92363d1235949 Sreekanth Reddy          2012-11-30  8500  	    sizeof(struct mpt3sas_port_facts), GFP_KERNEL);
f92363d1235949 Sreekanth Reddy          2012-11-30  8501  	if (!ioc->pfacts) {
f92363d1235949 Sreekanth Reddy          2012-11-30  8502  		r = -ENOMEM;
f92363d1235949 Sreekanth Reddy          2012-11-30  8503  		goto out_free_resources;
f92363d1235949 Sreekanth Reddy          2012-11-30  8504  	}
f92363d1235949 Sreekanth Reddy          2012-11-30  8505  
f92363d1235949 Sreekanth Reddy          2012-11-30  8506  	for (i = 0 ; i < ioc->facts.NumberOfPorts; i++) {
98c56ad32c33f0 Calvin Owens             2016-07-28  8507  		r = _base_get_port_facts(ioc, i);
9c067c053f94d3 Suganath Prabu           2019-08-03  8508  		if (r) {
19a622c39a9d49 Suganath Prabu S         2021-05-18  8509  			rc = mpt3sas_base_check_for_fault_and_issue_reset(ioc);
9c067c053f94d3 Suganath Prabu           2019-08-03  8510  			if (rc || (_base_get_port_facts(ioc, i)))
f92363d1235949 Sreekanth Reddy          2012-11-30  8511  				goto out_free_resources;
f92363d1235949 Sreekanth Reddy          2012-11-30  8512  		}
9c067c053f94d3 Suganath Prabu           2019-08-03  8513  	}
f92363d1235949 Sreekanth Reddy          2012-11-30  8514  
98c56ad32c33f0 Calvin Owens             2016-07-28  8515  	r = _base_allocate_memory_pools(ioc);
f92363d1235949 Sreekanth Reddy          2012-11-30  8516  	if (r)
f92363d1235949 Sreekanth Reddy          2012-11-30  8517  		goto out_free_resources;
f92363d1235949 Sreekanth Reddy          2012-11-30  8518  
288addd63b2478 Suganath Prabu           2019-02-15  8519  	if (irqpoll_weight > 0)
288addd63b2478 Suganath Prabu           2019-02-15  8520  		ioc->thresh_hold = irqpoll_weight;
288addd63b2478 Suganath Prabu           2019-02-15  8521  	else
288addd63b2478 Suganath Prabu           2019-02-15  8522  		ioc->thresh_hold = ioc->hba_queue_depth/4;
288addd63b2478 Suganath Prabu           2019-02-15  8523  
320e77acb32774 Suganath Prabu           2019-02-15  8524  	_base_init_irqpolls(ioc);
f92363d1235949 Sreekanth Reddy          2012-11-30  8525  	init_waitqueue_head(&ioc->reset_wq);
f92363d1235949 Sreekanth Reddy          2012-11-30  8526  
f92363d1235949 Sreekanth Reddy          2012-11-30  8527  	/* allocate memory pd handle bitmask list */
f92363d1235949 Sreekanth Reddy          2012-11-30  8528  	ioc->pd_handles_sz = (ioc->facts.MaxDevHandle / 8);
f92363d1235949 Sreekanth Reddy          2012-11-30  8529  	if (ioc->facts.MaxDevHandle % 8)
f92363d1235949 Sreekanth Reddy          2012-11-30  8530  		ioc->pd_handles_sz++;
4254dfeda82f20 Breno Leitao             2024-06-05  8531  	/*
4254dfeda82f20 Breno Leitao             2024-06-05  8532  	 * pd_handles_sz should have, at least, the minimal room for
4254dfeda82f20 Breno Leitao             2024-06-05  8533  	 * set_bit()/test_bit(), otherwise out-of-memory touch may occur.
4254dfeda82f20 Breno Leitao             2024-06-05  8534  	 */
4254dfeda82f20 Breno Leitao             2024-06-05  8535  	ioc->pd_handles_sz = ALIGN(ioc->pd_handles_sz, sizeof(unsigned long));
4254dfeda82f20 Breno Leitao             2024-06-05  8536  
f92363d1235949 Sreekanth Reddy          2012-11-30  8537  	ioc->pd_handles = kzalloc(ioc->pd_handles_sz,
f92363d1235949 Sreekanth Reddy          2012-11-30  8538  	    GFP_KERNEL);
f92363d1235949 Sreekanth Reddy          2012-11-30  8539  	if (!ioc->pd_handles) {
f92363d1235949 Sreekanth Reddy          2012-11-30  8540  		r = -ENOMEM;
f92363d1235949 Sreekanth Reddy          2012-11-30  8541  		goto out_free_resources;
f92363d1235949 Sreekanth Reddy          2012-11-30  8542  	}
f92363d1235949 Sreekanth Reddy          2012-11-30  8543  	ioc->blocking_handles = kzalloc(ioc->pd_handles_sz,
f92363d1235949 Sreekanth Reddy          2012-11-30  8544  	    GFP_KERNEL);
f92363d1235949 Sreekanth Reddy          2012-11-30  8545  	if (!ioc->blocking_handles) {
f92363d1235949 Sreekanth Reddy          2012-11-30  8546  		r = -ENOMEM;
f92363d1235949 Sreekanth Reddy          2012-11-30  8547  		goto out_free_resources;
f92363d1235949 Sreekanth Reddy          2012-11-30  8548  	}
f92363d1235949 Sreekanth Reddy          2012-11-30  8549  
c696f7b83edeac Suganath Prabu Subramani 2016-10-26  8550  	/* allocate memory for pending OS device add list */
c696f7b83edeac Suganath Prabu Subramani 2016-10-26  8551  	ioc->pend_os_device_add_sz = (ioc->facts.MaxDevHandle / 8);
c696f7b83edeac Suganath Prabu Subramani 2016-10-26  8552  	if (ioc->facts.MaxDevHandle % 8)
c696f7b83edeac Suganath Prabu Subramani 2016-10-26  8553  		ioc->pend_os_device_add_sz++;
4254dfeda82f20 Breno Leitao             2024-06-05  8554  
4254dfeda82f20 Breno Leitao             2024-06-05  8555  	/*
4254dfeda82f20 Breno Leitao             2024-06-05  8556  	 * pend_os_device_add_sz should have, at least, the minimal room for
4254dfeda82f20 Breno Leitao             2024-06-05  8557  	 * set_bit()/test_bit(), otherwise out-of-memory may occur.
4254dfeda82f20 Breno Leitao             2024-06-05  8558  	 */
4254dfeda82f20 Breno Leitao             2024-06-05  8559  	ioc->pend_os_device_add_sz = ALIGN(ioc->pend_os_device_add_sz,
4254dfeda82f20 Breno Leitao             2024-06-05  8560  					   sizeof(unsigned long));
c696f7b83edeac Suganath Prabu Subramani 2016-10-26  8561  	ioc->pend_os_device_add = kzalloc(ioc->pend_os_device_add_sz,
c696f7b83edeac Suganath Prabu Subramani 2016-10-26  8562  	    GFP_KERNEL);
3401ecf7fc1b94 Jia-Ju Bai               2021-03-07  8563  	if (!ioc->pend_os_device_add) {
3401ecf7fc1b94 Jia-Ju Bai               2021-03-07  8564  		r = -ENOMEM;
c696f7b83edeac Suganath Prabu Subramani 2016-10-26  8565  		goto out_free_resources;
3401ecf7fc1b94 Jia-Ju Bai               2021-03-07  8566  	}
c696f7b83edeac Suganath Prabu Subramani 2016-10-26  8567  
c696f7b83edeac Suganath Prabu Subramani 2016-10-26  8568  	ioc->device_remove_in_progress_sz = ioc->pend_os_device_add_sz;
c696f7b83edeac Suganath Prabu Subramani 2016-10-26  8569  	ioc->device_remove_in_progress =
c696f7b83edeac Suganath Prabu Subramani 2016-10-26  8570  		kzalloc(ioc->device_remove_in_progress_sz, GFP_KERNEL);
3401ecf7fc1b94 Jia-Ju Bai               2021-03-07  8571  	if (!ioc->device_remove_in_progress) {
3401ecf7fc1b94 Jia-Ju Bai               2021-03-07  8572  		r = -ENOMEM;
c696f7b83edeac Suganath Prabu Subramani 2016-10-26  8573  		goto out_free_resources;
3401ecf7fc1b94 Jia-Ju Bai               2021-03-07  8574  	}
c696f7b83edeac Suganath Prabu Subramani 2016-10-26  8575  
f92363d1235949 Sreekanth Reddy          2012-11-30  8576  	ioc->fwfault_debug = mpt3sas_fwfault_debug;
f92363d1235949 Sreekanth Reddy          2012-11-30  8577  
f92363d1235949 Sreekanth Reddy          2012-11-30  8578  	/* base internal command bits */
f92363d1235949 Sreekanth Reddy          2012-11-30  8579  	mutex_init(&ioc->base_cmds.mutex);
f92363d1235949 Sreekanth Reddy          2012-11-30  8580  	ioc->base_cmds.reply = kzalloc(ioc->reply_sz, GFP_KERNEL);
f92363d1235949 Sreekanth Reddy          2012-11-30  8581  	ioc->base_cmds.status = MPT3_CMD_NOT_USED;
f92363d1235949 Sreekanth Reddy          2012-11-30  8582  
f92363d1235949 Sreekanth Reddy          2012-11-30  8583  	/* port_enable command bits */
f92363d1235949 Sreekanth Reddy          2012-11-30  8584  	ioc->port_enable_cmds.reply = kzalloc(ioc->reply_sz, GFP_KERNEL);
f92363d1235949 Sreekanth Reddy          2012-11-30  8585  	ioc->port_enable_cmds.status = MPT3_CMD_NOT_USED;
f92363d1235949 Sreekanth Reddy          2012-11-30  8586  
f92363d1235949 Sreekanth Reddy          2012-11-30  8587  	/* transport internal command bits */
f92363d1235949 Sreekanth Reddy          2012-11-30  8588  	ioc->transport_cmds.reply = kzalloc(ioc->reply_sz, GFP_KERNEL);
f92363d1235949 Sreekanth Reddy          2012-11-30  8589  	ioc->transport_cmds.status = MPT3_CMD_NOT_USED;
f92363d1235949 Sreekanth Reddy          2012-11-30  8590  	mutex_init(&ioc->transport_cmds.mutex);
f92363d1235949 Sreekanth Reddy          2012-11-30  8591  
f92363d1235949 Sreekanth Reddy          2012-11-30  8592  	/* scsih internal command bits */
f92363d1235949 Sreekanth Reddy          2012-11-30  8593  	ioc->scsih_cmds.reply = kzalloc(ioc->reply_sz, GFP_KERNEL);
f92363d1235949 Sreekanth Reddy          2012-11-30  8594  	ioc->scsih_cmds.status = MPT3_CMD_NOT_USED;
f92363d1235949 Sreekanth Reddy          2012-11-30  8595  	mutex_init(&ioc->scsih_cmds.mutex);
f92363d1235949 Sreekanth Reddy          2012-11-30  8596  
f92363d1235949 Sreekanth Reddy          2012-11-30  8597  	/* task management internal command bits */
f92363d1235949 Sreekanth Reddy          2012-11-30  8598  	ioc->tm_cmds.reply = kzalloc(ioc->reply_sz, GFP_KERNEL);
f92363d1235949 Sreekanth Reddy          2012-11-30  8599  	ioc->tm_cmds.status = MPT3_CMD_NOT_USED;
f92363d1235949 Sreekanth Reddy          2012-11-30  8600  	mutex_init(&ioc->tm_cmds.mutex);
f92363d1235949 Sreekanth Reddy          2012-11-30  8601  
f92363d1235949 Sreekanth Reddy          2012-11-30  8602  	/* config page internal command bits */
f92363d1235949 Sreekanth Reddy          2012-11-30  8603  	ioc->config_cmds.reply = kzalloc(ioc->reply_sz, GFP_KERNEL);
f92363d1235949 Sreekanth Reddy          2012-11-30  8604  	ioc->config_cmds.status = MPT3_CMD_NOT_USED;
f92363d1235949 Sreekanth Reddy          2012-11-30  8605  	mutex_init(&ioc->config_cmds.mutex);
f92363d1235949 Sreekanth Reddy          2012-11-30  8606  
f92363d1235949 Sreekanth Reddy          2012-11-30  8607  	/* ctl module internal command bits */
f92363d1235949 Sreekanth Reddy          2012-11-30  8608  	ioc->ctl_cmds.reply = kzalloc(ioc->reply_sz, GFP_KERNEL);
f92363d1235949 Sreekanth Reddy          2012-11-30  8609  	ioc->ctl_cmds.sense = kzalloc(SCSI_SENSE_BUFFERSIZE, GFP_KERNEL);
f92363d1235949 Sreekanth Reddy          2012-11-30  8610  	ioc->ctl_cmds.status = MPT3_CMD_NOT_USED;
f92363d1235949 Sreekanth Reddy          2012-11-30  8611  	mutex_init(&ioc->ctl_cmds.mutex);
f92363d1235949 Sreekanth Reddy          2012-11-30  8612  
a5dd7efd356abe Christophe JAILLET       2017-08-07  8613  	if (!ioc->base_cmds.reply || !ioc->port_enable_cmds.reply ||
a5dd7efd356abe Christophe JAILLET       2017-08-07  8614  	    !ioc->transport_cmds.reply || !ioc->scsih_cmds.reply ||
a5dd7efd356abe Christophe JAILLET       2017-08-07  8615  	    !ioc->tm_cmds.reply || !ioc->config_cmds.reply ||
a5dd7efd356abe Christophe JAILLET       2017-08-07  8616  	    !ioc->ctl_cmds.reply || !ioc->ctl_cmds.sense) {
f92363d1235949 Sreekanth Reddy          2012-11-30  8617  		r = -ENOMEM;
f92363d1235949 Sreekanth Reddy          2012-11-30  8618  		goto out_free_resources;
f92363d1235949 Sreekanth Reddy          2012-11-30  8619  	}
f92363d1235949 Sreekanth Reddy          2012-11-30  8620  
f92363d1235949 Sreekanth Reddy          2012-11-30  8621  	for (i = 0; i < MPI2_EVENT_NOTIFY_EVENTMASK_WORDS; i++)
f92363d1235949 Sreekanth Reddy          2012-11-30  8622  		ioc->event_masks[i] = -1;
f92363d1235949 Sreekanth Reddy          2012-11-30  8623  
f92363d1235949 Sreekanth Reddy          2012-11-30  8624  	/* here we enable the events we care about */
f92363d1235949 Sreekanth Reddy          2012-11-30  8625  	_base_unmask_events(ioc, MPI2_EVENT_SAS_DISCOVERY);
f92363d1235949 Sreekanth Reddy          2012-11-30  8626  	_base_unmask_events(ioc, MPI2_EVENT_SAS_BROADCAST_PRIMITIVE);
f92363d1235949 Sreekanth Reddy          2012-11-30  8627  	_base_unmask_events(ioc, MPI2_EVENT_SAS_TOPOLOGY_CHANGE_LIST);
f92363d1235949 Sreekanth Reddy          2012-11-30  8628  	_base_unmask_events(ioc, MPI2_EVENT_SAS_DEVICE_STATUS_CHANGE);
f92363d1235949 Sreekanth Reddy          2012-11-30  8629  	_base_unmask_events(ioc, MPI2_EVENT_SAS_ENCL_DEVICE_STATUS_CHANGE);
f92363d1235949 Sreekanth Reddy          2012-11-30  8630  	_base_unmask_events(ioc, MPI2_EVENT_IR_CONFIGURATION_CHANGE_LIST);
f92363d1235949 Sreekanth Reddy          2012-11-30  8631  	_base_unmask_events(ioc, MPI2_EVENT_IR_VOLUME);
f92363d1235949 Sreekanth Reddy          2012-11-30  8632  	_base_unmask_events(ioc, MPI2_EVENT_IR_PHYSICAL_DISK);
f92363d1235949 Sreekanth Reddy          2012-11-30  8633  	_base_unmask_events(ioc, MPI2_EVENT_IR_OPERATION_STATUS);
f92363d1235949 Sreekanth Reddy          2012-11-30  8634  	_base_unmask_events(ioc, MPI2_EVENT_LOG_ENTRY_ADDED);
2d8ce8c9d4b25b Sreekanth Reddy          2015-01-12  8635  	_base_unmask_events(ioc, MPI2_EVENT_TEMP_THRESHOLD);
a470a51cd64813 Chaitra P B              2016-05-06  8636  	_base_unmask_events(ioc, MPI2_EVENT_ACTIVE_CABLE_EXCEPTION);
95540b8eaf30d2 Chaitra P B              2018-04-24  8637  	_base_unmask_events(ioc, MPI2_EVENT_SAS_DEVICE_DISCOVERY_ERROR);
4318c73478474f Suganath Prabu Subramani 2017-10-31  8638  	if (ioc->hba_mpi_version_belonged == MPI26_VERSION) {
4318c73478474f Suganath Prabu Subramani 2017-10-31  8639  		if (ioc->is_gen35_ioc) {
4318c73478474f Suganath Prabu Subramani 2017-10-31  8640  			_base_unmask_events(ioc,
4318c73478474f Suganath Prabu Subramani 2017-10-31  8641  				MPI2_EVENT_PCIE_DEVICE_STATUS_CHANGE);
4318c73478474f Suganath Prabu Subramani 2017-10-31  8642  			_base_unmask_events(ioc, MPI2_EVENT_PCIE_ENUMERATION);
4318c73478474f Suganath Prabu Subramani 2017-10-31  8643  			_base_unmask_events(ioc,
4318c73478474f Suganath Prabu Subramani 2017-10-31  8644  				MPI2_EVENT_PCIE_TOPOLOGY_CHANGE_LIST);
4318c73478474f Suganath Prabu Subramani 2017-10-31  8645  		}
4318c73478474f Suganath Prabu Subramani 2017-10-31  8646  	}
19a622c39a9d49 Suganath Prabu S         2021-05-18  8647  	r = _base_make_ioc_operational(ioc);
19a622c39a9d49 Suganath Prabu S         2021-05-18  8648  	if (r == -EAGAIN) {
98c56ad32c33f0 Calvin Owens             2016-07-28  8649  		r = _base_make_ioc_operational(ioc);
f92363d1235949 Sreekanth Reddy          2012-11-30  8650  		if (r)
f92363d1235949 Sreekanth Reddy          2012-11-30  8651  			goto out_free_resources;
19a622c39a9d49 Suganath Prabu S         2021-05-18  8652  	}
f92363d1235949 Sreekanth Reddy          2012-11-30  8653  
ffedeae1fa545a Suganath Prabu           2019-08-03  8654  	/*
ffedeae1fa545a Suganath Prabu           2019-08-03  8655  	 * Copy current copy of IOCFacts in prev_fw_facts
ffedeae1fa545a Suganath Prabu           2019-08-03  8656  	 * and it will be used during online firmware upgrade.
ffedeae1fa545a Suganath Prabu           2019-08-03  8657  	 */
ffedeae1fa545a Suganath Prabu           2019-08-03  8658  	memcpy(&ioc->prev_fw_facts, &ioc->facts,
ffedeae1fa545a Suganath Prabu           2019-08-03  8659  	    sizeof(struct mpt3sas_facts));
ffedeae1fa545a Suganath Prabu           2019-08-03  8660  
16e179bda58f09 Sreekanth Reddy          2015-11-11  8661  	ioc->non_operational_loop = 0;
fce0aa08792b3a Sreekanth Reddy          2019-12-26  8662  	ioc->ioc_coredump_loop = 0;
459325c466d278 Chaitra P B              2017-01-23  8663  	ioc->got_task_abort_from_ioctl = 0;
f92363d1235949 Sreekanth Reddy          2012-11-30  8664  	return 0;
f92363d1235949 Sreekanth Reddy          2012-11-30  8665  
f92363d1235949 Sreekanth Reddy          2012-11-30  8666   out_free_resources:
f92363d1235949 Sreekanth Reddy          2012-11-30  8667  
f92363d1235949 Sreekanth Reddy          2012-11-30  8668  	ioc->remove_host = 1;
f92363d1235949 Sreekanth Reddy          2012-11-30  8669  
f92363d1235949 Sreekanth Reddy          2012-11-30  8670  	mpt3sas_base_free_resources(ioc);
f92363d1235949 Sreekanth Reddy          2012-11-30  8671  	_base_release_memory_pools(ioc);
f92363d1235949 Sreekanth Reddy          2012-11-30  8672  	pci_set_drvdata(ioc->pdev, NULL);
f92363d1235949 Sreekanth Reddy          2012-11-30  8673  	kfree(ioc->cpu_msix_table);
7786ab6aff9cea Sreekanth Reddy          2015-11-11  8674  	if (ioc->is_warpdrive)
7786ab6aff9cea Sreekanth Reddy          2015-11-11  8675  		kfree(ioc->reply_post_host_index);
f92363d1235949 Sreekanth Reddy          2012-11-30  8676  	kfree(ioc->pd_handles);
f92363d1235949 Sreekanth Reddy          2012-11-30  8677  	kfree(ioc->blocking_handles);
c696f7b83edeac Suganath Prabu Subramani 2016-10-26  8678  	kfree(ioc->device_remove_in_progress);
c696f7b83edeac Suganath Prabu Subramani 2016-10-26  8679  	kfree(ioc->pend_os_device_add);
f92363d1235949 Sreekanth Reddy          2012-11-30  8680  	kfree(ioc->tm_cmds.reply);
f92363d1235949 Sreekanth Reddy          2012-11-30  8681  	kfree(ioc->transport_cmds.reply);
f92363d1235949 Sreekanth Reddy          2012-11-30  8682  	kfree(ioc->scsih_cmds.reply);
f92363d1235949 Sreekanth Reddy          2012-11-30  8683  	kfree(ioc->config_cmds.reply);
f92363d1235949 Sreekanth Reddy          2012-11-30  8684  	kfree(ioc->base_cmds.reply);
f92363d1235949 Sreekanth Reddy          2012-11-30  8685  	kfree(ioc->port_enable_cmds.reply);
f92363d1235949 Sreekanth Reddy          2012-11-30  8686  	kfree(ioc->ctl_cmds.reply);
f92363d1235949 Sreekanth Reddy          2012-11-30  8687  	kfree(ioc->ctl_cmds.sense);
f92363d1235949 Sreekanth Reddy          2012-11-30  8688  	kfree(ioc->pfacts);
f92363d1235949 Sreekanth Reddy          2012-11-30  8689  	ioc->ctl_cmds.reply = NULL;
f92363d1235949 Sreekanth Reddy          2012-11-30  8690  	ioc->base_cmds.reply = NULL;
f92363d1235949 Sreekanth Reddy          2012-11-30  8691  	ioc->tm_cmds.reply = NULL;
f92363d1235949 Sreekanth Reddy          2012-11-30  8692  	ioc->scsih_cmds.reply = NULL;
f92363d1235949 Sreekanth Reddy          2012-11-30  8693  	ioc->transport_cmds.reply = NULL;
f92363d1235949 Sreekanth Reddy          2012-11-30  8694  	ioc->config_cmds.reply = NULL;
f92363d1235949 Sreekanth Reddy          2012-11-30  8695  	ioc->pfacts = NULL;
f92363d1235949 Sreekanth Reddy          2012-11-30  8696  	return r;
f92363d1235949 Sreekanth Reddy          2012-11-30  8697  }
f92363d1235949 Sreekanth Reddy          2012-11-30  8698  

:::::: The code at line 8388 was first introduced by commit
:::::: f92363d12359498f9a9960511de1a550f0ec41c2 [SCSI] mpt3sas: add new driver supporting 12GB SAS

:::::: TO: Sreekanth Reddy <Sreekanth.Reddy@lsi.com>
:::::: CC: James Bottomley <JBottomley@Parallels.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
