Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC4E27BF7A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 19:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744225923; cv=none; b=ALjpOgkeFN3GSw1MNn2Y9WPsSFOI4GTem3ysSfK4TxYI+Nip0RXRR7P3ZzB7tH+qOyLAF1YmqjYoTuQjtSA1dmUL+q1BMplwZyQVzBikJv+UWgRlkewlPvxx/nWGkRRlTo1o9/rhZM4LBZKbKf8C8cG+jVM0IMDWTLHrdfCiW1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744225923; c=relaxed/simple;
	bh=rJVQDauQEjZj0g6jxReYpgMbOkc7rgwaKyOHe56V6g0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HcupPs2IuMfyLmkuezWKP/va+kOj/VniTOpUZnJkh2i+xDhFlCMAh7NYMzbycpXGV02zVlBMtrXWoxRt9hXYLdVxFIxfrhp82TG0vhQ7a2UqhhNilG3wVmnR5aNsoyJ0FEbwnLKhDA1KKoeZdd02r/lZA/UkKphj0M0cNAIqNgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hdCSHuc9; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hdCSHuc9"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-86d377306ddso3064671241.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 12:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744225919; x=1744830719; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wi3/JxnteRx/5BMoOtb3JvQUUrvrHRfi+TmZ/LdTJGI=;
        b=hdCSHuc90MzvGVeO4lZNKSJyPEYfY/D+pJbE+brGQS8ItufP8Jpiuz/DvYlwgoc+Ea
         owWRBUEfRiBU6Xdb61tm2POFbTsedUEvq762UUyFIPSgw4Ai806GrFfIg2LWocNkbdjA
         I7Iuzslxd7FHgdA+3G/5G8Sa29rHYDPizBDUJI8uxxtZ2bbkMtXtOt0hr3qvdY4yth5W
         klV5reWJZ/Hyae/+S3a6EQsTOWj1Xb+0XruhmQEU6Bvv4i8Zl4jXna3w8OZC1hD0sRAz
         F36fX0qK4EXTnER2kRePff9NANBusOKL3M8676a9Bs+AJp82G+haKI9S6lB5+6N2IGlH
         LSlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744225919; x=1744830719;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wi3/JxnteRx/5BMoOtb3JvQUUrvrHRfi+TmZ/LdTJGI=;
        b=mOHXfktNC1lb2JI4c23YDZYqGXubHnw4YQSz4W0zHzLywyrW5s5E89rBHvXAs5hsIY
         2k899ogCej4z44xo5i4ts8f9vq+BWLYlIlEI6DIJdEcXEQ2X0Tg3SBVYstGXMyst27tr
         VwEnRlVl1Q/HlCLBHSvZEeUvStDokj28qV2SEJfZMUiE+Z0FZtaJDtZ+wQZRlWqmocDW
         t+ACIBO2v9N3E9yA4mbRgDHDZaCCQxxBAiQVZL3BIPMgY1cMT63yl1ViyU7Zd8SXAIGN
         IGLi2dClUYrXGnFm2P3rdlatMzoBm2gcymcU+JgOn31bpAvXjH/WZ3nX7+7jmfoHz4jK
         imig==
X-Forwarded-Encrypted: i=1; AJvYcCV2+sas/QBNbH2RpMs52dmS9L/1uaohR1UXHZSncXf9852I/+p6M+xxr2W8/C3j7tsD263mWSjRfV6T398=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy25k+kSNUALKPEtj8eS6hhavJ5y7vbV1kOUW+FLfvjh9jpzd3V
	+Ix/O4Ckpnmg6WC3/huGLwDtUXBpo6T/KPnQqudocjeY3xxlx7hnuTdOxbakSkpEiWtKDjwL7Ic
	qle+vu1fVfpJ5D9gm8HdQWtZiMKzpxjg8QVIgzg==
X-Gm-Gg: ASbGncs/T6QdwEbiboVgQyWRf8Wfcfppuf+/R9nZplP2enbjtnA7SMa3cehXcPXRPm+
	BsvHhwE361eAsgZg4Ls2BBhoBvfAL8xBQC8Usyj8Et7a4VE27ItJjwhR2UCymtTyYpZyBeo0ctQ
	9sojsf4WWWRk2WfE4O7rMW6ga8VZxQrGJO4z7+AxLZvO59bzgmU0tiBSg=
X-Google-Smtp-Source: AGHT+IGquHRVV8Iwo0UImEXO1PZ149S8v0mbw+LbHunLj+Ma11Z53jzf53nmAhS3dfI8tSSV0Gz8MnVOHEj4TciTaV4=
X-Received: by 2002:a05:6102:5549:b0:4bb:c24b:b644 with SMTP id
 ada2fe7eead31-4c9d36ad092mr112527137.20.1744225919161; Wed, 09 Apr 2025
 12:11:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409115934.968141886@linuxfoundation.org>
In-Reply-To: <20250409115934.968141886@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 10 Apr 2025 00:41:47 +0530
X-Gm-Features: ATxdqUFkjZ7UUrX4iO9RrF97-ijUSvahOPsHLqjGxDqg8TdQn2H2ls89xcSQVFc
Message-ID: <CA+G9fYtnTU1KAuXnzt29x2CW8bxGcC5MzjNEYXkdwt3Y-G89gw@mail.gmail.com>
Subject: Re: [PATCH 6.14 000/726] 6.14.2-rc4 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, 
	broonie@kernel.org, Juri Lelli <juri.lelli@redhat.com>, 
	Ran Xiaokai <ran.xiaokai@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Apr 2025 at 17:35, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.14.2 release.
> There are 726 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Fri, 11 Apr 2025 11:58:08 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.14.2-rc4.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.14.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Regression on Dragaonboard 845c and Dragonboard 410c the intermittent
failures noticed,

cpuhotplug03 1 TFAIL: No cpuhotplug_do_spin_loop processes found on CPU1

Regression Analysis:
- New regression? Yes
- Reproducibility? Intermittent

Test regression: cpuhotplug03 intermittent failures on Dragonboard
845c and 410c devices

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Links
 - https://lkft.validation.linaro.org/scheduler/job/8211196#L4101
 - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.14.y/build/v6.14.1-727-g2cc38486a844/testrun/27996013/suite/ltp-cpuhotplug/test/cpuhotplug03/log
 - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.14.y/build/v6.14.1-727-g2cc38486a844/testrun/27996013/suite/ltp-cpuhotplug/test/cpuhotplug03/history/
 - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.14.y/build/v6.14.1-727-g2cc38486a844/testrun/27996013/suite/ltp-cpuhotplug/test/cpuhotplug03/details/

## Build
* kernel: 6.14.2-rc4
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
* git commit: 2cc38486a8443cdeaab34c7ece4e5600fe5d7645
* git describe: v6.14.1-727-g2cc38486a844
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.14.y/build/v6.14.1-727-g2cc38486a844

## Test Regressions (compared to v6.14-rc6-492-g8dba5209f1d8)
  * Dragaonboard 845c and Dragonboard 410c
    * ltp-cpuhotplug/cpuhotplug03

## Metric Regressions (compared to v6.14-rc6-492-g8dba5209f1d8)

## Test Fixes (compared to v6.14-rc6-492-g8dba5209f1d8)

## Metric Fixes (compared to v6.14-rc6-492-g8dba5209f1d8)

## Test result summary
total: 103967, pass: 79606, fail: 7152, skip: 16873, xfail: 336

## Build Summary
* arc: 5 total, 5 passed, 0 failed
* arm: 139 total, 136 passed, 3 failed
* arm64: 57 total, 56 passed, 1 failed
* i386: 18 total, 18 passed, 0 failed
* mips: 34 total, 33 passed, 1 failed
* parisc: 4 total, 4 passed, 0 failed
* powerpc: 40 total, 35 passed, 5 failed
* riscv: 25 total, 22 passed, 3 failed
* s390: 22 total, 18 passed, 4 failed
* sh: 5 total, 5 passed, 0 failed
* sparc: 4 total, 3 passed, 1 failed
* x86_64: 49 total, 48 passed, 1 failed

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
* kselftest-rust
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
