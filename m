Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980441F3B9E
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 19:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750619376; cv=none; b=B/Gycgok3PDd5DKE9FPKQNC/7vYu626VFbFMsqG1Xz9IIcUhuoczRXbZZjfenx/YMWmPt3B4yHAG8Uj0/h6znjjLOoU3TrkIE7+QbzaHR/soa7vkAyhWLF65HMH53fRhH7DpLVAk1k1JbG2d0f4n49zYR+94dZOCKE28bWPn90U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750619376; c=relaxed/simple;
	bh=sUG1g5y009+hlcy6q+fqDM2WQihyuJLzcTutQ8A27q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PfC3bTRTJtAQmb0gjZGZReZNFxVE96lsXiYdqpDmb19fe2zF55+qwU/LnNr00Ypq4ww0jtujMs8YdnAtxLqxNG5yOTvUAlZxkXBnTVTTuivfJ2HJeeAnH4MVqRSVSQCc82qpmUB6arAHVUr5GOHdmjayF4PZRT8cVGjM1LYLA9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LlzPwYHo; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LlzPwYHo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750619375; x=1782155375;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sUG1g5y009+hlcy6q+fqDM2WQihyuJLzcTutQ8A27q4=;
  b=LlzPwYHo7SBd91/2gaYRiynJEp3mWEnUHTLOTedZBNXWDjhFoy7FsgkL
   GoVjFDomBgQFzPL7TvEuq/mNJ6zQbHrXw3xtFfS3U6mBqKdL8TK+tbDGQ
   QbErje3exzypTOVoc9ck/t8FJFbE0J9o4ivvPlco+e4xJcmQg+TAgRZvj
   stUNJoEC0s2Dusjx0Uhr91w4i5AcCUZsYK3Q9T3owFKiWvFMyRL0A1xM6
   1OBmVX3NIgBGR8X1zfDhRGCMkqKRAOVc0cAOdoP6aVdApShqrCgnuy493
   +Ygc62VqvenWdCjiElhHzyFRLwPS9h9wtaMlXbFbWTjNUrQW9amI8nXxc
   w==;
X-CSE-ConnectionGUID: t+1TjOY/Sju8WHJSG9gZ5g==
X-CSE-MsgGUID: IOK+gxNPR/+rxR6VUQUrlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="64257537"
X-IronPort-AV: E=Sophos;i="6.16,257,1744095600"; 
   d="scan'208";a="64257537"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 12:09:35 -0700
X-CSE-ConnectionGUID: xoACvhAwSguaIkGtPhFf6w==
X-CSE-MsgGUID: txG0/ZMaTT+XfePD1hC39g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,257,1744095600"; 
   d="scan'208";a="152072696"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 22 Jun 2025 12:09:29 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTQ4F-000NTi-1l;
	Sun, 22 Jun 2025 19:09:27 +0000
Date: Mon, 23 Jun 2025 03:09:13 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Nikita Kalyazin <kalyazin@amazon.com>,
	peterx@redhat.com, Hugh Dickins <hughd@google.com>,
	Oscar Salvador <osalvador@suse.de>, Michal Hocko <mhocko@suse.com>,
	David Hildenbrand <david@redhat.com>,
	Muchun Song <muchun.song@linux.dev>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Ujwal Kundur <ujwal.kundur@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	James Houghton <jthoughton@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Axel Rasmussen <axelrasmussen@google.com>
Subject: Re: [PATCH 4/4] mm: Apply vm_uffd_ops API to core mm
Message-ID: <202506230216.JVgQj2Si-lkp@intel.com>
References: <20250620190342.1780170-5-peterx@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620190342.1780170-5-peterx@redhat.com>

Hi Peter,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250620]
[cannot apply to akpm-mm/mm-everything linus/master v6.16-rc2 v6.16-rc1 v6.15 v6.16-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Xu/mm-Introduce-vm_uffd_ops-API/20250621-030557
base:   next-20250620
patch link:    https://lore.kernel.org/r/20250620190342.1780170-5-peterx%40redhat.com
patch subject: [PATCH 4/4] mm: Apply vm_uffd_ops API to core mm
config: i386-randconfig-061-20250622 (https://download.01.org/0day-ci/archive/20250623/202506230216.JVgQj2Si-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250623/202506230216.JVgQj2Si-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506230216.JVgQj2Si-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/shmem.c: note: in included file (through include/linux/shmem_fs.h):
>> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
--
   mm/hugetlb.c:669:12: sparse: sparse: context imbalance in 'allocate_file_region_entries' - wrong count at exit
   mm/hugetlb.c:740:13: sparse: sparse: context imbalance in 'region_add' - wrong count at exit
   mm/hugetlb.c:807:13: sparse: sparse: context imbalance in 'region_chg' - wrong count at exit
   mm/hugetlb.c:5798:20: sparse: sparse: context imbalance in 'move_huge_pte' - different lock contexts for basic block
   mm/hugetlb.c: note: in included file:
   include/linux/mm.h:1391:22: sparse: sparse: context imbalance in 'hugetlb_wp' - unexpected unlock
   mm/hugetlb.c: note: in included file (through include/linux/hugetlb.h, include/linux/migrate.h):
>> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
>> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
--
   mm/userfaultfd.c:270:9: sparse: sparse: context imbalance in 'mfill_atomic_install_pte' - different lock contexts for basic block
   mm/userfaultfd.c:412:9: sparse: sparse: context imbalance in 'mfill_atomic_pte_zeropage' - different lock contexts for basic block
   mm/userfaultfd.c:498:9: sparse: sparse: context imbalance in 'mfill_atomic_pte_poison' - different lock contexts for basic block
   mm/userfaultfd.c: note: in included file:
>> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
>> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
>> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
>> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
>> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
>> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
>> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
>> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
>> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
>> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
>> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
>> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
>> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
>> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
>> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
>> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
>> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
>> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
>> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
>> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
   mm/userfaultfd.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:871:25: sparse: sparse: context imbalance in 'move_pages_pte' - unexpected unlock

vim +90 include/linux/userfaultfd_k.h

    87	
    88	static inline enum mfill_atomic_mode uffd_flags_get_mode(uffd_flags_t flags)
    89	{
  > 90		return (enum mfill_atomic_mode)(flags & MFILL_ATOMIC_MODE_MASK);
    91	}
    92	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
