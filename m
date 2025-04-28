Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABC22F44
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 04:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745814536; cv=none; b=XKzPYlJJ/xwZJsNkLoLE9NN0ijFp/DggOOamrLCzjhgK9zXljOvx4/TRSAX1eZuLb9QCsQ5zOKwMkIwogN2roX2HkkjD7IrzB9TyRVo7PMHuCMDdPF4JgDuTCqIG3sl9dXbjjYRVtxSP6OdGMAxToFUIZ7PE7RBmei4C9UYzjMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745814536; c=relaxed/simple;
	bh=d1lImxcL5KXXt5ekjHY3CgyCvgBRY/NhyBhBex+CUxo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TmjJpvxZpQIs4pCOb/6p0qdfzEdkAgDwWb3n94cXs7Na56OqsAcjFq6TOMC9IYss/51V6DJYNx316Lvzp86DQT8KQCwSoojGwd70HLHQR0xwmREtKK1aLqOOW1EWajPIJls24Z3C6n2Giyg36n5MPKoXhXE4vVD5j1DXFpjCw1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FunUyaLx; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FunUyaLx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745814534; x=1777350534;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d1lImxcL5KXXt5ekjHY3CgyCvgBRY/NhyBhBex+CUxo=;
  b=FunUyaLxSo7hp/bZi4S+FdaYSbCKSX5u833d9pnKyqSegMxcBxFrlERZ
   jm8O5jnaca+xKXkDG0L1kISFHBeTfGbskp1Z6cRn2Jy9ubpGvOS2ViUeI
   kXbcC3K7m86O0xBYBQrLhGUlsGLzy7jJfDKqSptNIq9kjrCoSMUf75f9+
   sHMqJMDfNFuO4cZtsB2YlhfZF2V2jUvssh2dDsQ787h2PaABcsWCvZsz2
   HP25ZOIPQYjSyeWoBuJJOk+JSoN3+e3KvXUxoqHcIWvMcHs1uOpCqVlUj
   O31Nl+hPb35EDEEvxY6PSTERO8zoWRR3CdGuox9OfXqodO2SqNpNHdp3D
   A==;
X-CSE-ConnectionGUID: 7dMV5zQ8QOqhXLgDA0iLng==
X-CSE-MsgGUID: xRtwtIMkR4aOW1wA/sGSdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="58034495"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; 
   d="scan'208";a="58034495"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2025 21:28:53 -0700
X-CSE-ConnectionGUID: IF32Jd26QMinyimSE+FmbA==
X-CSE-MsgGUID: 51ynQFvFTCCb2YY9zK27RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; 
   d="scan'208";a="133140879"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Apr 2025 21:28:51 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9G6q-0006bt-1J;
	Mon, 28 Apr 2025 04:28:48 +0000
Date: Mon, 28 Apr 2025 12:28:08 +0800
From: kernel test robot <lkp@intel.com>
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Wei Liu <wei.liu@kernel.org>,
	Anirudh Rayabharam <anrayabh@linux.microsoft.com>,
	Jinank Jain <jinankjain@microsoft.com>,
	Mukesh Rathor <mrathor@linux.microsoft.com>,
	Muminul Islam <muislam@microsoft.com>,
	Praveen K Paladugu <prapal@linux.microsoft.com>,
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>,
	Roman Kisel <romank@linux.microsoft.com>
Subject: drivers/hv/mshv_root_main.c:1341:25: sparse: sparse: incorrect type
 in argument 1 (different address spaces)
Message-ID: <202504281257.v5WVmO03-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   02ddfb981de88a2c15621115dd7be2431252c568
commit: 621191d709b14882270dfd8ea5d7d6cdfebe2c35 Drivers: hv: Introduce mshv_root module to expose /dev/mshv to VMMs
date:   5 weeks ago
config: arm64-randconfig-r111-20250428 (https://download.01.org/0day-ci/archive/20250428/202504281257.v5WVmO03-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce: (https://download.01.org/0day-ci/archive/20250428/202504281257.v5WVmO03-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504281257.v5WVmO03-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hv/mshv_root_main.c:1341:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *addr @@     got void const * @@
   drivers/hv/mshv_root_main.c:1341:25: sparse:     expected void const [noderef] __user *addr
   drivers/hv/mshv_root_main.c:1341:25: sparse:     got void const *
   drivers/hv/mshv_root_main.c:2192:23: sparse: sparse: symbol 'mshv_reboot_nb' was not declared. Should it be static?

vim +1341 drivers/hv/mshv_root_main.c

  1317	
  1318	/*
  1319	 * This maps two things: guest RAM and for pci passthru mmio space.
  1320	 *
  1321	 * mmio:
  1322	 *  - vfio overloads vm_pgoff to store the mmio start pfn/spa.
  1323	 *  - Two things need to happen for mapping mmio range:
  1324	 *	1. mapped in the uaddr so VMM can access it.
  1325	 *	2. mapped in the hwpt (gfn <-> mmio phys addr) so guest can access it.
  1326	 *
  1327	 *   This function takes care of the second. The first one is managed by vfio,
  1328	 *   and hence is taken care of via vfio_pci_mmap_fault().
  1329	 */
  1330	static long
  1331	mshv_map_user_memory(struct mshv_partition *partition,
  1332			     struct mshv_user_mem_region mem)
  1333	{
  1334		struct mshv_mem_region *region;
  1335		struct vm_area_struct *vma;
  1336		bool is_mmio;
  1337		ulong mmio_pfn;
  1338		long ret;
  1339	
  1340		if (mem.flags & BIT(MSHV_SET_MEM_BIT_UNMAP) ||
> 1341		    !access_ok((const void *)mem.userspace_addr, mem.size))
  1342			return -EINVAL;
  1343	
  1344		mmap_read_lock(current->mm);
  1345		vma = vma_lookup(current->mm, mem.userspace_addr);
  1346		is_mmio = vma ? !!(vma->vm_flags & (VM_IO | VM_PFNMAP)) : 0;
  1347		mmio_pfn = is_mmio ? vma->vm_pgoff : 0;
  1348		mmap_read_unlock(current->mm);
  1349	
  1350		if (!vma)
  1351			return -EINVAL;
  1352	
  1353		ret = mshv_partition_create_region(partition, &mem, &region,
  1354						   is_mmio);
  1355		if (ret)
  1356			return ret;
  1357	
  1358		if (is_mmio)
  1359			ret = hv_call_map_mmio_pages(partition->pt_id, mem.guest_pfn,
  1360						     mmio_pfn, HVPFN_DOWN(mem.size));
  1361		else
  1362			ret = mshv_partition_mem_region_map(region);
  1363	
  1364		if (ret)
  1365			goto errout;
  1366	
  1367		/* Install the new region */
  1368		hlist_add_head(&region->hnode, &partition->pt_mem_regions);
  1369	
  1370		return 0;
  1371	
  1372	errout:
  1373		vfree(region);
  1374		return ret;
  1375	}
  1376	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
