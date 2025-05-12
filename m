Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F92725523A
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 05:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747028444; cv=none; b=UXMat7MJ2RuuFPxyCE8+ZETXEZ+X+VlxHGNKz8VfAI+e//onE+cb+85Y21UqwGj/8ZUftNfwy8NRXu4GEhGghXnM08LQXDW5MWc1XoGya0iM3Bl28h3fGuh+4qV3tWX6ilkLS69Q2axMcxoqfAWSAJD9iZoevBgT43FfgXHBarQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747028444; c=relaxed/simple;
	bh=W1kuVJ1hrT0oinDKb+swhOeCE0WjQvxBfgFzwL9Ibyw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xzh4GXTvIVeV5vhODC8fpojkH6+L4EtNPr6Or4XpSYxyPKNjPPUVEycwJXTwPGfpgmHhQ0VUPrKjJHN11AqxIJk8yaiWdsozm+rv7gfbjWxu5j7+8n4ZTzW/lqDSuN8NgSToaPiyUt6eSgDBdsSvIe55X5ZJdFk/akXNiu4nc6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fvaexREX; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fvaexREX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747028441; x=1778564441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W1kuVJ1hrT0oinDKb+swhOeCE0WjQvxBfgFzwL9Ibyw=;
  b=fvaexREXQu6aziRkiaFs9mVl2Tg4tob9Wbf2sObR2PQ/U7zvSwU9n9OQ
   VaPXiBR7bufDqvi6uit38v+LSiBEYj9ANW4qUPnkN0KdoVtuQdXOCau6Q
   /uLxVGiyS52MIKW9rd4QTl+zxrKDA7Vf1FdaJIceXRRPaotoqQzSdd1Tr
   2v2oFni2Re30H3vpOzm9Dtpi8lDbhfuhxs9IsMSJzmAuRJ1dI4w9DZbgk
   uoHa4fw6FvwlTDM7uEKGILul40ml51i6hycmLQzVSelYglk25klqECByW
   z9v0lVfzqBkDXdhCLnZd/A0DQvFsffP59zO0R/B/x5Ng+GoggbvM4hkIu
   w==;
X-CSE-ConnectionGUID: lcOgyKTvTsejAnZRNLNFDA==
X-CSE-MsgGUID: Gszgua6qSwC177hZFxouJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="66347958"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="66347958"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 22:40:41 -0700
X-CSE-ConnectionGUID: ZQBA3aluQGWuupA0PyYFuA==
X-CSE-MsgGUID: 7+0mR8SIQ7mI9xlte9HRDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="142380062"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 May 2025 22:40:39 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uELu0-000ECt-35;
	Mon, 12 May 2025 05:40:36 +0000
Date: Mon, 12 May 2025 13:40:17 +0800
From: kernel test robot <lkp@intel.com>
To: Shahab Vahedi <shahab@synopsys.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	Alexei Starovoitov <ast@kernel.org>
Subject: arch/arc/net/bpf_jit_arcv2.c:2236:3: error: label at end of compound
 statement
Message-ID: <202505121349.qq0nmtYa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3
commit: f122668ddcce450c2585f0be4bf4478d6fd6176b ARC: Add eBPF JIT support
date:   12 months ago
config: arc-randconfig-001-20250512 (https://download.01.org/0day-ci/archive/20250512/202505121349.qq0nmtYa-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250512/202505121349.qq0nmtYa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505121349.qq0nmtYa-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arc/net/bpf_jit_arcv2.c: In function 'gen_swap':
>> arch/arc/net/bpf_jit_arcv2.c:2236:3: error: label at end of compound statement
      default:
      ^~~~~~~
   arch/arc/net/bpf_jit_arcv2.c:2254:3: error: label at end of compound statement
      default:
      ^~~~~~~
   arch/arc/net/bpf_jit_arcv2.c: In function 'gen_jmp_64':
   arch/arc/net/bpf_jit_arcv2.c:2867:2: error: label at end of compound statement
     default:
     ^~~~~~~
--
   {standard input}: Assembler messages:
>> {standard input}:315: Error: flag mismatch for instruction 'mpydu'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
   Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
   Selected by [m]:
   - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM_XE [=m] && DRM_XE [=m]=m


vim +2236 arch/arc/net/bpf_jit_arcv2.c

  2199	
  2200	u8 gen_swap(u8 *buf, u8 rd, u8 size, u8 endian, bool force, bool do_zext)
  2201	{
  2202		u8 len = 0;
  2203	#ifdef __BIG_ENDIAN
  2204		const u8 host_endian = BPF_FROM_BE;
  2205	#else
  2206		const u8 host_endian = BPF_FROM_LE;
  2207	#endif
  2208		if (host_endian != endian || force) {
  2209			switch (size) {
  2210			case 16:
  2211				/*
  2212				 * r = B4B3_B2B1 << 16 --> r = B2B1_0000
  2213				 * then, swape(r) would become the desired 0000_B1B2
  2214				 */
  2215				len = arc_asli_r(buf, REG_LO(rd), REG_LO(rd), 16);
  2216				fallthrough;
  2217			case 32:
  2218				len += arc_swape_r(BUF(buf, len), REG_LO(rd));
  2219				if (do_zext)
  2220					len += zext(BUF(buf, len), rd);
  2221				break;
  2222			case 64:
  2223				/*
  2224				 * swap "hi" and "lo":
  2225				 *   hi ^= lo;
  2226				 *   lo ^= hi;
  2227				 *   hi ^= lo;
  2228				 * and then swap the bytes in "hi" and "lo".
  2229				 */
  2230				len  = arc_xor_r(buf, REG_HI(rd), REG_LO(rd));
  2231				len += arc_xor_r(BUF(buf, len), REG_LO(rd), REG_HI(rd));
  2232				len += arc_xor_r(BUF(buf, len), REG_HI(rd), REG_LO(rd));
  2233				len += arc_swape_r(BUF(buf, len), REG_LO(rd));
  2234				len += arc_swape_r(BUF(buf, len), REG_HI(rd));
  2235				break;
> 2236			default:
  2237				/* The caller must have handled this. */
  2238			}
  2239		} else {
  2240			/*
  2241			 * If the same endianness, there's not much to do other
  2242			 * than zeroing out the upper bytes based on the "size".
  2243			 */
  2244			switch (size) {
  2245			case 16:
  2246				len = arc_and_i(buf, REG_LO(rd), 0xffff);
  2247				fallthrough;
  2248			case 32:
  2249				if (do_zext)
  2250					len += zext(BUF(buf, len), rd);
  2251				break;
  2252			case 64:
  2253				break;
  2254			default:
  2255				/* The caller must have handled this. */
  2256			}
  2257		}
  2258	
  2259		return len;
  2260	}
  2261	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
