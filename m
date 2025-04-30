Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AFB1E98EA
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 16:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746032354; cv=none; b=K7fBKFPThUzrcQFkoc7Z/7yDtkfjKxGuk4BiZTzxL9dp8JyTtL/4AsQKXF+XGj3k/ds8plYpAKubHRh2or97gYk8kSFAhw4SW8j+A5CUBEIHaC9/h50dt9d3iyJf+uwqHzBljzmukTcJiXGR2W7pF4o29QQVpL3tawvxraYaTtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746032354; c=relaxed/simple;
	bh=GTEcGUBkKPXccT1faiEnmUazUSXbka2qTdd3HnptsE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nrwe25RnCgEzsgLliSLXICGc8/ArtKpfYmlUqiXwtJsmqYm/0qipK1N+v5c0wmgJrcoRFMFofQxUbe5kJNlpxP4+4VaUMnHztoNUIJWjNoK7b5w+j/i2QWDLfRwyI1LTiKrA6D0lrLJ3Tg5D+OM1i0/TMYRUNXDRKW4xTGQG/wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iJi4dvgv; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iJi4dvgv"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4dad6cc2be0so22512137.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 09:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746032350; x=1746637150; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0lXnLM79c71DsoI+yzl4Y7ARxJ3p8ButReOnFnSco4I=;
        b=iJi4dvgvK7wwjw4OYOr/ccPzONwtTe+2jGIwP1m6ULjj0rnwjZlbkuOSY8h8mSd9+9
         ci4r0tCFb7RoTje7JgHVMU+QEvjFo7CYWwYYZ5Nhid9DuJeZHbWex/rZKdhgS1R1RFKE
         v06GTOeHkU/BwWNFXhtIHA6vHUKtEJqVrgQxN5GOk+SX1+A7/F37snuZcD2SPsGPzPIg
         0C2IkOUFjLLNpDvTHhRl4K8fVqh9Kqq6vbdgsPll+5Q4ztP5sxNQW/RvLv6hBHUutC1U
         UJo+IeM9/umgiFcTlPCAGCwtL+cUTCcsa+0j0X03kyrejLV9bqd1bXWYYv+SwfCHh+YT
         2biA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746032350; x=1746637150;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0lXnLM79c71DsoI+yzl4Y7ARxJ3p8ButReOnFnSco4I=;
        b=TqwZwVoenw8IGcpAHXjJxnMxgYiHszeQD94Uv/I0qQ7JFQvfWbDq+vAGXccOVAPgic
         9ZQq/5M/tr6i+z3pMkKQ+3qQYHNTJeteKE3O+pu+IKVv0Xysg19V+jdGMAV4V27yVR88
         RclKJbXPp9atdgl8WKhC7EU+aUF4ggSjULD6g+9qrMFiFFQvxAi/NptrUlv9srI1jwcK
         qN7SyH9A87tGF6UJhqGc2kEmgdTBdqT1+HKPbiAGG+Dyv1gGjo9xfrkTt24fnODeHwUL
         YxPpCTHGCbAa3kztN0tDW3NGOLk2gDWQ9UCkynle8cbgPG5xoCexZlMhnhMLyG4aJdWp
         p5IA==
X-Forwarded-Encrypted: i=1; AJvYcCWqsa5tfezbruVB3lh00lhwrXZtZOeJAZLN2Xdwn15cHiMS1uidAQ3IAkG/jHBAc7AUG25sJRgbQfj55W0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6PWC7mF+T+QRMFz8GeIsAJ47gA+maREcOodDRPVYj5zyMh6on
	eYu/Q+Bxj+z/3qZ7IgrKq+fjjUPUD54iYEhztQmrCdKESU6CtXo+PCH3Gpr4+5/HsYnnAKhakD0
	Bcmj0gWVjY1AHQeTpGoSgXxe99hxlxZWIVFnIKQ==
X-Gm-Gg: ASbGncvCB1SUx7KRClIAwqo1+PKnpTUkUC77w8gezq9BHiwFUWMnqu+j2dyBLthN7yt
	/0I0z6LkZY8dryprtZakd/tuBgA4Zq3fw+tWDxflJMLSioeR86X5elMe+90DRms3XI9LqG2XEJb
	XsXK1y0Y7by6JJczYokRCtTio3bHatEvdPPvTSJc4Dmx4B0Ct2MVjPGQM=
X-Google-Smtp-Source: AGHT+IEH3dIIDHsW5az+V8pUXZxXzvAaiwxnqrgFU7XrBLDT0NnscivJwFeiXI/Cd+Ul84Eq/ffVssTnacHufU5Wr94=
X-Received: by 2002:a05:6102:3c98:b0:4bb:dba6:99d4 with SMTP id
 ada2fe7eead31-4dad48fea6amr2931325137.7.1746032349721; Wed, 30 Apr 2025
 09:59:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429161115.008747050@linuxfoundation.org>
In-Reply-To: <20250429161115.008747050@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 30 Apr 2025 22:28:57 +0530
X-Gm-Features: ATxdqUGfeogcMik9UVwyPEMLTncQujWiyfwm5zrgQu384girWevS6O-yTBLvD4M
Message-ID: <CA+G9fYvL0ZXnqujn9iNvy59R1gzX10Of_VLRmad5yg1aGxO_ZQ@mail.gmail.com>
Subject: Re: [PATCH 6.12 000/280] 6.12.26-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, 
	broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Apr 2025 at 22:55, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.12.26 release.
> There are 280 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Thu, 01 May 2025 16:10:15 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.26-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.12.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h


Regressions on s390 build regressions with defconfig with gcc-13/8 and
clang-20/clang-nightly on the stable-rc 6.12.26-rc1.

* s390, build
  - clang-20-defconfig
  - clang-nightly-defconfig
  - clang-nightly-lkftconfig-hardening
  - clang-nightly-lkftconfig-lto-full
  - clang-nightly-lkftconfig-lto-thing
  - gcc-13-allmodconfig
  - gcc-13-defconfig
  - gcc-13-lkftconfig-hardening
  - gcc-8-defconfig-fe40093d
  - gcc-8-lkftconfig-hardening
  - korg-clang-20-lkftconfig-hardening
  - korg-clang-20-lkftconfig-lto-full
  - korg-clang-20-lkftconfig-lto-thing

Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

Build regression: s390 pci_fixup.c no member named 'non_mappable_bars'
in 'struct pci_dev'

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build error s390
include/asm-generic/io.h:736:21: warning: performing pointer
arithmetic on a null pointer has undefined behavior
[-Wnull-pointer-arithmetic]
  736 |         writesl(PCI_IOBASE + addr, buffer, count);
      |                 ~~~~~~~~~~ ^
arch/s390/pci/pci_fixup.c:19:8: error: no member named
'non_mappable_bars' in 'struct pci_dev'
   19 |         pdev->non_mappable_bars = 1;
      |         ~~~~  ^
12 warnings and 1 error generated.

## Build s390
* Build log:  https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.12.y/build/v6.12.24-499-g990f4938689a/testrun/28265216/suite/build/test/clang-20-defconfig/log
* Build history:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.12.y/build/v6.12.24-499-g990f4938689a/testrun/28265216/suite/build/test/clang-20-defconfig/history/
* Build details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.12.y/build/v6.12.24-499-g990f4938689a/testrun/28265216/suite/build/test/clang-20-defconfig/details/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2wPferDpcis0NyPDGQjav2hUYrd/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2wPferDpcis0NyPDGQjav2hUYrd/config
* Toolchain: gcc-8 gcc-13 clang-20 clang-nightly


## Build
* kernel: 6.12.26-rc1
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
* git commit: 990f4938689a6e1e62fecab4342d21ae2a0d5136
* git describe: v6.12.24-499-g990f4938689a
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.12.y/build/v6.12.24-499-g990f4938689a

## Test Regressions (compared to v6.12.24-224-g56d2398227a2)
* s390, build
  - clang-20-defconfig
  - clang-nightly-defconfig
  - clang-nightly-lkftconfig-hardening
  - clang-nightly-lkftconfig-lto-full
  - clang-nightly-lkftconfig-lto-thing
  - gcc-13-allmodconfig
  - gcc-13-defconfig
  - gcc-13-lkftconfig-hardening
  - gcc-8-defconfig-fe40093d
  - gcc-8-lkftconfig-hardening
  - korg-clang-20-lkftconfig-hardening
  - korg-clang-20-lkftconfig-lto-full
  - korg-clang-20-lkftconfig-lto-thing

## Metric Regressions (compared to v6.12.24-224-g56d2398227a2)

## Test Fixes (compared to v6.12.24-224-g56d2398227a2)

## Metric Fixes (compared to v6.12.24-224-g56d2398227a2)

## Test result summary
total: 142554, pass: 117555, fail: 6231, skip: 18376, xfail: 392

## Build Summary
* arc: 5 total, 5 passed, 0 failed
* arm: 139 total, 137 passed, 2 failed
* arm64: 57 total, 56 passed, 1 failed
* i386: 18 total, 16 passed, 2 failed
* mips: 34 total, 33 passed, 1 failed
* parisc: 4 total, 4 passed, 0 failed
* powerpc: 40 total, 40 passed, 0 failed
* riscv: 25 total, 23 passed, 2 failed
* s390: 22 total, 8 passed, 14 failed
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
* kselftest-ftrace
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
