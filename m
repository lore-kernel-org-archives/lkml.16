Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA602472B0
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 20:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749845640; cv=none; b=gw8UVLxvo/aYndaq6Uhfn0rZjE08JzIgp8cqL3vlqjgEDudh1VF2Jch9a9lBic5EbPSGoNalXnmM/0NJHgaecSOIzTI4vwIyWCmZSsIbHeLmLOXV0KDImEJ7O0uM+R+qoab10kLbOHloDG3i0+lVXzga6Sr//cdjZ63icfSI5N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749845640; c=relaxed/simple;
	bh=MDRu6yPWJY4+fErAYhdY1muQ1QaTDRZmWKOPvibaRVE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WA1LGFPZQ+8sJNCHp/oYVpQfVwIqrDZROdda9nIJhS0OMNRholPnyAMDtNzwR45CEOHYPaH6DaG54RMIgdLSNFI4lOwIQOh8WdGl3siKPMeYnGEEUB90kHWEthNjM4JNQ2jIyS3Rf1V3i/nRH5vFbpfiBo1kLQuQ1s8KvFMG9Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TFI6SJF/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TFI6SJF/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7236C4CEE3;
	Fri, 13 Jun 2025 20:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749845639;
	bh=MDRu6yPWJY4+fErAYhdY1muQ1QaTDRZmWKOPvibaRVE=;
	h=Date:From:To:Cc:Subject:From;
	b=TFI6SJF/I2Rgyz/5einOWGEo1TPSj1LY0z0vDXvrnA39kAZehH6gjQsBvQoaTBK1f
	 3ufBuf/J3rgsf00Raum/KPbRg9QFqvtQLFLsHM01CYtNXUN7Lf2YTlA3Yttgd6H2Yc
	 jX/k7TcK6Io5tvouwQKL6XkpEXKCrCk0ydJU10bLMOYNzND8WCetENof6+GIzRd4li
	 V1ondGerX6dUgHh6MwMYsG6sT+GZLlHSfhBKUcLTh5XZ3axNtuGCqKlCJjVKocOyNq
	 fxCvVZ3tumZzKFUd4eAfPIrX3rOrJf4Q3J3SMum8J3vMgjrkU1eoVCBPFzWT89Nsd1
	 UJgn6Ocq4c15w==
Date: Fri, 13 Jun 2025 17:13:55 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Yicong Yang <yangyicong@hisilicon.com>
Cc: Ali Saidi <alisaidi@amazon.com>, Leo Yan <leo.yan@linaro.org>,
	Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jinqian Yang <yangjinqian1@huawei.com>,
	Douglas Anderson <dianders@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>,
	Kan Liang <kan.liang@linux.intel.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: perf usage of arch/arm64/include/asm/cputype.h
Message-ID: <aEyGg98z-MkcClXY@x1>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

tools/perf (and other tools/ living code) uses a file from the kernel, a
copy, so that we don't break its build when something changes in the
kernel that tooling uses.

There is this tools/perf/check-headers.sh that does the "copy coherency
check", while trying to act on such a warning I stumbled on the report
below.

More details at:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/include/uapi/README


If you could please take a look at this that would be great, the initial
copy was made at:

commit 1314376d495f2d79cc58753ff3034ccc503c43c9
Author: Ali Saidi <alisaidi@amazon.com>
Date:   Thu Mar 24 18:33:20 2022 +0000

    tools arm64: Import cputype.h
    
    Bring-in the kernel's arch/arm64/include/asm/cputype.h into tools/
    for arm64 to make use of all the core-type definitions in perf.
    
    Replace sysreg.h with the version already imported into tools/.
    
    Committer notes:
    
    Added an entry to tools/perf/check-headers.sh, so that we get notified
    when the original file in the kernel sources gets modified.
    
    Tester notes:
    
    LGTM. I did the testing on both my x86 and Arm64 platforms, thanks for
    the fixing up.
    
    Signed-off-by: Ali Saidi <alisaidi@amazon.com>
    Tested-by: Leo Yan <leo.yan@linaro.org>

- Arnaldo

⬢ [acme@toolbx perf-tools]$ m
rm: cannot remove '/home/acme/libexec/perf-core/scripts/python/Perf-Trace-Util/lib/Perf/Trace/__pycache__/Core.cpython-313.pyc': Permission denied
make: Entering directory '/home/acme/git/perf-tools/tools/perf'
  BUILD:   Doing 'make -j32' parallel build
Warning: Kernel ABI header differences:
  diff -u tools/arch/x86/include/asm/cpufeatures.h arch/x86/include/asm/cpufeatures.h
  diff -u tools/arch/arm64/include/asm/cputype.h arch/arm64/include/asm/cputype.h

Auto-detecting system features:
...                                   libdw: [ on  ]
...                                   glibc: [ on  ]
...                                  libelf: [ on  ]
...                                 libnuma: [ on  ]
...                  numa_num_possible_cpus: [ on  ]
...                                 libperl: [ on  ]
...                               libpython: [ on  ]
...                               libcrypto: [ on  ]
...                             libcapstone: [ on  ]
...                               llvm-perf: [ on  ]
...                                    zlib: [ on  ]
...                                    lzma: [ on  ]
...                               get_cpuid: [ on  ]
...                                     bpf: [ on  ]
...                                  libaio: [ on  ]
...                                 libzstd: [ on  ]

  INSTALL libsubcmd_headers
  INSTALL libperf_headers
  INSTALL libapi_headers
  INSTALL libsymbol_headers
  INSTALL libbpf_headers
  INSTALL binaries
  INSTALL tests
  INSTALL libperf-jvmti.so
  INSTALL libexec
  INSTALL perf-archive
  INSTALL perf-iostat
  INSTALL perl-scripts
  INSTALL python-scripts
  INSTALL dlfilters
  INSTALL perf_completion-script
  INSTALL perf-tip
make: Leaving directory '/home/acme/git/perf-tools/tools/perf'
 18: 'import perf' in python                                         : Ok
⬢ [acme@toolbx perf-tools]$ cp arch/arm64/include/asm/cputype.h tools/arch/arm64/include/asm/cputype.h
⬢ [acme@toolbx perf-tools]$ m
rm: cannot remove '/home/acme/libexec/perf-core/scripts/python/Perf-Trace-Util/lib/Perf/Trace/__pycache__/Core.cpython-313.pyc': Permission denied
make: Entering directory '/home/acme/git/perf-tools/tools/perf'
  BUILD:   Doing 'make -j32' parallel build
Warning: Kernel ABI header differences:
  diff -u tools/arch/x86/include/asm/cpufeatures.h arch/x86/include/asm/cpufeatures.h

Auto-detecting system features:
...                                   libdw: [ on  ]
...                                   glibc: [ on  ]
...                                  libelf: [ on  ]
...                                 libnuma: [ on  ]
...                  numa_num_possible_cpus: [ on  ]
...                                 libperl: [ on  ]
...                               libpython: [ on  ]
...                               libcrypto: [ on  ]
...                             libcapstone: [ on  ]
...                               llvm-perf: [ on  ]
...                                    zlib: [ on  ]
...                                    lzma: [ on  ]
...                               get_cpuid: [ on  ]
...                                     bpf: [ on  ]
...                                  libaio: [ on  ]
...                                 libzstd: [ on  ]

  INSTALL libsubcmd_headers
  INSTALL libperf_headers
  INSTALL libapi_headers
  INSTALL libsymbol_headers
  INSTALL libbpf_headers
  CC      /tmp/build/perf-tools/util/arm-spe.o
util/arm-spe.c: In function ‘arm_spe__synth_ds’:
util/arm-spe.c:885:43: error: passing argument 1 of ‘is_midr_in_range_list’ makes pointer from integer without a cast [-Wint-conversion]
  885 |                 if (is_midr_in_range_list(midr, data_source_handles[i].midr_ranges)) {
      |                                           ^~~~
      |                                           |
      |                                           u64 {aka long unsigned int}
In file included from util/arm-spe.c:37:
util/../../arch/arm64/include/asm/cputype.h:306:53: note: expected ‘const struct midr_range *’ but argument is of type ‘u64’ {aka ‘long unsigned int’}
  306 | bool is_midr_in_range_list(struct midr_range const *ranges);
      |                            ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
util/arm-spe.c:885:21: error: too many arguments to function ‘is_midr_in_range_list’; expected 1, have 2
  885 |                 if (is_midr_in_range_list(midr, data_source_handles[i].midr_ranges)) {
      |                     ^~~~~~~~~~~~~~~~~~~~~       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
util/../../arch/arm64/include/asm/cputype.h:306:6: note: declared here
  306 | bool is_midr_in_range_list(struct midr_range const *ranges);
      |      ^~~~~~~~~~~~~~~~~~~~~
make[4]: *** [/home/acme/git/perf-tools/tools/build/Makefile.build:85: /tmp/build/perf-tools/util/arm-spe.o] Error 1
make[3]: *** [/home/acme/git/perf-tools/tools/build/Makefile.build:142: util] Error 2
make[2]: *** [Makefile.perf:798: /tmp/build/perf-tools/perf-util-in.o] Error 2
make[1]: *** [Makefile.perf:290: sub-make] Error 2
make: *** [Makefile:119: install-bin] Error 2
make: Leaving directory '/home/acme/git/perf-tools/tools/perf'
⬢ [acme@toolbx perf-tools]$ 


