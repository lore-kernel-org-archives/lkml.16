Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9571E16F8F5
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 22:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744063971; cv=none; b=ibsHrNofRLV8DTKwT87pKRKA8GxrJQwWd/loQOS6LHpeP7XXUQNVf22dN+V54bW07VlckDmYhKAcIRgUQyaNBHA3SoeVzruy3B3ZG7T82XCmfYCa5Yne6SACyECHeFrA8yGEaKSzlXUZ/+bQ/EVU/DyCBaMeax4uwPoNnwRG9yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744063971; c=relaxed/simple;
	bh=Dq7z2zj3p7Mlbnr22qp4XmyonGptaDkHym7p6E8U7lo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jvEvxsGyYOzEh57oxLFpvYLR9TXStg0lQjvrqsiZYmNotHZckyWmLPqfILExU8IULlflnV2NfBODAWLfNXAe0ubUhErg2URVF2s3MRc4q9GodAxtW/ohx1lqo2Kb5xryBG4GCKCQe2DR1M4Uh+ZseOVY+c/CoavX3eVs1+/KL7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n5xhlDQQ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n5xhlDQQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744063970; x=1775599970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dq7z2zj3p7Mlbnr22qp4XmyonGptaDkHym7p6E8U7lo=;
  b=n5xhlDQQ4G5VA0w3QiQQ98WheYozFfjgY649jYH9QbT7kDWwgzGOxyiE
   AJudWrMtMLf3Td5Vt0gEhOsJjEiWrD6gx4QkUz8e0oA2V4TYyS04Ignwu
   lUyMaM5xAiE4WnCjrlZteKPkESuX7/E6I5H23lzyyizLaD2VcWlJvtdzi
   Tl0oTIGWLUrFiszpgoW3I7NTOhSL3kJq8N6ZRQb7EtJ6vGrHMD8uyZJCf
   GQ7P+BxZtUDl78Ft0C5tsfRJOeixfVXXbvbZbT/TWj3RNjRUCgRqPjUhe
   MQ+DVS/lzJXP78q4qnmOqc0lCNi3aFdqolCwmHZ0RewD+fEf8BU3nQ0f9
   Q==;
X-CSE-ConnectionGUID: tAazxkXiRlKZQb2Ko32ERA==
X-CSE-MsgGUID: qChSX9O1TYKyd6kAEIzYQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45375213"
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="45375213"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 15:12:45 -0700
X-CSE-ConnectionGUID: spC0dtZ6STOw2LLF5AIHwQ==
X-CSE-MsgGUID: DEQwjXcmRHWTB9xINlkVLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="151268664"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Apr 2025 15:12:44 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1uht-0003rL-05;
	Mon, 07 Apr 2025 22:12:41 +0000
Date: Tue, 8 Apr 2025 06:12:03 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: kernel/trace/trace.c:10775:undefined reference to `get_vm_area'
Message-ID: <202504080619.xvDhvxPf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0af2f6be1b4281385b618cb86ad946eded089ac8
commit: 394f3f02de5311ea976dd8046304194d22329bbc tracing: Use vmap_page_range() to map memmap ring buffer
date:   5 days ago
config: sh-randconfig-001-20250408 (https://download.01.org/0day-ci/archive/20250408/202504080619.xvDhvxPf-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504080619.xvDhvxPf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504080619.xvDhvxPf-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: kernel/trace/trace.o: in function `enable_instances':
>> kernel/trace/trace.c:10775:(.init.text+0x9f8): undefined reference to `get_vm_area'


vim +10775 kernel/trace/trace.c

9c1c251d670bc1 Steven Rostedt (Google    2023-02-07  10695) 
cb1f98c5e57422 Steven Rostedt (Google    2023-02-07  10696) __init static void enable_instances(void)
cb1f98c5e57422 Steven Rostedt (Google    2023-02-07  10697) {
cb1f98c5e57422 Steven Rostedt (Google    2023-02-07  10698) 	struct trace_array *tr;
34ea8fa084dd96 Steven Rostedt            2025-04-02  10699  	bool memmap_area = false;
cb1f98c5e57422 Steven Rostedt (Google    2023-02-07  10700) 	char *curr_str;
e645535a954ad5 Steven Rostedt (Google    2024-06-12  10701) 	char *name;
cb1f98c5e57422 Steven Rostedt (Google    2023-02-07  10702) 	char *str;
cb1f98c5e57422 Steven Rostedt (Google    2023-02-07  10703) 	char *tok;
cb1f98c5e57422 Steven Rostedt (Google    2023-02-07  10704) 
cb1f98c5e57422 Steven Rostedt (Google    2023-02-07  10705) 	/* A tab is always appended */
cb1f98c5e57422 Steven Rostedt (Google    2023-02-07  10706) 	boot_instance_info[boot_instance_index - 1] = '\0';
cb1f98c5e57422 Steven Rostedt (Google    2023-02-07  10707) 	str = boot_instance_info;
cb1f98c5e57422 Steven Rostedt (Google    2023-02-07  10708) 
cb1f98c5e57422 Steven Rostedt (Google    2023-02-07  10709) 	while ((curr_str = strsep(&str, "\t"))) {
29a02ec66556ac Steven Rostedt (Google    2024-08-15  10710) 		phys_addr_t start = 0;
29a02ec66556ac Steven Rostedt (Google    2024-08-15  10711) 		phys_addr_t size = 0;
e645535a954ad5 Steven Rostedt (Google    2024-06-12  10712) 		unsigned long addr = 0;
ddb8ea9e5ae482 Steven Rostedt            2024-08-22  10713  		bool traceprintk = false;
b6fc31b68731af Steven Rostedt            2024-08-22  10714  		bool traceoff = false;
b6fc31b68731af Steven Rostedt            2024-08-22  10715  		char *flag_delim;
b6fc31b68731af Steven Rostedt            2024-08-22  10716  		char *addr_delim;
fb6d03238e35f9 Masami Hiramatsu (Google  2025-02-19  10717) 		char *rname __free(kfree) = NULL;
cb1f98c5e57422 Steven Rostedt (Google    2023-02-07  10718) 
cb1f98c5e57422 Steven Rostedt (Google    2023-02-07  10719) 		tok = strsep(&curr_str, ",");
cb1f98c5e57422 Steven Rostedt (Google    2023-02-07  10720) 
b6fc31b68731af Steven Rostedt            2024-08-22  10721  		flag_delim = strchr(tok, '^');
b6fc31b68731af Steven Rostedt            2024-08-22  10722  		addr_delim = strchr(tok, '@');
b6fc31b68731af Steven Rostedt            2024-08-22  10723  
b6fc31b68731af Steven Rostedt            2024-08-22  10724  		if (addr_delim)
b6fc31b68731af Steven Rostedt            2024-08-22  10725  			*addr_delim++ = '\0';
b6fc31b68731af Steven Rostedt            2024-08-22  10726  
b6fc31b68731af Steven Rostedt            2024-08-22  10727  		if (flag_delim)
b6fc31b68731af Steven Rostedt            2024-08-22  10728  			*flag_delim++ = '\0';
b6fc31b68731af Steven Rostedt            2024-08-22  10729  
b6fc31b68731af Steven Rostedt            2024-08-22  10730  		name = tok;
b6fc31b68731af Steven Rostedt            2024-08-22  10731  
b6fc31b68731af Steven Rostedt            2024-08-22  10732  		if (flag_delim) {
b6fc31b68731af Steven Rostedt            2024-08-22  10733  			char *flag;
b6fc31b68731af Steven Rostedt            2024-08-22  10734  
b6fc31b68731af Steven Rostedt            2024-08-22  10735  			while ((flag = strsep(&flag_delim, "^"))) {
ddb8ea9e5ae482 Steven Rostedt            2024-08-22  10736  				if (strcmp(flag, "traceoff") == 0) {
b6fc31b68731af Steven Rostedt            2024-08-22  10737  					traceoff = true;
ddb8ea9e5ae482 Steven Rostedt            2024-08-22  10738  				} else if ((strcmp(flag, "printk") == 0) ||
ddb8ea9e5ae482 Steven Rostedt            2024-08-22  10739  					   (strcmp(flag, "traceprintk") == 0) ||
ddb8ea9e5ae482 Steven Rostedt            2024-08-22  10740  					   (strcmp(flag, "trace_printk") == 0)) {
ddb8ea9e5ae482 Steven Rostedt            2024-08-22  10741  					traceprintk = true;
ddb8ea9e5ae482 Steven Rostedt            2024-08-22  10742  				} else {
b6fc31b68731af Steven Rostedt            2024-08-22  10743  					pr_info("Tracing: Invalid instance flag '%s' for %s\n",
b6fc31b68731af Steven Rostedt            2024-08-22  10744  						flag, name);
b6fc31b68731af Steven Rostedt            2024-08-22  10745  				}
b6fc31b68731af Steven Rostedt            2024-08-22  10746  			}
ddb8ea9e5ae482 Steven Rostedt            2024-08-22  10747  		}
b6fc31b68731af Steven Rostedt            2024-08-22  10748  
b6fc31b68731af Steven Rostedt            2024-08-22  10749  		tok = addr_delim;
29a02ec66556ac Steven Rostedt (Google    2024-08-15  10750) 		if (tok && isdigit(*tok)) {
e645535a954ad5 Steven Rostedt (Google    2024-06-12  10751) 			start = memparse(tok, &tok);
e645535a954ad5 Steven Rostedt (Google    2024-06-12  10752) 			if (!start) {
e645535a954ad5 Steven Rostedt (Google    2024-06-12  10753) 				pr_warn("Tracing: Invalid boot instance address for %s\n",
e645535a954ad5 Steven Rostedt (Google    2024-06-12  10754) 					name);
e645535a954ad5 Steven Rostedt (Google    2024-06-12  10755) 				continue;
e645535a954ad5 Steven Rostedt (Google    2024-06-12  10756) 			}
e645535a954ad5 Steven Rostedt (Google    2024-06-12  10757) 			if (*tok != ':') {
e645535a954ad5 Steven Rostedt (Google    2024-06-12  10758) 				pr_warn("Tracing: No size specified for instance %s\n", name);
e645535a954ad5 Steven Rostedt (Google    2024-06-12  10759) 				continue;
e645535a954ad5 Steven Rostedt (Google    2024-06-12  10760) 			}
e645535a954ad5 Steven Rostedt (Google    2024-06-12  10761) 			tok++;
e645535a954ad5 Steven Rostedt (Google    2024-06-12  10762) 			size = memparse(tok, &tok);
e645535a954ad5 Steven Rostedt (Google    2024-06-12  10763) 			if (!size) {
e645535a954ad5 Steven Rostedt (Google    2024-06-12  10764) 				pr_warn("Tracing: Invalid boot instance size for %s\n",
e645535a954ad5 Steven Rostedt (Google    2024-06-12  10765) 					name);
e645535a954ad5 Steven Rostedt (Google    2024-06-12  10766) 				continue;
e645535a954ad5 Steven Rostedt (Google    2024-06-12  10767) 			}
34ea8fa084dd96 Steven Rostedt            2025-04-02  10768  			memmap_area = true;
29a02ec66556ac Steven Rostedt (Google    2024-08-15  10769) 		} else if (tok) {
29a02ec66556ac Steven Rostedt (Google    2024-08-15  10770) 			if (!reserve_mem_find_by_name(tok, &start, &size)) {
29a02ec66556ac Steven Rostedt (Google    2024-08-15  10771) 				start = 0;
29a02ec66556ac Steven Rostedt (Google    2024-08-15  10772) 				pr_warn("Failed to map boot instance %s to %s\n", name, tok);
29a02ec66556ac Steven Rostedt (Google    2024-08-15  10773) 				continue;
29a02ec66556ac Steven Rostedt (Google    2024-08-15  10774) 			}
fb6d03238e35f9 Masami Hiramatsu (Google  2025-02-19 @10775) 			rname = kstrdup(tok, GFP_KERNEL);
29a02ec66556ac Steven Rostedt (Google    2024-08-15  10776) 		}
29a02ec66556ac Steven Rostedt (Google    2024-08-15  10777) 
29a02ec66556ac Steven Rostedt (Google    2024-08-15  10778) 		if (start) {
c44a14f216f45d Steven Rostedt            2025-04-02  10779  			/* Start and size must be page aligned */
c44a14f216f45d Steven Rostedt            2025-04-02  10780  			if (start & ~PAGE_MASK) {
c44a14f216f45d Steven Rostedt            2025-04-02  10781  				pr_warn("Tracing: mapping start addr %pa is not page aligned\n", &start);
c44a14f216f45d Steven Rostedt            2025-04-02  10782  				continue;
c44a14f216f45d Steven Rostedt            2025-04-02  10783  			}
c44a14f216f45d Steven Rostedt            2025-04-02  10784  			if (size & ~PAGE_MASK) {
c44a14f216f45d Steven Rostedt            2025-04-02  10785  				pr_warn("Tracing: mapping size %pa is not page aligned\n", &size);
c44a14f216f45d Steven Rostedt            2025-04-02  10786  				continue;
c44a14f216f45d Steven Rostedt            2025-04-02  10787  			}
c44a14f216f45d Steven Rostedt            2025-04-02  10788  
34ea8fa084dd96 Steven Rostedt            2025-04-02  10789  			if (memmap_area)
e645535a954ad5 Steven Rostedt (Google    2024-06-12  10790) 				addr = map_pages(start, size);
34ea8fa084dd96 Steven Rostedt            2025-04-02  10791  			else
34ea8fa084dd96 Steven Rostedt            2025-04-02  10792  				addr = (unsigned long)phys_to_virt(start);
e645535a954ad5 Steven Rostedt (Google    2024-06-12  10793) 			if (addr) {
29a02ec66556ac Steven Rostedt (Google    2024-08-15  10794) 				pr_info("Tracing: mapped boot instance %s at physical memory %pa of size 0x%lx\n",
29a02ec66556ac Steven Rostedt (Google    2024-08-15  10795) 					name, &start, (unsigned long)size);
e645535a954ad5 Steven Rostedt (Google    2024-06-12  10796) 			} else {
e645535a954ad5 Steven Rostedt (Google    2024-06-12  10797) 				pr_warn("Tracing: Failed to map boot instance %s\n", name);
e645535a954ad5 Steven Rostedt (Google    2024-06-12  10798) 				continue;
e645535a954ad5 Steven Rostedt (Google    2024-06-12  10799) 			}
e645535a954ad5 Steven Rostedt (Google    2024-06-12  10800) 		} else {
e645535a954ad5 Steven Rostedt (Google    2024-06-12  10801) 			/* Only non mapped buffers have snapshot buffers */
9c1c251d670bc1 Steven Rostedt (Google    2023-02-07  10802) 			if (IS_ENABLED(CONFIG_TRACER_MAX_TRACE))
e645535a954ad5 Steven Rostedt (Google    2024-06-12  10803) 				do_allocate_snapshot(name);
e645535a954ad5 Steven Rostedt (Google    2024-06-12  10804) 		}
9c1c251d670bc1 Steven Rostedt (Google    2023-02-07  10805) 
e645535a954ad5 Steven Rostedt (Google    2024-06-12  10806) 		tr = trace_array_create_systems(name, NULL, addr, size);
94dfa500e7dedd Dan Carpenter             2024-06-20  10807  		if (IS_ERR(tr)) {
e645535a954ad5 Steven Rostedt (Google    2024-06-12  10808) 			pr_warn("Tracing: Failed to create instance buffer %s\n", curr_str);
cb1f98c5e57422 Steven Rostedt (Google    2023-02-07  10809) 			continue;
cb1f98c5e57422 Steven Rostedt (Google    2023-02-07  10810) 		}
e645535a954ad5 Steven Rostedt (Google    2024-06-12  10811) 
b6fc31b68731af Steven Rostedt            2024-08-22  10812  		if (traceoff)
b6fc31b68731af Steven Rostedt            2024-08-22  10813  			tracer_tracing_off(tr);
b6fc31b68731af Steven Rostedt            2024-08-22  10814  
9b7bdf6f6ece6e Steven Rostedt            2024-08-22  10815  		if (traceprintk)
ef2bd81d0c9561 Steven Rostedt            2024-08-22  10816  			update_printk_trace(tr);
9b7bdf6f6ece6e Steven Rostedt            2024-08-22  10817  
ddb8ea9e5ae482 Steven Rostedt            2024-08-22  10818  		/*
34ea8fa084dd96 Steven Rostedt            2025-04-02  10819  		 * memmap'd buffers can not be freed.
ddb8ea9e5ae482 Steven Rostedt            2024-08-22  10820  		 */
34ea8fa084dd96 Steven Rostedt            2025-04-02  10821  		if (memmap_area) {
34ea8fa084dd96 Steven Rostedt            2025-04-02  10822  			tr->flags |= TRACE_ARRAY_FL_MEMMAP;
34ea8fa084dd96 Steven Rostedt            2025-04-02  10823  			tr->ref++;
34ea8fa084dd96 Steven Rostedt            2025-04-02  10824  		}
34ea8fa084dd96 Steven Rostedt            2025-04-02  10825  
2cf9733891a460 Steven Rostedt            2024-10-11  10826  		if (start) {
bcba8d4dbe6880 Steven Rostedt            2025-03-05  10827  			tr->flags |= TRACE_ARRAY_FL_BOOT | TRACE_ARRAY_FL_LAST_BOOT;
fb6d03238e35f9 Masami Hiramatsu (Google  2025-02-19  10828) 			tr->range_name = no_free_ptr(rname);
2cf9733891a460 Steven Rostedt            2024-10-11  10829  		}
c4846480831ea5 Steven Rostedt (Google    2023-02-07  10830) 
c4846480831ea5 Steven Rostedt (Google    2023-02-07  10831) 		while ((tok = strsep(&curr_str, ","))) {
c4846480831ea5 Steven Rostedt (Google    2023-02-07  10832) 			early_enable_events(tr, tok, true);
c4846480831ea5 Steven Rostedt (Google    2023-02-07  10833) 		}
cb1f98c5e57422 Steven Rostedt (Google    2023-02-07  10834) 	}
cb1f98c5e57422 Steven Rostedt (Google    2023-02-07  10835) }
cb1f98c5e57422 Steven Rostedt (Google    2023-02-07  10836) 

:::::: The code at line 10775 was first introduced by commit
:::::: fb6d03238e35f96cc1d6a5411ee1d684221d1c39 tracing: Freeable reserved ring buffer

:::::: TO: Masami Hiramatsu (Google) <mhiramat@kernel.org>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
