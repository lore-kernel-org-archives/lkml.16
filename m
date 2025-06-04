Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47D925EFBF
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 11:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749036011; cv=none; b=sYt4ha6AvqDDd0APaL4sZJUc9OrECD8DhfLWW5EEayAj4gqADyLHjyKorvoZnFKQUsokff9+zUbGzXVahsSl8/XJK3IsL7lqMJKd2X5VOxZyWPni9Bgzn40VNj14/84uflZQmutuqwsXoRdC725GMHUyc6HyJXuu2fEd1VXafVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749036011; c=relaxed/simple;
	bh=YHd4xZcBCdKBN8J++MiZTkfPsgwm7PVknj53DY0Zn6A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hZTuNpSurzm/DzHG9w1BYPomotLT8J6EAAjs5jiNEQ526tQXH5rsh1ZZrxAi7lJ6/Yk8lH7LiMgyG1cFJVZoxvkMAMHMk3XG3zaQGPTgqhlFJ9Ue8cxFlRyyXrJSI2Y7iLGLPZhgGb0liQ/L+GidSkd/E5mTzqa4o7mtRDtu+Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=awh5mH7K; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="awh5mH7K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749036009; x=1780572009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YHd4xZcBCdKBN8J++MiZTkfPsgwm7PVknj53DY0Zn6A=;
  b=awh5mH7KAsRCPlA9PGpZ5RXLMhzx5QQMw9ZthtcOEsWrKJP0RWpZuMSU
   ePMulO0TUYtAH0OxKDh5VJHq407J4ZDDyP8+ckLFqGfKymMTo+KD6oDnQ
   QeKMj9UkQqsPyOZD4Itm0GqE69iRSE/BFME8d492PqHAHx50HGaTfiHtS
   +2vt/7UA+AQUdtFBK2tckSEbp/Hi987BwxtU9TQKszpbGMRyxjv5AizjX
   E3hsQXw+FQwijIfHkZsnzYhj8yk2FoniFQ2RHK/MpTyKz7KgTwh/W7qqw
   pKJexur+sAUM0jhWHHcr2dv75cT7fUJbZiPdzrk6PPdNq5qCqslZ1SKML
   g==;
X-CSE-ConnectionGUID: y+VaGlZ7SKavvoy+IU3WWg==
X-CSE-MsgGUID: I5kNXrV1TGqKagF+A2QQkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="51255276"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="51255276"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 04:20:08 -0700
X-CSE-ConnectionGUID: MC94g4S0Th6O+mli522cZA==
X-CSE-MsgGUID: 8+xvg4u4TM+exkC+Lk/Z8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="176110094"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Jun 2025 04:20:07 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMmA7-0001g2-2j;
	Wed, 04 Jun 2025 11:20:03 +0000
Date: Wed, 4 Jun 2025 19:19:49 +0800
From: kernel test robot <lkp@intel.com>
To: Shahab Vahedi <shahab@synopsys.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	Alexei Starovoitov <ast@kernel.org>
Subject: arch/arc/net/bpf_jit_arcv2.c:2236:3: error: label at end of compound
 statement
Message-ID: <202506041921.lFErMU6Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5abc7438f1e9d62e91ad775cc83c9594c48d2282
commit: f122668ddcce450c2585f0be4bf4478d6fd6176b ARC: Add eBPF JIT support
date:   1 year, 1 month ago
config: arc-randconfig-2005-20250604 (https://download.01.org/0day-ci/archive/20250604/202506041921.lFErMU6Q-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250604/202506041921.lFErMU6Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506041921.lFErMU6Q-lkp@intel.com/

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
>> {standard input}:32583: Error: flag mismatch for instruction 'mpyd'


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
