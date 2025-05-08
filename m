Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F33D48CFC
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 12:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746708387; cv=none; b=EtXYCtV8AZpy4YlOjq6US3zkvUMllfhFoZJ9VnsSdmzAabE7wVlFR5sRjzCkcO5CafQsRiuAMcAqMRj2ScWSXozoeUzs6KrgvH8NXVkTcifHb5vAwPH6lsNMkcG5l3i5qx4oLMRZMZBqhqmOVC3R+2hDZk7cPYa2nEz7p4rGIBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746708387; c=relaxed/simple;
	bh=vLN5n2hNo5eOWSuE3Ijv35O1O0lrmdP/iNolJY2Xm4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tOZ6JtmD3r7S9sLG2E6Z4mpJdvhBRfX1VrmohWkx6A7r1SUM6XRydu+cmWXLn5K6lDduDvemXO3wL2rr2wKyJCtRSZsF7CZwcQmCL0KJUeM+2Uu48/5Qj0L7YRHNkiwZ9gLe0QADCc6YNqq7etJU6OA9bZiJOlAo/zDntBK/rhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sBJmUSWd; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sBJmUSWd"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-87843c435f3so243516241.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 05:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746708384; x=1747313184; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GxhL21BMpd7ZCe+Gl4Bl8PbrN0Fr94zagNOX3ZIRJuo=;
        b=sBJmUSWdOv2JXElzpUyg558r5cOLVnpFKLDfZuZHu/U9FuJ9uzeKFNCP0GVM8fcrSo
         nCfSbTudJ2vmTTGuoi0mq6ugfyiohLP1hcKd2A2P3fm4uvBTtszZ7j5fO9YftD3djui4
         MTDtWgBCdDoWCqsLhWaWh+yxhvuCQTJCswC0KHdPzpkjmd+khPu5RD3WLZJF03OWIYc+
         jMQiKZ98YFa84DVpZ74dc9vzynC240XjA8NBuHi9ed6VJlzvOadDXEzoHsaL4StLUDtU
         GaiQbUScv7ecki6aYNEsX4Lx3sQbptwXWtXMAG7yDe9ovGNpZIKd5GJR9j3UWMzEFWyd
         MAGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746708384; x=1747313184;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GxhL21BMpd7ZCe+Gl4Bl8PbrN0Fr94zagNOX3ZIRJuo=;
        b=XbX27WjJCJI33vrjwOX8Jz9xIi728tpaYeZ6U5HkAOIIl82pMdwpdoEEG6xyyWVDpB
         84YAAS+JJ73WQe73qYg5oSbfIs5a0WHzkqmLBpe3KWQ6nJFJqhmkiXQZHGxwCFHgS3L5
         CksG2axjOlhCcA5UZ2xH0ZZ04WJOf/o0QsK+/Gwkxv8T6eXh3O0ie1Vnp5EokGcCMU4M
         47Kej7xTAndNEj5AOVQGHCs6RJuL+/a36L2zYGZVsPbdJppqMi5P6XOGKigYr9UQh5Cu
         l9pAVOXvf8vKYW+YXykQGG8q25uEkzZVbygMKrEkr9if+2terbwsZsOwRP72PrkadaF6
         F+fA==
X-Forwarded-Encrypted: i=1; AJvYcCUeqkpNo2SFAvqS5MqODHvhdHdku5T5qSB1oO4umxdzr5jqhCZ2aQohrWOlgMNUOdnDpMaT0XCdo+H/8WI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQyWj0zJM3mhmn1UygVInOO9RITa2ncCxWaCS0pU7hYGfAFD1l
	4Za3JBh5AEVw+H4Avx3y8kLQNsWnkaIge9pG+U5WVUYhrk14uoB+rLFCKgDskp4K1aUdMnQzt2u
	25J/FMmFUHiM612mA4NdBk07ls/DzFW1yOzfRpw==
X-Gm-Gg: ASbGncuNHuvnXK5vLYPQkp290+ADnCuxe9B9j7LBDFaLhfezd+dYcotEInGxCiePzmd
	vN/FPsnlU/EWwAoKH/JtoIl5tnMPF6EMZd2qY0lwA8WelPzAwvnf7CKZHN9+PRNmTr7xLH2RKlC
	QNvwhEqhwkenl5JOL2gWyZoswsaLu20JM83nnnh9FfOT8/zUdTV4C5fCk=
X-Google-Smtp-Source: AGHT+IFbvVLt60GR/D06kXgXguRPxKyPhSA1l9Mw/CXrZpcupzwQrtjV+ttTgDBVDbqFZyYz6tmMEWUoqdrcuK9JqVw=
X-Received: by 2002:a05:6122:d0c:b0:52a:c0db:29e3 with SMTP id
 71dfb90a1353d-52c37adcb5bmr4445788e0c.10.1746708384263; Thu, 08 May 2025
 05:46:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508112618.875786933@linuxfoundation.org>
In-Reply-To: <20250508112618.875786933@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 8 May 2025 18:16:12 +0530
X-Gm-Features: AX0GCFv8JbrdwShAXY5M9k1TMxLoslym5xx2qqXHrMOUjCEEzcClWt3y2dmQbkc
Message-ID: <CA+G9fYsKqxUExVW1rEhU8_5pYOuhkzXyeL9TmTyGVsV2-C-PFQ@mail.gmail.com>
Subject: Re: [PATCH 6.6 000/129] 6.6.90-rc2 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, 
	broonie@kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Anders Roxell <anders.roxell@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@rivosinc.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 May 2025 at 17:00, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.6.90 release.
> There are 129 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sat, 10 May 2025 11:25:47 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.6.90-rc2.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.6.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Regressions on riscv with allyesconfig and allmodconfig builds failed with
clang-20 and gcc-13 toolchain on the stable-rc 6.6.90-rc1 and 6.6.90-rc2

* riscv, build
  - clang-20-allmodconfig
  - gcc-13-allmodconfig
  - gcc-13-allyesconfig

Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

Build regression: riscv uprobes.c unused variable 'start'

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build error riscv
arch/riscv/kernel/probes/uprobes.c: In function 'arch_uprobe_copy_ixol':
arch/riscv/kernel/probes/uprobes.c:170:23: error: unused variable
'start' [-Werror=unused-variable]
  170 |         unsigned long start = (unsigned long)dst;
      |                       ^~~~~
cc1: all warnings being treated as errors

## Build riscv
* Build log:  https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.6.y/build/v6.6.89-130-ga7b3b5860e08/testrun/28376898/suite/build/test/gcc-13-allmodconfig/log
* Build history:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.6.y/build/v6.6.89-130-ga7b3b5860e08/testrun/28376898/suite/build/test/gcc-13-allmodconfig/history/
* Build details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.6.y/build/v6.6.89-130-ga7b3b5860e08/testrun/28376898/suite/build/test/gcc-13-allmodconfig/details/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2woO9vttziZGlSKcBdoVu2LZm8Q/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2woO9vttziZGlSKcBdoVu2LZm8Q/config
* Toolchain: gcc-13 and clang-20

## Steps to reproduce
 -  tuxmake --runtime podman --target-arch riscv --toolchain gcc-13
--kconfig allmodconfig

## Build
* kernel: 6.6.90-rc2
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
* git commit: a7b3b5860e08c3b29b4a004562b9691d7c25a2f3
* git describe: v6.6.89-130-ga7b3b5860e08
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.6.y/build/v6.6.89-130-ga7b3b5860e08

## Test Regressions (compared to v6.6.87-586-gda7333f263c3)

* riscv, build
  - clang-20-allmodconfig
  - gcc-13-allmodconfig
  - gcc-13-allyesconfig

## Metric Regressions (compared to v6.6.87-586-gda7333f263c3)

## Test Fixes (compared to v6.6.87-586-gda7333f263c3)

## Metric Fixes (compared to v6.6.87-586-gda7333f263c3)

## Test result summary
total: 112131, pass: 91642, fail: 4421, skip: 15654, xfail: 414

## Build Summary
* arc: 5 total, 5 passed, 0 failed
* arm: 129 total, 129 passed, 0 failed
* arm64: 44 total, 44 passed, 0 failed
* i386: 27 total, 20 passed, 7 failed
* mips: 26 total, 22 passed, 4 failed
* parisc: 4 total, 4 passed, 0 failed
* powerpc: 32 total, 31 passed, 1 failed
* riscv: 20 total, 17 passed, 3 failed
* s390: 14 total, 13 passed, 1 failed
* sh: 10 total, 10 passed, 0 failed
* sparc: 7 total, 7 passed, 0 failed
* riscv: 37 total, 33 passed, 4 failed

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

--
Linaro LKFT
https://lkft.linaro.org
