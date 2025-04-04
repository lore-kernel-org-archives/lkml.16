Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1224A95E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 04:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743742185; cv=none; b=l9EVqNgra8WGLFXt/UDvYilk4TXrtrGe/R7sPG6ctqIJSUyBNhYMf8YyPDZ42VAS945nBZwNBVYoGpv/9L/Jr+GTFl8E32KmZ5P8LNyraeSmTXTy3NKNs/gp9VJqHBjjSjpD0Ck5s0XE5gGCeJF/0Nnm2czHYoXNJHhHpTDaSPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743742185; c=relaxed/simple;
	bh=PQZUj/47GK5Y336buAUmU4OuQ41xqMgU1QNZNAOOm+8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jcc9NjbF3QfVMe8ygKhS1TPmarh7XUj4/juB1EIKlpNRKuwJzYUmSNcSuipj/Nk+qe6OPcqNCAJq6dx1dUsxfso8nP2hyXeCcTRbgtgSgcomu4ZZdhOFz2z/uIyp//rXxH2TnL77XkNeH4fRAoKAwPCqVRkMOe+FHLlaCf9qrBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NG+nf0fF; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NG+nf0fF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743742183; x=1775278183;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PQZUj/47GK5Y336buAUmU4OuQ41xqMgU1QNZNAOOm+8=;
  b=NG+nf0fFj7apb0Ll2g7/3ymylT72BCzaYvQ+BFcHkfjQdYJL+It7ljwI
   b4qWG7uXZBBXd4yK5t+PJG3/jrl0/4E9xTfu0BofAGwkceOnklck4/4LA
   i/Y0ptU9HWEKGj8JaxY7brHj6a7W7JQwqiqHmJTAYKvGPo7QWhFvKa0IK
   +vkMpqi6iLyprCdU428nfnpuY8UFly8uyqDIG/QpFQV8G5oLRrCQWov7h
   deuanwFubr5A5i3ulRk3NB5k1sTXBaS2De2WxiR8yhZL1y8UVQEhnNyRH
   Wcaah9+YmCZOtLER0OzBJAUzPR7bXX3xa6ohvaCWRn025XWJKSLQllTyD
   w==;
X-CSE-ConnectionGUID: k09k7cJ7Rv2FlaNYVq6hlA==
X-CSE-MsgGUID: ND5KO+eyRiSCY9W0rJQ1KA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45349356"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="45349356"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 21:49:42 -0700
X-CSE-ConnectionGUID: 8Cs5Aw4dR2WPwGnD5qVpWQ==
X-CSE-MsgGUID: bS1BnLPTS++cLntYKpmXDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="126985800"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Apr 2025 21:49:40 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0Yzq-0000zn-19;
	Fri, 04 Apr 2025 04:49:38 +0000
Date: Fri, 4 Apr 2025 12:49:20 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20250325 38/39]
 drivers/gpu/drm/nouveau/nvif/fifo.c:64:1: warning: the frame size of 1048
 bytes is larger than 1024 bytes
Message-ID: <202504041254.6e26LBdj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20250325
head:   f9d2e5634b74486b65c885d8ead9b4baf2ada1f7
commit: 34d3d057918f442cd214c7f2c64830b9ee5a43d6 [38/39] drm/nouveau: fifo: Avoid -Wflex-array-member-not-at-end warning
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20250404/202504041254.6e26LBdj-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250404/202504041254.6e26LBdj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504041254.6e26LBdj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/nouveau/nvif/fifo.c: In function 'nvif_fifo_runlists':
>> drivers/gpu/drm/nouveau/nvif/fifo.c:64:1: warning: the frame size of 1048 bytes is larger than 1024 bytes [-Wframe-larger-than=]
      64 | }
         | ^


vim +64 drivers/gpu/drm/nouveau/nvif/fifo.c

cc36205085bb6e Ben Skeggs          2018-05-08  23  
cc36205085bb6e Ben Skeggs          2018-05-08  24  static int
cc36205085bb6e Ben Skeggs          2018-05-08  25  nvif_fifo_runlists(struct nvif_device *device)
cc36205085bb6e Ben Skeggs          2018-05-08  26  {
cc36205085bb6e Ben Skeggs          2018-05-08  27  	struct nvif_object *object = &device->object;
34d3d057918f44 Gustavo A. R. Silva 2025-04-03  28  	DEFINE_RAW_FLEX(struct nv_device_info_v1, a, data, 65);
34d3d057918f44 Gustavo A. R. Silva 2025-04-03  29  	struct nv_device_info_v1_data *runlists = &a->data[0];
34d3d057918f44 Gustavo A. R. Silva 2025-04-03  30  	struct nv_device_info_v1_data *runlist = &a->data[1];
34d3d057918f44 Gustavo A. R. Silva 2025-04-03  31  	const u8 rl_cnt = (__struct_size(a) - sizeof(*a)) / sizeof(*a->data) - 1;
cc36205085bb6e Ben Skeggs          2018-05-08  32  	int ret, i;
cc36205085bb6e Ben Skeggs          2018-05-08  33  
cc36205085bb6e Ben Skeggs          2018-05-08  34  	if (device->runlist)
cc36205085bb6e Ben Skeggs          2018-05-08  35  		return 0;
cc36205085bb6e Ben Skeggs          2018-05-08  36  
34d3d057918f44 Gustavo A. R. Silva 2025-04-03  37  	a->version = 1;
34d3d057918f44 Gustavo A. R. Silva 2025-04-03  38  	a->count = (__struct_size(a) - sizeof(*a)) / sizeof(*a->data);
34d3d057918f44 Gustavo A. R. Silva 2025-04-03  39  	runlists->mthd = NV_DEVICE_HOST_RUNLISTS;
34d3d057918f44 Gustavo A. R. Silva 2025-04-03  40  	for (i = 0; i < rl_cnt; i++) {
34d3d057918f44 Gustavo A. R. Silva 2025-04-03  41  		runlist[i].mthd = NV_DEVICE_HOST_RUNLIST_ENGINES;
34d3d057918f44 Gustavo A. R. Silva 2025-04-03  42  		runlist[i].data = i;
f8fabd31fabaa3 Ben Skeggs          2021-02-08  43  	}
cc36205085bb6e Ben Skeggs          2018-05-08  44  
cc36205085bb6e Ben Skeggs          2018-05-08  45  	ret = nvif_object_mthd(object, NV_DEVICE_V0_INFO, a, sizeof(*a));
cc36205085bb6e Ben Skeggs          2018-05-08  46  	if (ret)
cc36205085bb6e Ben Skeggs          2018-05-08  47  		goto done;
cc36205085bb6e Ben Skeggs          2018-05-08  48  
34d3d057918f44 Gustavo A. R. Silva 2025-04-03  49  	device->runlists = fls64(runlists->data);
6396bb221514d2 Kees Cook           2018-06-12  50  	device->runlist = kcalloc(device->runlists, sizeof(*device->runlist),
6396bb221514d2 Kees Cook           2018-06-12  51  				  GFP_KERNEL);
cc36205085bb6e Ben Skeggs          2018-05-08  52  	if (!device->runlist) {
cc36205085bb6e Ben Skeggs          2018-05-08  53  		ret = -ENOMEM;
cc36205085bb6e Ben Skeggs          2018-05-08  54  		goto done;
cc36205085bb6e Ben Skeggs          2018-05-08  55  	}
cc36205085bb6e Ben Skeggs          2018-05-08  56  
cc36205085bb6e Ben Skeggs          2018-05-08  57  	for (i = 0; i < device->runlists; i++) {
34d3d057918f44 Gustavo A. R. Silva 2025-04-03  58  		if (runlist[i].mthd != NV_DEVICE_INFO_INVALID)
34d3d057918f44 Gustavo A. R. Silva 2025-04-03  59  			device->runlist[i].engines = runlist[i].data;
cc36205085bb6e Ben Skeggs          2018-05-08  60  	}
cc36205085bb6e Ben Skeggs          2018-05-08  61  
cc36205085bb6e Ben Skeggs          2018-05-08  62  done:
cc36205085bb6e Ben Skeggs          2018-05-08  63  	return ret;
cc36205085bb6e Ben Skeggs          2018-05-08 @64  }
cc36205085bb6e Ben Skeggs          2018-05-08  65  

:::::: The code at line 64 was first introduced by commit
:::::: cc36205085bb6e3a4eed1edbe413fd2235cadb27 drm/nouveau/fifo/gk104-: support querying engines available on each runlist

:::::: TO: Ben Skeggs <bskeggs@redhat.com>
:::::: CC: Ben Skeggs <bskeggs@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
