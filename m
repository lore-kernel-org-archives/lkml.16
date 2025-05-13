Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860DA64D
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 17:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747157591; cv=none; b=UxhhzAyWMXAZImWYP28hlXtDYK67IHVM4Zn0OaQ+Oit5fT2l84fl7JnZJ7CjbK9xX33CfHgtRdVBHCIvFT6I8MAddqQiIQ+3jXsVYa0xjLLKjBnISYnXf56bq9oPyqcYDvpooghG0e77wYP6kRJcDmJmrsLXOg0Y1OzmjS4F9rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747157591; c=relaxed/simple;
	bh=181/6XfkiZiDiaZQFYts1ypmeeCj9Bxgoo5NUHCw1xA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NrulIE8tIHQ3JYtxSSCLIgsjysEjgA2mxQHLQsxUS+xz4ARyHONy9UIE3AGH0b9U//aP4TPLknGcWumyursLjRw1xy1LyjYFr54XJ6L+B4GvrppzUl3XjqMCIsXp97IcHSjONLeWv4xRB2ycXfa51x+JQIGHtce7pLJ5f4ZErjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I1j0nyco; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I1j0nyco"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b0b2d0b2843so4638077a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 10:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747157589; x=1747762389; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FZ78LRASepbKRHv+EBFpcortTEBtcfFbz829Py5N4Fg=;
        b=I1j0nycoLGZneYhp6aStVVUtkBHnAYSNdgF2L4hEhuL25UNwq9p2NBvdK5tR1Pp3jC
         sx6C56WzkXyTUCRaY6vuFO7qhLr9b0r5zZW+JLFSE+TQVCcMRTojIvenBRwibcayTWFI
         A5TEC4gunWSZ4zTbii7gHVGX7kAbML8B5rWhtBQmL9cNApxlFPn/LJ1DELxTCC/4fgPp
         NUODLmHFLjoexORG6fNB7knXw0hz8YPaikJ9a9n8qLLvM5fg7eL4QbKupj97rpQaZHk3
         /GlUIrKFwXAHHVr7E/8udO1sZiNa2N/PU3fLEsKcctCs93letf1szeToh+DX2mNKXLfk
         irxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747157589; x=1747762389;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FZ78LRASepbKRHv+EBFpcortTEBtcfFbz829Py5N4Fg=;
        b=I/DK6zcs0WRz5/mSEWWSDYTR0T3f5QHF9ah5Yew7svMHZMGXtK0tt+mVgHEzIAcVic
         cTJcoH/ebJPhBg97D1BFXx/8LH2c9WVyZhUhmuu5e3y2zdlnrxO8GAvB3sNWvij9G48u
         l7+u2NupCyOzrINuT5R6Z2FgyD7DLq+qTDzratxZiB315P20Mke2jPQeo5AxLcDhGEr8
         X5+XhP/VTlmpYe0tyliCmMaeg/aRFN9GofyGZrDqQS2ihENWs5TrXBbKpoCD4VPuPB+l
         brJVH8zNRGlWobl4UblXbzsVQnhZ0MiiAwW5awtkghdTmKkkEOp5ooMG/OTPZj2VtfJd
         MT5A==
X-Forwarded-Encrypted: i=1; AJvYcCWxOtvLuoHGTPCJFcqlFmm6Wg7oXC2lNaPlKtYFQQuPplWjc4sZGCfB/05R0Y8eKDUCFnclMujxhyfPvRM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLN2ArT6h+80tSNU2jiZisDFVLut/s81+4JhcfXNXx+zzYGwfM
	Wt5IJREX8uYKi1DIiGwMwxXdHTIQsDwFMbP9hy8Q5aT7q5sB44PcaW8ns1e8DS2M3nomgLvReuL
	uOoqdFoOAzXWt6qfbWCbxnVEHHULYpHwKg+mT9g==
X-Gm-Gg: ASbGncsTViLMMGD2D49F3zx9f3XBCAdY3KsmDxq8qGdBabdD90yxvBikN0MN5Zhl1VQ
	9Elgcfw2Eokxdy8Ln8UJgB06yAggcseulEJ5ur/n5u2wou69Y4txp+j9Ja+z5Ikd3qxsd0qpmCI
	SK8WygHViEYLuWYkM9duyz+MHLKZ5mRho=
X-Google-Smtp-Source: AGHT+IHaSraNc4If8Dzd5YNvgi4mmUzyWm2Z50NAMbHyNH0U41IN9l6+nuCKoX1UgOAsxQqPQJFcK8/TocEH3Gv7YUE=
X-Received: by 2002:a17:903:1a2e:b0:225:abd2:5e4b with SMTP id
 d9443c01a7336-23198127775mr4086715ad.16.1747157588769; Tue, 13 May 2025
 10:33:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512172027.691520737@linuxfoundation.org>
In-Reply-To: <20250512172027.691520737@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 13 May 2025 18:32:57 +0100
X-Gm-Features: AX0GCFv3ol3ofoxdFfKQkwZwmjcTr6QqYSytm9VmW8NQd-dGeucGQGrJiJFq2Gk
Message-ID: <CA+G9fYsQTEcYgaBP8L2+ypF2KRszCUWiPSc8kpxZwcQ00HYzGw@mail.gmail.com>
Subject: Re: [PATCH 6.6 000/113] 6.6.91-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, 
	broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 12 May 2025 at 19:07, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.6.91 release.
> There are 113 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Wed, 14 May 2025 17:19:58 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.6.91-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.6.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Regressions on mips defconfig tinyconfig and allnoconfig builds failed with
clang-20 toolchain on stable-rc 6.6.91-rc1, 6.14.7-rc1 and 6.12.29-rc1.
But, builds pass with gcc-12.

* mips, build
  - clang-20-allnoconfig
  - clang-20-defconfig
  - clang-20-tinyconfig

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

The bisection found this as first bad commit,

    MIPS: Fix idle VS timer enqueue
    [ Upstream commit 56651128e2fbad80f632f388d6bf1f39c928267a ]


## Build mips
* Build log: https://qa-reports.linaro.org/api/testruns/28415740/log_file/
* Build history:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.6.y/build/v6.6.90-114-gbb031f5ca8bd/testrun/28415740/suite/build/test/clang-20-defconfig/history/
* Build details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.6.y/build/v6.6.90-114-gbb031f5ca8bd/testrun/28415740/suite/build/test/clang-20-defconfig/details/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2x0VamyqibDAUz06y5ot4qMwMFU/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2x0VamyqibDAUz06y5ot4qMwMFU/config
* Toolchain: clang-20

## Build
* kernel: 6.6.91-rc1
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
* git commit: bb031f5ca8bd915d7802486e59e860738824e535
* git describe: v6.6.90-114-gbb031f5ca8bd
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.6.y/build/v6.6.90-114-gbb031f5ca8bd

## Test Regressions (compared to v6.6.89-130-ga7b3b5860e08)
* mips, build
  - clang-20-allnoconfig
  - clang-20-defconfig
  - clang-20-tinyconfig


## Metric Regressions (compared to v6.6.89-130-ga7b3b5860e08)

## Test Fixes (compared to v6.6.89-130-ga7b3b5860e08)

## Metric Fixes (compared to v6.6.89-130-ga7b3b5860e08)

## Test result summary
total: 119656, pass: 98071, fail: 4521, skip: 16650, xfail: 414

## Build Summary
* arc: 5 total, 5 passed, 0 failed
* arm: 129 total, 129 passed, 0 failed
* arm64: 44 total, 43 passed, 0 failed, 1 skipped
* i386: 27 total, 20 passed, 7 failed
* mips: 26 total, 19 passed, 7 failed
* parisc: 4 total, 4 passed, 0 failed
* powerpc: 32 total, 31 passed, 1 failed
* riscv: 20 total, 20 passed, 0 failed
* s390: 14 total, 13 passed, 1 failed
* sh: 10 total, 10 passed, 0 failed
* sparc: 7 total, 7 passed, 0 failed
* x86_64: 37 total, 33 passed, 4 failed

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

--
Linaro LKFT
https://lkft.linaro.org
