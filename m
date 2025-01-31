Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0902614A639
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 06:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738305872; cv=none; b=iO2D+6XvOw21WLIL58mnNnht9V9sVl6iskopNexG12adHdEEUlsWn1nZU6vZsTaxAPVqxH4oVjcEB9sZLNa+Qdi1uWVbIe39MOpL9eBoDTiVsAxz0KvU2RIL5j3NkXTd0EoSiN6zBDBwLW+Rma6RAAfJjg9SrrPmJOTXHSR8uVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738305872; c=relaxed/simple;
	bh=teQlFhgZ1fHacBUYUtGVuB5nuqA3XQeBDjjbGzx+lgE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eTVRG3wGlkfJlDxmVcdr4hQNItU3g/Lti8FNeHaiTc0VsC48kYgcvOi8CF6dgtAbgjxeXA+ra1tIjTh02E6dX2qEqYEO4zYeYDquzBkvemWer11Qh/+F2pBdO3LS6DoG4AcExlyTZDJd0a/G/+d6zbP+Wkwm5m+l5FawBi0JL2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nk7VEqPe; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nk7VEqPe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738305869; x=1769841869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=teQlFhgZ1fHacBUYUtGVuB5nuqA3XQeBDjjbGzx+lgE=;
  b=nk7VEqPeDBCSKbT2dZprhOdq7NQH5F46nokcZawxLK5VO6OK1kRU4DDM
   OHh5lrfmZJJe1mDrwpDZZtIWNn3+Ln+Ng7vt2mNIgMLIKVdDNaehSiUSL
   Yg1tt3KN4aZZ8lnxmm78SRM3VJCVJ1kjcPgR42gkxky/UCBw5D9hgkbl3
   igJNvg/282NxaN5Wr+RcOQv4VqQg50XBQTBD8r1UcRE9bPm9Vm7jvuKzm
   LvxkidOORSQ+5jFm37W1K2oRK6La4uUMKqQJLd70aDuZHPlHMSGFl2XGs
   okPtzvbCdMGOb7fxnujkZy3zZcUlbwnldtm8t/dlrejPjBT8uoq82K833
   Q==;
X-CSE-ConnectionGUID: UXX9XA6aQRWb8W5vMqmAHg==
X-CSE-MsgGUID: M+/SE1txQMCvuy43gge2Pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="38577073"
X-IronPort-AV: E=Sophos;i="6.13,247,1732608000"; 
   d="scan'208";a="38577073"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 22:44:28 -0800
X-CSE-ConnectionGUID: Am8MDMYBTt+qXH+2EN5Gxw==
X-CSE-MsgGUID: lllX/4IIRjeH8MB5hw1ltg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,247,1732608000"; 
   d="scan'208";a="109393822"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 30 Jan 2025 22:44:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdklM-000m6Y-15;
	Fri, 31 Jan 2025 06:44:24 +0000
Date: Fri, 31 Jan 2025 14:44:13 +0800
From: kernel test robot <lkp@intel.com>
To: Timur Tabi <ttabi@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:2112: warning: cannot
 understand function prototype: 'struct rpc_ucode_libos_print_v1e_08 '
Message-ID: <202501311431.Od7RxfB4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Timur,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   69e858e0b8b2ea07759e995aa383e8780d9d140c
commit: 214c9539cf2f5a0116051dc8e2a36b0577383a5e drm/nouveau: expose GSP-RM logging buffers via debugfs
date:   8 weeks ago
config: alpha-randconfig-r026-20211101 (https://download.01.org/0day-ci/archive/20250131/202501311431.Od7RxfB4-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250131/202501311431.Od7RxfB4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501311431.Od7RxfB4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1136: warning: cannot understand function prototype: 'struct registry_list_entry '
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1340: warning: cannot understand function prototype: 'const struct nv_gsp_registry_entries r535_registry_entries[] = '
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:2112: warning: cannot understand function prototype: 'struct rpc_ucode_libos_print_v1e_08 '
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:2174: warning: expecting prototype for create_debufgs(). Prototype was for create_debugfs() instead
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:2800: warning: Function parameter or struct member 'parent' not described in 'r535_gsp_copy_log'
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:2800: warning: Function parameter or struct member 'name' not described in 'r535_gsp_copy_log'
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:2800: warning: Function parameter or struct member 's' not described in 'r535_gsp_copy_log'
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:2800: warning: Function parameter or struct member 't' not described in 'r535_gsp_copy_log'
--
>> drivers/gpu/drm/nouveau/nouveau_drm.c:129: warning: Function parameter or struct member 'gsp_logs' not described in 'NVIF_LOGS_DECLARE'
>> drivers/gpu/drm/nouveau/nouveau_drm.c:129: warning: expecting prototype for gsp_logs(). Prototype was for NVIF_LOGS_DECLARE() instead


vim +2112 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c

  2102	
  2103	/**
  2104	 * rpc_ucode_libos_print_v1E_08 - RPC payload for libos print buffers
  2105	 * @ucode_eng_desc: the engine descriptor
  2106	 * @libos_print_buf_size: the size of the libos_print_buf[]
  2107	 * @libos_print_buf: the actual buffer
  2108	 *
  2109	 * The engine descriptor is divided into 31:8 "class ID" and 7:0 "instance
  2110	 * ID". We only care about messages from PMU.
  2111	 */
> 2112	struct rpc_ucode_libos_print_v1e_08 {
  2113		u32 ucode_eng_desc;
  2114		u32 libos_print_buf_size;
  2115		u8 libos_print_buf[];
  2116	};
  2117	
  2118	/**
  2119	 * r535_gsp_msg_libos_print - capture log message from the PMU
  2120	 * @priv: gsp pointer
  2121	 * @fn: function number (ignored)
  2122	 * @repv: pointer to libos print RPC
  2123	 * @repc: message size
  2124	 *
  2125	 * Called when we receive a UCODE_LIBOS_PRINT event RPC from GSP-RM. This RPC
  2126	 * contains the contents of the libos print buffer from PMU. It is typically
  2127	 * only written to when PMU encounters an error.
  2128	 *
  2129	 * Technically this RPC can be used to pass print buffers from any number of
  2130	 * GSP-RM engines, but we only expect to receive them for the PMU.
  2131	 *
  2132	 * For the PMU, the buffer is 4K in size and the RPC always contains the full
  2133	 * contents.
  2134	 */
  2135	static int
  2136	r535_gsp_msg_libos_print(void *priv, u32 fn, void *repv, u32 repc)
  2137	{
  2138		struct nvkm_gsp *gsp = priv;
  2139		struct nvkm_subdev *subdev = &gsp->subdev;
  2140		struct rpc_ucode_libos_print_v1e_08 *rpc = repv;
  2141		unsigned int class = rpc->ucode_eng_desc >> 8;
  2142	
  2143		nvkm_debug(subdev, "received libos print from class 0x%x for %u bytes\n",
  2144			   class, rpc->libos_print_buf_size);
  2145	
  2146		if (class != NV_GSP_MSG_EVENT_UCODE_LIBOS_CLASS_PMU) {
  2147			nvkm_warn(subdev,
  2148				  "received libos print from unknown class 0x%x\n",
  2149				  class);
  2150			return -ENOMSG;
  2151		}
  2152	
  2153		if (rpc->libos_print_buf_size > GSP_PAGE_SIZE) {
  2154			nvkm_error(subdev, "libos print is too large (%u bytes)\n",
  2155				   rpc->libos_print_buf_size);
  2156			return -E2BIG;
  2157		}
  2158	
  2159		memcpy(gsp->blob_pmu.data, rpc->libos_print_buf, rpc->libos_print_buf_size);
  2160	
  2161		return 0;
  2162	}
  2163	
  2164	/**
  2165	 * create_debufgs - create a blob debugfs entry
  2166	 * @gsp: gsp pointer
  2167	 * @name: name of this dentry
  2168	 * @blob: blob wrapper
  2169	 *
  2170	 * Creates a debugfs entry for a logging buffer with the name 'name'.
  2171	 */
  2172	static struct dentry *create_debugfs(struct nvkm_gsp *gsp, const char *name,
  2173					     struct debugfs_blob_wrapper *blob)
> 2174	{
  2175		struct dentry *dent;
  2176	
  2177		dent = debugfs_create_blob(name, 0444, gsp->debugfs.parent, blob);
  2178		if (IS_ERR(dent)) {
  2179			nvkm_error(&gsp->subdev,
  2180				   "failed to create %s debugfs entry\n", name);
  2181			return NULL;
  2182		}
  2183	
  2184		/*
  2185		 * For some reason, debugfs_create_blob doesn't set the size of the
  2186		 * dentry, so do that here.  See [1]
  2187		 *
  2188		 * [1] https://lore.kernel.org/r/linux-fsdevel/20240207200619.3354549-1-ttabi@nvidia.com/
  2189		 */
  2190		i_size_write(d_inode(dent), blob->size);
  2191	
  2192		return dent;
  2193	}
  2194	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
