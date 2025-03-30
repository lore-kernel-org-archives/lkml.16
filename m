Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0444D10785
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 18:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743359885; cv=none; b=mZBgwOtAq3Yc3HeSIqmeO4f0VXII9YjorPErmUQK/ne9Gyp8hX5NWazL5zg2pSdet0JT6R4lZYmFID3Nzk7FjfnhpIKphK+Dq+C58BZKC6VPzD8e+09H8GTy20ukbXJEIFUYPt4TXH/ENDLn2W2VlbKTeykRqccBKtgpjqWiV6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743359885; c=relaxed/simple;
	bh=pkY4c8FHlxzdFNGqG+eb9HZyAmPvfA00bP0RLScqCb8=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=oRbKMhuwk0KJlKZ2Lm5ZdoIeGf7RRnhj9QSFZOYd5DWlfoQTPh7Sm2gqtzjbTWHmo3RsqqZochKGBtphaMZs6bLcRTDXLn+vGwRxZbqvsn6mqmmjr5bcapczUE4Y3ZE0IHbm+RM8WOBb2UYR2WTuQCUigHNo0i1r5AxICGViybg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=LGpCoIzb; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="LGpCoIzb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PxIQWxjk0JSpOwy5cDVIhfRPf0gWcG0YhaYFdxmbneo=;
  b=LGpCoIzb7carg5oYs4IP+88YEyngeq/Syt/lqU+c/Vuba/PYx0zV58jx
   IWZ4GQy7Nk/LOQFOlcPsrIR/jtVY+jKzfpk4CMa6BDVWJPQIU0kLMjpEB
   vftdjUtZR8ICqLpkoy/VTXu8A5cA8VEN8YSMohZ9UlDFBEgNdroe15DO6
   Y=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.14,289,1736809200"; 
   d="scan'208";a="112970248"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2025 20:38:01 +0200
Date: Sun, 30 Mar 2025 20:37:59 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Gabriele Monaco <gmonaco@redhat.com>
cc: "Steven Rostedt (Google)" <rostedt@goodmis.org>, 
    linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: kernel/trace/rv/rv.c:812:2-8: preceding lock on line 790 (fwd)
Message-ID: <alpine.DEB.2.22.394.2503302037080.23941@hadrien>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Please check on whether line 812 needs an unlock.

julia

---------- Forwarded message ----------
Date: Mon, 31 Mar 2025 02:25:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: kernel/trace/rv/rv.c:812:2-8: preceding lock on line 790

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Gabriele Monaco <gmonaco@redhat.com>
CC: "Steven Rostedt (Google)" <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7f2ff7b6261742ed52aa973ccdf99151b7cc3a50
commit: cb85c660fcd4b3a03ed993affa0b2d1a8af2f06b rv: Add option for nested monitors and include sched
date:   6 days ago
:::::: branch date: 17 hours ago
:::::: commit date: 6 days ago
config: loongarch-randconfig-r061-20250330 (https://download.01.org/0day-ci/archive/20250331/202503310200.UBXGitB4-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202503310200.UBXGitB4-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/trace/rv/rv.c:812:2-8: preceding lock on line 790

vim +812 kernel/trace/rv/rv.c

102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  771
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  772  /**
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  773   * rv_register_monitor - register a rv monitor.
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  774   * @monitor:    The rv_monitor to be registered.
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  775   * @parent:     The parent of the monitor to be registered, NULL if not nested.
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  776   *
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  777   * Returns 0 if successful, error otherwise.
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  778   */
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  779  int rv_register_monitor(struct rv_monitor *monitor, struct rv_monitor *parent)
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  780  {
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  781  	struct rv_monitor_def *r, *p = NULL;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  782  	int retval = 0;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  783
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  784  	if (strlen(monitor->name) >= MAX_RV_MONITOR_NAME_SIZE) {
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  785  		pr_info("Monitor %s has a name longer than %d\n", monitor->name,
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  786  			MAX_RV_MONITOR_NAME_SIZE);
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  787  		return -EINVAL;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  788  	}
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  789
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29 @790  	mutex_lock(&rv_interface_lock);
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  791
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  792  	list_for_each_entry(r, &rv_monitors_list, list) {
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  793  		if (strcmp(monitor->name, r->monitor->name) == 0) {
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  794  			pr_info("Monitor %s is already registered\n", monitor->name);
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  795  			retval = -EEXIST;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  796  			goto out_unlock;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  797  		}
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  798  	}
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  799
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  800  	if (parent) {
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  801  		list_for_each_entry(r, &rv_monitors_list, list) {
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  802  			if (strcmp(parent->name, r->monitor->name) == 0) {
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  803  				p = r;
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  804  				break;
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  805  			}
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  806  		}
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  807  	}
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  808
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  809  	if (p && rv_is_nested_monitor(p)) {
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  810  		pr_info("Parent monitor %s is already nested, cannot nest further\n",
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  811  			parent->name);
cb85c660fcd4b3a Gabriele Monaco            2025-03-05 @812  		return -EINVAL;
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  813  	}
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  814
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  815  	r = kzalloc(sizeof(struct rv_monitor_def), GFP_KERNEL);
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  816  	if (!r) {
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  817  		retval = -ENOMEM;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  818  		goto out_unlock;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  819  	}
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  820
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  821  	r->monitor = monitor;
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  822  	r->parent = parent;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  823
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  824  	retval = create_monitor_dir(r, p);
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  825  	if (retval) {
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  826  		kfree(r);
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  827  		goto out_unlock;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  828  	}
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  829
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  830  	/* keep children close to the parent for easier visualisation */
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  831  	if (p)
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  832  		list_add(&r->list, &p->list);
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  833  	else
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  834  		list_add_tail(&r->list, &rv_monitors_list);
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  835
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  836  out_unlock:
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  837  	mutex_unlock(&rv_interface_lock);
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  838  	return retval;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  839  }
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  840

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
