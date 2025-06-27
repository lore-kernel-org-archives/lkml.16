Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F881B423C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 19:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751051439; cv=none; b=PNN6BEyuG49EEdA5W/Ie6I90E+NcvnbTYqaPXkjVmbUmYbXtH5tHzpnpH9pkKOEd8gMPoODOcOjAu/HIwyXYqgqU6GW/jKqSyY+5ZRijw622f5nVTqykpj+PK1t557ZH5x4oGmhAN8A9MRQNrB0d7a52qJ+vrXSB8nXnZ0RXA3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751051439; c=relaxed/simple;
	bh=ibyGbCO+OGZw7j6BE8USlgUxel2mx3XSk92IGIeX6MI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aYtcQpEIF5hhjgls/epvJXsGbteS8aoZctdNPHTG1OrdIF3z+67jPi5jozh+aiggAxq+uRYsJ7q39M4Y4qT1ZtI7sfYTIHfe9LANnD1aRgoueK9wHKx/dnSmDwNyjl4y/D7dqkhUWzrCy48hOMQOTAqdhYHB33SyUlHmtQwqVfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fudbSoPw; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fudbSoPw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751051438; x=1782587438;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ibyGbCO+OGZw7j6BE8USlgUxel2mx3XSk92IGIeX6MI=;
  b=fudbSoPwFHxPmGTR/YIFaXzp8mTnocFpu2jRIrNdVZ7vpaJIUFZNUhHk
   Z3PNDSZCQwzQg2YauUpscu0dgQN4Zfib7i07BDsC9gY1uZ8YpT2rYns+S
   zclcbLUUcTsJkhq0xKqT/9R8QJ6EZQ+bAg2keYQxyp6xABTcHwfTbk7c3
   4xqQgWs2QoAqfvEcILi7GpiumcaZJSQy2pGMDkKp1G2a3T5z/czeitf8S
   2qjHREcvBE6rAygsgILA0QlU9TR3+9Y6dBnHvd74C39O35tb/k3pMKto7
   95SGz4+RrHj+3liZ/V2c89DOmx224i1Nwd199SAChepMjpkc6TSItdQiE
   A==;
X-CSE-ConnectionGUID: WJkSkw4nQBmn8QNZPQmnqQ==
X-CSE-MsgGUID: XsKmMw+yTJOyb00s3AwOEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53527525"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="53527525"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 12:10:37 -0700
X-CSE-ConnectionGUID: VD6ILpMhQy2DQH29B3+HCQ==
X-CSE-MsgGUID: tzSj6hSCRJahqJt+4MR9FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="153370041"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Jun 2025 12:10:36 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVET3-000WU2-1x;
	Fri, 27 Jun 2025 19:10:33 +0000
Date: Sat, 28 Jun 2025 03:10:18 +0800
From: kernel test robot <lkp@intel.com>
To: Amery Hung <amery.hung@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Martin KaFai Lau <martin.lau@kernel.org>
Subject: net/sched/bpf_qdisc.c:224:18: sparse: sparse: symbol
 'bpf_qdisc_init_prologue' was not declared. Should it be static?
Message-ID: <202506280351.g258QPQS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e540341508ce2f6e27810106253d5de194b66750
commit: 7a2dafda950b78611dc441c83d105dfdc7082681 bpf: net_sched: Add a qdisc watchdog timer
date:   2 months ago
config: powerpc64-randconfig-r113-20250627 (https://download.01.org/0day-ci/archive/20250628/202506280351.g258QPQS-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250628/202506280351.g258QPQS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506280351.g258QPQS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/sched/bpf_qdisc.c:224:18: sparse: sparse: symbol 'bpf_qdisc_init_prologue' was not declared. Should it be static?
>> net/sched/bpf_qdisc.c:234:18: sparse: sparse: symbol 'bpf_qdisc_reset_destroy_epilogue' was not declared. Should it be static?

vim +/bpf_qdisc_init_prologue +224 net/sched/bpf_qdisc.c

   184	
   185	/* bpf_skb_get_hash - Get the flow hash of an skb.
   186	 * @skb: The skb to get the flow hash from.
   187	 */
 > 188	__bpf_kfunc u32 bpf_skb_get_hash(struct sk_buff *skb)
   189	{
   190		return skb_get_hash(skb);
   191	}
   192	
   193	/* bpf_kfree_skb - Release an skb's reference and drop it immediately.
   194	 * @skb: The skb whose reference to be released and dropped.
   195	 */
   196	__bpf_kfunc void bpf_kfree_skb(struct sk_buff *skb)
   197	{
   198		kfree_skb(skb);
   199	}
   200	
   201	/* bpf_qdisc_skb_drop - Drop an skb by adding it to a deferred free list.
   202	 * @skb: The skb whose reference to be released and dropped.
   203	 * @to_free_list: The list of skbs to be dropped.
   204	 */
   205	__bpf_kfunc void bpf_qdisc_skb_drop(struct sk_buff *skb,
   206					    struct bpf_sk_buff_ptr *to_free_list)
   207	{
   208		__qdisc_drop(skb, (struct sk_buff **)to_free_list);
   209	}
   210	
   211	/* bpf_qdisc_watchdog_schedule - Schedule a qdisc to a later time using a timer.
   212	 * @sch: The qdisc to be scheduled.
   213	 * @expire: The expiry time of the timer.
   214	 * @delta_ns: The slack range of the timer.
   215	 */
   216	__bpf_kfunc void bpf_qdisc_watchdog_schedule(struct Qdisc *sch, u64 expire, u64 delta_ns)
   217	{
   218		struct bpf_sched_data *q = qdisc_priv(sch);
   219	
   220		qdisc_watchdog_schedule_range_ns(&q->watchdog, expire, delta_ns);
   221	}
   222	
   223	/* bpf_qdisc_init_prologue - Hidden kfunc called in prologue of .init. */
 > 224	__bpf_kfunc void bpf_qdisc_init_prologue(struct Qdisc *sch)
   225	{
   226		struct bpf_sched_data *q = qdisc_priv(sch);
   227	
   228		qdisc_watchdog_init(&q->watchdog, sch);
   229	}
   230	
   231	/* bpf_qdisc_reset_destroy_epilogue - Hidden kfunc called in epilogue of .reset
   232	 * and .destroy
   233	 */
 > 234	__bpf_kfunc void bpf_qdisc_reset_destroy_epilogue(struct Qdisc *sch)
   235	{
   236		struct bpf_sched_data *q = qdisc_priv(sch);
   237	
   238		qdisc_watchdog_cancel(&q->watchdog);
   239	}
   240	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
