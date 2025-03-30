Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A93A47
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 13:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743342619; cv=none; b=Jdt/GNA/sghfY79Ve4SKsDzsrHzHxbtrYcTPlyMgHm2qqNBkm3Szf6LK6NUS8wXZ1eTbL5wlfbrP1mbUlMOQJ9eSLRl8u8XsHN3Yrgp2eWp/CwE9zYda0yYmOm/mrWzAnJlBLUx64b216FtSuQBlW2yg//Rgi422MiCZYB52VWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743342619; c=relaxed/simple;
	bh=q6oKps2QzDXS+WadpVL7q5BlVzYZDHhU73n2OPm7sWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qDCiCpWltBo7t+nmrnk8t8I/Azptytdb5smw2qP4d+sg44JmJQZgS/h1SwXhrw4AlaPpIgAYu0SsVwEcJj/vtI0Jv0vNNObDUG5n9DjEayTnSfOu2vJdBtGMwQmyK5I7nR5IvCjv2G7gZc4UMkvlhgdrrYoNUHxQwCjPkPktjSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z7+aI484; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z7+aI484"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743342616; x=1774878616;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q6oKps2QzDXS+WadpVL7q5BlVzYZDHhU73n2OPm7sWM=;
  b=Z7+aI484Vr5vwM0hcTybCtxPh4IZ6MpbM7h801MJOApLe28Zhmp6XI+1
   i4gaE9MqecYbFpq8aSWIJrbPCOGcP7uRa+jH9cCsYCNXPaBkk7vT5yt5E
   AO/jQ8YsoORz0zMf3RoDCl75CeOYXKmx03hV23TH6w00FgCCdE3L2Ofqv
   dIYvkyaKbWxYHq2d6k8KxksQJUN015oi9V7oBBgAjNN3gJZiCp95Pxj7d
   FvFwq5ySWwgp+zX+vf36tyh68vCfI4Lppjyqk6do/WvGaFFbX+CbEWltu
   cR0XwTGBJsuUGoDm7qEENeGoXvm14tNkaM5r9cmupdhYfehDwhkjzgP4A
   w==;
X-CSE-ConnectionGUID: BlEvT9IbTIaUvvz44gh/Ug==
X-CSE-MsgGUID: 2M2JaGLASgmXIQLPtDfgiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="43893083"
X-IronPort-AV: E=Sophos;i="6.14,289,1736841600"; 
   d="scan'208";a="43893083"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2025 06:50:16 -0700
X-CSE-ConnectionGUID: aqilbuGiRS++DUWlf0o4ig==
X-CSE-MsgGUID: r5eC2AheQNW3botLv2sSHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,289,1736841600"; 
   d="scan'208";a="156798845"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 30 Mar 2025 06:50:13 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyt3D-0008j0-0b;
	Sun, 30 Mar 2025 13:50:11 +0000
Date: Sun, 30 Mar 2025 21:49:33 +0800
From: kernel test robot <lkp@intel.com>
To: Baoquan He <bhe@redhat.com>, akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH 2/7] mm/gup: check if both GUP_GET and GUP_PIN are set in
 __get_user_pages() earlier
Message-ID: <202503302151.MdrisJhx-lkp@intel.com>
References: <20250330121718.175815-3-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250330121718.175815-3-bhe@redhat.com>

Hi Baoquan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/mm-gup-fix-wrongly-calculated-returned-value-in-fault_in_safe_writeable/20250330-201949
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250330121718.175815-3-bhe%40redhat.com
patch subject: [PATCH 2/7] mm/gup: check if both GUP_GET and GUP_PIN are set in __get_user_pages() earlier
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250330/202503302151.MdrisJhx-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250330/202503302151.MdrisJhx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503302151.MdrisJhx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:110,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/spinlock.h:60,
                    from mm/gup.c:5:
   mm/gup.c: In function '__get_user_pages':
   mm/gup.c:1433:27: error: 'flags' undeclared (first use in this function)
    1433 |         if (WARN_ON_ONCE((flags & (FOLL_PIN | FOLL_GET)) ==
         |                           ^~~~~
   include/asm-generic/bug.h:121:32: note: in definition of macro 'WARN_ON_ONCE'
     121 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   mm/gup.c:1433:27: note: each undeclared identifier is reported only once for each function it appears in
    1433 |         if (WARN_ON_ONCE((flags & (FOLL_PIN | FOLL_GET)) ==
         |                           ^~~~~
   include/asm-generic/bug.h:121:32: note: in definition of macro 'WARN_ON_ONCE'
     121 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
>> mm/gup.c:1435:24: warning: returning 'void *' from a function with return type 'long int' makes integer from pointer without a cast [-Wint-conversion]
    1435 |                 return ERR_PTR(-EINVAL);
         |                        ^~~~~~~~~~~~~~~~


vim +1435 mm/gup.c

  1361	
  1362	/**
  1363	 * __get_user_pages() - pin user pages in memory
  1364	 * @mm:		mm_struct of target mm
  1365	 * @start:	starting user address
  1366	 * @nr_pages:	number of pages from start to pin
  1367	 * @gup_flags:	flags modifying pin behaviour
  1368	 * @pages:	array that receives pointers to the pages pinned.
  1369	 *		Should be at least nr_pages long. Or NULL, if caller
  1370	 *		only intends to ensure the pages are faulted in.
  1371	 * @locked:     whether we're still with the mmap_lock held
  1372	 *
  1373	 * Returns either number of pages pinned (which may be less than the
  1374	 * number requested), or an error. Details about the return value:
  1375	 *
  1376	 * -- If nr_pages is 0, returns 0.
  1377	 * -- If nr_pages is >0, but no pages were pinned, returns -errno.
  1378	 * -- If nr_pages is >0, and some pages were pinned, returns the number of
  1379	 *    pages pinned. Again, this may be less than nr_pages.
  1380	 * -- 0 return value is possible when the fault would need to be retried.
  1381	 *
  1382	 * The caller is responsible for releasing returned @pages, via put_page().
  1383	 *
  1384	 * Must be called with mmap_lock held.  It may be released.  See below.
  1385	 *
  1386	 * __get_user_pages walks a process's page tables and takes a reference to
  1387	 * each struct page that each user address corresponds to at a given
  1388	 * instant. That is, it takes the page that would be accessed if a user
  1389	 * thread accesses the given user virtual address at that instant.
  1390	 *
  1391	 * This does not guarantee that the page exists in the user mappings when
  1392	 * __get_user_pages returns, and there may even be a completely different
  1393	 * page there in some cases (eg. if mmapped pagecache has been invalidated
  1394	 * and subsequently re-faulted). However it does guarantee that the page
  1395	 * won't be freed completely. And mostly callers simply care that the page
  1396	 * contains data that was valid *at some point in time*. Typically, an IO
  1397	 * or similar operation cannot guarantee anything stronger anyway because
  1398	 * locks can't be held over the syscall boundary.
  1399	 *
  1400	 * If @gup_flags & FOLL_WRITE == 0, the page must not be written to. If
  1401	 * the page is written to, set_page_dirty (or set_page_dirty_lock, as
  1402	 * appropriate) must be called after the page is finished with, and
  1403	 * before put_page is called.
  1404	 *
  1405	 * If FOLL_UNLOCKABLE is set without FOLL_NOWAIT then the mmap_lock may
  1406	 * be released. If this happens *@locked will be set to 0 on return.
  1407	 *
  1408	 * A caller using such a combination of @gup_flags must therefore hold the
  1409	 * mmap_lock for reading only, and recognize when it's been released. Otherwise,
  1410	 * it must be held for either reading or writing and will not be released.
  1411	 *
  1412	 * In most cases, get_user_pages or get_user_pages_fast should be used
  1413	 * instead of __get_user_pages. __get_user_pages should be used only if
  1414	 * you need some special @gup_flags.
  1415	 */
  1416	static long __get_user_pages(struct mm_struct *mm,
  1417			unsigned long start, unsigned long nr_pages,
  1418			unsigned int gup_flags, struct page **pages,
  1419			int *locked)
  1420	{
  1421		long ret = 0, i = 0;
  1422		struct vm_area_struct *vma = NULL;
  1423		struct follow_page_context ctx = { NULL };
  1424	
  1425		if (!nr_pages)
  1426			return 0;
  1427	
  1428		start = untagged_addr_remote(mm, start);
  1429	
  1430		VM_BUG_ON(!!pages != !!(gup_flags & (FOLL_GET | FOLL_PIN)));
  1431	
  1432		/* FOLL_GET and FOLL_PIN are mutually exclusive. */
  1433		if (WARN_ON_ONCE((flags & (FOLL_PIN | FOLL_GET)) ==
  1434				 (FOLL_PIN | FOLL_GET)))
> 1435			return ERR_PTR(-EINVAL);
  1436	
  1437		do {
  1438			struct page *page;
  1439			unsigned int page_increm;
  1440	
  1441			/* first iteration or cross vma bound */
  1442			if (!vma || start >= vma->vm_end) {
  1443				/*
  1444				 * MADV_POPULATE_(READ|WRITE) wants to handle VMA
  1445				 * lookups+error reporting differently.
  1446				 */
  1447				if (gup_flags & FOLL_MADV_POPULATE) {
  1448					vma = vma_lookup(mm, start);
  1449					if (!vma) {
  1450						ret = -ENOMEM;
  1451						goto out;
  1452					}
  1453					if (check_vma_flags(vma, gup_flags)) {
  1454						ret = -EINVAL;
  1455						goto out;
  1456					}
  1457					goto retry;
  1458				}
  1459				vma = gup_vma_lookup(mm, start);
  1460				if (!vma && in_gate_area(mm, start)) {
  1461					ret = get_gate_page(mm, start & PAGE_MASK,
  1462							gup_flags, &vma,
  1463							pages ? &page : NULL);
  1464					if (ret)
  1465						goto out;
  1466					ctx.page_mask = 0;
  1467					goto next_page;
  1468				}
  1469	
  1470				if (!vma) {
  1471					ret = -EFAULT;
  1472					goto out;
  1473				}
  1474				ret = check_vma_flags(vma, gup_flags);
  1475				if (ret)
  1476					goto out;
  1477			}
  1478	retry:
  1479			/*
  1480			 * If we have a pending SIGKILL, don't keep faulting pages and
  1481			 * potentially allocating memory.
  1482			 */
  1483			if (fatal_signal_pending(current)) {
  1484				ret = -EINTR;
  1485				goto out;
  1486			}
  1487			cond_resched();
  1488	
  1489			page = follow_page_mask(vma, start, gup_flags, &ctx);
  1490			if (!page || PTR_ERR(page) == -EMLINK) {
  1491				ret = faultin_page(vma, start, gup_flags,
  1492						   PTR_ERR(page) == -EMLINK, locked);
  1493				switch (ret) {
  1494				case 0:
  1495					goto retry;
  1496				case -EBUSY:
  1497				case -EAGAIN:
  1498					ret = 0;
  1499					fallthrough;
  1500				case -EFAULT:
  1501				case -ENOMEM:
  1502				case -EHWPOISON:
  1503					goto out;
  1504				}
  1505				BUG();
  1506			} else if (PTR_ERR(page) == -EEXIST) {
  1507				/*
  1508				 * Proper page table entry exists, but no corresponding
  1509				 * struct page. If the caller expects **pages to be
  1510				 * filled in, bail out now, because that can't be done
  1511				 * for this page.
  1512				 */
  1513				if (pages) {
  1514					ret = PTR_ERR(page);
  1515					goto out;
  1516				}
  1517			} else if (IS_ERR(page)) {
  1518				ret = PTR_ERR(page);
  1519				goto out;
  1520			}
  1521	next_page:
  1522			page_increm = 1 + (~(start >> PAGE_SHIFT) & ctx.page_mask);
  1523			if (page_increm > nr_pages)
  1524				page_increm = nr_pages;
  1525	
  1526			if (pages) {
  1527				struct page *subpage;
  1528				unsigned int j;
  1529	
  1530				/*
  1531				 * This must be a large folio (and doesn't need to
  1532				 * be the whole folio; it can be part of it), do
  1533				 * the refcount work for all the subpages too.
  1534				 *
  1535				 * NOTE: here the page may not be the head page
  1536				 * e.g. when start addr is not thp-size aligned.
  1537				 * try_grab_folio() should have taken care of tail
  1538				 * pages.
  1539				 */
  1540				if (page_increm > 1) {
  1541					struct folio *folio = page_folio(page);
  1542	
  1543					/*
  1544					 * Since we already hold refcount on the
  1545					 * large folio, this should never fail.
  1546					 */
  1547					if (try_grab_folio(folio, page_increm - 1,
  1548							   gup_flags)) {
  1549						/*
  1550						 * Release the 1st page ref if the
  1551						 * folio is problematic, fail hard.
  1552						 */
  1553						gup_put_folio(folio, 1, gup_flags);
  1554						ret = -EFAULT;
  1555						goto out;
  1556					}
  1557				}
  1558	
  1559				for (j = 0; j < page_increm; j++) {
  1560					subpage = nth_page(page, j);
  1561					pages[i + j] = subpage;
  1562					flush_anon_page(vma, subpage, start + j * PAGE_SIZE);
  1563					flush_dcache_page(subpage);
  1564				}
  1565			}
  1566	
  1567			i += page_increm;
  1568			start += page_increm * PAGE_SIZE;
  1569			nr_pages -= page_increm;
  1570		} while (nr_pages);
  1571	out:
  1572		if (ctx.pgmap)
  1573			put_dev_pagemap(ctx.pgmap);
  1574		return i ? i : ret;
  1575	}
  1576	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
