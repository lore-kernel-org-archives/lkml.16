Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DBA1F3BBB
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 05:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748929730; cv=none; b=pvNc3l6uPH7C4xWcZIv6PFaArjod6a4TLcEHVfJl+ApBHybqVb8WJzy5qk26VA8IYzZot90uTHiDyo8sjKCnNO+RkhsBvOrTAG7QPjU5E9URT1AJkR9ha37jXgBlKrq+y2mi7Xu+Ix4NrYeo8pzx7N4u6EeJXdrTxkBIXaYKMP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748929730; c=relaxed/simple;
	bh=7jWU94ik0QbWpSiooVhPx/UIP9kCzHJhH1gbv4/E8qw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YfCCB4PeIC9He+gfiuBEXCymbU25D2FvzDWLrInd9fy+ZuvgzFB4/ON0hlxs2hl7zZS7ZcBNK7fyY2QehTleGn4ZN1ACYV4lAErYElAPEUuBB0zwrc7dsFowlmSKOzB84M/CoAohG10+FMgmpeNzBGBZbNc6B3iYpwOtheRNlt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v0p6kvfL; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v0p6kvfL"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-530bdd90964so45457e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 22:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748929726; x=1749534526; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CaaJTsDGCShy9NH8Xsdsynpcxp9Oj/lPPlRCEtkrCPY=;
        b=v0p6kvfLs52dT0vp4hngO+CPMgP4kdiolD9OkOtGXTDOay0XGOJHwdqznJvS+DQZYF
         8cPPXMIyXSnru9ADzZvD8K3rruk5VCi3bLDpSQq838QOy1rjf5EL7DdvQFuslPnQtPDf
         q2ATA5ZfMiCdx/dvOEuEZkk61Il0ZZYFHpP89vDtX+i6Ldomp/ILVg3lQESYuzJ8aNwm
         lDINZI4c7Xr+5OoN4q5doEMg2f/yR78+cKR7el6dobdyjC0/2FF+SwirfsJMpr8R1uvn
         pu0KCQNZBqd8rMA2O4ICocS5V8XkzPLD8w98cfrzeSs/LrATYSGaVf61dEgB6fjO9paW
         fsGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748929726; x=1749534526;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CaaJTsDGCShy9NH8Xsdsynpcxp9Oj/lPPlRCEtkrCPY=;
        b=XBCYEXcjwRMUhURwMvoDGzSdZvxBmGfdCsl9y0ZA5ZTzY5901g92OEVHoACXHB0iwu
         ARAUi5fcvy8eLV3ekZzvjsSpbHUYSzaVn58/ChDu2YLrGDAKpb5YROlLu6bm8vkHkPKl
         33ym0eLOHLg8xdndCVrBzFc32JN8nOQBQu+6G9piT29OX8T+6YXZrBgD3h77VQl3VLlq
         yJDdgkwDoL+OE5ZbUo55W6hlV97fFk0vzUa2GBY98YLf9hW61k54cCmDlFR00wCVnP4/
         05eWKJA9vZM3ffSqYoBIKbTVT3RS574jXhXnLFrj196YEAiMwwWZ5IV1+zci+3bNq251
         iDHA==
X-Forwarded-Encrypted: i=1; AJvYcCXKVaHjEdqr0XdNkXW3uPjYBBY7j6EfkkgciBvYb6qLSC3PCe5Hb/kov8tPNbbH1NzosGKa5sXJ2lfLz3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvOJUvIUG2hpsj2p0BmXPnbbkLm83zYcZZDgnUHywxcsTyRy1D
	Hsp96q9En58CKEfoEiJexVUAB40qDm0MnIvfpOQhSI4Xq8zjV1bjWx62tqW5RksccrddlWDKfiN
	RhCAFp23Wb6l9ojh+QmoCEnWttg/eanRdIowd/My/tQ==
X-Gm-Gg: ASbGncvzFKQBbz+Ycn+U9WdsFn0Z+oI+iuzV9Z/9zZT4ZzJ1D8+HjEtDOZiaAFmuPGD
	UYIm/uTMFvAEpTH0G9AfN7bdSKYndozF8f4A25/AWyVitj7epDbgB/h3+nKrs6B7GL1a2nd4kNU
	oFVpJMd0xScoIPsad5wvE/9WdNf2sswqk=
X-Google-Smtp-Source: AGHT+IEE/W3g2hwG4gBEVSF+Iek3RiiwVhogHCqvDg/sShN7bI2AYBy6Y0DQ9iTRS3tglw6ByUzvKUeEdmZvkZarTk0=
X-Received: by 2002:a05:6122:a2a:b0:530:5a43:db61 with SMTP id
 71dfb90a1353d-53080f59017mr14951319e0c.2.1748929725864; Mon, 02 Jun 2025
 22:48:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602134307.195171844@linuxfoundation.org>
In-Reply-To: <20250602134307.195171844@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 3 Jun 2025 11:18:34 +0530
X-Gm-Features: AX0GCFu7rs0fy7qq0P5qjPajChCgj4kaqGSHnyRwSFbbdU0gilubxy8DH1XzJEY
Message-ID: <CA+G9fYvkMUv4vFcde9A_chiiKOSkRiydGwnahgZauGExdmWEtQ@mail.gmail.com>
Subject: Re: [PATCH 5.10 000/270] 5.10.238-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, 
	broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Jun 2025 at 20:08, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 5.10.238 release.
> There are 270 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Wed, 04 Jun 2025 13:42:20 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.10.238-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.10.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

There are two issues,

1)
Regressions on riscv defconfig builds failing with gcc-12, gcc-8 and
clang-20 toolchains on 5.10.238-rc1.

Regression Analysis:
 - New regression? Yes
 - Reproducible? Yes

Build regression: riscv defconfig timer-riscv.c:82:2: error: implicit
declaration of function 'riscv_clock_event_stop'

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
---------
drivers/clocksource/timer-riscv.c:82:2: error: implicit declaration of
function 'riscv_clock_event_stop'
[-Werror,-Wimplicit-function-declaration]
   82 |         riscv_clock_event_stop();
      |         ^
1 error generated.

This patch caused the build error,

  clocksource/drivers/timer-riscv: Stop stimecmp when cpu hotplug
  [ Upstream commit 70c93b026ed07078e933583591aa9ca6701cd9da ]

## Steps to reproduce
 - tuxmake --runtime podman --target-arch riscv --toolchain clang-20
--kconfig defconfig LLVM=1 LLVM_IAS=1

## Build riscv
* Build log: https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.10.y/build/v5.10.237-271-g8bfb88108193/testrun/28635871/suite/build/test/clang-20-defconfig/log
* Build details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.10.y/build/v5.10.237-271-g8bfb88108193/testrun/28635871/suite/build/test/clang-20-defconfig/details/
* Build history:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.10.y/build/v5.10.237-271-g8bfb88108193/testrun/28635871/suite/build/test/clang-20-defconfig/history/
* architecture: riscv
* toolchain: gcc-8, gcc-12, clang-20
* config : defconfig
* Build config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2xxPulf5bqlsj7nSlN9PnLY9NXG/config
* Build: https://storage.tuxsuite.com/public/linaro/lkft/builds/2xxPulf5bqlsj7nSlN9PnLY9NXG/


2) The following build warnings were noticed on arm with clang-20.

Build regression: arm at91_dt_defconfig warning comparison of distinct
pointer types ('typeof (nblocks) *' (aka 'unsigned int *') and 'typeof
(num_node_state(N_ONLINE) * ((1UL) << 12) / locksz) *' (aka 'unsigned
long *')) [-Wcompare-distinct-pointer-types]

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build warnings on arm:
---------
net/ipv4/inet_hashtables.c:946:12: warning: comparison of distinct
pointer types ('typeof (nblocks) *' (aka 'unsigned int *') and 'typeof
(num_node_state(N_ONLINE) * ((1UL) << 12) / locksz) *' (aka 'unsigned
long *')) [-Wcompare-distinct-pointer-types]
  946 |         nblocks = max(nblocks, num_online_nodes() * PAGE_SIZE / locksz);
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
1 warning generated.

This commit is causing build warnings,
  tcp: bring back NUMA dispersion in inet_ehash_locks_alloc()
  [ Upstream commit f8ece40786c9342249aa0a1b55e148ee23b2a746 ]

# Steps to reproduce
 - tuxmake --runtime podman --target-arch arm --toolchain clang-20
--kconfig at91_dt_defconfig LLVM=1 LLVM_IAS=0

## Build arm
* architecture: arm
* toolchain: clang-20
* config: at91_dt_defconfig
* Build config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2xxPtpUSdrY70QnawZR0ftSwhPt/config
* Build: https://storage.tuxsuite.com/public/linaro/lkft/builds/2xxPtpUSdrY70QnawZR0ftSwhPt/

## Build
* kernel: 5.10.238-rc1
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
* git commit: 8bfb881081935b7a621f358516e28f4470af3296
* git describe: v5.10.237-271-g8bfb88108193
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.10.y/build/v5.10.237-271-g8bfb88108193

## Test Regressions (compared to v5.10.236-287-gce0fd5a9f1a4)
* riscv, build
  - clang-20-defconfig
  - gcc-12-defconfig
  - gcc-8-defconfig


## Metric Regressions (compared to v5.10.236-287-gce0fd5a9f1a4)

## Test Fixes (compared to v5.10.236-287-gce0fd5a9f1a4)

## Metric Fixes (compared to v5.10.236-287-gce0fd5a9f1a4)

## Test result summary
total: 36900, pass: 27422, fail: 1956, skip: 7366, xfail: 156

## Build Summary
* arc: 5 total, 5 passed, 0 failed
* arm: 100 total, 100 passed, 0 failed
* arm64: 28 total, 28 passed, 0 failed
* i386: 20 total, 20 passed, 0 failed
* mips: 22 total, 22 passed, 0 failed
* parisc: 3 total, 0 passed, 3 failed
* powerpc: 21 total, 21 passed, 0 failed
* riscv: 9 total, 6 passed, 3 failed
* s390: 9 total, 9 passed, 0 failed
* sh: 10 total, 10 passed, 0 failed
* sparc: 6 total, 6 passed, 0 failed
* x86_64: 24 total, 24 passed, 0 failed

## Test suites summary
* boot
* kselftest-arm64
* kselftest-breakpoints
* kselftest-capabilities
* kselftest-clone3
* kselftest-core
* kselftest-cpu-hotplug
* kselftest-exec
* kselftest-fpu
* kselftest-futex
* kselftest-intel_pstate
* kselftest-kcmp
* kselftest-membarrier
* kselftest-mincore
* kselftest-mqueue
* kselftest-openat2
* kselftest-ptrace
* kselftest-rseq
* kselftest-rtc
* kselftest-sigaltstack
* kselftest-size
* kselftest-timers
* kselftest-tmpfs
* kselftest-tpm2
* kselftest-user_events
* kselftest-vDSO
* kselftest-x86
* kunit
* lava
* libgpiod
* libhugetlbfs
* log-parser-boot
* log-parser-build-clang
* log-parser-build-gcc
* log-parser-test
* ltp-capability
* ltp-commands
* ltp-containers
* ltp-controllers
* ltp-crypto
* ltp-cve
* ltp-fcntl-locktests
* ltp-fs
* ltp-fs_bind
* ltp-fs_perms_simple
* ltp-hugetlb
* ltp-ipc
* ltp-math
* ltp-mm
* ltp-nptl
* ltp-pty
* ltp-sched
* ltp-smoke
* ltp-syscalls
* ltp-tracing
* perf
* rcutorture

--
Linaro LKFT
https://lkft.linaro.org
