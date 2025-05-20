Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACC52620E5
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747759994; cv=none; b=d0OQlzFP5gwmZmsn8T1oREYElyj1FfEVQkUkQYCyMZRqzgirPqArR21K5NoZp0uok97Fd3tcOclpijeJ9sb6neZxQdihHm7q/zscPF5k9g2GzDknT4X5n5Au/zGXev5+kabGubBaayvQhF0o2JBL0K6RfyxJcrz5rGgNZ+Ycmdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747759994; c=relaxed/simple;
	bh=J6byktbGeb21rpc5R8r1fVkPaW1EaI64wlO9/9/XkaE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=crjrwNVuHAXkqWLHIgkIjxpRFz8i0US47a3mNgq9MIDVSnxDO6KjrPEDwyxSK1TL46VOAe/hUbi0RY00lo1OwmRpWXpS8poicxmYXtqs6Mn2w9hCHPJW7gDm7aqyULHLRQ14GNnjh6PHYSA7k1eiiLnVYNjhy0/nGZT2/hDnpRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fnB5Fjbf; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fnB5Fjbf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747759993; x=1779295993;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J6byktbGeb21rpc5R8r1fVkPaW1EaI64wlO9/9/XkaE=;
  b=fnB5Fjbf0bbxh+5a9fbTmgcxbE+LhU6TklriH/M94nP3ZO2NkaxtGc+u
   ZQxHwjsBzkXFohw75g6xxtExIp2khTuzbAiMHMh0q6U+TLfCb07b9mtqf
   ucm6ulkmTKtKZj8vsHN+dw9anTpGPMzikWHIT8z2QSkbjGNnK1+BNrb40
   lP04eHKPBU73Ou+/EvKPar9YYhYO1wNXqFk3hulrzAkq/PUuPnnP7H0HP
   HmZQFAILKVlDP2YsUFVjrfN9PvOYuvmhBZHxfGRHiv8s5BGMRs04lbzNy
   vKr/M+1wh4FboW0xyVXxInqX3ImwBXxut7RW3AFm+t3BC9j0/dGs8wZ7o
   w==;
X-CSE-ConnectionGUID: 9r324hNpTGWgE7y9u6IIow==
X-CSE-MsgGUID: Q33fAvfVQUeVjagFUQwfmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="61099575"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="61099575"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 09:53:13 -0700
X-CSE-ConnectionGUID: emwZ5T0vSX2ssAnNn0Hrdw==
X-CSE-MsgGUID: lC70T7aUT7i8QP4D+PzNHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="140789529"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 May 2025 09:53:11 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHQDE-000NNv-2o;
	Tue, 20 May 2025 16:53:08 +0000
Date: Wed, 21 May 2025 00:52:38 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: fs/afs/server.c:375:5-24: WARNING: atomic_dec_and_test variation
 before object free at line 383.
Message-ID: <202505210027.EOM219DU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a5806cd506af5a7c19bcd596e4708b5c464bfd21
commit: 4882ba78574e2d8c579658f65f6784b0d139d173 afs: Fix afs_server ref accounting
date:   2 months ago
config: loongarch-randconfig-r061-20250520 (https://download.01.org/0day-ci/archive/20250521/202505210027.EOM219DU-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505210027.EOM219DU-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/afs/server.c:375:5-24: WARNING: atomic_dec_and_test variation before object free at line 383.
   fs/afs/server.c:357:5-24: WARNING: atomic_dec_and_test variation before object free at line 360.

vim +375 fs/afs/server.c

   365	
   366	/*
   367	 * Drop an active count on a server object.
   368	 */
   369	void afs_unuse_server(struct afs_net *net, struct afs_server *server,
   370			      enum afs_server_trace reason)
   371	{
   372		if (!server)
   373			return;
   374	
 > 375		if (atomic_dec_and_test(&server->active)) {
   376			if (!test_bit(AFS_SERVER_FL_EXPIRED, &server->flags) &&
   377			    READ_ONCE(server->cell->state) < AFS_CELL_FAILED) {
   378				time64_t unuse_time = ktime_get_real_seconds();
   379	
   380				server->unuse_time = unuse_time;
   381				afs_set_server_timer(server, afs_server_gc_delay);
   382			} else {
 > 383				schedule_work(&server->destroyer);
   384			}
   385		}
   386	
   387		afs_put_server(net, server, reason);
   388	}
   389	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
