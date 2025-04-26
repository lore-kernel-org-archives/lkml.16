Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A322025D20F
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 17:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745689948; cv=none; b=oY6qaBYWipvk2drCkDxX20O7cgSSfU4NlCsyrSLzp6RFXhOSSC1dgLhpgX4fc3DPXIKHgJSTIBAmSFgdkry2eSHLl/e7oXcj/+ot8M5ZffccQhcTnwewFnX8ElQGSW6LxXsIUJeNlKviMbfNDM9oLDL7g2xUkuqbZd6f7g9ILLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745689948; c=relaxed/simple;
	bh=DuWkln8Z15mNTBXs5f3ihM5iRSFco8ncZC9SdiejQRo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SFAXIBK+jb4Y6TeeZ2EYryyGeF+MGdV1EemXM1kckPwS/z8Mi6WFXpMHoi2BJ9mMEv0boWMiATOInr6RijHSSyufHjb75eWT3njCQXp/khpglmYUc5o64Ug35eaK/PKqyVhQlgLYFgweu3jR+E6rD70f8v2A0DVK0Qk5w1yWAts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gtQ6xT/v; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gtQ6xT/v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745689947; x=1777225947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DuWkln8Z15mNTBXs5f3ihM5iRSFco8ncZC9SdiejQRo=;
  b=gtQ6xT/vH/Or8PeZmiGrJJJ8eUPXoXeh3Nl/sPOnNVpw1cyqdnotE9So
   QLDJyM8fq2x64GXZztEaYiLM2cnWkB0fRhw2VWiS9b9J6D8FmGeiD++cN
   raXEKlt4HNNt0tI3bCL3dw3JTLBCErx34peRqaO+G1Jte2LZBx3nYUk35
   Km0xUd/9wTkLo0sjXjuYPOga6kdarT07n4YxRaei61K08Bxr6aiyT5DEi
   f/p9DNUKlW0Lawe/dPwhraB1pSVyRl5Hrj78LuAY1eKqxRN9HOtoYKeDG
   Gavq8fyqEM4r0v7w7URQ+WUvADzEL19lszFHdbCGs7yLmTPilaemdumwp
   Q==;
X-CSE-ConnectionGUID: ktbTrlElQuC+RD+iRWuxMQ==
X-CSE-MsgGUID: +38hcebVT82pLsBm18HGFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="58688258"
X-IronPort-AV: E=Sophos;i="6.15,242,1739865600"; 
   d="scan'208";a="58688258"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 10:52:27 -0700
X-CSE-ConnectionGUID: hRpJ6hhbRwKtXtJzKhRYyQ==
X-CSE-MsgGUID: H+CgsN/2QlOgMGG6CzTRig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,242,1739865600"; 
   d="scan'208";a="138310006"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 26 Apr 2025 10:52:25 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8jhO-0005wH-0c;
	Sat, 26 Apr 2025 17:52:22 +0000
Date: Sun, 27 Apr 2025 01:51:30 +0800
From: kernel test robot <lkp@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	John Harrison <John.C.Harrison@intel.com>
Subject: drivers/gpu/drm/xe/xe_vm.c:1409: warning: Function parameter or
 struct member 'XE_VM_FLAG_GSC' not described in 'if'
Message-ID: <202504270116.2ROXcxtz-lkp@intel.com>
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
commit: dcdd6b84d9acaa0794c29de7024cfdb20cfd7b92 drm/xe/pxp: Allocate PXP execution resources
date:   3 months ago
config: riscv-randconfig-002-20250426 (https://download.01.org/0day-ci/archive/20250427/202504270116.2ROXcxtz-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250427/202504270116.2ROXcxtz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504270116.2ROXcxtz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_vm.c:1409: warning: Function parameter or struct member 'XE_VM_FLAG_GSC' not described in 'if'
>> drivers/gpu/drm/xe/xe_vm.c:1409: warning: expecting prototype for GSC VMs are kernel(). Prototype was for if() instead


vim +1409 drivers/gpu/drm/xe/xe_vm.c

  1376	
  1377	struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
  1378	{
  1379		struct drm_gem_object *vm_resv_obj;
  1380		struct xe_vm *vm;
  1381		int err, number_tiles = 0;
  1382		struct xe_tile *tile;
  1383		u8 id;
  1384	
  1385		/*
  1386		 * Since the GSCCS is not user-accessible, we don't expect a GSC VM to
  1387		 * ever be in faulting mode.
  1388		 */
  1389		xe_assert(xe, !((flags & XE_VM_FLAG_GSC) && (flags & XE_VM_FLAG_FAULT_MODE)));
  1390	
  1391		vm = kzalloc(sizeof(*vm), GFP_KERNEL);
  1392		if (!vm)
  1393			return ERR_PTR(-ENOMEM);
  1394	
  1395		vm->xe = xe;
  1396	
  1397		vm->size = 1ull << xe->info.va_bits;
  1398	
  1399		vm->flags = flags;
  1400	
  1401		/**
  1402		 * GSC VMs are kernel-owned, only used for PXP ops and can sometimes be
  1403		 * manipulated under the PXP mutex. However, the PXP mutex can be taken
  1404		 * under a user-VM lock when the PXP session is started at exec_queue
  1405		 * creation time. Those are different VMs and therefore there is no risk
  1406		 * of deadlock, but we need to tell lockdep that this is the case or it
  1407		 * will print a warning.
  1408		 */
> 1409		if (flags & XE_VM_FLAG_GSC) {
  1410			static struct lock_class_key gsc_vm_key;
  1411	
  1412			__init_rwsem(&vm->lock, "gsc_vm", &gsc_vm_key);
  1413		} else {
  1414			init_rwsem(&vm->lock);
  1415		}
  1416		mutex_init(&vm->snap_mutex);
  1417	
  1418		INIT_LIST_HEAD(&vm->rebind_list);
  1419	
  1420		INIT_LIST_HEAD(&vm->userptr.repin_list);
  1421		INIT_LIST_HEAD(&vm->userptr.invalidated);
  1422		init_rwsem(&vm->userptr.notifier_lock);
  1423		spin_lock_init(&vm->userptr.invalidated_lock);
  1424	
  1425		ttm_lru_bulk_move_init(&vm->lru_bulk_move);
  1426	
  1427		INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
  1428	
  1429		INIT_LIST_HEAD(&vm->preempt.exec_queues);
  1430		vm->preempt.min_run_period_ms = 10;	/* FIXME: Wire up to uAPI */
  1431	
  1432		for_each_tile(tile, xe, id)
  1433			xe_range_fence_tree_init(&vm->rftree[id]);
  1434	
  1435		vm->pt_ops = &xelp_pt_ops;
  1436	
  1437		/*
  1438		 * Long-running workloads are not protected by the scheduler references.
  1439		 * By design, run_job for long-running workloads returns NULL and the
  1440		 * scheduler drops all the references of it, hence protecting the VM
  1441		 * for this case is necessary.
  1442		 */
  1443		if (flags & XE_VM_FLAG_LR_MODE)
  1444			xe_pm_runtime_get_noresume(xe);
  1445	
  1446		vm_resv_obj = drm_gpuvm_resv_object_alloc(&xe->drm);
  1447		if (!vm_resv_obj) {
  1448			err = -ENOMEM;
  1449			goto err_no_resv;
  1450		}
  1451	
  1452		drm_gpuvm_init(&vm->gpuvm, "Xe VM", DRM_GPUVM_RESV_PROTECTED, &xe->drm,
  1453			       vm_resv_obj, 0, vm->size, 0, 0, &gpuvm_ops);
  1454	
  1455		drm_gem_object_put(vm_resv_obj);
  1456	
  1457		err = xe_vm_lock(vm, true);
  1458		if (err)
  1459			goto err_close;
  1460	
  1461		if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
  1462			vm->flags |= XE_VM_FLAG_64K;
  1463	
  1464		for_each_tile(tile, xe, id) {
  1465			if (flags & XE_VM_FLAG_MIGRATION &&
  1466			    tile->id != XE_VM_FLAG_TILE_ID(flags))
  1467				continue;
  1468	
  1469			vm->pt_root[id] = xe_pt_create(vm, tile, xe->info.vm_max_level);
  1470			if (IS_ERR(vm->pt_root[id])) {
  1471				err = PTR_ERR(vm->pt_root[id]);
  1472				vm->pt_root[id] = NULL;
  1473				goto err_unlock_close;
  1474			}
  1475		}
  1476	
  1477		if (xe_vm_has_scratch(vm)) {
  1478			for_each_tile(tile, xe, id) {
  1479				if (!vm->pt_root[id])
  1480					continue;
  1481	
  1482				err = xe_vm_create_scratch(xe, tile, vm);
  1483				if (err)
  1484					goto err_unlock_close;
  1485			}
  1486			vm->batch_invalidate_tlb = true;
  1487		}
  1488	
  1489		if (vm->flags & XE_VM_FLAG_LR_MODE) {
  1490			INIT_WORK(&vm->preempt.rebind_work, preempt_rebind_work_func);
  1491			vm->batch_invalidate_tlb = false;
  1492		}
  1493	
  1494		/* Fill pt_root after allocating scratch tables */
  1495		for_each_tile(tile, xe, id) {
  1496			if (!vm->pt_root[id])
  1497				continue;
  1498	
  1499			xe_pt_populate_empty(tile, vm, vm->pt_root[id]);
  1500		}
  1501		xe_vm_unlock(vm);
  1502	
  1503		/* Kernel migration VM shouldn't have a circular loop.. */
  1504		if (!(flags & XE_VM_FLAG_MIGRATION)) {
  1505			for_each_tile(tile, xe, id) {
  1506				struct xe_exec_queue *q;
  1507				u32 create_flags = EXEC_QUEUE_FLAG_VM;
  1508	
  1509				if (!vm->pt_root[id])
  1510					continue;
  1511	
  1512				q = xe_exec_queue_create_bind(xe, tile, create_flags, 0);
  1513				if (IS_ERR(q)) {
  1514					err = PTR_ERR(q);
  1515					goto err_close;
  1516				}
  1517				vm->q[id] = q;
  1518				number_tiles++;
  1519			}
  1520		}
  1521	
  1522		if (number_tiles > 1)
  1523			vm->composite_fence_ctx = dma_fence_context_alloc(1);
  1524	
  1525		trace_xe_vm_create(vm);
  1526	
  1527		return vm;
  1528	
  1529	err_unlock_close:
  1530		xe_vm_unlock(vm);
  1531	err_close:
  1532		xe_vm_close_and_put(vm);
  1533		return ERR_PTR(err);
  1534	
  1535	err_no_resv:
  1536		mutex_destroy(&vm->snap_mutex);
  1537		for_each_tile(tile, xe, id)
  1538			xe_range_fence_tree_fini(&vm->rftree[id]);
  1539		ttm_lru_bulk_move_fini(&xe->ttm, &vm->lru_bulk_move);
  1540		kfree(vm);
  1541		if (flags & XE_VM_FLAG_LR_MODE)
  1542			xe_pm_runtime_put(xe);
  1543		return ERR_PTR(err);
  1544	}
  1545	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
