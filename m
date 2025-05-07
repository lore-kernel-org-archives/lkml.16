Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA94425E82E
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 12:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746620388; cv=none; b=nHTmXHs/3C3jvHqCWkYIwAVHK4UpQC6HcGmWyj5Tbi60U2YhbCsGD8ZjFEF9rq26DYqzpw3jNP+3HyEtS2AqvJT7VrLsUNRX8uUq3f8QxcF6yW8DvbWeBNb9spAFx+vUQ+yZX06NQc5picGmMXeZQx9/yKFoFxyqK33u18brcnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746620388; c=relaxed/simple;
	bh=bwdApA3a7p9GJ4+KSyB14mHBoMsFhm7WOPjXnAmVsTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gl808M43HN/+dDVv6/8o+l7uwF7UvKsxsgsvVYhK1FB7fllTB/21aFwCRJSghSLAy21TKdiQZJPVwi/EIoz21RSUnbcAw93EUcalrX4pvd1NwRgZ1DecQCaTtjXQgDPX388syFZp6HXWPGVOEWPLP9N9jfCjs3Uf4EKQWP7erLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hlxHP2QP; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hlxHP2QP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746620387; x=1778156387;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bwdApA3a7p9GJ4+KSyB14mHBoMsFhm7WOPjXnAmVsTM=;
  b=hlxHP2QPqx2UQF3eIVJoBXLPi20cHygnNevY5KkZiBGPepvKcl0VVSJ+
   qc74WwffkzWmrAxStl6mu+MwAKOR9APSs4PsKss+1FeI8fOJXQKCUci0y
   M+jXodWegvlD+mR9EMyOHJd6jWvJGwsu806T/tn/5ekn+h0bPrpVI/Fy9
   epS9N24biO1bHoTC1aeKiVNBHHRlr7VmvZSG+fTvB7ZpuTPQ1HC0s12Tl
   uImMLMgSjWLnaXQLu1hRKqc3Khk3b3MJt8p0BxSaauRY8bOZsQzkXOMMX
   /nWltMIeY73b9/ZCyqH85N0g7KQ5nNizePLVQkmrxAh25mIx7YBcawlxU
   A==;
X-CSE-ConnectionGUID: 9HPaTxdcQN+UJaN4edmrcQ==
X-CSE-MsgGUID: xrvaCvaoSpKcLfSHoGxthw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48361245"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48361245"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 05:19:45 -0700
X-CSE-ConnectionGUID: j6SoIpGuRj6BmL+upUr5jA==
X-CSE-MsgGUID: 16ST6yjvSt2zEHo2jDq24w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="135802178"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 May 2025 05:19:43 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCdkS-0007lb-1D;
	Wed, 07 May 2025 12:19:40 +0000
Date: Wed, 7 May 2025 20:19:07 +0800
From: kernel test robot <lkp@intel.com>
To: Tiffany Yang <ynaffit@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Suren Baghdasaryan <surenb@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-team@android.com, "Tiffany Y. Yang" <ynaffit@google.com>
Subject: Re: [PATCH v2 2/2] binder: Create safe versions of binder log files
Message-ID: <202505072254.2gHv8kgu-lkp@intel.com>
References: <20250505214306.3843294-4-ynaffit@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505214306.3843294-4-ynaffit@google.com>

Hi Tiffany,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]
[also build test WARNING on staging/staging-next staging/staging-linus linus/master v6.15-rc5 next-20250506]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tiffany-Yang/binder-Create-safe-versions-of-binder-log-files/20250506-054556
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20250505214306.3843294-4-ynaffit%40google.com
patch subject: [PATCH v2 2/2] binder: Create safe versions of binder log files
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20250507/202505072254.2gHv8kgu-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505072254.2gHv8kgu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505072254.2gHv8kgu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/android/binder.c: In function 'print_binder_work_ilocked':
>> drivers/android/binder.c:6409:28: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    6409 |                            (void *)node->ptr, (void *)node->cookie);
         |                            ^
   drivers/android/binder.c:6409:47: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    6409 |                            (void *)node->ptr, (void *)node->cookie);
         |                                               ^
   drivers/android/binder.c: In function 'print_binder_node_nilocked':
   drivers/android/binder.c:6487:28: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    6487 |                            (void *)node->ptr, (void *)node->cookie);
         |                            ^
   drivers/android/binder.c:6487:47: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    6487 |                            (void *)node->ptr, (void *)node->cookie);
         |                                               ^


vim +6409 drivers/android/binder.c

  6378	
  6379	static void print_binder_work_ilocked(struct seq_file *m,
  6380					      struct binder_proc *proc,
  6381					      const char *prefix,
  6382					      const char *transaction_prefix,
  6383					      struct binder_work *w, bool hash_ptrs)
  6384	{
  6385		struct binder_node *node;
  6386		struct binder_transaction *t;
  6387	
  6388		switch (w->type) {
  6389		case BINDER_WORK_TRANSACTION:
  6390			t = container_of(w, struct binder_transaction, work);
  6391			print_binder_transaction_ilocked(
  6392					m, proc, transaction_prefix, t);
  6393			break;
  6394		case BINDER_WORK_RETURN_ERROR: {
  6395			struct binder_error *e = container_of(
  6396					w, struct binder_error, work);
  6397	
  6398			seq_printf(m, "%stransaction error: %u\n",
  6399				   prefix, e->cmd);
  6400		} break;
  6401		case BINDER_WORK_TRANSACTION_COMPLETE:
  6402			seq_printf(m, "%stransaction complete\n", prefix);
  6403			break;
  6404		case BINDER_WORK_NODE:
  6405			node = container_of(w, struct binder_node, work);
  6406			if (hash_ptrs)
  6407				seq_printf(m, "%snode work %d: u%p c%p\n",
  6408				   prefix, node->debug_id,
> 6409				   (void *)node->ptr, (void *)node->cookie);
  6410			else
  6411				seq_printf(m, "%snode work %d: u%016llx c%016llx\n",
  6412					   prefix, node->debug_id,
  6413					   (u64)node->ptr, (u64)node->cookie);
  6414			break;
  6415		case BINDER_WORK_DEAD_BINDER:
  6416			seq_printf(m, "%shas dead binder\n", prefix);
  6417			break;
  6418		case BINDER_WORK_DEAD_BINDER_AND_CLEAR:
  6419			seq_printf(m, "%shas cleared dead binder\n", prefix);
  6420			break;
  6421		case BINDER_WORK_CLEAR_DEATH_NOTIFICATION:
  6422			seq_printf(m, "%shas cleared death notification\n", prefix);
  6423			break;
  6424		case BINDER_WORK_FROZEN_BINDER:
  6425			seq_printf(m, "%shas frozen binder\n", prefix);
  6426			break;
  6427		case BINDER_WORK_CLEAR_FREEZE_NOTIFICATION:
  6428			seq_printf(m, "%shas cleared freeze notification\n", prefix);
  6429			break;
  6430		default:
  6431			seq_printf(m, "%sunknown work: type %d\n", prefix, w->type);
  6432			break;
  6433		}
  6434	}
  6435	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
