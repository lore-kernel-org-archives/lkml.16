Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC0618C930;
	Fri,  7 Feb 2025 20:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738958647; cv=none; b=mhCTi41tgntN2Dke+OGUJ7yTxD0HmL/feDgsm6IuhESxQ71bOxna55BzqtP8oyMlFcKMUUVShOBhEkjYy17BY/846sDB17TfDsbgjN8RrwYFZYCVTCBLy0o+1Vu1eLNJ1BJ06cTbljLFA7pojlEOV1ih8ttJ4X/4vLP49EnVOt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738958647; c=relaxed/simple;
	bh=WjlNe0sVb6+Z/v6gi86kjLnaUhKqTTz0OLGVmjtl99c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=camblUosJowf8umnegIFzuqXMzLukOOBeFxVQ8PYzV2REjItqYF4IjQxW3K0GbxDFHk8PGGQTTmrxqrhmc3Dj+Y2ftvgZAdhJygOOA+4WJWVGofmFHch0S8OWFhbOO9ASuGdirithDMzaLfjIckigxHr9cG5GqyLXSI2knDbAbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eau21S+4; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eau21S+4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738958646; x=1770494646;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WjlNe0sVb6+Z/v6gi86kjLnaUhKqTTz0OLGVmjtl99c=;
  b=Eau21S+4c+dw0OSXMwj10ecfnAvst9IHk+LbjsUoi+msW/phcVuZPlQu
   eMX4+IjGjnut6RvCp4oy9jH8nIUhoXrQrjsnUNGO96e3Z2kyagKiLEV4M
   TxZSmkibVUER98owrujQuek0W2H8PscGyGxO/dLuhqL8eoBhez2umWXe8
   1eRaXh2sCEXC08Vvuf5vho9imP7MRhSL7uoijCpQXPmmcFqMVqrfTZ9UL
   WLElO0k8aPWuy6qRTX/dILijgNUC3/ZjJrgpvVtKY+HHNxIpLQw1V9QQz
   ssDI6To+GiDCd4X6Btd4k4BRnfzmeB6FFNX2u9op22tfVWpZB8D8XEBgp
   Q==;
X-CSE-ConnectionGUID: eplit/F5SLq1r3c6KdkiMg==
X-CSE-MsgGUID: WadJuXbeQE+3tZP0ZddzOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39303883"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; 
   d="scan'208";a="39303883"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 12:04:06 -0800
X-CSE-ConnectionGUID: 0v98F1P2TGqq5H5QmNuAcA==
X-CSE-MsgGUID: fWFbOHFTS7iFzYy6Pn10Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116824606"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Feb 2025 12:04:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgUZz-000yyR-23;
	Fri, 07 Feb 2025 20:03:59 +0000
Date: Sat, 8 Feb 2025 04:03:04 +0800
From: kernel test robot <lkp@intel.com>
To: Nikola Jelic <nikola.jelic83@gmail.com>, lgirdwood@gmail.com,
	broonie@kernel.org, perex@perex.cz, tiwai@suse.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, rwalton@cmlmicro.com
Subject: Re: [PATCH v3 2/2] ASoC: codecs: cmx655: Add CML's CMX655D codec
Message-ID: <202502080303.D7LqDToV-lkp@intel.com>
References: <20250207161412.6281-2-nikola.jelic83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207161412.6281-2-nikola.jelic83@gmail.com>

Hi Nikola,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on robh/for-next tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.14-rc1 next-20250207]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nikola-Jelic/ASoC-codecs-cmx655-Add-CML-s-CMX655D-codec/20250208-001527
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250207161412.6281-2-nikola.jelic83%40gmail.com
patch subject: [PATCH v3 2/2] ASoC: codecs: cmx655: Add CML's CMX655D codec
reproduce: (https://download.01.org/0day-ci/archive/20250208/202502080303.D7LqDToV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502080303.D7LqDToV-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-19/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
>> ./sound/soc/codecs/cmx655-i2c.c: 3 linux/version.h not needed.
>> ./sound/soc/codecs/cmx655-spi.c: 3 linux/version.h not needed.
>> ./sound/soc/codecs/cmx655.c: 3 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 424: need linux/version.h
   ./tools/testing/selftests/bpf/progs/dev_cgroup.c: 9 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/netcnt_prog.c: 3 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_map_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_send_signal_kern.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_spin_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_tcp_estats.c: 37 linux/version.h not needed.
   ./tools/testing/selftests/wireguard/qemu/init.c: 27 linux/version.h not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
