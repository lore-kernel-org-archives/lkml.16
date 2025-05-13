Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7B528ECEA
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 12:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747140943; cv=none; b=VBMY/t88wuCG7LeFixXyil42ppWAxs+/pLu1uCgqeRSN2SuOqA3Y24M17Lkw4/73RCvpCiY9eoalLoKmF3qo0+wq0QRPD/o6FMrK6MuHq3r9fMSjK9FyiDEzKU/F+uH8nlr3sL35kzJtS4qrASpz/HxUiY4g6FEvIO1XXqu8u3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747140943; c=relaxed/simple;
	bh=NlJ/Fp92upe1PHTUxI10oRYp7XkaSCcUunuBq9RDqtA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sdlunq/V+UEK+jUnFDYHSPQxpG5s6BmkkfmhktOHOzAa0mSkWU0Q/jv3K3kHfGH6bfMK1E3+dgZNJzt7BuT4x9zVZRPe4OEwX2ti1+7DfNLPt35OqFTgW0/PgpLF2N1O9ZZFKmpz1qYFDawqsAe/Dy3oE8XpDPHiGbygNTCjYFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rmVtEKWZ; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rmVtEKWZ"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4dad6cc2be0so2117750137.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 05:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747140940; x=1747745740; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Nry7u6hfWQwQzzFrNP3dV55JxQ3yh9zE6gPBoBNYa8E=;
        b=rmVtEKWZLq7kSdmo+z474aLFwt15jWMsIcMqVajFrKAvgFEiRZrmykxwCzkezH032f
         otLjqyC97wWQSDlXM+R7ixep80AQuVvtkOpju4UfSI0MIQP8EyI1n3JQWKDZgnOCuxVo
         3oM0Vo5LgnxSPLTi16BZ4eXAOvqvhxroVdONIpVLlZj04AQvMVyncR5BxLztdr3F8G40
         1F+XHFRGgMgqy8n32tv8rDMZLe2sLVcKLLEVW8c+3eG8TAr+83zEhI9xFm+FVWh5giCh
         Xt1P3LkjSPwjB8/H842o6D4HMLGP6qhSknJIDoEKCf26pCoc5AkSiqejG4KZKVv73eEi
         ZLaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747140940; x=1747745740;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nry7u6hfWQwQzzFrNP3dV55JxQ3yh9zE6gPBoBNYa8E=;
        b=LR/wHCNfT2hC88RqWPTo+ZV5Tlxw719+WqiBYE4yAU0ILhwYQckAT6cMUY/o+xrUma
         KgRVriegnEvpi84Pc1JK6OBr0g0ET4TMryfBHZDLfNn74MM/rKuCiJWAKqClD2wc1yVM
         Z1xUuDUz1sVFblG/zKHR6BUSteuHQeWIDm7KP9i75cLp/nAZRN+F9b8p94PSQvOr4O4y
         50QTEwW+XyNzE84MCxywsuTbsWhpctLmUOBmuphWiPQB4Qd1wGs+NzsTLkNXbjO4zU8i
         w0D2eX9yOyIz+PbADIXVw2DPZLAQkrU9/PeOJK7a0RjvjK7NnH51m9GpbJ7UaO+bWIVK
         1Ggw==
X-Forwarded-Encrypted: i=1; AJvYcCWhnJCJrcOZT8P96n7u7ZVIB4Jk2vuxTfrhjw3YUq29YLG6p0TeglGtlS6AHcWSmls/RC85NUiaaDT/O3k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNFvU+IuLIFy0CIh4Q/tRAnBI9jNgpJpA72S3NW/mHP/CfjK1f
	UeAm5W2s7/GFK++4Y3TxV5fbY4L0hZanf3jmcrdIcSissW+zcxoKkgeifJHM7z8Bjdgnoz6gYF0
	CfaK878SPaC9wd1mvd9S0KZJ/hBrtXln7U9y/Gw==
X-Gm-Gg: ASbGncvXjRBwoMmv5B8C/W6DuWsdjKeAnGAhYqnhOskExJqwIrLAentPmCzY2o8Kr2f
	lI8JdpJ8+Q8GNZ2zqpU/x+/EnmRthVvPmNHVC1ZmVj/kGmu0w5KiEOcJGdMryONNbpLv/YP0DKX
	8v/kS2PQbcxNzqJhWbEjhJsOfDfJm+KF8=
X-Google-Smtp-Source: AGHT+IGFcHp5JvTFATrGpVvnOd6CO2iyeKzv73ghvBmScpT3is0UNci+6dQ/KgknaFzY+U4cPmuhRe+a6b3XtqCIY5k=
X-Received: by 2002:a05:6102:1521:b0:4de:81a:7d40 with SMTP id
 ada2fe7eead31-4deed357904mr13690723137.9.1747140939905; Tue, 13 May 2025
 05:55:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512172041.624042835@linuxfoundation.org>
In-Reply-To: <20250512172041.624042835@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 13 May 2025 13:55:28 +0100
X-Gm-Features: AX0GCFth71TY2p9GdRVKCuaaW-FDb23AYXLI8pnuI3D_eyoXuasH5z7h8h0Z8N0
Message-ID: <CA+G9fYsnfsB+NVwntOVVH8KuaZ-TffKiejsFFTVmk-TCNeSy9Q@mail.gmail.com>
Subject: Re: [PATCH 6.12 000/184] 6.12.29-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, 
	broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 12 May 2025 at 18:58, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.12.29 release.
> There are 184 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Wed, 14 May 2025 17:19:58 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.29-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.12.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Regressions on mips defconfig tinyconfig and allnoconfig builds failed with
clang-20 toolchain on stable-rc 6.12.29-rc1, 6.14.7-rc1, and 6.6.91-rc1.
But, builds pass with gcc-12.

* mips, build
  - clang-20-allnoconfig
  - clang-20-defconfig
  - clang-20-tinyconfig
  - korg-clang-20-lkftconfig-hardening
  - korg-clang-20-lkftconfig-lto-full
  - korg-clang-20-lkftconfig-lto-thing

Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

Build regression: mips defconfig clang-20 instantiation error expected
an immediate

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build error mips
<instantiation>:7:11: error: expected an immediate
 ori $26, r4k_wait_idle_size - 2
          ^
<instantiation>:10:13: error: expected an immediate
 addiu $26, r4k_wait_exit - r4k_wait_insn + 2
            ^
<instantiation>:10:29: error: expected an immediate
 addiu $26, r4k_wait_exit - r4k_wait_insn + 2
                            ^
<instantiation>:7:11: error: expected an immediate
 ori $26, r4k_wait_idle_size - 2
          ^
<instantiation>:10:13: error: expected an immediate
 addiu $26, r4k_wait_exit - r4k_wait_insn + 2
            ^
<instantiation>:10:29: error: expected an immediate
 addiu $26, r4k_wait_exit - r4k_wait_insn + 2
                            ^
## Build mips
* Build log: https://qa-reports.linaro.org/api/testruns/28410167/log_file/
* Build history:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.12.y/build/v6.12.28-185-gd90d77b7ffdf/testrun/28410167/suite/build/test/clang-20-defconfig/history/
* Build details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.12.y/build/v6.12.28-185-gd90d77b7ffdf/testrun/28410167/suite/build/test/clang-20-defconfig/details/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2x0STWrUibOnjQLcSDWp3b7iEHf/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2x0STWrUibOnjQLcSDWp3b7iEHf/config
* Toolchain: clang-20


## Build
* kernel: 6.12.29-rc1
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
* git commit: d90d77b7ffdf042185947a9671131e657003287a
* git describe: v6.12.28-185-gd90d77b7ffdf
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.12.y/build/v6.12.28-185-gd90d77b7ffdf

## Test Regressions (compared to v6.12.26-167-g483b39c5e6de)
* mips, build
  - clang-20-allnoconfig
  - clang-20-defconfig
  - clang-20-tinyconfig
  - korg-clang-20-lkftconfig-hardening
  - korg-clang-20-lkftconfig-lto-full
  - korg-clang-20-lkftconfig-lto-thing

## Metric Regressions (compared to v6.12.26-167-g483b39c5e6de)

## Test Fixes (compared to v6.12.26-167-g483b39c5e6de)

## Metric Fixes (compared to v6.12.26-167-g483b39c5e6de)

## Test result summary
total: 148229, pass: 122716, fail: 6415, skip: 18536, xfail: 562

## Build Summary
* arc: 5 total, 5 passed, 0 failed
* arm: 139 total, 137 passed, 2 failed
* arm64: 56 total, 55 passed, 1 failed
* i386: 18 total, 16 passed, 2 failed
* mips: 34 total, 27 passed, 7 failed
* parisc: 4 total, 4 passed, 0 failed
* powerpc: 40 total, 40 passed, 0 failed
* riscv: 25 total, 23 passed, 2 failed
* s390: 22 total, 21 passed, 1 failed
* sh: 5 total, 5 passed, 0 failed
* sparc: 4 total, 3 passed, 1 failed
* x86_64: 49 total, 42 passed, 7 failed

## Test suites summary
* boot
* commands
* kselftest-arm64
* kselftest-breakpoints
* kselftest-capabilities
* kselftest-cgroup
* kselftest-clone3
* kselftest-core
* kselftest-cpu-hotplug
* kselftest-cpufreq
* kselftest-efivarfs
* kselftest-exec
* kselftest-fpu
* kselftest-futex
* kselftest-gpio
* kselftest-intel_pstate
* kselftest-ipc
* kselftest-kcmp
* kselftest-kvm
* kselftest-livepatch
* kselftest-membarrier
* kselftest-memfd
* kselftest-mincore
* kselftest-mm
* kselftest-mqueue
* kselftest-net
* kselftest-net-mptcp
* kselftest-openat2
* kselftest-ptrace
* kselftest-rseq
* kselftest-rtc
* kselftest-seccomp
* kselftest-sigaltstack
* kselftest-size
* kselftest-tc-testing
* kselftest-timers
* kselftest-tmpfs
* kselftest-tpm2
* kselftest-user_events
* kselftest-vDSO
* kselftest-x86
* kunit
* kvm-unit-tests
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
* ltp-cpuhotplug
* ltp-crypto
* ltp-cve
* ltp-di[
* ltp-dio
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
* rt-tests-cyclicdeadline
* rt-tests-pi-stress
* rt-tests-pmqtest
* rt-tests-rt-migrate-test
* rt-tests-signaltest

--
Linaro LKFT
https://lkft.linaro.org
